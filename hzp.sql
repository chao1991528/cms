/*
Navicat MySQL Data Transfer

Source Server         : self
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : hzp

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2017-10-20 18:53:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for z_appointment
-- ----------------------------
DROP TABLE IF EXISTS `z_appointment`;
CREATE TABLE `z_appointment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_code` varchar(50) NOT NULL DEFAULT '' COMMENT '会员编号',
  `is_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是会员,0不是，1是',
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '预约手机号',
  `person_num` int(11) NOT NULL DEFAULT '0' COMMENT '预约人数',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '预约门店id',
  `appoint_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '预约日期',
  `appoint_time` time NOT NULL COMMENT '预约时间（时分秒）',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预约状态，0预约中, 1已使用，2已过期',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_appointment
-- ----------------------------
INSERT INTO `z_appointment` VALUES ('1', '110', '1', 'zyc', '13714432100', '1', '1', '1', '2017-10-20', '18:11:35', '分', '0', '2017-10-20 18:12:33', '2017-10-20 18:12:33');

-- ----------------------------
-- Table structure for z_concept
-- ----------------------------
DROP TABLE IF EXISTS `z_concept`;
CREATE TABLE `z_concept` (
  `id` tinyint(4) NOT NULL,
  `content` text NOT NULL COMMENT '品牌理念'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌理念表';

-- ----------------------------
-- Records of z_concept
-- ----------------------------
INSERT INTO `z_concept` VALUES ('1', '日置の日美皮肤管理引进国内外最先进的理念、技术和产品，为中国女性提供专业的皮肤管理、形体管理、健康管理的指导和服务，为顾客实现健康美丽优雅于一身的新时代女性而不懈努力。 日置の日美的服务团队均有多年的皮肤管理经验，技术娴熟、手法精湛、服务优良，是您最贴心的皮肤管理专家。 日置の日美运用世界级的专业技术和产品及世间一切美丽元素，为懂得生活、具有成熟审美的现代女性提供全方位的身心滋养，客人可以通过皮肤管理、形体管理、健康管理、特色护理等美丽方案，得到由内而外的舒缓和改善。');

-- ----------------------------
-- Table structure for z_product
-- ----------------------------
DROP TABLE IF EXISTS `z_product`;
CREATE TABLE `z_product` (
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
-- Records of z_product
-- ----------------------------
INSERT INTO `z_product` VALUES ('1', '产品1', '', '1', 'fad', '地方', 'zhihu', '0000-00-00', '阿发苟富贵', '2', '1', '0', '1', null, '1505373725', '1505376126');
INSERT INTO `z_product` VALUES ('2', '产品2', '', '2', '0', '地方', 'zhihu2', '0000-00-00', '阿发苟富贵', '2', '1', '0', '1', null, '1505373725', '1505376126');

-- ----------------------------
-- Table structure for z_product_type
-- ----------------------------
DROP TABLE IF EXISTS `z_product_type`;
CREATE TABLE `z_product_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名字',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '分类图标',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='产品类型表';

-- ----------------------------
-- Records of z_product_type
-- ----------------------------
INSERT INTO `z_product_type` VALUES ('1', '产品分类1', '2017-10-18 00:00:00', '', '0', '2017-10-20 14:39:15');
INSERT INTO `z_product_type` VALUES ('2', '产品分类2', '2017-11-21 22:59:59', '/logo2', '1', null);
INSERT INTO `z_product_type` VALUES ('5', '产品分类1', '2017-10-18 00:00:00', '\\uploads\\proTyeLogo\\20171020\\3d891fbe99432639e6139347406e9bd8.jpg', '0', '2017-10-20 14:36:29');
INSERT INTO `z_product_type` VALUES ('6', '产品分类2', '2017-11-21 22:59:59', '/logo2', '1', null);
INSERT INTO `z_product_type` VALUES ('7', '产品分类1', '2017-10-18 00:00:00', '/logo', '0', null);
INSERT INTO `z_product_type` VALUES ('8', '产品分类2', '2017-11-21 22:59:59', '/logo2', '1', null);
INSERT INTO `z_product_type` VALUES ('9', '产品分类1', '2017-10-18 00:00:00', '\\uploads\\proTyeLogo\\20171020\\97d1d5e0cdab343be47d1a01b4baa04a.jpg', '0', '2017-10-20 14:32:22');
INSERT INTO `z_product_type` VALUES ('10', '产品分类2', '2017-11-21 22:59:59', '\\uploads\\proTyeLogo\\20171020\\8f5997750450e78f3c4c5d8aedf584e0.png', '1', '2017-10-20 14:31:26');
INSERT INTO `z_product_type` VALUES ('11', '产品分类1', '2017-10-18 00:00:00', '\\uploads\\proTyeLogo\\20171020\\a1955e269dce39437eb852cce82b5183.png', '0', '2017-10-20 14:30:43');
INSERT INTO `z_product_type` VALUES ('12', '产品分类2', '2017-11-21 22:59:59', '\\uploads\\proTyeLogo\\20171020\\35123238e03da300b049a07cbc1c9119.png', '1', '2017-10-20 14:31:11');
INSERT INTO `z_product_type` VALUES ('13', '产品分类2', '2017-11-21 22:59:59', '\\uploads\\proTyeLogo\\20171020\\0c3b7987a3523cda00cf70d8364802df.png', '1', '2017-10-20 14:35:29');
INSERT INTO `z_product_type` VALUES ('14', '产品分类1', '2017-10-18 00:00:00', '\\uploads\\proTyeLogo\\20171020\\3c3e38d6fbdb37a6e57172a3cc0f836a.jpg', '0', '2017-10-20 14:34:56');
INSERT INTO `z_product_type` VALUES ('15', '产品分类2', '2017-11-21 22:59:59', '\\uploads\\proTyeLogo\\20171020\\fa39e817d3c4b5e878e663788404f5fb.jpg', '1', '2017-10-20 14:36:13');
INSERT INTO `z_product_type` VALUES ('21', 'tf', '2017-10-20 09:15:41', '/uploads/20171020\\31ee438730fca318074b7f2c6e391b88.jpg', '0', '2017-10-20 09:15:41');
INSERT INTO `z_product_type` VALUES ('22', '5tg', '2017-10-20 09:18:25', '/uploads/20171020\\5eba406bdb65797ecf0e7081f1229b34.jpg', '0', '2017-10-20 09:18:25');
INSERT INTO `z_product_type` VALUES ('23', '6y', '2017-10-20 09:19:00', '\\uploads\\proTyeLogo\\20171020\\d623bf8991a3471cc41853335b58934f.png', '0', '2017-10-20 14:47:34');
INSERT INTO `z_product_type` VALUES ('24', '5de', '2017-10-20 09:21:23', '', '0', '2017-10-20 14:39:53');
INSERT INTO `z_product_type` VALUES ('25', 'y65', '2017-10-20 09:21:49', '', '6', '2017-10-20 14:44:50');
INSERT INTO `z_product_type` VALUES ('26', '7df', '2017-10-20 09:23:02', '', '0', '2017-10-20 14:44:45');
INSERT INTO `z_product_type` VALUES ('27', '6ss', '2017-10-20 09:24:26', '', '0', '2017-10-20 14:43:45');
INSERT INTO `z_product_type` VALUES ('28', '6y4', '2017-10-20 09:26:15', '\\uploads\\proTyeLogo\\20171020\\f01bcc5b974b20b49fd53e0bdb8c4f3c.jpg', '0', '2017-10-20 14:52:01');
INSERT INTO `z_product_type` VALUES ('29', 'hhj', '2017-10-20 09:26:43', '/uploads/20171020\\9c92aee1f35c6649738400dc9337c926.png', '0', '2017-10-20 09:26:43');
INSERT INTO `z_product_type` VALUES ('30', 'dg2', '2017-10-20 09:28:04', '\\uploads\\proTyeLogo\\20171020\\88ca651ea108c61f690b64980a996e30.jpg', '0', '2017-10-20 15:52:25');
INSERT INTO `z_product_type` VALUES ('31', 'tgb', '2017-10-20 10:11:32', '/uploads/20171020\\989bb3b60823f59f54926e80503922a0.jpg', '5', '2017-10-20 10:11:32');
INSERT INTO `z_product_type` VALUES ('32', 'fnd', '2017-10-20 14:19:14', '\\uploads\\proTyeLogo\\20171020\\9f818b2221e23151fcee3ac09bc0033a.jpg', '0', '2017-10-20 14:19:14');

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
INSERT INTO `z_user` VALUES ('1', 'root', 'e10adc3949ba59abbe56e057f20f883e', 'woider', 'root@email.com', '0', '1', '127.0.0.1', '1508395603');
INSERT INTO `z_user` VALUES ('2', 'fafffff', '7c222fb2927d828af22f592134e8932480637c0d', 'sg', 'gs@qq.com', '3', '1', null, null);
INSERT INTO `z_user` VALUES ('3', 'rehg', '20eabe5d64b0e216796e834f52d61fd0b70332fc', '1234556', '544@qq.com', '3', '1', null, null);

-- ----------------------------
-- Table structure for z_xilie
-- ----------------------------
DROP TABLE IF EXISTS `z_xilie`;
CREATE TABLE `z_xilie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '产品系列名称',
  `logo` varchar(200) NOT NULL DEFAULT '' COMMENT '产品系列图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品系列表';

-- ----------------------------
-- Records of z_xilie
-- ----------------------------
INSERT INTO `z_xilie` VALUES ('1', 'xilie 1', '\\uploads\\xilieLogo\\20171020\\50e09f776c11a84c0af45334692d1a03.jpg', '10', '2017-10-20 15:32:48', '2017-10-20 15:32:48');
SET FOREIGN_KEY_CHECKS=1;
