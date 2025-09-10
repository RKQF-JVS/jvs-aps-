package cn.bctools.aps.solve.calculate.service.impl;

import cn.bctools.aps.annotation.PlanningDirection;
import cn.bctools.aps.entity.dto.ProcessRouteNodePropertiesDTO;
import cn.bctools.aps.entity.dto.ProcessUseMainResourcesDTO;
import cn.bctools.aps.entity.enums.PlanningDirectionEnum;
import cn.bctools.aps.entity.enums.ProcessRelationshipEnum;
import cn.bctools.aps.solve.calculate.service.TaskTimeService;
import cn.bctools.aps.solve.calculate.service.dto.PendingChangeTaskDTO;
import cn.bctools.aps.solve.model.MainProductionResource;
import cn.bctools.aps.solve.model.ProductionTask;
import cn.bctools.aps.solve.model.SchedulingSolution;
import cn.bctools.aps.solve.model.WorkCalendar;
import cn.bctools.aps.solve.util.DurationUtils;
import cn.bctools.aps.solve.util.TaskCalendarUtils;
import cn.bctools.common.exception.BusinessException;
import cn.bctools.common.utils.ObjectNull;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;
import org.optaplanner.core.api.score.director.ScoreDirector;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * @author jvs
 * 计算任务时间 —— 正排
 * <p>
 * 从计划开始时间开始，往未来安排任务
 */
@PlanningDirection(direction = PlanningDirectionEnum.FORWARD)
@Slf4j
@Service
public class TaskTimeForwardServiceImpl implements TaskTimeService {

    @Override
    public void updateTaskStartTime(ScoreDirector<SchedulingSolution> scoreDirector, MainProductionResource resource, int fromIndex) {
        LocalDateTime beginTime = scoreDirector.getWorkingSolution().getPlanTime();
        List<ProductionTask> allTasks = scoreDirector.getWorkingSolution().getTasks();
        Set<String> historyQueueJobIds = new HashSet<>();
        Queue<PendingChangeTaskDTO> uncheckedSuccessorQueue = new ArrayDeque<>();
        PendingChangeTaskDTO pendingChangeTask = new PendingChangeTaskDTO()
                .setResource(resource)
                .setFromIndex(fromIndex);
        uncheckedSuccessorQueue.add(pendingChangeTask);
        while (!uncheckedSuccessorQueue.isEmpty()) {
            PendingChangeTaskDTO update = uncheckedSuccessorQueue.remove();
            List<ProductionTask> tasks = update.getResource().getTaskList();
            int fromIdx = update.getFromIndex();
            if (ObjectNull.isNull(tasks) || tasks.size() - 1 < fromIdx) {
                continue;
            }
            // 获取当前变更的任务，在当前资源前一个任务的时间
            ProductionTask sourcePreviousTask = getSourcePreviousTask(tasks, fromIdx);
            LocalDateTime sourceTaskPreviousEndTime = fromIdx == 0 ? beginTime : Optional.ofNullable(sourcePreviousTask).map(ProductionTask::getEndTime).orElseGet(() -> beginTime);
            LocalDateTime resourcePreviousEndTime = sourceTaskPreviousEndTime;

            Set<String> notUpdateFrontTaskIds = new HashSet<>();
            for (int idx = fromIdx; idx < tasks.size(); idx++) {
                ProductionTask t = tasks.get(idx);

                historyQueueJobIds.add(t.getId());
                if (t.getPinned()) {
                    resourcePreviousEndTime = t.getEndTime();
                    continue;
                }
                // 改非前置任务的时间
                List<ProductionTask> currentResourcePreviousTasks = tasks.subList(0, idx);
                LocalDateTime startTime = calculateStartTime(update.getResource(), t, sourcePreviousTask, resourcePreviousEndTime, allTasks, currentResourcePreviousTasks);
                if (!notUpdateFrontTaskIds.contains(t.getId())) {
                    scoreDirector.beforeVariableChanged(t, "startTime");
                    t.setStartTime(startTime);
                    scoreDirector.afterVariableChanged(t, "startTime");
                    addChangedTaskIds(t, notUpdateFrontTaskIds);
                    if (ObjectNull.isNotNull(startTime)) {
                        resourcePreviousEndTime = t.getEndTime();
                    }
                    scoreDirector.getWorkingSolution().getTasks()
                            .stream()
                            .filter(j -> ObjectNull.isNull(j.getMergeTaskCode()))
                            .filter(j -> j.getFrontTaskCodes() != null && j.getFrontTaskCodes().contains(t.getCode()))
                            .filter(j -> j.getResource() != null)
                            .forEach(nextJob -> {
                                if (!historyQueueJobIds.contains(nextJob.getId())) {
                                    List<ProductionTask> nextResourceTasks = nextJob.getResource().getTaskList();
                                    int optionalIndex = IntStream.range(0, nextResourceTasks.size()).filter(i -> nextResourceTasks.get(i).getId().equals(nextJob.getId())).findFirst().getAsInt();
                                    PendingChangeTaskDTO updateNextJob = new PendingChangeTaskDTO()
                                            .setResource(nextJob.getResource())
                                            .setFromIndex(optionalIndex);
                                    historyQueueJobIds.add(t.getId());
                                    uncheckedSuccessorQueue.add(updateNextJob);
                                }
                            });
                }
            }
        }
    }

    /**
     * 找到指定下标前面第一个有结束时间的任务
     *
     * @param tasks     任务集合
     * @param fromIndex 下标
     * @return 下标前第一个有结束时间的任务
     */
    private ProductionTask getSourcePreviousTask(List<ProductionTask> tasks, int fromIndex) {
        if (fromIndex == 0) {
            return null;
        }
        ProductionTask previousTask = null;
        for (int i = fromIndex - 1; i >= 0; i--) {
            if (ObjectNull.isNotNull(previousTask)) {
                break;
            }
            ProductionTask task = tasks.get(i);
            if (ObjectNull.isNull(task.getEndTime())) {
                continue;
            }
            previousTask = task;
        }

        return previousTask;
    }

    /**
     * 记录已变更的任务id
     *
     * @param job         任务
     * @param frontJobIds 前置任务id
     */
    private void addChangedTaskIds(ProductionTask job, Set<String> frontJobIds) {
        if (job.getFrontTasks() == null) {
            return;
        }
        ArrayDeque<ProductionTask> frontJobStack = new ArrayDeque<>();
        job.getFrontTasks().forEach(frontJobStack::push);
        while (!frontJobStack.isEmpty()) {
            ProductionTask frontJob = frontJobStack.pop();
            frontJobIds.add(frontJob.getId());
            if (frontJob.getFrontTasks() != null) {
                frontJob.getFrontTasks().forEach(frontJobStack::push);
            }
        }
    }

    /**
     * 计算任务开始时间
     *
     * @param task                    任务
     * @param resourcePreviousTask    当前任务所在资源的前一个任务
     * @param resourcePreviousEndTime 当前任务所在资源的前一个任务的结束时间
     * @param tasks                   所有排程任务
     * @return 任务开始时间
     */
    private LocalDateTime calculateStartTime(MainProductionResource mainProductionResource, ProductionTask task, ProductionTask resourcePreviousTask, LocalDateTime resourcePreviousEndTime, List<ProductionTask> tasks, List<ProductionTask> currentResourcePreviousTasks) {
        Optional<ProcessUseMainResourcesDTO> processUseMainResources = task.getProcess().getUseMainResources()
                .stream()
                .filter(res -> res.getId().equals(mainProductionResource.getId()))
                .findFirst();
        if (!processUseMainResources.isPresent()) {
            return null;
        }


        // 计算任务开始时间
        LocalDateTime startTime = calculateStartTime(task, resourcePreviousTask, resourcePreviousEndTime, tasks, currentResourcePreviousTasks);
        if (ObjectNull.isNull(startTime)) {
            return startTime;
        }
        List<ProductionTask> resourcePinnedTasks = mainProductionResource.getTaskList().stream()
                .filter(ProductionTask::getPinned)
                .toList();
        if (ObjectNull.isNull(resourcePinnedTasks)) {
            return startTime;
        }

        task.setStartTime(startTime);

        Optional<LocalDateTime> maxOverlappingTime = resourcePinnedTasks.stream()
                .filter(t -> t.getEndTime().isAfter(task.getStartTime()) && t.getStartTime().isBefore(task.getEndTime()))
                .map(ProductionTask::getEndTime)
                .max(Comparator.naturalOrder());
        if (maxOverlappingTime.isPresent()) {
            return calculateStartTime(task, resourcePreviousTask, maxOverlappingTime.get(), tasks, currentResourcePreviousTasks);
        }

        return startTime;
     }

    @Override
    public LocalDateTime calculateStartTime(ProductionTask task, ProductionTask resourcePreviousTask, LocalDateTime resourcePreviousEndTime, List<ProductionTask> tasks, List<WorkCalendar> workCalendars, List<ProductionTask> currentResourcePreviousTasks) {
        LocalDateTime earliestStartTime = calculateStartTime(task, resourcePreviousTask, resourcePreviousEndTime, tasks, currentResourcePreviousTasks);
        return TaskCalendarUtils.calculateStartTime(earliestStartTime, workCalendars, PlanningDirectionEnum.FORWARD);
    }

    /**
     * 计算任务开始时间
     *
     * @param task                    任务
     * @param resourcePreviousTask    当前任务所在资源的前一个任务
     * @param resourcePreviousEndTime 当前任务所在资源的前一个任务的结束时间
     * @param tasks                   任务集合
     * @return 任务开始时间
     */
    private LocalDateTime calculateStartTime(ProductionTask task, ProductionTask resourcePreviousTask, LocalDateTime resourcePreviousEndTime, List<ProductionTask> tasks, List<ProductionTask> currentResourcePreviousTasks) {
        // ES关系
        if (task.getStartTask() || ProcessRelationshipEnum.ES.equals(task.getProcess().getProcessRelationship())) {
            return calculateStartTimeEs(task, resourcePreviousTask, resourcePreviousEndTime, tasks, currentResourcePreviousTasks);
        }

        // EE关系
        if (ProcessRelationshipEnum.EE.equals(task.getProcess().getProcessRelationship())) {
            return calculateStartTimeEe(task, resourcePreviousTask, resourcePreviousEndTime, tasks, currentResourcePreviousTasks);
        }
        throw new BusinessException("未设置工序关系");
    }

    /**
     * ES关系预计算任务开始时间: 前工序任务全部完成，才能开始当前工序任务
     *
     * @param task                 当前任务（待计算开始时间的任务）
     * @param resourcePreviousTask 当前任务所在资源的前一个任务
     * @param previousEndTime      当前任务所在资源的前一个任务的结束时间
     * @param tasks 所有排程任务
     * @return 当前任务开始时间
     */
    private LocalDateTime calculateStartTimeEs(ProductionTask task, ProductionTask resourcePreviousTask, LocalDateTime previousEndTime, List<ProductionTask> tasks, List<ProductionTask> currentResourcePreviousTasks) {
        // 获取执行当前任务之前的结束时间最晚的任务
        PreTask preTask = getPreTask(task, resourcePreviousTask, previousEndTime, tasks);

        // 计算开始时间
        return calculateEarliestStartTimeWithPreInterval(task, currentResourcePreviousTasks, preTask.getEarliestStartTime());
    }

    /**
     * EE关系预计算任务开始时间: 当前任务不需要等前工序任务完成，就可以开始
     *
     * @param task                 当前任务（待计算开始时间的任务）
     * @param resourcePreviousTask 当前任务所在资源的前一个任务
     * @param previousEndTime      当前任务所在资源的前一个任务的结束时间
     * @param tasks 所有排程任务
     * @return 当前任务开始时间
     */
    private LocalDateTime calculateStartTimeEe(ProductionTask task, ProductionTask resourcePreviousTask, LocalDateTime previousEndTime, List<ProductionTask> tasks, List<ProductionTask> currentResourcePreviousTasks) {
        // 获取执行当前任务之前的结束时间最晚的任务
        PreTask preTask = getPreTask(task, resourcePreviousTask, previousEndTime, tasks);
        // 当前任务最早开始时间
        LocalDateTime earliestStartTime = null;
        // 任务最早开始时间所属任务，不是当前任务的前工序任务，计算任务最早开始时间
        if (ObjectNull.isNull(preTask.getEarliestStartTimeInProcessTask())) {
            earliestStartTime = calculateEarliestStartTimeWithPreInterval(task, currentResourcePreviousTasks, preTask.getEarliestStartTime());
        } else {
            // 任务最早开始时间所属任务，是当前任务的前工序任务，计算任务最早开始时间
            ProductionTask frontTask = preTask.getEarliestStartTimeInProcessTask();
            Duration preTaskDuration = Duration.between(frontTask.getStartTime(), frontTask.getEndTime());
            Duration taskDuration = task.calculateTaskDuration();
            if (taskDuration == null) {
                return null;
            }
            // 前短后长
            if (preTaskDuration.compareTo(taskDuration) < 0) {
                earliestStartTime = frontTask.getStartTime().plus(DurationUtils.convertDuration(task.getProcess().getBufferTime()));
            } else {
                // 前长后短
                LocalDateTime taskEndTime = frontTask.getEndTime().plus(DurationUtils.convertDuration(task.getProcess().getBufferTime()));
                earliestStartTime = taskEndTime.minus(taskDuration);
                earliestStartTime = frontTask.getStartTime().isBefore(earliestStartTime) ? earliestStartTime : preTask.getEarliestStartTime();
            }

        }

        // 计算开始时间
        earliestStartTime = calculateEarliestStartTimeWithPreInterval(task, currentResourcePreviousTasks, earliestStartTime);
        return earliestStartTime;
    }


    /**
     * 获取执行当前任务之前的结束时间最晚的任务
     *
     * @param task                 当前任务（待计算开始时间的任务）
     * @param resourcePreviousTask 当前任务所在资源的前一个任务
     * @param previousEndTime      当前任务所在资源的前一个任务的结束时间
     * @param tasks 所有排程任务
     * @return 当前任务开始时间
     */
    private PreTask getPreTask(ProductionTask task, ProductionTask resourcePreviousTask, LocalDateTime previousEndTime, List<ProductionTask> tasks) {
        // 当前任务最早开始时间
        LocalDateTime earliestStartTime = null;
        // 任务最早开始时间所属前工序任务
        ProductionTask earliestStartTimeInProcessTask = null;
        // 没有前置任务
        if (ObjectNull.isNull(task.getFrontTaskCodes())) {
            earliestStartTime = previousEndTime;
        } else {
            // 有前置任务
            List<ProductionTask> frontProductionTasks = tasks.stream()
                    .filter(job -> task.getFrontTaskCodes().contains(job.getCode()))
                    .toList();
            Optional<ProductionTask> optionalProductionTask = frontProductionTasks.stream()
                    .filter(job -> ObjectNull.isNotNull(job.getStartTime()))
                    .filter(job -> ObjectNull.isNotNull(job.getEndTime()))
                    .max(Comparator.comparing(job -> calculateEarliestStartTimeAfterCompletion(job, job.getEndTime())));
            if (optionalProductionTask.isPresent()) {
                // 最晚结束时间的前工序任务
                ProductionTask previousProcessTask = optionalProductionTask.get();
                // 前置任务未分配，则直接返回
                if (ObjectNull.isNotNull(previousProcessTask.getEndTime())) {
                    LocalDateTime frontMaxEarliestStartTime = calculateEarliestStartTimeAfterCompletion(previousProcessTask, previousProcessTask.getEndTime());
                    LocalDateTime taskInResourceEarliestStartTime = previousEndTime;
                    if (ObjectNull.isNotNull(resourcePreviousTask) && task.getFrontTaskCodes().contains(resourcePreviousTask.getCode()) && !task.getStartTask()) {
                        taskInResourceEarliestStartTime = calculateEarliestStartTimeAfterCompletion(resourcePreviousTask, previousEndTime);
                    }
                    if (frontMaxEarliestStartTime.isAfter(taskInResourceEarliestStartTime)) {
                        earliestStartTime = frontMaxEarliestStartTime;
                        earliestStartTimeInProcessTask = task.getStartTask() ? null : previousProcessTask;
                    } else {
                        earliestStartTime = taskInResourceEarliestStartTime;
                    }
                }
            }
        }
        return new PreTask()
                .setEarliestStartTime(earliestStartTime)
                .setEarliestStartTimeInProcessTask(earliestStartTimeInProcessTask);
    }

    /**
     * 计算任务可能的最早开始时间.
     * 基于前一个任务的结束时间加上配置的后间隔时间
     *
     * @param preTask         前置任务
     * @param previousEndTime 前置任务最大结束时间
     * @return 当前任务可能的最早开始时间
     */
    private LocalDateTime calculateEarliestStartTimeAfterCompletion(ProductionTask preTask, LocalDateTime previousEndTime) {
        if (ObjectNull.isNull(preTask)) {
            return previousEndTime;
        }
        LocalDateTime startTime = previousEndTime;

        // 根据工序配置计算当前任务可能的最早开始时间
        ProcessRouteNodePropertiesDTO process = preTask.getProcess();
        // 加上前置任务的后间隔时长
        Duration duration = DurationUtils.convertDuration(process.getPostIntervalDuration());
        if (ObjectNull.isNotNull(duration)) {
            startTime = startTime.plus(duration);
        }
        return startTime;
    }


    /**
     * 计算任务最早开始时间
     * 基于任务的最早可开始时间加上当前任务的前间隔时间
     *
     * @param task              当前任务
     * @param earliestStartTime 当前任务可能的最早开始时间
     * @return 任务最早开始时间
     */
    private LocalDateTime calculateEarliestStartTimeWithPreInterval(ProductionTask task, List<ProductionTask> currentResourcePreviousTasks, LocalDateTime earliestStartTime) {
        if (ObjectNull.isNull(task)) {
            return earliestStartTime;
        }
        if (ObjectNull.isNull(earliestStartTime)) {
            return earliestStartTime;
        }

        LocalDateTime startTime = earliestStartTime;
        // 根据工序配置计算当前任务可能的最早开始时间
        ProcessRouteNodePropertiesDTO process = task.getProcess();

        // 加上前置任务的后间隔时长
        Duration duration = DurationUtils.convertDuration(process.getPreIntervalDuration());
        if (ObjectNull.isNotNull(duration)) {
            startTime = startTime.plus(duration);
        }

        // 加上最大等待物料齐套时长
        if (ObjectNull.isNotNull(task.getMaterialDelayMap())) {
            Set<String> previousMaterialIds = currentResourcePreviousTasks.stream()
                    .filter(t -> ObjectNull.isNotNull(t.getMaterialDelayMap()))
                    .map(t -> t.getMaterialDelayMap().keySet())
                    .flatMap(Collection::stream)
                    .collect(Collectors.toSet());
            Optional<Duration> maxDelayTimeOptional = task.getMaterialDelayMap().entrySet().stream()
                    .filter(material -> !previousMaterialIds.contains(material.getKey()))
                    .map(Map.Entry::getValue)
                    .max(Comparator.naturalOrder());
            if (maxDelayTimeOptional.isPresent()) {
                startTime = startTime.plus(maxDelayTimeOptional.get());
            }
        }
        return startTime;
    }


    @Data
    @Accessors(chain = true)
    public static class PreTask {
        // 当前任务最早开始时间
        private LocalDateTime earliestStartTime;
        // 任务最早开始时间所属前工序任务
        private ProductionTask earliestStartTimeInProcessTask;
    }
}
