/*
 Navicat Premium Data Transfer

 Source Server         : localdb
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : 127.0.0.1:3306
 Source Schema         : web204

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 23/01/2019 13:28:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `short_desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, 'Skinny Jean', 'assets/img/banner/m02-banner1.jpg', '', NULL);
INSERT INTO `categories` VALUES (2, 'Pleated skirt', 'assets/img/banner/m02-banner2.jpg', NULL, NULL);
INSERT INTO `categories` VALUES (3, 'Men shoes', 'assets/img/banner/m02-banner1.jpg', NULL, NULL);
INSERT INTO `categories` VALUES (4, 'Men T-shirt', 'assets/img/banner/m02-banner5.jpg', NULL, NULL);
INSERT INTO `categories` VALUES (5, 'Bags', 'assets/img/banner/m02-banner5.jpg', NULL, NULL);
INSERT INTO `categories` VALUES (6, 'Women Jacket', 'assets/img/banner/m02-banner1.jpg', NULL, NULL);
INSERT INTO `categories` VALUES (7, 'Men Jacket', 'assets/img/banner/m02-banner2.jpg', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `star` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
INSERT INTO `comments` VALUES (1, 9, 'someone@gmail.com', 'someone', 'cais gif day<script>alert(1)</script>', 3);
INSERT INTO `comments` VALUES (2, 9, 'nguyena@gmail.com', 'nguyen van a', 'khong biet viet gi', 4);
INSERT INTO `comments` VALUES (3, 9, 'nguyenb@gmail.com', 'nguyen van b', 'biet nhieu hon thang o tren', 5);
INSERT INTO `comments` VALUES (5, 9, 'asdfasdf@fdgsdfgsd', 'asdfasdfa', 'adsfasdfadf', 4);
INSERT INTO `comments` VALUES (6, 9, 'hieutm@gmail.com', 'tran minh hieu', 'san pham deu', 3);
INSERT INTO `comments` VALUES (7, 9, 'asdfafasdf@sdfsfsdfsdf', 'thienth', 'adsfa\r\nsfda\r\nsdfas\r\nfas\r\nfas\r\nf', 4);
COMMIT;

-- ----------------------------
-- Table structure for invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `unit_price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_galleries
-- ----------------------------
DROP TABLE IF EXISTS `product_galleries`;
CREATE TABLE `product_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_galleries
-- ----------------------------
BEGIN;
INSERT INTO `product_galleries` VALUES (1, 9, 'assets/img/products/prod-1-1-500x475.jpg', NULL);
INSERT INTO `product_galleries` VALUES (2, 9, 'assets/img/products/prod-2-1-1.jpg', NULL);
INSERT INTO `product_galleries` VALUES (3, 9, 'assets/img/products/prod-4-1.jpg', NULL);
INSERT INTO `product_galleries` VALUES (4, 9, 'assets/img/products/prod-5-1.jpg', NULL);
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `short_desc` text,
  `detail` text,
  `views` int(11) DEFAULT NULL,
  `star` float DEFAULT NULL,
  `ori_price` int(11) DEFAULT NULL,
  `sell_price` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES (1, 'Hig-Rise Skinny Jean', NULL, 2, 'assets/img/products/prod-1-4.jpg', 'assets/img/products/prod-1-1.jpg', NULL, NULL, 23, NULL, 886, 942, 0);
INSERT INTO `products` VALUES (2, 'Waxed-effect pleated skirt', NULL, 2, 'assets/img/products/prod-2-4.jpg', 'assets/img/products/prod-2-1.jpg', NULL, NULL, 34, NULL, 145, 564, 1);
INSERT INTO `products` VALUES (3, 'Check blazer', NULL, 3, 'assets/img/products/prod-3-4.jpg', 'assets/img/products/prod-3-1.jpg', NULL, NULL, 21, NULL, 201, 158, 0);
INSERT INTO `products` VALUES (4, 'Linen-Blend Pinstriped Culottes', NULL, 1, 'assets/img/products/prod-4-4.jpg', 'assets/img/products/prod-4-1.jpg', NULL, NULL, 89, NULL, 688, 275, 1);
INSERT INTO `products` VALUES (5, 'Super skinny trousers', NULL, 4, 'assets/img/products/prod-5-4.jpg', 'assets/img/products/prod-5-1.jpg', NULL, NULL, 43, NULL, 471, 969, 1);
INSERT INTO `products` VALUES (6, 'Ruffled polka dot blouse', NULL, 5, 'assets/img/products/prod-6-4.jpg', 'assets/img/products/prod-6-1.jpg', NULL, NULL, 35, NULL, 1, 224, 0);
INSERT INTO `products` VALUES (7, 'Limited edition v-neck t-shirt', NULL, 6, 'assets/img/products/prod-7-4.jpg', 'assets/img/products/prod-7-1.jpg', NULL, NULL, 38, NULL, 203, 977, 0);
INSERT INTO `products` VALUES (8, 'Chain print bermuda shorts', NULL, 6, 'assets/img/products/prod-8-4.jpg', 'assets/img/products/prod-8-1.jpg', NULL, NULL, 53, NULL, 701, 387, 1);
INSERT INTO `products` VALUES (9, 'Check blazer', NULL, 6, 'assets/img/products/prod-9-4.jpg', 'assets/img/products/prod-9-1.jpg', '<p><strong>Các trận đấu cuối cùng vòng bảng</strong> <a class=\"TextlinkBaiviet\" href=\"https://www.24h.com.vn/asian-cup-2019-c838.html\" title=\"Asian Cup 2019\">Asian Cup 2019</a> đã khép lại. <a class=\"TextlinkBaiviet\" href=\"https://www.24h.com.vn/doi-tuyen-viet-nam-c48e3410.html\" title=\"ĐT Việt Nam\">ĐT Việt Nam</a> đã lách qua khe cửa hẹp (hơn Lebanon nhờ chỉ số fair-play) để giành vé vào vòng 1/8 một cách ngoạn mục. Ngoài Việt Nam còn có 15 anh hào khác góp mặt ở vòng đấu này, trong đó có những tên tuổi lẫy lừng nhất của bóng đá châu Á như Nhật Bản, Hàn Quốc, Iran hay Australia.</p>', NULL, 22, NULL, 454, 428, 0);
INSERT INTO `products` VALUES (10, 'Hig-Rise Skinny Jean', NULL, 4, 'assets/img/products/prod-10-4.jpg', 'assets/img/products/prod-10-1.jpg', NULL, NULL, 34, NULL, 783, 387, 1);
COMMIT;

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `remember_expire` datetime DEFAULT NULL,
  `reset_token_expire` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', 'admin@gmail.com', '$2y$10$y1UuZFNvu1xYzj/Ez.WErecXQArtGO2Zj.CE852skPseLcc1GG7d.', 900, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'member', 'member@gmail.com', '$2y$10$f59vuoz6lkwexuWu9U23heH.hcCjMAwaIrNLj7mGfoSAxPOENSkZy', 1, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for web_settings
-- ----------------------------
DROP TABLE IF EXISTS `web_settings`;
CREATE TABLE `web_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_url` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `hotline` varchar(11) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `maps` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
