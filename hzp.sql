/*
Navicat MySQL Data Transfer

Source Server         : self
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : hzp

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2017-10-17 18:39:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for z_project
-- ----------------------------
DROP TABLE IF EXISTS `z_project`;
CREATE TABLE `z_project` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '产品名字',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '产品图片',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '所属类型',
  `series` varchar(255) NOT NULL DEFAULT '' COMMENT '所属系列',
  `yuanli` text NOT NULL COMMENT '产品原理',
  `guocheng` varchar(255) NOT NULL DEFAULT '' COMMENT '治疗过程',
  `pifu_problem` varchar(255) NOT NULL DEFAULT '' COMMENT '肌肤类型',
  `huli_gongxiao` text NOT NULL COMMENT '护理功效',
  `huli_time` varchar(1) NOT NULL DEFAULT '' COMMENT '护理时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1正常，2已删除',
  `price_once` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单次价格',
  `price_all` int(4) unsigned NOT NULL,
  `all_need_ci` int(4) unsigned DEFAULT NULL COMMENT '一个疗程需要的次数',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_UNIQUE` (`guocheng`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_project
-- ----------------------------
INSERT INTO `z_project` VALUES ('1', '毫升', '', '0', '0', '地方', 'zhihu', '0000-00-00', '阿发苟富贵', '2', '1', '0', '1', null, '1505373725', '1505376126');
INSERT INTO `z_project` VALUES ('2', '毫升', '', '0', '0', '地方', 'zhihu2', '0000-00-00', '阿发苟富贵', '2', '1', '0', '1', null, '1505373725', '1505376126');

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
INSERT INTO `z_user` VALUES ('1', 'root', 'e10adc3949ba59abbe56e057f20f883e', 'woider', 'root@email.com', '0', '1', '127.0.0.1', '1508209998');
INSERT INTO `z_user` VALUES ('2', 'fafffff', '7c222fb2927d828af22f592134e8932480637c0d', 'sg', 'gs@qq.com', '3', '1', null, null);
INSERT INTO `z_user` VALUES ('3', 'rehg', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '1234556', '544@qq.com', '3', '1', null, null);
SET FOREIGN_KEY_CHECKS=1;
