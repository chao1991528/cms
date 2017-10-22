/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : hzp

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-10-22 22:07:47
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
-- Table structure for z_bg_img
-- ----------------------------
DROP TABLE IF EXISTS `z_bg_img`;
CREATE TABLE `z_bg_img` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bg_image` varchar(255) NOT NULL DEFAULT '' COMMENT '首页背景图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_bg_img
-- ----------------------------
INSERT INTO `z_bg_img` VALUES ('1', '\\uploads\\indexBgImg\\20171021\\a8d3e88749da5acaf3611a2fe72781d1.jpg');

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
-- Table structure for z_log
-- ----------------------------
DROP TABLE IF EXISTS `z_log`;
CREATE TABLE `z_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_log
-- ----------------------------
INSERT INTO `z_log` VALUES ('1', 'good');
INSERT INTO `z_log` VALUES ('2', 'good55');

-- ----------------------------
-- Table structure for z_member_level
-- ----------------------------
DROP TABLE IF EXISTS `z_member_level`;
CREATE TABLE `z_member_level` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员等级名称',
  `conditions` varchar(50) NOT NULL DEFAULT '' COMMENT '入会条件',
  `product_discount` varchar(50) NOT NULL DEFAULT '' COMMENT '产品折扣',
  `meijia_discount` varchar(50) NOT NULL DEFAULT '' COMMENT '美甲折扣',
  `meijie_discount` varchar(50) NOT NULL DEFAULT '' COMMENT '美睫服务',
  `customized_service` varchar(200) NOT NULL DEFAULT '' COMMENT '定制服务',
  `birthday_treat` varchar(200) NOT NULL DEFAULT '' COMMENT '生日尊享',
  `experience` varchar(200) NOT NULL DEFAULT '' COMMENT '超值体验',
  `meal` varchar(200) NOT NULL DEFAULT '' COMMENT '营养餐',
  `social_circle` varchar(200) NOT NULL DEFAULT '' COMMENT '社交圈',
  `appoint_service` varchar(200) NOT NULL DEFAULT '' COMMENT '预约服务',
  `brand_discount` varchar(200) NOT NULL DEFAULT '' COMMENT '品牌折扣',
  `activity_privilege` varchar(200) NOT NULL DEFAULT '' COMMENT '参与活动',
  `zunxiang_service` varchar(200) DEFAULT '' COMMENT '尊享服务',
  `special_service` varchar(200) DEFAULT '' COMMENT '专属服务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员等级表';

-- ----------------------------
-- Records of z_member_level
-- ----------------------------
INSERT INTO `z_member_level` VALUES ('1', '砖石会员', '3w', '8.8折', '8.8折', '8.8折', '私人订制主题part1次0', '2000元现金抵用券1', '超值折扣体验项目', '精美点心、营养花茶77', '提供最新的美容、养生、时尚文化活动的资讯信息服务', '优先预约服务处理，专人负责跟踪疗程配合安排', '凭卡可享受其他高端合作品牌优惠', '优先派发VIP邀请函及设VIP专区', '私人浴袍/拖鞋/毛巾', '有限定制皮肤管理师及VIP房');
INSERT INTO `z_member_level` VALUES ('2', '黑砖会员', '6w', '8.0折', '8.0折', '8.0折', '私人订制主题part1次', '2000元现金抵用券', '超值折扣体验项目', '精美点心、营养花茶', '提供最新的美容、养生、时尚文化活动的资讯信息服务', '优先预约服务处理，专人负责跟踪疗程配合安排', '凭卡可享受其他高端合作品牌优惠', '优先派发VIP邀请函及设VIP专区', '私人浴袍/拖鞋/毛巾', '有限定制皮肤管理师及VIP房');
INSERT INTO `z_member_level` VALUES ('3', '白金会员', '10w', '7.5折0', '7.5折', '7.5折', '私人订制主题part1次', '2000元现金抵用券', '超值折扣体验项目5', '精美点心、营养花茶', '提供最新的美容、养生、时尚文化活动的资讯信息服务', '优先预约服务处理，专人负责跟踪疗程配合安排', '凭卡可享受其他高端合作品牌优惠', '优先派发VIP邀请函及设VIP专区', '私人浴袍/拖鞋/毛巾', '有限定制皮肤管理师及VIP房');
INSERT INTO `z_member_level` VALUES ('4', '砖石会员2', '6w', '8.7折', '8.7折', '8.7折', '发发', '发时代光华地方噶', '发发', '发发', '发发顺丰', '发发', '发范德萨', '发的', '发发', '发盛世嫡妃');

-- ----------------------------
-- Table structure for z_product
-- ----------------------------
DROP TABLE IF EXISTS `z_product`;
CREATE TABLE `z_product` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '产品名字',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '产品图片',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '所属类型',
  `yuanli` text COMMENT '产品原理',
  `guocheng` varchar(255) NOT NULL DEFAULT '' COMMENT '治疗过程',
  `pifu_problem` text COMMENT '肌肤问题',
  `huli_gongxiao` text COMMENT '护理功效',
  `huli_time` varchar(20) NOT NULL DEFAULT '' COMMENT '护理时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1正常，2已删除',
  `price_once` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单次价格',
  `price_all` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '疗程价格',
  `all_need_ci` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '需要的疗程次数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_UNIQUE` (`guocheng`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_product
-- ----------------------------
INSERT INTO `z_product` VALUES ('5', 'uu22', 'yyy', '1', null, '', null, null, '', '1', '133', '0', '0', '0', '2017-10-22 21:59:57', '2017-10-22 21:59:57');

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
-- Table structure for z_product_xilie
-- ----------------------------
DROP TABLE IF EXISTS `z_product_xilie`;
CREATE TABLE `z_product_xilie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `xilie_id` int(11) NOT NULL COMMENT '产品系列id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of z_product_xilie
-- ----------------------------
INSERT INTO `z_product_xilie` VALUES ('1', '1', '1', '2017-10-21 18:08:13', '2017-10-21 18:08:15');
INSERT INTO `z_product_xilie` VALUES ('2', '1', '2', '2017-10-21 18:25:29', '2017-10-21 18:25:31');
INSERT INTO `z_product_xilie` VALUES ('3', '2', '1', '2017-10-21 18:25:56', '2017-10-21 18:25:59');

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
INSERT INTO `z_user` VALUES ('1', 'root', 'e10adc3949ba59abbe56e057f20f883e', 'woider', 'root@email.com', '0', '1', '127.0.0.1', '1508664115');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='产品系列表';

-- ----------------------------
-- Records of z_xilie
-- ----------------------------
INSERT INTO `z_xilie` VALUES ('1', 'xilie 1', '\\uploads\\xilieLogo\\20171020\\50e09f776c11a84c0af45334692d1a03.jpg', '10', '2017-10-20 15:32:48', '2017-10-20 15:32:48');
INSERT INTO `z_xilie` VALUES ('2', 'xilie 2', '\\uploads\\xilieLogo\\20171020\\50e09f776c11a84c0af45334692d1a03.jpg', '3', '2017-10-21 19:11:04', '2017-10-21 19:11:04');
INSERT INTO `z_xilie` VALUES ('4', 'xilie5', '\\uploads\\xilieLogo\\20171020\\50e09f776c11a84c0af45334692d1a03.jpg', '4', '2017-10-22 19:34:35', '2017-10-22 19:34:35');
