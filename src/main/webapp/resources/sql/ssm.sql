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

 Date: 19/01/2021 01:00:10
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
  `Sate` int(0) DEFAULT NULL COMMENT '1为正常，2为注销',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`classId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (3, '365班', 1, '特色班', '2021-01-18 14:35:08', 1);
INSERT INTO `class` VALUES (4, '18班', 1, '软件版', '2021-01-18 14:35:40', 1);

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
  `classId` int(0) DEFAULT NULL,
  `teacherId` int(0) DEFAULT NULL,
  `userId` int(0) DEFAULT NULL,
  `dictionaryId` int(0) DEFAULT NULL,
  `state` int(0) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (3, '张三', '15675287477', '2021-02-03', '1', 'F:\\studentManager.git\\target\\SSM\\upload\\2021-01-19\\20210119005429103_3074.xls', 1, 1, 1, 2, 1, '1', NULL, 1);

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
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, -1, '泡菜公司', '湖南省长沙市岳麓区望城坡街道咸嘉湖西路馨香雅苑1栋2单元704', '泡菜公司', 1, 1, '15675287477', '', 1, NULL, '2020-12-29', NULL);
INSERT INTO `sys_dept` VALUES (2, -1, '开发部', '湖南长沙', '开发部门', 2, 1, '10086', '', 1, NULL, '2020-12-31', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO `sys_function` VALUES (2, 1, 'menu', 1, NULL, '基础管理', 'layui-icon-util', '', '', 0, 2, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (5, 1, 'menu', 1, NULL, '系统管理', 'layui-icon-set', '', '', 1, 5, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (6, 1, 'menu', 1, NULL, '其它管理', 'layui-icon-next', '', '', 0, 6, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (7, 2, 'menu', 0, NULL, '班级管理', 'layui-icon-user', '../classManager/classManager.action', '', 0, 7, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (8, 2, 'menu', 0, NULL, '学生管理', 'layui-icon-survey', '../studentManager/studentManager.action', '', 0, 8, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (9, 2, 'menu', 0, NULL, '教师管理', 'layui-icon-face-smile', '../teacher/teacherManager.action', '', 0, 9, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (15, 5, 'menu', 0, NULL, '菜单管理', 'layui-icon-read', '../menu/menuManager.action', '', 0, 15, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (16, 5, 'menu', 0, '', '权限管理', 'layui-icon-note', '../permission/permissionManager.action', '', 0, 16, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (17, 5, 'menu', 0, '', '角色管理', 'layui-icon-username', '../roleManager/roleManager.action', '', 0, 17, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (22, 6, 'menu', 0, NULL, '字典管理', 'layui-icon-list', '../dictionaryManager/dictionaryManager.action', NULL, 0, 22, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (34, 15, 'permission', 0, 'menu:create', '添加菜单', '', '', '', 0, 29, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (35, 15, 'permission', 0, 'menu:update', '修改菜单', '', NULL, NULL, 0, 30, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (36, 15, 'permission', 0, 'menu:delete', '删除菜单', '', NULL, NULL, 0, 31, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (37, 15, 'permission', 0, 'menu:batchdelete', '菜单批量删除', '', NULL, NULL, 0, 32, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (38, 16, 'permission', 0, 'permission:create', '添加权限', '', NULL, NULL, 0, 33, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (39, 16, 'permission', 0, 'permission:update', '修改权限', '', NULL, NULL, 0, 34, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (40, 16, 'permission', 0, 'permission:delete', '删除权限', '', NULL, NULL, 0, 35, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (41, 16, 'permission', 0, 'permission:batchdelete', '权限批量删除', '', NULL, NULL, 0, 36, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (42, 17, 'permission', 0, 'role:create', '添加角色', '', NULL, NULL, 0, 37, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (43, 17, 'permission', 0, 'role:update', '修改角色', '', NULL, NULL, 0, 38, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (44, 17, 'permission', 0, 'role:delete', '删除角色', '', NULL, NULL, 0, 39, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (45, 17, 'permission', 0, 'role:batchdelete', '角色批量删除', '', NULL, NULL, 0, 40, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (46, 17, 'permission', 0, 'role:selectPermission', '分配权限', '', NULL, NULL, 0, 41, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (47, 18, 'permission', 0, 'user:create', '添加用户', '', NULL, NULL, 0, 42, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (48, 18, 'permission', 0, 'user:update', '修改用户', '', NULL, NULL, 0, 43, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (49, 18, 'permission', 0, 'user:delete', '删除用户', '', NULL, NULL, 0, 44, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (50, 18, 'permission', 0, 'user:batchdelete', '用户批量删除', '', NULL, NULL, 0, 45, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (51, 18, 'permission', 0, 'user:selectRole', '用户分配角色', '', NULL, NULL, 0, 46, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (52, 18, 'permission', 0, 'user:resetpwd', '重置密码', NULL, NULL, NULL, 0, 47, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (53, 14, 'permission', 0, 'dept:view', '部门查询', NULL, NULL, NULL, 0, 48, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (54, 15, 'permission', 0, 'menu:view', '菜单查询', NULL, NULL, NULL, 0, 49, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (55, 16, 'permission', 0, 'permission:view', '权限查询', NULL, NULL, NULL, 0, 50, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (56, 17, 'permission', 0, 'role:view', '角色查询', NULL, NULL, NULL, 0, 51, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (57, 18, 'permission', 0, 'user:view', '用户查询', NULL, NULL, NULL, 0, 52, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (61, 1, 'menu', 1, NULL, '审批管理', 'layui-icon-edit', '', '', 0, 56, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (62, 61, 'menu', 0, NULL, '请假单管理', 'layui-icon-date', '../leaveBill/toLeaveBillManager.action', '', 0, 57, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (63, 61, 'menu', 0, NULL, '我的待办任务', 'layui-icon-util', '', '', 0, 58, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (64, 61, 'menu', 0, NULL, '我的审批记录', 'layui-icon-top', '', '', 0, 59, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (68, 8, 'permission', 0, 'loadAllStudent', '学生查询', NULL, '../student/loadAllStudent.action', NULL, NULL, 60, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (69, 8, 'permission', 0, 'addStudent', '学生添加', NULL, '../student/addStudent.action', NULL, NULL, 61, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (70, 8, 'permission', 0, 'updateStudentByStudentId', '学生修改', NULL, '../student/updateStudentByStudentId.action', NULL, NULL, 62, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (71, 8, 'permission', 0, 'student:delete', '学生删除', NULL, '../student/loadAllStudent.action', NULL, NULL, 63, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (72, 8, 'permission', 0, 'student:batchdelete', '学生批量删除', NULL, '../student/loadAllStudent.action', NULL, NULL, 64, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (73, 21, 'permission', 0, 'info:view', '日志查询', NULL, NULL, NULL, NULL, 65, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (74, 21, 'permission', 0, 'info:delete', '日志删除', NULL, NULL, NULL, NULL, 66, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (75, 21, 'permission', 0, 'info:batchdelete', '日志批量删除', NULL, NULL, NULL, NULL, 67, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (76, 22, 'permission', 0, 'notice:view', '公告查询', NULL, NULL, NULL, NULL, 68, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (77, 22, 'permission', 0, 'addDictionary', '字典添加', NULL, '../dictionary/addDictionary.action', NULL, NULL, 69, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (78, 22, 'permission', 0, 'updateByDictionaryReasonId', '字典修改', NULL, '../dictionary/updateByDictionaryReasonId.action', NULL, NULL, 70, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (79, 22, 'permission', 0, 'updateDictionaryStateByReasonId', '字典删除', NULL, '../dictionary/updateDictionaryStateByReasonId.action', NULL, NULL, 71, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (80, 22, 'permission', 0, 'updateDictionaryStateByReasonIds', '字典批量删除', NULL, '../dictionary/updateDictionaryStateByReasonIds.action', NULL, NULL, 72, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (86, 22, 'permission', 0, 'loadParentDictionary', '加载一级字典', NULL, '../dictionary/loadParentDictionary.action', NULL, NULL, 78, 1, NULL, NULL, NULL);
INSERT INTO `sys_function` VALUES (87, 99999, 'menu', 0, 'toAddStudent', '跳转添加学生页面', NULL, '../studentManager/addStudent.action', NULL, NULL, NULL, 1, NULL, '2021-01-17 15:45:51', NULL);
INSERT INTO `sys_function` VALUES (88, 99999, 'menu', 0, 'toUpdateStudent', '跳转修改学生页面', NULL, '../studentManager/updateStudent.action', NULL, NULL, NULL, 1, NULL, '2021-01-17 15:47:42', NULL);
INSERT INTO `sys_function` VALUES (89, 7, 'permission', 0, 'loadAllClassComboBox', '加载班级下拉框', NULL, '../class/loadAllClassComboBox.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 15:56:55', NULL);
INSERT INTO `sys_function` VALUES (90, 7, 'permission', 0, 'loadAllClass', '加载所有班级', NULL, '../class/loadAllClass.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 15:58:02', NULL);
INSERT INTO `sys_function` VALUES (91, 7, 'permission', 0, 'updateClassByClassId', '更新班级', NULL, '../class/updateClassByClassId.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 15:58:48', NULL);
INSERT INTO `sys_function` VALUES (92, 7, 'permission', 0, 'updateClassStateByClassId', '删除单个班级', NULL, '../class/updateClassStateByClassId.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 15:59:58', NULL);
INSERT INTO `sys_function` VALUES (93, 7, 'permission', 0, 'updateClassStateByClassIds', '删除多个班级', NULL, '../class/updateClassStateByClassIds.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 16:00:10', NULL);
INSERT INTO `sys_function` VALUES (94, 7, 'permission', 0, 'loadOneClassByClassId', '查看单个班级', NULL, '../class/loadOneClassByClassId.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 16:01:21', NULL);
INSERT INTO `sys_function` VALUES (95, 7, 'permission', 0, 'addClass', '添加单个班级', NULL, '../class/addClass.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 16:01:38', NULL);
INSERT INTO `sys_function` VALUES (96, 8, 'permission', 0, 'loadStudentByClassId', '根据班级加载学生', NULL, '../student/loadStudentByClassId.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 16:04:09', NULL);
INSERT INTO `sys_function` VALUES (97, 8, 'permission', 0, 'loadOneStudentByStudentId', '查询单个学生', NULL, '../student/loadOneStudentByStudentId.action', NULL, NULL, NULL, 1, NULL, '2021-01-18 16:05:12', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES (7, 15, 2);
INSERT INTO `sys_role_function` VALUES (8, 15, 8);
INSERT INTO `sys_role_function` VALUES (9, 15, 68);
INSERT INTO `sys_role_function` VALUES (10, 15, 69);
INSERT INTO `sys_role_function` VALUES (11, 15, 70);
INSERT INTO `sys_role_function` VALUES (12, 15, 71);
INSERT INTO `sys_role_function` VALUES (13, 15, 72);
INSERT INTO `sys_role_function` VALUES (14, 15, 87);
INSERT INTO `sys_role_function` VALUES (15, 15, 88);
INSERT INTO `sys_role_function` VALUES (16, 15, 86);
INSERT INTO `sys_role_function` VALUES (17, 15, 90);

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
INSERT INTO `sys_role_user` VALUES (15, 1);
INSERT INTO `sys_role_user` VALUES (15, 18);
INSERT INTO `sys_role_user` VALUES (15, 19);

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '家长', '15675287477', NULL, '1902907167@qq.com', NULL, 'tjh', '1', 1, NULL, NULL, NULL, NULL, '430321199811204517', '123456', NULL, NULL, NULL, '1', NULL, 1, 1, 1, 1, 1, 'tjh', '2021-01-05 20:23:32', NULL);
INSERT INTO `sys_user` VALUES (2, '熊志伟', '13873335777', NULL, NULL, NULL, 'xzw', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacherId` int(0) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacherPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `teacherBrithday` time(0) DEFAULT NULL,
  `teacherSex` int(0) DEFAULT NULL,
  `state` int(0) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci DEFAULT NULL,
  `createTime` datetime(0) DEFAULT NULL,
  `createPerson` int(0) DEFAULT NULL,
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
