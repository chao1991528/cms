/*
Navicat MySQL Data Transfer

Source Server         : self
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : article

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2017-10-16 17:38:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for z_user
-- ----------------------------
DROP TABLE IF EXISTS `z_user`;
CREATE TABLE `z_user` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` char(40) NOT NULL,
  `realname` varchar(8) NOT NULL,
  `email` varchar(256) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `last_login_ip` varchar(16) DEFAULT NULL,
  `last_login_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_user
-- ----------------------------
INSERT INTO `z_user` VALUES ('1', 'root', 'e10adc3949ba59abbe56e057f20f883e', 'woider', 'root@email.com', '0', '1', '127.0.0.1', '1507599325');
INSERT INTO `z_user` VALUES ('2', 'fafffff', '7c222fb2927d828af22f592134e8932480637c0d', 'sg', 'gs@qq.com', '3', '1', null, null);
INSERT INTO `z_user` VALUES ('3', 'rehg', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '1234556', '544@qq.com', '3', '1', null, null);
SET FOREIGN_KEY_CHECKS=1;
