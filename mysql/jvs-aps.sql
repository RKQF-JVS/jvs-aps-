/*
 Navicat Premium Data Transfer

 Source Server         : 161
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : 10.0.0.161:3306
 Source Schema         : jvs-aps

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 22/08/2025 20:18:03
*/
create database `jvs-aps` default character set utf8mb4 collate utf8mb4_general_ci;
use `jvs-aps`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jvs_attribute
-- ----------------------------
DROP TABLE IF EXISTS `jvs_attribute`;
CREATE TABLE `jvs_attribute`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `attribute_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性名',
  `attribute_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性key',
  `type` enum('input','inputNumber','radio','checkbox','select') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性类型',
  `design` json NULL COMMENT '属性配置',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自定义属性' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_auxiliary_resource
-- ----------------------------
DROP TABLE IF EXISTS `jvs_auxiliary_resource`;
CREATE TABLE `jvs_auxiliary_resource`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `quantity` int NULL DEFAULT NULL COMMENT '数量',
  `setup_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装时长',
  `teardown_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拆卸时长',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '辅助资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_auxiliary_resource
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_business_attribute
-- ----------------------------
DROP TABLE IF EXISTS `jvs_business_attribute`;
CREATE TABLE `jvs_business_attribute`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `business_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务数据id',
  `business_type` enum('MATERIAL','PROCESS','PROCESS_ROUTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `attribute_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '映射属性id',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_attribute_id`(`attribute_id` ASC) USING BTREE,
  INDEX `idx_business_id`(`business_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务属性映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_business_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_business_version
-- ----------------------------
DROP TABLE IF EXISTS `jvs_business_version`;
CREATE TABLE `jvs_business_version`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `business_type` enum('FORECAST','PICKUP_REQUEST','SHIPPING_PLAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `version` bigint NULL DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_business_type`(`business_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务版本' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_business_version
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_capacity_pre_plan_task
-- ----------------------------
DROP TABLE IF EXISTS `jvs_capacity_pre_plan_task`;
CREATE TABLE `jvs_capacity_pre_plan_task`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
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
  `changeover_time` datetime NULL DEFAULT NULL COMMENT '换型截止时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料信息',
  `use_auxiliary_resources` json NULL COMMENT '分配的辅资源',
  `total_work_time` bigint NULL DEFAULT NULL COMMENT '计划总工时(秒)',
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
  INDEX `idx_status`(`task_status` ASC) USING BTREE,
  INDEX `idx_plan_type`(`plan_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产能预排任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_capacity_pre_plan_task
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_capacity_pre_plan_task_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_capacity_pre_plan_task_order`;
CREATE TABLE `jvs_capacity_pre_plan_task_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单id。指向：jvs_production_order.id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单编码',
  `order_info` json NULL COMMENT '生产订单信息',
  `order_material_info` json NULL COMMENT '生产订单主产物信息',
  `scheduling_status` enum('UNSCHEDULED','SCHEDULED','COMPLETED','NO_SCHEDULED','PARTIAL_TASK_SCHEDULED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单排产状态',
  `parent_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父订单id（如果是补充订单，则指向其是那个订单的补充订单',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_id`(`plan_type` ASC, `order_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产能预排任务冗余订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_capacity_pre_plan_task_order
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_capacity_pre_plan_task_order_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_capacity_pre_plan_task_order_pending`;
CREATE TABLE `jvs_capacity_pre_plan_task_order_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单id。指向：jvs_production_order.id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单编码',
  `order_info` json NULL COMMENT '生产订单信息',
  `order_material_info` json NULL COMMENT '生产订单主产物信息',
  `scheduling_status` enum('UNSCHEDULED','SCHEDULED','COMPLETED','NO_SCHEDULED','PARTIAL_TASK_SCHEDULED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单排产状态',
  `parent_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父订单id（如果是补充订单，则指向其是那个订单的补充订单',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_id`(`plan_type` ASC, `order_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认产能预排订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_capacity_pre_plan_task_order_pending
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_capacity_pre_plan_task_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_capacity_pre_plan_task_pending`;
CREATE TABLE `jvs_capacity_pre_plan_task_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
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
  `changeover_time` datetime NULL DEFAULT NULL COMMENT '换型截止时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料',
  `use_auxiliary_resources` json NULL COMMENT '分配的辅资源',
  `total_work_time` bigint NULL DEFAULT NULL COMMENT '计划总工时(秒)',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_plan_type`(`plan_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认产能预排任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_capacity_pre_plan_task_pending
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_customer
-- ----------------------------
DROP TABLE IF EXISTS `jvs_customer`;
CREATE TABLE `jvs_customer`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `unique_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户唯一标识',
  `logistics_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流时长',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `uk_unique_id`(`unique_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '辅助资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_customer
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_estimated_delivery_time
-- ----------------------------
DROP TABLE IF EXISTS `jvs_estimated_delivery_time`;
CREATE TABLE `jvs_estimated_delivery_time`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `estimated_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预估单id',
  `simulated_due_time` datetime NULL DEFAULT NULL COMMENT '新预估交期',
  `old_simulated_due_time` datetime NULL DEFAULT NULL COMMENT '旧预估交期',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '交期预估结果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_estimated_delivery_time
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_estimated_delivery_time_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_estimated_delivery_time_pending`;
CREATE TABLE `jvs_estimated_delivery_time_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `estimated_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预估单id',
  `simulated_due_time` datetime NULL DEFAULT NULL COMMENT '新预估交期',
  `old_simulated_due_time` datetime NULL DEFAULT NULL COMMENT '旧预估交期',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认交期预估' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_estimated_delivery_time_pending
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_estimated_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_estimated_order`;
CREATE TABLE `jvs_estimated_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `expectation_time` datetime NULL DEFAULT NULL COMMENT '期望交期',
  `simulated_due_time` datetime NULL DEFAULT NULL COMMENT '预估交期',
  `committed_time` datetime NULL DEFAULT NULL COMMENT '承诺交期',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `sequence` decimal(18, 6) NULL DEFAULT NULL COMMENT '序号',
  `order_status` enum('PENDING_ASSESSMENT','ASSESSMENT_COMPLETED','COMMITTED','RELEASED_TO_PRODUCTION','CLOSE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `uk_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '预估订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_estimated_order
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_forecast
-- ----------------------------
DROP TABLE IF EXISTS `jvs_forecast`;
CREATE TABLE `jvs_forecast`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_date` date NULL DEFAULT NULL COMMENT '需求日期',
  `custom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户',
  `version` bigint NULL DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_delivery_date`(`delivery_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'FCST销售预测' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_forecast
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_forecast_history
-- ----------------------------
DROP TABLE IF EXISTS `jvs_forecast_history`;
CREATE TABLE `jvs_forecast_history`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_date` date NULL DEFAULT NULL COMMENT '需求日期',
  `custom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户',
  `version` bigint NULL DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_delivery_date`(`delivery_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'FCST销售预测历史数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_forecast_history
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_forecast_material_statistics
-- ----------------------------
DROP TABLE IF EXISTS `jvs_forecast_material_statistics`;
CREATE TABLE `jvs_forecast_material_statistics`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_date` date NULL DEFAULT NULL COMMENT '需求日期',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_delivery_date`(`delivery_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'FCST销售预测产品统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_forecast_material_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_global_config
-- ----------------------------
DROP TABLE IF EXISTS `jvs_global_config`;
CREATE TABLE `jvs_global_config`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `auto_batch_rule` json NULL COMMENT '自动拆合任务规则',
  `estimated_config` json NULL COMMENT '预估配置',
  `config_data` json NULL COMMENT '所有全局配置',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全局配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_global_config
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_incoming_material_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_incoming_material_order`;
CREATE TABLE `jvs_incoming_material_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '来料订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_incoming_material_order
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '制造BOM' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_manufacture_bom
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_material
-- ----------------------------
DROP TABLE IF EXISTS `jvs_material`;
CREATE TABLE `jvs_material`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `type` enum('RAW_MATERIAL','SEMI_FINISHED','FINISHED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `source` enum('PRODUCED','PURCHASED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '厂内库存',
  `vmi_stock` decimal(18, 6) NULL DEFAULT 0.000000 COMMENT 'vmi库存',
  `safety_stock` decimal(18, 6) NULL DEFAULT NULL COMMENT '安全库存',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计量单位',
  `lead_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提前期',
  `buffer_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缓冲期',
  `attribute_data` json NULL COMMENT '属性数据',
  `weekly_production_limit` decimal(18, 6) NULL DEFAULT 0.000000 COMMENT '周生产限额',
  `enable_kitting` tinyint(1) NULL DEFAULT 1 COMMENT '参与齐套计算 0不参与 1参与',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物料' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_material
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_operation_log`;
CREATE TABLE `jvs_operation_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `operation_type` enum('AUTO_CREATE_WEEKLY_DEMAND_PENDING_ORDER','CREATE_SHIPPING_PLAN') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作日志类型',
  `content` json NULL COMMENT '日志内容',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储各种类型的操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_page_design
-- ----------------------------
DROP TABLE IF EXISTS `jvs_page_design`;
CREATE TABLE `jvs_page_design`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `business_type` enum('MATERIAL','PROCESS','PROCESS_ROUTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `extend_fields` json NULL COMMENT '扩展列表字段集合',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '列表设计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_page_design
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_pickup_request
-- ----------------------------
DROP TABLE IF EXISTS `jvs_pickup_request`;
CREATE TABLE `jvs_pickup_request`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_date` date NULL DEFAULT NULL COMMENT '需求日期',
  `custom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户',
  `version` bigint NULL DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_delivery_date`(`delivery_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提货需求' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_pickup_request
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_pickup_request_history
-- ----------------------------
DROP TABLE IF EXISTS `jvs_pickup_request_history`;
CREATE TABLE `jvs_pickup_request_history`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_date` date NULL DEFAULT NULL COMMENT '需求日期',
  `custom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户',
  `version` bigint NULL DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_delivery_date`(`delivery_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提货需求历史数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_pickup_request_history
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_plan_info
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_info`;
CREATE TABLE `jvs_plan_info`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `schedule_start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `last_confirm_schedule_time` datetime NULL DEFAULT NULL COMMENT '最近确认计划的时间',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_info
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_plan_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_log`;
CREATE TABLE `jvs_plan_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '策略名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '排产开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '排产结束时间',
  `duration` json NULL COMMENT '耗时',
  `task_size` int NULL DEFAULT NULL COMMENT '任务数量',
  `constraint_config` json NULL COMMENT '约束配置',
  `score` bigint NULL DEFAULT NULL COMMENT '得分',
  `log_status` enum('SUCCESS','FAILURE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `failure_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '失败详情',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_start_time`(`start_time` ASC) USING BTREE,
  INDEX `idx_end_time`(`end_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_log
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_plan_report_field_setting
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_report_field_setting`;
CREATE TABLE `jvs_plan_report_field_setting`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `report_type` enum('PLAN_RESOURCE_TASK_GANTT','PLAN_ORDER_TASK_GANTT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告类型',
  `task_bar_fields` json NULL COMMENT '任务条显示字段',
  `tooltip_fields` json NULL COMMENT '任务条提示框显示字段',
  `left_table_fields` json NULL COMMENT '甘特图左侧列表字段',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务可视化字段设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_report_field_setting
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_plan_task
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task`;
CREATE TABLE `jvs_plan_task`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
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
  `changeover_time` datetime NULL DEFAULT NULL COMMENT '换型截止时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料信息',
  `use_auxiliary_resources` json NULL COMMENT '分配的辅资源',
  `total_work_time` bigint NULL DEFAULT NULL COMMENT '计划总工时(秒)',
  `task_status` enum('PENDING','PARTIALLY_COMPLETED','COMPLETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `last_completion_time` datetime NULL DEFAULT NULL COMMENT '最近一次报工完成时间',
  `quantity_completed` decimal(18, 6) NULL DEFAULT NULL COMMENT '已完成数量',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `main_order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余主生产订单编码',
  `main_material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余主生产订单主产物编码',
  `resource_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余主资源编码',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_code`(`code` ASC) USING BTREE,
  INDEX `idx_status`(`task_status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_task
-- ----------------------------

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
  `changeover_time` datetime NULL DEFAULT NULL COMMENT '换型截止时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料信息',
  `use_auxiliary_resources` json NULL COMMENT '分配的辅资源',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待处理的任务调整信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_task_adjust
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_plan_task_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task_order`;
CREATE TABLE `jvs_plan_task_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单id。指向：jvs_production_order.id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单编码',
  `order_info` json NULL COMMENT '生产订单信息',
  `order_material_info` json NULL COMMENT '生产订单主产物信息',
  `scheduling_status` enum('UNSCHEDULED','SCHEDULED','COMPLETED','NO_SCHEDULED','PARTIAL_TASK_SCHEDULED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单排产状态',
  `parent_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父订单id（如果是补充订单，则指向其是那个订单的补充订单',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_id`(`plan_type` ASC, `order_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划任务冗余订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_task_order
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_plan_task_order_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task_order_pending`;
CREATE TABLE `jvs_plan_task_order_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单id。指向：jvs_production_order.id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单编码',
  `order_info` json NULL COMMENT '生产订单信息',
  `order_material_info` json NULL COMMENT '生产订单主产物信息',
  `scheduling_status` enum('UNSCHEDULED','SCHEDULED','COMPLETED','NO_SCHEDULED','PARTIAL_TASK_SCHEDULED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单排产状态',
  `parent_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父订单id（如果是补充订单，则指向其是那个订单的补充订单',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_id`(`plan_type` ASC, `order_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认排产计划订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_task_order_pending
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_plan_task_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_plan_task_pending`;
CREATE TABLE `jvs_plan_task_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `plan_type` enum('PLAN','CAPACITY_PRE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PLAN' COMMENT '排产方案类型',
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
  `changeover_time` datetime NULL DEFAULT NULL COMMENT '换型截止时间',
  `start_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是工序任务链中的首道工序任务',
  `end_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是任务链中的最后一个任务',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否是补充生产任务',
  `pinned` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定任务',
  `merge_task` tinyint(1) NULL DEFAULT NULL COMMENT '是否是合并任务',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `input_materials` json NULL COMMENT '输入物料',
  `use_auxiliary_resources` json NULL COMMENT '分配的辅资源',
  `total_work_time` bigint NULL DEFAULT NULL COMMENT '计划总工时(秒)',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `main_order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余主生产订单编码',
  `main_material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余主生产订单主产物编码',
  `resource_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冗余主资源编码',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_plan_type`(`plan_type` ASC) USING BTREE,
  INDEX `idx_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认排产计划任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_plan_task_pending
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排产计划策略' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_planning_strategy
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_process
-- ----------------------------
DROP TABLE IF EXISTS `jvs_process`;
CREATE TABLE `jvs_process`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `product_switch_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切换产品时长',
  `attribute_switch_rules` json NULL COMMENT '切换属性时长规则',
  `pre_interval_duration` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前间隔时长',
  `post_interval_duration` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后间隔时长',
  `process_relationship` enum('ES','EE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序关系',
  `buffer_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关系为EE时的缓冲时长',
  `use_main_resources` json NULL COMMENT '可用的主资源集合',
  `use_auxiliary_resources` json NULL COMMENT '可用的辅助资源集合',
  `use_materials` json NULL COMMENT '使用的物料',
  `auto_batch_rule` json NULL COMMENT '自动拆合任务规则',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工艺' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_process
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_process_route
-- ----------------------------
DROP TABLE IF EXISTS `jvs_process_route`;
CREATE TABLE `jvs_process_route`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id。指向：jvs_material.id',
  `route_design` json NULL COMMENT '工艺路线设计',
  `auto_batch_rule` json NULL COMMENT '自动拆合任务规则',
  `config_data` json NULL COMMENT '配置',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工艺路线' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_process_route
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_production_material_control
-- ----------------------------
DROP TABLE IF EXISTS `jvs_production_material_control`;
CREATE TABLE `jvs_production_material_control`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `coefficient` decimal(18, 6) NULL DEFAULT NULL COMMENT '管控系数',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_material_code`(`material_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品生产管控策略' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_production_material_control
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_production_order
-- ----------------------------
DROP TABLE IF EXISTS `jvs_production_order`;
CREATE TABLE `jvs_production_order`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '需求交付时间',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `sequence` decimal(18, 6) NULL DEFAULT NULL COMMENT '序号',
  `type` enum('MANUFACTURE','IDLE_CAPACITY_FILL') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型',
  `order_status` enum('PENDING','COMPLETED','CANCELLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `scheduling_status` enum('UNSCHEDULED','SCHEDULED','COMPLETED','NO_SCHEDULED','PARTIAL_TASK_SCHEDULED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排产状态',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `can_schedule` tinyint(1) NULL DEFAULT 1 COMMENT '是否参与排产。0-否，1-是',
  `supplement` tinyint(1) NULL DEFAULT NULL COMMENT '是否为补充生产订单。0-否，1-是',
  `parent_order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父订单id（如果是补充订单，则指向其是那个订单的补充订单',
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
  INDEX `idx_parent_id`(`parent_order_id` ASC) USING BTREE,
  INDEX `idx_delivery_time`(`delivery_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '生产订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_production_order
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主生产资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_production_resource
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_report_shipping_plan
-- ----------------------------
DROP TABLE IF EXISTS `jvs_report_shipping_plan`;
CREATE TABLE `jvs_report_shipping_plan`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报表名',
  `content` json NULL COMMENT '报表内容',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `version` bigint NULL DEFAULT NULL COMMENT '版本号',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0未删除  1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出货计划报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_report_shipping_plan
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_report_shipping_plan_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_report_shipping_plan_pending`;
CREATE TABLE `jvs_report_shipping_plan_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报表名',
  `content` json NULL COMMENT '报表内容',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认出货计划报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_report_shipping_plan_pending
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源_日历关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_resource_calendar
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_synchronize_inventory
-- ----------------------------
DROP TABLE IF EXISTS `jvs_synchronize_inventory`;
CREATE TABLE `jvs_synchronize_inventory`  (
  `pn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编号(PN)',
  `ly_inventory` decimal(18, 6) NOT NULL DEFAULT 0.000000 COMMENT '历史库存(上月末结存)ly',
  `vim_inventory` decimal(18, 6) NOT NULL DEFAULT 0.000000 COMMENT '供应商管理库存(VIM)',
  `wip_quantity` decimal(18, 6) NOT NULL DEFAULT 0.000000 COMMENT '在制品库存wip',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录时间',
  `type` enum('RAW_MATERIAL','SEMI_FINISHED','FINISHED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`pn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步库存表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_synchronize_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_task_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `jvs_task_dispatch`;
CREATE TABLE `jvs_task_dispatch`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `dispatch_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划编码',
  `front_dispatch_codes` json NULL COMMENT '前置计划编码集合',
  `task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `detail` json NULL COMMENT '分发任务详细信息',
  `process_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序编码',
  `plan_resource_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划主资源编码',
  `plan_start_time` datetime NULL DEFAULT NULL COMMENT '计划开始时间',
  `plan_end_time` datetime NULL DEFAULT NULL COMMENT '计划结束时间',
  `dispatch_status` enum('PENDING','PARTIALLY_COMPLETED','COMPLETED','SUSPENDED','CANCELLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分发任务状态',
  `report_info` json NULL COMMENT '报工汇总信息',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_dispatch_code`(`dispatch_code` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务分派' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_task_dispatch
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_task_dispatch_report
-- ----------------------------
DROP TABLE IF EXISTS `jvs_task_dispatch_report`;
CREATE TABLE `jvs_task_dispatch_report`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `dispatch_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务分发编码',
  `task_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `report_type` enum('TASK','ORDER') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报工类型',
  `resource_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际主资源编码',
  `start_time` datetime NULL DEFAULT NULL COMMENT '实际开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '实际完成时间',
  `order_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产订单id。指向：jvs_production_order.id',
  `order_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `report_quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '报工数量',
  `auto_allocated_report` json NULL COMMENT '合并任务整体报工自动分配给订单的报工数量',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_order_code`(`order_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报工记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_task_dispatch_report
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_weekly_demand
-- ----------------------------
DROP TABLE IF EXISTS `jvs_weekly_demand`;
CREATE TABLE `jvs_weekly_demand`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料id',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_date` date NULL DEFAULT NULL COMMENT '需求日期',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `idx_delivery_date`(`delivery_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '周需求' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_weekly_demand
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_weekly_demand_order_pending
-- ----------------------------
DROP TABLE IF EXISTS `jvs_weekly_demand_order_pending`;
CREATE TABLE `jvs_weekly_demand_order_pending`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编码',
  `material_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `quantity` decimal(18, 6) NULL DEFAULT NULL COMMENT '需求数量',
  `delivery_date` date NULL DEFAULT NULL COMMENT '需求交付日期',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `color` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示颜色',
  `type` enum('MANUFACTURE','IDLE_CAPACITY_FILL') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者姓名',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `uk_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待确认周需求生产订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_weekly_demand_order_pending
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作日历' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_work_calendar
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作模式' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_work_mode
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报工记录(待删除)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_work_report
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
