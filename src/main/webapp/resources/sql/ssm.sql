/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 27/01/2021 22:40:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `classId` int(0) NOT NULL AUTO_INCREMENT,
  `className` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `state` int(0) DEFAULT NULL COMMENT '1为正常，2为注销',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`classId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (5, '666', NULL, '666', '2021-01-27 21:51:16', 23);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courseId` int(0) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacherId` int(0) DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  `createPerson` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`courseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `reasonId` int(0) NOT NULL AUTO_INCREMENT,
  `reasonText` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `reasonPid` int(0) DEFAULT 0,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `state` int unsigned,
  `createTime` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`reasonId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES (14, '请假类', 0, '请假类', 1, '2021-01-10 18:56:17', 1);
INSERT INTO `dictionary` VALUES (15, '病假', 14, '病假', 1, '2021-01-10 18:56:38', 1);
INSERT INTO `dictionary` VALUES (16, '婚假', 14, '结婚', 1, '2021-01-10 22:06:53', NULL);
INSERT INTO `dictionary` VALUES (17, '事假', 18, '有事情', 1, '2021-01-10 22:07:12', NULL);
INSERT INTO `dictionary` VALUES (18, '测试类', 0, '测试类', 1, '2021-01-10 22:17:16', NULL);

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log`  (
  `logId` int(0) NOT NULL AUTO_INCREMENT,
  `logIpAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logCreateTime` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `logModuleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logMethodName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logParams` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LogParamter` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int(0) DEFAULT NULL,
  PRIMARY KEY (`logId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
INSERT INTO `operation_log` VALUES (36, NULL, '2021-01-27 21:38:20', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"admin\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (37, NULL, '2021-01-27 21:40:53', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"admin\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (38, NULL, '2021-01-27 21:41:59', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (39, NULL, '2021-01-27 21:42:43', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (40, NULL, '2021-01-27 21:42:46', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (41, NULL, '2021-01-27 21:44:54', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (42, NULL, '2021-01-27 21:44:57', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (43, NULL, '2021-01-27 21:47:09', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (44, NULL, '2021-01-27 21:47:46', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (45, NULL, '2021-01-27 21:47:49', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (46, NULL, '2021-01-27 21:48:21', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (47, NULL, '2021-01-27 21:48:24', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (48, NULL, '2021-01-27 21:55:17', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"admin\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (49, NULL, '2021-01-27 21:55:33', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (50, NULL, '2021-01-27 22:09:57', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (51, NULL, '2021-01-27 22:10:09', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (52, NULL, '2021-01-27 22:10:55', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"xzw\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (53, NULL, '2021-01-27 22:11:20', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"admin\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (54, NULL, '2021-01-27 22:11:47', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"xzw\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (55, NULL, '2021-01-27 22:12:41', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"xzw\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (56, NULL, '2021-01-27 22:14:17', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"xzw\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (57, NULL, '2021-01-27 22:14:20', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"xzw\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (58, NULL, '2021-01-27 22:14:55', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (59, NULL, '2021-01-27 22:15:14', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"xzw\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (60, NULL, '2021-01-27 22:17:33', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"xzw\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (61, NULL, '2021-01-27 22:17:53', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (62, NULL, '2021-01-27 22:19:12', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (63, NULL, '2021-01-27 22:19:16', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (64, NULL, '2021-01-27 22:21:33', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (65, NULL, '2021-01-27 22:24:33', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (66, NULL, '2021-01-27 22:30:16', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"1\"}]', '{}', NULL);
INSERT INTO `operation_log` VALUES (67, NULL, '2021-01-27 22:30:19', '登录模块', '用户登录', 'SELECT', 'doLogin', '[{\"userLogName\":\"tjh\",\"userLogPwd\":\"123456\"}]', '{}', NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `studentId` int(0) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `studentPhone` varchar(30) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `studentBirthday` date DEFAULT NULL,
  `studentReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `studentSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `studentFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `dictionaryPid` int(0) DEFAULT NULL,
  `classId` int(0) DEFAULT NULL,
  `teacherId` int(0) DEFAULT NULL,
  `userId` int(0) DEFAULT NULL,
  `dictionaryId` int(0) DEFAULT NULL,
  `state` int(0) DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (12, 'zzl', '13487805801', '2021-01-27', '13487805801', NULL, '', 14, 5, NULL, NULL, 15, 3, '13487805801', '2021-01-27 21:51:56', 23);
INSERT INTO `student` VALUES (13, 'cs', '12354854247', '2021-01-27', 'adas', NULL, '', 14, 5, 23, NULL, 15, 1, 'adasd', '2021-01-27 22:05:24', 20);
INSERT INTO `student` VALUES (14, 'zzl2', '13487805801', '2021-01-29', 'asfdas', NULL, '', 14, 5, 23, NULL, 15, 2, 'dasda', '2021-01-27 22:14:45', 24);

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `studentId` int(0) NOT NULL,
  `courseId` int(0) NOT NULL,
  PRIMARY KEY (`studentId`, `courseId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `deptId` int(0) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `deptParentId` int(0) DEFAULT NULL COMMENT '构成菜单的时候用',
  `deptName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `deptAdress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门地址',
  `deptNameRemarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门描述',
  `deptOrderNum` int(0) DEFAULT NULL COMMENT '排序用',
  `deptIsOpen` int(0) DEFAULT NULL COMMENT '是否展开 1为展开  2为不展开',
  `deptTel` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '部门电话',
  `deptFax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门传真',
  `state` int(0) DEFAULT NULL COMMENT '状态 1为可用 2为不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createTime` date DEFAULT NULL COMMENT '部门创建时间',
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`deptId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function`  (
  `functionId` int(0) NOT NULL AUTO_INCREMENT COMMENT '功能ID',
  `functionParentId` int(0) DEFAULT NULL COMMENT '功能的父ID',
  `functionType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能类型[menu/permission]',
  `functionIsParent` int(0) DEFAULT 0 COMMENT '0子节点 1父节点',
  `functionCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能编码[只有type= permission才有  user:view]',
  `functionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能名称',
  `functionIcon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能图标',
  `functionHref` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能链接',
  `functionTarget` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能链接',
  `functionIsOpen` int(0) DEFAULT NULL COMMENT '功能是否展开',
  `functionOrderNum` int(0) DEFAULT NULL COMMENT '功能编码',
  `state` int(0) DEFAULT 1 COMMENT '功能状态【0不可用1可用】',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`functionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO `sys_function` VALUES (1, 0, 'menu', 1, NULL, '中小学生管理系统', NULL, '../sys/index.action', NULL, NULL, 1, 1, NULL, '2021-01-20 19:26:49', NULL);
INSERT INTO `sys_function` VALUES (2, 1, 'menu', 1, NULL, '基础管理', 'layui-icon-util', '  ', '', 0, 2, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (5, 1, 'menu', 1, NULL, '系统管理', 'layui-icon-set', '', '', 1, 5, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (6, 1, 'menu', 1, NULL, '其它管理', 'layui-icon-next', '', '', 0, 6, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (7, 2, 'menu', 0, NULL, '班级管理', 'layui-icon-user', '../classManager/classManager.action', '', 0, 7, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (8, 2, 'menu', 0, NULL, '学生管理', 'layui-icon-survey', '../studentManager/studentManager.action', '', 0, 8, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (9, 2, 'menu', 0, NULL, '教师管理', 'layui-icon-face-smile', '../teacherManager/teacherManager.action', '', 0, 9, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (15, 5, 'menu', 0, NULL, '菜单管理', 'layui-icon-read', '../menuManager/menuManager.action', '', 0, 15, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (17, 5, 'menu', 0, '', '角色管理', 'layui-icon-username', '../roleManager/roleManager.action', '', 0, 17, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (22, 6, 'menu', 0, NULL, '字典管理', 'layui-icon-list', '../dictionaryManager/dictionaryManager.action', NULL, 0, 22, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (34, 15, 'permission', 0, 'addMenu', '添加菜单', '', '', '', 0, 29, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (35, 15, 'permission', 0, 'updateMenuByMenuId', '修改菜单', '', NULL, NULL, 0, 30, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (42, 17, 'permission', 0, 'role:create', '添加角色', '', NULL, NULL, 0, 37, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (43, 17, 'permission', 0, 'role:update', '修改角色', '', NULL, NULL, 0, 38, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (44, 17, 'permission', 0, 'role:delete', '删除角色', '', NULL, NULL, 0, 39, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (45, 17, 'permission', 0, 'role:batchdelete', '角色批量删除', '', NULL, NULL, 0, 40, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (47, 18, 'permission', 0, 'user:create', '添加用户', '', NULL, NULL, 0, 42, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (48, 18, 'permission', 0, 'user:update', '修改用户', '', NULL, NULL, 0, 43, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (49, 18, 'permission', 0, 'user:delete', '删除用户', '', NULL, NULL, 0, 44, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (50, 18, 'permission', 0, 'user:batchdelete', '用户批量删除', '', NULL, NULL, 0, 45, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (51, 18, 'permission', 0, 'user:selectRole', '用户分配角色', '', NULL, NULL, 0, 46, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (52, 18, 'permission', 0, 'user:resetpwd', '重置密码', NULL, NULL, NULL, 0, 47, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (53, 14, 'permission', 0, 'dept:view', '部门查询', NULL, NULL, NULL, 0, 48, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (56, 17, 'permission', 0, 'role:view', '角色查询', NULL, NULL, NULL, 0, 51, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (57, 18, 'permission', 0, 'user:view', '用户查询', NULL, NULL, NULL, 0, 52, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (61, 1, 'menu', 1, NULL, '审批管理', 'layui-icon-edit', '', '', 0, 56, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (62, 61, 'menu', 0, NULL, '请假单管理', 'layui-icon-date', '../leaveBill/toLeaveBillManager.action', '', 0, 57, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (63, 61, 'menu', 0, NULL, '我的待办任务', 'layui-icon-util', '', '', 0, 58, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (64, 61, 'menu', 0, NULL, '我的审批记录', 'layui-icon-top', '', '', 0, 59, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (68, 8, 'permission', 0, 'loadAllStudent', '学生查询', NULL, '', NULL, NULL, 60, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (69, 8, 'permission', 0, 'addStudent', '学生添加', NULL, '', NULL, NULL, 61, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (70, 8, 'permission', 0, 'updateStudentByStudentId', '学生修改', NULL, '', NULL, NULL, 62, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (71, 8, 'permission', 0, 'student:delete', '学生删除', NULL, '', NULL, NULL, 63, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (72, 8, 'permission', 0, 'deleteStudentByStudentIds', '学生批量删除', NULL, '', NULL, NULL, 64, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (73, 21, 'permission', 0, 'info:view', '日志查询', NULL, NULL, NULL, NULL, 65, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (74, 21, 'permission', 0, 'info:delete', '日志删除', NULL, NULL, NULL, NULL, 66, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (75, 21, 'permission', 0, 'info:batchdelete', '日志批量删除', NULL, NULL, NULL, NULL, 67, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (77, 22, 'permission', 0, 'addDictionary', '字典添加', NULL, '../dictionary/addDictionary.action', NULL, NULL, 69, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (78, 22, 'permission', 0, 'updateByDictionaryReasonId', '字典修改', NULL, '../dictionary/updateByDictionaryReasonId.action', NULL, NULL, 70, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (79, 22, 'permission', 0, 'updateDictionaryStateByReasonId', '字典删除', NULL, '../dictionary/updateDictionaryStateByReasonId.action', NULL, NULL, 71, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (80, 22, 'permission', 0, 'updateDictionaryStateByReasonIds', '字典批量删除', NULL, '../dictionary/updateDictionaryStateByReasonIds.action', NULL, NULL, 72, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (86, 22, 'permission', 0, 'loadParentDictionary', '加载一级字典', NULL, '../dictionary/loadParentDictionary.action', NULL, NULL, 78, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (87, 8, 'jump', 0, '', '跳转添加学生页面', NULL, '../studentManager/addStudent.action', NULL, NULL, 79, 1, NULL, '2021-01-17 15:45:51', NULL);
INSERT INTO `sys_function` VALUES (88, 8, 'jump', 0, 'toUpdateStudent', '跳转修改学生页面', NULL, '../studentManager/updateStudent.action', NULL, NULL, 80, 1, NULL, '2021-01-17 15:47:42', NULL);
INSERT INTO `sys_function` VALUES (89, 8, 'permission', 0, 'loadAllClassComboBox', '加载班级下拉框', NULL, '../class/loadAllClassComboBox.action', NULL, NULL, 81, 1, NULL, '2021-01-18 15:56:55', NULL);
INSERT INTO `sys_function` VALUES (90, 7, 'permission', 0, 'loadAllClass', '加载所有班级', NULL, '../class/loadAllClass.action', NULL, NULL, 82, 1, NULL, '2021-01-18 15:58:02', NULL);
INSERT INTO `sys_function` VALUES (91, 7, 'permission', 0, 'updateClassByClassId', '更新班级', NULL, '../class/updateClassByClassId.action', NULL, NULL, 83, 1, NULL, '2021-01-18 15:58:48', NULL);
INSERT INTO `sys_function` VALUES (92, 7, 'permission', 0, 'updateClassStateByClassId', '删除单个班级', NULL, '../class/updateClassStateByClassId.action', NULL, NULL, 84, 1, NULL, '2021-01-18 15:59:58', NULL);
INSERT INTO `sys_function` VALUES (93, 7, 'permission', 0, 'updateClassStateByClassIds', '删除多个班级', NULL, '../class/updateClassStateByClassIds.action', NULL, NULL, 85, 1, NULL, '2021-01-18 16:00:10', NULL);
INSERT INTO `sys_function` VALUES (94, 7, 'permission', 0, 'loadOneClassByClassId', '查看单个班级', NULL, '../class/loadOneClassByClassId.action', NULL, NULL, 86, 1, NULL, '2021-01-18 16:01:21', NULL);
INSERT INTO `sys_function` VALUES (95, 7, 'permission', 0, 'addClass', '添加单个班级', NULL, '../class/addClass.action', NULL, NULL, 87, 1, NULL, '2021-01-18 16:01:38', NULL);
INSERT INTO `sys_function` VALUES (96, 8, 'permission', 0, 'loadStudentByClassId', '根据班级加载学生', NULL, '', NULL, NULL, 88, 1, NULL, '2021-01-18 16:04:09', NULL);
INSERT INTO `sys_function` VALUES (97, 8, 'permission', 0, 'loadOneStudentByStudentId', '查询单个学生', NULL, '', NULL, NULL, 89, 1, NULL, '2021-01-18 16:05:12', NULL);
INSERT INTO `sys_function` VALUES (98, 8, 'permission', 0, 'loadOneTeacherByClassId', '根据班级查询教师', NULL, '../teacher/loadOneTeacherByClassId.action', NULL, NULL, 90, 1, NULL, '2021-01-19 11:19:26', NULL);
INSERT INTO `sys_function` VALUES (99, 8, 'permission', 0, 'updateStudentStateByStudentIdGoBack', '家长提交申请', NULL, '', NULL, NULL, 91, 1, NULL, '2021-01-19 14:54:34', NULL);
INSERT INTO `sys_function` VALUES (100, 15, 'jump', 0, NULL, '跳转添加菜单', 'layui-icon-read', '../menuManager/addMenu.action', '', 0, 15, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (101, 17, 'jump', 0, '', '跳转资源分配', 'layui-icon-username', '../roleManager/sourceAllot.action', '', 0, 17, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (102, 15, 'permission', 0, 'loadAllMenu', '加载所有菜单', NULL, NULL, NULL, 0, 100, 1, NULL, '2021-01-19 22:08:21', NULL);
INSERT INTO `sys_function` VALUES (103, 15, 'permission', 0, 'queryOneMenu', '查询一个菜单', NULL, NULL, NULL, 0, 101, 1, NULL, '2021-01-19 22:10:20', NULL);
INSERT INTO `sys_function` VALUES (104, 15, 'permission', 0, 'loadTreeFunction', '加载菜单树结构', NULL, NULL, NULL, 0, 102, 1, NULL, '2021-01-19 22:13:00', NULL);
INSERT INTO `sys_function` VALUES (105, 15, 'jump', 0, NULL, '跳转菜单修改', NULL, '../menuManager/updateMenu.action', NULL, NULL, 105, 1, NULL, '2021-01-19 22:14:35', NULL);
INSERT INTO `sys_function` VALUES (106, 15, 'jump', 0, NULL, '跳转菜单修改', '', '../menuManager/updateMenu.action', NULL, 0, 102, 1, '跳转菜单修改', '2021-01-19 22:15:29', 20);
INSERT INTO `sys_function` VALUES (107, 15, 'permission', 0, 'batchDeleteMenu', '批量删除菜单', NULL, NULL, NULL, NULL, 103, 1, NULL, '2021-01-19 22:24:03', NULL);
INSERT INTO `sys_function` VALUES (108, 15, 'permission', 0, 'deleteMenu', '删除一个菜单', NULL, NULL, NULL, NULL, 103, 1, NULL, '2021-01-19 22:24:03', NULL);
INSERT INTO `sys_function` VALUES (109, 17, 'jump', 0, NULL, '跳转角色修改', '', '../roleManager/updateRole.action', NULL, 0, 105, 1, '跳转角色修改', '2021-01-19 22:26:59', 20);
INSERT INTO `sys_function` VALUES (110, 17, 'jump', 0, NULL, '跳转角色添加', '', '../roleManager/addRole.action', NULL, 0, 103, 1, '/roleManager/addRole.action', '2021-01-20 20:30:00', 20);
INSERT INTO `sys_function` VALUES (111, 22, 'permission', 0, 'loadChildByDictionaryParentId', '根据父字典加载子字典', NULL, NULL, NULL, 0, 106, 1, NULL, '2021-01-20 21:28:04', NULL);
INSERT INTO `sys_function` VALUES (112, 9, 'permission', 0, 'loadAllTeacher', '加载所有老师', NULL, NULL, NULL, NULL, 107, 1, NULL, '2021-01-21 20:56:16', NULL);
INSERT INTO `sys_function` VALUES (113, 9, 'jump', 0, NULL, '跳转修改教师', '', '../teacherManager/updateTeacher.action', NULL, 0, 108, 1, '', '2021-01-21 21:26:16', 20);
INSERT INTO `sys_function` VALUES (115, 9, 'permission', 0, 'loadOneTeacherByTeacherId', 'ID查询老师信息', NULL, NULL, NULL, NULL, 109, 1, NULL, '2021-01-21 21:29:18', NULL);
INSERT INTO `sys_function` VALUES (116, 22, 'permission', 0, 'loadChildDictionary', '加载子字典', NULL, NULL, NULL, NULL, 110, 1, NULL, '2021-01-21 21:52:25', NULL);
INSERT INTO `sys_function` VALUES (117, 9, 'jump', 0, NULL, '跳转添加教师', '', '../teacherManager/addTeacher.action', NULL, 0, 109, 1, '跳转添加老师', '2021-01-23 09:03:42', 20);
INSERT INTO `sys_function` VALUES (123, 122, 'menu', 0, NULL, 'cs2', '', 'cs', NULL, 0, 112, 1, 'cs', '2021-01-23 15:28:28', 20);
INSERT INTO `sys_function` VALUES (124, 22, 'permission', 0, 'loadAllDictionary', '加载所有字典', '', '', NULL, 0, 120, 1, '加载所有字典', '2021-01-23 15:41:03', 20);
INSERT INTO `sys_function` VALUES (128, 8, 'permission', 0, 'updateStudentStateByStudentIdAgree', '老师同意', NULL, NULL, NULL, NULL, 95, 1, NULL, '2021-01-23 22:04:12', NULL);
INSERT INTO `sys_function` VALUES (129, 8, 'permission', 0, 'updateStudentStateByStudentIdNotAgree', '老师不同意', NULL, NULL, NULL, NULL, 110, 1, NULL, '2021-01-23 22:04:45', NULL);
INSERT INTO `sys_function` VALUES (130, 7, 'jump', 0, NULL, '跳转添加班级', NULL, '../classManager/addClass.action', NULL, NULL, 120, 1, NULL, '2021-01-24 21:41:39', 1);
INSERT INTO `sys_function` VALUES (131, 7, 'jump', 0, NULL, '跳转修改班级', NULL, '../classManager/updateClass.action', NULL, NULL, 121, 1, NULL, '2021-01-24 21:43:26', NULL);
INSERT INTO `sys_function` VALUES (132, 17, 'jump', 0, NULL, '分配角色', '', '../roleManager/allotRoel.action', NULL, 0, 102, 1, '', '2021-01-27 19:36:59', 20);
INSERT INTO `sys_function` VALUES (133, 17, 'jump', 0, NULL, '跳转添加角色用户', '', '../roleManager/addRoleUser.action', NULL, 0, 108, 1, '', '2021-01-27 19:50:05', 20);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `positionId` int(0) NOT NULL AUTO_INCREMENT COMMENT '职务ID',
  `positionName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职务名称',
  `positionRemarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职务描述',
  `deptId` int(0) DEFAULT NULL COMMENT '职务所属部门',
  PRIMARY KEY (`positionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleId` int(0) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `state` int(0) DEFAULT 1 COMMENT '该角色是否被启用 0为不启用，1为启用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (13, '超级管理员', 1, '', NULL, 1);
INSERT INTO `sys_role` VALUES (15, '家长', 1, NULL, NULL, 1);
INSERT INTO `sys_role` VALUES (16, '老师', 1, NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function`;
CREATE TABLE `sys_role_function`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `roleid` int(0) DEFAULT NULL,
  `functionid` int(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES (146, 15, 1);
INSERT INTO `sys_role_function` VALUES (147, 15, 2);
INSERT INTO `sys_role_function` VALUES (148, 15, 8);
INSERT INTO `sys_role_function` VALUES (149, 15, 68);
INSERT INTO `sys_role_function` VALUES (150, 15, 69);
INSERT INTO `sys_role_function` VALUES (151, 15, 70);
INSERT INTO `sys_role_function` VALUES (152, 15, 71);
INSERT INTO `sys_role_function` VALUES (153, 15, 72);
INSERT INTO `sys_role_function` VALUES (154, 15, 87);
INSERT INTO `sys_role_function` VALUES (155, 15, 88);
INSERT INTO `sys_role_function` VALUES (156, 15, 96);
INSERT INTO `sys_role_function` VALUES (157, 15, 97);
INSERT INTO `sys_role_function` VALUES (158, 15, 99);
INSERT INTO `sys_role_function` VALUES (159, 15, 6);
INSERT INTO `sys_role_function` VALUES (160, 15, 22);
INSERT INTO `sys_role_function` VALUES (161, 15, 77);
INSERT INTO `sys_role_function` VALUES (162, 15, 78);
INSERT INTO `sys_role_function` VALUES (163, 15, 79);
INSERT INTO `sys_role_function` VALUES (164, 15, 80);
INSERT INTO `sys_role_function` VALUES (165, 15, 86);
INSERT INTO `sys_role_function` VALUES (166, 15, 111);
INSERT INTO `sys_role_function` VALUES (167, 15, 116);
INSERT INTO `sys_role_function` VALUES (168, 15, 124);
INSERT INTO `sys_role_function` VALUES (169, 16, 1);
INSERT INTO `sys_role_function` VALUES (170, 16, 2);
INSERT INTO `sys_role_function` VALUES (171, 16, 7);
INSERT INTO `sys_role_function` VALUES (172, 16, 89);
INSERT INTO `sys_role_function` VALUES (173, 16, 90);
INSERT INTO `sys_role_function` VALUES (174, 16, 91);
INSERT INTO `sys_role_function` VALUES (175, 16, 92);
INSERT INTO `sys_role_function` VALUES (176, 16, 93);
INSERT INTO `sys_role_function` VALUES (177, 16, 94);
INSERT INTO `sys_role_function` VALUES (178, 16, 95);
INSERT INTO `sys_role_function` VALUES (179, 16, 130);
INSERT INTO `sys_role_function` VALUES (180, 16, 131);
INSERT INTO `sys_role_function` VALUES (181, 16, 8);
INSERT INTO `sys_role_function` VALUES (182, 16, 68);
INSERT INTO `sys_role_function` VALUES (183, 16, 69);
INSERT INTO `sys_role_function` VALUES (184, 16, 70);
INSERT INTO `sys_role_function` VALUES (185, 16, 71);
INSERT INTO `sys_role_function` VALUES (186, 16, 72);
INSERT INTO `sys_role_function` VALUES (187, 16, 87);
INSERT INTO `sys_role_function` VALUES (188, 16, 88);
INSERT INTO `sys_role_function` VALUES (189, 16, 96);
INSERT INTO `sys_role_function` VALUES (190, 16, 97);
INSERT INTO `sys_role_function` VALUES (192, 16, 128);
INSERT INTO `sys_role_function` VALUES (193, 16, 129);
INSERT INTO `sys_role_function` VALUES (194, 16, 6);
INSERT INTO `sys_role_function` VALUES (195, 16, 22);
INSERT INTO `sys_role_function` VALUES (196, 16, 77);
INSERT INTO `sys_role_function` VALUES (197, 16, 78);
INSERT INTO `sys_role_function` VALUES (198, 16, 79);
INSERT INTO `sys_role_function` VALUES (199, 16, 80);
INSERT INTO `sys_role_function` VALUES (200, 16, 86);
INSERT INTO `sys_role_function` VALUES (201, 16, 111);
INSERT INTO `sys_role_function` VALUES (202, 16, 116);
INSERT INTO `sys_role_function` VALUES (203, 16, 124);
INSERT INTO `sys_role_function` VALUES (212, 15, 89);
INSERT INTO `sys_role_function` VALUES (213, 15, 98);
INSERT INTO `sys_role_function` VALUES (214, 16, 98);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `roleId` int(0) NOT NULL COMMENT '角色ID',
  `userId` int(0) NOT NULL COMMENT '用户ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (13, 20);
INSERT INTO `sys_role_user` VALUES (15, 23);
INSERT INTO `sys_role_user` VALUES (16, 23);
INSERT INTO `sys_role_user` VALUES (15, 24);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userId` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `userMobilePhone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户手机电话',
  `userHomePhone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户家庭电话',
  `userEmail` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `userQQ` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ',
  `userLogName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户登录名',
  `userLogPwd` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户登录密码',
  `userSex` int(0) DEFAULT NULL COMMENT '用户性别 1为先生 2为女士',
  `userFax` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '传真',
  `userAddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '家庭住址',
  `userZipCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮编',
  `userImages` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `userCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证',
  `userSalt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户密码加密',
  `userBirthday` date DEFAULT NULL COMMENT '出生年月',
  `userOrderNum` int(0) DEFAULT NULL COMMENT '排序用',
  `userLastLogTime` datetime(0) DEFAULT NULL COMMENT '用户最后登陆时间',
  `userPosition` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户职位 选择职位时 插入下拉框的TEXT值',
  `userRelation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关系',
  `userProvinceId` int(0) DEFAULT NULL COMMENT '省',
  `userCityId` int(0) DEFAULT NULL COMMENT '市',
  `userCountyId` int(0) DEFAULT NULL COMMENT '县',
  `deptId` int(0) DEFAULT NULL COMMENT '用户所属部门',
  `state` int(0) DEFAULT 1 COMMENT '用户状态 1为可用 2为不可用 3为离职',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `createTime` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '用户入职时间',
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (20, 'admin', '15675287477', NULL, NULL, NULL, 'admin', '1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-19 22:31:54', 1);
INSERT INTO `sys_user` VALUES (23, 'tjh', NULL, NULL, NULL, NULL, 'tjh', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-27 21:16:21', NULL);
INSERT INTO `sys_user` VALUES (24, 'xzw', NULL, NULL, NULL, NULL, 'xzw', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-27 22:10:37', NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacherId` int(0) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacherPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacherBrithday` date DEFAULT NULL,
  `teacherSex` int(0) DEFAULT NULL,
  `classId` int(0) DEFAULT NULL,
  `state` int(0) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (23, 'tjh', '', NULL, 0, 5, NULL, '需要加入班级', '2021-01-27 21:42:23', NULL);

SET FOREIGN_KEY_CHECKS = 1;
