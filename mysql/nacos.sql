/*
 Navicat Premium Data Transfer

 Source Server         : 161
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : 10.0.0.161:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 08/07/2025 15:53:52
*/
create database `nacos` default character set utf8mb4 collate utf8mb4_general_ci;
use `nacos`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 796 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'application.yml', 'jvs', 'thread.pool.queueCapacity: 2000\n#是否开启登陆ip转换地址\nip:\n  transition: true\nserver:\n  netty:\n    connection-timeout: 50000\n  undertow:\n    buffer-size: 512\n    direct-buffers: true\n    threads:\n      io: 125\n      worker: 2048\n    no-request-timeout: 2000\n    max-http-post-size: -1\nspring:\n  main:\n    #是否允许循环依赖\n    allow-circular-references: true\n    #是否启动懒加载 与@Lazy 注解一起使用\n    lazy-initialization: false\n  mvc:\n    pathmatch:\n     #修改mvc的匹配策略\n      matching-strategy: ant_path_matcher\n  #是否开启缓存注解\n  cache:\n    type: none\n    redis:\n    #缓存前缀\n      key-prefix: jvs::temp\n  servlet:\n    multipart:\n      enabled: true\n      #请求最大大小\n      max-request-size: 20000MB\n      #文件大小\n      max-file-size: 2000MB\n  task:\n    execution:\n      pool:\n        core-size: 12\n        max-size: 30\n        queue-capacity: 200\n        keep-alive: 60s\n        allow-core-thread-timeout: true\n      shutdown:\n        await-termination: false\n        await-termination-period: 30s\n      thread-name-prefix: jvs-\n  arthas:\n   enabled: false\n  rabbitmq:\n    host: jvs-rabbitmq\n    port: 5672\n    username: jvs\n    password: jvs\n    # 使用其他环境时需要覆盖此属性\n    virtual-host: /jvs\n    listener:\n      simple:\n        acknowledge-mode: AUTO\n  redis:\n    host: jvs-redis\n    port: 6379\n    timeout: 100000\n    database: 2\n    password: redis\n    lettuce:\n      pool:\n      #lettuce采用多路复用原理，因此真正工作的连接受制于CPU核数因此增大连接数反而增加了线程上下文切换时间。因此建议调整为  CPU核数+1.\n      #连接池最大连接数（使用负值表示没有限制）\n        max-active: 29\n        #连接池中的最大空闲连接\n        max-idle: 9\n        #连接池中的最小空闲连接\n        min-idle: 1\n        #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1\n  datasource:\n    url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    type: com.zaxxer.hikari.HikariDataSource\n    hikari:\n      read-only: false\n      #客户端等待连接池连接的最大毫秒数\n      connection-timeout: 30000\n      #允许连接在连接池中空闲的最长时间(以毫秒为单位)\n      # idle-timeout: 60000\n      #连接将被测试活动的最大时间量\n      validation-timeout: 30000\n      #池中连接关闭后的最长生命周期\n      max-lifetime: 30000\n      #最大池大小\n      maximum-pool-size: 144\n      #连接池中维护的最小空闲连接数\n      minimum-idle: 40\n      #从池返回的连接的默认自动提交行为。默认值为true\n      auto-commit: true\n      #如果您的驱动程序支持JDBC4，我们强烈建议您不要设置此属性\n      # connection-test-query: SELECT 1\n      #自定义连接池名称\n      pool-name: MyHikariCP\n#接入网关限流sentinel\n  cloud:\n    sentinel: \n      enable: true\n      transport: \n      #指定地址\n        dashboard: jvs-sentinel:8084\n      log: \n      #日志文件\n        dir: log/sentinel \n\n  jackson:\n  #配置json格式化\n    default-property-inclusion: non_null\n\nfeign:\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n    max-connections: 1000\n    max-connections-per-route: 100\n  compression:\n    request:\n      mime-types: text/xml,application/xml,application/json\n      min-request-size: 2048\n      enabled: false\n    response:\n      enabled: true\n  client:\n    config:\n      default:\n        connectTimeout: 180000\n        readTimeout: 180000\n\n#日志配置,是否开启,和等级配置\nlogging:\n  #使用logstash方式日志传递\n  config: classpath:logback-logstash.xml\n  level:\n  #屏蔽 nacos 心跳日志,因为日志打印太频繁\n    com.alibaba.nacos.client.naming: error\n    org.apache.http.wire: off\n    #屏蔽MQ日志\n    org.springframework.amqp: error\n    org.springframework.integration: error\n    org.springframework.cloud: error\n    #redis\n    io.lettuce.core: off\n    org.apache.ibatis.logging: debug\n    com.baomidou.mybatisplus: debug\n    org.eclipse: off\n   # org.springframework: off\n    cn.bctools: info\n    net.logstash.logback: off\n    com.zaxxer.hikari.pool.PoolBase: error\n    com.zaxxer.hikari.pool.HikariPool: error\n\nmybatis-plus:\n  configuration:\n  #开启Mybatis plus 二级缓存, 单表,修改和新增时操作.建议配合使用 @CacheNamespace(implementation = JvsRedisCache.class, eviction = JvsRedisCache.class)\n    cache-enabled: false\n  global-config:\n    db-config:\n      #全局逻辑删除字段值\n      logic-delete-field: delFlag\n  # 支持统配符 * 或者 ; 分割\n  typeEnumsPackage: cn.bctools.**.entity.enums\n#  configuration:\n#   log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 关闭sql日志\n    #log-impl: org.apache.ibatis.logging.nologging.NoLoggingImpl\n    # 使用枚举的name值进行映射\n#    default-enum-type-handler: \'\'\n\n#文件存储内容\noss:\n  #默认s3 支持minio  name : minio   建议使用minio最新版本，oss需要一个桶绑定一个域名， 否则前端使用时会导致图片无法显示\n  name: s3\n  endpoint: server-ip:9000\n  access-key: miniominio\n  secret-key: miniominio\n  #声明公共桶，获取地址的时候直接为公有地址\n  publicBuckets:\n  #公共桶只有一个, 所有的都可以向这个上面传递, 但需要符合规范./项目/租户/功能名xxxx/xxx/xxx/ 三层,/当前年/月/日/文件名\n    - jvs-public\n\n#jvs 部分配置低代码使用到接入的kkfile地址\njvs:\n  #模式,多租户模式, 默认为false\n  multi-tenant-mode: false \n  #服务的ip或域名,如果是多租户模式,则直接\n  domain: server-ip\n  #是否是生产模式,某些功能是否走本地缓存,不配置默认为 false\n  dev: false\n  service:\n  #后台服务\n    - name: BACKGROUND_PERSONALIZED_CONFIGURATION\n      port: 8088\n    #bi项目\n    - name: PERSONALIZED_CONFIGURATION_OF_DATA_INTELLIGENCE_WAREHOUSE\n      port: 8083\n    #文档\n    - name: ENTERPRISE_DOCUMENT_ENTERPRISE_CONFIGURATION\n      port: 8081\n    #项目管理\n    - name: PERSONALIZED_CONFIGURATION_OF_ENTERPRISE_PLANNING\n      port: 38080\n    #规则\n    - name: RULE_PERSONALIZATION_CONFIGURATION\n      port: 30070\n    #  aps\n    - name: APS_CONFIGURATION\n      port: 9998\n  #服务资源,用户配置界面中相互跳转有哪些服务\n    # permission:\n    #   - JVS_DESIGN_MGR\n    #   - JVS_CHART_MGR\n    #   - jvs_document_service\n    #   - jvs_risk_service\n    #   - jvs_teamwork_ultimate_service\n  # 轻代码表单文件预览\n  kkfileUrl: http://server-ip:20812\n  other-login:\n    # true-开启平台新用户登录自动注册；false-不开启自动注册(默认)\n    enable-automatic-register: true\n\n# gateway Swagger文档开关,默认是false 开发环境设置为true 其它环境不用设置\nswagger:\n  enable: false\n\n\n# Seata默认配置\nseata:\n  # 事务分组名称(与服务端一致)\n  tx-service-group: my_test_tx_group\n  # 获取Seata服务端ip:port的方式\n  registry:\n    type: nacos\n    nacos:\n      password: nacos\n      username: nacos\n      namespace: ${spring.cloud.nacos.discovery.namespace}\n      server-addr: ${spring.cloud.nacos.discovery.server-addr}\n  client:\n    rm:\n      # 获取全局锁相关配置\n      lock:\n        # 重试次数\n        retry-times: 10\n        # 每次等待时间(ms)\n        retry-interval: 1000\n        # 尝试获取全局锁失败时是否立即报错(false时会等待锁)\n        retry-policy-branch-rollback-on-conflict: false\n#不使用默认首页\njvs.defaultIndex: false\n\n#doris配置\ndoris:\n  ip: jvs-doris\n  queryPort: 9030\n  httpPort: 8030\n  passWord: rkqf2024!QAZ2wsx\n  userName: root\n  #需要连接的数据库 此数据库名称可以修改 名称修改后 需要重启服务 服务启动会自动创建数据库\n  libraryName: jvs_data_factory_ods', '4c6ffe47c26b8e17dc651e51a6a75bb1', '2023-06-14 17:54:02', '2025-07-08 15:49:43', 'nacos', '10.0.0.88', '公共配置', 'jvs', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (2, 'jvs-gateway.yml', 'jvs', 'server: \n  port: 10000\n  #开户压缩\n  compression:\n    enabled: true\nspring:\n  servlet:\n    multipart:\n      max-file-size: 200MB\n      max-request-size: 200MB\n    sentinel.transport.dashboard: sentinel:8084\n    sentinel.log.dir: log/sentinel\n    ##取消Sentinel控制台懒加载,即项目启动即连接sentinel\n    sentinel.eager: true\n    sentinel:\n      datasource:\n        ds:\n          nacos:\n            username: nacos\n            password: nacos\n            server-addr: ${spring.cloud.nacos.config.server-addr}\n            dataId: ${spring.application.name}-sentinel\n            groupId: ${spring.cloud.nacos.config.group}\n            namespace: ${spring.cloud.nacos.config.namespace}\n            #路由方式\n            rule-type: flow\n    gateway:\n      globalcors:\n        cors-configurations:\n          \'[/**]\':\n            allowCredentials: true\n            exposedHeaders: \"Content-Disposition,Content-Type,Cache-Control\"\n            allowedHeaders: \"*\"\n            allowedMethods: \"*\"\n            allowedOriginPatterns: \"*\"\n  cloud:\n    gateway:\n      httpclient:\n        websocket:\n          #WEBsocket 请求内容大小  15M\n          max-frame-payload-length: 10485760\n\n#开启网关资源缓存,加快速度\ngateway.permission.cache: false', '9dbf68fb22aefa6111e4517797b3cca9', '2023-06-14 18:02:24', '2023-07-07 12:40:36', 'nacos', '125.82.189.8', '网关服务', 'jvs', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (14, 'license.yml', 'jvs_sys_configuration', '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', 'b27cf2ca335b17872fe9a189934d8d02', '2023-06-20 16:09:04', '2024-06-19 14:57:28', NULL, '10.234.49.16', '', 'jvs', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (19, 'message-push-mgr.yml', 'jvs', 'server:\n  port: 31011\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs-message-push?characterEncoding=utf8&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n      read-only: false\n      maximumPoolSize: 10\n      idleTimeout: 120000\n      connectionTimeout: 300000\n      leakDetectionThreshold: 300000\n\njvs:\n  oauth2:\n    permitUrls:\n      - /inside/**\n      - /message/utils/api/batch/send', '7fcca4986d31dbfc81973d5ff55a6f4a', '2023-06-20 16:09:04', '2023-06-29 17:56:30', 'nacos', '125.82.189.76', '公共消息', 'jvs', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (22, 'apply_version_pricing.js', 'jvs_web_configuration', '{\n\n}', '22e67cc3ae278cb47bca0058382d3330', '2023-06-20 16:09:04', '2024-07-16 10:07:30', 'nacos', '10.0.0.121', '', 'jvs', '', '', '', 'text', '', '');
INSERT INTO `config_info` VALUES (33, 'jvs-auth-mgr.yml', 'jvs', 'server:\n  port: 31001\n', 'd8d6b8177ed5b20bd4de63f8cb27ee66', '2023-06-20 16:09:04', '2024-07-16 10:11:25', 'nacos', '10.0.0.121', '基础框架服务', 'jvs', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (36, 'jvs-auth.yml', 'jvs', 'server:\n port: 31000', '99b2f4e3f3de70efeda34d53714ca6b2', '2023-06-20 16:09:04', '2024-12-20 15:44:09', 'nacos', '10.0.0.121', '基础框架', 'jvs', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (165, 'logback-common.xml', 'jvs', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<configuration debug=\"false\">\n    <springProperty scope=\"context\" name=\"name\" source=\"spring.application.name\"/>\n    <springProperty scope=\"context\" name=\"version\" source=\"project.version\"/>\n    <!-- 控制台输出 -->\n    <appender name=\"STDOUT\" class=\"ch.qos.logback.core.ConsoleAppender\">\n        <encoder class=\"ch.qos.logback.classic.encoder.PatternLayoutEncoder\">\n            <!-- <encoder>表示输出格式 -->\n            <pattern>%d{yyyy-MM-dd} %d{HH:mm:ss.SSS} %X{env} %X{tid}  [%thread] %-5level logger_name:%logger{36} - message:%msg%n</pattern>\n            <!-- 控制台也要使用UTF-8，不要使用GBK，否则会中文乱码 -->\n            <charset>utf8</charset>\n        </encoder>\n    </appender>\n\n    <!-- 按照每天生成日志文件 -->\n    <appender name=\"FILE\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\n        <rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">\n            <!--日志文件输出的文件名-->\n            <FileNamePattern>log/${name}/Web.log.%d{yyyy-MM-dd}.log</FileNamePattern>\n            <!--日志文件保留天数-->\n            <MaxHistory>60</MaxHistory>\n        </rollingPolicy>\n        <encoder class=\"ch.qos.logback.core.encoder.LayoutWrappingEncoder\">\n            <layout class=\"ch.qos.logback.classic.PatternLayout\">\n                <pattern>%d{yyyy-MM-dd} %d{HH:mm:ss.SSS} %X{env} %X{tid}  [%thread] %-5level logger_name:%logger{36} - message:%msg%n</pattern>\n            </layout>\n        </encoder>\n        <rollingPolicy class=\"ch.qos.logback.core.rolling.SizeAndTimeBasedRollingPolicy\">\n            <fileNamePattern>log/${name}\\%d{yyyy-MM-dd}\\%d{yyyy-MM-dd}.%i.log.zip</fileNamePattern>\n            <!-- 每个文件最多10MB，保存60天，但最多存储20GB -->\n            <maxFileSize>100MB</maxFileSize>\n            <maxHistory>60</maxHistory>\n            <totalSizeCap>20GB</totalSizeCap>\n            <cleanHistoryOnStart>true</cleanHistoryOnStart>\n        </rollingPolicy>\n    </appender>\n\n\n    <appender name=\"ASYNC-STDOUT\" class=\"ch.qos.logback.classic.AsyncAppender\">\n        <discardingThreshold>1</discardingThreshold>\n        <queueSize>2048</queueSize>\n        <appender-ref ref=\"STDOUT\"/>\n    </appender>\n\n    <appender name=\"ASYNC-FILE\" class=\"ch.qos.logback.classic.AsyncAppender\">\n        <discardingThreshold>1</discardingThreshold>\n        <queueSize>2048</queueSize>\n        <appender-ref ref=\"FILE\"/>\n    </appender>\n\n    <logger name=\"org.mybatis\">\n        <level value=\"TRACE\"/>\n    </logger>\n\n    <!-- 日志输出级别 -->\n    <root level=\"debug\">\n        <appender-ref ref=\"ASYNC-STDOUT\"/>\n        <appender-ref ref=\"ASYNC-FILE\"/>\n    </root>\n\n</configuration>', '14e2538d9f356fd715e24c01f365df32', '2023-08-05 10:40:24', '2023-08-16 17:26:07', 'nacos', '125.82.187.101', '', 'jvs', '', '', '', 'xml', '', '');
INSERT INTO `config_info` VALUES (768, 'jvs-aps.yml', 'jvs', 'server:\n port: 31010\nspring:\n    #用于设计存储\n  datasource:\n    url: jdbc:mysql://jvs-mysql:3306/jvs-aps?&maxLifetime=1790000&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n\njvs:\n  #添加mybatis 二级缓存前缀\n  mybatis_cache_prefix: aps\n# 是否打开应用日志\napp.log: true\n\n#排产配置\nscheduling:\n  # 排产系统允许的最大任务数量。小于等于0表示不限制\n  max-tasks: 1000', '47c9598409ffe5352a9a6a7caaffe6e6', '2025-01-23 20:55:05', '2025-07-01 14:21:27', 'nacos', '183.226.218.243', '', 'jvs', '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (20, 233, 'jvs-data-factory.yml', 'jvs', '数据智仓', 'server:\n  port: 32002\nspring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs-data-factory?characterEncoding=utf8&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n  rabbitmq:\n    host: jvs-rabbitmq\n    port: 5672\n    username: jvs\n    password: jvs\n    # 使用其他环境时需要覆盖此属性\n    virtual-host: /jvs\n    listener:\n      simple:\n        acknowledge-mode: MANUAL\n\n#公共参数的配置\ncommon:\n  #每次执行的数据量 如果是内存和cpu较高可以调整 \n  nodeExecuteNumber: 30000\n  #是否开启debug模式 开启debug模式表示不删除中间表 用于排查数据错误问题 谨慎开启\n  debugStatus: false\n  #datax 生成同步的json文件路径 与数据集服务的docker 挂载文件有关联 也可以不用挂载但是为了方便查看报错后的同步信息 建议挂载\n  dataXPath: \'/data/datax\'\n  #datax 同步并发数 如果cpu与内存 大于32g 可以增加 例如 如果 内存为64 就可以改为 10  如果 为16Gb 需要改为3  \n  dataXChannel: \'10\'\n', '4ebf9b8122ec5c8858f88f7d5c7053cb', '2025-06-26 15:08:03', '2025-06-26 15:08:04', 'nacos', '10.0.0.88', 'U', 'jvs', '');
INSERT INTO `his_config_info` VALUES (31, 234, 'jvs-data-report.yml', 'jvs', '数据智仓', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://jvs-mysql:3306/jvs-report?characterEncoding=utf8&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    hikari:\n      maximum-pool-size: 100\n  #mongo \n  data:\n    mongodb:\n      database: jvs_data_report\n      username: jvs\n      password: jvs\n      host: jvs-mongo\n      port: 27017\n      authentication-database: admin\n\nreport:\n  read:\n    # 报表读取超时时间 单位秒 默认30秒 定时任务不受限制\n    timeout: 1', 'be04a80e25622631c0a01accfef6de13', '2025-06-26 15:08:34', '2025-06-26 15:08:35', 'nacos', '10.0.0.88', 'U', 'jvs', '');
INSERT INTO `his_config_info` VALUES (1, 235, 'application.yml', 'jvs', '公共配置', 'thread.pool.queueCapacity: 2000\n#是否开启登陆ip转换地址\nip:\n  transition: true\nserver:\n  netty:\n    connection-timeout: 50000\n  undertow:\n    buffer-size: 512\n    direct-buffers: true\n    threads:\n      io: 125\n      worker: 2048\n    no-request-timeout: 2000\n    max-http-post-size: -1\nspring:\n  main:\n    #是否允许循环依赖\n    allow-circular-references: true\n    #是否启动懒加载 与@Lazy 注解一起使用\n    lazy-initialization: false\n  mvc:\n    pathmatch:\n     #修改mvc的匹配策略\n      matching-strategy: ant_path_matcher\n  #是否开启缓存注解\n  cache:\n    type: none\n    redis:\n    #缓存前缀\n      key-prefix: jvs::temp\n  servlet:\n    multipart:\n      enabled: true\n      #请求最大大小\n      max-request-size: 20000MB\n      #文件大小\n      max-file-size: 2000MB\n  task:\n    execution:\n      pool:\n        core-size: 12\n        max-size: 30\n        queue-capacity: 200\n        keep-alive: 60s\n        allow-core-thread-timeout: true\n      shutdown:\n        await-termination: false\n        await-termination-period: 30s\n      thread-name-prefix: jvs-\n  arthas:\n   enabled: false\n  rabbitmq:\n    host: jvs-rabbitmq\n    port: 5672\n    username: jvs\n    password: jvs\n    # 使用其他环境时需要覆盖此属性\n    virtual-host: /jvs\n    listener:\n      simple:\n        acknowledge-mode: AUTO\n  redis:\n    host: jvs-redis\n    port: 6379\n    timeout: 100000\n    database: 2\n    password: redis\n    lettuce:\n      pool:\n      #lettuce采用多路复用原理，因此真正工作的连接受制于CPU核数因此增大连接数反而增加了线程上下文切换时间。因此建议调整为  CPU核数+1.\n      #连接池最大连接数（使用负值表示没有限制）\n        max-active: 29\n        #连接池中的最大空闲连接\n        max-idle: 9\n        #连接池中的最小空闲连接\n        min-idle: 1\n        #连接池最大阻塞等待时间（使用负值表示没有限制）\n        max-wait: -1\n  datasource:\n    url: jdbc:mysql://jvs-mysql:3306/jvs?characterEncoding=utf8&allowPublicKeyRetrieval=true&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true\n    username: root\n    password: root\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    type: com.zaxxer.hikari.HikariDataSource\n    hikari:\n      read-only: false\n      #客户端等待连接池连接的最大毫秒数\n      connection-timeout: 30000\n      #允许连接在连接池中空闲的最长时间(以毫秒为单位)\n      # idle-timeout: 60000\n      #连接将被测试活动的最大时间量\n      validation-timeout: 30000\n      #池中连接关闭后的最长生命周期\n      max-lifetime: 30000\n      #最大池大小\n      maximum-pool-size: 144\n      #连接池中维护的最小空闲连接数\n      minimum-idle: 40\n      #从池返回的连接的默认自动提交行为。默认值为true\n      auto-commit: true\n      #如果您的驱动程序支持JDBC4，我们强烈建议您不要设置此属性\n      # connection-test-query: SELECT 1\n      #自定义连接池名称\n      pool-name: MyHikariCP\n#接入网关限流sentinel\n  cloud:\n    sentinel: \n      enable: true\n      transport: \n      #指定地址\n        dashboard: jvs-sentinel:8084\n      log: \n      #日志文件\n        dir: log/sentinel \n\n  jackson:\n  #配置json格式化\n    default-property-inclusion: non_null\n\nfeign:\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n    max-connections: 1000\n    max-connections-per-route: 100\n  compression:\n    request:\n      mime-types: text/xml,application/xml,application/json\n      min-request-size: 2048\n      enabled: false\n    response:\n      enabled: true\n  client:\n    config:\n      default:\n        connectTimeout: 180000\n        readTimeout: 180000\n\n#日志配置,是否开启,和等级配置\nlogging:\n  #使用logstash方式日志传递\n  config: classpath:logback-logstash.xml\n  level:\n  #屏蔽 nacos 心跳日志,因为日志打印太频繁\n    com.alibaba.nacos.client.naming: error\n    org.apache.http.wire: off\n    #屏蔽MQ日志\n    org.springframework.amqp: error\n    org.springframework.integration: error\n    org.springframework.cloud: error\n    #redis\n    io.lettuce.core: off\n    org.apache.ibatis.logging: debug\n    com.baomidou.mybatisplus: debug\n    org.eclipse: off\n   # org.springframework: off\n    cn.bctools: info\n    net.logstash.logback: off\n    com.zaxxer.hikari.pool.PoolBase: error\n    com.zaxxer.hikari.pool.HikariPool: error\n\nmybatis-plus:\n  configuration:\n  #开启Mybatis plus 二级缓存, 单表,修改和新增时操作.建议配合使用 @CacheNamespace(implementation = JvsRedisCache.class, eviction = JvsRedisCache.class)\n    cache-enabled: false\n  global-config:\n    db-config:\n      #全局逻辑删除字段值\n      logic-delete-field: delFlag\n  # 支持统配符 * 或者 ; 分割\n  typeEnumsPackage: cn.bctools.**.entity.enums\n#  configuration:\n#   log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n    # 关闭sql日志\n    #log-impl: org.apache.ibatis.logging.nologging.NoLoggingImpl\n    # 使用枚举的name值进行映射\n#    default-enum-type-handler: \'\'\n\n#文件存储内容\noss:\n  #默认s3 支持minio  name : minio   建议使用minio最新版本，oss需要一个桶绑定一个域名， 否则前端使用时会导致图片无法显示\n  name: s3\n  endpoint: server-ip:9000\n  access-key: miniominio\n  secret-key: miniominio\n  #声明公共桶，获取地址的时候直接为公有地址\n  publicBuckets:\n  #公共桶只有一个, 所有的都可以向这个上面传递, 但需要符合规范./项目/租户/功能名xxxx/xxx/xxx/ 三层,/当前年/月/日/文件名\n    - jvs-public\n\n#jvs 部分配置低代码使用到接入的kkfile地址\njvs:\n  #模式,多租户模式, 默认为false\n  multi-tenant-mode: false \n  #服务的ip或域名,如果是多租户模式,则直接\n  domain: server-ip\n  #是否是生产模式,某些功能是否走本地缓存,不配置默认为 false\n  dev: false\n  service:\n  #后台服务\n    - name: BACKGROUND_PERSONALIZED_CONFIGURATION\n      port: 8088\n    #bi项目\n    - name: PERSONALIZED_CONFIGURATION_OF_DATA_INTELLIGENCE_WAREHOUSE\n      port: 8083\n    #文档\n    - name: ENTERPRISE_DOCUMENT_ENTERPRISE_CONFIGURATION\n      port: 8081\n    #项目管理\n    - name: PERSONALIZED_CONFIGURATION_OF_ENTERPRISE_PLANNING\n      port: 38080\n    #规则\n    - name: RULE_PERSONALIZATION_CONFIGURATION\n      port: 30070\n\n  #服务资源,用户配置界面中相互跳转有哪些服务\n    # permission:\n    #   - JVS_DESIGN_MGR\n    #   - JVS_CHART_MGR\n    #   - jvs_document_service\n    #   - jvs_risk_service\n    #   - jvs_teamwork_ultimate_service\n  # 轻代码表单文件预览\n  kkfileUrl: http://server-ip:20812\n  other-login:\n    # true-开启平台新用户登录自动注册；false-不开启自动注册(默认)\n    enable-automatic-register: true\n\n# gateway Swagger文档开关,默认是false 开发环境设置为true 其它环境不用设置\nswagger:\n  enable: false\n\n\n# Seata默认配置\nseata:\n  # 事务分组名称(与服务端一致)\n  tx-service-group: my_test_tx_group\n  # 获取Seata服务端ip:port的方式\n  registry:\n    type: nacos\n    nacos:\n      password: nacos\n      username: nacos\n      namespace: ${spring.cloud.nacos.discovery.namespace}\n      server-addr: ${spring.cloud.nacos.discovery.server-addr}\n  client:\n    rm:\n      # 获取全局锁相关配置\n      lock:\n        # 重试次数\n        retry-times: 10\n        # 每次等待时间(ms)\n        retry-interval: 1000\n        # 尝试获取全局锁失败时是否立即报错(false时会等待锁)\n        retry-policy-branch-rollback-on-conflict: false\n#不使用默认首页\njvs.defaultIndex: false\n\n#doris配置\ndoris:\n  ip: jvs-doris\n  queryPort: 9030\n  httpPort: 8030\n  passWord: rkqf2024!QAZ2wsx\n  userName: root\n  #需要连接的数据库 此数据库名称可以修改 名称修改后 需要重启服务 服务启动会自动创建数据库\n  libraryName: jvs_data_factory_ods', '571cb83d2c65c348a564fafe5ecdf551', '2025-07-08 15:49:42', '2025-07-08 15:49:43', 'nacos', '10.0.0.88', 'U', 'jvs', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', 'jvs', 'jvs', 'jvs', 'nacos', 1686736435019, 1686736435019);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
