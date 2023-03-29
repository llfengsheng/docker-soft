/*
 Navicat Premium Data Transfer

 Source Server         : 笔记本
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : matrix

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 06/11/2022 19:12:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adv_event_record
-- ----------------------------
DROP TABLE IF EXISTS `adv_event_record`;
CREATE TABLE `adv_event_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adv_id` bigint(20) UNSIGNED NOT NULL COMMENT '广告id',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `adv_operation_id` bigint(20) UNSIGNED NOT NULL COMMENT '运营位id',
  `device_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备类型：0-ios，1-android，2-web，3-其他',
  `event_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '事件类型：0点击1曝光',
  `event_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件发生的时间',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_adv_id_opertion_id_event_type`(`adv_id`, `adv_operation_id`, `device_type`, `event_type`) USING BTREE COMMENT '统计索引',
  INDEX `index_event_time`(`event_time`) USING BTREE COMMENT '统计时间索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adv_event_record
-- ----------------------------

-- ----------------------------
-- Table structure for advertisement_channel_relation
-- ----------------------------
DROP TABLE IF EXISTS `advertisement_channel_relation`;
CREATE TABLE `advertisement_channel_relation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_id` bigint(20) UNSIGNED NOT NULL COMMENT '频道id',
  `adv_operation_id` bigint(20) UNSIGNED NOT NULL COMMENT '广告运营位id',
  `adv_type_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2 COMMENT '广告类型id',
  `sort` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_channel_id_adv_type_id`(`channel_id`, `adv_type_id`) USING BTREE COMMENT '频道广告索引',
  INDEX `index_adv_operation_id`(`adv_operation_id`, `adv_type_id`) USING BTREE COMMENT '运营位索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告运营位频道关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of advertisement_channel_relation
-- ----------------------------

-- ----------------------------
-- Table structure for advertisement_detail
-- ----------------------------
DROP TABLE IF EXISTS `advertisement_detail`;
CREATE TABLE `advertisement_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adv_type_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告类型：0启动页1banner2横幅',
  `cover_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面图片url',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跳转的链接地址',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of advertisement_detail
-- ----------------------------

-- ----------------------------
-- Table structure for advertisement_operation
-- ----------------------------
DROP TABLE IF EXISTS `advertisement_operation`;
CREATE TABLE `advertisement_operation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adv_type_id` bigint(20) UNSIGNED NOT NULL COMMENT '运营位类型：广告详情表id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告运营位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of advertisement_operation
-- ----------------------------
INSERT INTO `advertisement_operation` VALUES (1, 1, '开机广告', 0, 0, '2019-05-28 00:26:38', '2019-07-21 20:06:36');
INSERT INTO `advertisement_operation` VALUES (2, 2, '视频播放页广告', 0, 0, '2019-05-28 00:26:45', '2019-07-21 20:06:35');
INSERT INTO `advertisement_operation` VALUES (3, 3, '收藏列表', 0, 0, '2019-06-01 00:18:16', '2019-07-21 20:06:36');
INSERT INTO `advertisement_operation` VALUES (4, 4, '浏览历史', 0, 0, '2019-06-01 00:18:19', '2019-07-21 20:06:35');
INSERT INTO `advertisement_operation` VALUES (5, 5, '图片浏览', 0, 0, '2019-06-01 00:18:39', '2019-07-21 20:06:36');
INSERT INTO `advertisement_operation` VALUES (6, 6, '小说浏览', 0, 0, '2019-06-01 00:18:48', '2019-08-03 11:20:49');
INSERT INTO `advertisement_operation` VALUES (7, 50, '首页-推荐-banner', 0, 0, '2019-06-01 00:19:03', '2019-08-03 11:20:48');
INSERT INTO `advertisement_operation` VALUES (8, 51, '首页-推荐-列表横幅广告位', 0, 0, '2019-06-01 00:19:15', '2019-08-03 11:20:47');

-- ----------------------------
-- Table structure for advertisement_operation_config
-- ----------------------------
DROP TABLE IF EXISTS `advertisement_operation_config`;
CREATE TABLE `advertisement_operation_config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adv_operation_id` bigint(20) UNSIGNED NOT NULL COMMENT '广告运营位id',
  `adv_id` bigint(20) UNSIGNED NOT NULL COMMENT '广告id',
  `sort` int(255) UNSIGNED NULL DEFAULT 0 COMMENT '排序值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_adv_operation_id`(`adv_operation_id`, `adv_id`) USING BTREE COMMENT '广告运营位广告索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告运营位配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of advertisement_operation_config
-- ----------------------------

-- ----------------------------
-- Table structure for app_actors
-- ----------------------------
DROP TABLE IF EXISTS `app_actors`;
CREATE TABLE `app_actors`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `the_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `the_summary` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `head_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `other_imgs` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关照片',
  `the_books` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代表作品',
  `the_able` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否启用',
  `target_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转链接',
  `hot_num` bigint(20) NULL DEFAULT 0 COMMENT '热度值',
  `operator_id` bigint(20) NOT NULL COMMENT '操作人',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_actor_hot_idx`(`hot_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_actors
-- ----------------------------
INSERT INTO `app_actors` VALUES (1, '李白', '李白是个诗人', '1', '1', '李白的电影', '1', NULL, 0, 1, '2022-07-05 21:35:02', NULL, '0');

-- ----------------------------
-- Table structure for app_actors_movie_relation
-- ----------------------------
DROP TABLE IF EXISTS `app_actors_movie_relation`;
CREATE TABLE `app_actors_movie_relation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `actor_id` bigint(20) NOT NULL COMMENT '演员ID',
  `movie_id` bigint(20) NOT NULL COMMENT '电影ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_a_m_actid_index`(`actor_id`) USING BTREE,
  INDEX `app_a_m_movid_index`(`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_actors_movie_relation
-- ----------------------------

-- ----------------------------
-- Table structure for app_install_record
-- ----------------------------
DROP TABLE IF EXISTS `app_install_record`;
CREATE TABLE `app_install_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `device_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备id',
  `device_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备类型：0-ios，1-android，2-web，3-其他',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `visit_time` bigint(10) NOT NULL DEFAULT 0 COMMENT '请求次数',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unqic_device_id_type`(`device_id`, `device_type`) USING BTREE COMMENT '设备唯一索引',
  INDEX `index_create_time`(`created_at`) USING BTREE COMMENT '创建时间索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app装机统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_install_record
-- ----------------------------

-- ----------------------------
-- Table structure for app_manage
-- ----------------------------
DROP TABLE IF EXISTS `app_manage`;
CREATE TABLE `app_manage`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `app_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'app公钥',
  `app_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'app私钥',
  `app_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型：0-ios，1-android，2-h5',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `app_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'app的名称',
  `app_logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'app的logo',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_manage
-- ----------------------------
INSERT INTO `app_manage` VALUES (2, 'f762584429354eaf986d82d5e259d439', 'YmZlMTkyZjgyOGU0YTljZDgyYzkzMWUyYWRkNmRjMDI=', 0, '这是备注', '长征中国', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1200px-NASA_logo.svg.png', 0, 0, '2019-05-26 17:37:52', '2019-05-26 17:38:32');

-- ----------------------------
-- Table structure for app_recommend_banner
-- ----------------------------
DROP TABLE IF EXISTS `app_recommend_banner`;
CREATE TABLE `app_recommend_banner`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `actor_id` bigint(20) NULL DEFAULT NULL COMMENT '演员ID',
  `the_able` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否启用',
  `target_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转链接',
  `operator_id` bigint(20) NOT NULL COMMENT '操作人',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_rec_ban_act_idx`(`actor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_recommend_banner
-- ----------------------------

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `level_id` bigint(20) UNSIGNED NOT NULL COMMENT '等级id',
  `login_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登录名称：手机号或者邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `fans_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `the_vip` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '会员(00否01是)',
  `vip_limit_date` datetime NULL DEFAULT NULL COMMENT 'vip到期时间',
  `points` bigint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户积分',
  `ip_address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `device_type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '注册设备类型：0-IOS，1-Android，2-其他',
  `other_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '他人邀请码',
  `inv_num` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '邀请人数',
  `daily_down` int(10) NULL DEFAULT 0 COMMENT '每日下载次数',
  `watch_limit` int(10) NULL DEFAULT 0 COMMENT '可观影分钟数',
  `daily_watch` int(10) NULL DEFAULT 0 COMMENT '每日观影次数',
  `daily_down_free` int(10) NULL DEFAULT 0 COMMENT '当日已经下载次数',
  `daily_watch_free` int(10) NULL DEFAULT 0 COMMENT '当日已经观影次数',
  `self_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本人邀请码',
  `is_delete` tinyint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_login_name`(`login_name`) USING BTREE COMMENT '用户名称唯一索引',
  INDEX `index_create_at`(`created_at`) USING BTREE COMMENT '创建时间索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES (1, 2, '12300000000', 'e10adc3949ba59abbe56e057f20f883e', 'qq', NULL, '0', NULL, 1, '127.0.0.1', 2, '', 0, 0, 0, 14, 0, 14, '1m3z6kbk', 0, '2022-07-05 21:35:11', '2022-07-05 21:35:57');

-- ----------------------------
-- Table structure for app_user_collected_record
-- ----------------------------
DROP TABLE IF EXISTS `app_user_collected_record`;
CREATE TABLE `app_user_collected_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `content_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览类型：0影片1图片2小说',
  `content_id` bigint(20) NOT NULL COMMENT '浏览的内容id，根据类型确定',
  `device_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备类型',
  `recent_history_id` bigint(20) NULL DEFAULT NULL COMMENT '最近浏览记录id',
  `snap_shot` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览时的快照',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE COMMENT '用户id索引',
  INDEX `index_content_type_content_id_created_at`(`content_type`, `content_id`, `created_at`) USING BTREE COMMENT '内容统计索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_user_collected_record
-- ----------------------------

-- ----------------------------
-- Table structure for app_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `app_user_feedback`;
CREATE TABLE `app_user_feedback`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feedback_tag_id` bigint(20) UNSIGNED NOT NULL COMMENT '反馈标签id',
  `tag_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈详情',
  `img_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `contact` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系方式：qq、WeChat、Line',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE COMMENT '用户id索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户反馈信息记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_user_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for app_user_history_record
-- ----------------------------
DROP TABLE IF EXISTS `app_user_history_record`;
CREATE TABLE `app_user_history_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `content_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览类型：0影片1图片2小说',
  `content_id` bigint(20) NOT NULL COMMENT '浏览的内容id，根据类型确定',
  `device_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '设备类型',
  `views` int(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '浏览次数',
  `snap_shot` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览时的快照',
  `visit_time` date NOT NULL COMMENT '访问时间',
  `is_delete` tinyint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0未删除1删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_user_today_history`(`user_id`, `content_type`, `content_id`, `visit_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_user_history_record
-- ----------------------------
INSERT INTO `app_user_history_record` VALUES (1, 0, 1, 1, 2, 1, NULL, '2022-07-05', 0, '2022-07-05 21:32:54', '2022-07-05 21:32:54');

-- ----------------------------
-- Table structure for app_user_level
-- ----------------------------
DROP TABLE IF EXISTS `app_user_level`;
CREATE TABLE `app_user_level`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `level_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级名称：一般用户、VIP、白金VIP，支持自定义',
  `is_default` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '是否默认注册用户对应的等级：0-不是，1-是',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app用户等级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_user_level
-- ----------------------------
INSERT INTO `app_user_level` VALUES (1, '年度大会员', 0, 0, 0, '2019-05-16 01:14:28', '2019-06-02 18:33:40');
INSERT INTO `app_user_level` VALUES (2, '高级会员', 1, 0, 0, '2019-05-16 01:15:02', '2019-07-06 22:47:16');

-- ----------------------------
-- Table structure for app_user_points_detail
-- ----------------------------
DROP TABLE IF EXISTS `app_user_points_detail`;
CREATE TABLE `app_user_points_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `change_type` tinyint(3) UNSIGNED NOT NULL COMMENT '变化类型：0增加1减少',
  `change_points` bigint(20) NOT NULL COMMENT '本次变化的积分',
  `points_type` tinyint(3) UNSIGNED NOT NULL COMMENT '积分类型：0-每日签到',
  `current_points` bigint(20) NOT NULL COMMENT '变换后当前用户的积分',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE COMMENT '用户id索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户积分详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_user_points_detail
-- ----------------------------
INSERT INTO `app_user_points_detail` VALUES (1, 1, 0, 1, 0, 1, '每日签到', '2022-07-05 21:35:57', '2022-07-05 21:35:57');

-- ----------------------------
-- Table structure for app_user_vip_record
-- ----------------------------
DROP TABLE IF EXISTS `app_user_vip_record`;
CREATE TABLE `app_user_vip_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `io_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `thrid_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方订单编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `vip_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员编码',
  `pay_way` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式(01支付宝02微信03猫币)',
  `open_time` datetime NULL DEFAULT NULL COMMENT '开通时间',
  `vip_before_time` datetime NULL DEFAULT NULL COMMENT '开通前会员到期时间',
  `vip_after_time` datetime NULL DEFAULT NULL COMMENT '开通后会员到期时间',
  `open_len` int(11) NULL DEFAULT NULL COMMENT '开通天数',
  `pay_amount` decimal(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '支付金额',
  `pay_coin` int(11) NOT NULL DEFAULT 0 COMMENT '支付猫币',
  `td_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `td_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '订单状态（01未支付02已支付）',
  `cre_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cre_sb` bigint(20) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员开通记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_user_vip_record
-- ----------------------------

-- ----------------------------
-- Table structure for app_vip_rule
-- ----------------------------
DROP TABLE IF EXISTS `app_vip_rule`;
CREATE TABLE `app_vip_rule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vip_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员名称',
  `vip_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员编码',
  `explains` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员规则文字说明',
  `open_len` int(11) NOT NULL COMMENT '开通时长（天）',
  `amount` decimal(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '金额(元)',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `publish_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '发布状态(00未发布01已发布)',
  `coin_num` int(11) NOT NULL DEFAULT 0 COMMENT '猫币',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `cre_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cre_sb` bigint(20) NOT NULL COMMENT '创建人',
  `upt_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `upt_sb` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_vip_rule
-- ----------------------------

-- ----------------------------
-- Table structure for content_chapter_detail
-- ----------------------------
DROP TABLE IF EXISTS `content_chapter_detail`;
CREATE TABLE `content_chapter_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容类型：1影片2图片3小说',
  `content_id` bigint(20) UNSIGNED NOT NULL COMMENT '内容id',
  `chapter_no` int(10) UNSIGNED NOT NULL COMMENT '章节编号,排序字段',
  `chapter_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节标题',
  `chapter_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节图片url',
  `origin_file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始文件url',
  `trans_code_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '转码状态：0init，1doing，2finish,3error',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容章节详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of content_chapter_detail
-- ----------------------------

-- ----------------------------
-- Table structure for content_tag
-- ----------------------------
DROP TABLE IF EXISTS `content_tag`;
CREATE TABLE `content_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '内容标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of content_tag
-- ----------------------------

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(3) NULL DEFAULT 0 COMMENT '状态',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demo
-- ----------------------------

-- ----------------------------
-- Table structure for feedback_tag
-- ----------------------------
DROP TABLE IF EXISTS `feedback_tag`;
CREATE TABLE `feedback_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序值',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '反馈内容标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback_tag
-- ----------------------------

-- ----------------------------
-- Table structure for fiction
-- ----------------------------
DROP TABLE IF EXISTS `fiction`;
CREATE TABLE `fiction`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cover_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面图片',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `tag_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '标签id',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：0-连载中，1-已完结',
  `read_times` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读次数',
  `newest_chapter` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最新话数',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `origin_file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小说文件地址',
  `file_md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件md5码',
  `trans_code_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '转码状态：0init,1doing,2finish,3error',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除，0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fiction
-- ----------------------------

-- ----------------------------
-- Table structure for fiction_detail
-- ----------------------------
DROP TABLE IF EXISTS `fiction_detail`;
CREATE TABLE `fiction_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fiction_id` bigint(20) UNSIGNED NOT NULL COMMENT '小说表id',
  `chapter_no` int(10) UNSIGNED NOT NULL COMMENT '小说章节号，排序字段1',
  `chapter_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节名称',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小说文件地址',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序字段2',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '小说内容',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_fiction_id_chapter_no`(`fiction_id`, `chapter_no`) USING BTREE COMMENT '小说id章节号索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小说详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fiction_detail
-- ----------------------------

-- ----------------------------
-- Table structure for manage_user
-- ----------------------------
DROP TABLE IF EXISTS `manage_user`;
CREATE TABLE `manage_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色编号：1-普通管理员，2-高级管理员',
  `login_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登陆名称：手机号或者邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unqic_login_name`(`login_name`) USING BTREE COMMENT '用户名称唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理后台用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manage_user
-- ----------------------------
INSERT INTO `manage_user` VALUES (6, 2, 'sharkvision', 'a4b72fe3db75cecfbc918b9e2a016354', 0, '2019-05-16 01:14:28', '2019-05-16 01:14:28');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cover_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面图片',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `sub_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `duration` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '时长',
  `tag_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '标签id',
  `origin_file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始影片文件地址',
  `trans_code_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '转码状态：0init，1doing，2finish，3error',
  `hot_num` bigint(20) NULL DEFAULT 0 COMMENT '热度',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '', 'Video_20220705204613.wmv', '三毛流浪记', 32, 1, 'https://liaozalie.shop:7005/nginx_source/static/movie\\1657025195506402075-Video_20220705204613wmv.wmv', 0, 1, 6, 1, '2022-07-05 20:46:52', '2022-07-05 21:57:31');
INSERT INTO `movie` VALUES (2, 'https://liaozalie.shop:7005/nginx_source/static/image/movie-gif/2b9478337da94305b41ce663ffc4aaad.gif', '123.wmv', NULL, 10, 1, 'https://liaozalie.shop:7005/nginx_source/static/movie\\1657029446471402075-123wmv.wmv', 2, 0, 6, 0, '2022-07-05 21:57:28', '2022-07-05 21:59:34');

-- ----------------------------
-- Table structure for movie_classify
-- ----------------------------
DROP TABLE IF EXISTS `movie_classify`;
CREATE TABLE `movie_classify`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cla_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `rel_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关图片',
  `target_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `enable` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否启用',
  `sort_num` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `cre_sb` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `cre_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movie_classify
-- ----------------------------

-- ----------------------------
-- Table structure for movie_classify_relation
-- ----------------------------
DROP TABLE IF EXISTS `movie_classify_relation`;
CREATE TABLE `movie_classify_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `movie_id` bigint(20) NOT NULL COMMENT '电影ID',
  `class_id` bigint(20) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影分类关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movie_classify_relation
-- ----------------------------

-- ----------------------------
-- Table structure for movie_detail
-- ----------------------------
DROP TABLE IF EXISTS `movie_detail`;
CREATE TABLE `movie_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `movie_id` bigint(20) UNSIGNED NOT NULL COMMENT '电影表id',
  `resolution` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分辨率类型：0-360p，1-480p，2-720p，3-1080p',
  `play_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '播放地址',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_movie_id`(`movie_id`) USING BTREE COMMENT '电影id索引'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movie_detail
-- ----------------------------
INSERT INTO `movie_detail` VALUES (1, 1, 0, NULL, 0, 0, '2022-07-05 20:46:52', '2022-07-05 20:46:52');
INSERT INTO `movie_detail` VALUES (2, 2, 0, 'https://liaozalie.shop:7005/nginx_source/static/', 0, 0, '2022-07-05 21:57:28', '2022-07-05 21:57:53');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cover_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面图片地址',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `sub_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子标题',
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `status` tinyint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：0-连载中，1-已完结',
  `read_times` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读次数',
  `tag_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '标签id',
  `newest_chapter` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最新话数',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `operator_id` bigint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of picture
-- ----------------------------

-- ----------------------------
-- Table structure for picture_detail
-- ----------------------------
DROP TABLE IF EXISTS `picture_detail`;
CREATE TABLE `picture_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `picture_id` bigint(20) UNSIGNED NOT NULL COMMENT '图片表id',
  `chapter_no` int(10) UNSIGNED NOT NULL COMMENT '图片画数编号，排序字段1',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序字段2',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除。1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_picture_id_chapter_no`(`picture_id`, `chapter_no`) USING BTREE COMMENT '电影id章节号索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of picture_detail
-- ----------------------------

-- ----------------------------
-- Table structure for spread_rule
-- ----------------------------
DROP TABLE IF EXISTS `spread_rule`;
CREATE TABLE `spread_rule`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `the_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '徽章名称',
  `the_img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '徽章图片',
  `push_num` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '推广人数',
  `watch_num` int(11) NULL DEFAULT 0 COMMENT '增加观看次数,-1表示无限',
  `adv_num` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '点击广告当日观影次数',
  `down_num` int(11) NULL DEFAULT 0 COMMENT '增加下载次数,-1表示无限',
  `the_able` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否启用',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spread_rule
-- ----------------------------
INSERT INTO `spread_rule` VALUES (1, '入门徽章', NULL, 1, 5, 1, 1, '1', 1, '2020-01-12 13:29:32', NULL, '2020-01-12 13:30:05');
INSERT INTO `spread_rule` VALUES (2, '进阶徽章', NULL, 2, 15, 1, 2, '1', 1, '2020-01-12 13:30:28', NULL, '2020-01-12 13:31:48');
INSERT INTO `spread_rule` VALUES (3, '达人徽章', NULL, 3, 30, 1, 3, '1', 1, '2020-01-12 13:30:54', NULL, '2020-01-12 13:31:52');
INSERT INTO `spread_rule` VALUES (4, '专家徽章', NULL, 4, 50, 1, 4, '1', 1, '2020-01-12 13:31:07', NULL, '2020-01-12 13:31:53');
INSERT INTO `spread_rule` VALUES (5, '教授徽章', NULL, 5, -1, 1, 5, '1', 1, '2020-01-12 13:31:19', NULL, '2020-01-12 13:31:57');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `matrix_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统键',
  `matrix_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-删除',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_matrix_key`(`matrix_key`) USING BTREE COMMENT '唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, 'rechargeUrl', 'http://www.baidu.com', '充值地址', 0, 0, '2019-05-22 21:33:54', '2020-02-08 13:55:25');
INSERT INTO `system_config` VALUES (2, 'couponUrl', 'http://www.youzan.com', '卡密兑换地址', 0, 0, '2019-05-22 21:33:54', '2020-02-08 13:55:22');
INSERT INTO `system_config` VALUES (3, 'bindSignWatchNum', '4', '绑定手机号注册观影次数', 0, 0, '2020-01-12 13:28:21', '2020-02-08 13:49:58');
INSERT INTO `system_config` VALUES (4, 'theCodeWatchNum', '2', '填写邀请码增加观影次数', 0, 0, '2020-01-12 13:28:33', '2020-02-08 13:28:51');
INSERT INTO `system_config` VALUES (5, '100005', '10', '游客观看次数', 1, 0, '2020-02-08 13:43:53', '2020-02-08 17:45:11');
INSERT INTO `system_config` VALUES (6, '100006', '1', '每日点击广告观影次数', 0, 0, '2020-02-08 13:53:52', '2020-02-08 13:54:02');
INSERT INTO `system_config` VALUES (7, 'After-Transcoding-Path', 'D:\\CloudMusic\\movie\\trans\\%s', '转码后视频存放地址', 0, 0, '2022-07-05 20:48:40', '2022-07-05 21:10:44');
INSERT INTO `system_config` VALUES (8, 'Add-Marquee-Switch', '0', '跑马灯开关', 0, 0, '2022-07-05 20:49:11', '2022-07-05 20:49:29');
INSERT INTO `system_config` VALUES (9, 'Add-Water-Mark-Switch', '0', '水印开关', 0, 0, '2022-07-05 20:49:22', '2022-07-05 20:49:48');
INSERT INTO `system_config` VALUES (10, 'Play-Online', 'https://liaozalie.shop:7005/nginx_source/static/', '视频播放地址', 0, 0, '2022-07-05 20:49:57', '2022-07-05 20:54:21');
INSERT INTO `system_config` VALUES (12, 'Marquee-Content', '跑马灯内容', '跑马灯内容', 0, 0, '2022-07-05 20:50:37', '2022-07-05 20:58:27');
INSERT INTO `system_config` VALUES (13, 'Fmpeg-Font-Path', '0', '字库路径', 0, 0, '2022-07-05 20:51:08', '2022-07-05 20:51:08');
INSERT INTO `system_config` VALUES (14, 'gif_start_time', '00:00:03.000', '动态图开始时间', 0, 0, '2022-07-05 20:51:25', '2022-07-05 21:59:15');
INSERT INTO `system_config` VALUES (15, 'gif_continue_time', '1', '动态图持续时间', 0, 0, '2022-07-05 20:51:40', '2022-07-05 21:59:17');
INSERT INTO `system_config` VALUES (16, 'gif_ratio', '1', '动态图质量', 0, 0, '2022-07-05 20:52:04', '2022-07-05 20:52:04');
INSERT INTO `system_config` VALUES (17, 'gif_frame', '1', '动态图片段数', 0, 0, '2022-07-05 20:52:22', '2022-07-05 21:59:20');

-- ----------------------------
-- Table structure for system_translate
-- ----------------------------
DROP TABLE IF EXISTS `system_translate`;
CREATE TABLE `system_translate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `desc_zh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '中文描述',
  `desc_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `desc_zh_idx`(`desc_zh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_translate
-- ----------------------------
INSERT INTO `system_translate` VALUES (1, '首页', 'fdfd', '2022-07-05 20:53:30');
INSERT INTO `system_translate` VALUES (2, '图片', '', '2022-07-05 21:22:56');
INSERT INTO `system_translate` VALUES (3, '小说', '', '2022-07-05 21:22:56');
INSERT INTO `system_translate` VALUES (4, '我的', '', '2022-07-05 21:22:56');
INSERT INTO `system_translate` VALUES (5, '推荐', 'recommend', '2022-07-05 21:26:28');
INSERT INTO `system_translate` VALUES (6, 'Video_20220705204613.wmv', '', '2022-07-05 21:32:46');
INSERT INTO `system_translate` VALUES (7, '三毛流浪记', '', '2022-07-05 21:32:46');
INSERT INTO `system_translate` VALUES (8, '入门徽章', '', '2022-07-05 21:35:51');
INSERT INTO `system_translate` VALUES (9, '进阶徽章', '', '2022-07-05 21:35:51');
INSERT INTO `system_translate` VALUES (10, '达人徽章', '', '2022-07-05 21:35:51');
INSERT INTO `system_translate` VALUES (11, '专家徽章', '', '2022-07-05 21:35:51');
INSERT INTO `system_translate` VALUES (12, '教授徽章', '', '2022-07-05 21:35:51');

-- ----------------------------
-- Table structure for tab_bar
-- ----------------------------
DROP TABLE IF EXISTS `tab_bar`;
CREATE TABLE `tab_bar`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '导航栏名称',
  `type` tinyint(3) UNSIGNED NOT NULL COMMENT '导航栏类型：1影视2图片3小说',
  `normal_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '默认图标',
  `selected_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '选中图标',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序值',
  `back_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备选跳转url',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '导航栏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tab_bar
-- ----------------------------
INSERT INTO `tab_bar` VALUES (1, '首页', 1, 'http://47.98.151.92/static/image/84/c06e63c6432f2448b2fb2f9d02bdb33b.png', 'http://47.98.151.92/static/image/14/09a09e80f5b95d1e97ead68e59177342.png', 100, 'www.baidu.com', 1, 0, '2019-05-11 16:03:20', '2019-07-20 13:59:12');
INSERT INTO `tab_bar` VALUES (3, '图片', 2, 'http://47.98.151.92/static/image/44/96ee70d8827946ffc51a350dca96a130.png', 'http://47.98.151.92/static/image/63/39d21c7fd773d5a931e44cf2fb4ef012.png', 98, 'www.baidu.com', 5, 0, '2019-05-11 16:07:18', '2019-07-30 23:43:10');
INSERT INTO `tab_bar` VALUES (4, '小说', 3, 'http://47.98.151.92/static/image/89/7864a5839a940e95b2b145612aafc791.png', 'http://47.98.151.92/static/image/8/8296387402c86e06d028034e1387eaae.png', 97, '', 5, 0, '2019-05-31 21:56:25', '2019-07-30 23:43:19');
INSERT INTO `tab_bar` VALUES (5, '我的', 4, 'http://47.98.151.92/static/image/5/c29d19070d9cf8757e828ebface8813b.png', 'http://47.98.151.92/static/image/86/a8366863693334a7a234f3157d567449.png', 96, '', 1, 0, '2019-05-31 21:58:04', '2019-07-20 18:30:11');

-- ----------------------------
-- Table structure for tab_bar_channel
-- ----------------------------
DROP TABLE IF EXISTS `tab_bar_channel`;
CREATE TABLE `tab_bar_channel`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tab_bar_id` bigint(20) UNSIGNED NOT NULL COMMENT '导航栏id',
  `title` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '频道名称',
  `normal_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认图标',
  `selected_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '选中图标',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序值',
  `back_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备选跳转url',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(255) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_tab_bar_is_delate`(`tab_bar_id`, `is_delete`) USING BTREE COMMENT '导航栏索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '导航栏频道表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tab_bar_channel
-- ----------------------------
INSERT INTO `tab_bar_channel` VALUES (1, 1, '推荐', NULL, NULL, 1, NULL, 6, 0, '2022-07-05 21:26:17', '2022-07-05 21:26:17');

-- ----------------------------
-- Table structure for tab_bar_channel_detail
-- ----------------------------
DROP TABLE IF EXISTS `tab_bar_channel_detail`;
CREATE TABLE `tab_bar_channel_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tab_bar_channel_id` bigint(20) UNSIGNED NOT NULL COMMENT '导航栏id',
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '导航栏类型：1影片2图片3小说',
  `content_id` bigint(20) UNSIGNED NOT NULL COMMENT '内容id，根据type字段确定',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序值',
  `operator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作者id',
  `is_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_channel_id_type_content_id`(`tab_bar_channel_id`, `type`, `content_id`) USING BTREE COMMENT '频道id内容类型内容编号索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '导航栏详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tab_bar_channel_detail
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
