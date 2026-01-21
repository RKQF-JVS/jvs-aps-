package cn.bctools.aps.solve.util;

import cn.bctools.aps.entity.dto.ProcessRouteNodePropertiesDTO;
import cn.bctools.aps.entity.enums.MaterialSourceEnum;
import cn.bctools.aps.entity.enums.OrderSchedulingStatusEnum;
import cn.bctools.aps.graph.Graph;
import cn.bctools.aps.graph.GraphNode;
import cn.bctools.aps.graph.GraphUtils;
import cn.bctools.aps.graph.Topological;
import cn.bctools.aps.solve.model.*;
import cn.bctools.aps.util.PlanUtils;
import cn.bctools.common.utils.ObjectNull;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import lombok.Data;

import java.math.BigDecimal;
import java.time.Duration;
import java.util.*;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * @author jvs
 * 生产任务工具
 */
public class ProductionTaskUtils {

    private ProductionTaskUtils() {
    }

    /**
     * 生成生产制造任务
     *
     * @param order                    订单
     * @param mrpMaterialGraph         生产订单商品欠料物料关系图
     * @param pinnedProductionTaskList 已锁定的任务集合
     * @return 生产制造订单商品的制造任务集合
     */
    public static List<ProductionTask> generateTask(ProductionOrder order, BasicData basicData, Graph<MrpMaterial> mrpMaterialGraph, List<ProductionTask> pinnedProductionTaskList) {
        if (GraphUtils.isEmpty(mrpMaterialGraph)) {
            return Collections.emptyList();
        }
        // 生成制造任务
        List<ProductionTask> taskList = generateTask(order, basicData, mrpMaterialGraph);
        // 处理已锁定的任务（已锁定的任务可能与新的任务有关系，所以需要处理）
        ProductionTaskMatcherUtils.pinnedTaskHandler(taskList, pinnedProductionTaskList);
        return taskList;
    }

    /**
     * 生成生产制造任务
     * <p>
     * 根据缺料物料依赖图，从最底层的物料开始生成生产任务；
     * 若有非制造的物料，则计算得到最大提前时间作为生产目标订单最开始的任务的延迟时间（提前期+缓冲期）
     *
     * @param order            订单
     * @param mrpMaterialGraph 生产订单商品所需物料需求清单
     * @return 生产制造订单商品的制造任务集合
     */
    private static List<ProductionTask> generateTask(ProductionOrder order, BasicData basicData, Graph<MrpMaterial> mrpMaterialGraph) {
        // 物料生产任务
        List<ProductionTask> tasks = new ArrayList<>();
        Map<String, MrpMaterialTask> mrpMaterialTaskMap = new HashMap<>();
        Map<String, Material> materialMap = basicData.getMaterialMap();
        Map<String, Graph<ProcessRouteNodePropertiesDTO>> processRouteMap = basicData.getProcessRouteMap();
        // 计算所有欠料物料延迟时间
        Map<String, Duration> materialDelayMap = getMaterialDelayMap(mrpMaterialGraph, materialMap);

        // 物料生产计划函数
        Function<Topological, List<ProductionTask>> materialTaskFunction = topological -> {
            String materialNodeId = topological.getNodeId();
            // 生成任务
            MrpMaterial mrpMaterial = mrpMaterialGraph.getNode(materialNodeId).getData();
            String materialId = mrpMaterial.getId();
            Material material = materialMap.get(materialId);
            Graph<ProcessRouteNodePropertiesDTO> processRoute = processRouteMap.get(materialId);
            MrpMaterialTask mrpMaterialTask = new MrpMaterialTask();
            // 制造类物料，生成对应的生产任务
            List<ProductionTask> taskList = null;
            if (MaterialSourceEnum.PRODUCED.equals(material.getSource())) {
                ProductionOrder childOrder = null;
                if (!order.getMaterialId().equals(materialId)) {
                    String materialChainFromCode = getUpstreamMaterialChainFromCode(materialNodeId, mrpMaterialGraph, materialMap);
                    childOrder = createChildOrder(order, materialChainFromCode, material, mrpMaterial.getQuantity());
                }
                taskList = createTaskFromProcessRoute(order, childOrder, material, mrpMaterial.getQuantity(), processRoute);
                if (ObjectNull.isNull(taskList)) {
                    return null;
                }
                mrpMaterialTask.setTaskList(taskList);
                // 获取前置物料任务的最后一道任务
                Set<String> fromIds = mrpMaterialGraph.getNodeFromIds(materialNodeId);
                if (ObjectNull.isNotNull(fromIds)) {
                    List<ProductionTask> notHaveFrontTaskList = mrpMaterialTask.getNotHaveFrontTasks();
                    notHaveFrontTaskList.forEach(task -> {
                        fromIds.stream()
                                .filter(mrpMaterialTaskMap::containsKey)
                                .forEach(fromId -> {
                                    MrpMaterialTask frontMrpMaterialTask = mrpMaterialTaskMap.get(fromId);
                                    ProductionTask frontMrpMaterialLastTask = frontMrpMaterialTask.getEndTask();
                                    task.addFrontTask(frontMrpMaterialLastTask);
                                    frontMrpMaterialLastTask.addNextTask(task);
                                });
                    });
                }
                mrpMaterialTaskMap.put(materialNodeId, mrpMaterialTask);
            }
            return taskList;
        };

        // 物料任务结果处理函数
        Consumer<List<List<ProductionTask>>> consumer = materialTasks -> materialTasks.stream()
                .filter(ObjectNull::isNotNull)
                .forEach(tasks::addAll);
        // 按顺序获取物料生产任务
        GraphUtils.topologicalSort(mrpMaterialGraph, materialTaskFunction, consumer);

        tasks.forEach(task -> {
            if (task.getStartTask() && ObjectNull.isNull(task.getFrontTaskCodes())) {
                task.setMaterialDelayMap(materialDelayMap);
            }
        });
        return tasks;
    }

    /**
     * 计算所有欠料物料延迟时间
     *
     * @param mrpMaterialGraph 生产订单商品所需物料需求清单
     * @param materialMap      物料
     * @return Map<物料id, 延迟时长>
     */
    private static Map<String, Duration> getMaterialDelayMap(Graph<MrpMaterial> mrpMaterialGraph, Map<String, Material> materialMap) {
        return mrpMaterialGraph.getNodes().stream()
                .map(node -> {
                    MrpMaterial mrpMaterial = mrpMaterialGraph.getNode(node.getId()).getData();
                    String materialId = mrpMaterial.getId();
                    return materialMap.get(materialId);
                })
                .filter(material -> MaterialSourceEnum.PURCHASED.equals(material.getSource()))
                .collect(Collectors.toMap(Material::getId, material -> {
                    Duration leadTimeDuration = material.getLeadTimeDuration();
                    Duration bufferTimeDuration = material.getBufferTimeDuration();
                    return leadTimeDuration.plus(bufferTimeDuration);
                },(oldVal, newVal) -> newVal));
    }


    /**
     * 创建子订单
     *
     * @param order                 主订单
     * @param materialChainFromCode 上游物料链
     * @param material              子订单生产物料
     * @param quantity              子订单生产物料数量
     * @return 子订单
     */
    private static ProductionOrder createChildOrder(ProductionOrder order, String materialChainFromCode, Material material, BigDecimal quantity) {
        return new ProductionOrder()
                .setId(IdWorker.getIdStr())
                .setCode(order.getCode() + "-" + materialChainFromCode)
                .setMaterialId(material.getId())
                .setMaterialCode(material.getCode())
                .setQuantity(quantity)
                .setDeliveryTime(order.getDeliveryTime())
                .setPriority(order.getPriority())
                .setSequence(order.getSequence())
                .setColor(order.getColor())
                .setSchedulingStatus(OrderSchedulingStatusEnum.SCHEDULED)
                .setSupplement(true)
                .setParentOrderCode(order.getCode());
    }

    /**
     * 根据工艺路线创建生产任务
     *
     * @param mainOrder         主订单
     * @param order             订单
     * @param material          主产物
     * @param quantity          生产数量
     * @param processRouteGraph 工艺路线
     * @return 生产任务
     */
    private static List<ProductionTask> createTaskFromProcessRoute(ProductionOrder mainOrder,
                                                                   ProductionOrder order,
                                                                   Material material,
                                                                   BigDecimal quantity,
                                                                   Graph<ProcessRouteNodePropertiesDTO> processRouteGraph) {
        if (GraphUtils.isEmpty(processRouteGraph)) {
            return Collections.emptyList();
        }
        ProductionOrder taskOrder = Optional.ofNullable(order).orElse(mainOrder);
        // 获取最终的工序节点id
        String endProcessNodeId = GraphUtils.getNoOutDegreeNodeIds(processRouteGraph).get(0);
        // Map<工序节点id, 工序生产任务>
        Map<String, ProductionTask> processTaskMap = processRouteGraph.getNodes().stream()
                .collect(Collectors.toMap(GraphNode::getId, node ->
                        new ProductionTask()
                                .setId(IdWorker.getIdStr())
                                .setCode(generateTaskCode(taskOrder, node.getData()))
                                .setMergeTask(false)
                                .setMainOrderId(mainOrder.getId())
                                .setOrder(taskOrder)
                                .setMaterial(material)
                                .setProcess(node.getData())
                                .setQuantity(quantity)
                                .setPinned(false)
                                .setEndTask(node.getId().equals(endProcessNodeId))
                                .setSupplement(ObjectNull.isNotNull(order))
                                .setInputMaterials(PlanUtils.getInputMaterial(quantity, node.getData()))
                ));


        // 工艺路线生产任务
        List<ProductionTask> processRouteTasks = new ArrayList<>();
        // 工序任务函数
        Function<Topological, ProductionTask> taskFunction = topological -> {
            String routeNodeId = topological.getNodeId();
            ProductionTask task = processTaskMap.get(routeNodeId);
            // 此任务是否是工序任务链中的首道任务 true-是， false-不是
            Boolean isStartTask = Boolean.FALSE;
            Set<String> fromIds = processRouteGraph.getNodeFromIds(routeNodeId);
            if (ObjectNull.isNotNull(fromIds)) {
                fromIds.forEach(nodeFormId -> task.addFrontTask(processTaskMap.get(nodeFormId)));
            } else {
                isStartTask = Boolean.TRUE;
            }
            Set<String> toIds = processRouteGraph.getNodeToIds(routeNodeId);
            if (ObjectNull.isNotNull(toIds)) {
                toIds.forEach(nodeFormId -> task.addNextTask(processTaskMap.get(nodeFormId)));
            }
            task.setStartTask(isStartTask);
            return task;
        };
        // 工序任务结果处理函数
        Consumer<List<ProductionTask>> consumer = processRouteTasks::addAll;
        // 按工艺路线顺序设置任务
        GraphUtils.topologicalSort(processRouteGraph, taskFunction, consumer);
        return processRouteTasks;
    }


    /**
     * 获取指定物料的上游物料链，并按顺序拼装物料编码字符串
     * <p>
     * 如：A -> B -> C -> D
     * 获取B的上游物料链，结果为：C-D
     *
     * @param nodeId      物料节点id
     * @param graph       生产订单商品欠料物料关系图
     * @param materialMap 物料集合
     * @return 上游物料链，按顺序拼装的物料编码字符串
     */
    private static String getUpstreamMaterialChainFromCode(String nodeId, Graph<MrpMaterial> graph, Map<String, Material> materialMap) {
        StringBuilder materialCodeChainBuilder = new StringBuilder();

        Queue<String> queue = new ArrayDeque<>();
        queue.offer(nodeId);

        while (!queue.isEmpty()) {
            String fromId = queue.poll();
            String materialId = graph.getNode(fromId).getData().getId();
            Set<String> toIds = graph.getNodeToIds(fromId);
            if (ObjectNull.isNull(toIds)) {
                continue;
            }
            materialCodeChainBuilder.append(materialMap.get(materialId).getCode()).append("-");
            toIds.forEach(queue::offer);
        }
        String materialCodeChain = materialCodeChainBuilder.toString();
        if (materialCodeChain.endsWith("-")) {
            materialCodeChain = materialCodeChain.substring(0, materialCodeChain.length() - 1);
        }
        return materialCodeChain;
    }

    /**
     * 生成生产任务编码
     * <p>
     * 租户级唯一
     *
     * @param order             订单
     * @param processProperties 工序
     * @return 任务编码
     */
    private static String generateTaskCode(ProductionOrder order, ProcessRouteNodePropertiesDTO processProperties) {
        return order.getCode() + "-" + processProperties.getCode();
    }


    @Data
    static class MrpMaterialTask {
        /**
         * 生产任务集合。 制造类物料可能有生产任务集合
         */
        private List<ProductionTask> taskList;

        /**
         * 获取没有前置任务的任务
         *
         * @return 没有前置任务的任务
         */
        public List<ProductionTask> getNotHaveFrontTasks() {
            if (ObjectNull.isNull(taskList)) {
                return Collections.emptyList();
            }
            return taskList.stream()
                    .filter(task -> ObjectNull.isNull(task.getFrontTaskCodes()))
                    .collect(Collectors.toList());
        }

        /**
         * 获取结束任务
         *
         * @return 没有后置任务的任务
         */
        public ProductionTask getEndTask() {
            if (ObjectNull.isNull(taskList)) {
                return null;
            }
            return taskList.stream()
                    .filter(ProductionTask::getEndTask)
                    .findFirst()
                    .orElse(null);
        }
    }


}
