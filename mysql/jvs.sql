/*
 Navicat Premium Data Transfer

 Source Server         : 161
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : 10.0.0.161:3306
 Source Schema         : jvs

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 22/08/2025 16:11:36
*/
create database `jvs` default character set utf8mb4 collate utf8mb4_general_ci;
use `jvs`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jvs_api
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api`;
CREATE TABLE `jvs_api`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口名称',
  `service_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '服务名称',
  `service_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口地址  /xxx/xxxx/xx',
  `in_parameter` json NULL COMMENT '请求参数说明',
  `out_parameter` json NULL COMMENT '返回参数说明',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '接口描述',
  `fee_rules_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计费标准',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '接口列表页' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_api_channel
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api_channel`;
CREATE TABLE `jvs_api_channel`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  `commission_ratio` double(3, 1) NULL DEFAULT NULL COMMENT '佣金比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '渠道' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api_channel
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_api_expense_record
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api_expense_record`;
CREATE TABLE `jvs_api_expense_record`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（T：充值，D：扣费）',
  `deduction_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扣费类型（Y：包年，T：单次）',
  `amount` int NULL DEFAULT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '时间',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '凭证',
  `after_recharge` int NULL DEFAULT NULL COMMENT '余额',
  `year_indate` datetime NULL DEFAULT NULL COMMENT '包年有效期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '费用记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api_expense_record
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_api_fee_rules
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api_fee_rules`;
CREATE TABLE `jvs_api_fee_rules`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `times_price` int NULL DEFAULT NULL COMMENT '单条价格',
  `year_price` int NULL DEFAULT NULL COMMENT '包年价格',
  `is_step_price` tinyint NULL DEFAULT 1 COMMENT '是否阶梯计费',
  `next_price` int NULL DEFAULT NULL COMMENT '下一阶梯价格',
  `pre_step_times` int NULL DEFAULT NULL COMMENT '阶梯前条数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口计费标准' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api_fee_rules
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_api_log
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api_log`;
CREATE TABLE `jvs_api_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成的凭证',
  `ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求ip',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `time` int NULL DEFAULT NULL COMMENT '消耗时间 ',
  `in_parameter` json NULL COMMENT '请求参数说明',
  `out_parameter` json NULL COMMENT '返回参数说明',
  `encryption_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '加解密方式',
  `exception_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '错误信息',
  `service_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '服务名称',
  `service_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接口地址  /xxx/xxxx/xx',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'tid',
  `fee_rules_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计费标准',
  `channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道商',
  `auth_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权编号',
  `api_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `secret`(`secret` ASC) USING BTREE,
  INDEX `create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'api调用日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api_log
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_api_secret
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api_secret`;
CREATE TABLE `jvs_api_secret`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成的凭证',
  `ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'ip白名单',
  `validity` date NULL DEFAULT NULL COMMENT '凭证有效期,过期也不禁用',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `qps` int NULL DEFAULT NULL COMMENT '并发数',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `encryption` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'aes 的key',
  `encryption_type` enum('no_encryption','aes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '加解密方式',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `fee_rules_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计费类型（T：单次，Y：按年）',
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `amount` bigint NULL DEFAULT 0 COMMENT '余额',
  `channel_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'api帐号凭证' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api_secret
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_api_secret_file
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api_secret_file`;
CREATE TABLE `jvs_api_secret_file`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成的凭证',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名 ',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桶名',
  `no_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证/社会统一信用代码',
  `json` json NULL COMMENT '请求参数',
  `validity` datetime NULL DEFAULT NULL COMMENT '证书有效期',
  `file_valid` datetime NULL DEFAULT NULL COMMENT '文件有效期',
  `base_file` json NULL COMMENT '文件对象',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '凭证证书' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api_secret_file
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_api_secret_role
-- ----------------------------
DROP TABLE IF EXISTS `jvs_api_secret_role`;
CREATE TABLE `jvs_api_secret_role`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成的凭证',
  `api` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'api凭证',
  `fee_rule_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计费规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '凭证的权限授权' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_api_secret_role
-- ----------------------------

-- ----------------------------
-- Table structure for jvs_bi_file
-- ----------------------------
DROP TABLE IF EXISTS `jvs_bi_file`;
CREATE TABLE `jvs_bi_file`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `operate_type` enum('down','up') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `operate_status` tinyint(1) NULL DEFAULT NULL COMMENT '操作状态 是否成功',
  `error_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桶名称',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `serve_type` enum('chart','data_source','data_factory','screen','report') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务类型什么服务触发的',
  `data_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '具体的id',
  `error_log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '具体错误',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'bi下载与上传记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jvs_bi_file
-- ----------------------------

-- ----------------------------
-- Table structure for sql_performance
-- ----------------------------
DROP TABLE IF EXISTS `sql_performance`;
CREATE TABLE `sql_performance`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sql` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_time` int NULL DEFAULT NULL,
  `end_time` int NULL DEFAULT NULL,
  `consuming_time` int NULL DEFAULT NULL,
  `access_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `slow_sql` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保存执行计划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sql_performance
-- ----------------------------

-- ----------------------------
-- Table structure for sys_api_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_api_role`;
CREATE TABLE `sys_api_role`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'ip白名单',
  `validity` date NULL DEFAULT NULL COMMENT '凭证有效期,过期也不禁用',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `qps` int NULL DEFAULT NULL COMMENT '并发数',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `encryption` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'aes 的key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开放 api 的权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_api_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_apply
-- ----------------------------
DROP TABLE IF EXISTS `sys_apply`;
CREATE TABLE `sys_apply`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `app_key` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APPID',
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'app_secret',
  `describes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `authorized_grant_types` json NULL COMMENT '可选值 授权码模式:authorization_code,密码模式:password,刷新token: refresh_token, 隐式模式: implicit: 客户端模式: client_credentials。支持多个用逗号分隔',
  `access_token_validity_seconds` int NULL DEFAULT 30000 COMMENT '设置access_token的有效时间(秒),默认(60*60*12,12小时)',
  `refresh_token_validity_seconds` int NULL DEFAULT 30000 COMMENT '设置refresh_token有效期(秒)，默认(60*60*24*30, 30填)',
  `additional_information` json NULL COMMENT '值必须是json格式',
  `auto_approve_scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '默认false,适用于authorization_code模式,设置用户是否自动approval操作,设置true跳过用户确认授权操作页面，直接跳到redirect_uri',
  `registered_redirect_uris` json NULL COMMENT '回调地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `app_key`(`app_key` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_apply
-- ----------------------------
INSERT INTO `sys_apply` VALUES ('12a700ee56f156d74448eb17ae60b9c8', '小程序', 'weixinminiapp', '$2a$10$XbP.HRib3EvRtDa6PtySJ.X7vNAVjeqR1MSZqZF9cYxosYr302IT2', 'JVS开发务平台-快速开发基础服务平台,移动端快速配置使用1。', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('1ff53290763d889bb85813d1845b3bc8c', 'JVS开发务平台', 'frame', '$2a$10$RtdtlcyALRa4BhsYWRS3CORtcvzR2sGwrdMcDdy9K7IQYN/vGre3.', 'JVS开发平台-快速开发基础服务平台', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', '[\"http://localhost/\", \"http://www.baidu.com\"]', NULL, 1);
INSERT INTO `sys_apply` VALUES ('2ea66bb676c79dedc23a77fe5b650e85', '规则引擎', 'RiskPolicy', '$2a$10$IJ82X8L237X1E9vGTP7X4uitI4NsDOdVMwWOnjkAVuD/C8v9K98ZS', '规则引擎', 1, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_apply` VALUES ('42bd1ce9bc39b94658cd54776e04d07b', '风控', 'risk', '$2a$10$ISZQ/hsEOYFxcjjj6.5p7.EZRhiyNjz9EDRWuc06zlpcWVliZ3xYG', '风控', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('4b1c2954ab4d7ff5be778f517e0932fd', 'JVS规则引擎', 'risk-gadget', '$2a$10$ZVnCmMHNDM/2/8uH.CUXIO1LO6pJ8VJ1d6NCSuJ3le7/F97RTgmg2', '规则引擎', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('6e61343889b76be24a0343bdf39924f8', '物联网平台', 'iot', '$2a$04$6T02FwFENKIsO2/.Hb1H9e..OqMk4KLer.GVQaiL5mz8KM.nDJsUe', '物联网数据采集平台', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('751a7809694d084829b57a6ffacede32', '规则引擎', 'rules', '$2a$10$6f2g7BqvJ3ssy/jeJ.EYveDq9v9orkeOpp2dq2wLynOZUCfrESLry', '规则引擎', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('7fcfbd47656f810068614a75cf108a74', '智能BI', 'StoredDataWarehouse', '$2a$10$X4XLcIktsinSCV5f.GC4u.kBkR0LZQhLiCXLuV44QCy9DL02geZ/m', 'JVS-BI', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('9ef8d2af615709b3dfd6e9ea13bbc86b', '项目任务管理', 'teamwork', '$2a$10$Ldm7n8lu.ZJ8pfX.acOj3OZlcfbprVLuzLIMvM.Mg631.WHpt8he.', '项目任务管理', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('b2923049ab127723e4da783c61c02e63', '企业文档', 'doc', '$2a$04$zXVAnWyJRVvOVVmzU7Bea.nRJP3SM0SpYczZc0OGlDYB5DBb7./Nm', 'doc', 0, '[\"password\", \"refresh_token\", \"authorization_code\", \"client_credentials\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('b5a1fb4922bb141bce4366f5554cc298', '智能APS', 'aps', '$2a$04$Y.M3RVqNtqc8YIirrb6gjOyu..YjVZbVU17aC4lp.3QlxdiIMiQ5O', '智能APS', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('bbb46b6e0f779fdb156371548b000ba6', '文档库', 'knowledge', '$2a$10$t5Qu8j8XHdGEIpK0RuRS1OMNh8iM1362PDR9qDk1vCPDYTv8.lrem', 'knowledge', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('ea7e4b3d4b0f7957091da0632f22f65d', '风控决策', 'risk-policy', '$2a$10$eA4eekf3Y6s4Zv.N/DU7wOguSmoI9fTgdHTw0UFZO9UttuRQLeftS', '风控决策', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', '[\"http://www.baidu.com/\"]', NULL, 1);
INSERT INTO `sys_apply` VALUES ('ec6354401334808c8c480c1ad5069d9e', 'a', 'a', '$2a$10$zXVSp7Jv0WebdXO7QpJDZOoIAcoe3nw2kxC3Hu95i9zyznoEK16Am', 'a', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, 'true', '[\"http://www.baidu.com/\"]', NULL, 1);
INSERT INTO `sys_apply` VALUES ('fb62510d6bf29e3a8dedeb83e8d0ee37', '邮件', 'mail', '$2a$10$ZjjOC9FyMHQfOvJvYksK1ulQRNXZWpECvokiIycWIePtKL5uKvTZ.', '邮件', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 1);
INSERT INTO `sys_apply` VALUES ('fe5b01b95c587641e31e76715a753763', '服务编排', 'automation', '$2a$04$VCmJn3KSbbj5ysWxS8V5Lut3VxD6lGi9NwfPm8ejwvsNgZzMmgPs2', '服务编排', 0, '[\"password\", \"refresh_token\"]', 3000000, 3000000, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `sys_bulletin`;
CREATE TABLE `sys_bulletin`  (
  `id` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID',
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `app_keys` json NULL COMMENT '系统应用APPID数组',
  `start_time` datetime NOT NULL COMMENT '公告生效时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '公告结束时间',
  `publish` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发布 0-待发布, 1-发布',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人名称',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户id',
  `content_type` enum('IMG','TEXT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片或文本',
  `type` enum('MOBILE','PC') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PC端或移动端',
  `user_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用户id集。指向：sys_user_info.id',
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'banner图',
  `label` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '通知' COMMENT '公告标签类型,活动，消息，通知',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统应用公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_bulletin
-- ----------------------------

-- ----------------------------
-- Table structure for sys_configs
-- ----------------------------
DROP TABLE IF EXISTS `sys_configs`;
CREATE TABLE `sys_configs`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` enum('TENANT_BASIC_SETTINGS','WORKFLOW_TODO_REMINDER','WORKFLOW_REMINDER','SMS_CONFIGURATION','MAIL_CONFIGURATION','NAIL_APPLICATION_CONFIGURATION','ENTERPRISE_WECHAT_APPLICATION_CONFIGURATION','WECHAT_OFFICIAL_ACCOUNT_CONFIGURATION','LDAP_CONFIGURATION','WECHAT_MP_MESSAGE_CONFIGURATION','BACKGROUND_PERSONALIZED_CONFIGURATION','ENTERPRISE_DOCUMENT_ENTERPRISE_CONFIGURATION','PERSONALIZED_CONFIGURATION_OF_ENTERPRISE_PLANNING','PERSONALIZED_CONFIGURATION_OF_EMAIL_SERVICE','RULE_PERSONALIZATION_CONFIGURATION','PERSONALIZED_CONFIGURATION_OF_DATA_INTELLIGENCE_WAREHOUSE','BASE','PERSONALIZED_CONFIGURATION_IOT_PLATFORMS','PERSONALIZED_CONFIGURATION_FOR_VIDEO_CONFERENCING','CAS_CONFIGURATION','AUTO_CREATE_USER_HEAD_IMG','ERROR_MESSAGE_SEND_DING','AUTOMATION_CONFIGURATION','APS_CONFIGURATION') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置类型',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '属性值',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端，不同的服务可能会存在相同的配置，进行区分',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id,需要通过域名处理不同的类型',
  `config_level` enum('tenant','platform') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'tenant' COMMENT '表示是平台配置，还是租户级配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type` ASC, `client_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_configs
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '部门名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `parent_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1' COMMENT '上级部门为  可能为租户ID，先根据租户进行查询',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户ID默认1',
  `leader_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门负责人ID',
  `type` enum('dept','branchOffice') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'dept' COMMENT '类型',
  `sort` int NULL DEFAULT 0 COMMENT '排序号',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `source` enum('DINGTALK_INSIDE','WECHAT_ENTERPRISE_WEB','OWN','STANDARD_OWN','LDAP') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源，三方同步的时候可能会显示此字段',
  `code` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门编码，目前未使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_role`;
CREATE TABLE `sys_dept_role`  (
  `dept_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门ID',
  `below` tinyint(1) NULL DEFAULT 0 COMMENT '0当前部门 1当前部门及其所有下级部门',
  `role_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `system_type` enum('SYSTEM','BIZ') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除状态',
  `create_by` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1' COMMENT '上级id，顶级-1',
  `uniq_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一id，数据迁移用到',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('004730a6a64238ea7ca5e39e738c48e8', 'jvs-teamwork-ui-help-url', 'jvs-teamwork-ui-help-url', '2022-06-21 10:47:27', '2022-06-21 10:47:27', 'jvs-teamwork-ui-help-url', 'BIZ', '0', '超级管理员', '-1', '388477df3f6b4b67812a86cc38511396');
INSERT INTO `sys_dict` VALUES ('0f2920b2ec620be14598ff21dc92b238', 'jvsapp', '微应用分类处理', '2021-11-23 18:36:14', '2021-11-23 18:36:14', NULL, 'SYSTEM', '0', 'admin', '-1', '3860e1ef0fe04ea09ba892fcc3b3e152');
INSERT INTO `sys_dict` VALUES ('101', '客户类型', '市场营销客户管理', '2021-05-09 09:48:48', '2021-10-26 14:54:42', '内部客户管理分类', 'SYSTEM', '0', 'admin', '-1', '6592c944e8814df9a52e2a1f89e8c3b8');
INSERT INTO `sys_dict` VALUES ('102', '客户地域', '客户地域', '2021-05-09 09:51:35', '2021-10-26 14:54:42', '客户地域', 'SYSTEM', '0', 'admin', '-1', '428a4eda6b2c4c0eabb6355a34ecff27');
INSERT INTO `sys_dict` VALUES ('103', 'T/F', '是/否', '2021-05-09 09:56:28', '2021-10-26 14:54:42', '是/否', 'SYSTEM', '0', 'admin', '-1', '98f10083a69f4f6db5bd7a56aa15d0f6');
INSERT INTO `sys_dict` VALUES ('104', '有效状态', '有效状态', '2021-05-09 11:15:07', '2021-10-26 14:54:42', '有效状态', 'SYSTEM', '0', 'admin', '-1', 'bb87dc2d30fd46efa8f73aa8c29fd304');
INSERT INTO `sys_dict` VALUES ('105', '市场动作', '市场动作', '2021-05-09 11:26:23', '2021-10-26 14:54:42', '市场动作', 'SYSTEM', '0', 'admin', '-1', '93dd9d1a4eaf42618b130f60645562b5');
INSERT INTO `sys_dict` VALUES ('107', '在职状态', '在职状态', '2021-05-11 19:50:00', '2021-10-26 14:54:42', '在职状态', 'SYSTEM', '0', 'admin', '-1', '7cc5b51b6e8942b68d16cc6720624f66');
INSERT INTO `sys_dict` VALUES ('109', '数据权限', '描述', '2021-05-17 14:55:11', '2021-11-23 19:06:40', '备注', 'SYSTEM', '1', 'admin', '-1', '5cc2492922464e858bfcda19f151114e');
INSERT INTO `sys_dict` VALUES ('125', 'fenbao', '企业性质', '2021-05-25 10:29:43', '2021-10-26 14:54:42', '企业性质', 'SYSTEM', '0', 'admin', '-1', 'a81da949070d41b5b7337b94e2629d3a');
INSERT INTO `sys_dict` VALUES ('126', 'guarantee:letter_status', '保函状态', '2021-05-27 15:02:21', '2021-10-26 14:54:42', NULL, 'SYSTEM', '0', 'admin', '-1', 'fd002e8d6d5641a7a80403bc8f7c4dca');
INSERT INTO `sys_dict` VALUES ('130', '账款专家', '合同执行状态', '2021-05-29 19:33:43', '2021-11-23 19:06:40', '合同执行状态，未签约、已签约', 'SYSTEM', '0', 'admin', '-1', 'a0042888bc6c485f8249998d095eee83');
INSERT INTO `sys_dict` VALUES ('131', '合同类型', '合同类型', '2021-05-30 09:16:44', '2021-11-23 19:06:40', '人事合同、服务合同、商贸合同、采购合同', 'SYSTEM', '0', 'admin', '-1', '83e3b5389a2c46f6a6569e9bbd0cf8b9');
INSERT INTO `sys_dict` VALUES ('132', '核销状态', '核销状态', '2021-05-30 10:00:03', '2021-11-23 19:06:40', '核销状态：未核销、已核销、部分核销', 'SYSTEM', '0', 'admin', '-1', '01ca1b9df8ca4067b6f5e02310448072');
INSERT INTO `sys_dict` VALUES ('133', '签约模式', '合同签约模式', '2021-05-30 10:23:10', '2021-11-23 19:06:40', '在线、离线', 'SYSTEM', '0', 'admin', '-1', 'a99b8f150b3c4ffa9775ed6856751b4f');
INSERT INTO `sys_dict` VALUES ('135', '发票类型', '发票类型', '2021-05-31 21:38:37', '2021-11-23 19:06:40', '增值业务专用发票6%、增值业务专用发票13%、增值业务普通发票3%', 'SYSTEM', '0', 'admin', '-1', 'c02d83cdce3a49ed96f78098319d27e6');
INSERT INTO `sys_dict` VALUES ('139', 'pay', '业务系统支付状态', '2021-06-02 16:15:54', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '5da3561583f540d9b1a16858f02658ad');
INSERT INTO `sys_dict` VALUES ('141', '需求分类', '发布不同类别的需求', '2021-06-07 14:17:15', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '35274afc11634d8daf92604a2ba97432');
INSERT INTO `sys_dict` VALUES ('142', 'jobstatus', '员工在职状态', '2021-06-12 10:23:54', '2021-11-23 19:06:40', '试用、在职、离职', 'SYSTEM', '0', 'admin', '-1', '0d217b44d20942ffa2ddcb4d9d5d3d17');
INSERT INTO `sys_dict` VALUES ('144', 'probationperiod', '试用周期', '2021-06-12 12:17:47', '2021-11-23 19:06:40', '0、1、2、3、6', 'SYSTEM', '0', 'admin', '-1', '989c32fd13e049d19a66d00d6aa25cdb');
INSERT INTO `sys_dict` VALUES ('1617f421bfcc4b83f09b59ad21bc9133', 'sales_customer_attitude', '客户态度', '2021-12-20 10:39:32', '2021-12-20 10:39:32', '客户对我们产品的态度', 'BIZ', '0', 'admin', '-1', '113b492548ad43b790dac71b1c3764a9');
INSERT INTO `sys_dict` VALUES ('168', '性别', '性别', '2021-06-25 14:45:09', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '58fd9222129a4aeda25e6f2db46f9fc0');
INSERT INTO `sys_dict` VALUES ('174c70bf46c1fb4794fecdba21d1275a', 'custmer_type', '客户类型', '2022-04-19 15:57:38', '2022-04-19 15:57:38', NULL, 'BIZ', '0', '超级管理员', '-1', '6a59efed1a2746a7943a3d06bc7f15fb');
INSERT INTO `sys_dict` VALUES ('176', '数据权限', '描述', '2021-07-06 14:12:34', '2021-11-23 19:06:40', '备注', 'SYSTEM', '0', 'admin', '-1', 'c9838805264d4a7a9b938247b11c83f0');
INSERT INTO `sys_dict` VALUES ('186', 'SEO', 'SEO关键词', '2021-07-07 17:04:38', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', 'e3828d744cc74611b4ece712088cd043');
INSERT INTO `sys_dict` VALUES ('187', '测试业务', '测试业务字典', '2021-07-09 16:45:04', '2021-11-23 19:06:40', NULL, 'SYSTEM', '0', 'admin', '-1', '19a99d0f62d3406c933c4bdb128692bb');
INSERT INTO `sys_dict` VALUES ('1dc044815217ef71d38868af260569fd', '业务类型', '描述', '2021-07-16 15:08:56', '2021-11-23 19:06:40', '备注', 'SYSTEM', '1', 'admin', '-1', '4f31a4aa02254ab88e3d65952ae3ff13');
INSERT INTO `sys_dict` VALUES ('2b29f7d99083602aef6dce5f9c807fd6', 'icon', '所有图标库', '2021-11-16 11:06:28', '2021-11-16 11:06:28', NULL, 'SYSTEM', '0', 'admin', '-1', 'acaf821e73c240be9a2e071e7141dc46');
INSERT INTO `sys_dict` VALUES ('34b0822233113729862a929529c5d3da', 'SEO关键词', 'SEO关键词', '2021-11-02 09:29:40', '2021-11-23 18:39:07', '备注信息', 'BIZ', '1', 'admin', '-1', '4185cf03f62243b2a68674b41a3a3d53');
INSERT INTO `sys_dict` VALUES ('3b5b12eab32ccb710807ab3a708851dc', 'knowledge_template_type', '企业知识库模板分类', '2022-01-05 16:18:57', '2022-01-05 16:18:57', NULL, 'SYSTEM', '0', 'admin', '-1', '0b988c20108d4243a9d57621936f6604');
INSERT INTO `sys_dict` VALUES ('3ed776b1fb5e3a73c134c803074e6ad0', 'jvs-ui-help-url', '前端页面显示帮助的几个地址', '2022-03-24 10:02:18', '2022-03-24 10:02:18', '前端页面显示帮助的几个地址', 'SYSTEM', '0', 'admin', '-1', '39acb148a06e48529644e42dec4649e1');
INSERT INTO `sys_dict` VALUES ('45f03afb7cab252998c9cb9c6b1bc0c6', 'sales_customer_channel', '用户来源渠道', '2021-12-20 10:38:33', '2021-12-20 10:38:33', '用户来源渠道', 'BIZ', '0', 'admin', '-1', 'f1748b5ff00540e8a46480bf69e33e72');
INSERT INTO `sys_dict` VALUES ('52118494eca4204bee9ef42673cdaefa', '测试', '业务系统测试字典用', '2021-07-16 15:58:51', '2021-11-23 19:06:40', '那些', 'SYSTEM', '0', 'admin', '-1', 'aa841b3b77454396a771a860a0d091f6');
INSERT INTO `sys_dict` VALUES ('614bb08c1dfcab7366a47e1aafca8374', 'dsvfdvcsxz', '系统', '2021-10-11 11:04:03', '2021-11-23 19:06:39', NULL, 'SYSTEM', '0', 'admin', '-1', '2351f100f0414a04880f1a609eace77d');
INSERT INTO `sys_dict` VALUES ('66e8c23dd47467e74c34d723300799cd', 'teamwork-plan-cover', '企业计划-计划封面', '2023-01-31 10:49:51', '2023-01-31 10:49:51', '企业计划-计划封面', 'BIZ', '0', '超级管理员', '-1', '59a8b42708d04788a236e01fcaf43bad');
INSERT INTO `sys_dict` VALUES ('6edc54fb28e6468a58ec1cb61d0859ab', 'teamwork-project-cover', '计划新建图片', '2023-01-31 14:44:57', '2023-01-31 14:44:57', '任务管理计划新建的图片', 'BIZ', '0', '超级管理员', '-1', 'a8d13855458247829ae4fe08c70b48af');
INSERT INTO `sys_dict` VALUES ('7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'meetingStatus', '会议状态', '2021-08-28 18:17:06', '2021-11-23 19:06:40', '会议状态', 'SYSTEM', '0', 'admin', '-1', '8512a1b4b2f44999a54e09ce687b70f7');
INSERT INTO `sys_dict` VALUES ('82', '模板类别', '方便管理不同类别的模板', '2021-03-30 14:10:27', '2021-10-26 14:54:46', NULL, 'SYSTEM', '0', 'admin', '-1', 'a832f40f-fee3-46ae-a38c-84c62e54061a');
INSERT INTO `sys_dict` VALUES ('8dd3ab5dcb3edf54640e6b2f7c0d9148', '会议类型', '会议类型', '2021-08-28 18:17:51', '2021-11-23 19:06:40', '会议类型', 'SYSTEM', '0', 'admin', '-1', '9c1d942280bf4c4aa738aff56e01b079');
INSERT INTO `sys_dict` VALUES ('ab83069fc2b945f9ed7ce5529b1a7b79', 'contractStatus', '合同状态', '2021-08-28 18:09:27', '2021-11-23 19:06:39', '合同状态', 'SYSTEM', '0', 'admin', '-1', '25a2d16777b64ec393954d9bd0065105');
INSERT INTO `sys_dict` VALUES ('add8fed5de4218092b4cea63248f851a', 'jvs_app_links', '应用创建页面的链接', '2022-01-17 15:37:43', '2022-01-17 15:37:43', NULL, 'SYSTEM', '0', 'admin', '-1', '0ca185057a35486ba88dca359b31805a');
INSERT INTO `sys_dict` VALUES ('b31361c96f362603164cf0e359fcdf06', 'jvs-knowledge-ui-help-url', '知识库帮助中心', '2022-06-06 16:03:18', '2022-06-06 16:03:18', '知识库帮助中心', 'BIZ', '0', '超级管理员', '-1', '59436f1da04d4d6a83ed2aa08d2c2855');
INSERT INTO `sys_dict` VALUES ('b5c521d6c646850d6715c46d8b67f683', 'meetingPlace', '会议地点', '2021-08-28 18:16:13', '2021-11-23 19:06:40', '会议地点', 'SYSTEM', '0', 'admin', '-1', '7915b25a32aa4b09be7190cd2ea85948');
INSERT INTO `sys_dict` VALUES ('b9fca51cb6f1f4de37648452c6d1f01b', '测试1', '测试1', '2022-09-21 09:36:19', '2022-09-21 09:36:19', NULL, 'BIZ', '0', '超级管理员', '-1', 'c94c9b2769e64068bed940a7dd86d419');
INSERT INTO `sys_dict` VALUES ('ce50a4bc4329b0fd47ff7ee619b2a45b', '报销类型', '报销类型', '2022-05-27 14:18:42', '2022-05-27 14:18:42', '报销类型', 'BIZ', '0', '超级管理员', '-1', 'a641673c60ae433da940c3ff24dc67bd');
INSERT INTO `sys_dict` VALUES ('dd5aa4d7c06b919a437e934e5af07032', 'certificate_type', '证件类型', '2021-12-15 16:16:15', '2021-12-15 16:16:15', NULL, 'BIZ', '0', 'admin', '-1', '8d60e3180d5d49b482661da584e78f50');
INSERT INTO `sys_dict` VALUES ('df45ee3c48af5af53cf136be38d9a713', '授信状态', '授信状态', '2021-11-13 22:38:04', '2021-11-23 18:38:59', '授信状态', 'BIZ', '1', 'admin', '-1', 'ea31cf3256614654b35446dbd147f107');
INSERT INTO `sys_dict` VALUES ('ee434c5c5e7011666d48ac0c497eebae', 'sales_customer_type', '营销回访', '2021-12-20 10:36:54', '2021-12-20 10:36:54', '营销回访表单需要的字典', 'BIZ', '0', 'admin', '-1', '22f39835eba74a89a4fd61a5fd492b31');
INSERT INTO `sys_dict` VALUES ('f163f24cb8d0cde06135c7fc676139cc', 'teamwork_document', '任务管理文档', '2022-06-21 10:33:30', '2022-06-21 10:47:13', '任务管理文档', 'BIZ', '1', '超级管理员', '-1', '530ec520d07146538338c54cb7c4980b');
INSERT INTO `sys_dict` VALUES ('fbf99c70ff934a58f0ecfb2d4f588c63', 'design_template_type', '开发套件模板类型', '2022-01-12 15:29:32', '2022-01-12 15:29:32', NULL, 'SYSTEM', '0', 'admin', '-1', '5dd2ac5745f9496d9f1b558767a1ce5b');
INSERT INTO `sys_dict` VALUES ('fc6c2e78401d14cc7125de54877e4f9d', 'document-frequency', '知识库常用搜索关键字', '2022-01-06 16:56:41', '2022-01-06 16:56:53', NULL, 'SYSTEM', '0', 'admin', '-1', '3060d97367e84385b2ae43a41dd42bb5');
INSERT INTO `sys_dict` VALUES ('fc6c2e78401d14cc7125de54877e4f9f', 'control-label', '营业类目', '2021-12-19 10:14:50', '2021-12-19 10:14:50', NULL, 'BIZ', '0', 'admin', '-1', '3060d97367e84385b2ae43a41dd42bb4');

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `dict_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典表关联 id',
  `item_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '值',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序（升序）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type` ASC, `sort` ASC, `dict_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO `sys_dict_item` VALUES ('0019fc137cea02d429e996aebf749838', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('006a6cb93ce5893749afb00b7081ec11', '8fe320325009e65644c36d1b16574531', '出纳放款确认', '出纳放款确认', 'processTagType', '出纳放款确认', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0240fbce7233ec943c922211e73ec205', 'bdb79cde74266f58bae93ca65f862efa', '7', '九龙坡区', 'regionType', '九龙坡区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:08', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('029d59f339cb7b3f813063d13286cbed', '3b5b12eab32ccb710807ab3a708851dc', '客户管理', '客户管理', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/e/4/2/4/d/134be1354fe3a6f327a872104b36ccd8.svg', 5, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('02a2da28423e70c6b7850c2dc29567c1', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-02-03 17:38:41', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('02ca9f6ea34139980460645f788b2842', '0f2920b2ec620be14598ff21dc92b238', '项目任务', '项目任务', 'jvsapp', NULL, 7, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('038329ba9c5b8a858948a30221ca0270', '8fe320325009e65644c36d1b16574531', '审贷中心放款审批', '审贷中心放款审批', 'processTagType', '审贷中心放款审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0478285344fdc3901f1e58edf0bf5066', '8fe320325009e65644c36d1b16574531', '财务负责人审批', '财务负责人审批', 'processTagType', '财务负责人审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0483401e0db48b6e2b254f8d4143ea43', '3b5b12eab32ccb710807ab3a708851dc', '教育学习', '教育学习', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/2/6/c/1/1/a67520006f71e5a7c07026db1a478d1d.svg', 2, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('054d1d2df10c149a20a26601848c7e08', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-02-03 17:38:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('058bf9b3f7064784867fa34492ade669', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=ab0517f59db48fa5cae97d1b13a52257&security=false&key=fef7572a6078c0e9a85be0e5b1932c82', 'learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('06c7a4bdf3d8f7cab246b91736a809f2', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('071e09044c9be28921966abcbbdb7d96', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-02-03 17:38:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('07aab34a7f5bc46512eaea56021cb3c4', 'ddf4becc7bdbb0c482bff051166cb54c', 'SH', '上会', '321', '上会', 0, '2021-08-28 18:59:52', '2021-08-28 18:59:52', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0899f6f18817f66eb0709926440fa1fa', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('08fed38e870ad52583994e4659f8b069', '45f03afb7cab252998c9cb9c6b1bc0c6', '5', '线下介绍', 'sales_customer_channel', '线下介绍', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0929652bb9485afee7f379032b81c3e9', 'fc6c2e78401d14cc7125de54877e4f9f', '西餐料理', '西餐料理', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('097dfa34086f8c1fef14d28e85b5e28e', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('09d7742a7db1c18926e888e96345d8c6', '66e8c23dd47467e74c34d723300799cd', '2023/01/28//2023-01-28804022940096958464-proimg1.jpg', '2', 'teamwork-plan-cover', '2', 1, '2023-01-31 10:50:45', '2023-01-31 10:50:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0a4ef1574c933907b82ace5acc2ae166', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('0aae3b08006885c53a96ddfda2632f80', 'fc6c2e78401d14cc7125de54877e4f9f', '正餐美食', '正餐美食', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0c624c030c5dc97f002148874069a3f0', 'ee434c5c5e7011666d48ac0c497eebae', '1', '个人客户', 'sales_customer_type', '个人客户', 0, '2021-12-20 10:40:15', '2021-12-20 10:40:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0c6cd764ce423dbe162a6e76721d6d83', '126ceca0dc43d3f84df03221a09b3c75', '4', '云南代表处', 'parent_company', '云南代表处', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0c8f49b50393844b98763e76c4da41fc', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('0d60d36c5e91bc1a62703fb89d331400', '7ab996b18d4fa75e8837369f4c071b4a', '2', '小额贷款', 'productType', '小额贷款', 0, '2021-08-11 10:14:39', '2021-08-11 10:14:39', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('0ff1e347940be293e371ea48c1ef887c', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=7169026086108397569&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=443260409%2C3562412549&os=1619154166%2C2313910332&simid=443260409%2C3562412549&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=%E5%9B%BE%E7%89%87&objurl=https%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1114%2F040221103339%2F210402103339-8-1200.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B33da_z%26e3Bv54AzdH3FkzAzdH3FiizoAzdH3FxipxAzdH3Fndnm8d_b_z%26e3Bip4s&gsm=&islist=&querylist=&dyTabStr=MCwzLDEsNiw0LDIsNSw3LDgsOQ%3D%3D', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-01-31 16:29:31', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('10f59b2707fef0359e24150756f8d5d6', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'INVALID', '已作废', 'contractStatus', '已作废', 0, '2021-08-28 18:09:45', '2021-08-28 18:09:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('120bfcde61a78451d7a0079541f7a40a', '0f2920b2ec620be14598ff21dc92b238', '项目管理', '项目管理', 'jvsapp', NULL, 4, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('12a49e9a3b8b2e57f90e8351cfad3d96', 'fec53be21d29d0cbf2c8683724dc9e80', '2', '0~100', 'companyScale', '0~100', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('12ed859a7be65ac6830bf294d5169f9a', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('12edd551a09b6b7ae9820c2017909261', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1513cd601218ca292482149b26da42d8', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('15158421bbe39c68df60e0c0a52f04d7', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('15a62b969a820f51254b8853f03f6aa0', '3b5b12eab32ccb710807ab3a708851dc', '团队协作', '团队协作', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/2/6/c/1/1/a67520006f71e5a7c07026db1a478d1d.svg', 3, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('15e4741dba0b12f3d0ef872e15a5d392', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('16dfdce77ce641dca0f8f6955f13e5a9', 'ce50a4bc4329b0fd47ff7ee619b2a45b', '2', '招待费', '报销类型', '招待费', 1, '2022-05-27 14:19:11', '2022-05-27 14:19:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('18011f12a197c2620a30debf564c4337', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1897d828da804c3547e6c02d89623519', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1909092c1d71bfc49c1d78499df28da3', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E9%9B%86%E6%88%90%E8%87%AA%E5%8A%A8%E5%8C%96%E4%BB%8B%E7%BB%8D.mp4', 'video-rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-03-24 10:24:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('19d2211628e66976d4024b8e489b9cd0', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1a1524049142e44b1d5e8a77c66efb3c', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%88%97%E8%A1%A8%E9%A1%B5%E8%A7%86%E9%A2%91%E8%AE%B2%E8%A7%A3.mp4', 'video-list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1a6cd15ede26c7941bace5766a65d75a', '8fe320325009e65644c36d1b16574531', '副总经理审批', '副总经理审批', 'processTagType', '副总经理审批', 0, '2021-08-02 19:37:09', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1a998c249efbdaad709d3ba81b988458', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1a9ef5b74ada804086a4abe6849e5d5b', 'bdb79cde74266f58bae93ca65f862efa', '26', '武隆区', 'regionType', '武隆区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:08', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1b102052e9df8a6a920e784b096a99b7', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1b1ad1d1d7b39cb5fa8e1df2e3ae134b', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'SEAL', '已用印未回传', 'contractStatus', '已用印未回传', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1dd4ad8940dea000811717544309a252', '126ceca0dc43d3f84df03221a09b3c75', '1', '公司重庆总部', 'parent_company', '公司重庆总部', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1e1c1da96a7cdaf4d5db340cbfa6415c', 'dd5aa4d7c06b919a437e934e5af07032', 'sfz', '身份证', 'certificate_type', NULL, 0, '2021-12-15 16:16:46', '2021-12-15 16:16:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1ec887a0e520c3a4cc57f11606c3cc41', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=d659b00ff60a4c9e4d9ca13d429eba60&security=false&key=6e6223607315c1e16d4966478b63905f', 'rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('1f8a2afa8a689240d0bfc1268b288d80', 'e113a39dd3d9b0f785b5b54a25b03e96', 'AA', 'AA', 'customerCreditLevel', 'AA', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('1fd2e69a3bc7e987d25cf81bf55c844f', '3b5b12eab32ccb710807ab3a708851dc', '疫情防护', '疫情防护', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/1/9/9/c/a/86f013679565aead9ffb0386c20a25ae.svg', 6, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('207c6fc5f267cbba027697dae75d2055', 'b31361c96f362603164cf0e359fcdf06', 'http://10.0.0.26:10000/#/view?id=11af5e85287006b2036f533625bcd16e', 'event-auto-help', 'jvs-knowledge-ui-help-url', 'http://10.0.0.26:10000/#/view?id=11af5e85287006b2036f533625bcd16e', 0, '2022-06-06 16:08:19', '2022-06-06 16:08:19', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2136a61da10cfab5378c2c9cf1b2b692', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-02-03 09:13:26', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('22d3a10d6fc02028fb94b81fedf7dcf4', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%88%97%E8%A1%A8%E9%A1%B5%E8%A7%86%E9%A2%91%E8%AE%B2%E8%A7%A3.mp4', 'video-list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('22e0952a855acb32fe64a73ae5e1ea81', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_1', '无法表示意见的审计报告', 'auditOpinionTypes', '无法表示意见的审计报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('241291030836bc762bf3f45c8f27c60e', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-01-31 15:57:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('247', '82', '合同模板', NULL, '模板类别', NULL, 0, '2021-03-30 14:20:30', '2021-03-30 14:20:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('252', '80', '2', '已支付', '数据', '订单金额买家成功支付', 0, '2021-04-01 09:29:47', '2021-04-01 09:29:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('253', '80', '1', '未支付', '数据', '买家下单未付款', 0, '2021-04-01 09:29:47', '2021-04-01 09:29:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2546a685f22b1a3e223ed28893bc2659', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=7169026086108397569&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=443260409%2C3562412549&os=1619154166%2C2313910332&simid=443260409%2C3562412549&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=%E5%9B%BE%E7%89%87&objurl=https%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1114%2F040221103339%2F210402103339-8-1200.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B33da_z%26e3Bv54AzdH3FkzAzdH3FiizoAzdH3FxipxAzdH3Fndnm8d_b_z%26e3Bip4s&gsm=&islist=&querylist=&dyTabStr=MCwzLDEsNiw0LDIsNSw3LDgsOQ%3D%3D', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-01-31 16:29:31', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('2564575d0a805dc5cc4a31ff15af44cc', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('265fd5e5845bfe27027c1dc3017eeead', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', '创建第一个应用', 'jvs_app_links', '', 2, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2665c667d3da54b9f7873a919941314d', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=fb7df956a8439b69ff102d818d310473&security=false&key=9bc0eabffc3fa352dbdaf6121e4a65bd', 'list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('269945e548b90332c4e754db588a3f1c', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-02-02 15:32:28', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('26bbc4be62b3b558bb5aacd9ac8df811', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-02-03 17:38:41', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('26c11b60ebb5c36ba0ff2aeb32189a1f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=d659b00ff60a4c9e4d9ca13d429eba60&security=false&key=6e6223607315c1e16d4966478b63905f', 'rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('2784a26a8e80fc3cc56b3f57541dea55', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('27b629090076f8f0357a599a6573a00c', '1617f421bfcc4b83f09b59ad21bc9133', '3', '不沟通', 'sales_customer_attitude', '不沟通', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('27e406c5c833c31261550f193263fc3e', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('28aa73629eeb6ce3c02c22f7e09cccfa', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://jvsoss.bctools.cn/jvs-public/2023/01/17/2023-01-17799960697411637248-headImg.png', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-02-03 09:13:26', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('28f6af58c8fe88fc9ec711fa779aabd0', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('2941c297b1a3002e1dac1cea454d5f7f', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=7169026086108397569&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=443260409%2C3562412549&os=1619154166%2C2313910332&simid=443260409%2C3562412549&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=%E5%9B%BE%E7%89%87&objurl=https%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1114%2F040221103339%2F210402103339-8-1200.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B33da_z%26e3Bv54AzdH3FkzAzdH3FiizoAzdH3FxipxAzdH3Fndnm8d_b_z%26e3Bip4s&gsm=&islist=&querylist=&dyTabStr=MCwzLDEsNiw0LDIsNSw3LDgsOQ%3D%3D', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-01-31 16:29:31', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('298', '94', '0', '首页', 'qifu_imgtype', '首页banner', 0, '2021-04-27 18:18:31', '2021-04-27 18:18:31', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('299', '94', '1', '登录', 'qifu_imgtype', '登录的banner', 0, '2021-04-27 18:19:02', '2021-04-27 18:19:02', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2b6bb88f22f084d344099baebf5377d1', 'bdb79cde74266f58bae93ca65f862efa', '25', '梁平区', 'regionType', '梁平区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:09', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2ba4580d76ed0aff842b33b36a2842be', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('2c00dd44480456bc0e2b0711dfdaf203', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%88%97%E8%A1%A8%E9%A1%B5%E8%A7%86%E9%A2%91%E8%AE%B2%E8%A7%A3.mp4', 'video-list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-03-24 11:10:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2cb03186608212f7acc7c290f728994b', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E8%BD%BB%E5%BA%94%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AE%B2%E8%A7%A3.mp4', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('2df560fcaeea55132915b0e1164e5405', '8fe320325009e65644c36d1b16574531', '总经理审批', '总经理审批', 'processTagType', '总经理审批', 0, '2021-08-02 19:37:09', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2e9661aa9eefcc649aab61ed51ebcc09', 'ee434c5c5e7011666d48ac0c497eebae', '0', '企业客户', 'sales_customer_type', '企业客户', 0, '2021-12-20 10:40:15', '2021-12-20 10:40:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2effc2ed59d4c5e750e45272b9db1ca4', '78a9b6c9cc81d2348ee2034fdf69d34d', '3', '提前结清', 'RepayStatus', '提前结清', 3, '2021-07-21 11:20:04', '2021-07-21 11:22:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('2f2058726b45c105bd58fdd6ea908f1e', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-02-03 09:13:26', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('2fadfa8c11516b267f28779f9c4bf307', '1617f421bfcc4b83f09b59ad21bc9133', '1', '不看好', 'sales_customer_attitude', '不看好', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3017f714ff58df6619cf9433c3fc1d31', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('306270d90d2235cf6285d4c2140b9512', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('306552ae8092a6fd14e69df7cebe1285', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('306bc9daf0614369ada5e367ab94a03c', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-01-31 15:57:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('310', '95', 'IDENTITY_CARD', '身份证', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('311', '95', 'ARMY_IDENTITY_CARD', '军官证', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('312', '95', 'STUDENT_CARD', '学生证', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('313', '95', 'PASSPORT', '护照', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('314', '95', 'OTHER', '其他证件', 'jingkong', NULL, 0, '2021-04-30 12:03:10', '2021-04-30 12:03:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3145a17807ba9ff981aa9c542f787435', 'fec53be21d29d0cbf2c8683724dc9e80', '4', '501~1000', 'companyScale', '501~1000', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('315d07b9e6b0b8e7e6587d350ecdace4', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-01-31 15:57:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('31de8661209ddfb8ea1dadb59aa67cec', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=d659b00ff60a4c9e4d9ca13d429eba60&security=false&key=6e6223607315c1e16d4966478b63905f', 'rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('324bac44ce5fbe1b085b5be3d70ddb7e', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=d659b00ff60a4c9e4d9ca13d429eba60&security=false&key=6e6223607315c1e16d4966478b63905f', 'rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('327fbdae2badaf9d81544aec03dc6aa0', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%8A%A8%E6%80%81%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B%E8%AE%B2%E8%A7%A3.mp4', 'video-learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('32d730bc5fdad5e7ee5f58e1fd29a4cb', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'CANCEL', '已撤销', 'contractStatus', '已撤销', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3306780a2af5b190e4bc45d3598e511d', '8fe320325009e65644c36d1b16574531', '发起放款审批', '发起放款审批', 'processTagType', '发起放款审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('33631048dcb602ed59f8e55825b543de', 'fc6c2e78401d14cc7125de54877e4f9f', '甜品饮品', '甜品饮品', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('340', '101', '1', '个人客户', '客户类型', '个人客户', 0, '2021-05-09 09:49:14', '2021-05-09 09:49:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('341', '101', '2', '企业客户', '客户类型', '企业客户', 0, '2021-05-09 09:49:14', '2021-05-09 09:49:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('342', '102', '1', '北京', '客户地域', '北京市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('343', '102', '2', '上海', '客户地域', '上海市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('344', '102', '3', '广州', '客户地域', '广州市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('345', '102', '4', '深圳', '客户地域', '深圳市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3450b243b5b94fece4d9c4413043a766', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('346', '102', '5', '重庆', '客户地域', '重庆市', 0, '2021-05-09 09:53:00', '2021-05-09 09:53:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('346a84eb39389217f69525005989bf25', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=d659b00ff60a4c9e4d9ca13d429eba60&security=false&key=6e6223607315c1e16d4966478b63905f', 'rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('347', '103', '0', 'true', 'T/F', '是', 0, '2021-05-09 09:57:10', '2021-05-09 09:57:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('348', '103', '1', 'false', 'T/F', '否', 0, '2021-05-09 09:57:10', '2021-05-09 09:57:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('349', '104', '0', '有效', '线索状态', '有效', 0, '2021-05-09 11:15:59', '2021-05-09 11:15:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('350', '104', '1', '无效', '线索状态', '无效', 0, '2021-05-09 11:15:59', '2021-05-09 11:15:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('351', '105', '1', '电话回访', '市场动作', '电话回访', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('352', '105', '2', '技术交流', '市场动作', '技术交流', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('353', '105', '3', '线下拜访', '市场动作', '线下拜访', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('354', '105', '4', '礼品赠送', '市场动作', '礼品赠送', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('355', '105', '5', '邀约参观', '市场动作', '邀约参观', 0, '2021-05-09 11:27:46', '2021-05-09 11:27:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('368', '107', '1', '在职', '在职状态', '在职', 0, '2021-05-11 19:50:36', '2021-05-11 19:50:36', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('369', '107', '2', '离职', '在职状态', '离职', 0, '2021-05-11 19:50:36', '2021-05-11 19:50:36', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('37535399e972253b8a2a5960abc3e213', '1059438e8c74d226182966a2a0460597', '1', '等额本息', 'backType', '等额本息', 0, '2021-08-11 10:03:06', '2021-08-11 10:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('375590491fe04f7a0ed56a4f1bcd77d0', 'ee434c5c5e7011666d48ac0c497eebae', '2', '其他', 'sales_customer_type', '其他', 0, '2021-12-20 10:40:15', '2021-12-20 10:40:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('37d42a73b07dd0e1715c4f1ea0ac3c6e', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('388e44f9ddc6df6aba63f233e8c3c6bb', 'fc6c2e78401d14cc7125de54877e4f9f', '夜宵烧烤', '夜宵烧烤', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3a4c8c677cf9d848ce188d7ab79f5e11', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('3b18948bcf36dc802f1be318de4f9f73', '91d9e2833ee1be20f98f09477766a7d4', '4', '其他', 'channelType', '其他', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b37bbcf293f0d14c2ae957b3a3c32b0', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'SUBMIT', '待审核/已提交', 'contractStatus', '待审核/已提交', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b5f246c94581ca5b3a941e8797f3a54', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('3b800d6e3e05f27a60756cba88e601e8', '78a9b6c9cc81d2348ee2034fdf69d34d', '6', '待还利息', 'RepayStatus', '待还利息', 6, '2021-07-21 11:20:04', '2021-07-21 11:22:22', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3b8a2a6fa2e4e5d582bb29bea1a11ed6', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'DELETED', '已经删除/到作废列表去的依据', 'contractStatus', '已经删除/到作废列表去的依据', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3c9a6ec85293c415b805835f21d53b87', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('3ca268ec2de085ad2f713c03930f93e8', '8fe320325009e65644c36d1b16574531', '合同审核', '合同审核', 'processTagType', '合同审核', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3cac1159deae8e2aa00e1645b575983c', '1617f421bfcc4b83f09b59ad21bc9133', '2', '中立观望', 'sales_customer_attitude', '中立观望', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3db8b50fd197142d4bb5fdb533418a6f', '2a13720000aa29c7cc890ca05849fb3b', '2', '城镇户口', 'residenceType', '城镇户口', 0, '2021-07-19 11:26:01', '2021-07-19 11:26:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('3e83c9da9d7cc62f5ed7f6d439c12c88', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E9%9B%86%E6%88%90%E8%87%AA%E5%8A%A8%E5%8C%96%E4%BB%8B%E7%BB%8D.mp4', 'video-rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('41484088f55008d193fe87dc1e79b20f', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-02-02 15:32:28', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('43f4f8426cd028f71d90b7a59ca46c33', 'a9d16a3c562968e982fd64cdb6af1abc', '2', '二楼小会议室', 'roomType', '二楼小会议室', 0, '2021-08-09 17:46:07', '2021-08-09 17:46:07', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('441', '125', '1', '国有参股', 'fenbao', '国有参股', 0, '2021-05-25 10:31:04', '2021-05-25 10:31:04', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('442', '125', '2', '民营企业', 'fenbao', '民营企业', 0, '2021-05-25 10:31:05', '2021-05-25 10:31:05', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('443', '125', '3', '国有控股', 'fenbao', '国有控股', 0, '2021-05-25 10:31:05', '2021-05-25 10:31:05', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('444', '125', '4', '其他', 'fenbao', '其他', 0, '2021-05-25 10:31:05', '2021-05-25 10:31:05', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('448cd20cd4a15ac862c4e8f6c8ef641b', '8fe320325009e65644c36d1b16574531', '总经理助理', '总经理助理', 'processTagType', '总经理助理', 0, '2021-08-02 19:37:09', '2021-08-11 09:47:48', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('449', '126', '1', '待生成', 'guarantee:letter_status', '待生成', 0, '2021-05-27 15:03:06', '2021-05-27 15:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('450', '126', '2', '待签署', 'guarantee:letter_status', '待签署', 0, '2021-05-27 15:03:06', '2021-05-27 15:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('451', '126', '3', '签署成功', 'guarantee:letter_status', '签署成功', 0, '2021-05-27 15:03:06', '2021-05-27 15:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('45132bfea875d0ee4bd9c4951cbe411b', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%88%97%E8%A1%A8%E9%A1%B5%E8%A7%86%E9%A2%91%E8%AE%B2%E8%A7%A3.mp4', 'video-list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('453c9f5fc9debbb97cab06a96405c047', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-02-02 14:37:00', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('462', '130', '0', '待审批', '账款专家', '生成合同草稿未完成审批', 0, '2021-05-29 19:35:58', '2021-05-29 19:35:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('46290f2c7838da0ee5b4d62065664f41', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-03-24 10:25:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('463', '130', '1', '待签约', '账款专家', '为完成签约或未对合同进行回传', 0, '2021-05-29 19:35:58', '2021-05-29 19:35:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('464', '130', '2', '已签收', '账款专家', '完成电子签章或者人工确认签署完成', 0, '2021-05-29 19:35:58', '2021-05-29 19:35:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('465', '131', '1', '服务合同', '合同类型', '服务合同', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('466', '131', '2', '商贸合同', '合同类型', '产品销售', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('467', '131', '3', '人事合同', '合同类型', '员工人事', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('468', '131', '4', '战略协议', '合同类型', '战略合作', 0, '2021-05-30 09:17:45', '2021-05-30 09:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('469', '132', '1', '未核销', '核销状态', '未核销', 0, '2021-05-30 10:04:01', '2021-05-30 10:04:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('46b5665d89cef08aabb9b8b970337d69', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'CHECKED', '已审核未确认', 'contractStatus', '已审核未确认', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('46e99dc7bf6b75da7a2686f2ccecd850', '7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'IN_PROGRESS', '会议中', 'meetingStatus', '会议中', 0, '2021-08-28 18:17:30', '2021-08-28 18:17:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('470', '132', '2', '已核销', '核销状态', '已核销', 0, '2021-05-30 10:04:01', '2021-05-30 10:04:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('471', '132', '3', '部分核销', '核销状态', '部分核销', 0, '2021-05-30 10:04:01', '2021-05-30 10:04:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('472', '133', '1', '在线签约', '签约模式', '在线签约', 0, '2021-05-30 10:26:24', '2021-05-30 10:26:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('473', '133', '2', '离线签约', '签约模式', '离线签约', 0, '2021-05-30 10:26:24', '2021-05-30 10:26:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('475', '108', 'test01', '测试01', 'df ', '描述01', 0, '2021-05-31 17:30:40', '2021-05-31 17:30:40', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('475bfcc8f3f6b9cb34c80fef0133b1fa', '78a9b6c9cc81d2348ee2034fdf69d34d', '1', '待还款', 'RepayStatus', '待还款', 1, '2021-07-21 11:20:04', '2021-07-21 11:22:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('476', '108', 'test02', '测试02', 'df ', '面搜02', 0, '2021-05-31 17:30:40', '2021-05-31 17:30:40', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('477', '135', '1', '增值业务专用发票6%', '发票类型', '6%专票', 0, '2021-05-31 21:40:25', '2021-05-31 21:40:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('47748732562cbe9d1a5857c76cc5860e', '36f93f7c4afff1d0071864e7020fbfe5', '5', '撤销', 'meetStatus', '撤销', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('478', '135', '2', '增值业务专用发票13%', '发票类型', '3%专票', 0, '2021-05-31 21:40:25', '2021-05-31 21:40:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('47837386c7372b2304fb31e6800deabc', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E9%9B%86%E6%88%90%E8%87%AA%E5%8A%A8%E5%8C%96%E4%BB%8B%E7%BB%8D.mp4', 'video-rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('479', '135', '3', '增值业务普通发票3%', '发票类型', '3%普票', 0, '2021-05-31 21:40:25', '2021-05-31 21:40:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('47c30597bda4ac5cfb87b88746a1fd04', '3b5b12eab32ccb710807ab3a708851dc', '产品研发', '产品研发', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/4/d/e/9/e1deb3b54b4c46a4dbd37725e0fa0193.svg', 8, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('480', '136', '1', '已支付', 'pay', '已支付', 0, '2021-06-02 10:14:13', '2021-06-02 10:14:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('481', '136', '2', '支付完成', 'pay', '支付完成', 0, '2021-06-02 10:14:13', '2021-06-02 10:14:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('482', '136', '0', '未支付', 'pay', '未支付', 0, '2021-06-02 10:14:13', '2021-06-02 10:14:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('486', '139', '0', '待支付', 'pay', '订单状态待支付中', 0, '2021-06-02 16:17:01', '2021-06-02 16:17:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('487', '139', '1', '支付中 ', 'pay', '订单支付中状态', 0, '2021-06-02 16:17:01', '2021-06-02 16:17:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('488', '139', '2', '已支付', 'pay', '订单已经完成支付', 0, '2021-06-02 16:17:01', '2021-06-02 16:17:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('48cb8d5dcc79f7fa34a9bc49c6c28eff', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://10.0.0.26:10001/#/mobile/index?login_other_auth_parameter=inside%401', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('490', '141', NULL, '服务', '需求分类', NULL, 0, '2021-06-07 14:17:45', '2021-06-07 14:17:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('491', '142', '1', '试用', 'jobstatus', '试用期员工', 0, '2021-06-12 10:31:27', '2021-06-12 10:31:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('492', '142', '2', '在职', 'jobstatus', NULL, 0, '2021-06-12 10:31:27', '2021-06-12 10:31:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('493', '142', '3', '离职', 'jobstatus', NULL, 0, '2021-06-12 10:31:27', '2021-06-12 10:31:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('494', '143', '1', '居民身份证', 'identitytype', '居民身份证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('495', '143', '2', '士官证', 'identitytype', '士官证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('496', '143', '3', '学生证', 'identitytype', '学生证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('497', '143', '4', '驾驶证', 'identitytype', '驾驶证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('498', '143', '5', '护照', 'identitytype', '护照', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('499', '143', '6', '港澳通行证', 'identitytype', '港澳通行证', 0, '2021-06-12 11:35:33', '2021-06-12 11:35:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4a2588abfc22d17bec770b1c12cf9cef', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-02-02 14:37:00', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('4aaabd8a659586ea6454a747c3817129', '45f03afb7cab252998c9cb9c6b1bc0c6', '1', '知乎', 'sales_customer_channel', '知乎', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4ac660d0efe10962f039d0ccdff1bdeb', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('4b2f5123799208ba1164320ff0a1e143', '0c293703b963c510f1245e1948ba3a85', '现金', '现金', 'moneyType', '现金', 0, '2021-07-23 10:47:01', '2021-07-23 10:47:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4bd3390f403c229c7bda4eea43dfa1c4', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-02-03 17:38:41', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('4bdc62a409d1c1c16fd972a7e4f95547', 'dd5aa4d7c06b919a437e934e5af07032', 'qt', '其他', 'certificate_type', NULL, 0, '2021-12-15 17:29:38', '2021-12-15 17:29:38', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4c1081d21668fd0ba287696e6027f159', '174c70bf46c1fb4794fecdba21d1275a', '0', '个人客户', 'custmer_type', '个人客户', 0, '2022-04-19 17:11:14', '2022-04-19 17:11:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4c375ebd7a74509a3c2ee1bc9bd64691', 'b5c521d6c646850d6715c46d8b67f683', '五会议室(负一楼)', '五会议室(负一楼)', 'meetingPlace', '五会议室(负一楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4c51b01555643252714b11db26238d25', '3b5b12eab32ccb710807ab3a708851dc', '人事办公', '人事办公', 'knowledge_template_type', 'https://p2.kdvas.wpscdn.cn/kdvcover/file/9/4/2/5/2/531d90f6418b00b22428faab5d515c28.svg', 4, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4c968602286fab89626dfc677926a506', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('4dda8ed2ecc7285adee87b92fb84889e', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('4e2ccf7b1676568a2862ae11ff94ed03', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('4ed9bf23b383a368d000bd0f47c0dd20', 'bdb79cde74266f58bae93ca65f862efa', '1', '万州区', 'regionType', '万州区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:09', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('4fd1c73200287e4b1f34fbe5d8ec3bec', 'b5c521d6c646850d6715c46d8b67f683', '一会议室(五楼)', '一会议室(五楼)', 'meetingPlace', '一会议室(五楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('500', '144', '0', '无试用期', 'probationperiod', '无试用期', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('501', '144', '1', '试用期一个月', 'probationperiod', '试用期一个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('502', '144', '2', '试用期两个月', 'probationperiod', '试用期两个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('502f62cdde60771d02399b8cd345c084', 'bdb79cde74266f58bae93ca65f862efa', '18', '永川区', 'regionType', '永川区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:09', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('503', '144', '3', '试用期三个月', 'probationperiod', '试用期三个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('504', '144', '6', '试用期六个月', 'probationperiod', '试用期六个月', 0, '2021-06-12 12:19:00', '2021-06-12 12:19:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('505', '145', '1', '前端', 'workposition', '前端', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('506', '145', '2', '开发', 'workposition', '开发', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('507', '145', '3', '测试', 'workposition', '测试', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('508', '145', '4', '运维', 'workposition', '运维', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('509', '145', '5', '产品', 'workposition', '产品', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('50abcb970c05426fa5d32b92e30369e8', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'BACK', '驳回', 'contractStatus', '驳回', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('510', '145', '6', '人事', 'workposition', '人事', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('511', '145', '7', '财务', 'workposition', '财务', 0, '2021-06-12 12:22:28', '2021-06-12 12:22:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5118829ca0a2bef6d080c234973dbb68', 'df9cfe7d46016f258f7be32dfc84873d', '3', '个人独资企业营业执照', 'licenseType', '个人独资企业营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('513', '138', '1', '支付状态', '实习生', '描述', 0, '2021-06-23 09:42:20', '2021-06-23 09:42:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('514', '138', '2', '支付过程', '实习生', '描述', 0, '2021-06-23 09:42:35', '2021-06-23 09:42:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('516d965390f746a8e37524eeed079f0a', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E8%BD%BB%E5%BA%94%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AE%B2%E8%A7%A3.mp4', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-03-24 11:10:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('529ec8806fd847dd9da01d48280b502a', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('5335d331aa44da3ec99605eabe4ca503', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'END', '单据已作废', 'contractStatus', '单据已作废', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('535f11da16cf02e5fb48258ed58ccaf6', '0f2920b2ec620be14598ff21dc92b238', '教育', '教育', 'jvsapp', NULL, 1, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('53b84a438124c89f80d3574a06521e98', 'df9cfe7d46016f258f7be32dfc84873d', '4', '个人独资企业分支机构营业执照', 'licenseType', '个人独资企业分支机构营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('53e07cb14d3fcb69fb9b0fc1a411a666', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('542f333c7e45841eccd5dedc08afe5d5', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('54b0e6de8d33b41a859e8df4d6a47ef5', 'bdb79cde74266f58bae93ca65f862efa', '21', '铜梁区', 'regionType', '铜梁区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('54be0572d4d3236c6b9a178a602ce6fc', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-02-02 14:37:00', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('5585680e8a7e7f54108b5eb59ca08e8d', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-02-03 17:38:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('56325080ee5d43a4f3300bc6f8c48a0a', 'a9d16a3c562968e982fd64cdb6af1abc', '1', '大厅会议室', 'roomType', '大厅会议室', 0, '2021-08-09 17:45:47', '2021-08-09 17:45:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('568f1af4ba06e8609d2e1d2de3939e86', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('57a29cb1452b52e3a6c5086f1e94b4a1', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=ab0517f59db48fa5cae97d1b13a52257&security=false&key=fef7572a6078c0e9a85be0e5b1932c82', 'learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('57dc8f9807d6a2102221c09236f6e33d', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%8A%A8%E6%80%81%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B%E8%AE%B2%E8%A7%A3.mp4', 'video-learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('591', '168', '男', '男', '性别', NULL, 0, '2021-06-25 14:45:24', '2021-06-25 14:45:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('592', '168', '女', '女', '性别', NULL, 0, '2021-06-25 14:45:24', '2021-06-25 14:45:24', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5a10f2522417ff625233ac0ec0555844', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-02-03 17:38:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('5af213c91ca9b2255f1f78d51849525b', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-03-24 10:24:58', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5afbdc147499cf0e3baba0758ef2d816', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5b18924fd3d6130fce577f3fd3bc1dbb', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-03-24 10:30:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5b5843529260ce8c35f616ac6f016afa', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-01-31 16:38:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('5c8577f3b805d063a35cb972fc433d6c', '8fe320325009e65644c36d1b16574531', '录入尽职调查信息', '录入尽职调查信息', 'processTagType', '录入尽职调查信息', 0, '2021-07-23 10:17:22', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5d1d6616b88961cedb73a42f6be6cebc', '614bb08c1dfcab7366a47e1aafca8374', 'dsc', 'scd', 'dsvfdvcsxz', 'sd', 0, '2021-11-01 15:33:22', '2021-11-01 15:33:22', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5d63d999eef5da92428772869b9024e2', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-01-31 15:37:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5e0fda57afcd00f6530cf796e5ce2067', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-03-24 10:25:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5e42a1cf879d6f2e0c66b90e0669ead0', '78a9b6c9cc81d2348ee2034fdf69d34d', '5', '逾期(已确认)', 'RepayStatus', '逾期(已确认)', 5, '2021-07-21 11:20:04', '2021-07-21 11:22:18', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('5ea035b2ba090c5eef8d3426398a1910', '7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'BREAK_UP', '已结束', 'meetingStatus', '已结束', 0, '2021-08-28 18:17:30', '2021-08-28 18:17:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('600', '138', '3', '3', '实习生', '3', 0, '2021-07-06 14:03:54', '2021-07-06 14:03:54', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('604', '176', '33', '33', '数据权限', '33', 0, '2021-07-06 14:12:51', '2021-07-06 14:12:51', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('60468b8bc1911f2730cda0ecbe57bdc9', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=7169026086108397569&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=443260409%2C3562412549&os=1619154166%2C2313910332&simid=443260409%2C3562412549&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=%E5%9B%BE%E7%89%87&objurl=https%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1114%2F040221103339%2F210402103339-8-1200.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B33da_z%26e3Bv54AzdH3FkzAzdH3FiizoAzdH3FxipxAzdH3Fndnm8d_b_z%26e3Bip4s&gsm=&islist=&querylist=&dyTabStr=MCwzLDEsNiw0LDIsNSw3LDgsOQ%3D%3D', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-01-31 16:29:31', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('605', '177', '1233', '1233', '123', '1233', 0, '2021-07-06 15:35:08', '2021-07-06 15:35:08', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('606', '177', '3211', '3211', '123', '3211', 0, '2021-07-06 15:35:20', '2021-07-06 15:35:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('609b32d3135fa6f7fdc190e8cd36f7d1', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'SEALING', '用印中', 'contractStatus', '用印中', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('60a896fad30b74aa922c8514c3b7720c', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-02-03 17:38:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('60f0be2b7f49dc46bf7d7cbddec9b333', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('617d071f126850b2d36c7eb25f4a825c', '78a9b6c9cc81d2348ee2034fdf69d34d', '8', '部分还款', 'RepayStatus', '部分还款', 8, '2021-07-21 11:20:04', '2021-07-21 11:22:27', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('61df564307d13a9f9111e7de72fce52d', 'bdb79cde74266f58bae93ca65f862efa', '15', '长寿区', 'regionType', '长寿区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('625', '185', '重庆进出口融资担保有限公司', 'website_title', 'website_title', '网站标题', 0, '2021-07-07 17:04:03', '2021-07-07 17:04:03', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('626', '186', '进出口担保,担保', 'SEO', 'SEO', 'SEO关键词', 0, '2021-07-07 17:04:56', '2021-07-07 17:04:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('62625ae391d3e6f21307836f125f0baa', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E9%9B%86%E6%88%90%E8%87%AA%E5%8A%A8%E5%8C%96%E4%BB%8B%E7%BB%8D.mp4', 'video-rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('628', '106', '123', '123', 'aa', '123', 0, '2021-07-12 09:30:59', '2021-07-12 09:30:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('629', '108', 'test03', 'test03', 'df ', 'test03', 0, '2021-07-12 09:31:22', '2021-07-12 09:31:22', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('62c7d87458be8de23871f77a47128ffe', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=fb7df956a8439b69ff102d818d310473&security=false&key=9bc0eabffc3fa352dbdaf6121e4a65bd', 'list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('634f61c3bd3f73d80b51c0956807d46e', '3b5b12eab32ccb710807ab3a708851dc', '生活娱乐', '生活娱乐', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/c/a/8/9/c/a21fc45aa1cdd45c84df555c954254c7.svg', 7, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6384a8370cca58bfb4299c377e926f24', '78a9b6c9cc81d2348ee2034fdf69d34d', '9', '部分还款', 'RepayStatus', '部分还款', 9, '2021-07-21 11:20:04', '2021-07-21 11:22:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('63c384dfc6c1ec73677c4ed6e266abc6', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('63e581c59d06e7dda3a3f57a1b586d01', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('6460cfadba72b47c839066b316478717', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'AUDITING', '审核中', 'contractStatus', '审核中', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6511e14598f11f6db6568e4cee24a36d', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('659715e415b27cd331e0c399a626fd2f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('65b85a7697063e34447f7eb7f4684c2e', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-02-03 17:38:41', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('65cfc6d152747c5106eeae1d03f70142', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-01-31 16:38:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('661a0e62ece2b12a9d121b742654332c', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-02-02 15:32:28', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('66f96698c9b36feaebd439423f0da960', '6edc54fb28e6468a58ec1cb61d0859ab', 'proimg1.jpg', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-01-31 15:38:10', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('679ee2e28abd0a1e5012ee5088e2f073', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('69549842347e80768ac91e2be3d7afeb', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('698d13accc055dd8b83c74e5747188da', 'b5c521d6c646850d6715c46d8b67f683', '二会议室(四楼)', '二会议室(四楼)', 'meetingPlace', '二会议室(四楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('69c6153022acd50b38cefd293e9d8029', 'df9cfe7d46016f258f7be32dfc84873d', '1', '企业法人营业执照', 'licenseType', '企业法人营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('6a4cbd198e9141f2689eebbb6b010e61', '45f03afb7cab252998c9cb9c6b1bc0c6', '4', '百度', 'sales_customer_channel', '百度', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6bad60f4631cc95f11e75b8648dfa32a', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', '访问应用', 'jvs_app_links', '', 3, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6c0e897b11e3163416b1513c25eb055e', '8fe320325009e65644c36d1b16574531', '风控审查审批', '风控审查审批', 'processTagType', '风控审查审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('6e0fa450b981b2c9d85456605cd8ae5c', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-02-02 15:32:28', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('6eb14bb50fb3c2712bdfe85f4b9274d0', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=ab0517f59db48fa5cae97d1b13a52257&security=false&key=fef7572a6078c0e9a85be0e5b1932c82', 'learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('6ec0e94c4df6128cd8e732b04602677c', '78a9b6c9cc81d2348ee2034fdf69d34d', '7', '部分还款', 'RepayStatus', '部分还款', 7, '2021-07-21 11:20:04', '2021-07-21 11:22:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('70ece57bc7cd31205e76fe766268153d', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-02-03 09:13:26', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('715d33d7064db3ccef3ab7d19b5406a8', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('73f186cd1aca91a7b49b1baa5a848c39', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7467ea6d38287c5a732fb0a155d7495f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://jvsoss.bctools.cn/jvs-public/2022/07/42/2022-05-20712350788784918528-%E8%A1%A8%E5%8D%95-%E9%80%BB%E8%BE%91%E8%81%94%E5%8A%A8.mp4', 'video_form_help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('74a49872044084c38c45b45d50c4af95', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('75a06fdde04fa2eee1674affc981fbbb', '8fe320325009e65644c36d1b16574531', '执行监事审批', '执行监事审批', 'processTagType', '执行监事审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('77964f8f52d6c74886850cb92562018c', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('783bbee6cfe176f31eed666219c94b6f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=fb7df956a8439b69ff102d818d310473&security=false&key=9bc0eabffc3fa352dbdaf6121e4a65bd', 'list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('78e05ca2cdb68cda228a322be4ccab82', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=7169026086108397569&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=443260409%2C3562412549&os=1619154166%2C2313910332&simid=443260409%2C3562412549&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=%E5%9B%BE%E7%89%87&objurl=https%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1114%2F040221103339%2F210402103339-8-1200.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B33da_z%26e3Bv54AzdH3FkzAzdH3FiizoAzdH3FxipxAzdH3Fndnm8d_b_z%26e3Bip4s&gsm=&islist=&querylist=&dyTabStr=MCwzLDEsNiw0LDIsNSw3LDgsOQ%3D%3D', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-01-31 16:29:31', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7a234e7064cd7ab85df8f6a6782241cb', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7a35f5e315f567d27b0b64e9eae867d8', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7ac9a513093dfb5c4d979fe67cade856', 'bdb79cde74266f58bae93ca65f862efa', '14', '黔江区', 'regionType', '黔江区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7b5c6e15854c86e8acbb217bb607cf6f', '6edc54fb28e6468a58ec1cb61d0859ab', '2023/01/28//2023-01-28804022940096958464-proimg1.jpg', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-01-31 15:57:25', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7b8fd841c4d571adc4e2845d6c8f39b3', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_3', '应出具保留意见的审核报告', 'auditOpinionTypes', '应出具保留意见的审核报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7c1d133a08dee6cec89590bb790a3876', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7c696dbbb485e0fb7bda132ff5b1c588', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-01-31 15:57:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d03e62afcef75c479af01e15da29d43', '1059438e8c74d226182966a2a0460597', '2', '利随本清', 'backType', '利随本清', 0, '2021-08-11 10:03:06', '2021-08-11 10:03:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d09ffd2df019d287573c216d90acdd8', 'bdb79cde74266f58bae93ca65f862efa', '5', '江北区', 'regionType', '江北区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d200b640496010c1955fdbcac1c031b', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-02-02 14:37:00', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7d6d7bc4f4b985f4bcf7fa48a6698988', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'CONFIRMED', '已确认未用印', 'contractStatus', '已确认未用印', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7d83d472c910aa1e77d6a2f0d8a2900b', '0f2920b2ec620be14598ff21dc92b238', '人事', '人事', 'jvsapp', NULL, 5, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7e66c3dc16ea52d9d0715894615d2089', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=ab0517f59db48fa5cae97d1b13a52257&security=false&key=fef7572a6078c0e9a85be0e5b1932c82', 'learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7e9048f704c817e889e0674adc4ed983', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7ebbb7f18f2e21c213d78bed8ff7f070', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('7ece768fed6d2040c2b967f4cd23a8a8', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', '如何搭建应用', 'jvs_app_links', '', 1, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('7f98e545517c6681bde831c7624f4ee5', '8dd3ab5dcb3edf54640e6b2f7c0d9148', 'RISK_HANDLE', '风险处置会', '会议类型', '风险处置会', 0, '2021-08-28 18:18:10', '2021-08-28 18:18:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('80eaa76d6d757d333b832c7313b8f16d', '1617f421bfcc4b83f09b59ad21bc9133', '0', '支持', 'sales_customer_attitude', '支持', 0, '2021-12-20 10:42:47', '2021-12-20 10:42:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('812a51f2bae8765f17020b01bc85d754', 'e113a39dd3d9b0f785b5b54a25b03e96', 'AA-', 'AA-', 'customerCreditLevel', 'AA-', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('846db5110982532ae04e4fd3b1138557', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('847be73efce145d5760c21aa6a324890', '126ceca0dc43d3f84df03221a09b3c75', '3', '湖南分公司', 'parent_company', '湖南分公司', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('85dea8a5409ae49334a55d8ded2262f6', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8639e1cae14dcb14890d8da5ac2d9aa4', 'bdb79cde74266f58bae93ca65f862efa', '19', '南川区', 'regionType', '南川区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('875f1ec85764fbf3ec834866b3a603dd', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8762682fa374cbd0d615430f9f449eee', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-01-31 16:38:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('88271d56c588f87d7b2ee6794c10cc0c', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('882da51dadd9086d2ff376c0fcfa3a67', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('884d95a240622145423b3e12337d9b0e', '126ceca0dc43d3f84df03221a09b3c75', '2', '四川分公司', 'parent_company', '四川分公司', 0, '2021-08-12 11:41:53', '2021-08-12 11:41:53', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('891d317fb8b3dfa8c6b66013b4cc5e4f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8954c7616b404dcdd3ad840d198fb6db', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%8A%A8%E6%80%81%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B%E8%AE%B2%E8%A7%A3.mp4', 'video-learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('8a01a6aa97e9d4dd0099b2142e461d60', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8bad4f3ddb790a4b2023593ab8cd992f', 'e113a39dd3d9b0f785b5b54a25b03e96', 'F', 'F', 'customerCreditLevel', 'F', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('8c6d5d7ba1777512e1d6b4fcee3ec928', '0f2920b2ec620be14598ff21dc92b238', '生产管理', '生产管理', 'jvsapp', NULL, 0, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('8c74e4bbc0d223787980255758e07dca', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E8%BD%BB%E5%BA%94%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AE%B2%E8%A7%A3.mp4', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8cdfe53eeb2b784eb1de349fc523caa5', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8d2002a572771ebdcc1ee4707cd0d0da', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8f3fb8c9824bd9aef6bb4aa82ff192c2', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('8f71d5812a6f7ea64551e7fac92eab1b', '66e8c23dd47467e74c34d723300799cd', '2023/01/28//2023-01-28804022940096958464-proimg1.jpg', '1', 'teamwork-plan-cover', '1', 0, '2023-01-31 10:50:45', '2023-01-31 10:50:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('8f9755542fede04a5d2e6db0073e7f88', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('90b4c081c3b07e178b7aa49492c07062', 'bdb79cde74266f58bae93ca65f862efa', '16', '江津区', 'regionType', '江津区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('927c5c0d2e94c26c9d650c9dd2ba7fe4', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('928d68742cb7f1457eb980b8190a9118', '45f03afb7cab252998c9cb9c6b1bc0c6', '0', '今日头条', 'sales_customer_channel', '今日头条', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('92dded75dfe1ab019ab015de72d2b65a', 'ddf4becc7bdbb0c482bff051166cb54c', 'ZC', '草稿', '321', '草稿', 0, '2021-08-28 18:59:52', '2021-08-28 18:59:52', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('93de132971ad9e16be34634f1a8c7e58', '78a9b6c9cc81d2348ee2034fdf69d34d', '2', '提前部分还款', 'RepayStatus', '提前部分还款', 2, '2021-07-21 11:20:04', '2021-07-21 11:22:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('97afe9d53cda98cf3cc6060f6e2cec6b', '8fe320325009e65644c36d1b16574531', '执行董事审批', '执行董事审批', 'processTagType', '执行董事审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('97bc19d5b7354483645e02a7060f724f', '36f93f7c4afff1d0071864e7020fbfe5', '3', '进行中', 'meetStatus', '进行中', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('980e9f7e4fd40db03b4a5c40c1ceb9ad', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('980fb85387bc19d721d7674f08bbc729', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-01-31 16:38:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('98f70239324d8a369603cab1301267e3', 'fec53be21d29d0cbf2c8683724dc9e80', '1', '全部', 'companyScale', '全部', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9c9b200e02b2523cf1663f797e8db094', 'bdb79cde74266f58bae93ca65f862efa', '17', '合川区', 'regionType', '合川区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9cb5d4112578e01af9a8bb52efb30187', '8fe320325009e65644c36d1b16574531', '打印申请单', '打印申请单', 'processTagType', '打印申请单', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9cbffe0ed24b4ab57807f3d73aabdbb5', 'bdb79cde74266f58bae93ca65f862efa', '22', '潼南区', 'regionType', '潼南区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9d34bb22cb7fcb7f1c1bff497bdd02a1', '7e47aff5bb3f2a75d9d772c6a9f1fa3d', 'NOT_BEGIN', '未开始', 'meetingStatus', '未开始', 0, '2021-08-28 18:17:30', '2021-08-28 18:17:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9d9645b88bb6b76106138a2613db6003', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=ab0517f59db48fa5cae97d1b13a52257&security=false&key=fef7572a6078c0e9a85be0e5b1932c82', 'learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('9e293a702be8388c82205899a5bece10', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_5', '应出具带强调查事项无保留意见的审计报告', 'auditOpinionTypes', '应出具带强调查事项无保留意见的审计报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9e85d2bb7360e9ea41cfa59a466ee576', '8fe320325009e65644c36d1b16574531', '风控初审', '风控初审', 'processTagType', '风控初审', 0, '2021-07-23 10:17:47', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('9f6185256c0d431f5e43ffb00d104022', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('9fda2ffb907890450a7fd5fc61c71d02', '8fe320325009e65644c36d1b16574531', '部门放款审批', '部门放款审批', 'processTagType', '部门放款审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a03952976f61cbc51e862f9b1c6735d6', '0f2920b2ec620be14598ff21dc92b238', '为你推荐', '为你推荐', 'jvsapp', NULL, 6, '2022-01-19 15:39:10', '2022-01-19 15:39:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a18df47d5396242e29d9dbe255a2e978', '91d9e2833ee1be20f98f09477766a7d4', '1', '银行', 'channelType', '银行', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a1ae1e539c69f4fdf0e320e1763e893f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('a26345d7a79607728086014c10079790', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('a4c636cda323f9e3b3171e0ca9ffa53f', '8dd3ab5dcb3edf54640e6b2f7c0d9148', 'PROJECT_REVIEW', '项目评审会', '会议类型', '项目评审会', 0, '2021-08-28 18:18:10', '2021-08-28 18:18:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a5c09f93f726db4d44b12a9c54842679', '8fe320325009e65644c36d1b16574531', '风控部副经理审批', '风控部副经理审批', 'processTagType', '风控部副经理审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a5d251077fd70ba2fc2067345a61df4c', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=8dc70857ce981f28921a3950101c761a&security=false&key=e05146dace9b9f4cb6954fb5a91f10c2', 'form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('a5d86c7704301a95fdea0d0cd77a66e0', 'dc06f6585bb28fc6fbee85a6335d83ad', '2', '民营', 'companyType', '民营', 0, '2021-08-11 10:07:37', '2021-08-11 10:07:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a68ffdb50ea744e6ddf1f85a374a7a0b', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('a6b693e621c4cd16c7e219db327b525f', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'DRAFT', '草稿/暂存', 'contractStatus', '草稿/暂存', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a6d40a4a3df3b7b1af178fb47649a48e', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('a766b943a3d143f126756d300448a8dd', '91d9e2833ee1be20f98f09477766a7d4', '3', '信托公司', 'channelType', '信托公司', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a7fd505eb06944bf8dd0990245458bfd', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('a8142441da7a41137545f9637044ffa2', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('a818ac1b25fc98f47c1a98b28b84bb5e', 'fec53be21d29d0cbf2c8683724dc9e80', '3', '101~500', 'companyScale', '101~500', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('a97d84a9e6d00736d42c5bfec159989f', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-02-02 14:37:00', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('aaa2ca0e79c4629c89d8d7a59c8317a5', 'bdb79cde74266f58bae93ca65f862efa', '2', '涪陵区', 'regionType', '涪陵区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:12', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('abba783ce49a79601eb9b359f6b8fc0a', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-02-03 17:38:41', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('abccee4c9593940b68d8ad70092094e3', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('ae7594ac754eb604bbec7af7fef22bf4', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('aea4ce2b7f0a9b80eab1ff8db1c0fc9b', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('aecfaf5e10304d2b3fe2ba211184690e', 'fec53be21d29d0cbf2c8683724dc9e80', '5', '1000+', 'companyScale', '1000+', 0, '2021-08-11 10:09:33', '2021-08-11 10:09:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('aed05d790ba4c7073cfc684d5ef419ff', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://jvsoss.bctools.cn/jvs-public/2022/07/42/2022-05-20712350788784918528-%E8%A1%A8%E5%8D%95-%E9%80%BB%E8%BE%91%E8%81%94%E5%8A%A8.mp4', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('af4e36e97c7495d53cfb9d730f0ece50', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('af4fe0c13ec979426f15f6f8d4aedeb6', 'bdb79cde74266f58bae93ca65f862efa', '4', '大渡口区', 'regionType', '大渡口区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:12', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('af9578c6508c06b89d94ea18e0725e3d', '0c293703b963c510f1245e1948ba3a85', '其他', '其他', 'moneyType', '其他', 0, '2021-07-23 10:47:01', '2021-07-23 10:47:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('afa9b05239c9a3b81483722592ff9aa2', 'b5c521d6c646850d6715c46d8b67f683', '保理公司会议室', '保理公司会议室', 'meetingPlace', '保理公司会议室', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b138666fecc64c1d1a6e5b6be6c3a31f', '8fe320325009e65644c36d1b16574531', '关闭订单', '关闭订单', 'processTagType', '关闭订单', 0, '2021-08-02 19:30:24', '2021-08-11 09:47:49', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b1f5753468264d53fc1013c157dedade', '8fe320325009e65644c36d1b16574531', '会计审批', '会计审批', 'processTagType', '会计审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b23c02c4da403616968fad3a67dc8c9c', 'fbf99c70ff934a58f0ecfb2d4f588c63', '测试类', '测试类', 'design_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/2/c/7/8/eef9b77b2fde0953c98d205e72bd4a8b.svg', 1, '2022-01-14 16:36:46', '2022-01-14 16:36:46', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b28b8e7f9e2c4c8f284bd8021026da35', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('b322217867157b2a636a07f31fab2bff', '36f93f7c4afff1d0071864e7020fbfe5', '4', '已结束', 'meetStatus', '已结束', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b3bc5db07200c645b6c1defb46d16b73', '45f03afb7cab252998c9cb9c6b1bc0c6', '2', '51CTO', 'sales_customer_channel', '51CTO', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b4e1a73b576acf110026c1d25dc58fd5', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('b601dd38747ce701eede9de9211356a2', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E8%BD%BB%E5%BA%94%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AE%B2%E8%A7%A3.mp4', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('b6a50f01dd0cd13f8daaf20b3412ecb9', 'b5c521d6c646850d6715c46d8b67f683', '四会议室(二楼)', '四会议室(二楼)', 'meetingPlace', '四会议室(二楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b7fb91083ef434f3da27f34554cb8aeb', 'bdb79cde74266f58bae93ca65f862efa', '12', '渝北区', 'regionType', '渝北区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:12', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b860239e811dc999a554b3823345a773', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('b8b5b1956f123cf808a156655a8d469a', 'fc6c2e78401d14cc7125de54877e4f9f', '面条抄手', '面条抄手', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('b8d81d8de18fd1eb340897e6924df04f', 'fc6c2e78401d14cc7125de54877e4f9f', '小吃零嘴', '小吃零嘴', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ba0c73d345feeecfe2527640a0731885', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-03-24 10:24:59', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('bc39b8cf3897eaee859b34283f38a2da', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=fb7df956a8439b69ff102d818d310473&security=false&key=9bc0eabffc3fa352dbdaf6121e4a65bd', 'list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('bc3d1adbfd2c5a7419eb470745e88589', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('bc4af5015a4c902a9f1240a4a9c881f0', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://jvsoss.bctools.cn/jvs-public/2022/07/42/2022-05-20712350788784918528-%E8%A1%A8%E5%8D%95-%E9%80%BB%E8%BE%91%E8%81%94%E5%8A%A8.mp4', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('bd3a22b65ef0a6017c8c81d8e285c784', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('bde8d1f136b7dcd7e082046894682e6d', 'bdb79cde74266f58bae93ca65f862efa', '20', '璧山区', 'regionType', '璧山区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('bf601879d1eb2ab9722de3d0b4c36e49', 'bdb79cde74266f58bae93ca65f862efa', '24', '开州区', 'regionType', '开州区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('c0380c4d261cf61114dd8525c685f7b6', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6ee425a21459cde0092f2bf31c333974&security=false&key=cb36cb6724853ef5ff941b7378be36de', 'jvs-app-help', 'jvs-ui-help-url', 'JVS快速应用搭建！JVS轻应用', 9, '2022-03-24 10:30:42', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('c05cc05605a7af08b670879587cb59ba', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/1.png', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-02-03 17:38:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('c194f69cd7aa70bee635cb184770cbd5', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('c1f8f20d0e0ca8b43375434b8b501310', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=d659b00ff60a4c9e4d9ca13d429eba60&security=false&key=6e6223607315c1e16d4966478b63905f', 'rule-help', 'jvs-ui-help-url', '逻辑引擎-帮助', 1, '2022-03-24 10:24:58', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('c31ff31ca6a95ce691a335edc76dc7c5', 'df9cfe7d46016f258f7be32dfc84873d', '2', '营业执照', 'licenseType', '营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('c39816cb635c7195dba9338ace2d3582', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E8%BD%BB%E5%BA%94%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AE%B2%E8%A7%A3.mp4', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('c46af6665399bfcf859699651cefcb36', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('c63e9d5f7a72207dd37f883f8073aa71', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('c699533396ed895f620d96d9aa5847c4', 'bdb79cde74266f58bae93ca65f862efa', '9', '北碚区', 'regionType', '北碚区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('c99bae1554262fefb800b0e4e242c383', 'ab83069fc2b945f9ed7ce5529b1a7b79', 'RETURN', '已回传', 'contractStatus', '已回传', 0, '2021-08-28 18:12:10', '2021-08-28 18:12:10', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('c9ba013f3aad2f7351358cbc7bd68159', '8fe320325009e65644c36d1b16574531', '部门审核', '部门审核', 'processTagType', '部门审核', 0, '2021-07-23 10:17:47', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cadbd66282f5dc4ead18097932bf3b82', '0f2920b2ec620be14598ff21dc92b238', 'IT服务', 'IT服务', 'jvsapp', NULL, 3, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cb1ba333ae9fe68bcfae11c523e81d4c', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-02-02 15:32:28', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('cb38b9c5ec6680adc5a6df39f0d97132', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=ab0517f59db48fa5cae97d1b13a52257&security=false&key=fef7572a6078c0e9a85be0e5b1932c82', 'learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('cb58914370879521b39c57d692c78ac9', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('cb82abd0ccff56bd0e218539757fb534', 'fc6c2e78401d14cc7125de54877e4f9f', '炸鸡汉堡', '炸鸡汉堡', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cd47f3596e006b2b0adbb432ba026061', 'bdb79cde74266f58bae93ca65f862efa', '10', '綦江区', 'regionType', '綦江区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cdc8be709706771f83be11580f2841b8', 'dc06f6585bb28fc6fbee85a6335d83ad', '1', '国企', 'companyType', '国企', 0, '2021-08-11 10:07:37', '2021-08-11 10:07:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('cff67407552b1fcbe1965a9a32278912', 'ddf4becc7bdbb0c482bff051166cb54c', 'ON', '已提交', '321', '已提交', 0, '2021-08-28 18:59:52', '2021-08-28 18:59:52', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d03ad816b35c633922833eff0e43c873', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('d0f679a0e0778b3a8286683f38a1f396', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=a095c3478700cb037dfb686566f0bd9f&security=false&key=8e9823c4a7f7a4f4410cf0e6856ea1b3', 'event-auto-help', 'jvs-ui-help-url', '事件集成&自动化-帮助', 6, '2022-03-24 10:24:59', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('d116ee670d4118d3bba5bd9a90bccdeb', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('d3133356088dfa727dc5a0f0562df532', 'ce50a4bc4329b0fd47ff7ee619b2a45b', '1', '福利费', '报销类型', '福利费', 0, '2022-05-27 14:19:11', '2022-05-27 14:19:11', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d434341ed6150704ce3c516ea2a370ef', '7ab996b18d4fa75e8837369f4c071b4a', '1', '农信小贷', 'productType', '农信小贷', 0, '2021-08-11 10:14:39', '2021-08-11 10:14:39', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d4958149e0a596c0af12a2515857b4fe', '3b5b12eab32ccb710807ab3a708851dc', '项目管理', '项目管理', 'knowledge_template_type', 'https://p2.kdvas.wpscdn.cn/kdvcover/file/c/1/f/0/2/5356c73214ec98d6fb392183080aa624.svg', 1, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d527ec617e71a89077857536cb7bf184', '91d9e2833ee1be20f98f09477766a7d4', '2', '证券公司', 'channelType', '证券公司', 0, '2021-08-11 10:25:37', '2021-08-11 10:25:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d5932a342e4323c1b0613ded455521fc', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-02-03 17:38:41', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('d5a509e54563f9a688acfe3d73b1b5ad', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-01-31 15:57:25', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d6d74535daf2229ed0f338d85011e572', 'bdb79cde74266f58bae93ca65f862efa', '11', '大足区', 'regionType', '大足区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d73403c96afcfda97ef4a05b99ad747f', '78a9b6c9cc81d2348ee2034fdf69d34d', '4', '逾期', 'RepayStatus', '逾期', 4, '2021-07-21 11:20:04', '2021-07-21 11:22:16', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('d80d20e995a77c1b34e38c906dccf8d3', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('d944826a561c35a9b6827054fb9f3be7', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=5238ee25ed12f270baf36d1ff8bbefd3&security=false&key=25b2f8dd017a2a8d77ef562e601dcfe4', 'all-formula', 'jvs-ui-help-url', '所有公式-帮助', 4, '2022-03-24 10:24:59', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('d9a2e72d69768d08e9529885c254d1af', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=bbf432c1fa5843c323b91a03fcebc573&security=false&key=83b69b670ff1ff0952f7e5677a029854', 'help-center', 'jvs-ui-help-url', '个人中心-帮助', 0, '2022-03-24 10:24:58', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('d9eaf6c705ee71f27a252c99618e9e15', '2a13720000aa29c7cc890ca05849fb3b', '1', '农村户口', 'residenceType', '农村户口', 0, '2021-07-19 11:26:01', '2021-07-19 11:26:01', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('da362df6261a7333beded0c240437db1', 'df9cfe7d46016f258f7be32dfc84873d', '5', '合伙企业营业执照', 'licenseType', '合伙企业营业执照', 0, '2021-08-11 10:12:12', '2021-08-11 10:12:12', '', '0');
INSERT INTO `sys_dict_item` VALUES ('db4b1a05e4b5af3ac518624af2b4b831', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'create-page-help', 'jvs-ui-help-url', '开始创建一个页面-帮助', 8, '2022-03-24 10:25:13', '2022-08-04 09:33:58', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('dbebdd85563964cf3ee21f011ecf3066', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('dc20be837e246563c8d685fa9de43d3f', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_2', '无保留意见的审核报告', 'auditOpinionTypes', '无保留意见的审核报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('dc8f2d5d769b6a04d23843659f9c151e', '36f93f7c4afff1d0071864e7020fbfe5', '2', '待开启', 'meetStatus', '待开启', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('dcb67c9e7cf6c9f416c82c1f4172f983', 'fc6c2e78401d14cc7125de54877e4f9f', '冒菜串串', '冒菜串串', 'control-label', NULL, 0, '2021-12-19 10:16:37', '2021-12-19 10:16:37', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ddc45686143220668e32bd4466e4d617', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://www.bilibili.com/video/BV18a411P73z?share_source=copy_web&vd_source=9e3aad3e1e478ec43eeb06cf92a89cbe', 'video-form-help', 'jvs-ui-help-url', '表单引擎-帮助', 13, '2022-03-24 11:10:32', '2022-08-08 10:23:48', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('ddd2b13fec34d8cc51d7d98725bed52e', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=26bd7660855ed737a75967e90184819d&security=false&key=965edbc5c9a70ebefb56f4e2d0143984', 'chart-help', 'jvs-ui-help-url', '图表引擎-帮助', 2, '2022-03-24 10:24:59', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('dde30be59d5d2b6c617cac148603a22c', '1948170e01b107463b41895ff2a78a44', 'AUDIT_INFO_4', '否定意见的审核报告', 'auditOpinionTypes', '否定意见的审核报告', 0, '2021-08-28 18:15:56', '2021-08-28 18:15:56', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('de35cb47876ee970f2f25976e10a2038', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '4', 'teamwork-project-cover', '4', 3, '2023-01-31 15:57:25', '2023-02-02 15:32:28', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('e0021a4926623f625523446c062d6dd1', 'bdb79cde74266f58bae93ca65f862efa', '6', '沙坪坝区', 'regionType', '沙坪坝区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e122ece797e1202b5097df4cffc41891', '174c70bf46c1fb4794fecdba21d1275a', '1', '企业客户', 'custmer_type', '企业客户', 1, '2022-04-19 17:11:14', '2022-04-19 17:11:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e1a1ded205583bdb5c93ea02922627b3', '3ed776b1fb5e3a73c134c803074e6ad0', 'https://guanwang-2022.oss-cn-chengdu.aliyuncs.com/%E5%8A%A8%E6%80%81%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B%E8%AE%B2%E8%A7%A3.mp4', 'video-learn-data-model', 'jvs-ui-help-url', '快速创建-了解数据模型-帮助', 5, '2022-03-24 10:24:59', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('e21ced886e03545eefcd024086639e8d', 'bdb79cde74266f58bae93ca65f862efa', '13', '巴南区', 'regionType', '巴南区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:14', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e438a2e7fd9e29372aff8313090b79ce', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-01-31 16:38:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('e4505286d15d9ab60884cc7ffb6d7d32', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=0bdb047fc8107bd5d744f5d62837ea9d&security=false&key=620ddf1d1d023cbb878c4d8dffd89e00', 'flow-help', 'jvs-ui-help-url', '工作流-帮助', 3, '2022-03-24 10:24:59', '2022-08-08 11:59:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('e479b57de0e2ea6be2f270b4c17bf72b', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-screen/report/2022/09/26/2022-09-26758992324716826624-bg2.png', '6', 'teamwork-project-cover', '6', 5, '2023-01-31 15:57:25', '2023-01-31 16:38:39', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('e54334255dd7a6cae8eca9839440ba72', '3b5b12eab32ccb710807ab3a708851dc', '热门推荐', '热门推荐', 'knowledge_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/2/c/7/8/eef9b77b2fde0953c98d205e72bd4a8b.svg', 0, '2022-01-05 16:22:20', '2022-01-05 16:22:20', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e5c6fb62765f0a220d9610061120877f', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=fb7df956a8439b69ff102d818d310473&security=false&key=9bc0eabffc3fa352dbdaf6121e4a65bd', 'list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('e75e44bb2a79eeded1cfdf8d42c5c759', 'add8fed5de4218092b4cea63248f851a', 'http://www.baidu.com/', 'JVS轻应用可以做什么', 'jvs_app_links', '', 0, '2022-01-17 15:44:00', '2022-01-17 15:44:00', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e7c18e2a46b7d82598052176b73f6b3a', 'e113a39dd3d9b0f785b5b54a25b03e96', 'B', 'B', 'customerCreditLevel', 'B', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e7e9bfd6b9a975672aec68ce1acd32ec', 'b5c521d6c646850d6715c46d8b67f683', '三会议室(三楼)', '三会议室(三楼)', 'meetingPlace', '三会议室(三楼)', 0, '2021-08-28 18:16:47', '2021-08-28 18:16:47', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e8c95f73055415e95420024d785c5c43', 'bdb79cde74266f58bae93ca65f862efa', '23', '荣昌区', 'regionType', '荣昌区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('e92d06c904f93cf88966c3588ae733fe', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=fb7df956a8439b69ff102d818d310473&security=false&key=9bc0eabffc3fa352dbdaf6121e4a65bd', 'list-help', 'jvs-ui-help-url', '列表引擎-帮助', 14, '2022-03-24 11:10:32', '2022-08-04 09:35:44', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('eb0ff37d2b5fffb4c7e8ba4afc26f715', '8fe320325009e65644c36d1b16574531', '风控复审', '风控复审', 'processTagType', '风控复审', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('eb70d09865c974618103830c9dfa76d6', 'e113a39dd3d9b0f785b5b54a25b03e96', 'A+', 'A+', 'customerCreditLevel', 'A+', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ec7fde09ec3d7ed383d5e9ae91e83c1c', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2022-08-04 09:32:33', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('ed62ba034d8f3a030d70c79d8fc25149', '0f2920b2ec620be14598ff21dc92b238', '客户管理', '客户管理', 'jvsapp', NULL, 9, '2022-01-20 15:30:28', '2022-01-20 15:30:28', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ede016827329cab9fd3af7519adc94c2', 'e113a39dd3d9b0f785b5b54a25b03e96', 'AAA', 'AAA', 'customerCreditLevel', 'AAA', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ee951217f9827c5ef80d1eba3898f530', 'fbf99c70ff934a58f0ecfb2d4f588c63', '热门推荐', '热门推荐', 'design_template_type', 'https://p1.kdvas.wpscdn.cn/kdvcover/file/b/2/c/7/8/eef9b77b2fde0953c98d205e72bd4a8b.svg', 0, '2022-01-12 16:04:13', '2022-01-12 16:04:13', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('eebd566d49a8dcc3022f9bc184873f25', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '5', 'teamwork-project-cover', '5', 4, '2023-01-31 15:57:25', '2023-02-03 09:13:26', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('ef0ba42b446f86a4e58b0e31e78fc4ec', '614bb08c1dfcab7366a47e1aafca8374', '5ds', '3ws', 'dsvfdvcsxz', '3wd', 0, '2021-11-01 15:33:36', '2021-11-01 15:33:36', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('ef7ae9228fbcc2d023147aa00c8f1fd9', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2023-02-15 14:32:32', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('efd85a23e4d928851250e16f5a67833b', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=61a4ce69b3d935843ca978a151ad8d9b&security=false&key=9ba209811e1fd5873abd428e6acec96c', 'permission-help', 'jvs-ui-help-url', '权限设置-应用管理员-帮助', 7, '2022-03-24 10:25:13', '2022-08-22 10:40:03', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('f0dcf138a62572d27c1ca83fb2856adb', '0f2920b2ec620be14598ff21dc92b238', '办公协作', '办公协作', 'jvsapp', NULL, 2, '2021-12-14 17:45:30', '2021-12-14 17:45:30', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f0eae8de8e6a3c14e46b028dbd8f1e99', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://jvsoss.bctools.cn/jvs-public/2023/01/17/2023-01-17799960697411637248-headImg.png', '2', 'teamwork-project-cover', '2', 1, '2023-01-31 15:57:25', '2023-02-02 14:37:00', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('f31cf13d07b3a5066605de75d1bc119f', '66e8c23dd47467e74c34d723300799cd', '2023/01/28//2023-01-28804022940096958464-proimg1.jpg', '3', 'teamwork-plan-cover', '3', 2, '2023-01-31 10:50:45', '2023-01-31 10:50:45', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f3336a62ad15d5285f9f186c7691e0c9', '6edc54fb28e6468a58ec1cb61d0859ab', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=7169026086108397569&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=443260409%2C3562412549&os=1619154166%2C2313910332&simid=443260409%2C3562412549&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=%E5%9B%BE%E7%89%87&objurl=https%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F1114%2F040221103339%2F210402103339-8-1200.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B33da_z%26e3Bv54AzdH3FkzAzdH3FiizoAzdH3FxipxAzdH3Fndnm8d_b_z%26e3Bip4s&gsm=&islist=&querylist=&dyTabStr=MCwzLDEsNiw0LDIsNSw3LDgsOQ%3D%3D', '1', 'teamwork-project-cover', '1', 0, '2023-01-31 15:37:14', '2023-01-31 16:29:31', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('f46f17b8caa3806180d1e9ec5755ebfd', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=f19f95f1c308023e5db79c7b8ea49626&security=false&key=cb3ffafa0f85ceb445a9e0200e8e7f22', 'jvs-app-create', 'jvs-ui-help-url', 'JVS快速应用搭建！创建应用', 11, '2022-03-24 10:30:42', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('f5114297aa352d5bccfa3dcc3c501af5', 'bdb79cde74266f58bae93ca65f862efa', '8', '南岸区', 'regionType', '南岸区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f57f331df2da9f09afc95d99b67c0383', 'bdb79cde74266f58bae93ca65f862efa', '3', '渝中区', 'regionType', '渝中区', 0, '2021-07-26 14:21:22', '2021-08-11 09:58:15', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f7648b0b708cf807b1f980f52b42d862', '45f03afb7cab252998c9cb9c6b1bc0c6', '3', 'CSDN', 'sales_customer_channel', 'CSDN', 0, '2021-12-20 10:41:57', '2021-12-20 10:41:57', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f7d9526875dc0dd22e7aed3418ce6b4f', '8fe320325009e65644c36d1b16574531', '风控部负责人审批', '风控部负责人审批', 'processTagType', '风控部负责人审批', 0, '2021-07-23 10:20:51', '2021-08-11 09:47:50', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f82803033990d46e26c5a27f0e98d44c', '36f93f7c4afff1d0071864e7020fbfe5', '1', '草稿箱', 'meetStatus', '草稿箱', 0, '2021-08-09 17:37:29', '2021-08-11 09:54:35', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f8bdeb0542d260c98d44890f15ee004c', '004730a6a64238ea7ca5e39e738c48e8', 'http://knowledge.bctools.cn/#/detail/R7vANz《无忧·任务管理产品说明书（V2.1.3）》(文章)', 'event-auto-help', 'jvs-teamwork-ui-help-url', 'http://knowledge.bctools.cn/#/detail/R7vANz《无忧·任务管理产品说明书（V2.1.3）》(文章)', 0, '2022-06-21 10:47:42', '2022-06-21 10:47:42', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('f9f58804d873d0daec179ffa797d92dd', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=6c0df56b6ec9926c2ee5e2ab4d5cf636&security=false&key=745d9aa28e172cc1a94531e8b0941df3', 'jvs-app-view', 'jvs-ui-help-url', 'JVS快速应用搭建！访问应用', 12, '2022-03-24 10:30:42', '2022-08-08 10:15:11', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('fa1083f6ec608ef72921833fe49bd5fe', 'e113a39dd3d9b0f785b5b54a25b03e96', 'A', 'A', 'customerCreditLevel', 'A', 0, '2021-08-28 18:14:33', '2021-08-28 18:14:33', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('faed72cef4e686cd316751ac2909ca68', '6edc54fb28e6468a58ec1cb61d0859ab', 'http://jvsoss.bctools.cn/jvs-public/1/tenantPicture/2023/01/11/2023-01-11797859943720849408-backImg.jpg', '3', 'teamwork-project-cover', '3', 2, '2023-01-31 15:57:25', '2023-02-03 09:13:26', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('fc6c2e78401d14cc7125de54877e4f93', 'fc6c2e78401d14cc7125de54877e4f9d', 'jvs如何是否开源', 'jvs如何是否开源', 'document-frequency', NULL, 0, '2022-01-06 16:57:11', '2022-01-06 17:19:06', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('fc6c2e78401d14cc7125de54877e4f9d', 'fc6c2e78401d14cc7125de54877e4f9d', '如何快速部署jvs项目', '如何快速部署jvs项目', 'document-frequency', NULL, 0, '2022-01-06 16:57:11', '2022-01-06 16:57:32', NULL, '0');
INSERT INTO `sys_dict_item` VALUES ('fd55f55c7eeae8c56295244af1e7837c', '3ed776b1fb5e3a73c134c803074e6ad0', 'http://knowledge.bctools.cn/#/detail?knowledgeId=d728e1ed49b66706fd4f9f7a64349841&type=document_html&id=406eceed44b295821ffa0519025b6b7c&security=false&key=aa288bec7b9d3a2050a6f94c2644c8ad', 'jvs-app-setup', 'jvs-ui-help-url', 'JVS快速应用搭建！搭建应用', 10, '2022-03-24 10:30:42', '2023-02-15 14:31:34', NULL, '1');
INSERT INTO `sys_dict_item` VALUES ('fe7967fc75524aa34f364487512f3631', '0f2920b2ec620be14598ff21dc92b238', '财务报销', '财务报销', 'jvsapp', NULL, 8, '2021-11-23 18:37:00', '2021-11-23 18:37:00', NULL, '0');

-- ----------------------------
-- Table structure for sys_environment_variable
-- ----------------------------
DROP TABLE IF EXISTS `sys_environment_variable`;
CREATE TABLE `sys_environment_variable`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'key',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型，文本，键值对等。',
  `mode` enum('DEV','BETA','GA') CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL DEFAULT 'GA' COMMENT '模式，此模式只在低代码轻应用生效，其它情况只有正式模式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `label`(`label` ASC, `tenant_id` ASC, `mode` ASC) USING BTREE COMMENT '租户标识唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '环境变量' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_environment_variable
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名 ',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桶名',
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名，文件存储的目录',
  `create_time` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `file_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小 单位:字节',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务备注',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '默认' COMMENT '标签,sys_file_lable.label',
  `file_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '占位字段',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `label`(`label` ASC, `file_type` ASC) USING BTREE,
  INDEX `label_2`(`label` ASC) USING BTREE,
  INDEX `tenant`(`tenant_id` ASC) USING BTREE,
  INDEX `create_time`(`create_time` DESC) USING BTREE,
  INDEX `bucket_name`(`bucket_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件统一管理，不包含租户信息，只做文件转发和统一保存管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file_label
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_label`;
CREATE TABLE `sys_file_label`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类标签，与 sys_file 配合使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件分类标签' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_label
-- ----------------------------

-- ----------------------------
-- Table structure for sys_gateway_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_code`;
CREATE TABLE `sys_gateway_code`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `code` int NOT NULL COMMENT '具体错误码确定',
  `msg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '错误信息确定，与代码保持一致',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它信息备注',
  `matching_method` enum('PreMatch','PostMatch','PerfectMatch') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PerfectMatch' COMMENT '匹配方式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `msg`(`msg` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'code异常码转换关系和业务类型区分表-主要用于网关返回给前端 业务返回，默认在feign标准返回给上层,代码示例为new BusinessException(\"这是一个测试异常\")' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_gateway_code
-- ----------------------------
INSERT INTO `sys_gateway_code` VALUES ('1', -2, '登录已失效', '退出的异常code码', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('10', -106, '授权码不正确', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('11', -107, '发布license失败', '发布license失败', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('14', -1, '用户名或密码错误', '用户或密码错误', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('2', -2, 'access token has expired,please reacquire token', '退出的异常code码', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('3', -2, 'Invalid refresh token:', '退出的异常code码', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('4', -100, '授权已过期', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('5', -101, '授权即将到期', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('6', -102, '设备未授权', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('7', -103, 'license验证未通过', 'License是否有效', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('7845460490562bb0161af28f265d54f4', -1, '您选择的代理用户已将任务转交他人,请重新选择', '1', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('8', -104, '应用未授权', 'License是否包含应用', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('9', -105, 'license格式错误', 'License是否包含应用', 'PerfectMatch');
INSERT INTO `sys_gateway_code` VALUES ('a43e2ca844065c61b3429d2cb1c53eec', -108, '当前设计存在正在运行的任务,目前无法运行', '当前设计存在正在运行的任务,目前无法运行', 'PerfectMatch');

-- ----------------------------
-- Table structure for sys_gateway_ignore_encode
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_encode`;
CREATE TABLE `sys_gateway_ignore_encode`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '匹配路径',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网关不加密接口，主要是mgr的地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_gateway_ignore_encode
-- ----------------------------
INSERT INTO `sys_gateway_ignore_encode` VALUES ('1', '/mgr/document/only/office', '获取onlyoffice地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('25acadc29d709003d16ccff32195885e', '/mgr/jvs-auth/upload/**', '上传文件');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('3', '/mgr/document/dcLibrary/file/get/file/byte/**', '获取文件流下载地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('318e3ccb93c9cda18943974b052f3db1', '/mgr/risk/api/projectFlow/call/**', '规则引擎调用');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('3b9a78903cc5e30cdfbd41bce04238b8', '/mgr/teamwork-ultimate/branch/file/only/office/call', '任务协同设计在线编辑回调');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('4', '/mgr/jvs-design/JvsAppTemplate/list', '应用模板列表地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('4f743676ab529aa9a68d9f498322eeab', '/mgr/jvs-data-factory/monitoring/get/queue/task/**', '数据集获取执行队列');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('5', '/mgr/jvs-design/JvsAppTemplate/detail/**', '应用获取详情地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('50a90c7cd3aebbf4ed8e6705264fe001', '/mgr/automation/api/**', '独立逻辑调用返回');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('588828b9c9a6df9720754e827c3a81c6', '/mgr/teamwork-ultimate//project/folder/file/only/office/call', '任务文库文件编辑回调');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('58eb496179b6c5333d21f5c16eeee7cf', '/mgr/risk/**', '规则引擎开发');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('6', '/mgr/jvs-design/JvsAppTemplate/download/**', '应用下载地址');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('67bbfb56c22c35240e4f7dfff46b71ff', '/mgr/document/upload/jvs-document-file', '文档系统工具菜单上传文件');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('7b135bc4a70327e6a7da62fd7936cb85', '/mgr/data-remote/api/run/**', '数据服务调用');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('7cb35c3ea95ce7b1d6eb56749d88f908', '/mgr/document/dcLibrary/document/search', '文档es内容过多 取消加解密');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('8ea2816412e76451fc473012bb0d0907', '/mgr/demo/**', 'demo示例');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('8ff719496068d3ce2f4d365e4d3b1db7', '/mgr/jvs-data-factory/api/run/**', '数据服务');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('968ab719d54f7a41969e62f2d32f8133', '/mgr/risk-component/api', '规则引擎测试');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('af829512ce43664380b301427af4e740', '/mgr/jvs-data-factory/data/execute/source/preview/**', '数据集-获取字段');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('b597a5565b9d127ebc5229a836cd4fdd', '/mgr/jvs-data-factory/jvs/data/factory/base/**', '获取数据集详细信息-可能会存在用户设计数据过大 加载过慢');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('bf853d8b1fef469cfe72c757fb19841d', '/mgr/jvs-data-factory/data/execute/source/preview/**', '数据集设计过程中获取数据');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('c1a6cccf0df28db241b5fcdc8f8777d9', '/mgr/jvs-auth/uploadPart/**', '分片上传');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('ca2ed1cb6c497c157ae702e656b7af03', '/mgr/jvs-design/api/**', '逻辑引擎API');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('ee267d8c5d6c4a77fdbd27c6a95d414f', '/mgr/teamwork-ultimate//project/master/annex/only/office/call', '任务附件编辑回调');
INSERT INTO `sys_gateway_ignore_encode` VALUES ('ff56bb89d763c1cdb538b1a4e0429dad', '/mgr/data-screen/**', 'lb://data-screen-mgr');

-- ----------------------------
-- Table structure for sys_gateway_ignore_ip
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_ip`;
CREATE TABLE `sys_gateway_ignore_ip`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '匹配 Ip',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网关不加密ip地址，主要是mgr的地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_gateway_ignore_ip
-- ----------------------------

-- ----------------------------
-- Table structure for sys_gateway_ignore_path
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_path`;
CREATE TABLE `sys_gateway_ignore_path`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务路径',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网关权限忽略配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_gateway_ignore_path
-- ----------------------------
INSERT INTO `sys_gateway_ignore_path` VALUES ('0d358b2d62bd63435cfc85cb3b5a4398', '/mgr/iot-core/agents/*/download', '物联网-驱动代理包下载');
INSERT INTO `sys_gateway_ignore_path` VALUES ('10', '/im/**', 'IM消息');
INSERT INTO `sys_gateway_ignore_path` VALUES ('11', '/auth/**', '认证授权地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('112', '/gateway/**', '多关消息注册方法');
INSERT INTO `sys_gateway_ignore_path` VALUES ('145', '/api/**', '默认api接口开放地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('146', '/oauth/api/dict/list/*', '系统字典查询接口');
INSERT INTO `sys_gateway_ignore_path` VALUES ('148', '/websocket/**', '邮件Websocket放开');
INSERT INTO `sys_gateway_ignore_path` VALUES ('155', '/inside/**', '任务socket');
INSERT INTO `sys_gateway_ignore_path` VALUES ('19e121adc9bb387d274fc86d0086ad82', '/mgr/document/dcLibrary/comment/page/**', '知识库评论用于分享的文档获取');
INSERT INTO `sys_gateway_ignore_path` VALUES ('1f850ac1b510d9f70ac4b77c6dda2282', '/mgr/jvs-design/api/**', '逻辑引擎api');
INSERT INTO `sys_gateway_ignore_path` VALUES ('24aa9f29a7732df1b7f062f82eb3854f', '/mgr/document/only/office/**', '知识库onlyoffice回调');
INSERT INTO `sys_gateway_ignore_path` VALUES ('2cefe50cf06857d6e1221115db9bb57c', '/mgr/document/dcLibrary/info/**', '知识库信息获取');
INSERT INTO `sys_gateway_ignore_path` VALUES ('3035687c6f3dec5de785521625ecd7d6', '/mgr/jvs-data-factory/api/run/**', 'BI数据服务调用放行');
INSERT INTO `sys_gateway_ignore_path` VALUES ('443b0585cf846f6f0c36dcd231d33066', '/mgr/jvs-chart/share/link/no/auth/**', '图表分享链接不做token校验');
INSERT INTO `sys_gateway_ignore_path` VALUES ('5bb70df1568114bb987e6276db9c8801', '/mgr/iot-core/drivers/*/download', '物联网-驱动包下载');
INSERT INTO `sys_gateway_ignore_path` VALUES ('770cf9c9e367db7fbc0ced03d434f01e', '/mgr/message/message/utils/api/batch/send', '批量消息发送');
INSERT INTO `sys_gateway_ignore_path` VALUES ('77d5c6ca5b71ddffbb3d2699fac5d402', '/mgr/iot-core/agents/*/logs/upload/*', '物联网-驱动代理日志文件上传');
INSERT INTO `sys_gateway_ignore_path` VALUES ('8792b6a47b28006b114c2e7f2085ffed', '/flow/exec/log/**', '规则日志推送');
INSERT INTO `sys_gateway_ignore_path` VALUES ('8eb6ccd391f579f7856342ec63471ab3', '/mgr/jvs-design/screen/use/**', '大屏部署使用地址');
INSERT INTO `sys_gateway_ignore_path` VALUES ('99de4eedcc9a02da45b153436eaa9974', '/projectFlow/list', '规则引擎');
INSERT INTO `sys_gateway_ignore_path` VALUES ('aa04696e768e89ff3876592205efa8f8', '/mgr/document/no/auth/**', '知识库不需要权限认证的接口');
INSERT INTO `sys_gateway_ignore_path` VALUES ('ad76ff9aedd94f8ce4524a83da58ff61', '/mgr/document/dcLibrary/share/**', '知识库分享校验');
INSERT INTO `sys_gateway_ignore_path` VALUES ('af725280127618f945075419971e4566', '/mgr/document/dcLibrary/like/list', '知识库点赞信息获取');
INSERT INTO `sys_gateway_ignore_path` VALUES ('be06eaa8bf2aa12eef29a481cdd133c1', '/mgr/document/dcLibrary/file/preview/url/**', '文件预览内容获取用于分享的文档');
INSERT INTO `sys_gateway_ignore_path` VALUES ('cd1b4cbce402d05f9587364f92532ba8', '/task/server/endpoint/**', '任务管理-任务');
INSERT INTO `sys_gateway_ignore_path` VALUES ('d1c6ea96cb3849c99f515c4e3c8749cc', '/mgr/data-remote/api/run/**', '数据服务放行');
INSERT INTO `sys_gateway_ignore_path` VALUES ('d53373b35674ec51e92151536cc8c3a4', '/mgr/document/dcLibrary/document/read/total/**', '知识库已读次数');
INSERT INTO `sys_gateway_ignore_path` VALUES ('d7297dff1d58101027bb7fe05282e809', '/mgr/iot-core/driver-instances/*/logs/upload/*', '物联网-驱动实例日志文件上传');
INSERT INTO `sys_gateway_ignore_path` VALUES ('e4589825b89ebe6edb98a85489947739', '/mgr/automation/api/**', '独立版逻辑引擎api');
INSERT INTO `sys_gateway_ignore_path` VALUES ('e558647d620844c8f7016840ac439ae9', '/mgr/risk/api/**', '决策流api接口');
INSERT INTO `sys_gateway_ignore_path` VALUES ('f09653306bb01d4638a603f6e669b328', '/mgr/document/link/**', '文档分享数据获取');
INSERT INTO `sys_gateway_ignore_path` VALUES ('fc6658c99e4e0e58aa46a234bab05041', '/mgr/data-screen/share/link/no/auth/**', '分享链接不做校验');
INSERT INTO `sys_gateway_ignore_path` VALUES ('fc79735bfd10c3263553cac44ca3525e', '/mgr/mail/websocket', '邮件websocket');
INSERT INTO `sys_gateway_ignore_path` VALUES ('fd0c33e54c4ec321ee4c6a0c7f99a870', '/mgr/document/dcLibrary/file/get/url/**', '其他文档预览地址');

-- ----------------------------
-- Table structure for sys_gateway_ignore_xss
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_ignore_xss`;
CREATE TABLE `sys_gateway_ignore_xss`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Xss放开地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_gateway_ignore_xss
-- ----------------------------
INSERT INTO `sys_gateway_ignore_xss` VALUES ('0a7938b4f1adac5bf5a5d62bd2b1a05f', '/***', '全部放行');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('1', '/auth/**', '授权');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('10', '/mgr/jvs-auth/role/role/**', '角色权限赋予');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('11', '/mgr/document/dcLibrary/save/content/**', '文档保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('112', '/mgr/document/dcLibrary', '文档添加成员');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('12', '/mgr/jvs-design/dynamic/data/**', '列表设计保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('145', '/mgr/jvs-design/data/model/data/**', '数据模型保存');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('146', '/mgr/document/upload/jvs-knowledge', '知识库上传图片');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('148', '/mgr/jvs-design/form/design/check', '表单内容校验');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('155', '/mgr/jvs-design/page/design/update/**', '表单、工作流、列表页更新');
INSERT INTO `sys_gateway_ignore_xss` VALUES ('ed1c6fb291397dc29ca6b88e602f16ab', '/**', 'ces');

-- ----------------------------
-- Table structure for sys_gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_gateway_route`;
CREATE TABLE `sys_gateway_route`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网关路由表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_gateway_route
-- ----------------------------
INSERT INTO `sys_gateway_route` VALUES ('aps', '/mgr/jvs-aps/**', 'aps', 'lb://jvs-aps-mgr');
INSERT INTO `sys_gateway_route` VALUES ('auth', '/auth/**', '权限', 'lb://jvs-auth');
INSERT INTO `sys_gateway_route` VALUES ('auth-mgr', '/mgr/jvs-auth/**', '权限', 'lb://jvs-auth-mgr');
INSERT INTO `sys_gateway_route` VALUES ('automation', '/mgr/jvs-automation/**', '独立逻辑', 'lb://jvs-automation-mgr');
INSERT INTO `sys_gateway_route` VALUES ('automation-alone', '/mgr/automation/**', '逻辑', 'lb://jvs-automation-mgr');
INSERT INTO `sys_gateway_route` VALUES ('bi', '/mgr/bi/**', 'bi公共服务', 'lb://jvs-bi-mgr');
INSERT INTO `sys_gateway_route` VALUES ('chart', '/mgr/jvs-chart/**', '图表', 'lb://jvs-chart-mgr');
INSERT INTO `sys_gateway_route` VALUES ('data-factory', '/mgr/jvs-data-factory/**', '智仓', 'lb://jvs-data-factory-mgr');
INSERT INTO `sys_gateway_route` VALUES ('data-remote', '/mgr/data-remote/**', '数据服务', 'lb://jvs-data-remote-mgr');
INSERT INTO `sys_gateway_route` VALUES ('data-source-old', '/mgr/jvs-data-source-old/**', '旧版数据源', 'lb://jvs-data-source-old-mgr');
INSERT INTO `sys_gateway_route` VALUES ('demo', '/mgr/jvs-demo/**', 'demo', 'lb://jvs-demo-mgr');
INSERT INTO `sys_gateway_route` VALUES ('design-mgr', '/mgr/jvs-design/**', '低代码', 'lb://jvs-design-mgr');
INSERT INTO `sys_gateway_route` VALUES ('document', '/mgr/document/**', '知识库', 'lb://document-mgr');
INSERT INTO `sys_gateway_route` VALUES ('dynamic', '/mgr/dynamic-index/**', '动态首页', 'lb://dynamic-index-mgr');
INSERT INTO `sys_gateway_route` VALUES ('im', '/im/**', 'im', 'lb:ws://im');
INSERT INTO `sys_gateway_route` VALUES ('iot', '/mgr/iot-core/**', '物联网-核心', 'lb://jvs-iot-core-mgr');
INSERT INTO `sys_gateway_route` VALUES ('iot-automation', '/mgr/iot-automation/**', '物联网-联动逻辑', 'lb://jvs-iot-automation-mgr');
INSERT INTO `sys_gateway_route` VALUES ('jvs-data-factory-remote', '/mgr/jvs-data-fatory-remote/**', '数据服务', 'lb://jvs-data-fatory-remote-mgr');
INSERT INTO `sys_gateway_route` VALUES ('jvs-data-report-mgr', '/mgr/jvs-data-report/**', '报表', 'lb://jvs-data-report-mgr');
INSERT INTO `sys_gateway_route` VALUES ('jvs-data-source', '/mgr/jvs-data-source/**', '公共的数据源管理', 'lb://jvs-data-source-mgr');
INSERT INTO `sys_gateway_route` VALUES ('jvs-demo', '/mgr/demo/**', 'demo', 'lb://jvs-demo');
INSERT INTO `sys_gateway_route` VALUES ('macbert', '/api/macbert', '识别', 'lb://macbert-java-onnx');
INSERT INTO `sys_gateway_route` VALUES ('mail', '/websocket/**', 'teamwork-task', 'lb:ws://mail-mgr');
INSERT INTO `sys_gateway_route` VALUES ('mailMgr', '/mgr/mail/**', '邮筒', 'lb://mail-mgr');
INSERT INTO `sys_gateway_route` VALUES ('ot', '/api/ot-server', 'ot', 'ws://ot-server:8080');
INSERT INTO `sys_gateway_route` VALUES ('plugins', '/api/jvs-knowledge-plugins/config.js', 'plugins', 'lb://document-mgr');
INSERT INTO `sys_gateway_route` VALUES ('push', '/mgr/message-push/**', 'jvs-message-push', 'lb://message-push-mgr');
INSERT INTO `sys_gateway_route` VALUES ('risk', '/mgr/risk/**', 'risk', 'lb://risk-mgr');
INSERT INTO `sys_gateway_route` VALUES ('risk-component', '/mgr/risk-component/**', '规则引擎拓展接口', 'lb://risk-component-mgr');
INSERT INTO `sys_gateway_route` VALUES ('risk-data-source', '/mgr/risk-data-source/**', '规则引擎数据源', 'lb://risk-data-source-mgr');
INSERT INTO `sys_gateway_route` VALUES ('risk-info-sync', '/risk/info/sync', '信息同步', 'lb:ws://risk-mgr');
INSERT INTO `sys_gateway_route` VALUES ('riskFlowLog', '/flow/exec/log/**', '日志推送', 'lb:ws://risk-mgr');
INSERT INTO `sys_gateway_route` VALUES ('ruleapi', '/rule/openapi/**', '逻辑引擎备注', 'lb://jvs-design-mgr');
INSERT INTO `sys_gateway_route` VALUES ('screen', '/mgr/data-screen/**', '大屏', 'lb://data-screen-mgr');
INSERT INTO `sys_gateway_route` VALUES ('teamwork', '/inside/**', 'teamwork', 'lb:ws://message-push-mgr');
INSERT INTO `sys_gateway_route` VALUES ('teamwork-task', '/task/server/endpoint/**', 'teamwork-task', 'lb:ws://teamwork-ultimate-mgr');
INSERT INTO `sys_gateway_route` VALUES ('teamworkMgr', '/mgr/teamwork-ultimate/**', '企业计划', 'lb://teamwork-ultimate-mgr');

-- ----------------------------
-- Table structure for sys_help
-- ----------------------------
DROP TABLE IF EXISTS `sys_help`;
CREATE TABLE `sys_help`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用ID',
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端名称',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帮助Key',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频还是连接，直接输入中文即可,\r\n\r\n设计器\r\n     目录\r\n         组件\r\n             视频\r\n             链接\r\n             文本\r\n \r\n\r\n视频\r\n链接\r\n文本\r\n ',
  `parent_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1' COMMENT '上级ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`label` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '所有终端的帮助入口' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_help
-- ----------------------------

-- ----------------------------
-- Table structure for sys_index
-- ----------------------------
DROP TABLE IF EXISTS `sys_index`;
CREATE TABLE `sys_index`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `view_json` json NULL COMMENT '设计内容',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户首页配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_index
-- ----------------------------

-- ----------------------------
-- Table structure for sys_index_applet
-- ----------------------------
DROP TABLE IF EXISTS `sys_index_applet`;
CREATE TABLE `sys_index_applet`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'id',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `applet_json` json NULL COMMENT '自定义的快速入口页',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小程序用户自定义快速入口' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_index_applet
-- ----------------------------

-- ----------------------------
-- Table structure for sys_index_component
-- ----------------------------
DROP TABLE IF EXISTS `sys_index_component`;
CREATE TABLE `sys_index_component`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `view_json` json NULL COMMENT '设计内容',
  `user_level` json NULL COMMENT '用户等级',
  `tenant_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  `type` enum('卡片','图片','数字','列表页','公告','日历','项目导航','模块导航','消息通知','在线客服','流程申请','待办任务','分析占比图','折线趋势图','百分比趋势图') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `data_permission` tinyint(1) NULL DEFAULT NULL COMMENT '启用数据权限',
  `jvs_app_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id，用于应用迁移时组件也需要迁移',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页组件配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_index_component
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '租户ID默认1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `business_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名',
  `function_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能名',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `method_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类名',
  `thread_user` json NULL COMMENT '当前用户对象JSON',
  `parameters` json NULL COMMENT '请求参数对象JSON',
  `tid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT 'tid',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `consuming_time` int NULL DEFAULT NULL COMMENT '耗时',
  `return_obj` json NULL COMMENT '返回对象JSON',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '返回状态是否是成功',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求IP地址',
  `elements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常数据JSON',
  `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常消息数据',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境参数',
  `api` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'api地址',
  `type` tinyint NULL DEFAULT 1 COMMENT '日志类型:1-AOP拦截,2-过程中的日志,3-自定义日志',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '用户名称',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '租户id',
  `operation_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '操作类型',
  `client_id` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '--' COMMENT '终端',
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端名称',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `handle_user` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `start_time`(`start_time` ASC) USING BTREE,
  INDEX `client_id`(`client_id`(191) ASC) USING BTREE,
  INDEX `function_name`(`function_name` ASC) USING BTREE,
  INDEX `tid`(`tid` ASC) USING BTREE,
  INDEX `tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请求日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_rules
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_rules`;
CREATE TABLE `sys_login_rules`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时间',
  `status` tinyint NULL DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Ip 登录规则' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_rules
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `send_type` enum('sms','email','interior','DING_H5','WECHAT_MP_MESSAGE','WX_ENTERPRISE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送类型\\短信\\邮件\\站内信',
  `send_message_type` enum('broadcast','warning','notification','system','business') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型： 广播消息\\警告消息\\通知消息\\系统消息\\业务消息',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 2 COMMENT '发送状态(0失败;1成功;2未发送;3发送中)',
  `send_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息成功发送次数',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息来源',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送内容,如果是邮件和站内信，支持html标签功能',
  `recipients` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '批量收件人,最多500个，多余500会切分，可能是用户id，可能是用户手机号',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送返回信息,邮件和短信发送的消息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `extension` json NULL COMMENT '用于业务扩展字段方便排查问题',
  `business_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务id',
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务系统,如果业务系统需要发送站内信，直接使用mq-core进行发送即可查收',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `template_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板id值',
  `template_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模板数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息发送日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oauth_other
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_other`;
CREATE TABLE `sys_oauth_other`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台名称 用来区分不同平台的帐号',
  `authorize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权的api',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获取accessToken的api',
  `user_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获取用户信息的api',
  `client_id` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'clientid',
  `client_secret` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'secret',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回调地址,需要和三方配置时一致.如:http://10.0.0.17:10000/auth/just/callbackUrl?type=CUSTOMGITLAB',
  `ignore_check_state` tinyint(1) NULL DEFAULT 1 COMMENT '是否校验state',
  `type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型,会根据类型进行处理',
  `login_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆地址 , 三方回调首先会回调后台 redirect_url  http://10.0.0.17:10000/auth/just/callbackUrl?type=CUSTOMGITLAB',
  `filed_json` json NULL COMMENT '用户字段json说明',
  `dept_json` json NULL COMMENT '部门结构json',
  `model` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模式, code模式 oauth2模式',
  `dept_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步部门接口',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `icon_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `enable_default` tinyint(1) NULL DEFAULT NULL COMMENT '是否是默认登录方式',
  `extension_json` json NULL COMMENT '扩展字段',
  `logout_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退出地址',
  `pull_user_url_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步用户的地址',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限范围',
  `parameter_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `url_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '三方应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oauth_other
-- ----------------------------

-- ----------------------------
-- Table structure for sys_opinion
-- ----------------------------
DROP TABLE IF EXISTS `sys_opinion`;
CREATE TABLE `sys_opinion`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `create_by_id` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_by_head_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_opinion
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permission` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源标识(随机生成-建议使用中文名称进行拼音生成以_分割) 如果添加了忽略字段集，则直接放开即可,如果删除了，会生成uuid进行占位',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源说明',
  `api` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `type` enum('tenant','platform') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类,主要用于区分平台级资源, 或者是租户级资源,平台级资源,包含租户管理等操作.',
  `group_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述解释',
  `method_type` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `client_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '基础框架' COMMENT '客户端名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permission`(`permission` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 468 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源数据表，用于统计所有项目的请求地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 'jvs_base', '基本信息', '/mgr/jvs-auth/tenant/admin/base', 'tenant', '基本信息', 1, '平台管理', 'get', '后台');
INSERT INTO `sys_permission` VALUES (2, 'jvs_group_add', '新增团队', '/mgr/jvs-auth/user/group', 'tenant', '团队管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (3, 'jvs_group_delete', '删除团队', '/mgr/jvs-auth/user/group/{id}', 'tenant', '团队管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (4, 'jvs_group_add_user', '添加团队人员', '/mgr/jvs-auth/user/group/user/{groupId}', 'tenant', '团队管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (5, 'jvs_group_edit', '编辑团队', '/mgr/jvs-auth/user/group', 'tenant', '团队管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (6, 'jvs_group_delete_user', '移除人员', '/mgr/jvs-auth/user/group/user/{userId}/{groupId}', 'tenant', '团队管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (11, 'jvs_platform', '平台信息', '/mgr/jvs-auth/platform/info', 'platform', '平台信息', NULL, '平台管理', 'get', '平台');
INSERT INTO `sys_permission` VALUES (12, 'jvs_tenant_add', '新增租户', '/mgr/jvs-auth/platform/tenant', 'platform', '租户管理', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (13, 'jvs_tenant_edit', '编辑租户', '/mgr/jvs-auth/platform/tenant/info', 'platform', '租户管理', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (14, 'jvs_tenant_disabled', '禁用租户', '/mgr/jvs-auth/platform/tenant/enable/{id}/{state}', 'platform', '租户管理', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (15, 'jvs_tenant_delete', '删除租户', '/mgr/jvs-auth/platform/tenant/{id}', 'platform', '租户管理', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (16, 'jvs_tenant_enable', '启用租户', '/mgr/jvs-auth/platform/tenant/enable/{id}/{state}', 'platform', '租户管理', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (17, 'jvs_tenant', '查看租户', '/mgr/jvs-auth/platform/tenant/page', 'platform', '租户管理', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (18, 'jvs_platform_login_log', '平台登陆日志', '/mgr/jvs-auth/platform/login/log/page', 'platform', '登陆日志', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (19, 'jvs_platform_operation_log', '平台操作日志', '/mgr/jvs-auth/platform/request/page', 'platform', '操作日志', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (20, 'jvs_opinion_page', '移动端意见反馈', '/mgr/jvs-auth/platform/opinion/page', 'platform', '移动端意见反馈', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (22, 'jvs_rule_extend', '自动化扩展', '', 'tenant', '自动化扩展', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (23, 'jvs_rule_extend_add', '新增自动化扩展', '/mgr/jvs-design/platform/rule/extend', 'tenant', '自动化扩展', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (24, 'jvs_rule_extend_delete', '删除自动化扩展', '/mgr/jvs-design/platform/rule/extend/{id}', 'tenant', '自动化扩展', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (25, 'jvs_rule_extend_edit', '修改自动化扩展', '/mgr/jvs-design/platform/rule/extend', 'tenant', '自动化扩展', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (26, 'jvs_apply', '终端管理查看', '/mgr/jvs-auth/platform/apply/page', 'platform', '终端管理', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (27, 'jvs_apply_add', '新增终端管理', '/mgr/jvs-auth/platform/apply/save', 'platform', '终端管理', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (28, 'jvs_apply_edit', '修改终端管理', '/mgr/jvs-auth/platform/apply', 'platform', '终端管理', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (29, 'jvs_apply_delete', '删除终端管理', '/mgr/jvs-auth/platform/apply/{id}', 'platform', '终端管理', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (30, 'jvs_apply_enable', '启用终端管理', '/mgr/jvs-auth/platform/apply/enable/{id}', 'platform', '终端管理', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (31, 'jvs_apply_disabled', '禁用终端管理', '/mgr/jvs-auth/platform/apply/disabled/{id}', 'platform', '终端管理', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (32, 'jvs_app_tree', '应用字典查看', '', 'platform', '应用字典', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (33, 'jvs_app_tree_add', '新增应用字典', '/mgr/jvs-design/platform/app/tree', 'platform', '应用字典', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (34, 'jvs_app_tree_delete', '删除应用字典', '/mgr/jvs-design/platform/app/tree/{id}', 'platform', '应用字典', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (35, 'jvs_app_tree_edit', '修改应用字典', '/mgr/jvs-design/platform/app/tree', 'platform', '应用字典', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (36, 'jvs_app_tree_export', '导出应用字典', '/mgr/jvs-design/platform/app/tree/export', 'platform', '应用字典', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (37, 'jvs_mobile_base_config', '移动端基础配置', '/mgr/jvs-auth/tenant/admin/base/config/{type}', 'platform', '移动端基础配置', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (38, 'jvs_gateway_route', '网关路由表查看', '/mgr/jvs-auth/platform/GatewayRoutePo/page', 'platform', '网关路由表', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (39, 'jvs_gateway_route_add', '新增网关路由表', '/mgr/jvs-auth/platform/GatewayRoutePo/save', 'platform', '网关路由表', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (40, 'jvs_gateway_route_delete', '删除网关路由表', '/mgr/jvs-auth/platform/GatewayRoutePo/del/{id}', 'platform', '网关路由表', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (41, 'jvs_gateway_route_edit', '修改网关路由表', '/mgr/jvs-auth/platform/GatewayRoutePo/edit', 'platform', '网关路由表', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (42, 'jvs_gateway_route_refresh', '刷新网关路由表', '/mgr/jvs-auth/platform/GatewayRoutePo/refresh', 'platform', '网关路由表', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (59, 'jvs_gateway_encode', '网关加密忽略查看 ', '/mgr/jvs-auth/platform/GatewayEncode/page', 'platform', '网关加密忽略', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (60, 'jvs_gateway_encode_add', '新增网关加密忽略', '/mgr/jvs-auth/platform/GatewayEncode/save', 'platform', '网关加密忽略', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (61, 'jvs_gateway_encode_edit', '修改网关加密忽略', '/mgr/jvs-auth/platform/GatewayEncode/edit', 'platform', '网关加密忽略', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (62, 'jvs_gateway_encode_delete', '删除网关加密忽略', '/mgr/jvs-auth/platform/GatewayEncode/del/{id}', 'platform', '网关加密忽略', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (63, 'jvs_gateway_encode_refresh', '刷新网关加密忽略', '/mgr/jvs-auth/platform/GatewayEncode/refresh', 'platform', '网关加密忽略', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (65, 'jvs_gateway_ip', '网关加密忽略Ip查看 ', '/mgr/jvs-auth/platform/GatewayIgnoreIp/page', 'platform', '网关加密忽略Ip', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (66, 'jvs_gateway_ip_add', '新增网关加密忽略Ip', '/mgr/jvs-auth/platform/GatewayIgnoreIp/save', 'platform', '网关加密忽略Ip', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (67, 'jvs_gateway_ip_edit', '修改网关加密忽略Ip', '/mgr/jvs-auth/platform/GatewayIgnoreIp/edit', 'platform', '网关加密忽略Ip', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (68, 'jvs_gateway_ip_delete', '删除网关加密忽略Ip', '/mgr/jvs-auth/platform/GatewayIgnoreIp/del/{id}', 'platform', '网关加密忽略Ip', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (69, 'jvs_gateway_ip_refresh', '刷新网关加密忽略Ip ', '/mgr/jvs-auth/platform/GatewayIgnoreIp/refresh', 'platform', '网关加密忽略Ip', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (70, 'jvs_gateway_xss', '网关xss忽略查看 ', '/mgr/jvs-auth/platform/GatewayXss/page', 'platform', '网关xss忽略', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (71, 'jvs_gateway_xss_add', '新增网关xss忽略', '/mgr/jvs-auth/platform/GatewayXss/save', 'platform', '网关xss忽略', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (72, 'jvs_gateway_xss_edit', '修改网关xss忽略', '/mgr/jvs-auth/platform/GatewayXss/edit', 'platform', '网关xss忽略', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (73, 'jvs_gateway_xss_delete', '删除网关xss忽略', '/mgr/jvs-auth/platform/GatewayXss/del/{id}', 'platform', '网关xss忽略', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (74, 'jvs_gateway_xss_refresh', '刷新网关xss忽略', '/mgr/jvs-auth/platform/GatewayXss/refresh', 'platform', '网关xss忽略', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (75, 'jvs_gateway_code', '网关错误码查看 ', '/mgr/jvs-auth/platform/GatewayCodePo/page', 'platform', '网关错误码', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (76, 'jvs_gateway_code_add', '新增网关错误码', '/mgr/jvs-auth/platform/GatewayCodePo/save', 'platform', '网关错误码', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (77, 'jvs_gateway_code_delete', '删除网关错误码', '/mgr/jvs-auth/platform/GatewayCodePo/del/{id}', 'platform', '网关错误码', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (78, 'jvs_gateway_code_edit', '修改网关错误码', '/mgr/jvs-auth/platform/GatewayCodePo/edit', 'platform', '网关错误码', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (79, 'jvs_gateway_code_refresh', '刷新网关错误码', '/mgr/jvs-auth/platform/GatewayCodePo/refresh', 'platform', '网关错误码', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (80, 'jvs_app_add', '新增空白应用', '/mgr/jvs-design/base/JvsApp/save', 'tenant', '轻应用管理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (83, 'jvs_app_import', '导入应用', '/mgr/jvs-design/base/JvsAppTemplate/fileUpload/app', 'tenant', '轻应用管理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (84, 'jvs_app_deploy_template', '发布到模板市场', '/mgr/jvs-design/base/JvsAppTemplate/deploy', 'platform', '轻应用管理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (86, 'jvs_app_template_add', '新增模板 ', '/mgr/jvs-design/base/JvsAppTemplate/deploy/primitive', 'platform', '轻应用模板管理', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (87, 'jvs_app_template_delete', '删除模板', '/mgr/jvs-design/base/JvsAppTemplate/del/{templateId}', 'platform', '轻应用模板管理', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (88, 'jvs_app_template_down', '下载模板', '/mgr/jvs-design/base/JvsAppTemplate/download/{templateId}', 'platform', '轻应用模板管理', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (89, 'jvs_app_template_edit', '编辑模板', '/mgr/jvs-design/base/JvsAppTemplate', 'platform', '轻应用模板管理', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (90, 'jvs_app', '应用中心查看', '', 'tenant', '轻应用管理', NULL, NULL, 'get', '基础框架');
INSERT INTO `sys_permission` VALUES (91, 'jvs_user_add', '添加用户 ', '/mgr/jvs-auth/user/save', 'tenant', '用户管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (92, 'jvs_user_delete', '删除用户', '/mgr/jvs-auth/user/users/disabled/{userId}', 'tenant', '用户管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (93, 'jvs_user_edit', '修改用户', '', 'tenant', '用户管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (94, 'jvs_user_password', '修改密码', '/mgr/jvs-auth/user/users/update/password/{userId}', 'platform', '用户管理', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (95, 'jvs_user', '用户管理查看', '', 'tenant', '用户管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (96, 'jvs_user_invite', '邀请用户 ', '/mgr/jvs-auth/user/get/invite', 'tenant', '用户管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (98, 'jvs_user_import', '导入用户', '/mgr/jvs-auth/user/import', 'tenant', '用户管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (99, 'jvs_user_export', '导出模板 ', '/mgr/jvs-auth/user/template/excel/download', 'tenant', '用户管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (100, 'jvs_user_sync_dept', '同步三方组织', '/mgr/jvs-auth/dept/pull/{type}', 'tenant', '用户管理', NULL, '(钉钉、企微、其它三方)', 'post', '后台');
INSERT INTO `sys_permission` VALUES (101, 'jvs_dept_add', '添加部门/公司', '/mgr/jvs-auth/dept/save', 'tenant', '用户管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (106, 'jvs_dept_edit', '修改部门 ', '/mgr/jvs-auth/dept', 'tenant', '用户管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (107, 'jvs_dept_delete', '删除部门', '/mgr/jvs-auth/dept/{deptId}', 'tenant', '用户管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (111, 'jvs_role', '角色管理查看 ', '/mgr/jvs-auth/role/user', 'tenant', '角色管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (112, 'jvs_role_add', '新增角色', '/mgr/jvs-auth/role/save', 'tenant', '角色管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (113, 'jvs_role_delete', '删除角色', '/mgr/jvs-auth/role/{id}', 'tenant', '角色管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (114, 'jvs_role_edit', '修改角色', '/mgr/jvs-auth/role/update', 'tenant', '角色管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (116, 'jvs_role_add_user', '添加人员', '/mgr/jvs-auth/role/user/{roleId}', 'tenant', '角色管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (117, 'jvs_role_delete_user', '移除人员', '/mgr/jvs-auth/role/user/{roleId}/{userId}', 'tenant', '角色管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (118, 'jvs_permission_add', '添加资源', '/mgr/jvs-auth/permission', 'platform', '角色管理', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (119, 'jvs_role_user_examine', '用户审核 ', '/mgr/jvs-auth/invite/page', 'tenant', '用户审核', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (121, 'jvs_job', '岗位管理查看 ', '/mgr/jvs-auth/job/users', 'tenant', '岗位管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (122, 'jvs_job_add', '添加岗位', '/mgr/jvs-auth/job', 'tenant', '岗位管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (123, 'jvs_job_edit', '修改岗位', '/mgr/jvs-auth/job', 'tenant', '岗位管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (124, 'jvs_job_delete', '删除岗位', '/mgr/jvs-auth/job/{jobId}', 'tenant', '岗位管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (125, 'jvs_job_add_user', '添加岗位人员', '/mgr/jvs-auth/job/user/{jobId}', 'tenant', '岗位管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (126, 'jvs_job_delete_user', '移除岗位人员', '/mgr/jvs-auth/job/user/{userId}', 'tenant', '岗位管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (127, 'jvs_bulletin', '公告管理查看 ', '/mgr/jvs-auth/bulletin/page', 'tenant', '公告管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (128, 'jvs_bulletin_add', '新增系统公告', '/mgr/jvs-auth/bulletin', 'tenant', '公告管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (129, 'jvs_bulletin_add_mini', '新增小程序公告', '/mgr/jvs-auth/bulletin', 'tenant', '公告管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (130, 'jvs_bulletin_edit', '编辑公告管理', '/mgr/jvs-auth/bulletin', 'tenant', '公告管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (131, 'jvs_bulletin_delete', '删除公告管理 ', '/mgr/jvs-auth/bulletin/{id}', 'tenant', '公告管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (132, 'jvs_bulletin_deploy', '发布公告管理', '/mgr/jvs-auth/bulletin/deploy/{id}', 'tenant', '公告管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (133, 'jvs_bulletin_undeploy', '卸载公告管理 ', '/mgr/jvs-auth/bulletin/unload/{id}', 'tenant', '公告管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (134, 'jvs_message', '消息管理查看 ', '/mgr/jvs-auth/message/page', 'tenant', '消息管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (135, 'jvs_message_sms', '新增短信消息', '/mgr/jvs-auth/message', 'tenant', '消息管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (136, 'jvs_message_email', '新增邮件消息', '/mgr/jvs-auth/message', 'tenant', '消息管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (137, 'jvs_message_insede', '新增站内消息', '/mgr/jvs-auth/message', 'tenant', '消息管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (138, 'jvs_message_wx_mp', '新增公众号消息', '/mgr/jvs-auth/message', 'tenant', '消息管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (139, 'jvs_message_wx_enterprise', '新增企业消息', '/mgr/jvs-auth/message', 'tenant', '消息管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (140, 'jvs_message_dingding', '新增钉钉消息', '/mgr/jvs-auth/message', 'tenant', '消息管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (141, 'jvs_message_repeat', '重发消息', '/mgr/jvs-auth/message/retry/{id}', 'tenant', '消息管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (142, 'jvs_message_send', '发送消息', '/mgr/jvs-auth/message/send/{id}', 'tenant', '消息管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (143, 'jvs_message_delete', '删除消息', '/mgr/jvs-auth/message/{id}', 'tenant', '消息管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (144, 'jvs_level', '用户等级查看 ', '/mgr/jvs-auth/level/all', 'tenant', '用户等级', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (145, 'jvs_level_add', '新增用户等级', '/mgr/jvs-auth/level', 'tenant', '用户等级', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (146, 'jvs_level_edit', '修改用户等级', '/mgr/jvs-auth/level', 'tenant', '用户等级', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (147, 'jvs_level_delete', '删除用户等级', '/mgr/jvs-auth/level/{id}', 'tenant', '用户等级', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (149, 'jvs_delete_user', '删除用户查看 ', '', 'tenant', '删除用户', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (150, 'jvs_delete_recovery_user', '恢复用户', '/mgr/jvs-auth/user/users/enable/{userId}', 'tenant', '删除用户', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (151, 'jvs_delete_thorough_user', '彻底删除', '/mgr/jvs-auth/user/user/{id}', 'tenant', '删除用户', NULL, '彻底删除用户后将无法恢复,用户操作', 'delete', '后台');
INSERT INTO `sys_permission` VALUES (152, 'jvs_session', '会话管理 ', '/mgr/jvs-auth/token/page', 'tenant', '会话管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (153, 'jvs_session_close', '结束会话', '/mgr/jvs-auth/token/{token}', 'tenant', '会话管理', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (154, 'jvs_login_log', '登陆日志', '/mgr/jvs-auth/platform/login/log/page', 'tenant', '登陆日志', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (155, 'jvs_app_log', '应用操作日志', '/mgr/jvs-design/platform/app/jvsLog/page', 'tenant', '应用操作日志', NULL, NULL, 'get', '基础框架');
INSERT INTO `sys_permission` VALUES (156, 'jvs_file', '文件管理查看', '/mgr/jvs-auth/sys/file/list', 'tenant', '文件管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (157, 'jvs_file_delete', '删除文件', '/mgr/jvs-auth/file', 'tenant', '文件管理', NULL, '删除文件 或图片选择时删除图片,删除为物理删除,将无法找回,请谨慎授予此资源', 'delete', '后台');
INSERT INTO `sys_permission` VALUES (158, 'jvs_space', '系统空间', '/mgr/jvs-auth/tenant/admin/base/space', 'tenant', '系统空间', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (159, 'jvs_unregister_organization', '注销组织', '/mgr/jvs-auth/tenant/admin/base\n', 'tenant', '注销组织', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (160, 'jvs_message_wx_mp_template', '公众号消息模板', '/mgr/jvs-auth/platform/sys/config/WECHAT_OFFICIAL_ACCOUNT_CONFIGURATION', 'tenant', '公众号消息模板', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (161, 'jvs_message_sms_template', '短信消息模板', '/mgr/jvs-auth/tenant/admin/base/SMS/message', 'tenant', '短信消息模板', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (162, 'jvs_message_wx_mp_auth_reply', '公众号自动回复', '/mgr/jvs-auth/platform/sys/config/tenant/app/type/{type}', 'tenant', '公众号自动回复', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (163, 'jvs_other_operating_system_login', '三方应用登陆', '/mgr/jvs-auth/other/oauth/page', 'tenant', '三方应用登陆', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (164, 'jvs_base_config', '系统基础设置', '/mgr/jvs-auth/platform/sys/config/**', 'tenant', '系统设置', NULL, '系统基础设置, 工作流设置,工人流待办处理,阿里短信,邮件配置等.', 'get', '后台');
INSERT INTO `sys_permission` VALUES (165, 'jvs_other_operating_system_config', '三方配置', '/mgr/jvs-auth/platform/sys/config/{tenantId}/{appId}/{type}', 'tenant', '系统设置', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (166, 'jvs_group', '团队查看', '/mgr/jvs-auth/user/group/users', 'tenant', '团队管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (167, 'jvs_role_permission_edit', '权限配置', '/mgr/jvs-auth/role/role/{roleId}', 'tenant', '角色管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (169, 'jvs_message_detail', '查看消息详情', '/mgr/jvs-auth/message/{id}', 'tenant', '消息管理', NULL, NULL, 'get', '基础框架');
INSERT INTO `sys_permission` VALUES (170, 'jvs_base_notice', '系统通知设置', '/mgr/jvs-design/base/notice', 'tenant', '系统设置', NULL, '工作流待办提醒、催办提醒', 'post', '后台');
INSERT INTO `sys_permission` VALUES (171, 'jvs_file_upload', '上传文件', '', 'tenant', '文件管理', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (172, 'jvs_file_link', '复制链接', '', 'tenant', '文件管理', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (173, 'jvs_app_tree_import', '导入应用字典', '/mgr/jvs-design/platform/app/tree/import', 'platform', '应用字典', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (174, 'jvs_other_oauth_config_add', '新增', '/mgr/jvs-auth/other/oauth', 'tenant', '三方应用登陆', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (175, 'jvs_other_oauth_config_edit', '编辑', '/mgr/jvs-auth/other/oauth', 'tenant', '三方应用登陆', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (176, 'jvs_other_oauth_config_delete', '删除', '/mgr/jvs-auth/other/oauth/{id}', 'tenant', '三方应用登陆', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (177, 'jvs_app_template_upload', '上传模板', '/mgr/jvs-design/base/JvsAppTemplate/fileUpload', 'platform', '轻应用模板管理', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (178, 'jvs_app_unload', '卸载应用', '/mgr/jvs-design/app/design/{appId}/unload', 'tenant', '轻应用管理', NULL, NULL, 'put', '基础框架');
INSERT INTO `sys_permission` VALUES (180, 'jvs_message_edit', '修改消息', '/mgr/jvs-auth/message/edit', 'tenant', '消息管理', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (191, 'jvs-knowledge-setting', '系统设置', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (192, 'jvs_teamwork_setting', '系统设置', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (193, 'knowledge-dynameIndex-setting', '首页配置', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (194, 'knowledge-user-auth', '成员权限', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (195, 'knowledge-libary-auth', '文库权限', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (196, 'knowledge-label-auth', '标签管理', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (197, 'knowledge-control-auth', '控制台', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (198, 'knowledge-static-auth', '静态模板', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (199, 'knowledge-dynamic-auth', '动态模板', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (200, 'knowledge-plugins-auth', '插件管理', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (201, 'knowledge-message-auth', '消息模板', '/mgr/jvs-auth/tenant/admin/base/**', 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (202, 'knowledge-messagelogs-auth', '消息日志', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (203, 'knowledge-apidocument-auth', '接口文档', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (204, 'jvs_teamwork_news', '最新动态', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (205, 'jvs_teamwork_system_overview', '系统概览', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (206, 'jvs_teamwork_member_permissions', '成员权限', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (207, 'jvs_teamwork_status', '任务状态', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (208, 'jvs_teamwork_field_definition', '字段定义', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (209, 'jvs_teamwork_template_settings', '模板设置', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (210, 'jvs_teamwork_cycle_management', '周期管理', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (211, 'jvs_teamwork_message_template', '消息模板', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (212, 'jvs_teamwork_message_log', '消息日志', NULL, 'tenant', '企业计划', NULL, NULL, NULL, '企业计划');
INSERT INTO `sys_permission` VALUES (214, 'jvs-risk-databank', '数据源', NULL, 'tenant', '数据源', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (215, 'jvs-risk-run-log', '调用日志', NULL, 'tenant', '调用日志', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (216, 'jvs-openapi', '凭证管理', NULL, 'platform', '开放平台', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (275, 'jvs_gateway_ignore_path', '网关权限忽略查看', '/mgr/jvs-auth/platform/GatewayIgnorePathPo/page', 'platform', '网关路径忽略', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (276, 'jvs_gateway_ignore_path_add', '网关权限忽略新增', '/mgr/jvs-auth/platform/GatewayIgnorePathPo/save', 'platform', '网关路径忽略', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (277, 'jvs_gateway_ignore_path_delete', '网关权限忽略删除', '/mgr/jvs-auth/platform/GatewayIgnorePathPo/del/{id}', 'platform', '网关路径忽略', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (278, 'jvs_gateway_ignore_path_edit', '网关权限忽略修改', '/mgr/jvs-auth/platform/GatewayIgnorePathPo/edit', 'platform', '网关路径忽略', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (279, 'jvs_gateway_ignore_path_refresh', '网关权限忽略刷新', '/mgr/jvs-auth/platform/GatewayIgnorePathPo/refresh', 'platform', '网关路径忽略', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (280, 'chart-report-task-auth', '任务调度', NULL, 'tenant', 'bi', NULL, NULL, NULL, 'bi');
INSERT INTO `sys_permission` VALUES (281, 'chart-report-task-template', '模板', NULL, 'tenant', 'bi', NULL, NULL, NULL, 'bi');
INSERT INTO `sys_permission` VALUES (282, 'chart-report-task-dataintellect', '数据集', NULL, 'tenant', 'bi', NULL, NULL, NULL, 'bi');
INSERT INTO `sys_permission` VALUES (283, 'chart-report-task-datasource', '数据源', NULL, 'tenant', 'bi', NULL, NULL, NULL, 'bi');
INSERT INTO `sys_permission` VALUES (284, 'chart-report-task-service', '服务', NULL, 'tenant', 'bi', NULL, NULL, NULL, 'bi');
INSERT INTO `sys_permission` VALUES (285, 'knowledge-linkset-auth', '链接配置', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (288, 'upms_dict_items_page', '字典查看', NULL, 'platform', '系统字典', NULL, NULL, NULL, '平台');
INSERT INTO `sys_permission` VALUES (289, 'upms_dict_items_save', '保存字典', NULL, 'platform', '系统字典', NULL, NULL, NULL, '平台');
INSERT INTO `sys_permission` VALUES (290, 'jvs-risk-dynamic-index', '动态首页', NULL, 'tenant', '动态首页', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (292, 'jvs-iot-system-management', '系统管理', 'jvs-iot-system-management', 'platform', '物联网', NULL, NULL, NULL, '平台');
INSERT INTO `sys_permission` VALUES (293, 'sys_jump', '系统跳转', NULL, 'tenant', '系统跳转', NULL, NULL, NULL, '基础框架');
INSERT INTO `sys_permission` VALUES (300, 'jvs_function', '基础函数', '/mgr/jvs-design/jvsFunction/base/save', 'tenant', '扩展开发', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (302, 'jvs_variable', '环境变量', '/mgr/jvs-auth/environment/variable/page', 'tenant', '环境变量', NULL, NULL, 'get', '后台');
INSERT INTO `sys_permission` VALUES (303, 'jvs_variable_add', '新增环境变量', '/mgr/jvs-auth/environment/variable', 'tenant', '环境变量', NULL, NULL, 'post', '后台');
INSERT INTO `sys_permission` VALUES (304, 'jvs_variable_delete', '删除环境变量', '/mgr/jvs-auth/environment/variable/{id}', 'tenant', '环境变量', NULL, NULL, 'delete', '后台');
INSERT INTO `sys_permission` VALUES (305, 'jvs_variable_edit', '修改环境变量', '/mgr/jvs-auth/environment/variable', 'tenant', '环境变量', NULL, NULL, 'put', '后台');
INSERT INTO `sys_permission` VALUES (308, 'jvs_help', '所有帮助', '/mgr/jvs-auth/platform/help/all', 'platform', '帮助', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (309, 'jvs_help_add', '添加帮助', '/mgr/jvs-auth/environment/variable', 'platform', '帮助', NULL, NULL, 'post', '平台');
INSERT INTO `sys_permission` VALUES (310, 'jvs_help_delete', '删除帮助', '/mgr/jvs-auth/environment/variable/{id}', 'platform', '帮助', NULL, NULL, 'delete', '平台');
INSERT INTO `sys_permission` VALUES (311, 'jvs_help_edit', '修改帮助', '/mgr/jvs-auth/environment/variable', 'platform', '帮助', NULL, NULL, 'put', '平台');
INSERT INTO `sys_permission` VALUES (312, 'jvs_dict', '字典管理', '/mgr/jvs-auth/platform/dict/**', 'platform', '字典', NULL, NULL, 'get', '平台');
INSERT INTO `sys_permission` VALUES (313, 'jvs_flow_proxy', '流程代理查看', '/mgr/jvs-design/base/workflow/proxy/page', 'tenant', '流程代理', NULL, NULL, 'get', '基础框架');
INSERT INTO `sys_permission` VALUES (314, 'jvs_flow_proxy_add', '新增流程代理', '/mgr/jvs-design/base/workflow/proxy', 'tenant', '流程代理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (315, 'jvs_flow_proxy_revoke', '撤销流程代理', '/mgr/jvs-design/base/workflow/proxy/revoke/{id}', 'tenant', '流程代理', NULL, NULL, 'put', '基础框架');
INSERT INTO `sys_permission` VALUES (316, 'jvs_flow_task_manage', '流程任务管理', '/mgr/jvs-design/base/workflow/task/manage/page', 'tenant', '流程任务管理', NULL, NULL, 'get', '基础框架');
INSERT INTO `sys_permission` VALUES (317, 'jvs_flow_task_manage_assign', '增加审批人', '/mgr/jvs-design/base/workflow/task/manage/assign', 'tenant', '流程任务管理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (318, 'jvs_flow_task_manage_stop', '终止任务', '/mgr/jvs-design/base/workflow/task/manage/stop/{id}', 'tenant', '流程任务管理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (319, 'jvs_flow_task_manage_transfer', '转交', '/mgr/jvs-design/base/workflow/task/manage/transfer/{id}', 'tenant', '流程任务管理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (323, 'jvs_flow_task_manage_remove_approver', '移除审批人', '/mgr/jvs-design/base/workflow/task/manage/signer/remove/{id}', 'tenant', '流程任务管理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (324, 'jvs_flow_proxy_depart_proxy', '新增离职代理', '/mgr/jvs-design/base/workflow/proxy', 'tenant', '流程代理', NULL, NULL, 'post', '基础框架');
INSERT INTO `sys_permission` VALUES (325, 'add-file-action', '添加文库', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (327, 'knowledge-syncdoc-auth', '文档同步', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (328, 'jvs_app_recommendation', '推荐应用', '/mgr/jvs-design/app/manage/{appId}/recommendation', 'tenant', '轻应用管理', NULL, NULL, 'put', '基础框架');
INSERT INTO `sys_permission` VALUES (329, 'jvs-bi-import-export', '导入导出', NULL, 'tenant', 'bi', NULL, NULL, NULL, 'bi');
INSERT INTO `sys_permission` VALUES (332, 'jvs_risk_function_add', '函数新增', NULL, 'tenant', '函数', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (333, 'jvs_risk_function_edit', '函数修改', NULL, 'tenant', '函数', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (334, 'jvs_risk_function_del', '函数删除', NULL, 'tenant', '函数', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (335, 'jvs-risk-function', '函数目录', NULL, 'tenant', '函数', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (336, 'jvs_login_rules', '登录规则', '/mgr/jvs-auth/login/rules/**', 'platform', '登录规则管理', NULL, NULL, NULL, '平台');
INSERT INTO `sys_permission` VALUES (337, 'knowledge-template-center', '模板中心', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (338, 'knowledge-tools', '文档工具', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (341, 'jvs-risk-variable-center', '变量中心', NULL, 'platform', '变量中心', NULL, NULL, NULL, '规则引擎');
INSERT INTO `sys_permission` VALUES (342, 'jvs-bi-execute-clear', '任务调度清理', NULL, 'tenant', 'bi', NULL, NULL, NULL, 'bi');
INSERT INTO `sys_permission` VALUES (343, 'jvs_automation_function_add', '函数新增', NULL, 'tenant', '逻辑函数', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (346, 'jvs_automation_function_edit', '函数编辑', NULL, 'tenant', '逻辑函数', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (349, 'jvs_automation_function_del', '函数删除', NULL, 'tenant', '逻辑函数', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (350, 'jvs_automation_function', '函数目录', NULL, 'tenant', '逻辑函数', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (351, 'jvs_automation_extend_add', '新增扩展', NULL, 'tenant', '逻辑扩展', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (352, 'jvs_automation_extend_edit', '编辑扩展', NULL, 'tenant', '逻辑扩展', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (353, 'jvs_automation_extend_delete', '删除扩展', NULL, 'tenant', '逻辑扩展', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (354, 'jvs_automation_extend', '扩展目录', NULL, 'tenant', '逻辑扩展', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (355, 'jvs_automation_encryption_add', '新建加密', NULL, 'tenant', '加密', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (356, 'jvs_automation_encryption_edit', '编辑加密', NULL, 'tenant', '加密', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (357, 'jvs_automation_encryption_delete', '删除加密', NULL, 'tenant', '加密', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (358, 'jvs_automation_encryption', '加密目录', NULL, 'tenant', '加密', NULL, NULL, NULL, '服务编排');
INSERT INTO `sys_permission` VALUES (359, 'jvs_aps_material', '物料管理查看', NULL, 'tenant', '物料管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (360, 'jvs_aps_material_add', '新增物料', NULL, 'tenant', '物料管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (361, 'jvs_aps_material_edit', '修改物料', NULL, 'tenant', '物料管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (362, 'jvs_aps_material_del', '删除物料', NULL, 'tenant', '物料管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (363, 'jvs_aps_material_download_excel', '下载Excel模板', NULL, 'tenant', '物料管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (364, 'jvs_aps_material_import_excel', 'Excel导入物料', NULL, 'tenant', '物料管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (365, 'jvs_aps_resource', '主资源管理查看', NULL, 'tenant', '主资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (366, 'jvs_aps_resource_add', '新增主资源', NULL, 'tenant', '主资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (367, 'jvs_aps_resource_edit', '修改主资源', NULL, 'tenant', '主资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (368, 'jvs_aps_resource_del', '删除主资源', NULL, 'tenant', '主资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (369, 'jvs_aps_resource_download_excel', '下载Excel模板', NULL, 'tenant', '主资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (370, 'jvs_aps_resource_import_excel', 'Excel导入主资源', NULL, 'tenant', '主资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (371, 'jvs_aps_production_order', '生产订单查看', NULL, 'tenant', '生产订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (372, 'jvs_aps_production_order_add', '新增订单', NULL, 'tenant', '生产订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (373, 'jvs_aps_production_order_edit', '修改订单', NULL, 'tenant', '生产订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (374, 'jvs_aps_production_order_del', '删除订单', NULL, 'tenant', '生产订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (375, 'jvs_aps_production_order_download_excel', '下载Excel模板', NULL, 'tenant', '生产订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (376, 'jvs_aps_production_order_import_excel', 'Excel导入订单', NULL, 'tenant', '生产订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (377, 'jvs_aps_incoming', '来料计划查看', NULL, 'tenant', '来料计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (378, 'jvs_aps_incoming_add', '新增来料计划', NULL, 'tenant', '来料计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (379, 'jvs_aps_incoming_edit', '修改来料计划', NULL, 'tenant', '来料计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (380, 'jvs_aps_incoming_del', '删除来料计划', NULL, 'tenant', '来料计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (381, 'jvs_aps_incoming_download_excel', '下载Excel模板', NULL, 'tenant', '来料计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (382, 'jvs_aps_incoming_import_excel', 'Excel导入来料计划', NULL, 'tenant', '来料计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (383, 'jvs_aps_bom', '制造BOM查看', NULL, 'tenant', '制造BOM', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (384, 'jvs_aps_bom_add', '新增制造BOM', NULL, 'tenant', '制造BOM', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (385, 'jvs_aps_bom_edit', '修改制造BOM', NULL, 'tenant', '制造BOM', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (386, 'jvs_aps_bom_del', '删除制造BOM', NULL, 'tenant', '制造BOM', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (387, 'jvs_aps_process', '工序模板查看', NULL, 'tenant', '工序模板', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (388, 'jvs_aps_process_add', '新增工序模板', NULL, 'tenant', '工序模板', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (389, 'jvs_aps_process_edit', '修改工序模板', NULL, 'tenant', '工序模板', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (390, 'jvs_aps_process_del', '删除工序模板', NULL, 'tenant', '工序模板', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (391, 'jvs_aps_process_route', '工艺路线查看', NULL, 'tenant', '工艺路线', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (393, 'jvs_aps_process_route_edit', '编辑工艺路线', NULL, 'tenant', '工艺路线', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (394, 'jvs_aps_process_route_enable', '启用工艺路线', NULL, 'tenant', '工艺路线', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (395, 'jvs_aps_process_route_disable', '禁用工艺路线', NULL, 'tenant', '工艺路线', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (396, 'jvs_aps_work_calendar', '生产日历查看', NULL, 'tenant', '生产日历', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (397, 'jvs_aps_work_calendar_add', '新增生产日历', NULL, 'tenant', '生产日历', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (398, 'jvs_aps_work_calendar_edit', '修改生产日历', NULL, 'tenant', '生产日历', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (399, 'jvs_aps_work_calendar_del', '删除生产日历', NULL, 'tenant', '生产日历', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (401, 'jvs_aps_work_mode_add', '新增工作模式', NULL, 'tenant', '生产日历', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (402, 'jvs_aps_work_mode_edit', '修改工作模式', NULL, 'tenant', '生产日历', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (403, 'jvs_aps_work_mode_del', '删除工作模式', NULL, 'tenant', '生产日历', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (404, 'jvs_aps_strategy', '排产策略查看', NULL, 'tenant', '排产策略', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (405, 'jvs_aps_strategy_add', '新增排产策略', NULL, 'tenant', '排产策略', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (406, 'jvs_aps_strategy_edit', '修改排产策略', NULL, 'tenant', '排产策略', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (407, 'jvs_aps_strategy_del', '删除排产策略', NULL, 'tenant', '排产策略', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (408, 'jvs_aps_strategy_active', '修改策略有效状态', NULL, 'tenant', '排产策略', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (409, 'jvs_aps_task', '排产计划查看', NULL, 'tenant', '排产计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (410, 'jvs_aps_plan', '任务跟踪查看', NULL, 'tenant', '任务跟踪', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (411, 'jvs_aps_plan_import_excel', 'Excel导入报工', NULL, 'tenant', '任务跟踪', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (412, 'jvs_aps_plan_edit', '修改报工', NULL, 'tenant', '任务跟踪', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (413, 'jvs_aps_global_config', '全局配置查看', NULL, 'tenant', '全局配置', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (414, 'jvs_aps_global_config_edit', '编辑全局配置', NULL, 'tenant', '全局配置', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (415, 'jvs_aps_attribute', '属性管理查看', NULL, 'tenant', '属性管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (416, 'jvs_aps_attribute_add', '新增属性', NULL, 'tenant', '属性管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (417, 'jvs_aps_attribute_edit', '修改属性', NULL, 'tenant', '属性管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (418, 'jvs_aps_attribute_del', '删除属性', NULL, 'tenant', '属性管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (419, 'jvs_aps_material_extend_page_field', '扩展字段', NULL, 'tenant', '物料管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (420, 'jvs_aps_estimated_order', '预估订单查看', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (421, 'jvs_aps_estimated_order_add', '新增订单', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (422, 'jvs_aps_estimated_order_edit', '修改订单', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (423, 'jvs_aps_estimated_order_del', '删除订单', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (424, 'jvs_aps_estimated_order_sort', '移动订单', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (425, 'jvs_aps_estimated_order_download_excel', '下载Excel模板', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (426, 'jvs_aps_estimated_order_import_excel', 'Excel导入订单', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (427, 'jvs_aps_estimated_order_config_save', '预估参数设置', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (428, 'jvs_aps_estimated_order_delivery_time', '交期预估', NULL, 'tenant', '预估订单', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (429, 'jvs_aps_process_route_add', '新增工艺路线', NULL, 'tenant', '工艺路线', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (430, 'jvs_aps_bom_download_excel', '下载Excel模板', NULL, 'tenant', '制造BOM', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (431, 'jvs_aps_bom_import_excel', 'Excel导入BOM', NULL, 'tenant', '制造BOM', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (432, 'ai_manager', 'ai控制台', NULL, 'platform', 'ai 控制台', NULL, NULL, NULL, 'ai 控制台');
INSERT INTO `sys_permission` VALUES (433, 'jvs_aps_auxiliary_resource', '辅资源管理查看', NULL, 'tenant', '辅资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (434, 'jvs_aps_auxiliary_resource_add', '新增辅资源', NULL, 'tenant', '辅资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (435, 'jvs_aps_auxiliary_resource_edit', '修改辅资源', NULL, 'tenant', '辅资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (436, 'jvs_aps_auxiliary_resource_del', '删除辅资源', NULL, 'tenant', '辅资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (437, 'jvs_aps_auxiliary_resource_import_excel', 'Excel导入辅资源', NULL, 'tenant', '辅资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (438, 'jvs_aps_auxiliary_resource_download_excel', '下载Excel模板', NULL, 'tenant', '辅资源管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (439, 'jvs_aps_forecast', '销售预测查看', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (440, 'jvs_aps_forecast_add', '新增销售预测', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (441, 'jvs_aps_forecast_edit', '修改销售预测', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (442, 'jvs_aps_forecast_del', '删除销售预测', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (443, 'jvs_aps_forecast_import_excel', 'Excel导入销售预测', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (444, 'jvs_aps_forecast_download_excel', '下载销售预测Excel模板', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (445, 'jvs_aps_forecast_statistics', '销售预测统计查看', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (446, 'jvs_aps_forecast_statistics_material', '更新销售预测统计', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (447, 'jvs_aps_production_material_control', '生产管控查看', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (448, 'jvs_aps_production_material_control_add', '新增生产管控策略', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (449, 'jvs_aps_production_material_control_edit', '修该生产管控策略', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (450, 'jvs_aps_production_material_control_del', '删除生产管控策略', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (451, 'jvs_aps_production_material_control_import_excel', 'Excel导入生产管控策略', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (452, 'jvs_aps_production_material_control_download_excel', '下载Excel模板', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (453, 'jvs_aps_production_material_control_limit', '周生产限额计算与展示查看', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (454, 'jvs_aps_production_material_control_limit_calculate', '计算周生产限额', NULL, 'tenant', '生产管控', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (455, 'jvs_aps_demand_synergy', '需求协同查看', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (456, 'jvs_aps_forecast_statistics_material_export', '导出销售预测统计', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (457, 'knowledge-is-ai', '是否有文档AI', NULL, 'tenant', '企业文档', NULL, NULL, NULL, '企业文档');
INSERT INTO `sys_permission` VALUES (458, 'jvs_aps_weekly_demand', '周需求查看', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (459, 'jvs_aps_weekly_demand_add', '新增周需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (460, 'jvs_aps_weekly_demand_edit', '修改周需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (461, 'jvs_aps_weekly_demand_del', '删除周需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (462, 'jvs_aps_weekly_demand_import_excel', 'Excel导入周需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (463, 'jvs_aps_weekly_demand_download_excel', '下载周需求Excel模板', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (464, 'jvs_aps_weekly_demand_order_generate', '预生成生产订单', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (465, 'jvs_aps_weekly_demand_order_pending', '预览待确认生产订单', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (466, 'jvs_aps_weekly_demand_order_pending_add', '新增待确认生产订单', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (467, 'jvs_aps_weekly_demand_order_pending_edit', '修改待确认生产订单', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (468, 'jvs_aps_weekly_demand_order_pending_del', '删除待确认生产订单', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (469, 'jvs_aps_pickup_request', '提货需求查看', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (470, 'jvs_aps_pickup_request_add', '新增提货需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (471, 'jvs_aps_pickup_request_edit', '修改提货需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (472, 'jvs_aps_pickup_request_del', '删除提货需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (473, 'jvs_aps_pickup_request_import_excel', 'Excel导入提货需求', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (474, 'jvs_aps_pickup_request_download_excel', '下载Excel模板', NULL, 'tenant', '需求协同', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (475, 'jvs_aps_customer', '客户查看', NULL, 'tenant', '客户管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (476, 'jvs_aps_customer_add', '新增客户', NULL, 'tenant', '客户管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (477, 'jvs_aps_customer_edit', '修改客户', NULL, 'tenant', '客户管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (478, 'jvs_aps_customer_del', '删除客户', NULL, 'tenant', '客户管理', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (479, 'jvs_aps_shipping_plan', '出货计划查看', NULL, 'tenant', '出货计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (480, 'jvs_aps_inventory_external_download_excel', '下载厂外库存模板', NULL, 'tenant', '出货计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (481, 'jvs_aps_shipping_plan_generate', '生成出货计划', NULL, 'tenant', '出货计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (482, 'jvs_aps_shipping_plan_pending_preview', '预览待确认出货计划', NULL, 'tenant', '出货计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (483, 'jvs_aps_shipping_plan_detail', '查看出货计划详情', NULL, 'tenant', '出货计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (484, 'jvs_aps_shipping_plan_del', '删除出货计划', NULL, 'tenant', '出货计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (485, 'jvs_aps_shipping_plan_export', '下载出货计划', NULL, 'tenant', '出货计划', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (486, 'jvs_aps_process_route_download_excel', '下载模板', NULL, 'tenant', '工艺路线', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (487, 'jvs_aps_process_route_import_excel', '导入工艺路线', NULL, 'tenant', '工艺路线', NULL, NULL, NULL, '智能APS');
INSERT INTO `sys_permission` VALUES (488, 'jvs_aps_capacity_pre_scheduling', '产能预排', NULL, 'tenant', '产能预排', NULL, NULL, NULL, '智能APS');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色解释',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '租户ID默认1',
  `ds_type` enum('all','oneself','subordinate','custom') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'all' COMMENT 'all:所有部门\r\noneself: 当前部门\r\nsubordinate:当前部门及以下部门\r\ncustom:自定义部门集使用,分割',
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '所有的部门数据集IDS,当ds_type为custom,时，此字段才会生效',
  `auto_grant` tinyint(1) NULL DEFAULT 0 COMMENT '加入组织后是否自动赋予该权限,此角色不允许删除',
  `member_scope` enum('ALL','USER','DEPT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'USER' COMMENT '成员范围',
  `role_group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1' COMMENT '角色分组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_group`;
CREATE TABLE `sys_role_group`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分组',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '租户ID默认1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `role_id` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色ID',
  `permission_id` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '资源ID',
  `tenant_id` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户Id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公司ID',
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '租户名称',
  `desc_msg` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '租户介绍',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `admin_user_account` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '管理员帐号',
  `admin_user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员Id',
  `enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 1启用 0禁用',
  `parent_id` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '上级租户id,如果是顶级租户，该值和顶级租户的id一样',
  `default_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认密码',
  `extension_json` json NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公司租户管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES ('1', 'JVS开发服务平台体验', '此为测试企业信息，如果需要私有化部署请联系我们。', '2023-02-17 09:41:33', '2021-08-27 17:41:28', '0', 'admin', '1', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept`  (
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID:指向 user.id',
  `dept_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '部门ID。指向 sys_dept.id',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '租户ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_extension
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_extension`;
CREATE TABLE `sys_user_extension`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主鍵',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三方类型',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称显示',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方唯一键',
  `extension` json NULL COMMENT '三方信息扩展字段',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` json NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户扩展信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_extension
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户组名称',
  `principal_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人姓名。。指向：sys_user_info.real_name',
  `principal_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人id。指向：sys_user_info.id',
  `users` json NULL COMMENT '用户数组对象。指向：sys_user_info.id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'JVS用户' COMMENT '真名',
  `user_type` enum('BACKEND_USER','FRONT_USER','OTHER_USER') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户类型。\r\n1、后端用户\r\n2、业务用户\r\n',
  `account_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '帐号名',
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮件',
  `head_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '/jvs-ui-public/img/headImg.png' COMMENT '头像',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '$2a$04$c2zUWLOgcYZvD.KGwaySYub568h7nEQPxUhrobNyWsOeh2nGFK4Cy' COMMENT '密码(默认123456)',
  `phone` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `cancel_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1- 注销  不要逻辑删除，删除后，业务找不到数据',
  `sex` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'unknown' COMMENT '性别 ',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `invite` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邀请用户的ID做上下级关系',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_name`(`account_name` ASC) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE COMMENT '手机号索引全局唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES ('1', '超级管理员', NULL, 'admin', '13594163317@163.com', 'https://frame.bctools.cn/jvs-ui-public/img/headImg.png', '$2a$04$c2zUWLOgcYZvD.KGwaySYub568h7nEQPxUhrobNyWsOeh2nGFK4Cy', '13594163312', '2021-03-29 17:59:56', '2023-08-01 17:57:20', 0, 'male', '2021-08-27', '1');

-- ----------------------------
-- Table structure for sys_user_invite
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_invite`;
CREATE TABLE `sys_user_invite`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID。指向 sys_user_info.id',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邀请用户待审核' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_invite
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_level
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_level`;
CREATE TABLE `sys_user_level`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户等级名称',
  `sort` int NULL DEFAULT NULL COMMENT '等级排序',
  `index_url` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户等级首页',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_level
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帐号:sys_user_info.account',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名:sys_user_info.real_name',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `operate_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `device` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备android,谷歌等',
  `user_agent` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器请求标识头',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '登录成功状态',
  `login_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录类型，除系统内置的，钉钉，微信，企微等额外三方登录：sys_oauth_other.name',
  `client_id` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端sys_apply.client_id',
  `tenant_name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称sys_tenant.name',
  `tenant_short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户简称',
  `client_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端名称sys_apply.name',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_name`(`account_name` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `operate_time`(`operate_time` DESC, `tenant_id` DESC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户登陆日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `role_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户ID',
  `scopes` json NULL COMMENT '管理范围',
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_tenant`;
CREATE TABLE `sys_user_tenant`  (
  `id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称,对应用户真名',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID:指向 user.id',
  `employee_no` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职工编号',
  `account_level` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '帐号等级。指向 sys_user_level.name',
  `account_level_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户等级.指向 sys_user_level.id',
  `hire_date` date NULL DEFAULT NULL COMMENT '入职时间',
  `job_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位ID。指向 sys_job.id',
  `job_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `dept_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '部门ID。指向 sys_dept.id',
  `dept_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `tenant_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '租户ID',
  `cancel_flag` tinyint(1) NULL DEFAULT 0 COMMENT '0-正常，1- 注销  不要逻辑删除，删除后，业务找不到数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号 sys_user_info.phone',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC, `tenant_id` ASC) USING BTREE COMMENT '租户用户id唯一',
  UNIQUE INDEX `tenant_id`(`tenant_id` ASC, `phone` ASC) USING BTREE,
  INDEX `tenant_id_2`(`tenant_id` ASC, `create_time` DESC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户和用户关联表（用于确定某个租户下的所有用户）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_tenant
-- ----------------------------
INSERT INTO `sys_user_tenant` VALUES ('1', '超级管理员', '1', '0001', NULL, NULL, '2018-08-31', NULL, NULL, NULL, NULL, '1', 0, '2022-06-27 17:40:18', '13594163312');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid` ASC, `branch_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (4, 'jvs-design-mgr', 'jvs-design-mgr', 0, NULL, '2023-08-15 09:23:05');
INSERT INTO `xxl_job_group` VALUES (5, 'jvs-data-factory-mgr', 'data-factory', 0, NULL, '2023-08-15 09:23:05');
INSERT INTO `xxl_job_group` VALUES (8, 'document-job', 'document-job', 0, NULL, '2023-08-15 09:23:05');
INSERT INTO `xxl_job_group` VALUES (10, 'teamwork-ultimate-mgr', '企业计划', 0, NULL, '2023-08-15 09:23:05');
INSERT INTO `xxl_job_group` VALUES (14, 'mail-mgr', 'mail-mgr', 0, NULL, '2023-08-15 09:23:05');
INSERT INTO `xxl_job_group` VALUES (15, 'risk-recover-mgr', '规则备份恢复', 0, NULL, '2023-08-15 09:23:05');
INSERT INTO `xxl_job_group` VALUES (16, 'jvs-data-report-job-mgr', '定时报表', 0, NULL, '2023-08-15 09:23:05');
INSERT INTO `xxl_job_group` VALUES (17, 'jvs-data-report-mgr', 'jvs-data-report-mgr', 0, NULL, '2023-08-15 09:23:05');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 297 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (285, 16, 'cs', '2023-08-10 15:32:15', '2023-08-10 15:33:05', 'wl', '', 'CRON', '0 0 0 * * ? ', 'DO_NOTHING', 'FIRST', 'jvs-data-report-static', '{\"reportId\":\"42d27ff5fb274eb198f484b2fe5a8163\",\"tenantId\":\"1\",\"operationId\":\"1\",\"operationName\":\"admin\"}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2023-08-10 15:32:15', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (297, 17, '没有添加描述', '2023-08-14 12:04:26', '2023-08-14 12:04:26', 'wl', '123', 'CRON', '0 0 * * * ? *', 'DO_NOTHING', 'FIRST', 'jvs-data-report-job-mgr', '{\"reportId\":\"cffca28df3e46fecfc86587066118a80\",\"tenantId\":\"1\",\"operationId\":\"fa0c7f28b86a09f5ee4ad1e27ceb890e\",\"operationName\":\"wanglin\",\"cronSetting\":{\"startTime\":1691985840000,\"alarmEmail\":\"123\",\"author\":\"wl\",\"cron\":\"Per_hour\",\"isCustom\":false,\"reportPrefix\":\"原始报表\",\"rule\":\"date\"}}', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', NULL, '2023-08-14 12:04:26', '', 1, 1692061200000, 1692064800000);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time` ASC) USING BTREE,
  INDEX `I_handle_code`(`handle_code` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group` ASC, `registry_key`(191) ASC, `registry_value`(191) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
