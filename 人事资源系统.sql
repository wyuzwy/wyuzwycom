/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : mybatis

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2019-12-21 15:51:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`remark`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of dept
-- ----------------------------
BEGIN;
INSERT INTO `dept` VALUES ('1', '财务部', '无'), ('2', '学术部', ''), ('3', '公关部', '无'), ('4', '教学部', '无'), ('5', '技术部', '无'), ('6', '人事部', '优秀部门'), ('7', '大佬部', '123'), ('8', '后勤部', '搬水的');
COMMIT;

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`dept_id`  int(11) NOT NULL ,
`job_id`  int(11) NOT NULL ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`card_id`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`post_code`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`tel`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`qq_num`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`email`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`sex`  int(1) NOT NULL COMMENT '鎬у埆' ,
`party`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '鏀挎不闈㈣矊' ,
`brithday`  date NOT NULL ,
`race`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姘戞棌' ,
`education`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`speciality`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '婵炴垶鎸婚幐椋庣箔?' ,
PRIMARY KEY (`id`),
FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `dept_id` (`dept_id`) USING BTREE ,
INDEX `job_id` (`job_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` VALUES ('1', '1', '1', '段誉', '6225465784444', '广东江门', '529000', '3296222', '15766666666', '', '1257221296@qq.com', '1', '群众', '1996-08-24', '汉族', '博士', '计算机'), ('2', '1', '3', '黄老邪', '698455542224', '广东广州', '521344', '3545577', '15766946398', '', 'wyuzwy@163.com', '2', '预备党员', '2019-11-24', '高山族', '硕士', '文学院'), ('3', '8', '4', '郑子豪', '4413811996', '广东汕头', '5555', '', '15766946398', '', 'wyuzwy@qq.com', '2', '共青团员', '1995-12-06', '回族', '本科', '555'), ('4', '1', '2', '张三', '1', '广东珠海', '111', '', '15766946398', '', '1234562@qq.com', '1', '其他', '2019-12-08', '珞巴族', '大专', '11');
COMMIT;

-- ----------------------------
-- Table structure for `fileupload`
-- ----------------------------
DROP TABLE IF EXISTS `fileupload`;
CREATE TABLE `fileupload` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`number`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`described`  varchar(9999) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createDate`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=18

;

-- ----------------------------
-- Records of fileupload
-- ----------------------------
BEGIN;
INSERT INTO `fileupload` VALUES ('15', '10086', '中国移动', '321', '/uploadFiles/2019121517/da9d1123.jpg,/uploadFiles/2019121517/d81a2360截图20171125104145658.jpg,/uploadFiles/2019121517/2fa14360截图20171125104227197.jpg', '2019-12-15 17:30', null), ('16', '10086', '中国移动', '123', '/uploadFiles/2019121517/58c40123.jpg', '2019-12-15 17:34', null), ('17', '10086', '中国移动', '配置文件', '/uploadFiles/2019121517/57cda配置文件.rar,/uploadFiles/2019121517/e5cb9有范vip6.0.1.rar', '2019-12-15 17:41', null);
COMMIT;

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
`ID`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`remark`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of job
-- ----------------------------
BEGIN;
INSERT INTO `job` VALUES ('1', '工程师', '无'), ('2', '会计师', '无'), ('3', '普通职员', '无'), ('4', 'Java程序员', '无'), ('5', '产品经理', '就是个垃圾');
COMMIT;

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content`  varchar(21000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`remark`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of notice
-- ----------------------------
BEGIN;
INSERT INTO `notice` VALUES ('1', '腾讯新闻', '康熙来了', '<div style=\"text-align:center;\">\r\n	<h1>\r\n		easyui-dialog中无法显示KindEditor插件\r\n	</h1>\r\nKindEditor是一种用起来还不错的富文本编辑器插件；easyui是一个前端插件，其中有一个弹出框功能——dialog。在实际使用的时候，我们需要在弹出框当中展示富文本编辑器，从而进行编辑和保存功能，再进行后台的操作。但是我在使用easyui的弹出框的时候出现了问题，无法显示kindeditor插件，而不在dialog中使用时候是可以显示的，这是为什么？要怎么解决？<br />\r\n<img src=\"/attached/image/20191207/20191207145531_988.jpg\" alt=\"\" width=\"500\" height=\"301\" title=\"\" align=\"\" /><br />\r\n问题发生的原因<br />\r\ndialog在弹出框时的初始化操作，没有成功初始化KindEditor<br />\r\n解决方式<br />\r\n在easyui的dialog初始化的onOpen方法中来初始化kindeditor：<br />\r\n$(‘#list1’).dialog({<br />\r\nonOpen: function(){<br />\r\neditor1 = KindEditor.create(‘#summary1’, {<br />\r\nheight :”300px”,<br />\r\nuploadJson : ‘../cycx/picFtpUpload.do’,<br />\r\nafterBlur: function () {<br />\r\nthis.sync();<br />\r\n},<br />\r\n<br />\r\n</div>', '2019-12-15 10:41'), ('2', '今日头条', '乾隆来啦', '<table style=\"width:100px;height:100px;\" cellpadding=\"2\" cellspacing=\"0\" border=\"1\" bordercolor=\"#000000\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img src=\"/attached/image/20191207/20191207143256_891.jpg\" alt=\"\" width=\"500\" height=\"301\" title=\"\" align=\"\" /><br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />', '2019-12-21 14:09'), ('3', '我是谁', '我在娜？？？', '<p>\r\n	啦啦啦啦啦\r\n</p>\r\n<p>\r\n	这是我的项目呀\r\n</p>\r\n<p>\r\n	<img src=\"/attached/image/20191208/20191208183534_91.jpg\" alt=\"\" width=\"200\" height=\"136\" title=\"\" align=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"http://localhost:8080/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8080/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /><img src=\"http://localhost:8080/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /> \r\n</p>', '2019-12-10 17:52'), ('5', '抖音短视频', '记录别人美好生活', '<pre class=\"prettyprint lang-java\">package cn.wyu.service.impl;\r\n\r\nimport cn.wyu.dao.RoleMapper;\r\nimport cn.wyu.pojo.Role;\r\nimport cn.wyu.service.RoleService;\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\nimport org.springframework.stereotype.Service;\r\n\r\nimport java.util.ArrayList;\r\nimport java.util.List;\r\n\r\n@Service\r\npublic class RoleServiceImpl implements RoleService {\r\n\r\n    @Autowired\r\n    private RoleMapper roleMapper;\r\n    @Override\r\n    public List&lt;Role&gt; findAllRole() {\r\n        List&lt;Role&gt; roles = new ArrayList&lt;&gt;();\r\n        Role role = new Role();\r\n        role.setId(0);\r\n        role.setName(\"请选择...\");\r\n        roles.add(role);\r\n        List&lt;Role&gt; roleList = roleMapper.selectByExample(null);\r\n        roles.addAll(roleList);\r\n        return roles;\r\n    }\r\n}</pre>\r\n<pre class=\"prettyprint lang-java\"><img src=\"/attached/image/20191208/20191208202042_746.jpg\" alt=\"\" /> </pre>', '2019-12-10 17:52');
COMMIT;

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '超级管理员'), ('2', '管理员'), ('3', '普通用户');
COMMIT;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`number`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`username`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`password`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`phone`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`createdate`  date NULL DEFAULT NULL ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`status`  int(11) NOT NULL ,
PRIMARY KEY (`number`),
FOREIGN KEY (`status`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `status` (`status`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('100', '张文宇', '123456', '15766946398', '2019-12-08', '啦啦啦', '3'), ('10000', '中国电信', '123456', '15766946398', '2019-12-08', '', '3'), ('10010', '中国联通', '123456', '15766946398', '2019-12-08', '', '3'), ('1005', '黄蓉', 'aaaaaaa', '15879845678', '2019-11-23', '', '3'), ('1006', '郭芙蓉', '123456', '15766946398', '2019-10-02', '', '3'), ('1008', '洪七公', '123456', '15766946398', '2019-12-01', '他是个男人！', '3'), ('10086', '中国移动', '123456', '13751560559', '2019-12-08', '啦啦啦阿拉，你十岁啊啊啊啊', '1'), ('1008611', '123456', '123456', '15766946398', '2019-12-16', '', '3'), ('103', '张文', '123456', '15766946398', '2019-12-08', '啦啦啦', '2'), ('105', '文娱', '123456', '15766946398', '2019-12-08', '啦啦啦', '2'), ('13800138000', '中国移动', '123456', '15766946398', '2019-12-08', '', '2'), ('admin', 'admin', '123456', '15766946398', '2019-12-18', '我是大佬222', '1');
COMMIT;

-- ----------------------------
-- Auto increment value for `dept`
-- ----------------------------
ALTER TABLE `dept` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for `employee`
-- ----------------------------
ALTER TABLE `employee` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `fileupload`
-- ----------------------------
ALTER TABLE `fileupload` AUTO_INCREMENT=18;

-- ----------------------------
-- Auto increment value for `job`
-- ----------------------------
ALTER TABLE `job` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `notice`
-- ----------------------------
ALTER TABLE `notice` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for `role`
-- ----------------------------
ALTER TABLE `role` AUTO_INCREMENT=4;
