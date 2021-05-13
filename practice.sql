/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 13/05/2021 12:02:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT 'id，唯一标识',
  `course_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `course_brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程简介',
  `curriculum_time` date NULL DEFAULT NULL COMMENT '开课时间',
  `session_time` date NULL DEFAULT NULL COMMENT '结课时间',
  `course_classify` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程分类',
  `teacher_id` bigint NOT NULL COMMENT '授课老师',
  `textbook` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教材',
  PRIMARY KEY (`uid`, `course_no`, `teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '100001', '数据结构', '《数据结构》课程是计算机科学与技术的学科基础课程，是许多计算机课程的先导课程。', '2020-03-01', '2020-07-01', '计算机', 1, '《数据结构》');

-- ----------------------------
-- Table structure for journalism
-- ----------------------------
DROP TABLE IF EXISTS `journalism`;
CREATE TABLE `journalism`  (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(4500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of journalism
-- ----------------------------
INSERT INTO `journalism` VALUES (33, '教育部：2021届全国普通高校毕业生909万，就业进展总体平稳', '2021-05-12', '5月13日，教育部召开新闻通气会，介绍2021届高校毕业生就业工作进展和就业促进周活动有关情况。', '教育部');
INSERT INTO `journalism` VALUES (34, '教育', '2021-05-03', '123', '123');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int NULL DEFAULT NULL,
  `enabled` tinyint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/admin', NULL, 1, '所有', '');
INSERT INTO `menu` VALUES (2, '/admin/home', 1, 1, '所有管理', 'Home');
INSERT INTO `menu` VALUES (3, '/admin/db', 2, 1, '成绩管理', 'Score');
INSERT INTO `menu` VALUES (4, '/admin/information', 2, 1, '基本信息', 'Information');
INSERT INTO `menu` VALUES (5, '/admin/student', 2, 1, '学生管理', 'Student');
INSERT INTO `menu` VALUES (6, '/admin/home', 1, 1, '权限管理', 'Home');
INSERT INTO `menu` VALUES (7, '/admin/user', 6, 1, '用户管理', 'UserManage');
INSERT INTO `menu` VALUES (8, '/admin/teacher', 2, 1, '教师管理', 'Teacher');
INSERT INTO `menu` VALUES (9, '/admin/course', 2, 1, '课程管理', 'Course');
INSERT INTO `menu` VALUES (10, '/admin/journalism', 2, 1, '新闻管理', 'Journalism');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (1, 3, 1);
INSERT INTO `menu_role` VALUES (2, 4, 2);
INSERT INTO `menu_role` VALUES (3, 5, 3);
INSERT INTO `menu_role` VALUES (4, 7, 2);
INSERT INTO `menu_role` VALUES (5, 8, 3);
INSERT INTO `menu_role` VALUES (6, 9, 3);
INSERT INTO `menu_role` VALUES (7, 10, 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_dba', '数据库管理员');
INSERT INTO `role` VALUES (2, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (3, 'ROLE_user', '用户');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (29, '徐昊', 22, '男');
INSERT INTO `student` VALUES (31, 'hello', 23, '男');
INSERT INTO `student` VALUES (32, '哈哈', 22, '男');

-- ----------------------------
-- Table structure for student_copy
-- ----------------------------
DROP TABLE IF EXISTS `student_copy`;
CREATE TABLE `student_copy`  (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student_copy
-- ----------------------------
INSERT INTO `student_copy` VALUES (23, '徐昊', 22, '男');
INSERT INTO `student_copy` VALUES (25, '阿旺', NULL, NULL);
INSERT INTO `student_copy` VALUES (27, '信息', 35, 'VC');
INSERT INTO `student_copy` VALUES (28, '徐哈', 22, '男');

-- ----------------------------
-- Table structure for student_count
-- ----------------------------
DROP TABLE IF EXISTS `student_count`;
CREATE TABLE `student_count`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student_count
-- ----------------------------
INSERT INTO `student_count` VALUES (1, 3);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT '工号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `party` tinyint(1) NULL DEFAULT 0 COMMENT '入党情况',
  `address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `emil` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `rank` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称',
  `degree` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学位',
  `course` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所授课程',
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `hiredate` date NULL DEFAULT NULL COMMENT '入职时间',
  `evaluation` int NULL DEFAULT NULL COMMENT '能力评价',
  `research` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '研究方向',
  `hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '爱好',
  `college` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '张三', 32, '女', 1, '北京市,市辖区,东城区', '15310842544', 'zhangsan@qq.com', '教授', '硕士', '操作系统,Java程序设计,C语言程序设计', '你好，世界！\n21321323\n1323123213\n123123213', '2021-03-29', 4, '人工智能,图像处理,Web开发,电子商务', '运动,音乐', '文学院');
INSERT INTO `teacher` VALUES (4, '王二', 34, '男', 0, '天津市,市辖区,河东区', '13412341234', 'open-src@qq.com', '副教授', '硕士', '数据结构,C语言程序设计', NULL, '2016-03-17', 4, '人工智能,Web开发', '阅读,舞蹈', '计算机于信息科学学院');
INSERT INTO `teacher` VALUES (5, '李二', 28, '女', 1, '河北省,秦皇岛市,北戴河区', '15723495844', 'hello@cqnu.edu.cn', '副教授', '博士', '数据库原理,C语言程序设计', NULL, '2021-03-15', 5, '人工智能', '音乐,游戏', '教育科学学院');
INSERT INTO `teacher` VALUES (6, '张三', 27, '男', 0, '山西省,长治市,武乡县', '15310843486', 'zsstudy@cqnu.deu.cn', '教授', '硕士', 'Java程序设计,数据结构', NULL, '2014-03-05', 4, '人工智能,Web开发', '阅读,游戏', '计算机于信息科学学院');
INSERT INTO `teacher` VALUES (8, '李四', 34, '男', 0, '重庆市,市辖区,万州区', '15923492358', '12313@cqnu.edu.cn', '副教授', '博士', '操作系统,C语言程序设计', NULL, '2011-08-10', 4, '', '', '');
INSERT INTO `teacher` VALUES (10, '王五', 30, '男', 0, '山西省,运城市,闻喜县', '15936541422', '123@qwq.com', '讲师', '硕士', '面向对象程序设计', NULL, '2017-02-27', 3, '', '', '');
INSERT INTO `teacher` VALUES (11, '张一', 32, '男', 1, '辽宁省,鞍山市,铁东区', '15926485934', '123@qq.com', '副教授', '博士', 'C语言程序设计,计算机导论', '123\n123\n123', '2014-03-10', 5, '', '', '');
INSERT INTO `teacher` VALUES (12, '张二', 31, '女', 1, '安徽省,蚌埠市,禹会区', '13348946875', '234@dad.com', '教授', '博士', '计算机组成原理,面向对象程序设计', '123', '2016-03-15', 4, '', '', '');
INSERT INTO `teacher` VALUES (13, '张四', 45, '男', 1, '湖南省,株洲市,荷塘区', '13956987854', '123@qwe.cn', '讲师', '硕士', 'C语言程序设计,软件工程导论', '123', '2013-03-11', 4, '', '', '');
INSERT INTO `teacher` VALUES (14, '王一', 28, '女', 1, '山东省,淄博市,张店区', '15923698745', '123@23.com', '副教授', '博士', 'C语言程序设计,计算机导论,Java程序设计', '', '2003-03-13', 4, '', '', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) NULL DEFAULT 1,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '超级管理员', '18568887789', '029-82881234', '哈尔滨', 1, 'admin', '$2a$10$50aIvzVPzHAtxR.2fR0RTesXsqOaJdpwGbM1dmIp9YGb6xhZVzU6S', NULL);
INSERT INTO `user` VALUES (2, '徐昊', '18568123489', '029-82123434', '重庆', 1, 'xuhao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (3, '老王', '18568123666', '029-82111555', '广州', 1, 'laowang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (8, '老张', NULL, NULL, NULL, 1, 'laozhang', '$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq', NULL);
INSERT INTO `user` VALUES (9, '老李', NULL, NULL, NULL, 0, 'laoli', '$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i', NULL);
INSERT INTO `user` VALUES (10, '小程', NULL, NULL, NULL, 1, 'xiaocheng', '$2a$10$9WvViONP7a.VcId3ktgg.Odj.WJExpc./j/eSNv2bSa8nArwfGGY2', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);
INSERT INTO `user_role` VALUES (4, 3, 3);
INSERT INTO `user_role` VALUES (5, 1, 3);
INSERT INTO `user_role` VALUES (6, 1, 4);

SET FOREIGN_KEY_CHECKS = 1;
