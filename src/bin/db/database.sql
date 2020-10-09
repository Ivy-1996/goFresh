/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : gofresh

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 06/10/2020 19:38:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_address
-- ----------------------------
DROP TABLE IF EXISTS `tbl_address`;
CREATE TABLE `tbl_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `receiver` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `addr` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `zip_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_address_user_id_ebb8cfdb_fk_tbl_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `tbl_address_user_id_ebb8cfdb_fk_tbl_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods_image`;
CREATE TABLE `tbl_goods_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_goods_image_sku_id_55d2cd29_fk_tbl_goods_sku_id`(`sku_id`) USING BTREE,
  CONSTRAINT `tbl_goods_image_sku_id_55d2cd29_fk_tbl_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `tbl_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods_sku`;
CREATE TABLE `tbl_goods_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `unite` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_goods_sku_goods_id_58b923b2_fk_tbl_goods_id`(`goods_id`) USING BTREE,
  INDEX `tbl_goods_sku_type_id_dbb5ac35_fk_tbl_goods_type_id`(`type_id`) USING BTREE,
  CONSTRAINT `tbl_goods_sku_goods_id_58b923b2_fk_tbl_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `tbl_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_goods_sku_type_id_dbb5ac35_fk_tbl_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `tbl_goods_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods_type`;
CREATE TABLE `tbl_goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `logo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `tbl_index_banner`;
CREATE TABLE `tbl_index_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_index_banner_sku_id_a241343e_fk_tbl_goods_sku_id`(`sku_id`) USING BTREE,
  CONSTRAINT `tbl_index_banner_sku_id_a241343e_fk_tbl_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `tbl_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_index_promotion
-- ----------------------------
DROP TABLE IF EXISTS `tbl_index_promotion`;
CREATE TABLE `tbl_index_promotion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_index_type_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_index_type_goods`;
CREATE TABLE `tbl_index_type_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_index_type_goods_sku_id_5ac903e4_fk_tbl_goods_sku_id`(`sku_id`) USING BTREE,
  INDEX `tbl_index_type_goods_type_id_9bf07d07_fk_tbl_goods_type_id`(`type_id`) USING BTREE,
  CONSTRAINT `tbl_index_type_goods_sku_id_5ac903e4_fk_tbl_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `tbl_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_index_type_goods_type_id_9bf07d07_fk_tbl_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `tbl_goods_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_goods`;
CREATE TABLE `tbl_order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tbl_order_goods_order_id_c29d25e2_fk_tbl_order_info_order_id`(`order_id`) USING BTREE,
  INDEX `tbl_order_goods_sku_id_9f529d22_fk_tbl_goods_sku_id`(`sku_id`) USING BTREE,
  CONSTRAINT `tbl_order_goods_order_id_c29d25e2_fk_tbl_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `tbl_order_info` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_order_goods_sku_id_9f529d22_fk_tbl_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `tbl_goods_sku` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_order_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_info`;
CREATE TABLE `tbl_order_info`  (
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `order_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10, 2) NOT NULL,
  `transit_price` decimal(10, 2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `tbl_order_info_addr_id_3a45da39_fk_tbl_address_id`(`addr_id`) USING BTREE,
  INDEX `tbl_order_info_user_id_28b2f398_fk_tbl_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `tbl_order_info_addr_id_3a45da39_fk_tbl_address_id` FOREIGN KEY (`addr_id`) REFERENCES `tbl_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_order_info_user_id_28b2f398_fk_tbl_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NULL,
  `update_time` datetime(6) NULL,
  `delflag` tinyint(1) NOT NULL,
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
