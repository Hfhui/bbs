/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100119
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 100119
File Encoding         : 65001

Date: 2017-05-19 11:56:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_action
-- ----------------------------
DROP TABLE IF EXISTS `bbs_action`;
CREATE TABLE `bbs_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of bbs_action
-- ----------------------------
INSERT INTO `bbs_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `bbs_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '1', '1380173180');
INSERT INTO `bbs_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `bbs_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '1', '1386139726');
INSERT INTO `bbs_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '1', '1383285551');
INSERT INTO `bbs_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `bbs_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `bbs_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `bbs_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `bbs_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `bbs_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');
INSERT INTO `bbs_action` VALUES ('12', 'modify_password', '修改密码', '用户修改了密码', '', '[user|get_nickname]在[time|time_format]修改了密码。', '2', '1', '1492958189');

-- ----------------------------
-- Table structure for bbs_action_log
-- ----------------------------
DROP TABLE IF EXISTS `bbs_action_log`;
CREATE TABLE `bbs_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of bbs_action_log
-- ----------------------------
INSERT INTO `bbs_action_log` VALUES ('1', '1', '1', '0', 'member', '1', 'admin在2017-03-12 23:28登录了后台', '1', '1489332480');
INSERT INTO `bbs_action_log` VALUES ('2', '1', '1', '0', 'member', '1', 'admin在2017-03-12 23:55登录了后台', '1', '1489334105');
INSERT INTO `bbs_action_log` VALUES ('3', '11', '1', '0', 'category', '1', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489334214');
INSERT INTO `bbs_action_log` VALUES ('4', '11', '1', '0', 'category', '1', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489334251');
INSERT INTO `bbs_action_log` VALUES ('5', '11', '1', '0', 'category', '2', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489334274');
INSERT INTO `bbs_action_log` VALUES ('6', '11', '1', '0', 'category', '39', '操作url：/bbs/index.php?s=/Admin/Category/add.html', '1', '1489334372');
INSERT INTO `bbs_action_log` VALUES ('7', '11', '1', '0', 'category', '39', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489334394');
INSERT INTO `bbs_action_log` VALUES ('8', '11', '1', '0', 'category', '40', '操作url：/bbs/index.php?s=/Admin/Category/add.html', '1', '1489334430');
INSERT INTO `bbs_action_log` VALUES ('9', '11', '1', '0', 'category', '41', '操作url：/bbs/index.php?s=/Admin/Category/add.html', '1', '1489334453');
INSERT INTO `bbs_action_log` VALUES ('10', '11', '1', '0', 'category', '42', '操作url：/bbs/index.php?s=/Admin/Category/add.html', '1', '1489334459');
INSERT INTO `bbs_action_log` VALUES ('11', '11', '1', '0', 'category', '41', '操作url：/bbs/index.php?s=/Admin/Category/remove/id/41.html', '1', '1489334473');
INSERT INTO `bbs_action_log` VALUES ('12', '11', '1', '0', 'category', '39', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489334490');
INSERT INTO `bbs_action_log` VALUES ('13', '11', '1', '0', 'category', '40', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489334493');
INSERT INTO `bbs_action_log` VALUES ('14', '11', '1', '0', 'category', '42', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489334495');
INSERT INTO `bbs_action_log` VALUES ('15', '1', '1', '0', 'member', '1', 'admin在2017-03-13 09:31登录了后台', '1', '1489368688');
INSERT INTO `bbs_action_log` VALUES ('16', '10', '1', '0', 'Menu', '122', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1489369003');
INSERT INTO `bbs_action_log` VALUES ('17', '1', '1', '0', 'member', '1', 'admin在2017-03-13 09:36登录了后台', '1', '1489369017');
INSERT INTO `bbs_action_log` VALUES ('18', '10', '1', '0', 'Menu', '122', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1489369122');
INSERT INTO `bbs_action_log` VALUES ('19', '10', '1', '0', 'Menu', '123', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1489369235');
INSERT INTO `bbs_action_log` VALUES ('20', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del/id/122.html', '1', '1489369293');
INSERT INTO `bbs_action_log` VALUES ('21', '10', '1', '0', 'Menu', '124', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1489369363');
INSERT INTO `bbs_action_log` VALUES ('22', '10', '1', '0', 'Menu', '125', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1489369426');
INSERT INTO `bbs_action_log` VALUES ('23', '10', '1', '0', 'Menu', '126', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1489369474');
INSERT INTO `bbs_action_log` VALUES ('24', '9', '1', '0', 'channel', '3', '操作url：/bbs/index.php?s=/Admin/Channel/edit.html', '1', '1489369655');
INSERT INTO `bbs_action_log` VALUES ('25', '9', '1', '0', 'channel', '3', '操作url：/bbs/index.php?s=/Admin/Channel/edit.html', '1', '1489369663');
INSERT INTO `bbs_action_log` VALUES ('26', '1', '1', '0', 'member', '1', 'admin在2017-03-13 21:36登录了后台', '1', '1489412204');
INSERT INTO `bbs_action_log` VALUES ('27', '1', '1', '0', 'member', '1', 'admin在2017-03-13 22:33登录了后台', '1', '1489415614');
INSERT INTO `bbs_action_log` VALUES ('28', '4', '0', '0', 'document', '17', 'admin在2017-03-13 23:04发表了一篇文章。\r\n表document，记录编号17。', '1', '1489417479');
INSERT INTO `bbs_action_log` VALUES ('29', '11', '1', '0', 'category', '2', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489420227');
INSERT INTO `bbs_action_log` VALUES ('30', '1', '2', '0', 'member', '2', 'hfhui在2017-03-13 23:51登录了后台', '1', '1489420285');
INSERT INTO `bbs_action_log` VALUES ('31', '4', '0', '0', 'document', '18', 'hfhui在2017-03-13 23:52发表了一篇文章。\r\n表document，记录编号18。', '1', '1489420365');
INSERT INTO `bbs_action_log` VALUES ('32', '4', '2', '0', 'document', '19', 'hfhui在2017-03-13 23:55发表了一篇文章。\r\n表document，记录编号19。', '1', '1489420547');
INSERT INTO `bbs_action_log` VALUES ('33', '4', '2', '0', 'document', '20', 'hfhui在2017-03-13 23:58发表了一篇文章。\r\n表document，记录编号20。', '1', '1489420739');
INSERT INTO `bbs_action_log` VALUES ('34', '11', '1', '0', 'category', '2', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489421139');
INSERT INTO `bbs_action_log` VALUES ('35', '11', '1', '0', 'category', '39', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489421147');
INSERT INTO `bbs_action_log` VALUES ('36', '11', '1', '0', 'category', '40', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489421153');
INSERT INTO `bbs_action_log` VALUES ('37', '11', '1', '0', 'category', '42', '操作url：/bbs/index.php?s=/Admin/Category/edit.html', '1', '1489421159');
INSERT INTO `bbs_action_log` VALUES ('38', '4', '2', '0', 'document', '21', 'hfhui在2017-03-14 00:07发表了一篇文章。\r\n表document，记录编号21。', '1', '1489421275');
INSERT INTO `bbs_action_log` VALUES ('39', '4', '2', '0', 'document', '22', 'hfhui在2017-03-14 00:09发表了一篇文章。\r\n表document，记录编号22。', '1', '1489421375');
INSERT INTO `bbs_action_log` VALUES ('40', '1', '1', '3074389808', 'member', '1', 'admin在2017-03-17 21:38登录了后台', '1', '1489757891');
INSERT INTO `bbs_action_log` VALUES ('41', '1', '1', '3074389808', 'member', '1', 'admin在2017-03-17 21:38登录了后台', '1', '1489757920');
INSERT INTO `bbs_action_log` VALUES ('42', '1', '1', '3074389808', 'member', '1', 'admin在2017-03-17 23:59登录了后台', '1', '1489766398');
INSERT INTO `bbs_action_log` VALUES ('43', '1', '1', '3085702026', 'member', '1', 'admin在2017-03-23 00:42登录了后台', '1', '1490200969');
INSERT INTO `bbs_action_log` VALUES ('44', '1', '1', '3074389798', 'member', '1', 'admin在2017-03-23 11:29登录了后台', '1', '1490239752');
INSERT INTO `bbs_action_log` VALUES ('45', '1', '1', '3085702063', 'member', '1', 'admin在2017-03-24 00:47登录了后台', '1', '1490287665');
INSERT INTO `bbs_action_log` VALUES ('46', '1', '1', '3074389796', 'member', '1', 'admin在2017-04-01 17:52登录了后台', '1', '1491040343');
INSERT INTO `bbs_action_log` VALUES ('47', '1', '1', '3074389796', 'member', '1', 'admin在2017-04-01 17:55登录了后台', '1', '1491040533');
INSERT INTO `bbs_action_log` VALUES ('48', '1', '1', '0', 'member', '1', 'admin在2017-04-05 16:59登录了后台', '1', '1491382744');
INSERT INTO `bbs_action_log` VALUES ('49', '1', '1', '0', 'member', '1', 'admin在2017-04-11 17:27登录了后台', '1', '1491902820');
INSERT INTO `bbs_action_log` VALUES ('50', '1', '1', '0', 'member', '1', 'admin在2017-04-11 17:30登录了后台', '1', '1491903018');
INSERT INTO `bbs_action_log` VALUES ('51', '1', '1', '0', 'member', '1', 'admin在2017-04-11 17:51登录了后台', '1', '1491904263');
INSERT INTO `bbs_action_log` VALUES ('52', '1', '1', '0', 'member', '1', 'admin在2017-04-11 17:54登录了后台', '1', '1491904476');
INSERT INTO `bbs_action_log` VALUES ('53', '1', '1', '0', 'member', '1', 'admin在2017-04-13 20:37登录了后台', '1', '1492087021');
INSERT INTO `bbs_action_log` VALUES ('54', '1', '1', '0', 'member', '1', 'admin在2017-04-13 21:04登录了后台', '1', '1492088669');
INSERT INTO `bbs_action_log` VALUES ('55', '1', '1', '0', 'member', '1', 'admin在2017-04-23 22:19登录了后台', '1', '1492957160');
INSERT INTO `bbs_action_log` VALUES ('56', '1', '2', '0', 'member', '2', 'hfhui在2017-04-23 22:21登录了后台', '1', '1492957284');
INSERT INTO `bbs_action_log` VALUES ('57', '1', '1', '0', 'member', '1', 'admin在2017-04-23 22:21登录了后台', '1', '1492957303');
INSERT INTO `bbs_action_log` VALUES ('58', '1', '2', '0', 'member', '2', 'hfhui在2017-04-23 22:32登录了后台', '1', '1492957938');
INSERT INTO `bbs_action_log` VALUES ('59', '1', '1', '0', 'member', '1', 'admin在2017-04-23 22:32登录了后台', '1', '1492957959');
INSERT INTO `bbs_action_log` VALUES ('60', '1', '1', '0', 'member', '1', 'admin在2017-04-23 22:33登录了后台', '1', '1492958005');
INSERT INTO `bbs_action_log` VALUES ('61', '1', '1', '0', 'member', '1', 'admin在2017-04-24 11:05登录了后台', '1', '1493003104');
INSERT INTO `bbs_action_log` VALUES ('62', '1', '1', '0', 'member', '1', 'admin在2017-04-26 11:16登录了后台', '1', '1493176588');
INSERT INTO `bbs_action_log` VALUES ('63', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 11:30登录了后台', '1', '1493177411');
INSERT INTO `bbs_action_log` VALUES ('64', '1', '1', '0', 'member', '1', 'admin在2017-04-26 11:42登录了后台', '1', '1493178165');
INSERT INTO `bbs_action_log` VALUES ('65', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del/id/93.html', '1', '1493178179');
INSERT INTO `bbs_action_log` VALUES ('66', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 11:57登录了后台', '1', '1493179028');
INSERT INTO `bbs_action_log` VALUES ('67', '1', '1', '0', 'member', '1', 'admin在2017-04-26 11:57登录了后台', '1', '1493179049');
INSERT INTO `bbs_action_log` VALUES ('68', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 11:58登录了后台', '1', '1493179115');
INSERT INTO `bbs_action_log` VALUES ('69', '1', '1', '0', 'member', '1', 'admin在2017-04-26 12:03登录了后台', '1', '1493179385');
INSERT INTO `bbs_action_log` VALUES ('70', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 12:03登录了后台', '1', '1493179438');
INSERT INTO `bbs_action_log` VALUES ('71', '10', '1', '0', 'Menu', '127', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493180881');
INSERT INTO `bbs_action_log` VALUES ('72', '10', '1', '0', 'Menu', '128', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493180941');
INSERT INTO `bbs_action_log` VALUES ('73', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del.html', '1', '1493181037');
INSERT INTO `bbs_action_log` VALUES ('74', '10', '1', '0', 'Menu', '123', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493186006');
INSERT INTO `bbs_action_log` VALUES ('75', '10', '1', '0', 'Menu', '129', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493186067');
INSERT INTO `bbs_action_log` VALUES ('76', '10', '1', '0', 'Menu', '130', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493186479');
INSERT INTO `bbs_action_log` VALUES ('77', '10', '1', '0', 'Menu', '131', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493186519');
INSERT INTO `bbs_action_log` VALUES ('78', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del/id/124.html', '1', '1493186537');
INSERT INTO `bbs_action_log` VALUES ('79', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del/id/125.html', '1', '1493186546');
INSERT INTO `bbs_action_log` VALUES ('80', '10', '1', '0', 'Menu', '132', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493186556');
INSERT INTO `bbs_action_log` VALUES ('81', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del/id/126.html', '1', '1493186565');
INSERT INTO `bbs_action_log` VALUES ('82', '10', '1', '0', 'Menu', '133', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493186578');
INSERT INTO `bbs_action_log` VALUES ('83', '10', '1', '0', 'Menu', '123', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493187087');
INSERT INTO `bbs_action_log` VALUES ('84', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 14:25登录了后台', '1', '1493187928');
INSERT INTO `bbs_action_log` VALUES ('85', '1', '1', '0', 'member', '1', 'admin在2017-04-26 14:26登录了后台', '1', '1493187997');
INSERT INTO `bbs_action_log` VALUES ('86', '1', '1', '0', 'member', '1', 'admin在2017-04-26 14:46登录了后台', '1', '1493189210');
INSERT INTO `bbs_action_log` VALUES ('87', '1', '1', '0', 'member', '1', 'admin在2017-04-26 14:48登录了后台', '1', '1493189300');
INSERT INTO `bbs_action_log` VALUES ('88', '1', '1', '0', 'member', '1', 'admin在2017-04-26 14:50登录了后台', '1', '1493189447');
INSERT INTO `bbs_action_log` VALUES ('89', '10', '1', '0', 'Menu', '134', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493189601');
INSERT INTO `bbs_action_log` VALUES ('90', '10', '1', '0', 'Menu', '135', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493189624');
INSERT INTO `bbs_action_log` VALUES ('91', '10', '1', '0', 'Menu', '136', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493189643');
INSERT INTO `bbs_action_log` VALUES ('92', '1', '1', '0', 'member', '1', 'admin在2017-04-26 14:56登录了后台', '1', '1493189788');
INSERT INTO `bbs_action_log` VALUES ('93', '10', '1', '0', 'Menu', '137', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493189833');
INSERT INTO `bbs_action_log` VALUES ('94', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 14:58登录了后台', '1', '1493189896');
INSERT INTO `bbs_action_log` VALUES ('95', '10', '1', '0', 'Menu', '138', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493190158');
INSERT INTO `bbs_action_log` VALUES ('96', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del/id/132.html', '1', '1493190166');
INSERT INTO `bbs_action_log` VALUES ('97', '10', '1', '0', 'Menu', '138', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493190213');
INSERT INTO `bbs_action_log` VALUES ('98', '10', '1', '0', 'Menu', '138', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493190237');
INSERT INTO `bbs_action_log` VALUES ('99', '10', '1', '0', 'Menu', '139', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493190282');
INSERT INTO `bbs_action_log` VALUES ('100', '10', '1', '0', 'Menu', '0', '操作url：/bbs/index.php?s=/Admin/Menu/del/id/139.html', '1', '1493190347');
INSERT INTO `bbs_action_log` VALUES ('101', '10', '1', '0', 'Menu', '140', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493190374');
INSERT INTO `bbs_action_log` VALUES ('102', '1', '1', '0', 'member', '1', 'admin在2017-04-26 15:19登录了后台', '1', '1493191195');
INSERT INTO `bbs_action_log` VALUES ('103', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 15:21登录了后台', '1', '1493191262');
INSERT INTO `bbs_action_log` VALUES ('104', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 15:22登录了后台', '1', '1493191350');
INSERT INTO `bbs_action_log` VALUES ('105', '1', '1', '0', 'member', '1', 'admin在2017-04-26 15:23登录了后台', '1', '1493191414');
INSERT INTO `bbs_action_log` VALUES ('106', '1', '1', '0', 'member', '1', 'admin在2017-04-26 15:23登录了后台', '1', '1493191414');
INSERT INTO `bbs_action_log` VALUES ('107', '10', '1', '0', 'Menu', '141', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493191599');
INSERT INTO `bbs_action_log` VALUES ('108', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 15:27登录了后台', '1', '1493191654');
INSERT INTO `bbs_action_log` VALUES ('109', '1', '1', '0', 'member', '1', 'admin在2017-04-26 15:28登录了后台', '1', '1493191690');
INSERT INTO `bbs_action_log` VALUES ('110', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 15:29登录了后台', '1', '1493191744');
INSERT INTO `bbs_action_log` VALUES ('111', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 15:37登录了后台', '1', '1493192241');
INSERT INTO `bbs_action_log` VALUES ('112', '1', '1', '0', 'member', '1', 'admin在2017-04-26 15:38登录了后台', '1', '1493192290');
INSERT INTO `bbs_action_log` VALUES ('113', '1', '1', '0', 'member', '1', 'admin在2017-04-26 17:52登录了后台', '1', '1493200323');
INSERT INTO `bbs_action_log` VALUES ('114', '10', '1', '0', 'Menu', '142', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493200494');
INSERT INTO `bbs_action_log` VALUES ('115', '1', '1', '0', 'member', '1', 'admin在2017-04-26 17:56登录了后台', '1', '1493200579');
INSERT INTO `bbs_action_log` VALUES ('116', '10', '1', '0', 'Menu', '143', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493200656');
INSERT INTO `bbs_action_log` VALUES ('117', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 17:59登录了后台', '1', '1493200770');
INSERT INTO `bbs_action_log` VALUES ('118', '1', '1', '0', 'member', '1', 'admin在2017-04-26 18:25登录了后台', '1', '1493202312');
INSERT INTO `bbs_action_log` VALUES ('119', '1', '1', '0', 'member', '1', 'admin在2017-04-26 21:16登录了后台', '1', '1493212611');
INSERT INTO `bbs_action_log` VALUES ('120', '10', '1', '0', 'Menu', '144', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493212665');
INSERT INTO `bbs_action_log` VALUES ('121', '1', '2', '0', 'member', '2', 'hfhui在2017-04-26 21:20登录了后台', '1', '1493212836');
INSERT INTO `bbs_action_log` VALUES ('122', '1', '1', '0', 'member', '1', 'admin在2017-04-27 12:40登录了后台', '1', '1493268018');
INSERT INTO `bbs_action_log` VALUES ('123', '1', '2', '0', 'member', '2', 'hfhui在2017-04-27 12:40登录了后台', '1', '1493268035');
INSERT INTO `bbs_action_log` VALUES ('124', '1', '1', '0', 'member', '1', 'admin在2017-04-27 21:59登录了后台', '1', '1493301567');
INSERT INTO `bbs_action_log` VALUES ('125', '10', '1', '0', 'Menu', '145', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493301611');
INSERT INTO `bbs_action_log` VALUES ('126', '10', '1', '0', 'Menu', '142', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493301634');
INSERT INTO `bbs_action_log` VALUES ('127', '1', '1', '0', 'member', '1', 'admin在2017-04-27 22:02登录了后台', '1', '1493301731');
INSERT INTO `bbs_action_log` VALUES ('128', '1', '2', '0', 'member', '2', 'hfhui在2017-04-27 22:12登录了后台', '1', '1493302328');
INSERT INTO `bbs_action_log` VALUES ('129', '1', '2', '0', 'member', '2', 'hfhui在2017-04-27 22:25登录了后台', '1', '1493303145');
INSERT INTO `bbs_action_log` VALUES ('130', '1', '1', '0', 'member', '1', 'admin在2017-04-27 22:57登录了后台', '1', '1493305037');
INSERT INTO `bbs_action_log` VALUES ('131', '1', '1', '0', 'member', '1', 'admin在2017-04-27 22:58登录了后台', '1', '1493305112');
INSERT INTO `bbs_action_log` VALUES ('132', '1', '3', '0', 'member', '3', 'abc在2017-04-27 23:14登录了后台', '1', '1493306054');
INSERT INTO `bbs_action_log` VALUES ('133', '1', '1', '0', 'member', '1', 'admin在2017-04-27 23:14登录了后台', '1', '1493306082');
INSERT INTO `bbs_action_log` VALUES ('134', '1', '4', '0', 'member', '4', 'abcd在2017-04-27 23:15登录了后台', '1', '1493306137');
INSERT INTO `bbs_action_log` VALUES ('135', '1', '3', '0', 'member', '3', 'abc在2017-04-27 23:15登录了后台', '1', '1493306156');
INSERT INTO `bbs_action_log` VALUES ('136', '1', '5', '0', 'member', '5', '123在2017-04-27 23:20登录了后台', '1', '1493306427');
INSERT INTO `bbs_action_log` VALUES ('137', '1', '6', '0', 'member', '6', '12345在2017-04-27 23:25登录了后台', '1', '1493306701');
INSERT INTO `bbs_action_log` VALUES ('138', '1', '7', '0', 'member', '7', '1234在2017-04-27 23:25登录了后台', '1', '1493306752');
INSERT INTO `bbs_action_log` VALUES ('139', '1', '1', '0', 'member', '1', 'admin在2017-04-27 23:26登录了后台', '1', '1493306781');
INSERT INTO `bbs_action_log` VALUES ('140', '1', '2', '0', 'member', '2', 'hfhui在2017-04-29 12:24登录了后台', '1', '1493439892');
INSERT INTO `bbs_action_log` VALUES ('141', '4', '2', '0', 'document', '23', 'hfhui在2017-04-29 12:25发表了一篇文章。\r\n表document，记录编号23。', '1', '1493439953');
INSERT INTO `bbs_action_log` VALUES ('142', '1', '1', '0', 'member', '1', 'admin在2017-04-29 18:00登录了后台', '1', '1493460035');
INSERT INTO `bbs_action_log` VALUES ('143', '1', '1', '0', 'member', '1', 'admin在2017-04-29 18:04登录了后台', '1', '1493460295');
INSERT INTO `bbs_action_log` VALUES ('144', '10', '1', '0', 'Menu', '146', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493460340');
INSERT INTO `bbs_action_log` VALUES ('145', '1', '1', '0', 'member', '1', 'admin在2017-04-29 18:18登录了后台', '1', '1493461110');
INSERT INTO `bbs_action_log` VALUES ('146', '1', '1', '0', 'member', '1', 'admin在2017-04-29 18:19登录了后台', '1', '1493461142');
INSERT INTO `bbs_action_log` VALUES ('147', '10', '1', '0', 'Menu', '146', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493461166');
INSERT INTO `bbs_action_log` VALUES ('148', '1', '1', '0', 'member', '1', 'admin在2017-04-29 19:00登录了后台', '1', '1493463610');
INSERT INTO `bbs_action_log` VALUES ('149', '1', '8', '0', 'member', '8', 'test在2017-05-02 13:39登录了后台', '1', '1493703590');
INSERT INTO `bbs_action_log` VALUES ('150', '1', '1', '0', 'member', '1', 'admin在2017-05-02 13:40登录了后台', '1', '1493703641');
INSERT INTO `bbs_action_log` VALUES ('151', '1', '2', '0', 'member', '2', 'hfhui在2017-05-02 13:40登录了后台', '1', '1493703653');
INSERT INTO `bbs_action_log` VALUES ('152', '1', '1', '0', 'member', '1', 'admin在2017-05-02 13:41登录了后台', '1', '1493703667');
INSERT INTO `bbs_action_log` VALUES ('153', '1', '8', '0', 'member', '8', 'test在2017-05-02 13:41登录了后台', '1', '1493703717');
INSERT INTO `bbs_action_log` VALUES ('154', '4', '8', '0', 'document', '24', 'test在2017-05-02 13:42发表了一篇文章。\r\n表document，记录编号24。', '1', '1493703773');
INSERT INTO `bbs_action_log` VALUES ('155', '1', '1', '0', 'member', '1', 'admin在2017-05-02 13:43登录了后台', '1', '1493703817');
INSERT INTO `bbs_action_log` VALUES ('156', '1', '1', '0', 'member', '1', 'admin在2017-05-04 10:57登录了后台', '1', '1493866646');
INSERT INTO `bbs_action_log` VALUES ('157', '10', '1', '0', 'Menu', '147', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493866976');
INSERT INTO `bbs_action_log` VALUES ('158', '10', '1', '0', 'Menu', '147', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493867035');
INSERT INTO `bbs_action_log` VALUES ('159', '10', '1', '0', 'Menu', '148', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493870037');
INSERT INTO `bbs_action_log` VALUES ('160', '10', '1', '0', 'Menu', '148', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493870730');
INSERT INTO `bbs_action_log` VALUES ('161', '10', '1', '0', 'Menu', '148', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1493870781');
INSERT INTO `bbs_action_log` VALUES ('162', '1', '1', '0', 'member', '1', 'admin在2017-05-04 21:10登录了后台', '1', '1493903443');
INSERT INTO `bbs_action_log` VALUES ('163', '1', '1', '0', 'member', '1', 'admin在2017-05-05 09:46登录了后台', '1', '1493948814');
INSERT INTO `bbs_action_log` VALUES ('164', '10', '1', '0', 'Menu', '149', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1493949214');
INSERT INTO `bbs_action_log` VALUES ('165', '1', '1', '0', 'member', '1', 'admin在2017-05-05 16:27登录了后台', '1', '1493972850');
INSERT INTO `bbs_action_log` VALUES ('166', '1', '1', '0', 'member', '1', 'admin在2017-05-06 10:18登录了后台', '1', '1494037128');
INSERT INTO `bbs_action_log` VALUES ('167', '1', '2', '0', 'member', '2', 'hfhui在2017-05-06 10:23登录了后台', '1', '1494037411');
INSERT INTO `bbs_action_log` VALUES ('168', '1', '2', '0', 'member', '2', 'hfhui在2017-05-06 10:49登录了后台', '1', '1494038981');
INSERT INTO `bbs_action_log` VALUES ('169', '1', '1', '0', 'member', '1', 'admin在2017-05-14 10:02登录了后台', '1', '1494727365');
INSERT INTO `bbs_action_log` VALUES ('170', '1', '1', '0', 'member', '1', 'admin在2017-05-14 12:33登录了后台', '1', '1494736403');
INSERT INTO `bbs_action_log` VALUES ('171', '1', '1', '0', 'member', '1', 'admin在2017-05-15 10:50登录了后台', '1', '1494816601');
INSERT INTO `bbs_action_log` VALUES ('172', '1', '1', '0', 'member', '1', 'admin在2017-05-15 11:18登录了后台', '1', '1494818314');
INSERT INTO `bbs_action_log` VALUES ('173', '1', '1', '0', 'member', '1', 'admin在2017-05-16 11:21登录了后台', '1', '1494904914');
INSERT INTO `bbs_action_log` VALUES ('174', '1', '1', '0', 'member', '1', 'admin在2017-05-18 16:06登录了后台', '1', '1495094765');
INSERT INTO `bbs_action_log` VALUES ('175', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 16:08登录了后台', '1', '1495094928');
INSERT INTO `bbs_action_log` VALUES ('176', '1', '1', '0', 'member', '1', 'admin在2017-05-18 16:09登录了后台', '1', '1495094952');
INSERT INTO `bbs_action_log` VALUES ('177', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 16:09登录了后台', '1', '1495094983');
INSERT INTO `bbs_action_log` VALUES ('178', '1', '1', '0', 'member', '1', 'admin在2017-05-18 16:11登录了后台', '1', '1495095064');
INSERT INTO `bbs_action_log` VALUES ('179', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 16:12登录了后台', '1', '1495095171');
INSERT INTO `bbs_action_log` VALUES ('180', '1', '1', '0', 'member', '1', 'admin在2017-05-18 17:30登录了后台', '1', '1495099854');
INSERT INTO `bbs_action_log` VALUES ('181', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 18:02登录了后台', '1', '1495101726');
INSERT INTO `bbs_action_log` VALUES ('182', '1', '1', '0', 'member', '1', 'admin在2017-05-18 18:02登录了后台', '1', '1495101764');
INSERT INTO `bbs_action_log` VALUES ('183', '10', '1', '0', 'Menu', '150', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1495101817');
INSERT INTO `bbs_action_log` VALUES ('184', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 18:04登录了后台', '1', '1495101869');
INSERT INTO `bbs_action_log` VALUES ('185', '1', '1', '0', 'member', '1', 'admin在2017-05-18 19:23登录了后台', '1', '1495106597');
INSERT INTO `bbs_action_log` VALUES ('186', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 19:23登录了后台', '1', '1495106623');
INSERT INTO `bbs_action_log` VALUES ('187', '1', '1', '0', 'member', '1', 'admin在2017-05-18 19:24登录了后台', '1', '1495106644');
INSERT INTO `bbs_action_log` VALUES ('188', '1', '1', '0', 'member', '1', 'admin在2017-05-18 20:02登录了后台', '1', '1495108943');
INSERT INTO `bbs_action_log` VALUES ('189', '10', '1', '0', 'Menu', '151', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1495110890');
INSERT INTO `bbs_action_log` VALUES ('190', '10', '1', '0', 'Menu', '151', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1495110941');
INSERT INTO `bbs_action_log` VALUES ('191', '10', '1', '0', 'Menu', '152', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1495113096');
INSERT INTO `bbs_action_log` VALUES ('192', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 21:39登录了后台', '1', '1495114786');
INSERT INTO `bbs_action_log` VALUES ('193', '1', '1', '0', 'member', '1', 'admin在2017-05-18 21:41登录了后台', '1', '1495114869');
INSERT INTO `bbs_action_log` VALUES ('194', '1', '1', '0', 'member', '1', 'admin在2017-05-18 21:42登录了后台', '1', '1495114924');
INSERT INTO `bbs_action_log` VALUES ('195', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 21:42登录了后台', '1', '1495114962');
INSERT INTO `bbs_action_log` VALUES ('196', '1', '1', '0', 'member', '1', 'admin在2017-05-18 21:43登录了后台', '1', '1495114981');
INSERT INTO `bbs_action_log` VALUES ('197', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 21:43登录了后台', '1', '1495115037');
INSERT INTO `bbs_action_log` VALUES ('198', '1', '1', '0', 'member', '1', 'admin在2017-05-18 22:12登录了后台', '1', '1495116723');
INSERT INTO `bbs_action_log` VALUES ('199', '10', '1', '0', 'Menu', '153', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1495116790');
INSERT INTO `bbs_action_log` VALUES ('200', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 22:13登录了后台', '1', '1495116814');
INSERT INTO `bbs_action_log` VALUES ('201', '1', '1', '0', 'member', '1', 'admin在2017-05-18 22:52登录了后台', '1', '1495119177');
INSERT INTO `bbs_action_log` VALUES ('202', '10', '1', '0', 'Menu', '152', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1495119276');
INSERT INTO `bbs_action_log` VALUES ('203', '10', '1', '0', 'Menu', '152', '操作url：/bbs/index.php?s=/Admin/Menu/edit.html', '1', '1495119292');
INSERT INTO `bbs_action_log` VALUES ('204', '10', '1', '0', 'Menu', '154', '操作url：/bbs/index.php?s=/Admin/Menu/add.html', '1', '1495119320');
INSERT INTO `bbs_action_log` VALUES ('205', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 22:55登录了后台', '1', '1495119336');
INSERT INTO `bbs_action_log` VALUES ('206', '1', '1', '0', 'member', '1', 'admin在2017-05-18 22:55登录了后台', '1', '1495119357');
INSERT INTO `bbs_action_log` VALUES ('207', '1', '2', '0', 'member', '2', 'hfhui在2017-05-18 22:56登录了后台', '1', '1495119375');
INSERT INTO `bbs_action_log` VALUES ('208', '1', '2', '0', 'member', '2', 'hfhui在2017-05-19 09:38登录了后台', '1', '1495157907');
INSERT INTO `bbs_action_log` VALUES ('209', '1', '1', '0', 'member', '1', 'admin在2017-05-19 09:42登录了后台', '1', '1495158158');
INSERT INTO `bbs_action_log` VALUES ('210', '1', '8', '0', 'member', '8', 'test在2017-05-19 09:43登录了后台', '1', '1495158213');
INSERT INTO `bbs_action_log` VALUES ('211', '1', '1', '0', 'member', '1', 'admin在2017-05-19 09:44登录了后台', '1', '1495158288');
INSERT INTO `bbs_action_log` VALUES ('212', '1', '8', '0', 'member', '8', 'test在2017-05-19 09:45登录了后台', '1', '1495158344');
INSERT INTO `bbs_action_log` VALUES ('213', '1', '2', '0', 'member', '2', 'hfhui在2017-05-19 10:38登录了后台', '1', '1495161536');
INSERT INTO `bbs_action_log` VALUES ('214', '1', '8', '0', 'member', '8', 'test在2017-05-19 10:46登录了后台', '1', '1495161990');
INSERT INTO `bbs_action_log` VALUES ('215', '1', '1', '0', 'member', '1', 'admin在2017-05-19 11:09登录了后台', '1', '1495163348');
INSERT INTO `bbs_action_log` VALUES ('216', '1', '2', '0', 'member', '2', 'hfhui在2017-05-19 11:09登录了后台', '1', '1495163374');
INSERT INTO `bbs_action_log` VALUES ('217', '1', '8', '0', 'member', '8', 'test在2017-05-19 11:54登录了后台', '1', '1495166087');

-- ----------------------------
-- Table structure for bbs_addons
-- ----------------------------
DROP TABLE IF EXISTS `bbs_addons`;
CREATE TABLE `bbs_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of bbs_addons
-- ----------------------------
INSERT INTO `bbs_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `bbs_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `bbs_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `bbs_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `bbs_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"350px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `bbs_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `bbs_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for bbs_attachment
-- ----------------------------
DROP TABLE IF EXISTS `bbs_attachment`;
CREATE TABLE `bbs_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of bbs_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_attribute
-- ----------------------------
DROP TABLE IF EXISTS `bbs_attribute`;
CREATE TABLE `bbs_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of bbs_attribute
-- ----------------------------
INSERT INTO `bbs_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bbs_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bbs_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bbs_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bbs_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bbs_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for bbs_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `bbs_auth_extend`;
CREATE TABLE `bbs_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of bbs_auth_extend
-- ----------------------------
INSERT INTO `bbs_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `bbs_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `bbs_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `bbs_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `bbs_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `bbs_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `bbs_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `bbs_auth_extend` VALUES ('1', '37', '1');
INSERT INTO `bbs_auth_extend` VALUES ('3', '1', '1');
INSERT INTO `bbs_auth_extend` VALUES ('3', '2', '1');
INSERT INTO `bbs_auth_extend` VALUES ('3', '39', '1');
INSERT INTO `bbs_auth_extend` VALUES ('3', '40', '1');
INSERT INTO `bbs_auth_extend` VALUES ('3', '42', '1');
INSERT INTO `bbs_auth_extend` VALUES ('4', '2', '1');
INSERT INTO `bbs_auth_extend` VALUES ('4', '39', '1');
INSERT INTO `bbs_auth_extend` VALUES ('4', '40', '1');
INSERT INTO `bbs_auth_extend` VALUES ('4', '42', '1');

-- ----------------------------
-- Table structure for bbs_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `bbs_auth_group`;
CREATE TABLE `bbs_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_auth_group
-- ----------------------------
INSERT INTO `bbs_auth_group` VALUES ('3', 'admin', '1', '管理员', '管理员用户组，拥有后台管理权限', '1', '1,2,3,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,100,102,103,107,108,109,110,205,206,207,208,211,212,213,214,215,216,224,225,226,228,229,230,231,232,233,234,235,236,237,238,239,240,242,243,244,245,247,248,249,250');
INSERT INTO `bbs_auth_group` VALUES ('4', 'admin', '1', '普通用户组', '成功注册的普通用户', '1', '224,225,226,228,229,230,231,232,233,234,235,236,237,238,239,240,242');
INSERT INTO `bbs_auth_group` VALUES ('5', 'admin', '1', '游客组', '未注册的用户', '1', '228,230,231,232,233,234,237,238');

-- ----------------------------
-- Table structure for bbs_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `bbs_auth_group_access`;
CREATE TABLE `bbs_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_auth_group_access
-- ----------------------------
INSERT INTO `bbs_auth_group_access` VALUES ('2', '3');
INSERT INTO `bbs_auth_group_access` VALUES ('2', '4');
INSERT INTO `bbs_auth_group_access` VALUES ('3', '4');
INSERT INTO `bbs_auth_group_access` VALUES ('4', '4');
INSERT INTO `bbs_auth_group_access` VALUES ('5', '4');
INSERT INTO `bbs_auth_group_access` VALUES ('6', '4');
INSERT INTO `bbs_auth_group_access` VALUES ('7', '4');
INSERT INTO `bbs_auth_group_access` VALUES ('8', '3');
INSERT INTO `bbs_auth_group_access` VALUES ('8', '4');

-- ----------------------------
-- Table structure for bbs_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `bbs_auth_rule`;
CREATE TABLE `bbs_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_auth_rule
-- ----------------------------
INSERT INTO `bbs_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('227', 'admin', '2', 'Home/Home/home', '前台', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('228', 'admin', '1', 'Home/Index/index', '网站首页', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('230', 'admin', '2', 'Home/Index/home', '前台', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('231', 'admin', '1', 'Home/User/index', '登录注册', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('229', 'admin', '1', 'Home/UserCenter/index', '用户中心', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('224', 'admin', '1', 'Home/UserCenter/articles', '帖子列表', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('225', 'admin', '1', 'Home/UserCenter/userInfo', '个人信息', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('226', 'admin', '1', 'Home/UserCenter/modifyPassword', '修改密码', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('232', 'admin', '1', 'Home/User/login', '用户登录', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('233', 'admin', '1', 'Home/User/register', '用户注册', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('234', 'admin', '1', 'Home/User/verify', '前台验证码', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('235', 'admin', '1', 'Home/UserCenter/modifyPasswordAjax', '提交密码', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('236', 'admin', '1', 'Home/User/logout', '用户登出', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('237', 'admin', '1', 'Home/Article/detail', '文章详情', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('238', 'admin', '1', 'Home/Article/lists', '文章列表', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('239', 'admin', '1', 'Home/Article/publish', '发表文章', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('240', 'admin', '1', 'Home/Collection/collect', '收藏功能', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('241', 'admin', '1', 'Home/Article/collections', '收藏列表', '-1', '');
INSERT INTO `bbs_auth_rule` VALUES ('242', 'admin', '1', 'Home/UserCenter/collections', '收藏列表', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('243', 'admin', '1', 'Admin/DynamicAuth/index', '动态权限', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('244', 'admin', '1', 'Admin/DynamicAuth/add', '申请权限', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('245', 'admin', '1', 'Admin/DynamicAuth/detail', '申请详情', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('246', 'admin', '1', 'Admin/DynamicAuth/recycle', '回收权限', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('247', 'admin', '1', 'Admin/AuthTransfer/index', '权限转移', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('248', 'admin', '1', 'Admin/AuthTransfer/transfer', '转移查看', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('249', 'admin', '1', 'Admin/AuthTransfer/detail', '权限详情', '1', '');
INSERT INTO `bbs_auth_rule` VALUES ('250', 'admin', '1', 'Admin/AuthTransfer/transferAuth', '转移操作', '1', '');

-- ----------------------------
-- Table structure for bbs_auth_transfer
-- ----------------------------
DROP TABLE IF EXISTS `bbs_auth_transfer`;
CREATE TABLE `bbs_auth_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `auth_id` int(10) NOT NULL COMMENT '被转移权限id',
  `operator` int(10) NOT NULL COMMENT '操作者',
  `inheritor` int(10) NOT NULL COMMENT '继承者',
  `build_time` int(10) NOT NULL DEFAULT '0' COMMENT '转移时间',
  `valid_time` int(10) NOT NULL DEFAULT '0' COMMENT '权限剩余有效期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_auth_transfer
-- ----------------------------
INSERT INTO `bbs_auth_transfer` VALUES ('3', '12', '8', '2', '1495162078', '82633');
INSERT INTO `bbs_auth_transfer` VALUES ('4', '11', '8', '2', '1495163289', '81428');
INSERT INTO `bbs_auth_transfer` VALUES ('5', '10', '8', '2', '1495163325', '38199');
INSERT INTO `bbs_auth_transfer` VALUES ('6', '12', '2', '8', '1495163599', '81112');
INSERT INTO `bbs_auth_transfer` VALUES ('7', '10', '2', '8', '1495165961', '35563');
INSERT INTO `bbs_auth_transfer` VALUES ('8', '11', '2', '8', '1495166075', '78642');
INSERT INTO `bbs_auth_transfer` VALUES ('9', '12', '8', '2', '1495166114', '78597');

-- ----------------------------
-- Table structure for bbs_category
-- ----------------------------
DROP TABLE IF EXISTS `bbs_category`;
CREATE TABLE `bbs_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of bbs_category
-- ----------------------------
INSERT INTO `bbs_category` VALUES ('1', 'article', '帖子', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1489334251', '1', '0');
INSERT INTO `bbs_category` VALUES ('2', 'blog_default', 'geeks', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '2', '1', '0', '0', '1', '', '1379475028', '1489421139', '1', '31');
INSERT INTO `bbs_category` VALUES ('39', 'article_web', 'web', '1', '2', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '2', '1', '1', '0', '', '', '1489334372', '1489421147', '1', '0');
INSERT INTO `bbs_category` VALUES ('40', 'article_andriod', 'andriod', '1', '3', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '2', '1', '1', '0', '', '', '1489334430', '1489421153', '1', '0');
INSERT INTO `bbs_category` VALUES ('42', 'article_ios', 'ios', '1', '4', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '2', '1', '1', '0', '', '', '1489334459', '1489421159', '1', '0');

-- ----------------------------
-- Table structure for bbs_channel
-- ----------------------------
DROP TABLE IF EXISTS `bbs_channel`;
CREATE TABLE `bbs_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_channel
-- ----------------------------
INSERT INTO `bbs_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `bbs_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '0', '0');
INSERT INTO `bbs_channel` VALUES ('3', '0', '官网', 'http://blog.hfhui.cn', '3', '1379475154', '1489369663', '1', '1');

-- ----------------------------
-- Table structure for bbs_collection
-- ----------------------------
DROP TABLE IF EXISTS `bbs_collection`;
CREATE TABLE `bbs_collection` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `article_ids` text COMMENT '收藏的文章ID序列',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_collection
-- ----------------------------
INSERT INTO `bbs_collection` VALUES ('1', '2', '18,22');
INSERT INTO `bbs_collection` VALUES ('2', '1', '22,13,11,23,18');
INSERT INTO `bbs_collection` VALUES ('3', '3', '22');
INSERT INTO `bbs_collection` VALUES ('4', '8', '23');

-- ----------------------------
-- Table structure for bbs_config
-- ----------------------------
DROP TABLE IF EXISTS `bbs_config`;
CREATE TABLE `bbs_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_config
-- ----------------------------
INSERT INTO `bbs_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'Noodle', '0');
INSERT INTO `bbs_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'Noodle-互联网论坛', '1');
INSERT INTO `bbs_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'Noodle,noodle', '8');
INSERT INTO `bbs_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `bbs_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `bbs_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `bbs_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `bbs_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `bbs_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `bbs_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `bbs_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `bbs_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `bbs_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `bbs_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `bbs_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `bbs_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `bbs_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `bbs_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `bbs_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `bbs_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `bbs_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `bbs_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `bbs_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `bbs_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `bbs_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `bbs_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `bbs_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for bbs_document
-- ----------------------------
DROP TABLE IF EXISTS `bbs_document`;
CREATE TABLE `bbs_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of bbs_document
-- ----------------------------
INSERT INTO `bbs_document` VALUES ('1', '1', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '29', '0', '0', '0', '1387260660', '1387263112', '1');
INSERT INTO `bbs_document` VALUES ('2', '1', '', '电子公告牌系统', '2', '（电子公告板）一般指电子公告牌系统', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '10', '0', '0', '0', '1489371738', '1489371738', '1');
INSERT INTO `bbs_document` VALUES ('18', '2', '', 'VUE （3D渲染解决方案产品）', '39', 'Vue系列产品为3D自然环境的动画制作和渲染提供了一系列的解决方案。Vue系列有很多不同的产品，这是为了满足不同阶层的用户的需要：可以满足专业的制作工作室，同样也能满足3D自由艺术家。', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '84', '0', '0', '0', '1489420365', '1489420365', '1');
INSERT INTO `bbs_document` VALUES ('17', '1', '', 'jquery', '39', 'Query是一个快速、简洁的JavaScript框架，是继Prototype之后又一个优秀的JavaScript代码库（或JavaScript框架）。jQuery设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。它封装JavaScript常用', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '16', '0', '0', '0', '1489417479', '1489417479', '1');
INSERT INTO `bbs_document` VALUES ('13', '1', '', 'JS', '39', 'JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型。它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言，最早是在HTML（标准通用标记语言下的一个应用）网页上使用，用来给HTML网页增加动态功能。', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '11', '0', '0', '0', '1489416875', '1489416875', '1');
INSERT INTO `bbs_document` VALUES ('12', '1', '', 'HTML', '2', '超文本标记语言，标准通用标记语言下的一个应用。', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1489416518', '1489416518', '1');
INSERT INTO `bbs_document` VALUES ('11', '1', '', 'CSS （层叠样式表）', '2', '层叠样式表(英文全称：Cascading Style Sheets)是一种用来表现HTML（标准通用标记语言的一个应用）或XML（标准通用标记语言的一个子集）等文件样式的计算机语言。', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '7', '0', '0', '0', '1489416305', '1489416305', '1');
INSERT INTO `bbs_document` VALUES ('19', '2', '', 'react （软件行业名词）', '2', 'React 起源于 Facebook 的内部项目，因为该公司对市场上所有 JavaScript MVC 框架，都不满意，就决定自己写一套，用来架设Instagram 的网站。做出来以后，发现这套东西很好用，就在2013年5月开源了。', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '6', '0', '0', '0', '1489420547', '1489420547', '1');
INSERT INTO `bbs_document` VALUES ('20', '2', '', 'C++', '2', 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计。C++擅长面向对象程序设计的同时，还可以进行基于过程的程序设计，因而C++就适应的问题规模而论，大小由之。', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '13', '0', '0', '0', '1489420739', '1489420739', '1');
INSERT INTO `bbs_document` VALUES ('21', '2', '', 'Java', '2', 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '18', '0', '0', '0', '1489421275', '1489421275', '1');
INSERT INTO `bbs_document` VALUES ('22', '2', '', 'PHP （超文本预处理器）', '2', 'PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。PHP 独特的语法混合了C、Java、Perl以及PHP自创的语法', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '88', '0', '0', '0', '1489421375', '1489421375', '1');
INSERT INTO `bbs_document` VALUES ('23', '2', '', 'Android百科', '40', 'Google公司开发的操作系统', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '5', '0', '0', '0', '1493439953', '1493439953', '1');
INSERT INTO `bbs_document` VALUES ('24', '8', '', 'Redis', '39', 'Redis是一个开源的使用ANSI C语言编写、支持网络、可基于内存亦可持久化的日志型、Key-Value数据库', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1493703773', '1493703773', '1');

-- ----------------------------
-- Table structure for bbs_document_article
-- ----------------------------
DROP TABLE IF EXISTS `bbs_document_article`;
CREATE TABLE `bbs_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of bbs_document_article
-- ----------------------------
INSERT INTO `bbs_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');
INSERT INTO `bbs_document_article` VALUES ('2', '0', '电子公告牌系统<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">（Bulletin Board System，英文缩写BBS）通过在计算机上运行服务软件，允许用户使用</span>终端<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">程序通过</span>Internet<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">来进行连接，执行下载数据或程序、上传数据、阅读新闻、与其它用户交换消息等功能。</span>', '', '0');
INSERT INTO `bbs_document_article` VALUES ('11', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1990年，Tim Berners-Lee和Robert Cailliau共同发明了Web。1994年，Web真正走出实验室。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	从HTML被发明开始，样式就以各种形式存在。不同的浏览器结合它们各自的样式语言为用户提供页面效果的控制。最初的HTML只包含很少的显示属性。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	随着HTML的成长，为了满足页面设计者的要求，HTML添加了很多显示功能。但是随着这些功能的增加，HTML变的越来越杂乱，而且HTML页面也越来越臃肿。于是CSS便诞生了。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1994年哈坤·利提出了CSS的最初建议。而当时伯特·波斯（<i>Bert Bos</i>）正在设计一个名为Argo的浏览器，于是他们决定一起设计CSS。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	其实当时在互联网界已经有过一些统一样式表语言的建议了，但CSS是第一个含有“层叠”丰意的样式表语言。在CSS中，一个文件的样式可以从其他的样式表中继承。读者在有些地方可以使用他自己更喜欢的样式，在其他地方则继承或“层叠”作者的样式。这种层叠的方式使作者和读者都可以灵活地加入自己的设计，混合每个人的爱好。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	哈坤于1994年在芝加哥的一次会议上第一次提出了CSS的建议，1995年的www网络会议上CSS又一次被提出，博斯演示了Argo浏览器支持CSS的例子，哈肯也展示了支持CSS的Arena浏览器。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	同年，W3C组织（<i>World WideWeb Consortium</i>）成立，CSS的创作成员全部成为了W3C的工作小组并且全力以赴负责研发CSS标准，层叠样式表的开发终于走上正轨。有越来越多的成员参与其中，例如微软公司的托马斯·莱尔顿(Thomas Reaxdon)，他的努力最终令Internet Explorer浏览器支持CSS标准。哈坤、波斯和其他一些人是这个项目的主要技术负责人。1996年底，CSS初稿已经完成，同年12月，层叠样式表的第一份正式标准（<i>Cascading style Sheets Level 1</i>）完成，成为w3c的推荐标准。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1997年初，W3C组织负责CSS的工作组开始讨论第一版中没有涉及到的问题。其讨论结果组成了1998年5月出版的CSS规范第二版。\r\n</div>', '', '1');
INSERT INTO `bbs_document_article` VALUES ('12', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	万维网上的一个超媒体文档称之为一个页面（外语：page）。作为一个组织或者个人在万维网上放置开始点的页面称为主页（外语：Homepage）或首页，主页中通常包括有指向其他相关页面或其他节点的指针（超级链接），所谓超级链接，就是一种统一资源定位器（Uniform Resource Locator，外语缩写：URL）指针，通过激活（点击）它，可使浏览器方便地获取新的网页。这也是HTML获得广泛应用的最重要的原因之一。在逻辑上将视为一个整体的一系列页面的有机集合称为网站（Website或Site）。超级文本标记语言（英文缩写：HTML）是为“网页创建和其它可在网页浏览器中看到的信息”设计的一种标记语言。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	网页的本质就是超级文本标记语言，通过结合使用其他的Web技术（如：脚本语言、公共网关接口、组件等），可以创造出功能强大的网页。因而，超级文本标记语言是万维网（Web）编程的基础，也就是说万维网是建立在超文本基础之上的。超级文本标记语言之所以称为超文本标记语言，是因为文本中包含了所谓“超级链接”点。<span id=\"__kindeditor_bookmark_end_7__\"></span>\r\n</div>', '', '0');
INSERT INTO `bbs_document_article` VALUES ('13', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	JavaScript是一种属于网络的脚本语言,已经被广泛用于Web应用开发,常用来为网页添加各式各样的动态功能,为用户提供更流畅美观的浏览效果。通常JavaScript脚本是通过嵌入在HTML中来实现自身的功能的。\r\n</div>\r\n<ol class=\"custom_num  para-list list-paddingleft-1\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<li class=\"list-num-1-1 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			是一种解释性脚本语言（代码不进行预编译）。\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-2 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			主要用来向HTML（标准通用标记语言下的一个应用）页面添加交互行为。\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-3 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			可以直接嵌入HTML页面，但写成单独的js文件有利于结构和行为的分离。\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-4 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			跨平台特性，在绝大多数浏览器的支持下，可以在多种平台下运行（如Windows、Linux、Mac、Android、iOS等）。\r\n		</div>\r\n	</li>\r\n</ol>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	Javascript脚本语言同其他语言一样，有它自身的基本数据类型，表达式和算术运算符及程序的基本程序框架。Javascript提供了四种基本的数据类型和两种特殊数据类型用来处理数据和文字。而变量提供存放信息的地方，表达式则可以完成较复杂的信息处理。\r\n</div>', '', '1');
INSERT INTO `bbs_document_article` VALUES ('17', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2005年8月，John Resig提议改进Prototype的“Behaviour”库，于是他在blog上发表了自己的想法，并用了3个例子做简单的流程说明。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	第一个例子是为元素注册一个事件：\r\n</div>\r\n<pre class=\"brush: xml\">Behaviour.register({\r\n&nbsp;&nbsp;&nbsp;&nbsp;\'#example&nbsp;li\':&nbsp;function(e){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.onclick&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.parentNode.removeChild(this);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n});\r\n\r\n</pre>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	他认为应该改写为：\r\n</div>\r\n<pre class=\"brush: xml\">$(\'#example&nbsp;li\').bind(\'click\',function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;this.parentNode.removeChild(this);\r\n});\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;第二个例子是为不同的元素注册不同的事件：\r\n</pre>\r\n<pre class=\"brush: xml\">Behaviour.register({\r\n&nbsp;&nbsp;&nbsp;&nbsp;\'b.someclass\'&nbsp;:&nbsp;function(e){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.onclick&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alert(this.innerHTML);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;},\r\n&nbsp;&nbsp;&nbsp;&nbsp;\'#someid&nbsp;u\'&nbsp;:&nbsp;function(e){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.onmouseover&nbsp;=&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.innerHTML&nbsp;=&nbsp;\"BLAH!\";\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n});\r\n\r\n</pre>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	他认为应该改写为：\r\n</div>\r\n<pre class=\"brush: xml\">$(\'b.someclass\').bind(\'click\',function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;alert(this.innerHTML);\r\n});\r\n$(\'#someid&nbsp;u\').bind(\'mouseover\',function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;this.innerHTML&nbsp;=&nbsp;\'BLAH!\';\r\n});\r\n\r\n</pre>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	第三个例子是为不断变化的元素注册不同的事件：\r\n</div>\r\n<pre class=\"brush: xml\">Behaviour.register({\r\n&nbsp;&nbsp;&nbsp;&nbsp;\'#foo&nbsp;ol&nbsp;li\':&nbsp;function(a)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.title&nbsp;=&nbsp;\"List&nbsp;Items!\";\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.onclick&nbsp;=&nbsp;function(){&nbsp;alert(\'Hello!\');&nbsp;};\r\n&nbsp;&nbsp;&nbsp;&nbsp;},\r\n&nbsp;&nbsp;&nbsp;&nbsp;\'#foo&nbsp;ol&nbsp;li.tmp\':&nbsp;function(a)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.style.color&nbsp;=&nbsp;\'white\';\r\n&nbsp;&nbsp;&nbsp;&nbsp;},\r\n&nbsp;&nbsp;&nbsp;&nbsp;\'#foo&nbsp;ol&nbsp;li.tmp&nbsp;.foo\':&nbsp;function(a)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.style.background&nbsp;=&nbsp;\'red\';\r\n}\r\n});\r\n\r\n</pre>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	他认为应该改写为：\r\n</div>\r\n<pre class=\"brush: xml\">$(\'#foo&nbsp;ol&nbsp;li\')\r\n&nbsp;&nbsp;&nbsp;&nbsp;.set(\'title\',\'List&nbsp;Items!\')\r\n&nbsp;&nbsp;&nbsp;&nbsp;.bind(\'click\',function(){&nbsp;alert(\'Hello!\');&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;.select(\'.tmp\')\r\n&nbsp;&nbsp;&nbsp;&nbsp;.style(\'color\',\'white\')\r\n&nbsp;&nbsp;&nbsp;&nbsp;.select(\'.foo\')\r\n&nbsp;&nbsp;&nbsp;&nbsp;.style(\'background\',\'red\');\r\n\r\n</pre>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	这些代码也是jQuery语法的最初雏形。当时John的想法很简单：他发现这种语法相对现有的JavaScript库更为简洁。但他没想到的是，这篇文章一经发布就引起了业界的关注。于是John开始认真思考着这件事情（<i>编写语法更为简洁的JavaScript程序库</i>），直到2006年1月14日，John正式宣布以jQuery的名称发布自己的程序库。随之而来的是jQuery的快速发展。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2006年1月John Resig等入创建了jQuery；8月，jQuery的第一个稳定版本，并且已经支持CSS选择符、事件处理和AJAX交互。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2007年7月，jQuery 1.1.3版发布，这次小版本的变化包含了对jQuery选择符引擎执行速度的显著提升。从这个版本开始，jQuery的性能达到了Prototype、Mootools以及Dojo等同类JavaScript库的水平。同年9月，jQuery 1.2版发布，它去掉了对XPath选择符的支持，原因是相对于CSS语法它已经变得多余了。这一版能够对效果进行更为灵活的定制，而且借助新增的命名空间事件，也使插件开发变得更容易。同时，jQuery UI项目也开始启动，这个新的套件是作为曾经流行但已过时的Interface插件的替代项目而发布的。jQuery UI中包含大量预定义好的部件（<i>widge</i>t），以及一组用于构建高级元素（<i>例如可拖放、拖拽、排序</i>）的工具。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2008年5月，jQuery 1.2.6版发布，这版主要是将Brandon Aaron开发的流行的Dimensions插件的功能移植到了核心库中，同时也修改了许多BUG，而且有不少的性能得到提高。因此，如果以前的jQuery版本升级到1.2.6，那么完全可以从代码中排除Dimensions插件（<i>一个获得元素尺寸、定位的插件</i>）。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在jQuery迅速发展的同时，一些大的厂商也看中了商机。2009年9月，微软和诺基亚公司正式宣布支持开源的jQuery库，另外，微软公司还宣称他们将把jQuery作为Visual Studio工具集的一部分。他将提供包括jQuery的智能提示、代码片段、示例文档编制等内容在内的功能。微软和诺基亚公司将长期成为jQuery的用户成员，其他成员还有Google，Intel，IBM，Intuit等公司。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2009年1月，jQuery 1.3版发布，它使用了全新的选择符引擎Sizzle，在各个浏览器下全面超越其他同类型JavaScript框架的查询速度，程序库的性能也因此有了极大提升。这一版本的第2个变化就是提供live()方法，使用live()方法可以为当前及将来增加的元素绑定事件，在1.3版之前，如果要为将来增加的元素绑定事件，需要使用livequery插件，而在1.3版中，可以直接用live()方法。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2010年1月，也是jQuery的四周年生日，jQuery 1.4版发布，为了庆祝jQuery四周岁生日，jQuery团队特别创建了jquery14.com站点，带来了连续14天的新版本专题介绍。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在1.3及更早版本中，jQuery通过JavaScript的eval方法来解析json对象。在1.4中，如果你用的浏览器支持，则会使用原生的JSON.parse解析json对象，这样对json对象的书写验证则更为严格。比如：{foo: \"bar\"}的写法将不会被验证为合法的json对象，必须写成{\"foo\":\"bar\"}。如果你的程序打算升级到1.4版本，那么这一点要尤其注意。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2010年2月，jQuery 1.4.2版发布，它新增了有关事件委托的两个方法：delegate()和undelegate()。delegate()用于替代1.3.2中的live()方法。这个方法比live()来的方便，而且也可以达到动态添加事件的作用。比如给表格的每个td绑定hover事件，代码如下：\r\n</div>\r\n<pre class=\"brush: xml\">//1.4.2\r\n$(\"table\").delegate(\"td\",&nbsp;\"hover\",&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;$(this).toggleClass(\"hover\");\r\n});\r\n//1.3.2\r\n$(\"table\").each(function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;$(\"td\",&nbsp;this).live(\"hover\",&nbsp;function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(this).toggleClass(\"hover\");\r\n&nbsp;&nbsp;&nbsp;&nbsp;});\r\n});\r\n\r\n</pre>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2011年1月，jQuery 1.5版发布。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2011年11月，jQuery 1.7版发布。\r\n</div>', '', '0');
INSERT INTO `bbs_document_article` VALUES ('18', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在了解VUE之前，先弄清<a target=\"_blank\" href=\"http://baike.baidu.com/item/PEARSON\">PEARSON</a>和PEARSON EDUCATION 。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	PEARSON是一家大型的跨国传媒公司，在教育、出版和商务信息领域一直居于世界领先地位，其主要品牌有：时代财经、培生教育和企鹅出版社。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	PEARSON EDUCATION是PEARSON旗下的从事教育和出版行业的机构。迄今，已为全球超过1亿人提供了培训，是教育、出版一体化领域的佼佼者。拥有PEARSON PRENTICE HALL、PEARSON LONGMAN 、PEARSON SCOTT FORESMAN等知名品牌，PEARSON EDUCATION将继续面向世界，利用各种媒介手段源源不断地提供高质量的读物、实用的评估工具和先进的教育服务。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	PEARSON VUE 则是PEARSON EDUCATION旗下的从事电子化考试服务的机构，它致力于依靠快捷的互联网，先进的计算机技术及优质的服务为你提供安全、可靠且实用的国际认证考试和安全职业执照及认证程序。其发展速度之迅猛，主要得益于IT技术的飞速发展、得益于IT认证浪潮的推动。能发送如微软(当前微软的认证考试已经完全由普尔文代理）、IBM、思科等30多个厂商的考试，同时在考试通过后，又能得到这30多个厂商的认证。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	接下来谈谈如何获得这样的认证及有何好处。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	PEARSON VUE在全球150多个国家设有3400多个考试机构，在中国设有150多个考点。微软、IBM等各大厂商并不直接进行考试，而是授权PEARSON VUE，由它来组织考试。任何考生只有在通过考试后，方可得到厂商的认证或认可，才能获得各大厂商颁发的国际通用的、权威性的证书。持有这样一本证书，就好比持有一本国际通行证，可以到国外或国内的任何公司去求职。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在中国的考试则由各省区的考点负责。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	VUE (Virtual University Enterprises) 是NCS Pearson 的一个分部，它通过分布在110\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	多个国家（或地区）的全球考试中心网络提供全部的MCP 考试。\r\n</div>', '', '2');
INSERT INTO `bbs_document_article` VALUES ('19', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	由于 React的设计思想极其独特，属于革命性创新，性能出众，代码逻辑却非常简单。所以，越来越多的人开始关注和使用，认为它可能是将来 Web 开发的主流工具。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	这个项目本身也越滚越大，从最早的UI引擎变成了一整套前后端通吃的 Web App 解决方案。衍生的 React Native 项目，目标更是宏伟，希望用写 Web App 的方式去写 Native App。如果能够实现，整个互联网行业都会被颠覆，因为同一组人只需要写一次 UI ，就能同时运行在服务器、浏览器和手机。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	React主要用于构建UI。你可以在React里传递多种类型的参数，如声明代码，帮助你渲染出UI、也可以是静态的HTML DOM元素、也可以传递动态变量、甚至是可交互的应用组件。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">特点：</span>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1.声明式设计：React采用声明范式，可以轻松描述应用。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2.高效：React通过对DOM的模拟，最大限度地减少与DOM的交互。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	3.灵活：React可以与已知的库或框架很好地配合。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">示例[1]<a name=\"ref_[1]_18254484\"></a>&nbsp;</span>\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	下面这段代码将会在在页面容器中呈现出“Hello Tom”：\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">[xml]</span>view plain<a target=\"_blank\" href=\"http://baike.baidu.com/item/copy\">copy</a>\r\n</div>\r\n<ol class=\"custom_num para-list list-paddingleft-1\" style=\"color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<li class=\"list-num-1-1 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			/**@jsxReact.DOM*/\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-2 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			varHelloMsg=React.createClass({\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-3 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			render:function(){\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-4 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			return&lt;div&gt;{\'Hello\'+this.props.name}&lt;/div&gt;;\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-5 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			}});\r\n		</div>\r\n	</li>\r\n	<li class=\"list-num-1-6 list-num-paddingleft-1\">\r\n		<div class=\"para\" style=\"font-size:14px;margin-left:25px;\">\r\n			React.renderComponent(&lt;HelloMsg name=\"Tom\"/&gt;,mountNode);\r\n		</div>\r\n	</li>\r\n</ol>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	该例使用一个类似XML语法的JSX来构建组件，实现一个render()方法，并且根据输入的数据返回相应的结果。输入的数据作为XML属性传递给组件，render()方法通过this.props访问这些输入的数据。\r\n</div>', '', '0');
INSERT INTO `bbs_document_article` VALUES ('20', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	世界上第一种计算机高级语言是诞生于1954年的<a target=\"_blank\" href=\"http://baike.baidu.com/item/FORTRAN%E8%AF%AD%E8%A8%80\">FORTRAN语言</a>。之后出现了多种计算机高级语言。1970年，AT&amp;T的Bell实验室的D.Ritchie和K.Thompson共同发明了C语言。研制C语言的初衷是用它编写UNIX系统程序，因此，它实际上是UNIX的“副产品”。它充分结合了汇编语言和高级语言的优点，高效而灵活，又容易移植。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1971年，瑞士联邦技术学院N.Wirth教授发明了Pascal语言。Pascal语言语法严谨，层次分明，程序易写，具有很强的可读性，是第一个结构化的编程语言。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	20世纪70年代中期，Bjarne Stroustrup在剑桥大学计算机中心工作。他使用过Simula和ALGOL，接触过C。他对Simula的类体系感受颇深，对ALGOL的结构也很有研究，深知运行效率的意义。既要编程简单、正确可靠，又要运行高效、可移植，是Bjarne Stroustrup的初衷。以C为背景，以Simula思想为基础，正好符合他的设想。1979年，Bjame Sgoustrup到了Bell实验室，开始从事将C改良为带类的C（<i>C with classes</i>）的工作。1983年该语言被正式命名为C++。自从C++被发明以来，它经历了3次主要的修订，每一次修订都为C++增加了新的特征并作了一些修改。第一次修订是在1985年，第二次修订是在1990年，而第三次修订发生在c++的标准化过程中。在20世纪90年代早期，人们开始为C++建立一个标准，并成立了一个ANSI和ISO（<i>Intemational Standards Organization</i>）国际标准化组织的联合标准化委员会。该委员会在1994年1月25曰提出了第一个标准化草案。在这个草案中，委员会在保持Stroustrup最初定义的所有特征的同时，还增加了一些新的特征。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	在完成C++标准化的第一个草案后不久，发生了一件事情使得C++标准被极大地扩展了：Alexander stepanov创建了标准模板库（Standard Template Library，STL）。STL不仅功能强大，同时非常优雅，然而，它也是非常庞大的。在通过了第一个草案之后，委员会投票并通过了将STL包含到C++标准中的提议。STL对C++的扩展超出了C++的最初定义范围。虽然在标准中增加STL是个很重要的决定，但也因此延缓了C++标准化的进程。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	委员会于1997年11月14日通过了该标准的最终草案，1998年，C++的ANSI/IS0标准被投入使用。通常，这个版本的C++被认为是标准C++。所有的主流C++编译器都支持这个版本的C++，包括微软的Visual C++和Borland公司的C++Builder。\r\n</div>', '', '0');
INSERT INTO `bbs_document_article` VALUES ('21', '0', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	20世纪90年代，硬件领域出现了单片式计算机系统，这种价格低廉的系统一出现就立即引起了自动控制领域人员的注意，因为使用它可以大幅度提升消费类电子产品<i>（如电视机顶盒、面包烤箱、移动电话等）</i>的<a target=\"_blank\" href=\"http://baike.baidu.com/view/335547.htm\">智能化</a>程度。Sun公司为了抢占市场先机，在1991年成立了一个称为Green的项目小组，<a target=\"_blank\" href=\"http://baike.baidu.com/subview/987192/17552361.htm\">帕特里克</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/view/4814505.htm\">詹姆斯·高斯林</a>、麦克·舍林丹和其他几个工程师一起组成的工作小组在<a target=\"_blank\" href=\"http://baike.baidu.com/view/269543.htm\">加利福尼亚</a>州<a target=\"_blank\" href=\"http://baike.baidu.com/view/5965801.htm\">门洛帕克</a>市沙丘路的一个小工作室里面研究开发新技术，专攻计算机在家电产品上的嵌入式应用。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	由于<a target=\"_blank\" href=\"http://baike.baidu.com/view/824.htm\">C++</a>所具有的优势，该项目组的研究人员首先考虑采用C++来编写程序。但对于<a target=\"_blank\" href=\"http://baike.baidu.com/view/25278.htm\">硬件</a>资源极其匮乏的单片式系统来说，C++程序过于复杂和庞大。另外由于消费电子产品所采用的嵌入式处理器芯片的种类繁杂，如何让编写的程序<a target=\"_blank\" href=\"http://baike.baidu.com/view/469855.htm\">跨平台</a>运行也是个难题。为了解决困难，他们首先着眼于语言的开发，假设了一种结构简单、符合嵌入式应用需要的硬件平台体系结构并为其制定了相应的规范，其中就定义了这种硬件平台的<a target=\"_blank\" href=\"http://baike.baidu.com/view/18536.htm\">二进制</a>机器码指令系统<i>（即后来成为“</i><a target=\"_blank\" href=\"http://baike.baidu.com/view/560330.htm\"><i>字节码</i></a><i>”的指令系统）</i>，以待语言开发成功后，能有<a target=\"_blank\" href=\"http://baike.baidu.com/view/557684.htm\">半导体芯片</a>生产商开发和生产这种硬件平台。对于新语言的设计，Sun公司研发人员并没有开发一种全新的语言，而是根据嵌入式软件的要求，对C++进行了改造，去除了留在C++的一些不太实用及影响安全的成分，并结合嵌入式系统的实时性要求，开发了一种称为<a target=\"_blank\" href=\"http://baike.baidu.com/view/180796.htm\">Oak</a>的<a target=\"_blank\" href=\"http://baike.baidu.com/view/7847.htm\">面向对象语言</a>。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	由于在开发Oak语言时，尚且不存在运行字节码的硬件平台，所以为了在开发时可以对这种语言进行实验研究，他们就在已有的硬件和软件平台基础上，按照自己所指定的规范，用软件建设了一个运行平台，整个系统除了比C++更加简单之外，没有什么大的区别。1992年的夏天，当Oak语言开发成功后，研究者们向硬件生产商进行演示了Green操作系统、Oak的程序设计语言、类库和其硬件，以说服他们使用Oak语言生产硬件芯片，但是，硬件生产商并未对此产生极大的热情。因为他们认为，在所有人对Oak语言还一无所知的情况下，就生产硬件产品的风险实在太大了，所以Oak语言也就因为缺乏硬件的支持而无法进入市场，从而被搁置了下来。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1994年6、7月间，在经历了一场历时三天的讨论之后，团队决定再一次改变了努力的目标，这次他们决定将该技术应用于<a target=\"_blank\" href=\"http://baike.baidu.com/view/7833.htm\">万维网</a>。他们认为随着<a target=\"_blank\" href=\"http://baike.baidu.com/view/209570.htm\">Mosaic</a>浏览器的到来，<a target=\"_blank\" href=\"http://baike.baidu.com/view/1706.htm\">因特网</a>正在向同样的高度互动的<a target=\"_blank\" href=\"http://baike.baidu.com/view/45465.htm\">远景</a>演变，而这一远景正是他们在有线电视网中看到的。作为原型，帕特里克·诺顿写了一个小型万维网浏览器WebRunner。[4]<a name=\"ref_[4]_12654100\"></a>&nbsp;\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1995年，互联网的蓬勃发展给了Oak机会。业界为了使死板、单调的静态网页能够“灵活”起来，急需一种软件技术来开发一种程序，这种程序可以通过网络传播并且能够跨平台运行。于是，世界各大<a target=\"_blank\" href=\"http://baike.baidu.com/subview/30/16685180.htm\">IT</a>企业为此纷纷投入了大量的人力、物力和财力。这个时候，Sun公司想起了那个被搁置起来很久的Oak，并且重新审视了那个用软件编写的试验平台，由于它是按照按照嵌入式系统硬件平台体系结构进行编写的，所以非常小，特色适用于网络上的传输系统，而Oak也是一种精简的语言，程序非常小，适合在网络上传输。Sun公司首先推出了可以嵌入网页并且可以随同网页在网络上传输的<a target=\"_blank\" href=\"http://baike.baidu.com/view/150834.htm\">Applet</a><i>（Applet是一种将小程序嵌入到网页中进行执行的技术）</i>，并将Oak更名为Java<i>（在申请注册商标时，发现Oak已经被人使用了，再想了一系列名字之后，最终，使用了提议者在喝一杯Java咖啡时无意提到的Java词语）</i>。5月23日，Sun公司在Sun world会议上正式发布Java和HotJava浏览器。<a target=\"_blank\" href=\"http://baike.baidu.com/subview/1937/5817096.htm\">IBM</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/subview/14874/5822958.htm\">Apple</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/view/270611.htm\">DEC</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/view/7578.htm\">Adobe</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/view/18228.htm\">HP</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/view/15020.htm\">Oracle</a>、<a target=\"_blank\" href=\"http://baike.baidu.com/view/153922.htm\">Netscap<span style=\"font-weight:700;\">e</span></a>和<a target=\"_blank\" href=\"http://baike.baidu.com/view/2353.htm\">微软</a>等各大公司都纷纷停止了自己的相关开发项目，竞相购买了Java使用许可证，并为自己的产品开发了相应的Java平台。[5-6]<a name=\"ref_[5-6]_12654100\"></a>&nbsp;<a name=\"ref_6\"></a> \r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1996年1月，Sun公司发布了Java的第一个开发工具包<i>（JDK 1.0）</i>，这是Java发展历程中的重要里程碑，标志着Java成为一种独立的开发工具。9月，约8.3万个网页应用了Java技术来制作。10月，Sun公司发布了Java平台的第一个即时<i>（JIT）</i>编译器。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1997年2月，JDK 1.1面世，在随后的3周时间里，达到了22万次的下载量。4月2日，Java One会议召开，参会者逾一万人，创当时全球同类会议规模之纪录。9月，Java Developer Connection社区成员超过10万。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1998年12月8日，第二代Java平台的企业版J2EE发布。1999年6月，Sun公司发布了第二代Java平台（简称为Java2）的3个版本：<a target=\"_blank\" href=\"http://baike.baidu.com/view/7125.htm\">J2ME</a>（Java2 Micro Edition，Java2平台的微型版），应用于移动、无线及有限资源的环境；<a target=\"_blank\" href=\"http://baike.baidu.com/view/160728.htm\">J2SE</a>（Java 2 Standard Edition，Java 2平台的标准版），应用于桌面环境；<a target=\"_blank\" href=\"http://baike.baidu.com/view/1507.htm\">J2EE</a>（Java 2Enterprise Edition，Java 2平台的企业版），应用于基于Java的应用服务器。Java 2平台的发布，是Java发展过程中最重要的一个里程碑，标志着Java的应用开始普及。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	1999年4月27日，HotSpot虚拟机发布。<a target=\"_blank\" href=\"http://baike.baidu.com/view/426539.htm\">HotSpot</a>虚拟机发布时是作为JDK 1.2的附加程序提供的，后来它成为了JDK 1.3及之后所有版本的Sun JDK的默认虚拟机[7]<a name=\"ref_[7]_12654100\"></a>&nbsp;&nbsp;。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2000年5月，JDK1.3、JDK1.4和J2SE1.3相继发布，几周后其获得了<a target=\"_blank\" href=\"http://baike.baidu.com/subview/14874/5822958.htm\">Apple</a>公司Mac OS X的工业标准的支持。2001年9月24日，J2EE1.3发布。2002年2月26日，J2SE1.4发布。自此Java的计算能力有了大幅提升，与J2SE1.3相比，其多了近62%的类和接口。在这些新特性当中，还提供了广泛的<a target=\"_blank\" href=\"http://baike.baidu.com/view/63.htm\">XML</a>支持、安全套接字<i>（Socket）</i>支持<i>（通过SSL与TLS协议）</i>、全新的I/OAPI、正则表达式、日志与断言。2004年9月30日，J2SE1.5发布，成为Java语言发展史上的又一里程碑。为了表示该版本的重要性，J2SE 1.5更名为Java SE 5.0<i>（内部版本号1.5.0）</i>，代号为“Tiger”，Tiger包含了从1996年发布1.0版本以来的最重大的更新，其中包括泛型支持、基本类型的自动装箱、改进的循环、枚举类型、格式化I/O及可变参数。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2005年6月，在Java One大会上，Sun公司发布了Java SE 6。此时，Java的各种版本已经更名，已取消其中的数字2，如J2EE更名为<a target=\"_blank\" href=\"http://baike.baidu.com/view/169790.htm\">JavaEE</a>，J2SE更名为JavaSE，J2ME更名为<a target=\"_blank\" href=\"http://baike.baidu.com/view/1560387.htm\">JavaME</a>。[8]<a name=\"ref_[8]_12654100\"></a>&nbsp;\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	2006年11月13日，Java技术的发明者Sun公司宣布，将Java技术作为免费软件对外发布。Sun公司正式发布的有关Java平台标准版的第一批源代码，以及Java迷你版的可执行源代码。从2007年3月起，全世界所有的开发人员均可对Java源代码进行修改[9]<a name=\"ref_[9]_12654100\"></a>&nbsp;&nbsp;。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	<div class=\"lemma-picture text-pic layout-right\" style=\"border:1px solid #E0E0E0;margin:0px 0px 3px;\">\r\n		<a class=\"image-link\" href=\"http://baike.baidu.com/pic/Java/85979/0/a8ec8a13632762d04989f67ca7ec08fa503dc6ba?fr=lemma&amp;ct=single\" target=\"_blank\"><img class=\"\" src=\"http://g.hiphotos.baidu.com/baike/s%3D220/sign=b4dfd4eaecc4b7453094b014fffd1e78/a8ec8a13632762d04989f67ca7ec08fa503dc6ba.jpg\" alt=\"Java创始人之一：詹姆斯·高斯林\" style=\"width:220px;height:208px;\" /></a><span class=\"description\" style=\"color:#555555;font-size:12px;font-family:宋体;line-height:15px;\">Java创始人之一：詹姆斯·高斯林</span> \r\n	</div>\r\n2009年，甲骨文公司宣布收购Sun[10]<a name=\"ref_[10]_12654100\"></a>&nbsp;&nbsp;。2010年，Java编程语言的共同创始人之一詹姆斯·高斯林从Oracle公司辞职。2011年，甲骨文公司举行了全球性的活动，以庆祝Java7的推出，随后Java7正式发布。2014年，甲骨文公司发布了Java8正式版[\r\n</div>', '', '0');
INSERT INTO `bbs_document_article` VALUES ('22', '0', '<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">&nbsp; PHP原始为Personal Home Page的缩写，已经正式更名为 \"PHP: Hypertext Preprocessor\"。注意不是“Hypertext Preprocessor”的缩写，这种将名称放到定义中的写法被称作</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/5034635.htm\">递归缩写</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">。PHP于1994年由</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/2116568.htm\">Rasmus Lerdorf</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">创建，刚刚开始是</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/2116568.htm\">Rasmus Lerdorf</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">为了要</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/1123731.htm\">维护</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">个人网页而制作的一个简单的用</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/46614.htm\">Perl</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">语言编写的程序。这些工具程序用来显示 Rasmus Lerdorf 的个人履历，以及统计网页流量。后来又用</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/1219.htm\">C语言</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">重新编写，包括可以访问</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/1088.htm\">数据库</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">。他将这些程序和一些</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/296684.htm\">表单</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">直译器整合起来，称为 PHP/FI。PHP/FI 可以和</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/1088.htm\">数据库</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">连接，产生简单的</span><a target=\"_blank\" href=\"http://baike.baidu.com/view/348756.htm\">动态网页</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">程序。</span>', '', '3');
INSERT INTO `bbs_document_article` VALUES ('23', '0', '<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">Android是一种基于</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/Linux\">Linux</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">的自由及开放源代码的</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F\">操作系统</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">，主要使用于</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%A7%BB%E5%8A%A8%E8%AE%BE%E5%A4%87\">移动设备</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">，如</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%99%BA%E8%83%BD%E6%89%8B%E6%9C%BA\">智能手机</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">和</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%B9%B3%E6%9D%BF%E7%94%B5%E8%84%91\">平板电脑</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">，由</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/Google\">Google</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">公司和</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%BC%80%E6%94%BE%E6%89%8B%E6%9C%BA%E8%81%94%E7%9B%9F\">开放手机联盟</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">领导及开发。尚未有统一中文名称，中国大陆地区较多人使用“</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%AE%89%E5%8D%93\">安卓</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">”或“</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%AE%89%E8%87%B4\">安致</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">”。Android操作系统最初由</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/Andy%20Rubin\">Andy Rubin</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">开发，主要支持</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%89%8B%E6%9C%BA/6342\">手机</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">。2005年8月由Google收购注资。2007年11月，Google与84家硬件制造商、软件开发商及电信营运商组建开放手机联盟共同研发改良Android系统。随后Google以Apache开源许可证的授权方式，发布了Android的源代码。第一部Android智能手机发布于2008年10月。Android逐渐扩展到</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%B9%B3%E6%9D%BF%E7%94%B5%E8%84%91\">平板电脑</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">及其他领域上，如</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E7%94%B5%E8%A7%86\">电视</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%95%B0%E7%A0%81%E7%9B%B8%E6%9C%BA\">数码相机</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%B8%B8%E6%88%8F%E6%9C%BA\">游戏机</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">等。2011年第一季度，Android在全球的市场份额首次超过</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%A1%9E%E7%8F%AD%E7%B3%BB%E7%BB%9F\">塞班系统</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">，跃居全球第一。 2013年的第四季度，Android平台手机的全球市场份额已经达到78.1%。</span>[1]&nbsp;<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">&nbsp;2013年09月24日谷歌开发的操作系统Android在迎来了5岁生日，全世界采用这款系统的设备数量已经达到10亿台。</span>', '', '2');
INSERT INTO `bbs_document_article` VALUES ('24', '0', '<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">redis是一个key-value</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%AD%98%E5%82%A8%E7%B3%BB%E7%BB%9F\">存储系统</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">。和Memcached类似，它支持存储的value类型相对更多，包括string(字符串)、list(</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%93%BE%E8%A1%A8\">链表</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">)、set(集合)、zset(sorted set --有序集合)和hash（哈希类型）。这些</span><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B\">数据类型</a><span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">都支持push/pop、add/remove及取交集并集和差集及更丰富的操作，而且这些操作都是原子性的。在此基础上，redis支持各种不同方式的排序。与memcached一样，为了保证效率，数据都是缓存在内存中。区别的是redis会周期性的把更新的数据写入磁盘或者把修改操作写入追加的记录文件，并且在此基础上实现了master-slave(主从)同步。</span>', '', '0');

-- ----------------------------
-- Table structure for bbs_document_download
-- ----------------------------
DROP TABLE IF EXISTS `bbs_document_download`;
CREATE TABLE `bbs_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of bbs_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_dynamic_auth
-- ----------------------------
DROP TABLE IF EXISTS `bbs_dynamic_auth`;
CREATE TABLE `bbs_dynamic_auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `apply_auth` varchar(255) DEFAULT NULL COMMENT '申请的权限',
  `apply_valid_date` int(11) DEFAULT '1' COMMENT '申请权限使用期，1:一个小时，2:三个小时，3:十二小时，4:二十四小时',
  `application_reason` text COMMENT '申请理由',
  `application_date` int(10) DEFAULT NULL COMMENT '申请时间',
  `deal_time` int(10) DEFAULT NULL COMMENT '处理申请的时间',
  `status` varchar(255) DEFAULT NULL COMMENT '申请状态，a: 待审，b: 同意，c: 拒绝',
  `valid` int(1) DEFAULT '0' COMMENT '申请的权限是否有效，0：无效，1：有效',
  `performer` int(10) DEFAULT NULL COMMENT '权限执行者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_dynamic_auth
-- ----------------------------
INSERT INTO `bbs_dynamic_auth` VALUES ('5', '2', '41,28,29,30,31,32,33,34,35,36,37,38,39,40,94,95', '1', '申请临时权限管理', '1495095048', '1495095105', 'b', '0', '2');
INSERT INTO `bbs_dynamic_auth` VALUES ('6', '2', '41,28,29,30,31,32,33,34,35,36,37,38,39,40,94,95', '1', '测试权限回收', '1495106587', '1495106610', 'b', '0', '2');
INSERT INTO `bbs_dynamic_auth` VALUES ('7', '2', '41,28,29,30,31,32,33,34,35,36,37,38,39,40,94,95', '1', '', '1495114805', '1495114949', 'b', '0', '2');
INSERT INTO `bbs_dynamic_auth` VALUES ('8', '2', '55,209,210', '2', '测试权限转移', '1495114843', '1495114942', 'b', '0', '2');
INSERT INTO `bbs_dynamic_auth` VALUES ('9', '2', '54,42,43,44,45,46,47,48,49,50,51,52,53', '2', '测试权限转移。', '1495114860', '1495114936', 'b', '0', '2');
INSERT INTO `bbs_dynamic_auth` VALUES ('10', '8', '54,42,43,44,45,46,47,48,49,50,51,52,53', '3', '权限转移测试。', '1495158239', '1495158324', 'b', '1', '8');
INSERT INTO `bbs_dynamic_auth` VALUES ('11', '8', '55,209,210', '4', '测试', '1495158255', '1495158317', 'b', '1', '8');
INSERT INTO `bbs_dynamic_auth` VALUES ('12', '8', '41,28,29,30,31,32,33,34,35,36,37,38,39,40,94,95', '4', '测试测试', '1495158278', '1495158311', 'b', '1', '2');

-- ----------------------------
-- Table structure for bbs_file
-- ----------------------------
DROP TABLE IF EXISTS `bbs_file`;
CREATE TABLE `bbs_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of bbs_file
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_hooks
-- ----------------------------
DROP TABLE IF EXISTS `bbs_hooks`;
CREATE TABLE `bbs_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_hooks
-- ----------------------------
INSERT INTO `bbs_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `bbs_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `bbs_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `bbs_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `bbs_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `bbs_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `bbs_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `bbs_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `bbs_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `bbs_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `bbs_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for bbs_member
-- ----------------------------
DROP TABLE IF EXISTS `bbs_member`;
CREATE TABLE `bbs_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of bbs_member
-- ----------------------------
INSERT INTO `bbs_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '170', '87', '0', '1489332473', '0', '1495163348', '1');
INSERT INTO `bbs_member` VALUES ('2', 'hfhui', '0', '0000-00-00', '', '130', '38', '0', '1489420285', '0', '1495163374', '1');
INSERT INTO `bbs_member` VALUES ('3', 'abc', '0', '0000-00-00', '', '10', '2', '0', '1493306054', '0', '1493306156', '1');
INSERT INTO `bbs_member` VALUES ('4', 'abcd', '0', '0000-00-00', '', '10', '1', '0', '1493306137', '0', '1493306137', '1');
INSERT INTO `bbs_member` VALUES ('5', '123', '0', '0000-00-00', '', '10', '1', '0', '1493306427', '0', '1493306427', '1');
INSERT INTO `bbs_member` VALUES ('6', '12345', '0', '0000-00-00', '', '10', '1', '0', '1493306701', '0', '1493306701', '1');
INSERT INTO `bbs_member` VALUES ('7', '1234', '0', '0000-00-00', '', '10', '1', '0', '1493306752', '0', '1493306752', '1');
INSERT INTO `bbs_member` VALUES ('8', 'test', '0', '0000-00-00', '', '30', '6', '0', '1493703590', '0', '1495166087', '1');

-- ----------------------------
-- Table structure for bbs_menu
-- ----------------------------
DROP TABLE IF EXISTS `bbs_menu`;
CREATE TABLE `bbs_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_menu
-- ----------------------------
INSERT INTO `bbs_menu` VALUES ('1', '首页', '0', '2', 'Index/index', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('2', '内容', '0', '3', 'Article/mydocument', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `bbs_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `bbs_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('16', '用户', '0', '4', 'User/index', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('17', '用户信息', '16', '1', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `bbs_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `bbs_menu` VALUES ('19', '用户行为', '16', '5', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `bbs_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `bbs_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `bbs_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `bbs_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `bbs_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `bbs_menu` VALUES ('27', '权限管理', '16', '2', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `bbs_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `bbs_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `bbs_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `bbs_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `bbs_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `bbs_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `bbs_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `bbs_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `bbs_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `bbs_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `bbs_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `bbs_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `bbs_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `bbs_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `bbs_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `bbs_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `bbs_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `bbs_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `bbs_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `bbs_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `bbs_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `bbs_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `bbs_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `bbs_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('68', '系统', '0', '5', 'Config/group', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `bbs_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `bbs_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `bbs_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `bbs_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `bbs_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `bbs_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `bbs_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `bbs_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `bbs_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `bbs_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `bbs_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `bbs_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `bbs_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `bbs_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `bbs_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `bbs_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `bbs_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `bbs_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `bbs_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `bbs_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `bbs_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `bbs_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('106', '行为日志', '16', '6', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `bbs_menu` VALUES ('108', '修改密码', '16', '7', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('109', '修改昵称', '16', '8', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('123', '前台', '0', '1', 'Home/Index/home', '1', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('134', '登录注册', '123', '3', 'Home/User/index', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('140', '提交密码', '130', '5', 'Home/UserCenter/modifyPasswordAjax', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('133', '个人信息', '130', '3', 'Home/UserCenter/userInfo', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('129', '网站首页', '123', '1', 'Home/Index/index', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('130', '用户中心', '123', '2', 'Home/UserCenter/index', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('131', '帖子列表', '130', '1', 'Home/UserCenter/articles', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('135', '用户登录', '134', '1', 'Home/User/login', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('136', '用户注册', '134', '2', 'Home/User/register', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('137', '前台验证码', '134', '4', 'Home/User/verify', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('138', '修改密码', '130', '4', 'Home/UserCenter/modifyPassword', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('141', '用户登出', '134', '3', 'Home/User/logout', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('142', '文章详情', '129', '1', 'Home/Article/detail', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('143', '文章列表', '129', '2', 'Home/Article/lists', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('144', '发表文章', '129', '3', 'Home/Article/publish', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('146', '收藏列表', '130', '2', 'Home/UserCenter/collections', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('145', '收藏功能', '129', '4', 'Home/Collection/collect', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('147', '动态权限', '16', '3', 'DynamicAuth/index', '0', '', '用户管理', '0');
INSERT INTO `bbs_menu` VALUES ('148', '申请权限', '147', '1', 'DynamicAuth/add', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('149', '申请详情', '147', '2', 'DynamicAuth/detail', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('150', '回收权限', '147', '3', 'DynamicAuth/recycle', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('151', '权限转移', '16', '4', 'AuthTransfer/index', '0', '', '用户管理', '0');
INSERT INTO `bbs_menu` VALUES ('152', '转移查看', '151', '0', 'AuthTransfer/transfer', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('153', '权限详情', '151', '1', 'AuthTransfer/detail', '0', '', '', '0');
INSERT INTO `bbs_menu` VALUES ('154', '转移操作', '151', '2', 'AuthTransfer/transferAuth', '0', '', '', '0');

-- ----------------------------
-- Table structure for bbs_model
-- ----------------------------
DROP TABLE IF EXISTS `bbs_model`;
CREATE TABLE `bbs_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of bbs_model
-- ----------------------------
INSERT INTO `bbs_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `bbs_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `bbs_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for bbs_picture
-- ----------------------------
DROP TABLE IF EXISTS `bbs_picture`;
CREATE TABLE `bbs_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_picture
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `bbs_ucenter_admin`;
CREATE TABLE `bbs_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of bbs_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `bbs_ucenter_app`;
CREATE TABLE `bbs_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of bbs_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `bbs_ucenter_member`;
CREATE TABLE `bbs_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of bbs_ucenter_member
-- ----------------------------
INSERT INTO `bbs_ucenter_member` VALUES ('1', 'admin', '', 'hfhui@qq.com', '', '1489332473', '0', '1495163348', '0', '1489332473', '1');
INSERT INTO `bbs_ucenter_member` VALUES ('2', 'hfhui', 'f1eeb2dc0003f38a39403af82a92e7b1', 'hfhui@gmain.com', '', '1489420276', '0', '1495163374', '0', '1489420276', '1');
INSERT INTO `bbs_ucenter_member` VALUES ('3', 'abc', 'f1eeb2dc0003f38a39403af82a92e7b1', 'abc@qq.com', '', '1493305931', '0', '1493306156', '0', '1493305931', '1');
INSERT INTO `bbs_ucenter_member` VALUES ('4', 'abcd', 'f1eeb2dc0003f38a39403af82a92e7b1', 'abcd@qq.com', '', '1493305972', '0', '1493306137', '0', '1493305972', '1');
INSERT INTO `bbs_ucenter_member` VALUES ('5', '123', 'f1eeb2dc0003f38a39403af82a92e7b1', '123@qq.com', '', '1493306417', '0', '1493306427', '0', '1493306417', '1');
INSERT INTO `bbs_ucenter_member` VALUES ('6', '12345', 'f1eeb2dc0003f38a39403af82a92e7b1', '123456@qq.com', '', '1493306590', '0', '1493306701', '0', '1493306590', '1');
INSERT INTO `bbs_ucenter_member` VALUES ('7', '1234', 'f1eeb2dc0003f38a39403af82a92e7b1', '1234@qq.com', '', '1493306740', '0', '1493306752', '0', '1493306740', '1');
INSERT INTO `bbs_ucenter_member` VALUES ('8', 'test', 'f1eeb2dc0003f38a39403af82a92e7b1', 'test@qq.com', '', '1493703582', '0', '1495166087', '0', '1493703582', '1');

-- ----------------------------
-- Table structure for bbs_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `bbs_ucenter_setting`;
CREATE TABLE `bbs_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of bbs_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_url
-- ----------------------------
DROP TABLE IF EXISTS `bbs_url`;
CREATE TABLE `bbs_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of bbs_url
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_userdata
-- ----------------------------
DROP TABLE IF EXISTS `bbs_userdata`;
CREATE TABLE `bbs_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_userdata
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
