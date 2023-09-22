/*
Navicat MySQL Data Transfer

Source Server         : slave3
Source Server Version : 80019
Source Host           : slave3:3306
Source Database       : tmis

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2022-01-14 15:03:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '1', '1', '2001班');
INSERT INTO `class` VALUES ('2', '1', '1', '2002班');
INSERT INTO `class` VALUES ('3', '2', '3', '2001班');
INSERT INTO `class` VALUES ('4', '2', '2', '2001班');
INSERT INTO `class` VALUES ('5', '4', '5', '9998班');
INSERT INTO `class` VALUES ('6', '4', '5', '9999班');

-- ----------------------------
-- Table structure for `examination_question`
-- ----------------------------
DROP TABLE IF EXISTS `examination_question`;
CREATE TABLE `examination_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `question_name` varchar(255) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  `correct` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examination_question
-- ----------------------------

-- ----------------------------
-- Table structure for `faculty`
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES ('1', '数学系');
INSERT INTO `faculty` VALUES ('2', '计算机系');
INSERT INTO `faculty` VALUES ('3', '美术系');
INSERT INTO `faculty` VALUES ('4', '中文系');

-- ----------------------------
-- Table structure for `major`
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faculty_id` int DEFAULT NULL,
  `major_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '1', '应用数学');
INSERT INTO `major` VALUES ('2', '2', '计算机科学技术');
INSERT INTO `major` VALUES ('3', '2', '软件工程');
INSERT INTO `major` VALUES ('4', '2', '大数据');
INSERT INTO `major` VALUES ('5', '4', '古汉语');

-- ----------------------------
-- Table structure for `major_semester`
-- ----------------------------
DROP TABLE IF EXISTS `major_semester`;
CREATE TABLE `major_semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `major_id` int DEFAULT NULL,
  `school_year` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_semester
-- ----------------------------

-- ----------------------------
-- Table structure for `major_semester_subject`
-- ----------------------------
DROP TABLE IF EXISTS `major_semester_subject`;
CREATE TABLE `major_semester_subject` (
  `major_semester_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major_semester_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(50) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('25', 'menu-1-template', '一级菜单', '', '1', '0', '1');
INSERT INTO `menu` VALUES ('26', 'menu', '菜单管理', '', '1', '0', '2');
INSERT INTO `menu` VALUES ('27', 'role', '角色管理', '', '1', '0', '3');
INSERT INTO `menu` VALUES ('28', 'user', '用户管理', '', '1', '0', '4');
INSERT INTO `menu` VALUES ('29', 'project-add', '二级菜单-新增/修改模板', 'project-add.html', '2', '25', '1');
INSERT INTO `menu` VALUES ('30', 'project-list', '二级菜单-数据列表模板', 'project-list.html', '2', '25', '2');
INSERT INTO `menu` VALUES ('31', 'choose', '二级菜单-在线考试模板', 'choose.html', '2', '25', '3');
INSERT INTO `menu` VALUES ('32', 'menu-add', '新增菜单', 'menu-add.html', '2', '26', '1');
INSERT INTO `menu` VALUES ('33', 'menu-list', '菜单列表', 'menu-list.html', '2', '26', '2');
INSERT INTO `menu` VALUES ('34', 'role-add', '新增角色', 'role-add.html', '2', '27', '1');
INSERT INTO `menu` VALUES ('35', 'role-list', '角色列表', 'role-list.html', '2', '27', '2');
INSERT INTO `menu` VALUES ('36', 'user-add', '用户管理', 'user-add.html', '2', '28', '1');
INSERT INTO `menu` VALUES ('37', 'questions', '题库管理', '', '1', '0', '5');
INSERT INTO `menu` VALUES ('38', 'file-upload', '试题上传', 'file-upload.html', '2', '37', '1');

-- ----------------------------
-- Table structure for `question_bank`
-- ----------------------------
DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE `question_bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int DEFAULT NULL,
  `question_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `question_name` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_bank
-- ----------------------------
INSERT INTO `question_bank` VALUES ('19', '1', '0-f1dad818-5c94-4a27-b071-f1582652e7df', '资本主义经济危机的根源在于（ ）。', '0', '0', 'D ', '2021-12-09 16:00:52');
INSERT INTO `question_bank` VALUES ('20', '1', '0-ff68944d-7bab-4e3b-8d68-43203fdec6bb', '我国对外政策的出发点是（ ）。', '0', '2', 'A', '2021-12-09 16:00:52');
INSERT INTO `question_bank` VALUES ('21', '1', '0-1ec4d5f2-93a7-4229-8bc2-64d80559b3a3', '进入21世纪以来，国际形势发生了广泛而深刻的变化，但和平与发展仍然是时代主题,（ ）成为不可阻挡的时代潮流。', '0', '1', 'C', '2021-12-09 16:00:52');
INSERT INTO `question_bank` VALUES ('22', '1', '0-94efd3d9-f4e9-4e5d-8505-d0742d1a375c', '什么是我们党坚持立党为公、执政为民的本质要求？（ ）', '0', '3', 'C', '2021-12-09 16:00:52');
INSERT INTO `question_bank` VALUES ('23', '1', '0-6fe23676-5528-41dc-9dbf-5131e39ad3ff', '测试题1', '0', '0', 'A', '2021-12-09 16:00:52');
INSERT INTO `question_bank` VALUES ('24', '1', '0-2339b1b0-abe8-4f66-ada7-77911f6b1f4f', '测试题2', '0', '2', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('25', '1', '0-e926d875-0138-4ecc-97c6-72e17a7ab018', '测试题3', '0', '2', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('26', '1', '0-c741e828-9733-4842-9f63-89242d6a2635', '测试题4', '0', '3', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('27', '1', '0-8f6ac410-1b28-4a8d-865f-820edc279824', '测试题5', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('28', '1', '0-1e8aa3f6-c107-4a56-98b3-527881b4cdb8', '测试题6', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('29', '1', '0-cd573589-88db-49ba-a6e2-e049fa3bfc70', '测试题7', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('30', '1', '0-95b01261-abfa-4156-ad56-7b901afd28e3', '测试题8', '0', '0', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('31', '1', '0-17c6f114-6d67-4878-a998-4e76d76476df', '测试题9', '0', '1', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('32', '1', '0-14d9b709-a286-46fb-b4f9-358493d5244f', '测试题10', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('33', '1', '0-680c4352-4de7-43ca-8af6-8f54053d7255', '测试题11', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('34', '1', '0-78f0c0ad-cb8b-48f3-bfb2-cdf8ff4f8eae', '测试题12', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('35', '1', '0-6247aa35-5fac-4be3-80f8-8c8fb0a83ddc', '测试题13', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('36', '1', '0-d77dba49-b319-4008-96d1-075b18918fd7', '测试题14', '0', '0', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('37', '1', '0-962b7896-0ff7-40a9-896c-38eda5eecf55', '测试题15', '0', '2', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('38', '1', '0-41a61811-2277-41d9-8c48-f7c602f18929', '测试题16', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('39', '1', '0-53132362-dd92-4033-9c8e-fdaf04ff786d', '测试题17', '0', '3', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('40', '1', '0-c8956974-9b0c-43d2-be7c-418f3f8e189a', '测试题18', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('41', '1', '0-b11e3a30-e311-47aa-bdab-636aee6c8fa8', '测试题19', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('42', '1', '0-bee2b203-d2b2-43a9-b1f2-d350ab5a6f85', '测试题20', '0', '0', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('43', '1', '0-63141d1f-4850-4f74-8218-e9efe90f2048', '测试题21', '0', '0', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('44', '1', '0-530cfdf5-0d15-4621-a2ed-1908e2a00774', '测试题22', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('45', '1', '0-0f942a05-5386-43c3-8f2d-2e5c7c0551cf', '测试题23', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('46', '1', '0-a7a31033-bfff-48f7-b853-0da700cfdad1', '测试题24', '0', '2', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('47', '1', '0-85687bd8-7133-4df8-8480-58927b193183', '测试题25', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('48', '1', '0-3b688b96-9118-4cb9-8d97-f2d48f840b58', '测试题26', '0', '3', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('49', '1', '0-b9de945a-b249-4df8-9486-c2bc395929b7', '测试题27', '0', '0', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('50', '1', '0-9fe026f6-02fa-43a7-82be-0cd59622531e', '测试题28', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('51', '1', '0-5d08f9be-9c5c-489c-b028-9c6a88ed8412', '测试题29', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('52', '1', '0-4603feb7-1abd-45df-a166-ef2535996d4a', '测试题30', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('53', '1', '0-25c65514-013d-4c3f-944d-6d6a31110503', '测试题31', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('54', '1', '0-4f84ae0d-35a6-4896-ab14-900f750e6ef8', '测试题32', '0', '0', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('55', '1', '0-bb98a537-84a6-4e42-b513-7d74e3b9fe32', '测试题33', '0', '0', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('56', '1', '0-39c839e5-15dc-4be6-9017-65199c80786f', '测试题34', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('57', '1', '0-72f2a554-106c-42f1-be02-170ebd0c066d', '测试题35', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('58', '1', '0-60513f46-5ef2-4972-bc15-fb11dcd0e661', '测试题36', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('59', '1', '0-61c7b780-1250-490c-b000-0fe7ea2f1411', '测试题37', '0', '2', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('60', '1', '0-1d4f78dd-82e0-4bef-a484-3ea2de2e4c4d', '测试题38', '0', '1', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('61', '1', '0-8413ac52-d337-4a7b-b6ef-228e06da0c47', '测试题39', '0', '3', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('62', '1', '0-91db86b1-c696-46fa-8504-f896950c7fee', '测试题40', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('63', '1', '0-46a84b66-90e6-48fa-bccf-183071b55346', '测试题41', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('64', '1', '0-7b78e6c4-1d6c-488b-baae-4e0fb751e570', '测试题42', '0', '2', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('65', '1', '0-858f7e21-32fc-4296-baee-f08a3c9cab04', '测试题43', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('66', '1', '0-5114ad91-0c8b-4c66-b042-4efa0bbbd40a', '测试题44', '0', '1', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('67', '1', '0-7ff3d059-109b-49aa-843b-ecf18da6178a', '测试题45', '0', '0', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('68', '1', '0-08f972ac-8ec1-4c8a-a220-a37e4211b010', '测试题46', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('69', '1', '0-6cf46666-070d-4d9e-92e1-0a0ffb791bc7', '测试题47', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('70', '1', '0-b540aa88-5a9a-4511-87ef-7014c24df690', '测试题48', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('71', '1', '0-e4f0112a-a8b8-4b87-80a7-cba9cebcaadb', '测试题49', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('72', '1', '0-7050765f-e4f8-46cf-bb67-7164ce372303', '测试题50', '0', '2', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('73', '1', '0-d12b14f6-2dad-4193-a5b2-3a27baa71755', '测试题51', '0', '1', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('74', '1', '0-6f7944ae-9c19-48b0-b250-adf7833a351e', '测试题52', '0', '3', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('75', '1', '0-d62dced6-2c4b-40cb-ab2f-353bfa88972e', '测试题53', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('76', '1', '0-fd10b56b-ffa9-421b-b1ee-6c5ae5bb66d8', '测试题54', '0', '2', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('77', '1', '0-edfe6b63-a075-450f-a064-075ead107c58', '测试题55', '0', '2', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('78', '1', '0-551cde99-9c58-4426-a72a-74862662c797', '测试题56', '0', '3', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('79', '1', '0-c7fda2de-ace0-4f13-8031-015c7bdf1be0', '测试题57', '0', '1', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('80', '1', '0-8377cc84-ba7f-4369-a2ba-8b0960db89e0', '测试题58', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('81', '1', '0-d47c6230-717e-478f-9c05-f372832e0c20', '测试题59', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('82', '1', '0-7f7befa7-831f-41c7-967c-566a6a889319', '测试题60', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('83', '1', '0-9e02212a-6fb1-4b37-abaf-abc4c41a5003', '测试题61', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('84', '1', '0-f6a7c7b8-3360-4f90-9525-fe7f70383fcb', '测试题62', '0', '0', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('85', '1', '0-020dc6ed-9149-4f73-b1b1-0b283619a25d', '测试题63', '0', '2', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('86', '1', '0-32b3a4c2-a153-43fa-9b14-bda9cd266a1a', '测试题64', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('87', '1', '0-e5ee5619-2694-4dc9-a0cd-eb0afb1ef93d', '测试题65', '0', '3', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('88', '1', '0-b0ec576d-3717-4562-8e63-ab77e91c3048', '测试题66', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('89', '1', '0-6120e9b9-d92b-4eb1-9e6c-963eaad0e90e', '测试题67', '0', '2', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('90', '1', '0-540fb766-18db-40d4-96a8-c6dd17fbf1ab', '测试题68', '0', '2', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('91', '1', '0-562316bc-05fa-484c-bd50-a3a82c2b0ee8', '测试题69', '0', '3', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('92', '1', '0-d68528c9-8c30-4b4b-a3ee-29ace49614b1', '测试题70', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('93', '1', '0-2b45e899-fb8a-43ff-a66f-f25b287bee16', '测试题71', '0', '0', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('94', '1', '0-a854b1c9-a2aa-4dc2-be03-06c3834974d3', '测试题72', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('95', '1', '0-9d7257f5-d5a1-4c49-823a-4bdfec52678b', '测试题73', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('96', '1', '0-83284257-2c8a-4f50-a02c-d69a732cdd0a', '测试题74', '0', '1', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('97', '1', '0-ef879097-ed00-42c6-8fe6-49b696c42ea7', '测试题75', '0', '0', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('98', '1', '0-39fad0d7-edf3-41d0-9fdc-e195aaf83011', '测试题76', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('99', '1', '0-e63988e0-617e-4d4f-b1bc-01e0f1432d28', '测试题77', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('100', '1', '0-29318673-8237-40d2-bd2a-8f9f948dc479', '测试题78', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('101', '1', '0-4698286f-3639-405e-a255-c95eb0afc3a1', '测试题79', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('102', '1', '0-3b2325e5-c40e-4c54-991a-79f19f5f2fe5', '测试题80', '0', '2', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('103', '1', '0-e52d8100-ee3b-4c54-a449-285a4ead142a', '测试题81', '0', '2', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('104', '1', '0-2a611964-343e-4701-9e97-58f3ed98573a', '测试题82', '0', '3', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('105', '1', '0-52a405a3-08df-4f68-997a-3c347f83fc36', '测试题83', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('106', '1', '0-3cb2d6ff-57ad-49d1-a1ae-e2d7b196a050', '测试题84', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('107', '1', '0-fcbf66a1-f079-4d06-9e53-562da61d8644', '测试题85', '0', '0', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('108', '1', '0-579a0cc5-edc3-48f8-ad08-c49ad9608575', '测试题86', '0', '0', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('109', '1', '0-600937bb-e5dc-43bc-85a8-c4b4f0eedfff', '测试题87', '0', '1', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('110', '1', '0-fbcff7a1-bdd8-49f6-94b7-3c10386ec213', '测试题88', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('111', '1', '0-b31ee142-c256-4b8d-b01c-62227a9eadb0', '测试题89', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('112', '1', '0-a051bb0f-804b-470c-8684-10849b3728e3', '测试题90', '0', '2', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('113', '1', '0-d072bab0-5b74-46ae-9419-bded108d9755', '测试题91', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('114', '1', '0-3e968298-c5ed-49d6-8c8b-2617fd4fb95b', '测试题92', '0', '3', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('115', '1', '0-b2fe6ff6-fb07-49bd-88d0-3e064324e192', '测试题93', '0', '3', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('116', '1', '0-4fd5589b-4a6e-4591-a854-391e5ec735e8', '测试题94', '0', '3', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('117', '1', '0-90c6e7ad-7a06-452e-8454-ca6076808b02', '测试题95', '0', '3', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('118', '1', '0-8eda3817-b6b8-4b8d-83cb-0111c85412e0', '测试题96', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('119', '1', '0-58f30162-0709-4247-b571-06715dd15b20', '测试题97', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('120', '1', '0-73d2f2bb-f66e-4776-8f16-4d45d92439f0', '测试题98', '0', '3', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('121', '1', '0-cdaffbcb-cb92-4717-9f81-389a297d3be8', '测试题99', '0', '3', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('122', '1', '0-b8610940-128f-4e00-87ea-3426a90e454a', '测试题100', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('123', '1', '0-652a71ad-8459-43ca-82dc-88a511790423', '测试题101', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('124', '1', '0-2f16d9cd-967e-4222-a727-15269904d004', '测试题102', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('125', '1', '0-6f921559-9b0f-4000-ad7e-6591d831b28f', '测试题103', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('126', '1', '0-a6c0a3b2-5e87-43bc-9fa7-39395e3ff64d', '测试题104', '0', '1', 'C', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('127', '1', '0-e0bfb6e3-50cd-4e23-9e4c-b39441bf6ac6', '测试题105', '0', '1', 'D', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('128', '1', '0-760e4a1a-86cb-4b17-ab98-1abd2ba8b677', '测试题106', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('129', '1', '0-12017217-0c72-4c14-b4fa-7d0edd55ada3', '测试题107', '0', '1', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('130', '1', '0-7fa6ae7a-d5c6-4456-806b-4a25b31a15d1', '测试题108', '0', '1', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('131', '1', '0-f239eeea-d952-4b78-aa18-f8076e2b1ca7', '测试题109', '0', '2', 'B', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('132', '1', '0-fed9ce6f-0bdb-4a8d-90b9-69793025b31e', '测试题110', '0', '3', 'A', '2021-12-09 16:00:53');
INSERT INTO `question_bank` VALUES ('133', '1', '0-d7be334f-c8f6-49d9-9905-2a86a7cbfc6e', '资本主义经济危机的根源在于12121（ ）。', '0', '0', 'D ', '2021-12-10 00:29:57');
INSERT INTO `question_bank` VALUES ('134', '1', '0-db59bf3e-8030-4465-a0a3-1be8e5aab6ea', '我国对外政策的出发点是21212（ ）。', '0', '1', 'A', '2021-12-10 00:29:57');
INSERT INTO `question_bank` VALUES ('135', '1', '0-d721704c-812e-4e16-94b9-e04f0df146f2', '212121进入21世纪以来，国际形势发生了广泛而深刻的变化，但和平与发展仍然是时代主题,（ ）成为不可阻挡的时代潮流。', '0', '3', 'C', '2021-12-10 00:29:57');
INSERT INTO `question_bank` VALUES ('136', '1', '0-84209b3d-9577-4e8f-ad46-284edff8f968', '212121什么是我们党坚持立党为公、执政为民的本质要求？（ ）', '0', '2', 'C', '2021-12-10 00:29:57');

-- ----------------------------
-- Table structure for `question_options`
-- ----------------------------
DROP TABLE IF EXISTS `question_options`;
CREATE TABLE `question_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `options_text` varchar(255) DEFAULT NULL,
  `options_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_options
-- ----------------------------
INSERT INTO `question_options` VALUES ('73', '0-f1dad818-5c94-4a27-b071-f1582652e7df', ' 生产和消费的矛盾  ', 'A');
INSERT INTO `question_options` VALUES ('74', '0-f1dad818-5c94-4a27-b071-f1582652e7df', ' 劳动人民的消费不足 ', 'B');
INSERT INTO `question_options` VALUES ('75', '0-f1dad818-5c94-4a27-b071-f1582652e7df', ' 消费需求和投资需求的不足 ', 'C');
INSERT INTO `question_options` VALUES ('76', '0-f1dad818-5c94-4a27-b071-f1582652e7df', ' 资本主义基本矛盾 ', 'D');
INSERT INTO `question_options` VALUES ('77', '0-ff68944d-7bab-4e3b-8d68-43203fdec6bb', ' 独立自主 ', 'A');
INSERT INTO `question_options` VALUES ('78', '0-ff68944d-7bab-4e3b-8d68-43203fdec6bb', ' 和平共处 ', 'B');
INSERT INTO `question_options` VALUES ('79', '0-ff68944d-7bab-4e3b-8d68-43203fdec6bb', ' 共同发展 ', 'C');
INSERT INTO `question_options` VALUES ('80', '0-ff68944d-7bab-4e3b-8d68-43203fdec6bb', ' 国家利益 ', 'D');
INSERT INTO `question_options` VALUES ('81', '0-1ec4d5f2-93a7-4229-8bc2-64d80559b3a3', ' 和平、发展、互利、共赢 ', 'A');
INSERT INTO `question_options` VALUES ('82', '0-1ec4d5f2-93a7-4229-8bc2-64d80559b3a3', ' 和平、友善、互利、共赢 ', 'B');
INSERT INTO `question_options` VALUES ('83', '0-1ec4d5f2-93a7-4229-8bc2-64d80559b3a3', ' 和平、发展、合作、共赢 ', 'C');
INSERT INTO `question_options` VALUES ('84', '0-1ec4d5f2-93a7-4229-8bc2-64d80559b3a3', ' 和平、发展、合作、双赢 ', 'D');
INSERT INTO `question_options` VALUES ('85', '0-94efd3d9-f4e9-4e5d-8505-d0742d1a375c', ' 社会和谐 ', 'A');
INSERT INTO `question_options` VALUES ('86', '0-94efd3d9-f4e9-4e5d-8505-d0742d1a375c', ' 改革 ', 'B');
INSERT INTO `question_options` VALUES ('87', '0-94efd3d9-f4e9-4e5d-8505-d0742d1a375c', ' 增进民生福祉 ', 'C');
INSERT INTO `question_options` VALUES ('88', '0-94efd3d9-f4e9-4e5d-8505-d0742d1a375c', ' 开放', 'D');
INSERT INTO `question_options` VALUES ('89', '0-6fe23676-5528-41dc-9dbf-5131e39ad3ff', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('90', '0-6fe23676-5528-41dc-9dbf-5131e39ad3ff', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('91', '0-6fe23676-5528-41dc-9dbf-5131e39ad3ff', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('92', '0-6fe23676-5528-41dc-9dbf-5131e39ad3ff', ' 选项4', 'D');
INSERT INTO `question_options` VALUES ('93', '0-2339b1b0-abe8-4f66-ada7-77911f6b1f4f', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('94', '0-2339b1b0-abe8-4f66-ada7-77911f6b1f4f', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('95', '0-2339b1b0-abe8-4f66-ada7-77911f6b1f4f', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('96', '0-2339b1b0-abe8-4f66-ada7-77911f6b1f4f', ' 选项4', 'D');
INSERT INTO `question_options` VALUES ('97', '0-e926d875-0138-4ecc-97c6-72e17a7ab018', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('98', '0-e926d875-0138-4ecc-97c6-72e17a7ab018', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('99', '0-e926d875-0138-4ecc-97c6-72e17a7ab018', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('100', '0-e926d875-0138-4ecc-97c6-72e17a7ab018', ' 选项4', 'D');
INSERT INTO `question_options` VALUES ('101', '0-c741e828-9733-4842-9f63-89242d6a2635', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('102', '0-c741e828-9733-4842-9f63-89242d6a2635', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('103', '0-c741e828-9733-4842-9f63-89242d6a2635', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('104', '0-c741e828-9733-4842-9f63-89242d6a2635', ' 选项4', 'D');
INSERT INTO `question_options` VALUES ('105', '0-8f6ac410-1b28-4a8d-865f-820edc279824', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('106', '0-8f6ac410-1b28-4a8d-865f-820edc279824', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('107', '0-8f6ac410-1b28-4a8d-865f-820edc279824', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('108', '0-8f6ac410-1b28-4a8d-865f-820edc279824', ' 选项4', 'D');
INSERT INTO `question_options` VALUES ('109', '0-1e8aa3f6-c107-4a56-98b3-527881b4cdb8', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('110', '0-1e8aa3f6-c107-4a56-98b3-527881b4cdb8', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('111', '0-1e8aa3f6-c107-4a56-98b3-527881b4cdb8', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('112', '0-1e8aa3f6-c107-4a56-98b3-527881b4cdb8', ' 选项5', 'D');
INSERT INTO `question_options` VALUES ('113', '0-cd573589-88db-49ba-a6e2-e049fa3bfc70', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('114', '0-cd573589-88db-49ba-a6e2-e049fa3bfc70', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('115', '0-cd573589-88db-49ba-a6e2-e049fa3bfc70', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('116', '0-cd573589-88db-49ba-a6e2-e049fa3bfc70', ' 选项6', 'D');
INSERT INTO `question_options` VALUES ('117', '0-95b01261-abfa-4156-ad56-7b901afd28e3', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('118', '0-95b01261-abfa-4156-ad56-7b901afd28e3', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('119', '0-95b01261-abfa-4156-ad56-7b901afd28e3', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('120', '0-95b01261-abfa-4156-ad56-7b901afd28e3', ' 选项7', 'D');
INSERT INTO `question_options` VALUES ('121', '0-17c6f114-6d67-4878-a998-4e76d76476df', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('122', '0-17c6f114-6d67-4878-a998-4e76d76476df', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('123', '0-17c6f114-6d67-4878-a998-4e76d76476df', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('124', '0-17c6f114-6d67-4878-a998-4e76d76476df', ' 选项8', 'D');
INSERT INTO `question_options` VALUES ('125', '0-14d9b709-a286-46fb-b4f9-358493d5244f', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('126', '0-14d9b709-a286-46fb-b4f9-358493d5244f', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('127', '0-14d9b709-a286-46fb-b4f9-358493d5244f', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('128', '0-14d9b709-a286-46fb-b4f9-358493d5244f', ' 选项9', 'D');
INSERT INTO `question_options` VALUES ('129', '0-680c4352-4de7-43ca-8af6-8f54053d7255', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('130', '0-680c4352-4de7-43ca-8af6-8f54053d7255', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('131', '0-680c4352-4de7-43ca-8af6-8f54053d7255', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('132', '0-680c4352-4de7-43ca-8af6-8f54053d7255', ' 选项10', 'D');
INSERT INTO `question_options` VALUES ('133', '0-78f0c0ad-cb8b-48f3-bfb2-cdf8ff4f8eae', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('134', '0-78f0c0ad-cb8b-48f3-bfb2-cdf8ff4f8eae', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('135', '0-78f0c0ad-cb8b-48f3-bfb2-cdf8ff4f8eae', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('136', '0-78f0c0ad-cb8b-48f3-bfb2-cdf8ff4f8eae', ' 选项11', 'D');
INSERT INTO `question_options` VALUES ('137', '0-6247aa35-5fac-4be3-80f8-8c8fb0a83ddc', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('138', '0-6247aa35-5fac-4be3-80f8-8c8fb0a83ddc', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('139', '0-6247aa35-5fac-4be3-80f8-8c8fb0a83ddc', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('140', '0-6247aa35-5fac-4be3-80f8-8c8fb0a83ddc', ' 选项12', 'D');
INSERT INTO `question_options` VALUES ('141', '0-d77dba49-b319-4008-96d1-075b18918fd7', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('142', '0-d77dba49-b319-4008-96d1-075b18918fd7', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('143', '0-d77dba49-b319-4008-96d1-075b18918fd7', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('144', '0-d77dba49-b319-4008-96d1-075b18918fd7', ' 选项13', 'D');
INSERT INTO `question_options` VALUES ('145', '0-962b7896-0ff7-40a9-896c-38eda5eecf55', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('146', '0-962b7896-0ff7-40a9-896c-38eda5eecf55', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('147', '0-962b7896-0ff7-40a9-896c-38eda5eecf55', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('148', '0-962b7896-0ff7-40a9-896c-38eda5eecf55', ' 选项14', 'D');
INSERT INTO `question_options` VALUES ('149', '0-41a61811-2277-41d9-8c48-f7c602f18929', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('150', '0-41a61811-2277-41d9-8c48-f7c602f18929', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('151', '0-41a61811-2277-41d9-8c48-f7c602f18929', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('152', '0-41a61811-2277-41d9-8c48-f7c602f18929', ' 选项15', 'D');
INSERT INTO `question_options` VALUES ('153', '0-53132362-dd92-4033-9c8e-fdaf04ff786d', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('154', '0-53132362-dd92-4033-9c8e-fdaf04ff786d', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('155', '0-53132362-dd92-4033-9c8e-fdaf04ff786d', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('156', '0-53132362-dd92-4033-9c8e-fdaf04ff786d', ' 选项16', 'D');
INSERT INTO `question_options` VALUES ('157', '0-c8956974-9b0c-43d2-be7c-418f3f8e189a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('158', '0-c8956974-9b0c-43d2-be7c-418f3f8e189a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('159', '0-c8956974-9b0c-43d2-be7c-418f3f8e189a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('160', '0-c8956974-9b0c-43d2-be7c-418f3f8e189a', ' 选项17', 'D');
INSERT INTO `question_options` VALUES ('161', '0-b11e3a30-e311-47aa-bdab-636aee6c8fa8', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('162', '0-b11e3a30-e311-47aa-bdab-636aee6c8fa8', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('163', '0-b11e3a30-e311-47aa-bdab-636aee6c8fa8', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('164', '0-b11e3a30-e311-47aa-bdab-636aee6c8fa8', ' 选项18', 'D');
INSERT INTO `question_options` VALUES ('165', '0-bee2b203-d2b2-43a9-b1f2-d350ab5a6f85', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('166', '0-bee2b203-d2b2-43a9-b1f2-d350ab5a6f85', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('167', '0-bee2b203-d2b2-43a9-b1f2-d350ab5a6f85', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('168', '0-bee2b203-d2b2-43a9-b1f2-d350ab5a6f85', ' 选项19', 'D');
INSERT INTO `question_options` VALUES ('169', '0-63141d1f-4850-4f74-8218-e9efe90f2048', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('170', '0-63141d1f-4850-4f74-8218-e9efe90f2048', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('171', '0-63141d1f-4850-4f74-8218-e9efe90f2048', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('172', '0-63141d1f-4850-4f74-8218-e9efe90f2048', ' 选项20', 'D');
INSERT INTO `question_options` VALUES ('173', '0-530cfdf5-0d15-4621-a2ed-1908e2a00774', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('174', '0-530cfdf5-0d15-4621-a2ed-1908e2a00774', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('175', '0-530cfdf5-0d15-4621-a2ed-1908e2a00774', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('176', '0-530cfdf5-0d15-4621-a2ed-1908e2a00774', ' 选项21', 'D');
INSERT INTO `question_options` VALUES ('177', '0-0f942a05-5386-43c3-8f2d-2e5c7c0551cf', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('178', '0-0f942a05-5386-43c3-8f2d-2e5c7c0551cf', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('179', '0-0f942a05-5386-43c3-8f2d-2e5c7c0551cf', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('180', '0-0f942a05-5386-43c3-8f2d-2e5c7c0551cf', ' 选项22', 'D');
INSERT INTO `question_options` VALUES ('181', '0-a7a31033-bfff-48f7-b853-0da700cfdad1', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('182', '0-a7a31033-bfff-48f7-b853-0da700cfdad1', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('183', '0-a7a31033-bfff-48f7-b853-0da700cfdad1', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('184', '0-a7a31033-bfff-48f7-b853-0da700cfdad1', ' 选项23', 'D');
INSERT INTO `question_options` VALUES ('185', '0-85687bd8-7133-4df8-8480-58927b193183', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('186', '0-85687bd8-7133-4df8-8480-58927b193183', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('187', '0-85687bd8-7133-4df8-8480-58927b193183', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('188', '0-85687bd8-7133-4df8-8480-58927b193183', ' 选项24', 'D');
INSERT INTO `question_options` VALUES ('189', '0-3b688b96-9118-4cb9-8d97-f2d48f840b58', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('190', '0-3b688b96-9118-4cb9-8d97-f2d48f840b58', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('191', '0-3b688b96-9118-4cb9-8d97-f2d48f840b58', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('192', '0-3b688b96-9118-4cb9-8d97-f2d48f840b58', ' 选项25', 'D');
INSERT INTO `question_options` VALUES ('193', '0-b9de945a-b249-4df8-9486-c2bc395929b7', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('194', '0-b9de945a-b249-4df8-9486-c2bc395929b7', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('195', '0-b9de945a-b249-4df8-9486-c2bc395929b7', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('196', '0-b9de945a-b249-4df8-9486-c2bc395929b7', ' 选项26', 'D');
INSERT INTO `question_options` VALUES ('197', '0-9fe026f6-02fa-43a7-82be-0cd59622531e', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('198', '0-9fe026f6-02fa-43a7-82be-0cd59622531e', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('199', '0-9fe026f6-02fa-43a7-82be-0cd59622531e', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('200', '0-9fe026f6-02fa-43a7-82be-0cd59622531e', ' 选项27', 'D');
INSERT INTO `question_options` VALUES ('201', '0-5d08f9be-9c5c-489c-b028-9c6a88ed8412', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('202', '0-5d08f9be-9c5c-489c-b028-9c6a88ed8412', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('203', '0-5d08f9be-9c5c-489c-b028-9c6a88ed8412', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('204', '0-5d08f9be-9c5c-489c-b028-9c6a88ed8412', ' 选项28', 'D');
INSERT INTO `question_options` VALUES ('205', '0-4603feb7-1abd-45df-a166-ef2535996d4a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('206', '0-4603feb7-1abd-45df-a166-ef2535996d4a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('207', '0-4603feb7-1abd-45df-a166-ef2535996d4a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('208', '0-4603feb7-1abd-45df-a166-ef2535996d4a', ' 选项29', 'D');
INSERT INTO `question_options` VALUES ('209', '0-25c65514-013d-4c3f-944d-6d6a31110503', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('210', '0-25c65514-013d-4c3f-944d-6d6a31110503', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('211', '0-25c65514-013d-4c3f-944d-6d6a31110503', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('212', '0-25c65514-013d-4c3f-944d-6d6a31110503', ' 选项30', 'D');
INSERT INTO `question_options` VALUES ('213', '0-4f84ae0d-35a6-4896-ab14-900f750e6ef8', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('214', '0-4f84ae0d-35a6-4896-ab14-900f750e6ef8', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('215', '0-4f84ae0d-35a6-4896-ab14-900f750e6ef8', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('216', '0-4f84ae0d-35a6-4896-ab14-900f750e6ef8', ' 选项31', 'D');
INSERT INTO `question_options` VALUES ('217', '0-bb98a537-84a6-4e42-b513-7d74e3b9fe32', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('218', '0-bb98a537-84a6-4e42-b513-7d74e3b9fe32', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('219', '0-bb98a537-84a6-4e42-b513-7d74e3b9fe32', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('220', '0-bb98a537-84a6-4e42-b513-7d74e3b9fe32', ' 选项32', 'D');
INSERT INTO `question_options` VALUES ('221', '0-39c839e5-15dc-4be6-9017-65199c80786f', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('222', '0-39c839e5-15dc-4be6-9017-65199c80786f', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('223', '0-39c839e5-15dc-4be6-9017-65199c80786f', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('224', '0-39c839e5-15dc-4be6-9017-65199c80786f', ' 选项33', 'D');
INSERT INTO `question_options` VALUES ('225', '0-72f2a554-106c-42f1-be02-170ebd0c066d', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('226', '0-72f2a554-106c-42f1-be02-170ebd0c066d', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('227', '0-72f2a554-106c-42f1-be02-170ebd0c066d', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('228', '0-72f2a554-106c-42f1-be02-170ebd0c066d', ' 选项34', 'D');
INSERT INTO `question_options` VALUES ('229', '0-60513f46-5ef2-4972-bc15-fb11dcd0e661', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('230', '0-60513f46-5ef2-4972-bc15-fb11dcd0e661', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('231', '0-60513f46-5ef2-4972-bc15-fb11dcd0e661', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('232', '0-60513f46-5ef2-4972-bc15-fb11dcd0e661', ' 选项35', 'D');
INSERT INTO `question_options` VALUES ('233', '0-61c7b780-1250-490c-b000-0fe7ea2f1411', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('234', '0-61c7b780-1250-490c-b000-0fe7ea2f1411', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('235', '0-61c7b780-1250-490c-b000-0fe7ea2f1411', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('236', '0-61c7b780-1250-490c-b000-0fe7ea2f1411', ' 选项36', 'D');
INSERT INTO `question_options` VALUES ('237', '0-1d4f78dd-82e0-4bef-a484-3ea2de2e4c4d', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('238', '0-1d4f78dd-82e0-4bef-a484-3ea2de2e4c4d', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('239', '0-1d4f78dd-82e0-4bef-a484-3ea2de2e4c4d', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('240', '0-1d4f78dd-82e0-4bef-a484-3ea2de2e4c4d', ' 选项37', 'D');
INSERT INTO `question_options` VALUES ('241', '0-8413ac52-d337-4a7b-b6ef-228e06da0c47', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('242', '0-8413ac52-d337-4a7b-b6ef-228e06da0c47', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('243', '0-8413ac52-d337-4a7b-b6ef-228e06da0c47', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('244', '0-8413ac52-d337-4a7b-b6ef-228e06da0c47', ' 选项38', 'D');
INSERT INTO `question_options` VALUES ('245', '0-91db86b1-c696-46fa-8504-f896950c7fee', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('246', '0-91db86b1-c696-46fa-8504-f896950c7fee', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('247', '0-91db86b1-c696-46fa-8504-f896950c7fee', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('248', '0-91db86b1-c696-46fa-8504-f896950c7fee', ' 选项39', 'D');
INSERT INTO `question_options` VALUES ('249', '0-46a84b66-90e6-48fa-bccf-183071b55346', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('250', '0-46a84b66-90e6-48fa-bccf-183071b55346', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('251', '0-46a84b66-90e6-48fa-bccf-183071b55346', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('252', '0-46a84b66-90e6-48fa-bccf-183071b55346', ' 选项40', 'D');
INSERT INTO `question_options` VALUES ('253', '0-7b78e6c4-1d6c-488b-baae-4e0fb751e570', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('254', '0-7b78e6c4-1d6c-488b-baae-4e0fb751e570', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('255', '0-7b78e6c4-1d6c-488b-baae-4e0fb751e570', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('256', '0-7b78e6c4-1d6c-488b-baae-4e0fb751e570', ' 选项41', 'D');
INSERT INTO `question_options` VALUES ('257', '0-858f7e21-32fc-4296-baee-f08a3c9cab04', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('258', '0-858f7e21-32fc-4296-baee-f08a3c9cab04', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('259', '0-858f7e21-32fc-4296-baee-f08a3c9cab04', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('260', '0-858f7e21-32fc-4296-baee-f08a3c9cab04', ' 选项42', 'D');
INSERT INTO `question_options` VALUES ('261', '0-5114ad91-0c8b-4c66-b042-4efa0bbbd40a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('262', '0-5114ad91-0c8b-4c66-b042-4efa0bbbd40a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('263', '0-5114ad91-0c8b-4c66-b042-4efa0bbbd40a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('264', '0-5114ad91-0c8b-4c66-b042-4efa0bbbd40a', ' 选项43', 'D');
INSERT INTO `question_options` VALUES ('265', '0-7ff3d059-109b-49aa-843b-ecf18da6178a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('266', '0-7ff3d059-109b-49aa-843b-ecf18da6178a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('267', '0-7ff3d059-109b-49aa-843b-ecf18da6178a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('268', '0-7ff3d059-109b-49aa-843b-ecf18da6178a', ' 选项44', 'D');
INSERT INTO `question_options` VALUES ('269', '0-08f972ac-8ec1-4c8a-a220-a37e4211b010', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('270', '0-08f972ac-8ec1-4c8a-a220-a37e4211b010', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('271', '0-08f972ac-8ec1-4c8a-a220-a37e4211b010', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('272', '0-08f972ac-8ec1-4c8a-a220-a37e4211b010', ' 选项45', 'D');
INSERT INTO `question_options` VALUES ('273', '0-6cf46666-070d-4d9e-92e1-0a0ffb791bc7', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('274', '0-6cf46666-070d-4d9e-92e1-0a0ffb791bc7', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('275', '0-6cf46666-070d-4d9e-92e1-0a0ffb791bc7', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('276', '0-6cf46666-070d-4d9e-92e1-0a0ffb791bc7', ' 选项46', 'D');
INSERT INTO `question_options` VALUES ('277', '0-b540aa88-5a9a-4511-87ef-7014c24df690', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('278', '0-b540aa88-5a9a-4511-87ef-7014c24df690', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('279', '0-b540aa88-5a9a-4511-87ef-7014c24df690', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('280', '0-b540aa88-5a9a-4511-87ef-7014c24df690', ' 选项47', 'D');
INSERT INTO `question_options` VALUES ('281', '0-e4f0112a-a8b8-4b87-80a7-cba9cebcaadb', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('282', '0-e4f0112a-a8b8-4b87-80a7-cba9cebcaadb', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('283', '0-e4f0112a-a8b8-4b87-80a7-cba9cebcaadb', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('284', '0-e4f0112a-a8b8-4b87-80a7-cba9cebcaadb', ' 选项48', 'D');
INSERT INTO `question_options` VALUES ('285', '0-7050765f-e4f8-46cf-bb67-7164ce372303', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('286', '0-7050765f-e4f8-46cf-bb67-7164ce372303', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('287', '0-7050765f-e4f8-46cf-bb67-7164ce372303', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('288', '0-7050765f-e4f8-46cf-bb67-7164ce372303', ' 选项49', 'D');
INSERT INTO `question_options` VALUES ('289', '0-d12b14f6-2dad-4193-a5b2-3a27baa71755', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('290', '0-d12b14f6-2dad-4193-a5b2-3a27baa71755', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('291', '0-d12b14f6-2dad-4193-a5b2-3a27baa71755', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('292', '0-d12b14f6-2dad-4193-a5b2-3a27baa71755', ' 选项50', 'D');
INSERT INTO `question_options` VALUES ('293', '0-6f7944ae-9c19-48b0-b250-adf7833a351e', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('294', '0-6f7944ae-9c19-48b0-b250-adf7833a351e', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('295', '0-6f7944ae-9c19-48b0-b250-adf7833a351e', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('296', '0-6f7944ae-9c19-48b0-b250-adf7833a351e', ' 选项51', 'D');
INSERT INTO `question_options` VALUES ('297', '0-d62dced6-2c4b-40cb-ab2f-353bfa88972e', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('298', '0-d62dced6-2c4b-40cb-ab2f-353bfa88972e', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('299', '0-d62dced6-2c4b-40cb-ab2f-353bfa88972e', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('300', '0-d62dced6-2c4b-40cb-ab2f-353bfa88972e', ' 选项52', 'D');
INSERT INTO `question_options` VALUES ('301', '0-fd10b56b-ffa9-421b-b1ee-6c5ae5bb66d8', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('302', '0-fd10b56b-ffa9-421b-b1ee-6c5ae5bb66d8', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('303', '0-fd10b56b-ffa9-421b-b1ee-6c5ae5bb66d8', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('304', '0-fd10b56b-ffa9-421b-b1ee-6c5ae5bb66d8', ' 选项53', 'D');
INSERT INTO `question_options` VALUES ('305', '0-edfe6b63-a075-450f-a064-075ead107c58', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('306', '0-edfe6b63-a075-450f-a064-075ead107c58', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('307', '0-edfe6b63-a075-450f-a064-075ead107c58', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('308', '0-edfe6b63-a075-450f-a064-075ead107c58', ' 选项54', 'D');
INSERT INTO `question_options` VALUES ('309', '0-551cde99-9c58-4426-a72a-74862662c797', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('310', '0-551cde99-9c58-4426-a72a-74862662c797', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('311', '0-551cde99-9c58-4426-a72a-74862662c797', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('312', '0-551cde99-9c58-4426-a72a-74862662c797', ' 选项55', 'D');
INSERT INTO `question_options` VALUES ('313', '0-c7fda2de-ace0-4f13-8031-015c7bdf1be0', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('314', '0-c7fda2de-ace0-4f13-8031-015c7bdf1be0', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('315', '0-c7fda2de-ace0-4f13-8031-015c7bdf1be0', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('316', '0-c7fda2de-ace0-4f13-8031-015c7bdf1be0', ' 选项56', 'D');
INSERT INTO `question_options` VALUES ('317', '0-8377cc84-ba7f-4369-a2ba-8b0960db89e0', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('318', '0-8377cc84-ba7f-4369-a2ba-8b0960db89e0', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('319', '0-8377cc84-ba7f-4369-a2ba-8b0960db89e0', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('320', '0-8377cc84-ba7f-4369-a2ba-8b0960db89e0', ' 选项57', 'D');
INSERT INTO `question_options` VALUES ('321', '0-d47c6230-717e-478f-9c05-f372832e0c20', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('322', '0-d47c6230-717e-478f-9c05-f372832e0c20', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('323', '0-d47c6230-717e-478f-9c05-f372832e0c20', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('324', '0-d47c6230-717e-478f-9c05-f372832e0c20', ' 选项58', 'D');
INSERT INTO `question_options` VALUES ('325', '0-7f7befa7-831f-41c7-967c-566a6a889319', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('326', '0-7f7befa7-831f-41c7-967c-566a6a889319', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('327', '0-7f7befa7-831f-41c7-967c-566a6a889319', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('328', '0-7f7befa7-831f-41c7-967c-566a6a889319', ' 选项59', 'D');
INSERT INTO `question_options` VALUES ('329', '0-9e02212a-6fb1-4b37-abaf-abc4c41a5003', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('330', '0-9e02212a-6fb1-4b37-abaf-abc4c41a5003', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('331', '0-9e02212a-6fb1-4b37-abaf-abc4c41a5003', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('332', '0-9e02212a-6fb1-4b37-abaf-abc4c41a5003', ' 选项60', 'D');
INSERT INTO `question_options` VALUES ('333', '0-f6a7c7b8-3360-4f90-9525-fe7f70383fcb', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('334', '0-f6a7c7b8-3360-4f90-9525-fe7f70383fcb', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('335', '0-f6a7c7b8-3360-4f90-9525-fe7f70383fcb', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('336', '0-f6a7c7b8-3360-4f90-9525-fe7f70383fcb', ' 选项61', 'D');
INSERT INTO `question_options` VALUES ('337', '0-020dc6ed-9149-4f73-b1b1-0b283619a25d', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('338', '0-020dc6ed-9149-4f73-b1b1-0b283619a25d', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('339', '0-020dc6ed-9149-4f73-b1b1-0b283619a25d', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('340', '0-020dc6ed-9149-4f73-b1b1-0b283619a25d', ' 选项62', 'D');
INSERT INTO `question_options` VALUES ('341', '0-32b3a4c2-a153-43fa-9b14-bda9cd266a1a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('342', '0-32b3a4c2-a153-43fa-9b14-bda9cd266a1a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('343', '0-32b3a4c2-a153-43fa-9b14-bda9cd266a1a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('344', '0-32b3a4c2-a153-43fa-9b14-bda9cd266a1a', ' 选项63', 'D');
INSERT INTO `question_options` VALUES ('345', '0-e5ee5619-2694-4dc9-a0cd-eb0afb1ef93d', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('346', '0-e5ee5619-2694-4dc9-a0cd-eb0afb1ef93d', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('347', '0-e5ee5619-2694-4dc9-a0cd-eb0afb1ef93d', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('348', '0-e5ee5619-2694-4dc9-a0cd-eb0afb1ef93d', ' 选项64', 'D');
INSERT INTO `question_options` VALUES ('349', '0-b0ec576d-3717-4562-8e63-ab77e91c3048', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('350', '0-b0ec576d-3717-4562-8e63-ab77e91c3048', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('351', '0-b0ec576d-3717-4562-8e63-ab77e91c3048', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('352', '0-b0ec576d-3717-4562-8e63-ab77e91c3048', ' 选项65', 'D');
INSERT INTO `question_options` VALUES ('353', '0-6120e9b9-d92b-4eb1-9e6c-963eaad0e90e', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('354', '0-6120e9b9-d92b-4eb1-9e6c-963eaad0e90e', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('355', '0-6120e9b9-d92b-4eb1-9e6c-963eaad0e90e', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('356', '0-6120e9b9-d92b-4eb1-9e6c-963eaad0e90e', ' 选项66', 'D');
INSERT INTO `question_options` VALUES ('357', '0-540fb766-18db-40d4-96a8-c6dd17fbf1ab', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('358', '0-540fb766-18db-40d4-96a8-c6dd17fbf1ab', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('359', '0-540fb766-18db-40d4-96a8-c6dd17fbf1ab', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('360', '0-540fb766-18db-40d4-96a8-c6dd17fbf1ab', ' 选项67', 'D');
INSERT INTO `question_options` VALUES ('361', '0-562316bc-05fa-484c-bd50-a3a82c2b0ee8', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('362', '0-562316bc-05fa-484c-bd50-a3a82c2b0ee8', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('363', '0-562316bc-05fa-484c-bd50-a3a82c2b0ee8', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('364', '0-562316bc-05fa-484c-bd50-a3a82c2b0ee8', ' 选项68', 'D');
INSERT INTO `question_options` VALUES ('365', '0-d68528c9-8c30-4b4b-a3ee-29ace49614b1', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('366', '0-d68528c9-8c30-4b4b-a3ee-29ace49614b1', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('367', '0-d68528c9-8c30-4b4b-a3ee-29ace49614b1', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('368', '0-d68528c9-8c30-4b4b-a3ee-29ace49614b1', ' 选项69', 'D');
INSERT INTO `question_options` VALUES ('369', '0-2b45e899-fb8a-43ff-a66f-f25b287bee16', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('370', '0-2b45e899-fb8a-43ff-a66f-f25b287bee16', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('371', '0-2b45e899-fb8a-43ff-a66f-f25b287bee16', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('372', '0-2b45e899-fb8a-43ff-a66f-f25b287bee16', ' 选项70', 'D');
INSERT INTO `question_options` VALUES ('373', '0-a854b1c9-a2aa-4dc2-be03-06c3834974d3', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('374', '0-a854b1c9-a2aa-4dc2-be03-06c3834974d3', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('375', '0-a854b1c9-a2aa-4dc2-be03-06c3834974d3', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('376', '0-a854b1c9-a2aa-4dc2-be03-06c3834974d3', ' 选项71', 'D');
INSERT INTO `question_options` VALUES ('377', '0-9d7257f5-d5a1-4c49-823a-4bdfec52678b', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('378', '0-9d7257f5-d5a1-4c49-823a-4bdfec52678b', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('379', '0-9d7257f5-d5a1-4c49-823a-4bdfec52678b', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('380', '0-9d7257f5-d5a1-4c49-823a-4bdfec52678b', ' 选项72', 'D');
INSERT INTO `question_options` VALUES ('381', '0-83284257-2c8a-4f50-a02c-d69a732cdd0a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('382', '0-83284257-2c8a-4f50-a02c-d69a732cdd0a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('383', '0-83284257-2c8a-4f50-a02c-d69a732cdd0a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('384', '0-83284257-2c8a-4f50-a02c-d69a732cdd0a', ' 选项73', 'D');
INSERT INTO `question_options` VALUES ('385', '0-ef879097-ed00-42c6-8fe6-49b696c42ea7', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('386', '0-ef879097-ed00-42c6-8fe6-49b696c42ea7', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('387', '0-ef879097-ed00-42c6-8fe6-49b696c42ea7', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('388', '0-ef879097-ed00-42c6-8fe6-49b696c42ea7', ' 选项74', 'D');
INSERT INTO `question_options` VALUES ('389', '0-39fad0d7-edf3-41d0-9fdc-e195aaf83011', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('390', '0-39fad0d7-edf3-41d0-9fdc-e195aaf83011', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('391', '0-39fad0d7-edf3-41d0-9fdc-e195aaf83011', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('392', '0-39fad0d7-edf3-41d0-9fdc-e195aaf83011', ' 选项75', 'D');
INSERT INTO `question_options` VALUES ('393', '0-e63988e0-617e-4d4f-b1bc-01e0f1432d28', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('394', '0-e63988e0-617e-4d4f-b1bc-01e0f1432d28', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('395', '0-e63988e0-617e-4d4f-b1bc-01e0f1432d28', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('396', '0-e63988e0-617e-4d4f-b1bc-01e0f1432d28', ' 选项76', 'D');
INSERT INTO `question_options` VALUES ('397', '0-29318673-8237-40d2-bd2a-8f9f948dc479', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('398', '0-29318673-8237-40d2-bd2a-8f9f948dc479', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('399', '0-29318673-8237-40d2-bd2a-8f9f948dc479', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('400', '0-29318673-8237-40d2-bd2a-8f9f948dc479', ' 选项77', 'D');
INSERT INTO `question_options` VALUES ('401', '0-4698286f-3639-405e-a255-c95eb0afc3a1', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('402', '0-4698286f-3639-405e-a255-c95eb0afc3a1', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('403', '0-4698286f-3639-405e-a255-c95eb0afc3a1', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('404', '0-4698286f-3639-405e-a255-c95eb0afc3a1', ' 选项78', 'D');
INSERT INTO `question_options` VALUES ('405', '0-3b2325e5-c40e-4c54-991a-79f19f5f2fe5', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('406', '0-3b2325e5-c40e-4c54-991a-79f19f5f2fe5', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('407', '0-3b2325e5-c40e-4c54-991a-79f19f5f2fe5', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('408', '0-3b2325e5-c40e-4c54-991a-79f19f5f2fe5', ' 选项79', 'D');
INSERT INTO `question_options` VALUES ('409', '0-e52d8100-ee3b-4c54-a449-285a4ead142a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('410', '0-e52d8100-ee3b-4c54-a449-285a4ead142a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('411', '0-e52d8100-ee3b-4c54-a449-285a4ead142a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('412', '0-e52d8100-ee3b-4c54-a449-285a4ead142a', ' 选项80', 'D');
INSERT INTO `question_options` VALUES ('413', '0-2a611964-343e-4701-9e97-58f3ed98573a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('414', '0-2a611964-343e-4701-9e97-58f3ed98573a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('415', '0-2a611964-343e-4701-9e97-58f3ed98573a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('416', '0-2a611964-343e-4701-9e97-58f3ed98573a', ' 选项81', 'D');
INSERT INTO `question_options` VALUES ('417', '0-52a405a3-08df-4f68-997a-3c347f83fc36', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('418', '0-52a405a3-08df-4f68-997a-3c347f83fc36', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('419', '0-52a405a3-08df-4f68-997a-3c347f83fc36', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('420', '0-52a405a3-08df-4f68-997a-3c347f83fc36', ' 选项82', 'D');
INSERT INTO `question_options` VALUES ('421', '0-3cb2d6ff-57ad-49d1-a1ae-e2d7b196a050', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('422', '0-3cb2d6ff-57ad-49d1-a1ae-e2d7b196a050', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('423', '0-3cb2d6ff-57ad-49d1-a1ae-e2d7b196a050', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('424', '0-3cb2d6ff-57ad-49d1-a1ae-e2d7b196a050', ' 选项83', 'D');
INSERT INTO `question_options` VALUES ('425', '0-fcbf66a1-f079-4d06-9e53-562da61d8644', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('426', '0-fcbf66a1-f079-4d06-9e53-562da61d8644', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('427', '0-fcbf66a1-f079-4d06-9e53-562da61d8644', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('428', '0-fcbf66a1-f079-4d06-9e53-562da61d8644', ' 选项84', 'D');
INSERT INTO `question_options` VALUES ('429', '0-579a0cc5-edc3-48f8-ad08-c49ad9608575', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('430', '0-579a0cc5-edc3-48f8-ad08-c49ad9608575', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('431', '0-579a0cc5-edc3-48f8-ad08-c49ad9608575', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('432', '0-579a0cc5-edc3-48f8-ad08-c49ad9608575', ' 选项85', 'D');
INSERT INTO `question_options` VALUES ('433', '0-600937bb-e5dc-43bc-85a8-c4b4f0eedfff', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('434', '0-600937bb-e5dc-43bc-85a8-c4b4f0eedfff', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('435', '0-600937bb-e5dc-43bc-85a8-c4b4f0eedfff', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('436', '0-600937bb-e5dc-43bc-85a8-c4b4f0eedfff', ' 选项86', 'D');
INSERT INTO `question_options` VALUES ('437', '0-fbcff7a1-bdd8-49f6-94b7-3c10386ec213', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('438', '0-fbcff7a1-bdd8-49f6-94b7-3c10386ec213', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('439', '0-fbcff7a1-bdd8-49f6-94b7-3c10386ec213', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('440', '0-fbcff7a1-bdd8-49f6-94b7-3c10386ec213', ' 选项87', 'D');
INSERT INTO `question_options` VALUES ('441', '0-b31ee142-c256-4b8d-b01c-62227a9eadb0', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('442', '0-b31ee142-c256-4b8d-b01c-62227a9eadb0', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('443', '0-b31ee142-c256-4b8d-b01c-62227a9eadb0', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('444', '0-b31ee142-c256-4b8d-b01c-62227a9eadb0', ' 选项88', 'D');
INSERT INTO `question_options` VALUES ('445', '0-a051bb0f-804b-470c-8684-10849b3728e3', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('446', '0-a051bb0f-804b-470c-8684-10849b3728e3', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('447', '0-a051bb0f-804b-470c-8684-10849b3728e3', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('448', '0-a051bb0f-804b-470c-8684-10849b3728e3', ' 选项89', 'D');
INSERT INTO `question_options` VALUES ('449', '0-d072bab0-5b74-46ae-9419-bded108d9755', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('450', '0-d072bab0-5b74-46ae-9419-bded108d9755', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('451', '0-d072bab0-5b74-46ae-9419-bded108d9755', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('452', '0-d072bab0-5b74-46ae-9419-bded108d9755', ' 选项90', 'D');
INSERT INTO `question_options` VALUES ('453', '0-3e968298-c5ed-49d6-8c8b-2617fd4fb95b', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('454', '0-3e968298-c5ed-49d6-8c8b-2617fd4fb95b', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('455', '0-3e968298-c5ed-49d6-8c8b-2617fd4fb95b', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('456', '0-3e968298-c5ed-49d6-8c8b-2617fd4fb95b', ' 选项91', 'D');
INSERT INTO `question_options` VALUES ('457', '0-b2fe6ff6-fb07-49bd-88d0-3e064324e192', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('458', '0-b2fe6ff6-fb07-49bd-88d0-3e064324e192', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('459', '0-b2fe6ff6-fb07-49bd-88d0-3e064324e192', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('460', '0-b2fe6ff6-fb07-49bd-88d0-3e064324e192', ' 选项92', 'D');
INSERT INTO `question_options` VALUES ('461', '0-4fd5589b-4a6e-4591-a854-391e5ec735e8', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('462', '0-4fd5589b-4a6e-4591-a854-391e5ec735e8', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('463', '0-4fd5589b-4a6e-4591-a854-391e5ec735e8', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('464', '0-4fd5589b-4a6e-4591-a854-391e5ec735e8', ' 选项93', 'D');
INSERT INTO `question_options` VALUES ('465', '0-90c6e7ad-7a06-452e-8454-ca6076808b02', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('466', '0-90c6e7ad-7a06-452e-8454-ca6076808b02', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('467', '0-90c6e7ad-7a06-452e-8454-ca6076808b02', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('468', '0-90c6e7ad-7a06-452e-8454-ca6076808b02', ' 选项94', 'D');
INSERT INTO `question_options` VALUES ('469', '0-8eda3817-b6b8-4b8d-83cb-0111c85412e0', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('470', '0-8eda3817-b6b8-4b8d-83cb-0111c85412e0', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('471', '0-8eda3817-b6b8-4b8d-83cb-0111c85412e0', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('472', '0-8eda3817-b6b8-4b8d-83cb-0111c85412e0', ' 选项95', 'D');
INSERT INTO `question_options` VALUES ('473', '0-58f30162-0709-4247-b571-06715dd15b20', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('474', '0-58f30162-0709-4247-b571-06715dd15b20', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('475', '0-58f30162-0709-4247-b571-06715dd15b20', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('476', '0-58f30162-0709-4247-b571-06715dd15b20', ' 选项96', 'D');
INSERT INTO `question_options` VALUES ('477', '0-73d2f2bb-f66e-4776-8f16-4d45d92439f0', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('478', '0-73d2f2bb-f66e-4776-8f16-4d45d92439f0', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('479', '0-73d2f2bb-f66e-4776-8f16-4d45d92439f0', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('480', '0-73d2f2bb-f66e-4776-8f16-4d45d92439f0', ' 选项97', 'D');
INSERT INTO `question_options` VALUES ('481', '0-cdaffbcb-cb92-4717-9f81-389a297d3be8', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('482', '0-cdaffbcb-cb92-4717-9f81-389a297d3be8', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('483', '0-cdaffbcb-cb92-4717-9f81-389a297d3be8', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('484', '0-cdaffbcb-cb92-4717-9f81-389a297d3be8', ' 选项98', 'D');
INSERT INTO `question_options` VALUES ('485', '0-b8610940-128f-4e00-87ea-3426a90e454a', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('486', '0-b8610940-128f-4e00-87ea-3426a90e454a', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('487', '0-b8610940-128f-4e00-87ea-3426a90e454a', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('488', '0-b8610940-128f-4e00-87ea-3426a90e454a', ' 选项99', 'D');
INSERT INTO `question_options` VALUES ('489', '0-652a71ad-8459-43ca-82dc-88a511790423', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('490', '0-652a71ad-8459-43ca-82dc-88a511790423', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('491', '0-652a71ad-8459-43ca-82dc-88a511790423', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('492', '0-652a71ad-8459-43ca-82dc-88a511790423', ' 选项100', 'D');
INSERT INTO `question_options` VALUES ('493', '0-2f16d9cd-967e-4222-a727-15269904d004', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('494', '0-2f16d9cd-967e-4222-a727-15269904d004', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('495', '0-2f16d9cd-967e-4222-a727-15269904d004', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('496', '0-2f16d9cd-967e-4222-a727-15269904d004', ' 选项101', 'D');
INSERT INTO `question_options` VALUES ('497', '0-6f921559-9b0f-4000-ad7e-6591d831b28f', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('498', '0-6f921559-9b0f-4000-ad7e-6591d831b28f', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('499', '0-6f921559-9b0f-4000-ad7e-6591d831b28f', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('500', '0-6f921559-9b0f-4000-ad7e-6591d831b28f', ' 选项102', 'D');
INSERT INTO `question_options` VALUES ('501', '0-a6c0a3b2-5e87-43bc-9fa7-39395e3ff64d', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('502', '0-a6c0a3b2-5e87-43bc-9fa7-39395e3ff64d', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('503', '0-a6c0a3b2-5e87-43bc-9fa7-39395e3ff64d', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('504', '0-a6c0a3b2-5e87-43bc-9fa7-39395e3ff64d', ' 选项103', 'D');
INSERT INTO `question_options` VALUES ('505', '0-e0bfb6e3-50cd-4e23-9e4c-b39441bf6ac6', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('506', '0-e0bfb6e3-50cd-4e23-9e4c-b39441bf6ac6', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('507', '0-e0bfb6e3-50cd-4e23-9e4c-b39441bf6ac6', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('508', '0-e0bfb6e3-50cd-4e23-9e4c-b39441bf6ac6', ' 选项104', 'D');
INSERT INTO `question_options` VALUES ('509', '0-760e4a1a-86cb-4b17-ab98-1abd2ba8b677', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('510', '0-760e4a1a-86cb-4b17-ab98-1abd2ba8b677', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('511', '0-760e4a1a-86cb-4b17-ab98-1abd2ba8b677', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('512', '0-760e4a1a-86cb-4b17-ab98-1abd2ba8b677', ' 选项105', 'D');
INSERT INTO `question_options` VALUES ('513', '0-12017217-0c72-4c14-b4fa-7d0edd55ada3', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('514', '0-12017217-0c72-4c14-b4fa-7d0edd55ada3', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('515', '0-12017217-0c72-4c14-b4fa-7d0edd55ada3', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('516', '0-12017217-0c72-4c14-b4fa-7d0edd55ada3', ' 选项106', 'D');
INSERT INTO `question_options` VALUES ('517', '0-7fa6ae7a-d5c6-4456-806b-4a25b31a15d1', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('518', '0-7fa6ae7a-d5c6-4456-806b-4a25b31a15d1', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('519', '0-7fa6ae7a-d5c6-4456-806b-4a25b31a15d1', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('520', '0-7fa6ae7a-d5c6-4456-806b-4a25b31a15d1', ' 选项107', 'D');
INSERT INTO `question_options` VALUES ('521', '0-f239eeea-d952-4b78-aa18-f8076e2b1ca7', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('522', '0-f239eeea-d952-4b78-aa18-f8076e2b1ca7', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('523', '0-f239eeea-d952-4b78-aa18-f8076e2b1ca7', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('524', '0-f239eeea-d952-4b78-aa18-f8076e2b1ca7', ' 选项108', 'D');
INSERT INTO `question_options` VALUES ('525', '0-fed9ce6f-0bdb-4a8d-90b9-69793025b31e', ' 选项1', 'A');
INSERT INTO `question_options` VALUES ('526', '0-fed9ce6f-0bdb-4a8d-90b9-69793025b31e', ' 选项2', 'B');
INSERT INTO `question_options` VALUES ('527', '0-fed9ce6f-0bdb-4a8d-90b9-69793025b31e', ' 选项3', 'C');
INSERT INTO `question_options` VALUES ('528', '0-fed9ce6f-0bdb-4a8d-90b9-69793025b31e', ' 选项109', 'D');
INSERT INTO `question_options` VALUES ('529', '0-d7be334f-c8f6-49d9-9905-2a86a7cbfc6e', ' 生产和消费的矛盾  ', 'A');
INSERT INTO `question_options` VALUES ('530', '0-d7be334f-c8f6-49d9-9905-2a86a7cbfc6e', ' 劳动人民的消费不足 ', 'B');
INSERT INTO `question_options` VALUES ('531', '0-d7be334f-c8f6-49d9-9905-2a86a7cbfc6e', ' 消费需求和投资需求的不足 ', 'C');
INSERT INTO `question_options` VALUES ('532', '0-d7be334f-c8f6-49d9-9905-2a86a7cbfc6e', ' 资本主义基本矛盾 ', 'D');
INSERT INTO `question_options` VALUES ('533', '0-db59bf3e-8030-4465-a0a3-1be8e5aab6ea', ' 独立自主 ', 'A');
INSERT INTO `question_options` VALUES ('534', '0-db59bf3e-8030-4465-a0a3-1be8e5aab6ea', ' 和平共处 ', 'B');
INSERT INTO `question_options` VALUES ('535', '0-db59bf3e-8030-4465-a0a3-1be8e5aab6ea', ' 共同发展 ', 'C');
INSERT INTO `question_options` VALUES ('536', '0-db59bf3e-8030-4465-a0a3-1be8e5aab6ea', ' 国家利益 ', 'D');
INSERT INTO `question_options` VALUES ('537', '0-d721704c-812e-4e16-94b9-e04f0df146f2', ' 和平、发展、互利、共赢 ', 'A');
INSERT INTO `question_options` VALUES ('538', '0-d721704c-812e-4e16-94b9-e04f0df146f2', ' 和平、友善、互利、共赢 ', 'B');
INSERT INTO `question_options` VALUES ('539', '0-d721704c-812e-4e16-94b9-e04f0df146f2', ' 和平、发展、合作、共赢 ', 'C');
INSERT INTO `question_options` VALUES ('540', '0-d721704c-812e-4e16-94b9-e04f0df146f2', ' 和平、发展、合作、双赢 ', 'D');
INSERT INTO `question_options` VALUES ('541', '0-84209b3d-9577-4e8f-ad46-284edff8f968', ' 社会和谐 ', 'A');
INSERT INTO `question_options` VALUES ('542', '0-84209b3d-9577-4e8f-ad46-284edff8f968', ' 改革 ', 'B');
INSERT INTO `question_options` VALUES ('543', '0-84209b3d-9577-4e8f-ad46-284edff8f968', ' 增进民生福祉 ', 'C');
INSERT INTO `question_options` VALUES ('544', '0-84209b3d-9577-4e8f-ad46-284edff8f968', ' 开放', 'D');

-- ----------------------------
-- Table structure for `question_template`
-- ----------------------------
DROP TABLE IF EXISTS `question_template`;
CREATE TABLE `question_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `single_num` int DEFAULT NULL,
  `single_score` int DEFAULT NULL,
  `single_difficulty_proportion` varchar(10) DEFAULT NULL,
  `multiple_num` int DEFAULT NULL,
  `multiple_score` int DEFAULT NULL,
  `multiple_difficulty_proportion` varchar(10) DEFAULT NULL,
  `aggregate_score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_template
-- ----------------------------
INSERT INTO `question_template` VALUES ('1', '测试模板', '3', '1', '15', '2', '5:3:1:1', '14', '5', '5:3:1:1', '142');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_code` varchar(50) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('29', 'role-1', '测试角色-1');
INSERT INTO `role` VALUES ('30', 'role-2', '测试角色-2');

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `role_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('29', '25');
INSERT INTO `role_menu` VALUES ('29', '29');
INSERT INTO `role_menu` VALUES ('29', '30');
INSERT INTO `role_menu` VALUES ('29', '26');
INSERT INTO `role_menu` VALUES ('29', '32');
INSERT INTO `role_menu` VALUES ('29', '33');
INSERT INTO `role_menu` VALUES ('30', '26');
INSERT INTO `role_menu` VALUES ('30', '32');
INSERT INTO `role_menu` VALUES ('30', '33');
INSERT INTO `role_menu` VALUES ('30', '27');
INSERT INTO `role_menu` VALUES ('30', '34');
INSERT INTO `role_menu` VALUES ('30', '35');
INSERT INTO `role_menu` VALUES ('30', '28');
INSERT INTO `role_menu` VALUES ('30', '36');

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `answer` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '毛泽东思想概论');
INSERT INTO `subject` VALUES ('2', '大学英语');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `sno` varchar(255) DEFAULT NULL,
  `admission_date` datetime DEFAULT NULL,
  `faculty_id` int DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '管理员', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'admin1234', '123456', '测试', '0', '20110211', '2021-12-06 00:00:00', '1', '1', '1');
INSERT INTO `user` VALUES ('3', 'zhangsan', '121212', 'ww', '1', '321312', '2022-01-01 00:00:00', '1', '1', '1');
INSERT INTO `user` VALUES ('4', 'abcde11', '121212', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'abcde111', '121212', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('6', 'abcde', '121212', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('7', 'test', 'test', '测试test', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('8', 'test001', '1111', '新增用户测试', '1', '201712346541', null, '4', '5', '5');
INSERT INTO `user` VALUES ('9', 'ttt11111', '1111', 'ssad测试', '0', 'xxx000121', '2022-01-13 00:00:00', '4', '5', '6');
INSERT INTO `user` VALUES ('11', 'ttt111112213123123', '1111', 'ssad测试', '0', 'xxx000121', '2022-01-13 00:00:00', '4', '5', '6');
INSERT INTO `user` VALUES ('12', 'test1', '1111', '测试用户1', '0', '12223333', '2022-01-14 00:00:00', '1', '1', '1');
INSERT INTO `user` VALUES ('13', 'test2', '1111', '测试用户2', '1', '555555', '2022-01-14 00:00:00', '2', '2', '4');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('12', '29');
INSERT INTO `user_role` VALUES ('13', '30');
