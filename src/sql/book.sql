/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50162
 Source Host           : localhost:3306
 Source Schema         : book

 Target Server Type    : MySQL
 Target Server Version : 50162
 File Encoding         : 65001

 Date: 05/01/2019 10:25:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`, `product_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('D10H4JPQ7HCEVGOZLXWF0H0AMQ2HG7T2', '28NG2VT9KMNNXFRYSTJ4FA03NLT81QHZ', 2);
INSERT INTO `orderitem` VALUES ('D10H4JPQ7HCEVGOZLXWF0H0AMQ2HG7T2', 'HDH6M9LF380SHSA04913CPV4GURHUURE', 1);
INSERT INTO `orderitem` VALUES ('D6QFKGLEIPUZMNUN0E6EAJ1YDXIDB7UO', 'IAL734SYNBYL2I1FWHMMIRD1SWF8R193', 1);
INSERT INTO `orderitem` VALUES ('NQWEDSVI0SG18SI7ULONYF96ZPNAACE8', 'IAL734SYNBYL2I1FWHMMIRD1SWF8R193', 3);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `money` double DEFAULT NULL,
  `receiverinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('D10H4JPQ7HCEVGOZLXWF0H0AMQ2HG7T2', 'Java面试宝典', 138, '湖南都市职业学院', 1, '2018-10-15 22:04:55', '7R2IDTMBASV0KNELSBHSIPOX0S5FXO08');
INSERT INTO `orders` VALUES ('D6QFKGLEIPUZMNUN0E6EAJ1YDXIDB7UO', '疯狂java讲义', 35, '跳马五七周信收', 0, '2018-10-16 08:51:23', '7R2IDTMBASV0KNELSBHSIPOX0S5FXO08');
INSERT INTO `orders` VALUES ('NQWEDSVI0SG18SI7ULONYF96ZPNAACE8', '疯狂java讲义', 105, '湖南都市职业学院', 0, '2018-10-15 22:08:15', 'SJWRDF8RCZXRRNZ6V278QFWNX9EW88K');

-- ----------------------------
-- Table structure for privileges
-- ----------------------------
DROP TABLE IF EXISTS `privileges`;
CREATE TABLE `privileges`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of privileges
-- ----------------------------
INSERT INTO `privileges` VALUES (1, '添加图书');
INSERT INTO `privileges` VALUES (2, '删除图书');
INSERT INTO `privileges` VALUES (3, '查看订单');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  `category` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pnum` int(11) NOT NULL,
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('28NG2VT9KMNNXFRYSTJ4FA03NLT81QHZ', 'Java模式', 44, 'JAVA', 28, '/upload/5/2/e2819ef4-a333-49cb-a1d6-0bd24ff2ddae.jpg', '这是java模式的书籍');
INSERT INTO `products` VALUES ('HDH6M9LF380SHSA04913CPV4GURHUURE', 'Java面试宝典', 50, 'JAVA', 49, '/upload/3/6/109b3665-a320-445e-b6ef-4dde832b8348.jpg', '这是java面试宝典的书籍');
INSERT INTO `products` VALUES ('IAL734SYNBYL2I1FWHMMIRD1SWF8R193', '疯狂java讲义', 35, 'JAVA', 40, '/upload/10/6/1186c48d-2f80-43ce-b50d-dd19207ed26b.jpg', '这是疯狂java讲义');
INSERT INTO `products` VALUES ('OQJOAU8HGS25TXJSUQ2C7JQMOYCGTFGR', '算法精简', 50, 'C', 55, '/upload/4/4/5ce5d5a7-e43b-49e2-bb32-ae10c3e4c625.jpeg', '这是算法精简');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('admin');
INSERT INTO `role` VALUES ('user');

-- ----------------------------
-- Table structure for userprivilege
-- ----------------------------
DROP TABLE IF EXISTS `userprivilege`;
CREATE TABLE `userprivilege`  (
  `privilege_id` int(11) NOT NULL DEFAULT 0,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`privilege_id`, `role`) USING BTREE,
  INDEX `userprivilege`(`role`) USING BTREE,
  CONSTRAINT `userprivilege_ibfk_1` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userprivilege_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userprivilege
-- ----------------------------
INSERT INTO `userprivilege` VALUES (1, 'admin');
INSERT INTO `userprivilege` VALUES (2, 'admin');
INSERT INTO `userprivilege` VALUES (3, 'admin');
INSERT INTO `userprivilege` VALUES (3, 'user');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_ibfk_1`(`role`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('7R2IDTMBASV0KNELSBHSIPOX0S5FXO08', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', '小信', 'xiaoxin1218@qq.com', 'user');
INSERT INTO `users` VALUES ('SJWRDF8RCZXRRNZ6V278QFWNX9EW88K', 'admin', 'd55fc70b73b9e81b6b76d8dfd26a5745', '管理员', 'xiaoxin1218@qq.com', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
