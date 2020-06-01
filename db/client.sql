/*
Navicat MySQL Data Transfer

Source Server         : client
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : client

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2020-06-01 14:28:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companys
-- ----------------------------
DROP TABLE IF EXISTS `companys`;
CREATE TABLE `companys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `ceo` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companys
-- ----------------------------
INSERT INTO `companys` VALUES ('1', '1044', '腾讯科技', '马化腾', '广东省深圳市南山区后海腾讯大厦', 'tencent.qq.com', '82828820');
INSERT INTO `companys` VALUES ('2', '1026', '深圳市玉米好车', '邓潘生', '广东省深圳市福田区梅林', '18487378910@163.com', '18456972258');
INSERT INTO `companys` VALUES ('3', '1045', '网易云音乐', '刘云国', '广东省深圳市福田区', '18487378@163.com', '18487378933');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `chat_id` varchar(200) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `read` varchar(255) NOT NULL DEFAULT '0',
  `create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES ('27', '1019', '1026', '1019_1026', '你好，潘森', '0', '1590740691047');
INSERT INTO `messages` VALUES ('28', '1026', '1019', '1019_1026', '你好，刘红强', '0', '1590740712285');
INSERT INTO `messages` VALUES ('29', '1019', '1026', '1019_1026', '你找什么工作', '0', '1590741001944');
INSERT INTO `messages` VALUES ('30', '1026', '1019', '1019_1026', '前端工程师', '0', '1590741118356');
INSERT INTO `messages` VALUES ('31', '1019', '1026', '1019_1026', '哦哦', '0', '1590741245471');
INSERT INTO `messages` VALUES ('72', '1019', '1044', '1019_1044', '你哈', '0', '1590745487717');
INSERT INTO `messages` VALUES ('73', '1044', '1019', '1019_1044', 'haha', '0', '1590745589021');
INSERT INTO `messages` VALUES ('74', '1026', '1019', '1019_1026', '请发送简历', '0', '1590888495479');
INSERT INTO `messages` VALUES ('75', '1019', '1026', '1019_1026', '好的', '0', '1590888517011');
INSERT INTO `messages` VALUES ('82', '1019', '1044', '1019_1044', 'D', '0', '1590888972012');
INSERT INTO `messages` VALUES ('83', '1044', '1019', '1019_1044', 'D', '0', '1590889000475');
INSERT INTO `messages` VALUES ('84', '1026', '1019', '1019_1026', 'yhytr', '0', '1590890707184');
INSERT INTO `messages` VALUES ('85', '1019', '1026', '1019_1026', 'ngf', '0', '1590890722152');
INSERT INTO `messages` VALUES ('86', '1019', '1026', '1019_1026', 'hg', '0', '1590890899639');
INSERT INTO `messages` VALUES ('87', '1019', '1026', '1019_1026', 'e', '0', '1590890904366');
INSERT INTO `messages` VALUES ('88', '1026', '1019', '1019_1026', 'ghfgfh', '0', '1590890908301');
INSERT INTO `messages` VALUES ('89', '1019', '1026', '1019_1026', '二哥热热', '0', '1590892454141');
INSERT INTO `messages` VALUES ('90', '1019', '1045', '1019_1045', '你好，写昂', '0', '1590912032820');
INSERT INTO `messages` VALUES ('91', '1045', '1036', '1036_1045', '你好\n', '0', '1590912566346');
INSERT INTO `messages` VALUES ('92', '1036', '1045', '1036_1045', 'haha', '0', '1590912860198');
INSERT INTO `messages` VALUES ('93', '1036', '1045', '1036_1045', 'haha', '0', '1590912874959');
INSERT INTO `messages` VALUES ('94', '1045', '1019', '1019_1045', 'hgf', '0', '1590992695410');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `recruiter_id` int(10) DEFAULT NULL,
  `recruiter` varchar(50) DEFAULT NULL,
  `recruiterPosition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES ('1', '2', '玉米好车', 'web前端', '供货商公司的客观的数量可观价格合适的了就发附件回复给i费给哦呜给我给i哦共工，给给公', 'vue,h5,小程序,javaScript', '2', '8-10', '本科', '广东省深圳市福田区梅林', '1026', '邓潘生', 'CIO');
INSERT INTO `positions` VALUES ('2', '2', '玉米好车', '小程序开发', '供货商公司的客观的数量可观价格合适的了就发附件回复给i费给哦呜给我给i哦共工，给给公', 'vue,h5,小程序,javaScript', '2', '8-10', '本科', '广东省深圳市福田区梅林', '1026', '邓潘生', 'CIO');
INSERT INTO `positions` VALUES ('3', '2', '深圳市玉米好车', 'PHP后台开发', '的就感觉如何哦然热哦就就 ， 过热火热呵呵二号二号额和和，额和二级依靠任何人和后台条件和路由快让他火热和。而几乎然后嘞hi然后。怕合伙人而湖人i火热i火热。', 'php,thinkphp,ngix,node', '5', '15-20', '本科', '广东省深圳市南山区阳光课程中心', '1026', '邓潘生', 'CIO(技术主管)');
INSERT INTO `positions` VALUES ('4', '1', '腾讯科技', 'web前端工程师', '负责QQ音乐前端开发', 'react,redux,javascript,h5', '5', '20-30', '本科级以上', '广东省深圳市南山区后海腾讯大厦', '1044', '马化腾', 'CEO(总经理)');
INSERT INTO `positions` VALUES ('5', '1', '腾讯科技', 'web前端工程师', '微众银行开发项目返回给还是。返回光荣共给', 'web,vue,node,react', '5', '50', '研究生/博士', '广东省深圳市南山区大沙河', '1044', '马化腾', 'CEO(总经理)');
INSERT INTO `positions` VALUES ('6', '1', '腾讯科技', 'React工程师', '房租额进口国和恶容忍和环境监控可詥都很难回复', 'react,vue,h5,js', '2', '10', '本科', '广东省深圳市福田区车公庙', '1044', '马化腾', 'CEO(总经理)');
INSERT INTO `positions` VALUES ('7', '1', '腾讯科技', 'c#开发工程师', '返回你好和刚igu给8欧服一个古io各个阿呕吐的他的头发有', 'c,c#,.NET', '1', '8', '本科', '哦哦健康不健康发动刚Uighuri', '1044', '马化腾', 'CEO(总经理)');
INSERT INTO `positions` VALUES ('8', '3', '网易云音乐', '云音乐前端', '云音乐前端', 'js,react,vue', '2', '10-12', '本科', '法规及国际给给一会我给和古人', '1045', '刘云国', 'ceo');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `head` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` int(10) DEFAULT '1',
  `birth` varchar(255) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `identity` int(10) DEFAULT NULL,
  `gratuated` varchar(255) DEFAULT NULL,
  `exprience` int(10) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `isbeauty` int(10) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1001', null, 'admin', '123456', '1', null, '25', null, '3', '西南林业大学', '1', 'web前端', '19833731753', '18487378910@163.com', null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('1019', '头像1', '18487378910', 'a123456789', '1', '2000-05-12', '21', '刘红强', '0', '西南林业大学', '2', 'web前端工程师', null, null, '10', '法国i和后个额给我敢和我而且韩国i哦各位i给位哦功后给hi我给发计个根据二乌克兰基辅金额为几个国家问几个我京公网。', null, '1', null);
INSERT INTO `userinfo` VALUES ('1020', '头像2', '18459762895', 'a123456789', '1', '2005-05-12', '16', '张三丰', '0', '上海复旦大学', '5', 'java工程师', null, null, '32', '氛围更加二零各位感觉发，飞机饿哦减肥，分为， 分为各位给我，巨额外汇为本位', null, '1', null);
INSERT INTO `userinfo` VALUES ('1026', '头像3', '18487378911', 'a123456', '1', '2008-05-12', null, '邓潘生', '1', null, null, 'CIO(技术主管)', '18456972258', '18487378910@163.com', null, '风格还是给各个和我刚好我俄国人给，根据让国人火热切换，关即i公告日更容器结果怕，根据我国规划日光，挂牌价 。', '深圳市玉米好车', '1', '广东省深圳市福田区梅林');
INSERT INTO `userinfo` VALUES ('1036', '头像4', '19866731753', 'a123456', '1', '2000-02-17', '21', '谢凯鸿', '0', '珠海科技大学', '3', 'php后端工程师', null, null, '15', '肌肉感日给哦排位，即日起我ir给，结果我日哦企图额外i给i我给我我，几位功后荣威还给我i感觉为给i我。', null, '1', null);
INSERT INTO `userinfo` VALUES ('1037', '头像5', '19866731751', 'a123456', '1', '2000-05-17', '21', '黄越', '0', '华南科技大学', '5', '前端工程师', null, null, '20', '公平让国人怕贵给i我给我， 给给，人个人会认为过热火热， 火热很热情换热器换热安华金和', null, '1', null);
INSERT INTO `userinfo` VALUES ('1044', '头像8', '18487378922', 'a123456', '1', '2011-05-17', null, '马化腾', '1', null, null, 'CEO(总经理)', '82828820', 'tencent.qq.com', null, '交付给给干净哥几个i韩国i哦好狗肉火锅iigih比哦i过热和Gigii日后好热哦还给， 个人热和，额火热和火热和特权和去和确认和热情和，', '腾讯科技', '1', '广东省深圳市南山区后海腾讯大厦');
INSERT INTO `userinfo` VALUES ('1045', '头像7', '18487378933', 'a123456', '1', '2014-05-31', null, '刘云国', '1', null, null, 'ceo', '18487378933', '18487378@163.com', null, '飞机施工i共i给i给给给哥华湖广会馆哦 我，无花果 共和国和人共和国和人个人给', '网易云音乐', '1', '广东省深圳市福田区');
