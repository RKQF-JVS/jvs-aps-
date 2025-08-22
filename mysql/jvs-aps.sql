create database `jvs-aps` default character set utf8mb4 collate utf8mb4_general_ci;
use jvs-aps;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jvs_incoming_material_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_incoming_material_order`;
CREATE TABLE `jvs_incoming_material_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `material_code` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '数量',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '预计到货时间',
  `order_status` enum('PROCESSING','CLOSED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '来料订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_manufacture_bom
-- ----------------------------
DROP TABLE IF EXISTS `jvs_manufacture_bom`;
CREATE TABLE `jvs_manufacture_bom`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id',
  `child_materials` json NULL COMMENT '子件物料',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '制造BOM' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_material
-- ----------------------------
DROP TABLE IF EXISTS `jvs_material`;
CREATE TABLE `jvs_material`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `type` enum('RAW_MATERIAL','SEMI_FINISHED','FINISHED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `source` enum('PRODUCED','PURCHASED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '库存',
  `safety_stock` decimal(18, 6) NULL DEFAULT NULL COMMENT '安全库存',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计量单位',
  `lead_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提前期',
  `buffer_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缓冲期',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code_tenant_id`(`code` ASC, `tenant_id` ASC) USING BTREE COMMENT '物料编码租户级唯一',
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_plan_info
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_info`;
CREATE TABLE `jvs_plan_info`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `schedule_start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `earliest_task_start_time` datetime NULL DEFAULT NULL COMMENT '任务最早开始时间',
  `last_task_assignment_time` datetime NULL DEFAULT NULL COMMENT '最近任务派工截止时间',
  `plan_status` enum('CONFIRMED','UNCONFIRMED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划状态',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_plan_report_field_setting
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_report_field_setting`;
CREATE TABLE `jvs_plan_report_field_setting`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `report_type` enum('PLAN_RESOURCE_TASK_GANTT','PLAN_ORDER_TASK_GANTT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告类型',
  `task_bar_fields` json NULL COMMENT '任务条显示字段',
  `tooltip_fields` json NULL COMMENT '任务条提示框显示字段',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务可视化字段设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_plan_task
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task`;
CREATE TABLE `jvs_plan_task`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `merge_task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合并任务的编码',
  `origin_task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源任务编码（拆分后的子任务记录来源任务编码）',
  `main_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主生产订单id。指向：jvs_plan_task_order.order_id',
  `production_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属生产订单id。指向：jvs_plan_task_order.order_id',
  `scheduled_quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '主产物计划生产数量',
  `process_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序编码',
  `process_info` json NULL COMMENT '工序信息',
  `front_task_codes` json NULL COMMENT '前置任务编码集合',
  `next_task_codes` json NULL COMMENT '后置任务编码集合',
  `main_resource_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主资源id。指向：jvs_production_resource.id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '计划完成时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料信息',
  `task_status` enum('PENDING','PARTIALLY_COMPLETED','COMPLETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `last_completion_time` datetime NULL DEFAULT NULL COMMENT '最近一次报工完成时间',
  `quantity_completed` decimal(18, 6) NULL DEFAULT NULL COMMENT '已完成数量',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_code`(`code` ASC) USING BTREE,
  INDEX `idx_order_id`(`production_order_id` ASC) USING BTREE,
  INDEX `idx_status`(`task_status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_plan_task_adjust
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task_adjust`;
CREATE TABLE `jvs_plan_task_adjust`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `merge_task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合并任务的编码',
  `origin_task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源任务编码（拆分后的子任务记录来源任务编码）',
  `main_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主生产订单id。指向：jvs_plan_task_order.order_id',
  `production_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属生产订单id。指向：jvs_plan_task_order.order_id',
  `scheduled_quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '主产物计划生产数量',
  `process_info` json NULL COMMENT '工序信息',
  `front_task_codes` json NULL COMMENT '前置任务编码集合',
  `next_task_codes` json NULL COMMENT '后置任务编码集合',
  `main_resource_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主资源id。指向：jvs_production_resource.id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '计划完成时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料信息',
  `task_status` enum('PENDING','PARTIALLY_COMPLETED','COMPLETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `discard` tinyint(1) NULL DEFAULT NULL COMMENT '是否丢弃',
  `compliant` tinyint(1) NULL DEFAULT NULL COMMENT '任务是否合规',
  `last_completion_time` datetime NULL DEFAULT NULL COMMENT '最近一次报工完成时间',
  `quantity_completed` decimal(18, 6) NULL DEFAULT NULL COMMENT '已完成数量',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_code`(`code` ASC) USING BTREE,
  INDEX `idx_origin_task_code`(`origin_task_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待处理的任务调整信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_plan_task_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task_order`;
CREATE TABLE `jvs_plan_task_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单id。指向：jvs_production_order.id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单编码',
  `delay_time_string` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单延期时长',
  `order_info` json NULL COMMENT '生产订单信息',
  `order_material_info` json NULL COMMENT '生产订单主产物信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_id`(`order_id` ASC) USING BTREE,
  UNIQUE INDEX `uk_order_code`(`order_code` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划任务冗余订单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_plan_task_order_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task_order_pending`;
CREATE TABLE `jvs_plan_task_order_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单id。指向：jvs_production_order.id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单编码',
  `delay_time_string` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单延期时长',
  `order_info` json NULL COMMENT '生产订单信息',
  `order_material_info` json NULL COMMENT '生产订单主产物信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认排产计划订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_plan_task_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task_pending`;
CREATE TABLE `jvs_plan_task_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `merge_task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合并任务的编号',
  `origin_task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源任务编码（拆分后的子任务记录来源任务编码）',
  `main_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主生产订单id。指向：jvs_plan_task_order_pending.order_id',
  `production_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属生产订单id。指向：jvs_plan_task_order_pending.order_id',
  `scheduled_quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '主产物计划生产数量',
  `process_info` json NULL COMMENT '工序信息',
  `front_task_codes` json NULL COMMENT '前置任务编码集合',
  `next_task_codes` json NULL COMMENT '后置任务编码集合',
  `main_resource_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主资源id。指向：jvs_production_resource.id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '计划完成时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认排产计划任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_planning_strategy
-- ----------------------------
DROP TABLE IF EXISTS `jvs_planning_strategy`;
CREATE TABLE `jvs_planning_strategy`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '策略名称',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `active` tinyint(1) NULL DEFAULT NULL COMMENT '0-无效，1-有效',
  `config` json NULL COMMENT '策略配置',
  `order_scheduling_rules` json NULL COMMENT '排产规则',
  `optimize_rules` json NULL COMMENT '优化规则',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划策略' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_process
-- ----------------------------
DROP TABLE IF EXISTS `jvs_process`;
CREATE TABLE `jvs_process`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `pre_interval_duration` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前间隔时长',
  `post_interval_duration` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后间隔时长',
  `process_relationship` enum('ES','EE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序关系',
  `buffer_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关系为EE时的缓冲时长',
  `batch_strategy` json NULL COMMENT '批量策略',
  `use_main_resources` json NULL COMMENT '可用的主资源集合',
  `use_auxiliary_resources` json NULL COMMENT '可用的辅助资源集合',
  `use_materials` json NULL COMMENT '使用的物料',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工艺' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_process_route
-- ----------------------------
DROP TABLE IF EXISTS `jvs_process_route`;
CREATE TABLE `jvs_process_route`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id。指向：jvs_material.id',
  `route_design` json NULL COMMENT '工艺路线设计',
  `enabled` tinyint(1) NULL DEFAULT NULL COMMENT '0-未启用，1-启用',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工艺路线' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_production_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_production_order`;
CREATE TABLE `jvs_production_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `material_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '需求交付时间',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `sequence` decimal(18, 6) NULL DEFAULT NULL COMMENT '序号',
  `type` enum('MANUFACTURE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型',
  `order_status` enum('PENDING','COMPLETED','CANCELLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `scheduling_status` enum('UNSCHEDULED','SCHEDULED','COMPLETED','NO_SCHEDULED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排产状态',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `can_schedule` tinyint(1) NULL DEFAULT 1 COMMENT '是否参与排产。0-否，1-是',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否为补充生产订单。0-否，1-是',
  `parent_order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父订单编码（如果是补充订单，则指向其是那个订单的补充订单',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `uk_code`(`code` ASC) USING BTREE,
  INDEX `idx_parent_code`(`parent_order_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_production_resource
-- ----------------------------
DROP TABLE IF EXISTS `jvs_production_resource`;
CREATE TABLE `jvs_production_resource`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `resource_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源组',
  `capacity` decimal(18, 6) NULL DEFAULT NULL COMMENT '容量',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容量计量单位',
  `throughput` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产能',
  `resource_status` enum('NORMAL','MAINTENANCE','SCRAPPED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源状态',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主生产资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_resource_calendar
-- ----------------------------
DROP TABLE IF EXISTS `jvs_resource_calendar`;
CREATE TABLE `jvs_resource_calendar`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `work_calendar_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作日历id。指向：jvs_work_calendar.id',
  `production_resource_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源id。指向：jvs_production_resource.id',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_work_calendar_id`(`work_calendar_id` ASC) USING BTREE,
  INDEX `idx_production_resource_id`(`production_resource_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源_日历关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_work_calendar
-- ----------------------------
DROP TABLE IF EXISTS `jvs_work_calendar`;
CREATE TABLE `jvs_work_calendar`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `work_mode_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作模式id。指向：jvs_work_mode.id',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '起始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '截止时间',
  `enabled` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用 0-未启用，1-启用',
  `work_days` bit(7) NULL DEFAULT NULL COMMENT '工作日设置',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作日历' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_work_mode
-- ----------------------------
DROP TABLE IF EXISTS `jvs_work_mode`;
CREATE TABLE `jvs_work_mode`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `working_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作模式',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作模式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jvs_work_report
-- ----------------------------
DROP TABLE IF EXISTS `jvs_work_report`;
CREATE TABLE `jvs_work_report`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `report_time` datetime NULL DEFAULT NULL COMMENT '报工时间',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `order_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `material_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品编码',
  `process_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序编码',
  `plan_resource_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划主资源编码',
  `plan_resource_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划主资源id',
  `plan_start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `plan_end_time` datetime NULL DEFAULT NULL COMMENT '计划结束时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '实际开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '实际完成时间',
  `quantity_completed` decimal(18, 6) NULL DEFAULT NULL COMMENT '完成数量',
  `resource_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际主资源编码',
  `resource_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际主资源id',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_order_code`(`order_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报工记录' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
