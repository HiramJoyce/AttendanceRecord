/*
 Navicat MySQL Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : attendance

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 03/04/2019 15:14:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for boss
-- ----------------------------
DROP TABLE IF EXISTS `boss`;
CREATE TABLE `boss`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `boss_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of boss
-- ----------------------------
INSERT INTO `boss` VALUES ('1', '20190330001', 'admin', '123456');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `employee_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('678d63caf58a4c9c94207467c0f830bf', 'test', 'test', NULL, NULL, '1050588656@qq.com', NULL, 'test');
INSERT INTO `employee` VALUES ('9c46708ef40b4d17bc4d8c814f55fd17', '20190330003', '张三', NULL, NULL, 'chliang0904@sina.com', NULL, '123456');
INSERT INTO `employee` VALUES ('c518d86eab4945e1aad18bc3427d76f2', '20190329001', '曹海亮', NULL, 1, '1050588656@qq.com', '13888888888', '123456');
INSERT INTO `employee` VALUES ('c518d86eab4945e1aad18bc3427d76f3', '20190329002', '金三胖', NULL, 2, '123456@qq.com', '13999999999', '123456');
INSERT INTO `employee` VALUES ('ea083c44798d46b29a5ecb997073de1c', 'test12', 'test12', NULL, NULL, '1050588656@qq.com', NULL, 'test12');
INSERT INTO `employee` VALUES ('ea6c576ead184959b1e98b081cea03f5', 'ttt', 'ttt', NULL, NULL, '1050588656@qq.com', NULL, 'ttt');

-- ----------------------------
-- Table structure for leavedata
-- ----------------------------
DROP TABLE IF EXISTS `leavedata`;
CREATE TABLE `leavedata`  (
  `id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(255) NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_num` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `day_count` int(255) NULL DEFAULT NULL,
  `state` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leavedata
-- ----------------------------
INSERT INTO `leavedata` VALUES ('38ceb8b17a9f4e19b2d99cf65e33ca2b', 6, 'haha', '20190329001', '曹海亮', '2019-04-10 00:00:00', '2019-04-18 00:00:00', 8, 1);
INSERT INTO `leavedata` VALUES ('6116e4923a6041abb82c0fcc26ea81fc', 3, '321', '20190329001', '曹海亮', '2019-03-01 00:00:00', '2019-03-03 00:00:00', 2, 2);
INSERT INTO `leavedata` VALUES ('70552999999e4f7a908951a9c41da6c8', 5, '12344', '20190329001', '曹海亮', '2019-03-06 00:00:00', '2019-03-07 00:00:00', 2, 2);
INSERT INTO `leavedata` VALUES ('7821865242e0444f96cd0c0a14848b3a', 3, '哈哈哈', '20190330003', '张三', '2019-04-05 00:00:00', '2019-04-06 00:00:00', 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
