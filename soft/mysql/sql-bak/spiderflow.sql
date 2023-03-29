/*
 Navicat Premium Data Transfer

 Source Server         : 笔记本
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : spiderflow

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 06/11/2022 19:12:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sp_datasource
-- ----------------------------
DROP TABLE IF EXISTS `sp_datasource`;
CREATE TABLE `sp_datasource`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `driver_class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jdbc_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_datasource
-- ----------------------------

-- ----------------------------
-- Table structure for sp_flow
-- ----------------------------
DROP TABLE IF EXISTS `sp_flow`;
CREATE TABLE `sp_flow`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名字',
  `xml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'xml表达式',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'corn表达式',
  `enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '任务是否启动,默认未启动',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_execute_time` datetime NULL DEFAULT NULL COMMENT '上一次执行时间',
  `next_execute_time` datetime NULL DEFAULT NULL COMMENT '下一次执行时间',
  `execute_count` int(8) NULL DEFAULT NULL COMMENT '定时执行的已执行次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '爬虫任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_flow
-- ----------------------------
INSERT INTO `sp_flow` VALUES ('275a97d40e6f45329ba52d3e4bc53586', '爬亚马逊', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;爬亚马逊&quot;,&quot;submit-strategy&quot;:&quot;random&quot;,&quot;threadCount&quot;:&quot;&quot;,&quot;cookie-name&quot;:[&quot;session-token&quot;,&quot;session-id&quot;,&quot;session-id-time&quot;,&quot;csm-hit&quot;,&quot;ext_pgvwcount&quot;,&quot;ubid-main&quot;,&quot;i18n-prefs&quot;],&quot;cookie-description&quot;:[&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;],&quot;cookie-value&quot;:[&quot;mKVRv+b/aQ1Qk83TwP41lr2bFUaI0lz/YSkhpJe/RUkMA6Ua45AjOG1ztwcetg+S4oPoVngNjLf+Pe7iYlQ79kTPxC1UaIxSZFmFiHZ8yu0QlZnjTzX232YrSFtZAIt+FwvEx99ODaXLyhgPfejvmXsIa4s+w5ElWgWK04Z01icJ/nNOwPTbf1nl/m3GxsTSez9kFsdgcxpUQOmPdpW6BF8A//RAG3XqfZh1zd7/OlE=&quot;,&quot;146-3014444-2906759&quot;,&quot;2082787201l&quot;,&quot;tb:P215XVZBHRRH28Q1M690+s-5VK2JKA633ZJNZY7EZNR|1666317526182&amp;t:1666317526183&amp;adb:adblk_no&quot;,&quot;22&quot;,&quot;ubid-main&quot;,&quot;USD&quot;]}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"576\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;tableName&quot;:&quot;&quot;,&quot;csvName&quot;:&quot;E:/index.html&quot;,&quot;csvEncoding&quot;:&quot;UTF-8BOM&quot;,&quot;output-name&quot;:[&quot;zipcode&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;output-value&quot;:[&quot;${zipcode}&quot;],&quot;output-all&quot;:&quot;0&quot;,&quot;output-database&quot;:&quot;0&quot;,&quot;output-csv&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"Selenium\" style=\"selenium\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"280\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;Selenium&quot;,&quot;nodeVariableName&quot;:&quot;&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;pageLoadTimeout&quot;:&quot;1000&quot;,&quot;implicitlyWaitTimeout&quot;:&quot;&quot;,&quot;driverType&quot;:&quot;chrome&quot;,&quot;window-size&quot;:&quot;200,200&quot;,&quot;user-agent&quot;:&quot;&quot;,&quot;arguments&quot;:&quot;&quot;,&quot;url&quot;:&quot;https://www.baidu.com&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;cookie-auto-set&quot;:&quot;1&quot;,&quot;headless&quot;:&quot;0&quot;,&quot;javascript-disabled&quot;:&quot;0&quot;,&quot;image-disabled&quot;:&quot;0&quot;,&quot;plugin-disable&quot;:&quot;1&quot;,&quot;java-disable&quot;:&quot;1&quot;,&quot;incognito&quot;:&quot;0&quot;,&quot;sandbox&quot;:&quot;0&quot;,&quot;hide-scrollbar&quot;:&quot;0&quot;,&quot;maximized&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;selenium&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"9\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"2\" target=\"7\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"11\" value=\"定义变量\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"410\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;定义变量&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;zipcode&quot;],&quot;variable-description&quot;:[&quot;&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${resp.selector(&#39;glow-ingress-line2&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"13\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"7\" target=\"11\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"14\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"11\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', NULL, '0', '2022-10-20 12:19:08', NULL, NULL, NULL);
INSERT INTO `sp_flow` VALUES ('5f3aa5a80f524b5382b8bdc5560c9b81', '未定义名称', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;未定义名称&quot;,&quot;submit-strategy&quot;:&quot;random&quot;,&quot;threadCount&quot;:&quot;&quot;,&quot;cookie-name&quot;:[&quot;session-token&quot;,&quot;session-id&quot;],&quot;cookie-description&quot;:[&quot;&quot;,&quot;&quot;],&quot;cookie-value&quot;:[&quot;ndLL80ekCrg9/tagIEYXXJq2KueRzzMieeb3uo7cUrk6vua7w7pZ7DQPVZwHrcTtJozqrSXC2SCPwHuhXOX8tjCLy7pAMJgPwy60bKwk8z0aSCfYX71g3zfGbwUYxQLbbcuUfKlrYu2R7GrtyuxJuedR6bkLcbShZXlf9caBRM3TwRbaD2Jm4Z15riYNDWA7a4MCTv6jZ68gaWVV3/DVE6xF9djWGodEIMSVu6mPg1c=&quot;,&quot;132-6963864-8617266&quot;]}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"Selenium\" style=\"selenium\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"240\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;Selenium&quot;,&quot;nodeVariableName&quot;:&quot;resp&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;loopCount&quot;:&quot;1&quot;,&quot;pageLoadTimeout&quot;:&quot;100000&quot;,&quot;implicitlyWaitTimeout&quot;:&quot;10000&quot;,&quot;driverType&quot;:&quot;firefox&quot;,&quot;window-size&quot;:&quot;&quot;,&quot;user-agent&quot;:&quot;&quot;,&quot;arguments&quot;:&quot;&quot;,&quot;url&quot;:&quot;${国家}dp/B08GF7YGCD&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;cookie-auto-set&quot;:&quot;0&quot;,&quot;headless&quot;:&quot;0&quot;,&quot;javascript-disabled&quot;:&quot;0&quot;,&quot;image-disabled&quot;:&quot;0&quot;,&quot;plugin-disable&quot;:&quot;1&quot;,&quot;java-disable&quot;:&quot;1&quot;,&quot;incognito&quot;:&quot;0&quot;,&quot;sandbox&quot;:&quot;0&quot;,&quot;hide-scrollbar&quot;:&quot;0&quot;,&quot;maximized&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;selenium&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"2\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"11\" value=\"定义变量\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"350\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;定义变量&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;zipcode_area&quot;,&quot;click&quot;],&quot;variable-description&quot;:[&quot;&quot;,&quot;&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${resp.selector(&#39;#nav-global-location-popover-link&#39;)}&quot;,&quot;${zipcode_area.click()}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"12\" value=\"\" style=\"strokeWidth=2;sharp=1;\" parent=\"1\" source=\"3\" target=\"11\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"19\" value=\"输出\" style=\"output\" vertex=\"1\" parent=\"1\">\n      <mxGeometry x=\"540\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;tableName&quot;:&quot;&quot;,&quot;csvName&quot;:&quot;&quot;,&quot;csvEncoding&quot;:&quot;GBK&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;output-all&quot;:&quot;1&quot;,&quot;output-database&quot;:&quot;0&quot;,&quot;output-csv&quot;:&quot;0&quot;,&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"20\" value=\"\" style=\"strokeWidth=2;sharp=1;\" edge=\"1\" parent=\"1\" source=\"11\" target=\"19\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;exception-flow&quot;:&quot;0&quot;,&quot;lineWidth&quot;:&quot;2&quot;,&quot;line-style&quot;:&quot;sharp&quot;,&quot;lineColor&quot;:&quot;black&quot;,&quot;condition&quot;:&quot;&quot;,&quot;transmit-variable&quot;:&quot;1&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', NULL, '0', '2022-10-21 02:35:11', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sp_flow_notice
-- ----------------------------
DROP TABLE IF EXISTS `sp_flow_notice`;
CREATE TABLE `sp_flow_notice`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `recipients` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `notice_way` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知方式',
  `start_notice` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '流程开始通知:1:开启通知,0:关闭通知',
  `exception_notice` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '流程异常通知:1:开启通知,0:关闭通知',
  `end_notice` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '流程结束通知:1:开启通知,0:关闭通知',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '爬虫任务通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_flow_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sp_function
-- ----------------------------
DROP TABLE IF EXISTS `sp_function`;
CREATE TABLE `sp_function`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '函数名',
  `parameter` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'js脚本',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sp_function
-- ----------------------------

-- ----------------------------
-- Table structure for sp_task
-- ----------------------------
DROP TABLE IF EXISTS `sp_task`;
CREATE TABLE `sp_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `begin_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_task
-- ----------------------------
INSERT INTO `sp_task` VALUES (7, '663aaa5e36a84c9594ef3cfd6738e9a7', '2022-10-20 20:08:32', '2022-10-20 20:08:34');

-- ----------------------------
-- Table structure for sp_variable
-- ----------------------------
DROP TABLE IF EXISTS `sp_variable`;
CREATE TABLE `sp_variable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量名',
  `value` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量描述',
  `create_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sp_variable
-- ----------------------------
INSERT INTO `sp_variable` VALUES (4, '国家', 'https://www.amazon.com/', '每行一个国家\n英国:https://www.amazon.co.uk\n美国:https://www.amazon.com', '2022-10-20 12:13:07');

SET FOREIGN_KEY_CHECKS = 1;
