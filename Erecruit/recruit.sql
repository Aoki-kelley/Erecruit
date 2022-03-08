/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50735
Source Host           : localhost:3306
Source Database       : recruit

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2022-03-08 09:33:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user', '7', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user', '7', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user', '7', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can view user', '7', 'view_user');
INSERT INTO `auth_permission` VALUES ('29', 'Can add verification code', '8', 'add_verificationcode');
INSERT INTO `auth_permission` VALUES ('30', 'Can change verification code', '8', 'change_verificationcode');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete verification code', '8', 'delete_verificationcode');
INSERT INTO `auth_permission` VALUES ('32', 'Can view verification code', '8', 'view_verificationcode');
INSERT INTO `auth_permission` VALUES ('33', 'Can add wish', '9', 'add_wish');
INSERT INTO `auth_permission` VALUES ('34', 'Can change wish', '9', 'change_wish');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete wish', '9', 'delete_wish');
INSERT INTO `auth_permission` VALUES ('36', 'Can view wish', '9', 'view_wish');
INSERT INTO `auth_permission` VALUES ('37', 'Can add resume', '10', 'add_resume');
INSERT INTO `auth_permission` VALUES ('38', 'Can change resume', '10', 'change_resume');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete resume', '10', 'delete_resume');
INSERT INTO `auth_permission` VALUES ('40', 'Can view resume', '10', 'view_resume');
INSERT INTO `auth_permission` VALUES ('41', 'Can add record', '11', 'add_record');
INSERT INTO `auth_permission` VALUES ('42', 'Can change record', '11', 'change_record');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete record', '11', 'delete_record');
INSERT INTO `auth_permission` VALUES ('44', 'Can view record', '11', 'view_record');
INSERT INTO `auth_permission` VALUES ('45', 'Can add company', '12', 'add_company');
INSERT INTO `auth_permission` VALUES ('46', 'Can change company', '12', 'change_company');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete company', '12', 'delete_company');
INSERT INTO `auth_permission` VALUES ('48', 'Can view company', '12', 'view_company');
INSERT INTO `auth_permission` VALUES ('49', 'Can add education', '13', 'add_education');
INSERT INTO `auth_permission` VALUES ('50', 'Can change education', '13', 'change_education');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete education', '13', 'delete_education');
INSERT INTO `auth_permission` VALUES ('52', 'Can view education', '13', 'view_education');
INSERT INTO `auth_permission` VALUES ('53', 'Can add industry', '14', 'add_industry');
INSERT INTO `auth_permission` VALUES ('54', 'Can change industry', '14', 'change_industry');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete industry', '14', 'delete_industry');
INSERT INTO `auth_permission` VALUES ('56', 'Can view industry', '14', 'view_industry');
INSERT INTO `auth_permission` VALUES ('57', 'Can add profession', '15', 'add_profession');
INSERT INTO `auth_permission` VALUES ('58', 'Can change profession', '15', 'change_profession');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete profession', '15', 'delete_profession');
INSERT INTO `auth_permission` VALUES ('60', 'Can view profession', '15', 'view_profession');
INSERT INTO `auth_permission` VALUES ('61', 'Can add comment', '16', 'add_comment');
INSERT INTO `auth_permission` VALUES ('62', 'Can change comment', '16', 'change_comment');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete comment', '16', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('64', 'Can view comment', '16', 'view_comment');
INSERT INTO `auth_permission` VALUES ('65', 'Can add profession', '17', 'add_profession');
INSERT INTO `auth_permission` VALUES ('66', 'Can change profession', '17', 'change_profession');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete profession', '17', 'delete_profession');
INSERT INTO `auth_permission` VALUES ('68', 'Can view profession', '17', 'view_profession');
INSERT INTO `auth_permission` VALUES ('69', 'Can add work', '18', 'add_work');
INSERT INTO `auth_permission` VALUES ('70', 'Can change work', '18', 'change_work');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete work', '18', 'delete_work');
INSERT INTO `auth_permission` VALUES ('72', 'Can view work', '18', 'view_work');
INSERT INTO `auth_permission` VALUES ('73', 'Can add crontab', '19', 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES ('74', 'Can change crontab', '19', 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete crontab', '19', 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES ('76', 'Can view crontab', '19', 'view_crontabschedule');
INSERT INTO `auth_permission` VALUES ('77', 'Can add interval', '20', 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES ('78', 'Can change interval', '20', 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete interval', '20', 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES ('80', 'Can view interval', '20', 'view_intervalschedule');
INSERT INTO `auth_permission` VALUES ('81', 'Can add periodic task', '21', 'add_periodictask');
INSERT INTO `auth_permission` VALUES ('82', 'Can change periodic task', '21', 'change_periodictask');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete periodic task', '21', 'delete_periodictask');
INSERT INTO `auth_permission` VALUES ('84', 'Can view periodic task', '21', 'view_periodictask');
INSERT INTO `auth_permission` VALUES ('85', 'Can add periodic tasks', '22', 'add_periodictasks');
INSERT INTO `auth_permission` VALUES ('86', 'Can change periodic tasks', '22', 'change_periodictasks');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete periodic tasks', '22', 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES ('88', 'Can view periodic tasks', '22', 'view_periodictasks');
INSERT INTO `auth_permission` VALUES ('89', 'Can add task state', '23', 'add_taskmeta');
INSERT INTO `auth_permission` VALUES ('90', 'Can change task state', '23', 'change_taskmeta');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete task state', '23', 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES ('92', 'Can view task state', '23', 'view_taskmeta');
INSERT INTO `auth_permission` VALUES ('93', 'Can add saved group result', '24', 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('94', 'Can change saved group result', '24', 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete saved group result', '24', 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('96', 'Can view saved group result', '24', 'view_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('97', 'Can add task', '25', 'add_taskstate');
INSERT INTO `auth_permission` VALUES ('98', 'Can change task', '25', 'change_taskstate');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete task', '25', 'delete_taskstate');
INSERT INTO `auth_permission` VALUES ('100', 'Can view task', '25', 'view_taskstate');
INSERT INTO `auth_permission` VALUES ('101', 'Can add worker', '26', 'add_workerstate');
INSERT INTO `auth_permission` VALUES ('102', 'Can change worker', '26', 'change_workerstate');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete worker', '26', 'delete_workerstate');
INSERT INTO `auth_permission` VALUES ('104', 'Can view worker', '26', 'view_workerstate');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for celery_taskmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_hidden_23fd02dc` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of celery_taskmeta
-- ----------------------------

-- ----------------------------
-- Table structure for celery_tasksetmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_hidden_593cfc24` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of celery_tasksetmeta
-- ----------------------------

-- ----------------------------
-- Table structure for comment_comment
-- ----------------------------
DROP TABLE IF EXISTS `comment_comment`;
CREATE TABLE `comment_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `detail` varchar(150) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_user_id_6078e57b_fk_user_user_id` (`user_id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comment_comment
-- ----------------------------

-- ----------------------------
-- Table structure for company_company
-- ----------------------------
DROP TABLE IF EXISTS `company_company`;
CREATE TABLE `company_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `detail` varchar(5000) DEFAULT NULL,
  `applicant` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_company
-- ----------------------------
INSERT INTO `company_company` VALUES ('51', '尚德机构', '学习是一种信仰!', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('52', '薯片科技', '一站式企业服务平台，薯片集团员工6000余人，18大业态，为各大企业提供600多种服务项目。', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('53', '环球易购', '成为跨境B2C电子商务模式的领航者', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('54', '微盟', '人性化的管理， 年轻充满活力的团队， 广阔的发展前景', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('55', '金证股份', '深圳市金证科技股份有限公司成立于1998年，2003年12月24日公司股票在上海证券交易所挂牌上市。', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('56', '知网', '知识成就未来。', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('57', '天鹅到家', '让家更美好', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('58', '安硕信息（amarsoft）', '中国领先的金融资产风险管理整体解决方案提供商', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('59', '乐融集团', '互联网电视开拓者，运营家庭美好生活', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('60', '明源云', '地产生态链互联网+服务领航者', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('61', '新浪网', '知名互联网公司', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('62', '东方国信', '让数据改变工作与生活', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('63', '自如网', '加入自如，让世界变得不一样~', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('65', '美菜', '中国餐饮供应链杰出服务商', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('67', '腾讯', '用户为本，科技向善', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('69', '小米集团', '有些工作只是工作，有些工作却是你人生的使命， 那些工作会让你满怀热情、全心投入你的智慧和才能。', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('70', '网易', '以匠心，致创新', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('71', 'Shopee', '领航电商平台', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('72', '百度', '用科技让复杂的世界更简单', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('73', '北京麦田', '10000名专业经纪人的大规模集团型企业，麦田一直力争缔造卓越的房产服务组织。', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('74', '滴滴', '公司管理扁平化，技术氛围特别融洽', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('75', '北京京东世纪贸易有限公司', '科技引领生活！成为全球最值得信赖的企业！', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('76', '哔哩哔哩', 'bilibili中国年轻人聚集的文化社区', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('77', '拉勾集团', '专注互联网职业机会', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('78', '商汤科技', '专注于计算机视觉和深度学习原创技术', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('79', '贝壳', '用你的潜能，驱动“住”的无限可能', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('80', '360', '我们的核心价值观：用户至上、持续创新、当责奋斗、开放协作、不断反思、诚信正直', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');
INSERT INTO `company_company` VALUES ('81', '微博', '微博是人们在线创作、分享和发现内容的中国领先社交媒体平台。', '0', 'RVJ4{7(3T{4`SQ5J90LX2JY.bmp');

-- ----------------------------
-- Table structure for company_profession
-- ----------------------------
DROP TABLE IF EXISTS `company_profession`;
CREATE TABLE `company_profession` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `salary` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `application` int(11) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `education_id` bigint(20) NOT NULL,
  `industry_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_profession_company_id_686c09ef_fk_company_company_id` (`company_id`),
  KEY `company_profession_education_id_67077b30_fk_industry_` (`education_id`),
  KEY `company_profession_industry_id_5c76744c_fk_industry_industry_id` (`industry_id`),
  CONSTRAINT `company_profession_company_id_686c09ef_fk_company_company_id` FOREIGN KEY (`company_id`) REFERENCES `company_company` (`id`),
  CONSTRAINT `company_profession_education_id_67077b30_fk_industry_` FOREIGN KEY (`education_id`) REFERENCES `industry_education` (`id`),
  CONSTRAINT `company_profession_industry_id_5c76744c_fk_industry_industry_id` FOREIGN KEY (`industry_id`) REFERENCES `industry_industry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_profession
-- ----------------------------
INSERT INTO `company_profession` VALUES ('1', '16000', 'Java', '0', '59', '4', '1');
INSERT INTO `company_profession` VALUES ('2', '27000', 'Java', '0', '59', '3', '1');
INSERT INTO `company_profession` VALUES ('3', '3000', 'Java', '0', '80', '6', '1');
INSERT INTO `company_profession` VALUES ('4', '46000', 'Java', '0', '78', '4', '1');
INSERT INTO `company_profession` VALUES ('5', '13000', 'Java', '0', '62', '6', '1');
INSERT INTO `company_profession` VALUES ('6', '17000', 'Java', '0', '79', '6', '1');
INSERT INTO `company_profession` VALUES ('7', '5000', 'Java', '0', '52', '2', '1');
INSERT INTO `company_profession` VALUES ('8', '30000', 'Java', '0', '67', '6', '1');
INSERT INTO `company_profession` VALUES ('9', '7000', 'Java', '0', '61', '6', '1');
INSERT INTO `company_profession` VALUES ('10', '41000', 'Java', '0', '51', '6', '1');
INSERT INTO `company_profession` VALUES ('11', '8000', 'Java', '0', '65', '7', '1');
INSERT INTO `company_profession` VALUES ('12', '14000', 'Java', '0', '54', '5', '1');
INSERT INTO `company_profession` VALUES ('13', '24000', 'Java', '0', '78', '6', '1');
INSERT INTO `company_profession` VALUES ('14', '29000', 'Java', '0', '53', '1', '1');
INSERT INTO `company_profession` VALUES ('15', '5000', 'Java', '0', '51', '7', '1');
INSERT INTO `company_profession` VALUES ('16', '17000', 'Java', '0', '75', '7', '1');
INSERT INTO `company_profession` VALUES ('17', '46000', 'Java', '0', '78', '6', '1');
INSERT INTO `company_profession` VALUES ('18', '22000', 'PHP', '0', '73', '2', '1');
INSERT INTO `company_profession` VALUES ('19', '12000', 'PHP', '0', '74', '4', '1');
INSERT INTO `company_profession` VALUES ('20', '22000', 'PHP', '0', '65', '2', '1');
INSERT INTO `company_profession` VALUES ('21', '39000', 'PHP', '0', '77', '2', '1');
INSERT INTO `company_profession` VALUES ('22', '31000', 'PHP', '0', '67', '1', '1');
INSERT INTO `company_profession` VALUES ('23', '34000', 'PHP', '0', '72', '1', '1');
INSERT INTO `company_profession` VALUES ('24', '7000', 'PHP', '0', '71', '6', '1');
INSERT INTO `company_profession` VALUES ('25', '12000', 'C++', '0', '80', '5', '1');
INSERT INTO `company_profession` VALUES ('26', '49000', 'C++', '0', '70', '5', '1');
INSERT INTO `company_profession` VALUES ('27', '19000', 'C++', '0', '56', '1', '1');
INSERT INTO `company_profession` VALUES ('28', '11000', 'C++', '0', '80', '4', '1');
INSERT INTO `company_profession` VALUES ('29', '23000', 'C++', '0', '75', '2', '1');
INSERT INTO `company_profession` VALUES ('30', '24000', 'C++', '0', '78', '2', '1');
INSERT INTO `company_profession` VALUES ('31', '46000', 'C++', '0', '52', '1', '1');
INSERT INTO `company_profession` VALUES ('32', '31000', 'C++', '0', '73', '6', '1');
INSERT INTO `company_profession` VALUES ('33', '14000', 'C++', '0', '61', '4', '1');
INSERT INTO `company_profession` VALUES ('34', '38000', 'C++', '0', '59', '5', '1');
INSERT INTO `company_profession` VALUES ('35', '9000', 'C++', '0', '74', '6', '1');
INSERT INTO `company_profession` VALUES ('36', '9000', 'C++', '0', '75', '1', '1');
INSERT INTO `company_profession` VALUES ('37', '4000', 'C++', '0', '56', '5', '1');
INSERT INTO `company_profession` VALUES ('38', '24000', 'C++', '0', '59', '4', '1');
INSERT INTO `company_profession` VALUES ('39', '8000', 'C++', '0', '67', '1', '1');
INSERT INTO `company_profession` VALUES ('40', '41000', 'C++', '0', '53', '5', '1');
INSERT INTO `company_profession` VALUES ('41', '45000', 'C++', '0', '67', '5', '1');
INSERT INTO `company_profession` VALUES ('42', '41000', 'Java', '0', '77', '3', '1');
INSERT INTO `company_profession` VALUES ('43', '29000', 'Java', '0', '75', '7', '1');
INSERT INTO `company_profession` VALUES ('44', '25000', 'Java', '0', '61', '3', '1');
INSERT INTO `company_profession` VALUES ('45', '40000', 'Java', '0', '76', '2', '1');
INSERT INTO `company_profession` VALUES ('46', '9000', 'Java', '0', '67', '7', '1');
INSERT INTO `company_profession` VALUES ('47', '7000', 'Java', '0', '57', '6', '1');
INSERT INTO `company_profession` VALUES ('48', '31000', 'Java', '0', '65', '2', '1');
INSERT INTO `company_profession` VALUES ('49', '10000', 'Java', '0', '78', '4', '1');
INSERT INTO `company_profession` VALUES ('50', '17000', 'Java', '0', '72', '1', '1');
INSERT INTO `company_profession` VALUES ('51', '15000', 'Java', '0', '78', '1', '1');
INSERT INTO `company_profession` VALUES ('52', '5000', 'Java', '0', '80', '7', '1');
INSERT INTO `company_profession` VALUES ('53', '36000', 'PHP', '0', '60', '4', '1');
INSERT INTO `company_profession` VALUES ('54', '28000', 'PHP', '0', '63', '5', '1');
INSERT INTO `company_profession` VALUES ('55', '16000', 'PHP', '0', '58', '2', '1');
INSERT INTO `company_profession` VALUES ('56', '32000', 'PHP', '0', '52', '2', '1');
INSERT INTO `company_profession` VALUES ('57', '9000', 'PHP', '0', '73', '4', '1');
INSERT INTO `company_profession` VALUES ('58', '22000', 'PHP', '0', '57', '3', '1');
INSERT INTO `company_profession` VALUES ('59', '48000', 'PHP', '0', '72', '1', '1');
INSERT INTO `company_profession` VALUES ('60', '42000', 'PHP', '0', '52', '3', '1');
INSERT INTO `company_profession` VALUES ('61', '26000', 'PHP', '0', '72', '4', '1');
INSERT INTO `company_profession` VALUES ('62', '12000', 'PHP', '0', '63', '1', '1');
INSERT INTO `company_profession` VALUES ('63', '4000', 'PHP', '0', '73', '5', '1');
INSERT INTO `company_profession` VALUES ('64', '30000', 'PHP', '0', '79', '5', '1');
INSERT INTO `company_profession` VALUES ('65', '28000', 'PHP', '0', '70', '7', '1');
INSERT INTO `company_profession` VALUES ('66', '23000', 'PHP', '0', '57', '1', '1');
INSERT INTO `company_profession` VALUES ('67', '19000', 'C++', '0', '55', '5', '1');
INSERT INTO `company_profession` VALUES ('68', '43000', 'C++', '0', '54', '6', '1');
INSERT INTO `company_profession` VALUES ('69', '36000', 'C++', '0', '63', '4', '1');
INSERT INTO `company_profession` VALUES ('70', '21000', 'C++', '0', '65', '1', '1');
INSERT INTO `company_profession` VALUES ('71', '13000', 'C++', '0', '58', '1', '1');
INSERT INTO `company_profession` VALUES ('72', '32000', 'C++', '0', '70', '2', '1');
INSERT INTO `company_profession` VALUES ('73', '13000', 'C++', '0', '74', '3', '1');
INSERT INTO `company_profession` VALUES ('74', '35000', 'C++', '0', '62', '3', '1');
INSERT INTO `company_profession` VALUES ('75', '12000', 'C++', '0', '65', '5', '1');
INSERT INTO `company_profession` VALUES ('76', '40000', 'C++', '0', '79', '5', '1');
INSERT INTO `company_profession` VALUES ('77', '41000', 'C++', '0', '55', '7', '1');
INSERT INTO `company_profession` VALUES ('78', '10000', 'C++', '0', '71', '7', '1');
INSERT INTO `company_profession` VALUES ('79', '46000', 'C++', '0', '81', '5', '1');
INSERT INTO `company_profession` VALUES ('80', '50000', 'C++', '0', '70', '5', '1');
INSERT INTO `company_profession` VALUES ('81', '44000', 'C++', '0', '77', '2', '1');
INSERT INTO `company_profession` VALUES ('82', '9000', 'C++', '0', '72', '2', '1');
INSERT INTO `company_profession` VALUES ('83', '50000', '区块链', '0', '52', '5', '1');
INSERT INTO `company_profession` VALUES ('84', '27000', '区块链', '0', '77', '4', '1');
INSERT INTO `company_profession` VALUES ('85', '32000', '区块链', '0', '71', '4', '1');
INSERT INTO `company_profession` VALUES ('86', '26000', '区块链', '0', '78', '5', '1');
INSERT INTO `company_profession` VALUES ('87', '19000', '区块链', '0', '57', '1', '1');
INSERT INTO `company_profession` VALUES ('88', '4000', '区块链', '0', '81', '3', '1');
INSERT INTO `company_profession` VALUES ('89', '17000', '区块链', '0', '54', '7', '1');
INSERT INTO `company_profession` VALUES ('90', '2000', '区块链', '0', '80', '3', '1');
INSERT INTO `company_profession` VALUES ('91', '40000', '区块链', '0', '69', '3', '1');
INSERT INTO `company_profession` VALUES ('92', '39000', '区块链', '0', '77', '1', '1');
INSERT INTO `company_profession` VALUES ('93', '18000', '区块链', '0', '71', '2', '1');
INSERT INTO `company_profession` VALUES ('94', '22000', '区块链', '0', '54', '6', '1');
INSERT INTO `company_profession` VALUES ('95', '5000', '区块链', '0', '70', '2', '1');
INSERT INTO `company_profession` VALUES ('96', '37000', '区块链', '0', '57', '7', '1');
INSERT INTO `company_profession` VALUES ('97', '38000', '区块链', '0', '73', '7', '1');
INSERT INTO `company_profession` VALUES ('98', '7000', '区块链', '0', '54', '3', '1');
INSERT INTO `company_profession` VALUES ('99', '28000', '区块链', '0', '61', '2', '1');
INSERT INTO `company_profession` VALUES ('100', '20000', 'Android iOS', '0', '73', '3', '1');
INSERT INTO `company_profession` VALUES ('101', '12000', 'Android iOS', '0', '69', '6', '1');
INSERT INTO `company_profession` VALUES ('102', '22000', 'Android iOS', '0', '60', '2', '1');
INSERT INTO `company_profession` VALUES ('103', '12000', 'Android iOS', '0', '76', '3', '1');
INSERT INTO `company_profession` VALUES ('104', '46000', 'Android iOS', '0', '80', '3', '1');
INSERT INTO `company_profession` VALUES ('105', '6000', 'Android iOS', '0', '55', '2', '1');
INSERT INTO `company_profession` VALUES ('106', '48000', 'Android iOS', '0', '56', '1', '1');
INSERT INTO `company_profession` VALUES ('107', '31000', 'Android iOS', '0', '67', '3', '1');
INSERT INTO `company_profession` VALUES ('108', '33000', 'Android iOS', '0', '55', '7', '1');
INSERT INTO `company_profession` VALUES ('109', '14000', 'Android iOS', '0', '63', '7', '1');
INSERT INTO `company_profession` VALUES ('110', '12000', 'Android iOS', '0', '65', '2', '1');
INSERT INTO `company_profession` VALUES ('111', '40000', 'Android iOS', '0', '52', '7', '1');
INSERT INTO `company_profession` VALUES ('112', '50000', '数据挖掘', '0', '57', '1', '1');
INSERT INTO `company_profession` VALUES ('113', '27000', '数据挖掘', '0', '63', '7', '1');
INSERT INTO `company_profession` VALUES ('114', '13000', '数据挖掘', '0', '53', '6', '1');
INSERT INTO `company_profession` VALUES ('115', '38000', '数据挖掘', '0', '52', '1', '1');
INSERT INTO `company_profession` VALUES ('116', '27000', '数据挖掘', '0', '70', '4', '1');
INSERT INTO `company_profession` VALUES ('117', '10000', '数据挖掘', '0', '54', '7', '1');
INSERT INTO `company_profession` VALUES ('118', '26000', '数据挖掘', '0', '60', '4', '1');
INSERT INTO `company_profession` VALUES ('119', '3000', '数据挖掘', '0', '58', '4', '1');
INSERT INTO `company_profession` VALUES ('120', '19000', '数据挖掘', '0', '60', '1', '1');
INSERT INTO `company_profession` VALUES ('121', '21000', '数据挖掘', '0', '57', '4', '1');
INSERT INTO `company_profession` VALUES ('122', '13000', '数据挖掘', '0', '54', '7', '1');
INSERT INTO `company_profession` VALUES ('123', '10000', '数据挖掘', '0', '72', '2', '1');
INSERT INTO `company_profession` VALUES ('124', '34000', '数据挖掘', '0', '77', '7', '1');
INSERT INTO `company_profession` VALUES ('125', '34000', '数据挖掘', '0', '79', '5', '1');
INSERT INTO `company_profession` VALUES ('126', '36000', '数据挖掘', '0', '65', '3', '1');
INSERT INTO `company_profession` VALUES ('127', '2000', '数据挖掘', '0', '67', '3', '1');
INSERT INTO `company_profession` VALUES ('128', '15000', '数据挖掘', '0', '62', '2', '1');
INSERT INTO `company_profession` VALUES ('129', '21000', '数据挖掘', '0', '54', '2', '1');
INSERT INTO `company_profession` VALUES ('130', '44000', '深度学习', '0', '77', '4', '1');
INSERT INTO `company_profession` VALUES ('131', '7000', '深度学习', '0', '71', '5', '1');
INSERT INTO `company_profession` VALUES ('132', '5000', '深度学习', '0', '54', '5', '1');
INSERT INTO `company_profession` VALUES ('133', '22000', '深度学习', '0', '79', '6', '1');
INSERT INTO `company_profession` VALUES ('134', '4000', '深度学习', '0', '71', '3', '1');
INSERT INTO `company_profession` VALUES ('135', '4000', '深度学习', '0', '79', '7', '1');
INSERT INTO `company_profession` VALUES ('136', '50000', '深度学习', '0', '58', '7', '1');
INSERT INTO `company_profession` VALUES ('137', '33000', '深度学习', '0', '55', '7', '1');
INSERT INTO `company_profession` VALUES ('138', '47000', '深度学习', '0', '53', '2', '1');
INSERT INTO `company_profession` VALUES ('139', '40000', '深度学习', '0', '60', '3', '1');
INSERT INTO `company_profession` VALUES ('140', '15000', '深度学习', '0', '80', '7', '1');
INSERT INTO `company_profession` VALUES ('141', '49000', '深度学习', '0', '75', '4', '1');
INSERT INTO `company_profession` VALUES ('142', '2000', '深度学习', '0', '60', '4', '1');
INSERT INTO `company_profession` VALUES ('143', '33000', '深度学习', '0', '79', '6', '1');
INSERT INTO `company_profession` VALUES ('144', '11000', '深度学习', '0', '75', '7', '1');
INSERT INTO `company_profession` VALUES ('145', '37000', '自然语言处理', '0', '61', '4', '1');
INSERT INTO `company_profession` VALUES ('146', '45000', '自然语言处理', '0', '81', '7', '1');
INSERT INTO `company_profession` VALUES ('147', '15000', '自然语言处理', '0', '63', '3', '1');
INSERT INTO `company_profession` VALUES ('148', '12000', '自然语言处理', '0', '78', '3', '1');
INSERT INTO `company_profession` VALUES ('149', '13000', '自然语言处理', '0', '73', '7', '1');
INSERT INTO `company_profession` VALUES ('150', '31000', '自然语言处理', '0', '58', '2', '1');
INSERT INTO `company_profession` VALUES ('151', '6000', '自然语言处理', '0', '58', '6', '1');
INSERT INTO `company_profession` VALUES ('152', '31000', '自然语言处理', '0', '63', '6', '1');
INSERT INTO `company_profession` VALUES ('153', '9000', '自然语言处理', '0', '67', '1', '1');
INSERT INTO `company_profession` VALUES ('154', '26000', '自然语言处理', '0', '56', '5', '1');
INSERT INTO `company_profession` VALUES ('155', '11000', '自然语言处理', '0', '54', '4', '1');
INSERT INTO `company_profession` VALUES ('156', '7000', '自然语言处理', '0', '81', '6', '1');
INSERT INTO `company_profession` VALUES ('157', '20000', '自然语言处理', '0', '63', '5', '1');
INSERT INTO `company_profession` VALUES ('158', '10000', '自然语言处理', '0', '78', '7', '1');
INSERT INTO `company_profession` VALUES ('159', '36000', '自然语言处理', '0', '75', '2', '1');
INSERT INTO `company_profession` VALUES ('160', '39000', '自然语言处理', '0', '60', '1', '1');
INSERT INTO `company_profession` VALUES ('161', '17000', '自然语言处理', '0', '62', '6', '1');
INSERT INTO `company_profession` VALUES ('162', '14000', '机器学习', '0', '55', '7', '1');
INSERT INTO `company_profession` VALUES ('163', '29000', '机器学习', '0', '59', '2', '1');
INSERT INTO `company_profession` VALUES ('164', '26000', '机器学习', '0', '69', '6', '1');
INSERT INTO `company_profession` VALUES ('165', '27000', '机器学习', '0', '65', '5', '1');
INSERT INTO `company_profession` VALUES ('166', '4000', '机器学习', '0', '65', '3', '1');
INSERT INTO `company_profession` VALUES ('167', '30000', '机器学习', '0', '63', '1', '1');
INSERT INTO `company_profession` VALUES ('168', '6000', '机器学习', '0', '75', '4', '1');
INSERT INTO `company_profession` VALUES ('169', '33000', '机器学习', '0', '65', '4', '1');
INSERT INTO `company_profession` VALUES ('170', '22000', '机器学习', '0', '81', '3', '1');
INSERT INTO `company_profession` VALUES ('171', '44000', '机器学习', '0', '74', '5', '1');
INSERT INTO `company_profession` VALUES ('172', '38000', '机器学习', '0', '58', '6', '1');
INSERT INTO `company_profession` VALUES ('173', '4000', '机器学习', '0', '60', '7', '1');
INSERT INTO `company_profession` VALUES ('174', '13000', '机器学习', '0', '81', '2', '1');
INSERT INTO `company_profession` VALUES ('175', '45000', '机器学习', '0', '57', '3', '1');
INSERT INTO `company_profession` VALUES ('176', '18000', '产品总监', '0', '79', '6', '2');
INSERT INTO `company_profession` VALUES ('177', '45000', '产品总监', '0', '78', '2', '2');
INSERT INTO `company_profession` VALUES ('178', '35000', '产品总监', '0', '74', '1', '2');
INSERT INTO `company_profession` VALUES ('179', '18000', '产品总监', '0', '67', '7', '2');
INSERT INTO `company_profession` VALUES ('180', '17000', '产品总监', '0', '54', '5', '2');
INSERT INTO `company_profession` VALUES ('181', '12000', '产品总监', '0', '67', '3', '2');
INSERT INTO `company_profession` VALUES ('182', '49000', '产品总监', '0', '63', '3', '2');
INSERT INTO `company_profession` VALUES ('183', '36000', '产品总监', '0', '75', '6', '2');
INSERT INTO `company_profession` VALUES ('184', '14000', '产品总监', '0', '81', '6', '2');
INSERT INTO `company_profession` VALUES ('185', '45000', '产品总监', '0', '63', '4', '2');
INSERT INTO `company_profession` VALUES ('186', '16000', '产品总监', '0', '53', '3', '2');
INSERT INTO `company_profession` VALUES ('187', '8000', '产品总监', '0', '63', '7', '2');
INSERT INTO `company_profession` VALUES ('188', '31000', '产品经理', '0', '81', '4', '2');
INSERT INTO `company_profession` VALUES ('189', '10000', '产品经理', '0', '53', '7', '2');
INSERT INTO `company_profession` VALUES ('190', '25000', '产品经理', '0', '79', '1', '2');
INSERT INTO `company_profession` VALUES ('191', '37000', '产品经理', '0', '79', '4', '2');
INSERT INTO `company_profession` VALUES ('192', '40000', '产品经理', '0', '79', '2', '2');
INSERT INTO `company_profession` VALUES ('193', '45000', '产品经理', '0', '78', '1', '2');
INSERT INTO `company_profession` VALUES ('194', '34000', '产品经理', '0', '60', '5', '2');
INSERT INTO `company_profession` VALUES ('195', '35000', '产品经理', '0', '61', '6', '2');
INSERT INTO `company_profession` VALUES ('196', '7000', '产品经理', '0', '55', '5', '2');
INSERT INTO `company_profession` VALUES ('197', '24000', '产品经理', '0', '74', '6', '2');
INSERT INTO `company_profession` VALUES ('198', '26000', '产品经理', '0', '72', '1', '2');
INSERT INTO `company_profession` VALUES ('199', '7000', '产品经理', '0', '57', '1', '2');
INSERT INTO `company_profession` VALUES ('200', '7000', '产品经理', '0', '52', '1', '2');
INSERT INTO `company_profession` VALUES ('201', '45000', '产品经理', '0', '79', '2', '2');
INSERT INTO `company_profession` VALUES ('202', '37000', '产品经理', '0', '72', '4', '2');
INSERT INTO `company_profession` VALUES ('203', '43000', '产品经理', '0', '54', '6', '2');
INSERT INTO `company_profession` VALUES ('204', '16000', '产品经理', '0', '76', '1', '2');
INSERT INTO `company_profession` VALUES ('205', '49000', '数据产品经理', '0', '76', '2', '2');
INSERT INTO `company_profession` VALUES ('206', '8000', '数据产品经理', '0', '61', '5', '2');
INSERT INTO `company_profession` VALUES ('207', '33000', '数据产品经理', '0', '51', '7', '2');
INSERT INTO `company_profession` VALUES ('208', '48000', '数据产品经理', '0', '70', '2', '2');
INSERT INTO `company_profession` VALUES ('209', '39000', '数据产品经理', '0', '51', '7', '2');
INSERT INTO `company_profession` VALUES ('210', '25000', '数据产品经理', '0', '53', '6', '2');
INSERT INTO `company_profession` VALUES ('211', '49000', '数据产品经理', '0', '69', '7', '2');
INSERT INTO `company_profession` VALUES ('212', '5000', '数据产品经理', '0', '78', '7', '2');
INSERT INTO `company_profession` VALUES ('213', '17000', '数据产品经理', '0', '53', '4', '2');
INSERT INTO `company_profession` VALUES ('214', '41000', '数据产品经理', '0', '54', '6', '2');
INSERT INTO `company_profession` VALUES ('215', '33000', '数据产品经理', '0', '72', '6', '2');
INSERT INTO `company_profession` VALUES ('216', '17000', '数据产品经理', '0', '75', '5', '2');
INSERT INTO `company_profession` VALUES ('217', '22000', '数据产品经理', '0', '70', '5', '2');
INSERT INTO `company_profession` VALUES ('218', '8000', '数据产品经理', '0', '67', '2', '2');
INSERT INTO `company_profession` VALUES ('219', '48000', '数据产品经理', '0', '75', '3', '2');
INSERT INTO `company_profession` VALUES ('220', '28000', '游戏策划', '0', '76', '5', '2');
INSERT INTO `company_profession` VALUES ('221', '14000', '游戏策划', '0', '70', '5', '2');
INSERT INTO `company_profession` VALUES ('222', '14000', '游戏策划', '0', '54', '3', '2');
INSERT INTO `company_profession` VALUES ('223', '26000', '游戏策划', '0', '77', '4', '2');
INSERT INTO `company_profession` VALUES ('224', '22000', '游戏策划', '0', '56', '1', '2');
INSERT INTO `company_profession` VALUES ('225', '37000', '游戏策划', '0', '79', '5', '2');
INSERT INTO `company_profession` VALUES ('226', '46000', '游戏策划', '0', '54', '2', '2');
INSERT INTO `company_profession` VALUES ('227', '47000', '游戏策划', '0', '69', '2', '2');
INSERT INTO `company_profession` VALUES ('228', '38000', '游戏策划', '0', '76', '4', '2');
INSERT INTO `company_profession` VALUES ('229', '23000', '游戏策划', '0', '75', '4', '2');
INSERT INTO `company_profession` VALUES ('230', '5000', '游戏策划', '0', '61', '6', '2');
INSERT INTO `company_profession` VALUES ('231', '16000', '游戏策划', '0', '80', '3', '2');
INSERT INTO `company_profession` VALUES ('232', '39000', 'UI设计师', '0', '70', '6', '3');
INSERT INTO `company_profession` VALUES ('233', '45000', 'UI设计师', '0', '55', '3', '3');
INSERT INTO `company_profession` VALUES ('234', '7000', 'UI设计师', '0', '61', '6', '3');
INSERT INTO `company_profession` VALUES ('235', '38000', 'UI设计师', '0', '56', '3', '3');
INSERT INTO `company_profession` VALUES ('236', '32000', 'UI设计师', '0', '80', '6', '3');
INSERT INTO `company_profession` VALUES ('237', '45000', 'UI设计师', '0', '77', '1', '3');
INSERT INTO `company_profession` VALUES ('238', '46000', 'UI设计师', '0', '67', '1', '3');
INSERT INTO `company_profession` VALUES ('239', '30000', 'UI设计师', '0', '52', '4', '3');
INSERT INTO `company_profession` VALUES ('240', '42000', 'UI设计师', '0', '72', '5', '3');
INSERT INTO `company_profession` VALUES ('241', '47000', 'UI设计师', '0', '79', '3', '3');
INSERT INTO `company_profession` VALUES ('242', '3000', 'UI设计师', '0', '72', '6', '3');
INSERT INTO `company_profession` VALUES ('243', '45000', 'UI设计师', '0', '56', '6', '3');
INSERT INTO `company_profession` VALUES ('244', '9000', '交互设计', '0', '71', '5', '3');
INSERT INTO `company_profession` VALUES ('245', '17000', '交互设计', '0', '71', '5', '3');
INSERT INTO `company_profession` VALUES ('246', '9000', '交互设计', '0', '53', '3', '3');
INSERT INTO `company_profession` VALUES ('247', '38000', '交互设计', '0', '80', '2', '3');
INSERT INTO `company_profession` VALUES ('248', '27000', '交互设计', '0', '59', '5', '3');
INSERT INTO `company_profession` VALUES ('249', '36000', '交互设计', '0', '71', '7', '3');
INSERT INTO `company_profession` VALUES ('250', '43000', '交互设计', '0', '77', '7', '3');
INSERT INTO `company_profession` VALUES ('251', '8000', '交互设计', '0', '72', '7', '3');
INSERT INTO `company_profession` VALUES ('252', '7000', '交互设计', '0', '78', '5', '3');
INSERT INTO `company_profession` VALUES ('253', '13000', '交互设计', '0', '80', '6', '3');
INSERT INTO `company_profession` VALUES ('254', '28000', '交互设计', '0', '65', '1', '3');
INSERT INTO `company_profession` VALUES ('255', '46000', '网页设计师', '0', '52', '7', '3');
INSERT INTO `company_profession` VALUES ('256', '25000', '网页设计师', '0', '81', '2', '3');
INSERT INTO `company_profession` VALUES ('257', '34000', '网页设计师', '0', '72', '6', '3');
INSERT INTO `company_profession` VALUES ('258', '38000', '网页设计师', '0', '62', '4', '3');
INSERT INTO `company_profession` VALUES ('259', '12000', '网页设计师', '0', '57', '4', '3');
INSERT INTO `company_profession` VALUES ('260', '19000', '网页设计师', '0', '72', '7', '3');
INSERT INTO `company_profession` VALUES ('261', '15000', '网页设计师', '0', '72', '5', '3');
INSERT INTO `company_profession` VALUES ('262', '34000', '网页设计师', '0', '72', '3', '3');
INSERT INTO `company_profession` VALUES ('263', '5000', '网页设计师', '0', '70', '6', '3');
INSERT INTO `company_profession` VALUES ('264', '36000', '网页设计师', '0', '78', '1', '3');
INSERT INTO `company_profession` VALUES ('265', '10000', '网页设计师', '0', '54', '4', '3');
INSERT INTO `company_profession` VALUES ('266', '47000', '网页设计师', '0', '81', '3', '3');
INSERT INTO `company_profession` VALUES ('267', '34000', '网页设计师', '0', '51', '3', '3');
INSERT INTO `company_profession` VALUES ('268', '19000', '网页设计师', '0', '57', '1', '3');
INSERT INTO `company_profession` VALUES ('269', '50000', '网页设计师', '0', '60', '4', '3');
INSERT INTO `company_profession` VALUES ('270', '14000', '网页设计师', '0', '63', '4', '3');
INSERT INTO `company_profession` VALUES ('271', '4000', '网页设计师', '0', '52', '3', '3');
INSERT INTO `company_profession` VALUES ('272', '17000', '平面设计师', '0', '57', '5', '3');
INSERT INTO `company_profession` VALUES ('273', '9000', '平面设计师', '0', '55', '4', '3');
INSERT INTO `company_profession` VALUES ('274', '11000', '平面设计师', '0', '58', '5', '3');
INSERT INTO `company_profession` VALUES ('275', '10000', '平面设计师', '0', '75', '2', '3');
INSERT INTO `company_profession` VALUES ('276', '45000', '平面设计师', '0', '71', '5', '3');
INSERT INTO `company_profession` VALUES ('277', '49000', '平面设计师', '0', '59', '6', '3');
INSERT INTO `company_profession` VALUES ('278', '48000', '平面设计师', '0', '78', '1', '3');
INSERT INTO `company_profession` VALUES ('279', '10000', '平面设计师', '0', '72', '3', '3');
INSERT INTO `company_profession` VALUES ('280', '50000', '平面设计师', '0', '73', '3', '3');
INSERT INTO `company_profession` VALUES ('281', '50000', '平面设计师', '0', '80', '6', '3');
INSERT INTO `company_profession` VALUES ('282', '44000', '平面设计师', '0', '81', '4', '3');
INSERT INTO `company_profession` VALUES ('283', '14000', '平面设计师', '0', '75', '6', '3');
INSERT INTO `company_profession` VALUES ('284', '38000', '平面设计师', '0', '79', '2', '3');
INSERT INTO `company_profession` VALUES ('285', '15000', '平面设计师', '0', '77', '5', '3');
INSERT INTO `company_profession` VALUES ('286', '31000', '平面设计师', '0', '73', '7', '3');
INSERT INTO `company_profession` VALUES ('287', '30000', '平面设计师', '0', '69', '1', '3');
INSERT INTO `company_profession` VALUES ('288', '19000', '平面设计师', '0', '74', '6', '3');
INSERT INTO `company_profession` VALUES ('289', '34000', '平面设计师', '0', '78', '5', '3');
INSERT INTO `company_profession` VALUES ('290', '10000', '平面设计师', '0', '67', '3', '3');
INSERT INTO `company_profession` VALUES ('291', '27000', '视觉设计师', '0', '56', '5', '3');
INSERT INTO `company_profession` VALUES ('292', '14000', '视觉设计师', '0', '62', '4', '3');
INSERT INTO `company_profession` VALUES ('293', '17000', '视觉设计师', '0', '73', '5', '3');
INSERT INTO `company_profession` VALUES ('294', '18000', '视觉设计师', '0', '53', '7', '3');
INSERT INTO `company_profession` VALUES ('295', '12000', '视觉设计师', '0', '75', '1', '3');
INSERT INTO `company_profession` VALUES ('296', '28000', '视觉设计师', '0', '76', '4', '3');
INSERT INTO `company_profession` VALUES ('297', '46000', '视觉设计师', '0', '71', '3', '3');
INSERT INTO `company_profession` VALUES ('298', '45000', '视觉设计师', '0', '72', '4', '3');
INSERT INTO `company_profession` VALUES ('299', '30000', '视觉设计师', '0', '55', '7', '3');
INSERT INTO `company_profession` VALUES ('300', '10000', '视觉设计师', '0', '58', '6', '3');
INSERT INTO `company_profession` VALUES ('301', '22000', '视觉设计师', '0', '77', '3', '3');
INSERT INTO `company_profession` VALUES ('302', '24000', '视觉设计师', '0', '76', '5', '3');
INSERT INTO `company_profession` VALUES ('303', '34000', '视觉设计师', '0', '72', '4', '3');
INSERT INTO `company_profession` VALUES ('304', '41000', '新媒体运营', '0', '76', '3', '4');
INSERT INTO `company_profession` VALUES ('305', '38000', '新媒体运营', '0', '61', '7', '4');
INSERT INTO `company_profession` VALUES ('306', '10000', '新媒体运营', '0', '62', '7', '4');
INSERT INTO `company_profession` VALUES ('307', '35000', '新媒体运营', '0', '57', '6', '4');
INSERT INTO `company_profession` VALUES ('308', '36000', '新媒体运营', '0', '69', '2', '4');
INSERT INTO `company_profession` VALUES ('309', '39000', '新媒体运营', '0', '70', '6', '4');
INSERT INTO `company_profession` VALUES ('310', '15000', '新媒体运营', '0', '78', '7', '4');
INSERT INTO `company_profession` VALUES ('311', '19000', '新媒体运营', '0', '69', '2', '4');
INSERT INTO `company_profession` VALUES ('312', '24000', '新媒体运营', '0', '74', '7', '4');
INSERT INTO `company_profession` VALUES ('313', '9000', '新媒体运营', '0', '55', '6', '4');
INSERT INTO `company_profession` VALUES ('314', '31000', '新媒体运营', '0', '73', '3', '4');
INSERT INTO `company_profession` VALUES ('315', '13000', '新媒体运营', '0', '57', '1', '4');
INSERT INTO `company_profession` VALUES ('316', '36000', '新媒体运营', '0', '62', '1', '4');
INSERT INTO `company_profession` VALUES ('317', '39000', '新媒体运营', '0', '81', '6', '4');
INSERT INTO `company_profession` VALUES ('318', '47000', '新媒体运营', '0', '75', '4', '4');
INSERT INTO `company_profession` VALUES ('319', '42000', '新媒体运营', '0', '74', '3', '4');
INSERT INTO `company_profession` VALUES ('320', '48000', '新媒体运营', '0', '63', '2', '4');
INSERT INTO `company_profession` VALUES ('321', '38000', '新媒体运营', '0', '74', '7', '4');
INSERT INTO `company_profession` VALUES ('322', '23000', '新媒体运营', '0', '52', '6', '4');
INSERT INTO `company_profession` VALUES ('323', '46000', '编辑', '0', '67', '5', '4');
INSERT INTO `company_profession` VALUES ('324', '27000', '编辑', '0', '51', '1', '4');
INSERT INTO `company_profession` VALUES ('325', '36000', '编辑', '0', '70', '7', '4');
INSERT INTO `company_profession` VALUES ('326', '30000', '编辑', '0', '78', '7', '4');
INSERT INTO `company_profession` VALUES ('327', '11000', '编辑', '0', '71', '2', '4');
INSERT INTO `company_profession` VALUES ('328', '10000', '编辑', '0', '52', '3', '4');
INSERT INTO `company_profession` VALUES ('329', '9000', '编辑', '0', '70', '4', '4');
INSERT INTO `company_profession` VALUES ('330', '2000', '编辑', '0', '81', '1', '4');
INSERT INTO `company_profession` VALUES ('331', '35000', '编辑', '0', '63', '6', '4');
INSERT INTO `company_profession` VALUES ('332', '13000', '编辑', '0', '58', '3', '4');
INSERT INTO `company_profession` VALUES ('333', '16000', '编辑', '0', '76', '5', '4');
INSERT INTO `company_profession` VALUES ('334', '47000', '编辑', '0', '80', '5', '4');
INSERT INTO `company_profession` VALUES ('335', '43000', '数据运营', '0', '54', '5', '4');
INSERT INTO `company_profession` VALUES ('336', '13000', '数据运营', '0', '69', '4', '4');
INSERT INTO `company_profession` VALUES ('337', '29000', '数据运营', '0', '55', '2', '4');
INSERT INTO `company_profession` VALUES ('338', '28000', '数据运营', '0', '67', '4', '4');
INSERT INTO `company_profession` VALUES ('339', '38000', '数据运营', '0', '63', '7', '4');
INSERT INTO `company_profession` VALUES ('340', '37000', '运营总监', '0', '72', '3', '4');
INSERT INTO `company_profession` VALUES ('341', '39000', '运营总监', '0', '72', '5', '4');
INSERT INTO `company_profession` VALUES ('342', '3000', '运营总监', '0', '62', '2', '4');
INSERT INTO `company_profession` VALUES ('343', '37000', '运营总监', '0', '72', '7', '4');
INSERT INTO `company_profession` VALUES ('344', '9000', '运营总监', '0', '67', '2', '4');
INSERT INTO `company_profession` VALUES ('345', '36000', '运营总监', '0', '80', '3', '4');
INSERT INTO `company_profession` VALUES ('346', '8000', '运营总监', '0', '56', '2', '4');
INSERT INTO `company_profession` VALUES ('347', '2000', '运营总监', '0', '76', '2', '4');
INSERT INTO `company_profession` VALUES ('348', '48000', '运营总监', '0', '60', '3', '4');
INSERT INTO `company_profession` VALUES ('349', '42000', '运营总监', '0', '55', '1', '4');
INSERT INTO `company_profession` VALUES ('350', '44000', '运营总监', '0', '65', '3', '4');
INSERT INTO `company_profession` VALUES ('351', '14000', '运营总监', '0', '71', '7', '4');
INSERT INTO `company_profession` VALUES ('352', '27000', '运营总监', '0', '72', '5', '4');
INSERT INTO `company_profession` VALUES ('353', '16000', 'COO', '0', '81', '4', '4');
INSERT INTO `company_profession` VALUES ('354', '19000', 'COO', '0', '79', '4', '4');
INSERT INTO `company_profession` VALUES ('355', '23000', 'COO', '0', '79', '7', '4');
INSERT INTO `company_profession` VALUES ('356', '44000', 'COO', '0', '59', '3', '4');
INSERT INTO `company_profession` VALUES ('357', '41000', 'COO', '0', '75', '6', '4');
INSERT INTO `company_profession` VALUES ('358', '40000', 'COO', '0', '52', '6', '4');
INSERT INTO `company_profession` VALUES ('359', '42000', 'COO', '0', '69', '7', '4');
INSERT INTO `company_profession` VALUES ('360', '17000', 'COO', '0', '77', '7', '4');
INSERT INTO `company_profession` VALUES ('361', '41000', 'COO', '0', '77', '2', '4');
INSERT INTO `company_profession` VALUES ('362', '27000', 'COO', '0', '81', '4', '4');
INSERT INTO `company_profession` VALUES ('363', '4000', 'COO', '0', '73', '3', '4');
INSERT INTO `company_profession` VALUES ('364', '17000', 'COO', '0', '60', '7', '4');
INSERT INTO `company_profession` VALUES ('365', '44000', 'COO', '0', '79', '2', '4');
INSERT INTO `company_profession` VALUES ('366', '22000', 'COO', '0', '65', '7', '4');
INSERT INTO `company_profession` VALUES ('367', '21000', 'COO', '0', '65', '4', '4');
INSERT INTO `company_profession` VALUES ('368', '8000', 'COO', '0', '69', '3', '4');
INSERT INTO `company_profession` VALUES ('369', '6000', 'COO', '0', '72', '4', '4');
INSERT INTO `company_profession` VALUES ('370', '48000', '市场营销', '0', '81', '4', '5');
INSERT INTO `company_profession` VALUES ('371', '34000', '市场营销', '0', '53', '6', '5');
INSERT INTO `company_profession` VALUES ('372', '45000', '市场营销', '0', '54', '4', '5');
INSERT INTO `company_profession` VALUES ('373', '43000', '市场营销', '0', '57', '5', '5');
INSERT INTO `company_profession` VALUES ('374', '17000', '市场营销', '0', '65', '7', '5');
INSERT INTO `company_profession` VALUES ('375', '48000', '市场营销', '0', '54', '7', '5');
INSERT INTO `company_profession` VALUES ('376', '48000', '市场营销', '0', '52', '7', '5');
INSERT INTO `company_profession` VALUES ('377', '27000', '市场营销', '0', '72', '3', '5');
INSERT INTO `company_profession` VALUES ('378', '42000', '市场营销', '0', '55', '1', '5');
INSERT INTO `company_profession` VALUES ('379', '43000', '市场营销', '0', '53', '2', '5');
INSERT INTO `company_profession` VALUES ('380', '27000', '市场营销', '0', '57', '4', '5');
INSERT INTO `company_profession` VALUES ('381', '36000', '市场营销', '0', '55', '3', '5');
INSERT INTO `company_profession` VALUES ('382', '14000', '市场营销', '0', '67', '5', '5');
INSERT INTO `company_profession` VALUES ('383', '10000', '市场营销', '0', '77', '5', '5');
INSERT INTO `company_profession` VALUES ('384', '9000', '市场营销', '0', '65', '3', '5');
INSERT INTO `company_profession` VALUES ('385', '12000', '市场营销', '0', '81', '1', '5');
INSERT INTO `company_profession` VALUES ('386', '11000', '市场推广', '0', '67', '4', '5');
INSERT INTO `company_profession` VALUES ('387', '49000', '市场推广', '0', '65', '7', '5');
INSERT INTO `company_profession` VALUES ('388', '47000', '市场推广', '0', '75', '4', '5');
INSERT INTO `company_profession` VALUES ('389', '43000', '市场推广', '0', '55', '1', '5');
INSERT INTO `company_profession` VALUES ('390', '10000', '市场推广', '0', '77', '5', '5');
INSERT INTO `company_profession` VALUES ('391', '8000', '市场策划', '0', '77', '5', '5');
INSERT INTO `company_profession` VALUES ('392', '35000', '市场策划', '0', '72', '4', '5');
INSERT INTO `company_profession` VALUES ('393', '30000', '市场策划', '0', '72', '6', '5');
INSERT INTO `company_profession` VALUES ('394', '37000', '市场策划', '0', '59', '3', '5');
INSERT INTO `company_profession` VALUES ('395', '12000', '市场策划', '0', '76', '4', '5');
INSERT INTO `company_profession` VALUES ('396', '20000', '市场策划', '0', '77', '1', '5');
INSERT INTO `company_profession` VALUES ('397', '21000', '市场策划', '0', '71', '4', '5');
INSERT INTO `company_profession` VALUES ('398', '29000', '市场策划', '0', '77', '6', '5');
INSERT INTO `company_profession` VALUES ('399', '32000', '市场策划', '0', '79', '6', '5');
INSERT INTO `company_profession` VALUES ('400', '24000', '政府关系', '0', '59', '5', '5');
INSERT INTO `company_profession` VALUES ('401', '41000', '政府关系', '0', '79', '6', '5');
INSERT INTO `company_profession` VALUES ('402', '50000', '政府关系', '0', '54', '2', '5');
INSERT INTO `company_profession` VALUES ('403', '48000', '政府关系', '0', '54', '4', '5');
INSERT INTO `company_profession` VALUES ('404', '20000', '政府关系', '0', '77', '7', '5');
INSERT INTO `company_profession` VALUES ('405', '7000', '政府关系', '0', '75', '1', '5');
INSERT INTO `company_profession` VALUES ('406', '9000', '政府关系', '0', '54', '2', '5');
INSERT INTO `company_profession` VALUES ('407', '28000', '政府关系', '0', '79', '7', '5');
INSERT INTO `company_profession` VALUES ('408', '22000', '政府关系', '0', '77', '5', '5');
INSERT INTO `company_profession` VALUES ('409', '24000', '政府关系', '0', '54', '7', '5');
INSERT INTO `company_profession` VALUES ('410', '7000', '广告文案', '0', '59', '5', '5');
INSERT INTO `company_profession` VALUES ('411', '19000', '广告文案', '0', '70', '3', '5');
INSERT INTO `company_profession` VALUES ('412', '34000', '广告文案', '0', '52', '7', '5');
INSERT INTO `company_profession` VALUES ('413', '15000', '广告文案', '0', '51', '2', '5');
INSERT INTO `company_profession` VALUES ('414', '2000', '广告文案', '0', '51', '7', '5');
INSERT INTO `company_profession` VALUES ('415', '50000', '广告文案', '0', '71', '6', '5');
INSERT INTO `company_profession` VALUES ('416', '41000', '广告文案', '0', '62', '6', '5');
INSERT INTO `company_profession` VALUES ('417', '32000', '广告文案', '0', '72', '3', '5');
INSERT INTO `company_profession` VALUES ('418', '39000', '广告文案', '0', '76', '2', '5');
INSERT INTO `company_profession` VALUES ('419', '10000', '广告文案', '0', '51', '1', '5');
INSERT INTO `company_profession` VALUES ('420', '20000', '广告文案', '0', '51', '7', '5');
INSERT INTO `company_profession` VALUES ('421', '48000', '广告文案', '0', '52', '3', '5');
INSERT INTO `company_profession` VALUES ('422', '13000', '广告文案', '0', '52', '4', '5');
INSERT INTO `company_profession` VALUES ('423', '38000', '广告文案', '0', '54', '7', '5');
INSERT INTO `company_profession` VALUES ('424', '5000', '广告文案', '0', '80', '6', '5');
INSERT INTO `company_profession` VALUES ('425', '23000', '广告文案', '0', '76', '7', '5');
INSERT INTO `company_profession` VALUES ('426', '9000', '广告投放', '0', '51', '7', '5');
INSERT INTO `company_profession` VALUES ('427', '11000', '广告投放', '0', '81', '1', '5');
INSERT INTO `company_profession` VALUES ('428', '22000', '广告投放', '0', '77', '4', '5');
INSERT INTO `company_profession` VALUES ('429', '21000', '广告投放', '0', '57', '3', '5');
INSERT INTO `company_profession` VALUES ('430', '25000', '广告投放', '0', '79', '3', '5');
INSERT INTO `company_profession` VALUES ('431', '8000', '广告投放', '0', '53', '6', '5');
INSERT INTO `company_profession` VALUES ('432', '9000', '市场推广', '0', '52', '2', '5');
INSERT INTO `company_profession` VALUES ('433', '21000', '市场推广', '0', '57', '1', '5');
INSERT INTO `company_profession` VALUES ('434', '25000', '市场推广', '0', '52', '4', '5');
INSERT INTO `company_profession` VALUES ('435', '32000', '市场推广', '0', '72', '6', '5');
INSERT INTO `company_profession` VALUES ('436', '47000', '市场推广', '0', '72', '4', '5');
INSERT INTO `company_profession` VALUES ('437', '19000', '市场推广', '0', '81', '2', '5');
INSERT INTO `company_profession` VALUES ('438', '31000', '市场推广', '0', '53', '7', '5');
INSERT INTO `company_profession` VALUES ('439', '26000', '市场推广', '0', '81', '6', '5');
INSERT INTO `company_profession` VALUES ('440', '21000', '市场推广', '0', '81', '5', '5');
INSERT INTO `company_profession` VALUES ('441', '49000', '市场推广', '0', '73', '1', '5');
INSERT INTO `company_profession` VALUES ('442', '45000', '市场推广', '0', '57', '7', '5');
INSERT INTO `company_profession` VALUES ('443', '44000', '市场推广', '0', '61', '5', '5');
INSERT INTO `company_profession` VALUES ('444', '43000', '市场推广', '0', '60', '1', '5');
INSERT INTO `company_profession` VALUES ('445', '15000', '市场推广', '0', '72', '5', '5');
INSERT INTO `company_profession` VALUES ('446', '15000', '市场推广', '0', '52', '4', '5');
INSERT INTO `company_profession` VALUES ('447', '5000', '市场推广', '0', '77', '7', '5');
INSERT INTO `company_profession` VALUES ('448', '6000', '市场推广', '0', '58', '4', '5');
INSERT INTO `company_profession` VALUES ('449', '23000', '市场推广', '0', '69', '4', '5');
INSERT INTO `company_profession` VALUES ('450', '43000', '市场推广', '0', '70', '5', '5');
INSERT INTO `company_profession` VALUES ('451', '15000', 'SEO', '0', '60', '3', '5');
INSERT INTO `company_profession` VALUES ('452', '28000', 'SEO', '0', '81', '3', '5');
INSERT INTO `company_profession` VALUES ('453', '15000', 'SEO', '0', '54', '5', '5');
INSERT INTO `company_profession` VALUES ('454', '46000', 'SEO', '0', '51', '1', '5');
INSERT INTO `company_profession` VALUES ('455', '12000', 'SEO', '0', '52', '6', '5');
INSERT INTO `company_profession` VALUES ('456', '6000', 'SEO', '0', '71', '5', '5');
INSERT INTO `company_profession` VALUES ('457', '28000', 'SEO', '0', '63', '5', '5');
INSERT INTO `company_profession` VALUES ('458', '44000', 'SEO', '0', '60', '2', '5');
INSERT INTO `company_profession` VALUES ('459', '41000', 'SEO', '0', '73', '2', '5');
INSERT INTO `company_profession` VALUES ('460', '2000', 'SEO', '0', '71', '1', '5');
INSERT INTO `company_profession` VALUES ('461', '43000', 'SEO', '0', '81', '2', '5');
INSERT INTO `company_profession` VALUES ('462', '16000', 'SEO', '0', '54', '4', '5');
INSERT INTO `company_profession` VALUES ('463', '12000', 'SEO', '0', '53', '3', '5');
INSERT INTO `company_profession` VALUES ('464', '21000', 'SEO', '0', '67', '2', '5');
INSERT INTO `company_profession` VALUES ('465', '15000', 'SEM', '0', '59', '6', '5');
INSERT INTO `company_profession` VALUES ('466', '11000', 'SEM', '0', '80', '2', '5');
INSERT INTO `company_profession` VALUES ('467', '49000', 'SEM', '0', '75', '6', '5');
INSERT INTO `company_profession` VALUES ('468', '15000', 'SEM', '0', '51', '6', '5');
INSERT INTO `company_profession` VALUES ('469', '2000', 'SEM', '0', '63', '6', '5');
INSERT INTO `company_profession` VALUES ('470', '6000', 'SEM', '0', '79', '4', '5');
INSERT INTO `company_profession` VALUES ('471', '48000', 'SEM', '0', '65', '3', '5');
INSERT INTO `company_profession` VALUES ('472', '16000', 'SEM', '0', '73', '7', '5');
INSERT INTO `company_profession` VALUES ('473', '44000', 'SEM', '0', '80', '5', '5');
INSERT INTO `company_profession` VALUES ('474', '9000', 'SEM', '0', '78', '5', '5');
INSERT INTO `company_profession` VALUES ('475', '21000', 'SEM', '0', '63', '5', '5');
INSERT INTO `company_profession` VALUES ('476', '29000', 'SEM', '0', '52', '6', '5');
INSERT INTO `company_profession` VALUES ('477', '29000', 'SEM', '0', '74', '3', '5');
INSERT INTO `company_profession` VALUES ('478', '13000', 'SEM', '0', '69', '3', '5');
INSERT INTO `company_profession` VALUES ('479', '50000', 'SEM', '0', '54', '6', '5');
INSERT INTO `company_profession` VALUES ('480', '30000', 'SEM', '0', '76', '2', '5');
INSERT INTO `company_profession` VALUES ('481', '31000', 'SEM', '0', '52', '7', '5');
INSERT INTO `company_profession` VALUES ('482', '39000', '销售专员', '0', '74', '7', '6');
INSERT INTO `company_profession` VALUES ('483', '8000', '销售专员', '0', '57', '3', '6');
INSERT INTO `company_profession` VALUES ('484', '8000', '销售专员', '0', '67', '6', '6');
INSERT INTO `company_profession` VALUES ('485', '13000', '销售专员', '0', '53', '6', '6');
INSERT INTO `company_profession` VALUES ('486', '47000', '销售专员', '0', '55', '7', '6');
INSERT INTO `company_profession` VALUES ('487', '40000', '销售专员', '0', '59', '6', '6');
INSERT INTO `company_profession` VALUES ('488', '46000', '销售专员', '0', '57', '2', '6');
INSERT INTO `company_profession` VALUES ('489', '49000', '销售专员', '0', '65', '7', '6');
INSERT INTO `company_profession` VALUES ('490', '15000', '销售专员', '0', '63', '2', '6');
INSERT INTO `company_profession` VALUES ('491', '13000', '销售专员', '0', '55', '5', '6');
INSERT INTO `company_profession` VALUES ('492', '22000', '销售专员', '0', '72', '5', '6');
INSERT INTO `company_profession` VALUES ('493', '15000', '销售经理', '0', '58', '6', '6');
INSERT INTO `company_profession` VALUES ('494', '32000', '销售经理', '0', '69', '1', '6');
INSERT INTO `company_profession` VALUES ('495', '36000', '销售经理', '0', '60', '6', '6');
INSERT INTO `company_profession` VALUES ('496', '42000', '销售经理', '0', '71', '2', '6');
INSERT INTO `company_profession` VALUES ('497', '8000', '销售经理', '0', '55', '5', '6');
INSERT INTO `company_profession` VALUES ('498', '24000', '销售经理', '0', '55', '2', '6');
INSERT INTO `company_profession` VALUES ('499', '24000', '销售经理', '0', '55', '3', '6');
INSERT INTO `company_profession` VALUES ('500', '25000', '销售经理', '0', '76', '3', '6');
INSERT INTO `company_profession` VALUES ('501', '29000', '销售经理', '0', '62', '4', '6');
INSERT INTO `company_profession` VALUES ('502', '4000', '销售经理', '0', '81', '6', '6');
INSERT INTO `company_profession` VALUES ('503', '23000', '销售经理', '0', '55', '1', '6');
INSERT INTO `company_profession` VALUES ('504', '23000', '销售经理', '0', '59', '3', '6');
INSERT INTO `company_profession` VALUES ('505', '15000', '销售经理', '0', '78', '7', '6');
INSERT INTO `company_profession` VALUES ('506', '45000', '销售经理', '0', '77', '3', '6');
INSERT INTO `company_profession` VALUES ('507', '8000', '销售总监', '0', '52', '1', '6');
INSERT INTO `company_profession` VALUES ('508', '9000', '销售总监', '0', '60', '6', '6');
INSERT INTO `company_profession` VALUES ('509', '19000', '销售总监', '0', '57', '6', '6');
INSERT INTO `company_profession` VALUES ('510', '46000', '销售总监', '0', '71', '7', '6');
INSERT INTO `company_profession` VALUES ('511', '44000', '销售总监', '0', '70', '4', '6');
INSERT INTO `company_profession` VALUES ('512', '48000', '大客户代表', '0', '57', '1', '6');
INSERT INTO `company_profession` VALUES ('513', '37000', '大客户代表', '0', '62', '2', '6');
INSERT INTO `company_profession` VALUES ('514', '14000', '大客户代表', '0', '80', '6', '6');
INSERT INTO `company_profession` VALUES ('515', '20000', '大客户代表', '0', '72', '3', '6');
INSERT INTO `company_profession` VALUES ('516', '37000', '大客户代表', '0', '76', '5', '6');
INSERT INTO `company_profession` VALUES ('517', '39000', '大客户代表', '0', '53', '3', '6');
INSERT INTO `company_profession` VALUES ('518', '21000', '大客户代表', '0', '55', '5', '6');
INSERT INTO `company_profession` VALUES ('519', '19000', '大客户代表', '0', '69', '3', '6');
INSERT INTO `company_profession` VALUES ('520', '38000', '大客户代表', '0', '51', '4', '6');
INSERT INTO `company_profession` VALUES ('521', '22000', '大客户代表', '0', '73', '3', '6');
INSERT INTO `company_profession` VALUES ('522', '33000', '大客户代表', '0', '61', '5', '6');
INSERT INTO `company_profession` VALUES ('523', '12000', '大客户代表', '0', '79', '4', '6');
INSERT INTO `company_profession` VALUES ('524', '36000', '大客户代表', '0', '81', '5', '6');
INSERT INTO `company_profession` VALUES ('525', '40000', '大客户代表', '0', '73', '6', '6');
INSERT INTO `company_profession` VALUES ('526', '42000', '大客户代表', '0', '67', '1', '6');
INSERT INTO `company_profession` VALUES ('527', '14000', '大客户代表', '0', '59', '6', '6');
INSERT INTO `company_profession` VALUES ('528', '2000', '大客户代表', '0', '51', '5', '6');
INSERT INTO `company_profession` VALUES ('529', '16000', '大客户代表', '0', '51', '3', '6');
INSERT INTO `company_profession` VALUES ('530', '17000', '大客户代表', '0', '81', '1', '6');
INSERT INTO `company_profession` VALUES ('531', '26000', '大客户代表', '0', '65', '6', '6');
INSERT INTO `company_profession` VALUES ('532', '8000', '客户经理', '0', '67', '3', '6');
INSERT INTO `company_profession` VALUES ('533', '47000', '客户经理', '0', '75', '7', '6');
INSERT INTO `company_profession` VALUES ('534', '37000', '客户经理', '0', '58', '7', '6');
INSERT INTO `company_profession` VALUES ('535', '41000', '客户经理', '0', '55', '4', '6');
INSERT INTO `company_profession` VALUES ('536', '44000', '客户经理', '0', '54', '5', '6');
INSERT INTO `company_profession` VALUES ('537', '16000', '客户经理', '0', '78', '1', '6');
INSERT INTO `company_profession` VALUES ('538', '13000', '客户经理', '0', '63', '7', '6');
INSERT INTO `company_profession` VALUES ('539', '41000', '客户经理', '0', '61', '7', '6');
INSERT INTO `company_profession` VALUES ('540', '41000', '客户经理', '0', '70', '2', '6');
INSERT INTO `company_profession` VALUES ('541', '49000', '客户经理', '0', '61', '2', '6');
INSERT INTO `company_profession` VALUES ('542', '27000', '客户经理', '0', '61', '2', '6');
INSERT INTO `company_profession` VALUES ('543', '38000', '客户经理', '0', '61', '5', '6');
INSERT INTO `company_profession` VALUES ('544', '48000', '客户经理', '0', '59', '6', '6');
INSERT INTO `company_profession` VALUES ('545', '36000', '客户经理', '0', '81', '6', '6');
INSERT INTO `company_profession` VALUES ('546', '9000', '客户经理', '0', '75', '3', '6');
INSERT INTO `company_profession` VALUES ('547', '40000', '客户经理', '0', '71', '3', '6');
INSERT INTO `company_profession` VALUES ('548', '21000', '电话销售', '0', '57', '3', '6');
INSERT INTO `company_profession` VALUES ('549', '11000', '电话销售', '0', '79', '3', '6');
INSERT INTO `company_profession` VALUES ('550', '36000', '电话销售', '0', '61', '4', '6');
INSERT INTO `company_profession` VALUES ('551', '39000', '电话销售', '0', '55', '2', '6');
INSERT INTO `company_profession` VALUES ('552', '9000', '电话销售', '0', '56', '4', '6');
INSERT INTO `company_profession` VALUES ('553', '9000', '电话销售', '0', '70', '6', '6');
INSERT INTO `company_profession` VALUES ('554', '23000', '电话销售', '0', '79', '7', '6');
INSERT INTO `company_profession` VALUES ('555', '8000', '电话销售', '0', '55', '7', '6');
INSERT INTO `company_profession` VALUES ('556', '3000', '电话销售', '0', '63', '3', '6');
INSERT INTO `company_profession` VALUES ('557', '49000', '电话销售', '0', '72', '6', '6');
INSERT INTO `company_profession` VALUES ('558', '19000', '电话销售', '0', '67', '7', '6');
INSERT INTO `company_profession` VALUES ('559', '27000', '电话销售', '0', '52', '4', '6');
INSERT INTO `company_profession` VALUES ('560', '42000', 'HR', '0', '77', '7', '7');
INSERT INTO `company_profession` VALUES ('561', '15000', 'HR', '0', '70', '6', '7');
INSERT INTO `company_profession` VALUES ('562', '20000', 'HR', '0', '80', '4', '7');
INSERT INTO `company_profession` VALUES ('563', '43000', 'HR', '0', '75', '5', '7');
INSERT INTO `company_profession` VALUES ('564', '10000', 'HR', '0', '75', '5', '7');
INSERT INTO `company_profession` VALUES ('565', '30000', 'HR', '0', '70', '5', '7');
INSERT INTO `company_profession` VALUES ('566', '43000', 'HR', '0', '65', '2', '7');
INSERT INTO `company_profession` VALUES ('567', '42000', 'HR', '0', '59', '7', '7');
INSERT INTO `company_profession` VALUES ('568', '48000', 'HR', '0', '78', '3', '7');
INSERT INTO `company_profession` VALUES ('569', '45000', 'HR', '0', '81', '7', '7');
INSERT INTO `company_profession` VALUES ('570', '16000', 'HR', '0', '65', '3', '7');
INSERT INTO `company_profession` VALUES ('571', '13000', 'HR', '0', '59', '2', '7');
INSERT INTO `company_profession` VALUES ('572', '48000', 'HR', '0', '74', '4', '7');
INSERT INTO `company_profession` VALUES ('573', '33000', '行政', '0', '72', '1', '7');
INSERT INTO `company_profession` VALUES ('574', '4000', '行政', '0', '58', '2', '7');
INSERT INTO `company_profession` VALUES ('575', '25000', '行政', '0', '79', '1', '7');
INSERT INTO `company_profession` VALUES ('576', '24000', '行政', '0', '75', '6', '7');
INSERT INTO `company_profession` VALUES ('577', '9000', '行政', '0', '69', '5', '7');
INSERT INTO `company_profession` VALUES ('578', '34000', '行政', '0', '65', '7', '7');
INSERT INTO `company_profession` VALUES ('579', '47000', '行政', '0', '55', '2', '7');
INSERT INTO `company_profession` VALUES ('580', '50000', '行政', '0', '67', '3', '7');
INSERT INTO `company_profession` VALUES ('581', '40000', '行政', '0', '79', '6', '7');
INSERT INTO `company_profession` VALUES ('582', '11000', '行政', '0', '67', '6', '7');
INSERT INTO `company_profession` VALUES ('583', '15000', '行政', '0', '65', '6', '7');
INSERT INTO `company_profession` VALUES ('584', '27000', '行政', '0', '69', '5', '7');
INSERT INTO `company_profession` VALUES ('585', '29000', '行政', '0', '80', '7', '7');
INSERT INTO `company_profession` VALUES ('586', '9000', '行政', '0', '60', '7', '7');
INSERT INTO `company_profession` VALUES ('587', '40000', '行政', '0', '77', '5', '7');
INSERT INTO `company_profession` VALUES ('588', '8000', '行政', '0', '56', '6', '7');
INSERT INTO `company_profession` VALUES ('589', '49000', '行政', '0', '59', '6', '7');
INSERT INTO `company_profession` VALUES ('590', '7000', '行政', '0', '61', '6', '7');
INSERT INTO `company_profession` VALUES ('591', '11000', '行政', '0', '67', '1', '7');
INSERT INTO `company_profession` VALUES ('592', '26000', '行政', '0', '77', '7', '7');
INSERT INTO `company_profession` VALUES ('593', '33000', '财务', '0', '63', '1', '7');
INSERT INTO `company_profession` VALUES ('594', '42000', '财务', '0', '81', '2', '7');
INSERT INTO `company_profession` VALUES ('595', '31000', '财务', '0', '72', '5', '7');
INSERT INTO `company_profession` VALUES ('596', '50000', '财务', '0', '60', '2', '7');
INSERT INTO `company_profession` VALUES ('597', '25000', '财务', '0', '77', '2', '7');
INSERT INTO `company_profession` VALUES ('598', '30000', '审计', '0', '73', '3', '7');
INSERT INTO `company_profession` VALUES ('599', '17000', '审计', '0', '60', '2', '7');
INSERT INTO `company_profession` VALUES ('600', '41000', '审计', '0', '71', '1', '7');
INSERT INTO `company_profession` VALUES ('601', '39000', '审计', '0', '63', '3', '7');
INSERT INTO `company_profession` VALUES ('602', '5000', '审计', '0', '71', '5', '7');
INSERT INTO `company_profession` VALUES ('603', '20000', '审计', '0', '58', '5', '7');
INSERT INTO `company_profession` VALUES ('604', '19000', '审计', '0', '63', '1', '7');
INSERT INTO `company_profession` VALUES ('605', '45000', '审计', '0', '80', '3', '7');
INSERT INTO `company_profession` VALUES ('606', '30000', '小游戏开发', '0', '76', '4', '8');
INSERT INTO `company_profession` VALUES ('607', '37000', '小游戏开发', '0', '65', '4', '8');
INSERT INTO `company_profession` VALUES ('608', '29000', '小游戏开发', '0', '81', '2', '8');
INSERT INTO `company_profession` VALUES ('609', '50000', '小游戏开发', '0', '53', '1', '8');
INSERT INTO `company_profession` VALUES ('610', '26000', '小游戏开发', '0', '80', '1', '8');
INSERT INTO `company_profession` VALUES ('611', '25000', '小游戏开发', '0', '53', '7', '8');
INSERT INTO `company_profession` VALUES ('612', '42000', '小游戏开发', '0', '57', '7', '8');
INSERT INTO `company_profession` VALUES ('613', '2000', '小游戏开发', '0', '74', '2', '8');
INSERT INTO `company_profession` VALUES ('614', '44000', '小游戏开发', '0', '67', '4', '8');
INSERT INTO `company_profession` VALUES ('615', '42000', '小游戏开发', '0', '57', '2', '8');
INSERT INTO `company_profession` VALUES ('616', '16000', '小游戏开发', '0', '67', '3', '8');
INSERT INTO `company_profession` VALUES ('617', '22000', '小游戏开发', '0', '71', '1', '8');
INSERT INTO `company_profession` VALUES ('618', '18000', '小游戏开发', '0', '76', '1', '8');
INSERT INTO `company_profession` VALUES ('619', '28000', 'U3D', '0', '80', '1', '8');
INSERT INTO `company_profession` VALUES ('620', '30000', 'U3D', '0', '70', '4', '8');
INSERT INTO `company_profession` VALUES ('621', '33000', 'U3D', '0', '70', '4', '8');
INSERT INTO `company_profession` VALUES ('622', '48000', 'U3D', '0', '55', '7', '8');
INSERT INTO `company_profession` VALUES ('623', '11000', 'U3D', '0', '72', '3', '8');
INSERT INTO `company_profession` VALUES ('624', '15000', 'U3D', '0', '59', '6', '8');
INSERT INTO `company_profession` VALUES ('625', '25000', 'U3D', '0', '80', '5', '8');
INSERT INTO `company_profession` VALUES ('626', '27000', 'U3D', '0', '51', '6', '8');
INSERT INTO `company_profession` VALUES ('627', '7000', 'U3D', '0', '67', '7', '8');
INSERT INTO `company_profession` VALUES ('628', '48000', 'U3D', '0', '73', '1', '8');
INSERT INTO `company_profession` VALUES ('629', '49000', 'U3D', '0', '78', '5', '8');
INSERT INTO `company_profession` VALUES ('630', '29000', 'U3D', '0', '75', '4', '8');
INSERT INTO `company_profession` VALUES ('631', '25000', 'U3D', '0', '76', '7', '8');
INSERT INTO `company_profession` VALUES ('632', '40000', 'U3D', '0', '54', '7', '8');
INSERT INTO `company_profession` VALUES ('633', '49000', '游戏策划', '0', '69', '2', '8');
INSERT INTO `company_profession` VALUES ('634', '7000', '游戏策划', '0', '52', '6', '8');
INSERT INTO `company_profession` VALUES ('635', '21000', '游戏策划', '0', '79', '5', '8');
INSERT INTO `company_profession` VALUES ('636', '7000', '游戏策划', '0', '60', '3', '8');
INSERT INTO `company_profession` VALUES ('637', '36000', '游戏策划', '0', '74', '6', '8');
INSERT INTO `company_profession` VALUES ('638', '45000', '游戏策划', '0', '65', '2', '8');
INSERT INTO `company_profession` VALUES ('639', '2000', '游戏策划', '0', '63', '6', '8');
INSERT INTO `company_profession` VALUES ('640', '9000', '游戏运营', '0', '62', '7', '8');
INSERT INTO `company_profession` VALUES ('641', '15000', '游戏运营', '0', '63', '5', '8');
INSERT INTO `company_profession` VALUES ('642', '16000', '游戏运营', '0', '58', '3', '8');
INSERT INTO `company_profession` VALUES ('643', '40000', '游戏运营', '0', '59', '3', '8');
INSERT INTO `company_profession` VALUES ('644', '31000', '游戏运营', '0', '54', '5', '8');
INSERT INTO `company_profession` VALUES ('645', '31000', '游戏运营', '0', '79', '7', '8');
INSERT INTO `company_profession` VALUES ('646', '46000', '游戏运营', '0', '59', '2', '8');
INSERT INTO `company_profession` VALUES ('647', '23000', '游戏运营', '0', '59', '6', '8');
INSERT INTO `company_profession` VALUES ('648', '2000', '游戏运营', '0', '72', '6', '8');
INSERT INTO `company_profession` VALUES ('649', '6000', '游戏运营', '0', '71', '5', '8');
INSERT INTO `company_profession` VALUES ('650', '15000', '游戏运营', '0', '69', '6', '8');
INSERT INTO `company_profession` VALUES ('651', '30000', '游戏运营', '0', '81', '3', '8');
INSERT INTO `company_profession` VALUES ('652', '12000', '游戏运营', '0', '75', '2', '8');
INSERT INTO `company_profession` VALUES ('653', '3000', '游戏运营', '0', '76', '6', '8');
INSERT INTO `company_profession` VALUES ('654', '4000', '游戏运营', '0', '74', '7', '8');
INSERT INTO `company_profession` VALUES ('655', '37000', '游戏运营', '0', '67', '6', '8');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('16', 'comment', 'comment');
INSERT INTO `django_content_type` VALUES ('12', 'company', 'company');
INSERT INTO `django_content_type` VALUES ('17', 'company', 'profession');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('19', 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES ('20', 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES ('21', 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES ('22', 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES ('23', 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES ('24', 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES ('25', 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES ('26', 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES ('13', 'industry', 'education');
INSERT INTO `django_content_type` VALUES ('14', 'industry', 'industry');
INSERT INTO `django_content_type` VALUES ('15', 'industry', 'profession');
INSERT INTO `django_content_type` VALUES ('18', 'industry', 'work');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('11', 'user', 'record');
INSERT INTO `django_content_type` VALUES ('10', 'user', 'resume');
INSERT INTO `django_content_type` VALUES ('7', 'user', 'user');
INSERT INTO `django_content_type` VALUES ('8', 'user', 'verificationcode');
INSERT INTO `django_content_type` VALUES ('9', 'user', 'wish');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2022-03-03 15:20:46.038643');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2022-03-03 15:20:46.971565');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2022-03-03 15:20:47.209213');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2022-03-03 15:20:47.224865');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2022-03-03 15:20:47.240490');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2022-03-03 15:20:47.355974');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2022-03-03 15:20:47.387211');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2022-03-03 15:20:47.425005');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2022-03-03 15:20:47.440644');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2022-03-03 15:20:47.503132');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2022-03-03 15:20:47.503132');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2022-03-03 15:20:47.509656');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2022-03-03 15:20:47.540915');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2022-03-03 15:20:47.556539');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2022-03-03 15:20:47.587794');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2022-03-03 15:20:47.609957');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2022-03-03 15:20:47.625587');
INSERT INTO `django_migrations` VALUES ('18', 'company', '0001_initial', '2022-03-03 15:20:47.673066');
INSERT INTO `django_migrations` VALUES ('19', 'industry', '0001_initial', '2022-03-03 15:20:47.966489');
INSERT INTO `django_migrations` VALUES ('20', 'user', '0001_initial', '2022-03-03 15:20:48.611214');
INSERT INTO `django_migrations` VALUES ('21', 'comment', '0001_initial', '2022-03-03 15:20:48.727304');
INSERT INTO `django_migrations` VALUES ('22', 'sessions', '0001_initial', '2022-03-03 15:20:48.811974');
INSERT INTO `django_migrations` VALUES ('23', 'company', '0002_profession', '2022-03-05 21:25:33.200617');
INSERT INTO `django_migrations` VALUES ('24', 'user', '0002_auto_20220305_2123', '2022-03-05 21:25:33.405790');
INSERT INTO `django_migrations` VALUES ('25', 'industry', '0002_auto_20220305_2123', '2022-03-05 21:25:33.560586');
INSERT INTO `django_migrations` VALUES ('26', 'industry', '0002_work_name', '2022-03-05 21:55:22.561863');
INSERT INTO `django_migrations` VALUES ('27', 'industry', '0003_alter_work_name', '2022-03-05 22:19:40.217289');
INSERT INTO `django_migrations` VALUES ('28', 'company', '0002_company_img', '2022-03-08 08:50:03.017618');
INSERT INTO `django_migrations` VALUES ('29', 'djcelery', '0001_initial', '2022-03-08 08:51:52.219212');
INSERT INTO `django_migrations` VALUES ('30', 'djcelery', '0002_auto_20220307_2348', '2022-03-08 08:51:52.431732');
INSERT INTO `django_migrations` VALUES ('31', 'company', '0003_alter_company_detail', '2022-03-08 08:56:57.522186');
INSERT INTO `django_migrations` VALUES ('32', 'djcelery', '0002_auto_20220307_2331', '2022-03-08 08:56:57.723334');
INSERT INTO `django_migrations` VALUES ('33', 'industry', '0002_alter_industry_work1', '2022-03-08 08:56:57.736337');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of djcelery_crontabschedule
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of djcelery_intervalschedule
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` bigint(20) DEFAULT NULL,
  `interval_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictask_crontab_id_75609bab_fk` (`crontab_id`),
  KEY `djcelery_periodictask_interval_id_b426ab02_fk` (`interval_id`),
  CONSTRAINT `djcelery_periodictask_crontab_id_75609bab_fk` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_periodictask_interval_id_b426ab02_fk` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of djcelery_periodictask
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of djcelery_periodictasks
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_taskstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_state_53543be4` (`state`),
  KEY `djcelery_taskstate_name_8af9eded` (`name`),
  KEY `djcelery_taskstate_tstamp_4c3f93a1` (`tstamp`),
  KEY `djcelery_taskstate_hidden_c3905e57` (`hidden`),
  KEY `djcelery_taskstate_worker_id_f7f57a05_fk` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of djcelery_taskstate
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_workerstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_last_heartbeat_4539b544` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=big5;

-- ----------------------------
-- Records of djcelery_workerstate
-- ----------------------------

-- ----------------------------
-- Table structure for industry_education
-- ----------------------------
DROP TABLE IF EXISTS `industry_education`;
CREATE TABLE `industry_education` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `education` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of industry_education
-- ----------------------------
INSERT INTO `industry_education` VALUES ('1', 'undergraduate');
INSERT INTO `industry_education` VALUES ('2', 'junior_college');
INSERT INTO `industry_education` VALUES ('3', 'technical_secondary');
INSERT INTO `industry_education` VALUES ('4', 'high_school');
INSERT INTO `industry_education` VALUES ('5', 'higher_school');
INSERT INTO `industry_education` VALUES ('6', 'primary_school');
INSERT INTO `industry_education` VALUES ('7', 'no_education');

-- ----------------------------
-- Table structure for industry_industry
-- ----------------------------
DROP TABLE IF EXISTS `industry_industry`;
CREATE TABLE `industry_industry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `work1` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of industry_industry
-- ----------------------------
INSERT INTO `industry_industry` VALUES ('1', '技术', 'PHP+数据挖掘+搜索算法+精准推荐+C+C%23+全栈工程师+.NET+Hadoop+Python+Delphi+VB+Perl+Ruby+Node.js+Go+ASP+Shell+区块链+后端开发其它移动开发HTML5+Android+iOS+WP+移动开发其它前端开发web前端+Flash+html5+JavaScript+U3D+COCOS2D-X+前端开发其它人工智能深度学习+机器学习+图像处理+图像识别+语音识别+机器视觉+算法工程师+自然语言处理测试测试工程师+自动化测试+功能测试+性能测试+测试开发+游戏测试+白盒测试+灰盒测试+黑盒测试+手机测试+硬件测试+测试经理+测试其它');
INSERT INTO `industry_industry` VALUES ('2', '产品', '产品经理+网页产品经理+移动产品经理+产品助理+数据产品经理+电商产品经理+游戏策划+产品实习生产品设计师网页产品设计师+无线产品设计师高端职位产品部经理+产品总监+游戏制作人');
INSERT INTO `industry_industry` VALUES ('3', '设计', '视觉设计师+网页设计师+Flash设计师+APP设计师+UI设计师+平面设计师+美术设计师（2D%2F3D）+广告设计师+多媒体设计师+原画师+游戏特效+游戏界面设计师+游戏场景+游戏角色+游戏动作交互设计交互设计师+无线交互设计师+网页交互设计师+硬件交互设计师用户研究数据分析师+用户研究员+游戏数值策划高端职位设计经理%2F主管+设计总监+视觉设计经理%2F主管+视觉设计总监+交互设计经理%2F主管+交互设计总监+用户研究经理%2F主管+用户研究总监');
INSERT INTO `industry_industry` VALUES ('4', '运营', '用户运营+产品运营+数据运营+内容运营+活动运营+商家运营+品类运营+游戏运营+网络推广+运营专员+网店运营+新媒体运营+海外运营+运营经理编辑副主编+内容编辑+文案策划+记者客服售前咨询+售后客服+淘宝客服+客服经理高端职位主编+运营总监+COO+客服总监');
INSERT INTO `industry_industry` VALUES ('5', '市场', '市场营销+市场策划+市场顾问+商务渠道+商业数据分析+活动策划+网络营销+海外市场+商务专员媒介%2F公关政府关系+品牌公关+广告协调+媒介投放+媒介合作+媒介顾问品牌%2F广告广告创意+广告制作+广告文案+广告投放+广告定价+广告专员+品牌合作+品牌策划+品牌专员+美术指导渠道%2F推广市场推广+渠道推广+SEO+SEM高端职位策划经理+媒介经理+市场总监+公关总监+媒介总监+创意总监');
INSERT INTO `industry_industry` VALUES ('6', '销售', '销售专员+销售顾问+销售经理+客户代表+大客户代表+客户经理+商务拓展+渠道销售+代理商销售+电话销售+广告销售+信用卡销售+保险销售+销售工程师+商务渠道+其他销售销售管理销售总监+商务总监+区域总监+城市经理+团队经理+销售VP+商务主管+其他销售管理职位');
INSERT INTO `industry_industry` VALUES ('7', '职能', '人力资源+招聘+HRBP+人事%2FHR+培训经理+薪资福利经理+绩效考核经理+员工关系行政助理+前台+行政+总助+文秘财务会计+出纳+财务+结算+税务+审计+风控法务法务+律师+专利高端职位行政总监%2F经理+财务总监%2F经理');
INSERT INTO `industry_industry` VALUES ('8', '游戏', 'H5游戏开发+小游戏开发+游戏后端开发+C%2B%2B游戏开发+FLASH+COCOS2D-X+U3D+游戏测试产品策划游戏制作人+游戏产品经理+游戏项目经理+游戏策划+剧情设计+游戏文案设计游戏动画+游戏原画+游戏界面+游戏场景+游戏角色+游戏动作+游戏动效+游戏美工运营%2F推广游戏运营+游戏编辑+游戏推广+手游推广+页游推广其他游戏主播+游戏陪练+游戏体验+电竞主持+电竞讲师');

-- ----------------------------
-- Table structure for industry_work
-- ----------------------------
DROP TABLE IF EXISTS `industry_work`;
CREATE TABLE `industry_work` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `demand` int(11) NOT NULL,
  `industry_id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `industry_work_industry_id_ccd763ac_fk_industry_industry_id` (`industry_id`),
  CONSTRAINT `industry_work_industry_id_ccd763ac_fk_industry_industry_id` FOREIGN KEY (`industry_id`) REFERENCES `industry_industry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of industry_work
-- ----------------------------
INSERT INTO `industry_work` VALUES ('9', '0', '1', 'Java');
INSERT INTO `industry_work` VALUES ('11', '0', '1', 'C++');
INSERT INTO `industry_work` VALUES ('13', '0', '1', 'Android iOS');
INSERT INTO `industry_work` VALUES ('15', '0', '1', '深度学习');
INSERT INTO `industry_work` VALUES ('16', '0', '1', '自然语言处理');
INSERT INTO `industry_work` VALUES ('23', '0', '3', '交互设计');
INSERT INTO `industry_work` VALUES ('28', '0', '4', '编辑');
INSERT INTO `industry_work` VALUES ('35', '0', '5', '政府关系');
INSERT INTO `industry_work` VALUES ('40', '0', '5', 'SEM');
INSERT INTO `industry_work` VALUES ('43', '0', '6', '销售总监');
INSERT INTO `industry_work` VALUES ('47', '0', '7', 'HR');
INSERT INTO `industry_work` VALUES ('57', '0', '1', '搜索算法');
INSERT INTO `industry_work` VALUES ('58', '0', '1', '精准推荐');
INSERT INTO `industry_work` VALUES ('59', '0', '1', 'C');
INSERT INTO `industry_work` VALUES ('60', '0', '1', 'C%23');
INSERT INTO `industry_work` VALUES ('61', '0', '1', '全栈工程师');
INSERT INTO `industry_work` VALUES ('62', '0', '1', '.NET');
INSERT INTO `industry_work` VALUES ('63', '0', '1', 'Hadoop');
INSERT INTO `industry_work` VALUES ('64', '0', '1', 'Python');
INSERT INTO `industry_work` VALUES ('65', '0', '1', 'Delphi');
INSERT INTO `industry_work` VALUES ('66', '0', '1', 'VB');
INSERT INTO `industry_work` VALUES ('67', '0', '1', 'Perl');
INSERT INTO `industry_work` VALUES ('68', '0', '1', 'Ruby');
INSERT INTO `industry_work` VALUES ('69', '0', '1', 'Node.js');
INSERT INTO `industry_work` VALUES ('70', '0', '1', 'Go');
INSERT INTO `industry_work` VALUES ('71', '0', '1', 'ASP');
INSERT INTO `industry_work` VALUES ('72', '0', '1', 'Shell');
INSERT INTO `industry_work` VALUES ('74', '0', '1', '后端开发其它移动开发HTML5');
INSERT INTO `industry_work` VALUES ('75', '0', '1', 'Android');
INSERT INTO `industry_work` VALUES ('76', '0', '1', 'iOS');
INSERT INTO `industry_work` VALUES ('77', '0', '1', 'WP');
INSERT INTO `industry_work` VALUES ('78', '0', '1', '移动开发其它前端开发web前端');
INSERT INTO `industry_work` VALUES ('79', '0', '1', 'Flash');
INSERT INTO `industry_work` VALUES ('80', '0', '1', 'html5');
INSERT INTO `industry_work` VALUES ('81', '0', '1', 'JavaScript');
INSERT INTO `industry_work` VALUES ('84', '0', '1', '前端开发其它人工智能深度学习');
INSERT INTO `industry_work` VALUES ('86', '0', '1', '图像处理');
INSERT INTO `industry_work` VALUES ('87', '0', '1', '图像识别');
INSERT INTO `industry_work` VALUES ('88', '0', '1', '语音识别');
INSERT INTO `industry_work` VALUES ('89', '0', '1', '机器视觉');
INSERT INTO `industry_work` VALUES ('90', '0', '1', '算法工程师');
INSERT INTO `industry_work` VALUES ('91', '0', '1', '自然语言处理测试测试工程师');
INSERT INTO `industry_work` VALUES ('92', '0', '1', '自动化测试');
INSERT INTO `industry_work` VALUES ('93', '0', '1', '功能测试');
INSERT INTO `industry_work` VALUES ('94', '0', '1', '性能测试');
INSERT INTO `industry_work` VALUES ('95', '0', '1', '测试开发');
INSERT INTO `industry_work` VALUES ('96', '0', '1', '游戏测试');
INSERT INTO `industry_work` VALUES ('97', '0', '1', '白盒测试');
INSERT INTO `industry_work` VALUES ('98', '0', '1', '灰盒测试');
INSERT INTO `industry_work` VALUES ('99', '0', '1', '黑盒测试');
INSERT INTO `industry_work` VALUES ('100', '0', '1', '手机测试');
INSERT INTO `industry_work` VALUES ('101', '0', '1', '硬件测试');
INSERT INTO `industry_work` VALUES ('102', '0', '1', '测试经理');
INSERT INTO `industry_work` VALUES ('103', '0', '1', '测试其它');
INSERT INTO `industry_work` VALUES ('105', '0', '2', '网页产品经理');
INSERT INTO `industry_work` VALUES ('106', '0', '2', '移动产品经理');
INSERT INTO `industry_work` VALUES ('107', '0', '2', '产品助理');
INSERT INTO `industry_work` VALUES ('109', '0', '2', '电商产品经理');
INSERT INTO `industry_work` VALUES ('111', '0', '2', '产品实习生产品设计师网页产品设计师');
INSERT INTO `industry_work` VALUES ('112', '0', '2', '无线产品设计师高端职位产品部经理');
INSERT INTO `industry_work` VALUES ('114', '0', '2', '游戏制作人');
INSERT INTO `industry_work` VALUES ('117', '0', '3', 'Flash设计师');
INSERT INTO `industry_work` VALUES ('118', '0', '3', 'APP设计师');
INSERT INTO `industry_work` VALUES ('121', '0', '3', '美术设计师（2D%2F3D）');
INSERT INTO `industry_work` VALUES ('122', '0', '3', '广告设计师');
INSERT INTO `industry_work` VALUES ('123', '0', '3', '多媒体设计师');
INSERT INTO `industry_work` VALUES ('124', '0', '3', '原画师');
INSERT INTO `industry_work` VALUES ('125', '0', '3', '游戏特效');
INSERT INTO `industry_work` VALUES ('126', '0', '3', '游戏界面设计师');
INSERT INTO `industry_work` VALUES ('129', '0', '3', '游戏动作交互设计交互设计师');
INSERT INTO `industry_work` VALUES ('130', '0', '3', '无线交互设计师');
INSERT INTO `industry_work` VALUES ('131', '0', '3', '网页交互设计师');
INSERT INTO `industry_work` VALUES ('132', '0', '3', '硬件交互设计师用户研究数据分析师');
INSERT INTO `industry_work` VALUES ('133', '0', '3', '用户研究员');
INSERT INTO `industry_work` VALUES ('134', '0', '3', '游戏数值策划高端职位设计经理%2F主管');
INSERT INTO `industry_work` VALUES ('135', '0', '3', '设计总监');
INSERT INTO `industry_work` VALUES ('136', '0', '3', '视觉设计经理%2F主管');
INSERT INTO `industry_work` VALUES ('137', '0', '3', '视觉设计总监');
INSERT INTO `industry_work` VALUES ('138', '0', '3', '交互设计经理%2F主管');
INSERT INTO `industry_work` VALUES ('139', '0', '3', '交互设计总监');
INSERT INTO `industry_work` VALUES ('140', '0', '3', '用户研究经理%2F主管');
INSERT INTO `industry_work` VALUES ('141', '0', '3', '用户研究总监');
INSERT INTO `industry_work` VALUES ('142', '0', '4', '用户运营');
INSERT INTO `industry_work` VALUES ('143', '0', '4', '产品运营');
INSERT INTO `industry_work` VALUES ('145', '0', '4', '内容运营');
INSERT INTO `industry_work` VALUES ('146', '0', '4', '活动运营');
INSERT INTO `industry_work` VALUES ('147', '0', '4', '商家运营');
INSERT INTO `industry_work` VALUES ('148', '0', '4', '品类运营');
INSERT INTO `industry_work` VALUES ('150', '0', '4', '网络推广');
INSERT INTO `industry_work` VALUES ('151', '0', '4', '运营专员');
INSERT INTO `industry_work` VALUES ('152', '0', '4', '网店运营');
INSERT INTO `industry_work` VALUES ('154', '0', '4', '海外运营');
INSERT INTO `industry_work` VALUES ('155', '0', '4', '运营经理编辑副主编');
INSERT INTO `industry_work` VALUES ('156', '0', '4', '内容编辑');
INSERT INTO `industry_work` VALUES ('157', '0', '4', '文案策划');
INSERT INTO `industry_work` VALUES ('158', '0', '4', '记者客服售前咨询');
INSERT INTO `industry_work` VALUES ('159', '0', '4', '售后客服');
INSERT INTO `industry_work` VALUES ('160', '0', '4', '淘宝客服');
INSERT INTO `industry_work` VALUES ('161', '0', '4', '客服经理高端职位主编');
INSERT INTO `industry_work` VALUES ('164', '0', '4', '客服总监');
INSERT INTO `industry_work` VALUES ('167', '0', '5', '市场顾问');
INSERT INTO `industry_work` VALUES ('169', '0', '5', '商业数据分析');
INSERT INTO `industry_work` VALUES ('170', '0', '5', '活动策划');
INSERT INTO `industry_work` VALUES ('171', '0', '5', '网络营销');
INSERT INTO `industry_work` VALUES ('172', '0', '5', '海外市场');
INSERT INTO `industry_work` VALUES ('173', '0', '5', '商务专员媒介%2F公关政府关系');
INSERT INTO `industry_work` VALUES ('174', '0', '5', '品牌公关');
INSERT INTO `industry_work` VALUES ('175', '0', '5', '广告协调');
INSERT INTO `industry_work` VALUES ('176', '0', '5', '媒介投放');
INSERT INTO `industry_work` VALUES ('177', '0', '5', '媒介合作');
INSERT INTO `industry_work` VALUES ('178', '0', '5', '媒介顾问品牌%2F广告广告创意');
INSERT INTO `industry_work` VALUES ('179', '0', '5', '广告制作');
INSERT INTO `industry_work` VALUES ('182', '0', '5', '广告定价');
INSERT INTO `industry_work` VALUES ('183', '0', '5', '广告专员');
INSERT INTO `industry_work` VALUES ('184', '0', '5', '品牌合作');
INSERT INTO `industry_work` VALUES ('185', '0', '5', '品牌策划');
INSERT INTO `industry_work` VALUES ('186', '0', '5', '品牌专员');
INSERT INTO `industry_work` VALUES ('187', '0', '5', '美术指导渠道%2F推广市场推广');
INSERT INTO `industry_work` VALUES ('188', '0', '5', '渠道推广');
INSERT INTO `industry_work` VALUES ('190', '0', '5', 'SEM高端职位策划经理');
INSERT INTO `industry_work` VALUES ('191', '0', '5', '媒介经理');
INSERT INTO `industry_work` VALUES ('192', '0', '5', '市场总监');
INSERT INTO `industry_work` VALUES ('193', '0', '5', '公关总监');
INSERT INTO `industry_work` VALUES ('194', '0', '5', '媒介总监');
INSERT INTO `industry_work` VALUES ('195', '0', '5', '创意总监');
INSERT INTO `industry_work` VALUES ('197', '0', '6', '销售顾问');
INSERT INTO `industry_work` VALUES ('199', '0', '6', '客户代表');
INSERT INTO `industry_work` VALUES ('202', '0', '6', '商务拓展');
INSERT INTO `industry_work` VALUES ('203', '0', '6', '渠道销售');
INSERT INTO `industry_work` VALUES ('204', '0', '6', '代理商销售');
INSERT INTO `industry_work` VALUES ('206', '0', '6', '广告销售');
INSERT INTO `industry_work` VALUES ('207', '0', '6', '信用卡销售');
INSERT INTO `industry_work` VALUES ('208', '0', '6', '保险销售');
INSERT INTO `industry_work` VALUES ('209', '0', '6', '销售工程师');
INSERT INTO `industry_work` VALUES ('211', '0', '6', '其他销售销售管理销售总监');
INSERT INTO `industry_work` VALUES ('212', '0', '6', '商务总监');
INSERT INTO `industry_work` VALUES ('213', '0', '6', '区域总监');
INSERT INTO `industry_work` VALUES ('214', '0', '6', '城市经理');
INSERT INTO `industry_work` VALUES ('215', '0', '6', '团队经理');
INSERT INTO `industry_work` VALUES ('216', '0', '6', '销售VP');
INSERT INTO `industry_work` VALUES ('217', '0', '6', '商务主管');
INSERT INTO `industry_work` VALUES ('218', '0', '6', '其他销售管理职位');
INSERT INTO `industry_work` VALUES ('219', '0', '7', '人力资源');
INSERT INTO `industry_work` VALUES ('220', '0', '7', '招聘');
INSERT INTO `industry_work` VALUES ('221', '0', '7', 'HRBP');
INSERT INTO `industry_work` VALUES ('222', '0', '7', '人事%2FHR');
INSERT INTO `industry_work` VALUES ('223', '0', '7', '培训经理');
INSERT INTO `industry_work` VALUES ('224', '0', '7', '薪资福利经理');
INSERT INTO `industry_work` VALUES ('225', '0', '7', '绩效考核经理');
INSERT INTO `industry_work` VALUES ('226', '0', '7', '员工关系行政助理');
INSERT INTO `industry_work` VALUES ('227', '0', '7', '前台');
INSERT INTO `industry_work` VALUES ('229', '0', '7', '总助');
INSERT INTO `industry_work` VALUES ('230', '0', '7', '文秘财务会计');
INSERT INTO `industry_work` VALUES ('231', '0', '7', '出纳');
INSERT INTO `industry_work` VALUES ('233', '0', '7', '结算');
INSERT INTO `industry_work` VALUES ('234', '0', '7', '税务');
INSERT INTO `industry_work` VALUES ('236', '0', '7', '风控法务法务');
INSERT INTO `industry_work` VALUES ('237', '0', '7', '律师');
INSERT INTO `industry_work` VALUES ('238', '0', '7', '专利高端职位行政总监%2F经理');
INSERT INTO `industry_work` VALUES ('239', '0', '7', '财务总监%2F经理');
INSERT INTO `industry_work` VALUES ('240', '0', '8', 'H5游戏开发');
INSERT INTO `industry_work` VALUES ('242', '0', '8', '游戏后端开发');
INSERT INTO `industry_work` VALUES ('243', '0', '8', 'C%2B%2B游戏开发');
INSERT INTO `industry_work` VALUES ('244', '0', '8', 'FLASH');
INSERT INTO `industry_work` VALUES ('247', '0', '8', '游戏测试产品策划游戏制作人');
INSERT INTO `industry_work` VALUES ('248', '0', '8', '游戏产品经理');
INSERT INTO `industry_work` VALUES ('249', '0', '8', '游戏项目经理');
INSERT INTO `industry_work` VALUES ('251', '0', '8', '剧情设计');
INSERT INTO `industry_work` VALUES ('252', '0', '8', '游戏文案设计游戏动画');
INSERT INTO `industry_work` VALUES ('253', '0', '8', '游戏原画');
INSERT INTO `industry_work` VALUES ('254', '0', '8', '游戏界面');
INSERT INTO `industry_work` VALUES ('257', '0', '8', '游戏动作');
INSERT INTO `industry_work` VALUES ('258', '0', '8', '游戏动效');
INSERT INTO `industry_work` VALUES ('259', '0', '8', '游戏美工运营%2F推广游戏运营');
INSERT INTO `industry_work` VALUES ('260', '0', '8', '游戏编辑');
INSERT INTO `industry_work` VALUES ('261', '0', '8', '游戏推广');
INSERT INTO `industry_work` VALUES ('262', '0', '8', '手游推广');
INSERT INTO `industry_work` VALUES ('263', '0', '8', '页游推广其他游戏主播');
INSERT INTO `industry_work` VALUES ('264', '0', '8', '游戏陪练');
INSERT INTO `industry_work` VALUES ('265', '0', '8', '游戏体验');
INSERT INTO `industry_work` VALUES ('266', '0', '8', '电竞主持');
INSERT INTO `industry_work` VALUES ('267', '0', '8', '电竞讲师');

-- ----------------------------
-- Table structure for user_record
-- ----------------------------
DROP TABLE IF EXISTS `user_record`;
CREATE TABLE `user_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `profession_id` bigint(20) NOT NULL,
  `resume_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_record_resume_id_2c205400_fk_user_resume_id` (`resume_id`),
  KEY `user_record_user_id_ce37a506_fk_user_user_id` (`user_id`),
  KEY `user_record_profession_id_49ebd05a_fk_company_profession_id` (`profession_id`),
  CONSTRAINT `user_record_profession_id_49ebd05a_fk_company_profession_id` FOREIGN KEY (`profession_id`) REFERENCES `company_profession` (`id`),
  CONSTRAINT `user_record_resume_id_2c205400_fk_user_resume_id` FOREIGN KEY (`resume_id`) REFERENCES `user_resume` (`id`),
  CONSTRAINT `user_record_user_id_ce37a506_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_record
-- ----------------------------
INSERT INTO `user_record` VALUES ('1', 'unclear', '1', '1', '1');
INSERT INTO `user_record` VALUES ('2', 'unclear', '2', '2', '2');

-- ----------------------------
-- Table structure for user_resume
-- ----------------------------
DROP TABLE IF EXISTS `user_resume`;
CREATE TABLE `user_resume` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `major` varchar(20) DEFAULT NULL,
  `wish_job` varchar(20) NOT NULL,
  `wish_city` varchar(20) NOT NULL,
  `wish_salary` varchar(20) NOT NULL,
  `identity` varchar(10) NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `education_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_resume_education_id_0fd1a6b7_fk_industry_education_id` (`education_id`),
  KEY `user_resume_user_id_96861ffd_fk_user_user_id` (`user_id`),
  CONSTRAINT `user_resume_education_id_0fd1a6b7_fk_industry_education_id` FOREIGN KEY (`education_id`) REFERENCES `industry_education` (`id`),
  CONSTRAINT `user_resume_user_id_96861ffd_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resume
-- ----------------------------
INSERT INTO `user_resume` VALUES ('1', 'lihua', 'man', '计算机', '前端工程师', '青岛', '1k-2k', 'schooling', null, '1', '1');
INSERT INTO `user_resume` VALUES ('2', 'xiaoming', 'woman', '计算机', '后端工程师', '青岛', '1k-3k', 'schooling', null, '3', '2');

-- ----------------------------
-- Table structure for user_user
-- ----------------------------
DROP TABLE IF EXISTS `user_user`;
CREATE TABLE `user_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_user
-- ----------------------------
INSERT INTO `user_user` VALUES ('1', '李华', '2660675754@qq.com');
INSERT INTO `user_user` VALUES ('2', '小明', '2222@163.com');

-- ----------------------------
-- Table structure for user_verificationcode
-- ----------------------------
DROP TABLE IF EXISTS `user_verificationcode`;
CREATE TABLE `user_verificationcode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `action` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_verificationcode
-- ----------------------------

-- ----------------------------
-- Table structure for user_wish
-- ----------------------------
DROP TABLE IF EXISTS `user_wish`;
CREATE TABLE `user_wish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `profession_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_wish_user_id_06899f4c_fk_user_user_id` (`user_id`),
  KEY `user_wish_profession_id_e66e3c04_fk_company_profession_id` (`profession_id`),
  CONSTRAINT `user_wish_profession_id_e66e3c04_fk_company_profession_id` FOREIGN KEY (`profession_id`) REFERENCES `company_profession` (`id`),
  CONSTRAINT `user_wish_user_id_06899f4c_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_wish
-- ----------------------------
INSERT INTO `user_wish` VALUES ('1', '1', '1');
INSERT INTO `user_wish` VALUES ('2', '2', '2');
