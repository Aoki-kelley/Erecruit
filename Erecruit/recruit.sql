/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50735
Source Host           : localhost:3306
Source Database       : recruit

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2022-03-06 00:02:58
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

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
  `detail` varchar(300) DEFAULT NULL,
  `applicant` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_company
-- ----------------------------
INSERT INTO `company_company` VALUES ('51', '尚德机构', '学习是一种信仰!', '0');
INSERT INTO `company_company` VALUES ('52', '薯片科技', '一站式企业服务平台，薯片集团员工6000余人，18大业态，为各大企业提供600多种服务项目。', '0');
INSERT INTO `company_company` VALUES ('53', '环球易购', '成为跨境B2C电子商务模式的领航者', '0');
INSERT INTO `company_company` VALUES ('54', '微盟', '人性化的管理， 年轻充满活力的团队， 广阔的发展前景', '0');
INSERT INTO `company_company` VALUES ('55', '金证股份', '深圳市金证科技股份有限公司成立于1998年，2003年12月24日公司股票在上海证券交易所挂牌上市。', '0');
INSERT INTO `company_company` VALUES ('56', '知网', '知识成就未来。', '0');
INSERT INTO `company_company` VALUES ('57', '天鹅到家', '让家更美好', '0');
INSERT INTO `company_company` VALUES ('58', '安硕信息（amarsoft）', '中国领先的金融资产风险管理整体解决方案提供商', '0');
INSERT INTO `company_company` VALUES ('59', '乐融集团', '互联网电视开拓者，运营家庭美好生活', '0');
INSERT INTO `company_company` VALUES ('60', '明源云', '地产生态链互联网+服务领航者', '0');
INSERT INTO `company_company` VALUES ('61', '新浪网', '知名互联网公司', '0');
INSERT INTO `company_company` VALUES ('62', '东方国信', '让数据改变工作与生活', '0');
INSERT INTO `company_company` VALUES ('63', '自如网', '加入自如，让世界变得不一样~', '0');
INSERT INTO `company_company` VALUES ('65', '美菜', '中国餐饮供应链杰出服务商', '0');
INSERT INTO `company_company` VALUES ('67', '腾讯', '用户为本，科技向善', '0');
INSERT INTO `company_company` VALUES ('69', '小米集团', '有些工作只是工作，有些工作却是你人生的使命， 那些工作会让你满怀热情、全心投入你的智慧和才能。', '0');
INSERT INTO `company_company` VALUES ('70', '网易', '以匠心，致创新', '0');
INSERT INTO `company_company` VALUES ('71', 'Shopee', '领航电商平台', '0');
INSERT INTO `company_company` VALUES ('72', '百度', '用科技让复杂的世界更简单', '0');
INSERT INTO `company_company` VALUES ('73', '北京麦田', '10000名专业经纪人的大规模集团型企业，麦田一直力争缔造卓越的房产服务组织。', '0');
INSERT INTO `company_company` VALUES ('74', '滴滴', '公司管理扁平化，技术氛围特别融洽', '0');
INSERT INTO `company_company` VALUES ('75', '北京京东世纪贸易有限公司', '科技引领生活！成为全球最值得信赖的企业！', '0');
INSERT INTO `company_company` VALUES ('76', '哔哩哔哩', 'bilibili中国年轻人聚集的文化社区', '0');
INSERT INTO `company_company` VALUES ('77', '拉勾集团', '专注互联网职业机会', '0');
INSERT INTO `company_company` VALUES ('78', '商汤科技', '专注于计算机视觉和深度学习原创技术', '0');
INSERT INTO `company_company` VALUES ('79', '贝壳', '用你的潜能，驱动“住”的无限可能', '0');
INSERT INTO `company_company` VALUES ('80', '360', '我们的核心价值观：用户至上、持续创新、当责奋斗、开放协作、不断反思、诚信正直', '0');
INSERT INTO `company_company` VALUES ('81', '微博', '微博是人们在线创作、分享和发现内容的中国领先社交媒体平台。', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

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
  `work1` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of industry_industry
-- ----------------------------
INSERT INTO `industry_industry` VALUES ('1', '技术', 'Java|PHP|C++|区块链|Android iOS|数据挖掘|深度学习|自然语言处理|机器学习');
INSERT INTO `industry_industry` VALUES ('2', '产品', '产品总监|产品经理|数据产品经理|游戏策划');
INSERT INTO `industry_industry` VALUES ('3', '设计', 'UI设计师|交互设计|网页设计师|平面设计师|视觉设计师');
INSERT INTO `industry_industry` VALUES ('4', '运营', '新媒体运营|编辑|数据运营|运营总监|COO');
INSERT INTO `industry_industry` VALUES ('5', '市场', '市场营销|市场推广|市场策划|政府关系|广告文案|广告投放|市场推广|SEO|SEM');
INSERT INTO `industry_industry` VALUES ('6', '销售', '销售专员|销售经理|销售总监|大客户代表|客户经理|电话销售');
INSERT INTO `industry_industry` VALUES ('7', '职能', 'HR|行政|财务|审计');
INSERT INTO `industry_industry` VALUES ('8', '游戏', '小游戏开发|U3D|游戏策划|游戏运营');

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of industry_work
-- ----------------------------
INSERT INTO `industry_work` VALUES ('9', '0', '1', 'Java');
INSERT INTO `industry_work` VALUES ('10', '0', '1', 'PHP');
INSERT INTO `industry_work` VALUES ('11', '0', '1', 'C++');
INSERT INTO `industry_work` VALUES ('12', '0', '1', '区块链');
INSERT INTO `industry_work` VALUES ('13', '0', '1', 'Android iOS');
INSERT INTO `industry_work` VALUES ('14', '0', '1', '数据挖掘');
INSERT INTO `industry_work` VALUES ('15', '0', '1', '深度学习');
INSERT INTO `industry_work` VALUES ('16', '0', '1', '自然语言处理');
INSERT INTO `industry_work` VALUES ('17', '0', '1', '机器学习');
INSERT INTO `industry_work` VALUES ('18', '0', '2', '产品总监');
INSERT INTO `industry_work` VALUES ('19', '0', '2', '产品经理');
INSERT INTO `industry_work` VALUES ('20', '0', '2', '数据产品经理');
INSERT INTO `industry_work` VALUES ('21', '0', '2', '游戏策划');
INSERT INTO `industry_work` VALUES ('22', '0', '3', 'UI设计师');
INSERT INTO `industry_work` VALUES ('23', '0', '3', '交互设计');
INSERT INTO `industry_work` VALUES ('24', '0', '3', '网页设计师');
INSERT INTO `industry_work` VALUES ('25', '0', '3', '平面设计师');
INSERT INTO `industry_work` VALUES ('26', '0', '3', '视觉设计师');
INSERT INTO `industry_work` VALUES ('27', '0', '4', '新媒体运营');
INSERT INTO `industry_work` VALUES ('28', '0', '4', '编辑');
INSERT INTO `industry_work` VALUES ('29', '0', '4', '数据运营');
INSERT INTO `industry_work` VALUES ('30', '0', '4', '运营总监');
INSERT INTO `industry_work` VALUES ('31', '0', '4', 'COO');
INSERT INTO `industry_work` VALUES ('32', '0', '5', '市场营销');
INSERT INTO `industry_work` VALUES ('33', '0', '5', '市场推广');
INSERT INTO `industry_work` VALUES ('34', '0', '5', '市场策划');
INSERT INTO `industry_work` VALUES ('35', '0', '5', '政府关系');
INSERT INTO `industry_work` VALUES ('36', '0', '5', '广告文案');
INSERT INTO `industry_work` VALUES ('37', '0', '5', '广告投放');
INSERT INTO `industry_work` VALUES ('38', '0', '5', '市场推广');
INSERT INTO `industry_work` VALUES ('39', '0', '5', 'SEO');
INSERT INTO `industry_work` VALUES ('40', '0', '5', 'SEM');
INSERT INTO `industry_work` VALUES ('41', '0', '6', '销售专员');
INSERT INTO `industry_work` VALUES ('42', '0', '6', '销售经理');
INSERT INTO `industry_work` VALUES ('43', '0', '6', '销售总监');
INSERT INTO `industry_work` VALUES ('44', '0', '6', '大客户代表');
INSERT INTO `industry_work` VALUES ('45', '0', '6', '客户经理');
INSERT INTO `industry_work` VALUES ('46', '0', '6', '电话销售');
INSERT INTO `industry_work` VALUES ('47', '0', '7', 'HR');
INSERT INTO `industry_work` VALUES ('48', '0', '7', '行政');
INSERT INTO `industry_work` VALUES ('49', '0', '7', '财务');
INSERT INTO `industry_work` VALUES ('50', '0', '7', '审计');
INSERT INTO `industry_work` VALUES ('51', '0', '8', '小游戏开发');
INSERT INTO `industry_work` VALUES ('52', '0', '8', 'U3D');
INSERT INTO `industry_work` VALUES ('53', '0', '8', '游戏策划');
INSERT INTO `industry_work` VALUES ('54', '0', '8', '游戏运营');

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
  `majior` varchar(15) NOT NULL,
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
