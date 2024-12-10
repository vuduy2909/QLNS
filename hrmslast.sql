-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hrms-last
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_users_user_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_users_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add client',7,'add_client'),(26,'Can change client',7,'change_client'),(27,'Can delete client',7,'delete_client'),(28,'Can view client',7,'view_client'),(29,'Can add department',8,'add_department'),(30,'Can change department',8,'change_department'),(31,'Can delete department',8,'delete_department'),(32,'Can view department',8,'view_department'),(33,'Can add employee',9,'add_employee'),(34,'Can change employee',9,'change_employee'),(35,'Can delete employee',9,'delete_employee'),(36,'Can view employee',9,'view_employee'),(37,'Can add holiday',10,'add_holiday'),(38,'Can change holiday',10,'change_holiday'),(39,'Can delete holiday',10,'delete_holiday'),(40,'Can view holiday',10,'view_holiday'),(41,'Can add attendance',11,'add_attendance'),(42,'Can change attendance',11,'change_attendance'),(43,'Can delete attendance',11,'delete_attendance'),(44,'Can view attendance',11,'view_attendance'),(45,'Can add project',12,'add_project'),(46,'Can change project',12,'change_project'),(47,'Can delete project',12,'delete_project'),(48,'Can view project',12,'view_project'),(49,'Can add project file',13,'add_projectfile'),(50,'Can change project file',13,'change_projectfile'),(51,'Can delete project file',13,'delete_projectfile'),(52,'Can view project file',13,'view_projectfile'),(53,'Can add task',14,'add_task'),(54,'Can change task',14,'change_task'),(55,'Can delete task',14,'delete_task'),(56,'Can view task',14,'view_task'),(57,'Can add leave',15,'add_leave'),(58,'Can change leave',15,'change_leave'),(59,'Can delete leave',15,'delete_leave'),(60,'Can view leave',15,'view_leave'),(61,'Can add overtime',16,'add_overtime'),(62,'Can change overtime',16,'change_overtime'),(63,'Can delete overtime',16,'delete_overtime'),(64,'Can view overtime',16,'view_overtime'),(65,'Can add job',17,'add_job'),(66,'Can change job',17,'change_job'),(67,'Can delete job',17,'delete_job'),(68,'Can view job',17,'view_job'),(69,'Can add notification',18,'add_notification'),(70,'Can change notification',18,'change_notification'),(71,'Can delete notification',18,'delete_notification'),(72,'Can view notification',18,'view_notification'),(73,'Can add user',19,'add_user'),(74,'Can change user',19,'change_user'),(75,'Can delete user',19,'delete_user'),(76,'Can view user',19,'view_user'),(77,'Can add profile',20,'add_profile'),(78,'Can change profile',20,'change_profile'),(79,'Can delete profile',20,'delete_profile'),(80,'Can view profile',20,'view_profile'),(81,'Can add email address',21,'add_emailaddress'),(82,'Can change email address',21,'change_emailaddress'),(83,'Can delete email address',21,'delete_emailaddress'),(84,'Can view email address',21,'view_emailaddress'),(85,'Can add email confirmation',22,'add_emailconfirmation'),(86,'Can change email confirmation',22,'change_emailconfirmation'),(87,'Can delete email confirmation',22,'delete_emailconfirmation'),(88,'Can view email confirmation',22,'view_emailconfirmation');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`user_id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-12-09 21:13:51.976359','1','admin@kitehrms.com',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',19,195),(2,'2024-12-09 21:14:19.298319','1','admin@kitehrms.com profile',2,'[{\"changed\": {\"fields\": [\"Date of birth\"]}}]',20,195),(3,'2024-12-09 21:39:07.125677','150','admin@gmail.com',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (21,'account','emailaddress'),(22,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(11,'employees','attendance'),(7,'employees','client'),(8,'employees','department'),(9,'employees','employee'),(10,'employees','holiday'),(12,'employees','project'),(13,'employees','projectfile'),(14,'employees','task'),(17,'jobs','job'),(15,'leaves','leave'),(16,'leaves','overtime'),(18,'notifications','notification'),(5,'sessions','session'),(6,'sites','site'),(20,'users','profile'),(19,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-29 16:08:09.553465'),(2,'contenttypes','0002_remove_content_type_name','2024-11-29 16:08:09.649938'),(3,'auth','0001_initial','2024-11-29 16:08:09.925693'),(4,'auth','0002_alter_permission_name_max_length','2024-11-29 16:08:09.988478'),(5,'auth','0003_alter_user_email_max_length','2024-11-29 16:08:09.996894'),(6,'auth','0004_alter_user_username_opts','2024-11-29 16:08:10.006979'),(7,'auth','0005_alter_user_last_login_null','2024-11-29 16:08:10.012935'),(8,'auth','0006_require_contenttypes_0002','2024-11-29 16:08:10.018985'),(9,'auth','0007_alter_validators_add_error_messages','2024-11-29 16:08:10.026987'),(10,'auth','0008_alter_user_username_max_length','2024-11-29 16:08:10.036984'),(11,'auth','0009_alter_user_last_name_max_length','2024-11-29 16:08:10.045984'),(12,'auth','0010_alter_group_name_max_length','2024-11-29 16:08:10.063038'),(13,'auth','0011_update_proxy_permissions','2024-11-29 16:08:10.072031'),(14,'auth','0012_alter_user_first_name_max_length','2024-11-29 16:08:10.080083'),(15,'users','0001_initial','2024-11-29 16:08:10.599918'),(16,'account','0001_initial','2024-11-29 16:08:10.786628'),(17,'account','0002_email_max_length','2024-11-29 16:08:10.805588'),(18,'admin','0001_initial','2024-11-29 16:08:10.941703'),(19,'admin','0002_logentry_remove_auto_add','2024-11-29 16:08:10.951703'),(20,'admin','0003_logentry_add_action_flag_choices','2024-11-29 16:08:10.960703'),(21,'jobs','0001_initial','2024-11-29 16:08:10.993956'),(22,'employees','0001_initial','2024-11-29 16:08:12.529394'),(23,'employees','0002_remove_projectfile_image_projectfile_file_type_and_more','2024-11-29 16:08:12.662395'),(24,'employees','0003_projectfile_uploaded_by','2024-11-29 16:08:12.732392'),(25,'employees','0004_projectfile_name','2024-11-29 16:08:12.767392'),(26,'employees','0005_projectfile_date_alter_projectfile_project','2024-11-29 16:08:12.812392'),(27,'employees','0006_alter_attendance_unique_together_and_more','2024-11-29 16:08:13.115442'),(28,'employees','0007_remove_project_verified','2024-11-29 16:08:13.143434'),(29,'leaves','0001_initial','2024-11-29 16:08:13.313936'),(30,'leaves','0002_overtime','2024-11-29 16:08:13.481038'),(31,'leaves','0003_alter_overtime_unique_together','2024-11-29 16:08:13.511999'),(32,'leaves','0004_alter_overtime_unique_together_and_more','2024-11-29 16:08:13.670120'),(33,'leaves','0005_alter_leave_leave_type_alter_overtime_overtime_type','2024-11-29 16:08:13.717137'),(34,'notifications','0001_initial','2024-11-29 16:08:13.926267'),(35,'notifications','0002_alter_notification__type_and_more','2024-11-29 16:08:14.004679'),(36,'sessions','0001_initial','2024-11-29 16:08:14.046604'),(37,'sites','0001_initial','2024-11-29 16:08:14.069604'),(38,'sites','0002_alter_domain_unique','2024-11-29 16:08:14.090603'),(39,'users','0002_alter_profile_date_of_birth','2024-11-29 16:08:14.102603');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4gkzwukeaq5yhf31q41uyfix9n295tge','.eJxVjMsOwiAQRf-FtSGF4enSvd9ABhikaiAp7cr479qkC93ec859sYDbWsM2aAlzZmcm2Ol3i5ge1HaQ79hunafe1mWOfFf4QQe_9kzPy-H-HVQc9Vu7JC1YpTU4UE5NshSlkgZB2hiJIhc0oHwpCT1YQi_IywiO0iShOGDvD7TuNyI:1tKerg:u4EgcmVLcljfLzu38wnJXNG8ZIXf1-RfQEpJas4ig_w','2024-12-23 21:36:00.596134'),('rx7k8fi9aigey9m8r37ldphj5n3qnt25','.eJxVjEEOgjAQRe_StWlKB2jr0j1naKYzU0FNSSisjHcXEha6_e-9_1YRt3WMW5UlTqyuqgm9uvyuCekp5UD8wHKfNc1lXaakD0WftOphZnndTvfvYMQ67jWatjM5iIXswVrXiAs9I7AnSFasd8Y3mZECQTbQkfSBWLALO3LQqs8XKCs4IA:1tKgFt:YSnGuLvfgWrpRwuQ5pGTOZ2Fn5X19cX9pf6h-n6oULg','2024-12-23 23:05:05.514644');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_attendance`
--

DROP TABLE IF EXISTS `employees_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_attendance` (
  `attendance_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `punch_in` time(6) NOT NULL,
  `punch_out` time(6) DEFAULT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`attendance_id`),
  UNIQUE KEY `id` (`id`),
  KEY `employees_attendance_employee_id_450daa06` (`employee_id`),
  CONSTRAINT `employees_attendance_employee_id_450daa06_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_attendance`
--

LOCK TABLES `employees_attendance` WRITE;
/*!40000 ALTER TABLE `employees_attendance` DISABLE KEYS */;
INSERT INTO `employees_attendance` VALUES (1,'atd0001','2022-05-22','11:50:00.000000','12:56:00.000000',17),(2,'atd0002','2022-05-22','15:34:00.000000',NULL,20),(4,'atd0004','2022-05-22','20:56:00.000000','20:58:00.000000',146),(16,'atd0016','2022-05-23','18:59:40.378000','23:23:00.000000',17),(20,'atd0020','2022-05-29','07:27:05.000000',NULL,17),(21,'atd0021','2022-06-07','19:32:28.000000',NULL,22),(22,'atd0022','2022-06-08','06:30:00.000000','21:31:30.000000',17),(25,'atd0025','2022-05-09','07:30:00.000000','17:00:00.000000',17),(26,'atd0026','2022-05-10','08:30:00.000000','15:00:00.000000',17),(27,'atd0027','2022-05-11','07:30:00.000000',NULL,17),(28,'atd0028','2022-05-12','12:30:00.000000','17:00:00.000000',17),(29,'atd0029','2022-05-13','07:30:00.000000','20:00:00.000000',17),(32,'atd0030','2022-06-09','06:30:00.000000','20:49:42.000000',17),(33,'atd0033','2022-06-10','06:30:00.000000','20:56:45.000000',17),(35,'atd0034','2022-06-06','06:30:00.000000','17:00:00.000000',17),(36,'atd0036','2022-06-07','06:30:00.000000','17:00:00.000000',17),(37,'atd0037','2022-06-13','07:00:00.000000','20:30:00.000000',17),(38,'atd0038','2022-06-14','07:00:00.000000','20:30:00.000000',17),(39,'atd0039','2022-06-15','07:00:00.000000','20:30:00.000000',17),(40,'atd0040','2022-06-16','07:00:00.000000','08:30:00.000000',17),(41,'atd0041','2022-06-17','07:00:00.000000','20:30:00.000000',17);
/*!40000 ALTER TABLE `employees_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_client`
--

DROP TABLE IF EXISTS `employees_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_client` (
  `client_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `company` varchar(255) NOT NULL,
  `position` varchar(100) NOT NULL,
  `contact_id` bigint NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `contact_id` (`contact_id`),
  CONSTRAINT `employees_client_contact_id_646151ab_fk_users_user_user_id` FOREIGN KEY (`contact_id`) REFERENCES `users_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_client`
--

LOCK TABLES `employees_client` WRITE;
/*!40000 ALTER TABLE `employees_client` DISABLE KEYS */;
INSERT INTO `employees_client` VALUES (1,'cli0001','geoform technologies','ceo',175),(2,'cli0002','young technologies','ceo',176),(3,'cli0003','amazon','ceo',177),(4,'cli0004','amazon','ceo',178),(5,'cli0005','microsoft','ceo',180),(6,'cli0006','AM & N','Chief Executive Officer',182),(7,'cli0007','MCBM','Account Manager',183),(8,'cli0008','ABC & D','Chief Executive Officer',184),(9,'cli0009','PDB','Sales Manager',185);
/*!40000 ALTER TABLE `employees_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_department`
--

DROP TABLE IF EXISTS `employees_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_department` (
  `department_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  `hod_id` bigint DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `hod_id` (`hod_id`),
  CONSTRAINT `employees_department_hod_id_37a39b77_fk_employees` FOREIGN KEY (`hod_id`) REFERENCES `employees_employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_department`
--

LOCK TABLES `employees_department` WRITE;
/*!40000 ALTER TABLE `employees_department` DISABLE KEYS */;
INSERT INTO `employees_department` VALUES (1,'dep0001','administration',19),(2,'dep0002','marketing',NULL),(16,'dep0016','labour',4),(20,'dep0020','catery',2),(21,'dep0021','culinary',8),(22,'dep0022','transportation',NULL),(24,'dep0023','security',149);
/*!40000 ALTER TABLE `employees_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_employee`
--

DROP TABLE IF EXISTS `employees_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee` (
  `employee_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `is_hr` tinyint(1) NOT NULL,
  `is_md` tinyint(1) NOT NULL,
  `date_employed` date NOT NULL,
  `date_updated` date NOT NULL,
  `department_id` bigint DEFAULT NULL,
  `job_id` bigint DEFAULT NULL,
  `supervisor_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `employees_employee_department_id_410c23c8_fk_employees` (`department_id`),
  KEY `employees_employee_job_id_92cc001d_fk_jobs_job_job_id` (`job_id`),
  KEY `employees_employee_supervisor_id_624b662d_fk_employees` (`supervisor_id`),
  CONSTRAINT `employees_employee_department_id_410c23c8_fk_employees` FOREIGN KEY (`department_id`) REFERENCES `employees_department` (`department_id`),
  CONSTRAINT `employees_employee_job_id_92cc001d_fk_jobs_job_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobs_job` (`job_id`),
  CONSTRAINT `employees_employee_supervisor_id_624b662d_fk_employees` FOREIGN KEY (`supervisor_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `employees_employee_user_id_27bed289_fk_users_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee`
--

LOCK TABLES `employees_employee` WRITE;
/*!40000 ALTER TABLE `employees_employee` DISABLE KEYS */;
INSERT INTO `employees_employee` VALUES (2,'emp0002',0,0,'2022-06-18','2022-06-18',20,18,NULL,15),(3,'emp0003',0,0,'2022-06-18','2022-06-18',2,18,NULL,16),(4,'emp0004',0,0,'2022-06-18','2022-06-18',16,5,14,17),(5,'emp0005',0,0,'2022-06-18','2022-06-18',2,18,NULL,18),(6,'emp0006',0,0,'2022-06-16','2022-06-16',2,5,NULL,19),(7,'emp0007',0,0,'2022-06-18','2022-06-18',1,18,NULL,23),(8,'emp0008',0,0,'2022-06-18','2022-06-18',21,18,NULL,24),(11,'emp0011',0,0,'2022-06-18','2022-06-18',16,18,NULL,27),(12,'emp0012',0,0,'2022-06-18','2022-06-18',2,13,NULL,28),(13,'emp0013',0,0,'2022-06-18','2022-06-18',1,18,NULL,29),(14,'emp0014',0,0,'2022-06-18','2022-06-18',2,3,NULL,30),(15,'emp0015',0,0,'2022-06-18','2022-06-18',1,18,NULL,31),(17,'emp0017',0,1,'2022-06-18','2022-06-18',16,6,NULL,33),(18,'emp0018',0,0,'2022-06-18','2022-06-18',2,18,NULL,34),(19,'emp0019',0,0,'2022-06-18','2022-06-18',1,1,NULL,35),(20,'emp0020',0,0,'2022-06-18','2022-06-18',2,12,NULL,44),(21,'emp0021',0,0,'2022-06-18','2022-06-18',24,18,NULL,45),(22,'emp0022',0,0,'2022-06-18','2022-06-18',2,18,5,46),(23,'emp0023',0,0,'2022-06-18','2022-06-18',1,18,NULL,47),(24,'emp0024',0,0,'2022-06-18','2022-06-18',2,18,NULL,48),(25,'emp0025',0,0,'2022-06-18','2022-06-18',1,4,NULL,49),(26,'emp0026',0,0,'2022-06-18','2022-06-18',2,7,NULL,50),(27,'emp0027',0,0,'2022-06-18','2022-06-18',16,18,NULL,51),(28,'emp0028',0,0,'2022-06-18','2022-06-18',2,18,NULL,52),(29,'emp0029',0,0,'2022-06-18','2022-06-18',1,18,NULL,53),(31,'emp0031',0,0,'2022-06-18','2022-06-18',1,18,NULL,55),(32,'emp0032',0,0,'2022-06-18','2022-06-18',2,3,NULL,56),(33,'emp0033',0,0,'2022-06-18','2022-06-18',16,18,NULL,57),(34,'emp0034',0,0,'2022-06-01','2022-06-01',20,5,11,58),(37,'emp0037',0,0,'2022-06-18','2022-06-18',16,18,NULL,63),(40,'emp0040',1,0,'2022-06-01','2022-06-01',1,2,NULL,67),(41,'emp0041',0,0,'2022-06-01','2022-06-01',16,7,27,69),(144,'emp0144',0,0,'2022-06-01','2022-06-01',21,3,NULL,172),(145,'emp0145',0,0,'2022-06-18','2022-06-18',16,4,NULL,173),(146,'emp0146',0,0,'2022-06-01','2022-06-01',20,3,NULL,174),(147,'emp0147',0,0,'2022-06-12','2022-06-12',22,13,NULL,190),(148,'emp0148',0,0,'2022-06-12','2022-06-12',22,7,NULL,191),(149,'emp0149',0,0,'2022-06-18','2022-06-18',24,12,21,192),(150,'emp0150',1,1,'2024-12-09','2024-12-09',1,NULL,NULL,196),(151,'emp0151',0,0,'2024-12-09','2024-12-09',24,18,NULL,197);
/*!40000 ALTER TABLE `employees_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_holiday`
--

DROP TABLE IF EXISTS `employees_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_holiday` (
  `holiday_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`holiday_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `employees_holiday_name_date_b3b11a54_uniq` (`name`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_holiday`
--

LOCK TABLES `employees_holiday` WRITE;
/*!40000 ALTER TABLE `employees_holiday` DISABLE KEYS */;
INSERT INTO `employees_holiday` VALUES (2,'hol0002','Christmas','2022-05-09'),(3,'hol0003','ramadan','2010-01-01'),(4,'hol0004','New year\'s eve','2022-05-01'),(12,'hol0005','Christmas Eve','2022-06-16');
/*!40000 ALTER TABLE `employees_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_project`
--

DROP TABLE IF EXISTS `employees_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_project` (
  `project_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `initial_cost` double NOT NULL,
  `rate` double NOT NULL,
  `priority` varchar(1) NOT NULL,
  `description` longtext,
  `completed` tinyint(1) NOT NULL,
  `client_id` bigint DEFAULT NULL,
  `created_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `employees_project_client_id_4d14a636_fk_employees` (`client_id`),
  KEY `employees_project_created_by_id_59445c61_fk_employees` (`created_by_id`),
  CONSTRAINT `employees_project_client_id_4d14a636_fk_employees` FOREIGN KEY (`client_id`) REFERENCES `employees_client` (`client_id`),
  CONSTRAINT `employees_project_created_by_id_59445c61_fk_employees` FOREIGN KEY (`created_by_id`) REFERENCES `employees_employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_project`
--

LOCK TABLES `employees_project` WRITE;
/*!40000 ALTER TABLE `employees_project` DISABLE KEYS */;
INSERT INTO `employees_project` VALUES (1,'prj0001','Hospital Administration','2022-05-24','2022-08-24',1000,10,'M','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aut sunt veniam autem hic dicta obcaecati fugiat, assumenda ratione impedit tenetur aperiam, eos distinctio fugit cumque laborum. Ea repudiandae ex inventore porro. Pariatur, vel laborum consectetur veritatis quam voluptas quos a ipsum aperiam praesentium unde iste, dolorem impedit harum! Consequatur, harum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aut sunt veniam autem hic dicta obcaecati fugiat, assumenda ratione impedit tenetur aperiam, eos distinctio fugit cumque laborum. Ea repudiandae ex inventore porro. Pariatur, vel laborum consectetur veritatis quam voluptas quos a ipsum aperiam praesentium unde iste, dolorem impedit harum! Consequatur, harum.',0,1,17),(2,'prj0002','Traffic Control','2022-05-24','2022-07-24',700,15,'M','Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aut sunt veniam autem hic dicta obcaecati fugiat, assumenda ratione impedit tenetur aperiam, eos distinctio fugit cumque laborum. Ea repudiandae ex inventore porro. Pariatur, vel laborum consectetur veritatis quam voluptas quos a ipsum aperiam praesentium unde iste, dolorem impedit harum! Consequatur, harum. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aut sunt veniam autem hic dicta obcaecati fugiat, assumenda ratione impedit tenetur aperiam, eos distinctio fugit cumque laborum. Ea repudiandae ex inventore porro. Pariatur, vel laborum consectetur veritatis quam voluptas quos a ipsum aperiam praesentium unde iste, dolorem impedit harum! Consequatur, harum.',0,2,17),(3,'prj0003','Motel Management','2022-05-15','2022-05-30',260000,20,'H','This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.This is a new description. This is a new description.',0,9,17),(4,'prj0004','MTN Technologies','2022-05-01','2022-06-30',35000,20,'H','This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project. This is the new description of the project.',0,6,17),(6,'prj0005','School Management','2022-06-13','2022-07-09',30000,20,'H','This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description. This is the project description.',0,9,17),(7,'prj0007','Warehouse Management','2022-06-12','2022-08-12',120000,300,'H','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n				quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n				consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n				cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n				proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',0,3,17);
/*!40000 ALTER TABLE `employees_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_project_leaders`
--

DROP TABLE IF EXISTS `employees_project_leaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_project_leaders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_project_leaders_project_id_employee_id_416fc776_uniq` (`project_id`,`employee_id`),
  KEY `employees_project_le_employee_id_ce674b33_fk_employees` (`employee_id`),
  CONSTRAINT `employees_project_le_employee_id_ce674b33_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `employees_project_le_project_id_d827ddaa_fk_employees` FOREIGN KEY (`project_id`) REFERENCES `employees_project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_project_leaders`
--

LOCK TABLES `employees_project_leaders` WRITE;
/*!40000 ALTER TABLE `employees_project_leaders` DISABLE KEYS */;
INSERT INTO `employees_project_leaders` VALUES (1,1,19),(2,2,3),(3,3,27),(5,4,20),(4,4,26),(7,6,20),(6,6,27),(8,7,24);
/*!40000 ALTER TABLE `employees_project_leaders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_project_team`
--

DROP TABLE IF EXISTS `employees_project_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_project_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_project_team_project_id_employee_id_49403d80_uniq` (`project_id`,`employee_id`),
  KEY `employees_project_te_employee_id_40dc44cf_fk_employees` (`employee_id`),
  CONSTRAINT `employees_project_te_employee_id_40dc44cf_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `employees_project_te_project_id_36d6b2d9_fk_employees` FOREIGN KEY (`project_id`) REFERENCES `employees_project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_project_team`
--

LOCK TABLES `employees_project_team` WRITE;
/*!40000 ALTER TABLE `employees_project_team` DISABLE KEYS */;
INSERT INTO `employees_project_team` VALUES (1,1,19),(2,1,20),(5,2,4),(6,2,24),(7,2,25),(8,2,27),(9,2,28),(3,2,32),(4,2,34),(11,3,20),(12,3,21),(10,3,27),(14,4,12),(15,4,20),(13,4,26),(17,6,12),(18,6,14),(19,6,20),(20,6,21),(21,6,25),(22,6,26),(23,6,27),(24,6,28),(16,6,37),(25,7,2),(26,7,8),(29,7,24),(27,7,41),(28,7,145);
/*!40000 ALTER TABLE `employees_project_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_projectfile`
--

DROP TABLE IF EXISTS `employees_projectfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_projectfile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `project_id` bigint NOT NULL,
  `file_type` varchar(50) NOT NULL,
  `uploaded_by_id` bigint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_projectfil_project_id_4fbc7142_fk_employees` (`project_id`),
  KEY `employees_projectfil_uploaded_by_id_c39202cd_fk_employees` (`uploaded_by_id`),
  CONSTRAINT `employees_projectfil_project_id_4fbc7142_fk_employees` FOREIGN KEY (`project_id`) REFERENCES `employees_project` (`project_id`),
  CONSTRAINT `employees_projectfil_uploaded_by_id_c39202cd_fk_employees` FOREIGN KEY (`uploaded_by_id`) REFERENCES `employees_employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_projectfile`
--

LOCK TABLES `employees_projectfile` WRITE;
/*!40000 ALTER TABLE `employees_projectfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_projectfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_task`
--

DROP TABLE IF EXISTS `employees_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_task` (
  `task_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `priority` varchar(1) NOT NULL,
  `create_date` date NOT NULL,
  `due_date` date NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `project_id` bigint NOT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `employees_task_created_by_id_be83ca84_fk_employees` (`created_by_id`),
  KEY `employees_task_project_id_d8a6fca9_fk_employees` (`project_id`),
  CONSTRAINT `employees_task_created_by_id_be83ca84_fk_employees` FOREIGN KEY (`created_by_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `employees_task_project_id_d8a6fca9_fk_employees` FOREIGN KEY (`project_id`) REFERENCES `employees_project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_task`
--

LOCK TABLES `employees_task` WRITE;
/*!40000 ALTER TABLE `employees_task` DISABLE KEYS */;
INSERT INTO `employees_task` VALUES (1,'tsk0001','Hospital Administration Task 1',NULL,'H','2022-05-31','2022-06-01',0,0,17,1),(2,'tsk0002','Hospital Administration Task 2',NULL,'M','2022-05-31','2022-06-01',0,0,17,1),(3,'tsk0003','Traffic Control Task 1',NULL,'H','2022-05-31','2022-06-07',0,0,17,2),(9,'tsk0009','Motel Management Task 1','I want this to be done this way','H','2022-06-03','2022-06-30',0,0,17,3),(10,'tsk0010','Motel management Task 2','<li className=\"odd:bg-gray-100 rounded-sm flex items-center justify-between p-2 capitalize font-medium text-gray-800 text-base md:text-lg lg:text-base\">\n							<p>initial cost:</p>\n							<p>${data.initial_cost || 0}</p>\n						</li>\n						<li className=\"odd:bg-gray-100 rounded-sm flex items-center justify-between p-2 capitalize font-medium text-gray-800 text-base md:text-lg lg:text-base\">\n							<p>initial cost:</p>\n							<p>${data.initial_cost || 0}</p>\n						</li>\n						<li className=\"odd:bg-gray-100 rounded-sm flex items-center justify-between p-2 capitalize font-medium text-gray-800 text-base md:text-lg lg:text-base\">\n							<p>initial cost:</p>\n							<p>${data.initial_cost || 0}</p>\n						</li>\n						<li className=\"odd:bg-gray-100 rounded-sm flex items-center justify-between p-2 capitalize font-medium text-gray-800 text-base md:text-lg lg:text-base\">\n							<p>initial cost:</p>\n							<p>${data.initial_cost || 0}</p>\n						</li>\n						<li className=\"odd:bg-gray-100 rounded-sm flex items-center justify-between p-2 capitalize font-medium text-gray-800 text-base md:text-lg lg:text-base\">\n							<p>initial cost:</p>\n							<p>${data.initial_cost || 0}</p>\n						</li>\n						<li className=\"odd:bg-gray-100 rounded-sm flex items-center justify-between p-2 capitalize font-medium text-gray-800 text-base md:text-lg lg:text-base\">\n							<p>initial cost:</p>\n							<p>${data.initial_cost || 0}</p>\n						</li>','H','2022-06-06','2022-06-01',0,0,17,3),(11,'tsk0011','Warehouse Management Task 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\n				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\n				quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\n				consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\n				cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\n				proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','H','2022-06-12','2022-06-01',0,0,17,7);
/*!40000 ALTER TABLE `employees_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_task_followers`
--

DROP TABLE IF EXISTS `employees_task_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_task_followers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_task_followers_task_id_employee_id_e9c179fa_uniq` (`task_id`,`employee_id`),
  KEY `employees_task_follo_employee_id_8a94fa2d_fk_employees` (`employee_id`),
  CONSTRAINT `employees_task_follo_employee_id_8a94fa2d_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `employees_task_follo_task_id_7a960cb4_fk_employees` FOREIGN KEY (`task_id`) REFERENCES `employees_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_task_followers`
--

LOCK TABLES `employees_task_followers` WRITE;
/*!40000 ALTER TABLE `employees_task_followers` DISABLE KEYS */;
INSERT INTO `employees_task_followers` VALUES (1,1,2),(2,1,3),(3,1,4),(4,1,6),(5,2,2),(6,2,4),(8,3,4),(7,3,25),(10,9,20),(11,9,21),(9,9,27),(13,10,20),(14,10,21),(12,10,27),(16,11,2),(15,11,24);
/*!40000 ALTER TABLE `employees_task_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_task_leaders`
--

DROP TABLE IF EXISTS `employees_task_leaders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_task_leaders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `task_id` bigint NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_task_leaders_task_id_employee_id_9fb685eb_uniq` (`task_id`,`employee_id`),
  KEY `employees_task_leade_employee_id_ddcf190f_fk_employees` (`employee_id`),
  CONSTRAINT `employees_task_leade_employee_id_ddcf190f_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `employees_task_leade_task_id_e29a4945_fk_employees` FOREIGN KEY (`task_id`) REFERENCES `employees_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_task_leaders`
--

LOCK TABLES `employees_task_leaders` WRITE;
/*!40000 ALTER TABLE `employees_task_leaders` DISABLE KEYS */;
INSERT INTO `employees_task_leaders` VALUES (1,1,3),(2,3,25),(3,9,20),(4,9,21),(5,10,20);
/*!40000 ALTER TABLE `employees_task_leaders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_job`
--

DROP TABLE IF EXISTS `jobs_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_job`
--

LOCK TABLES `jobs_job` WRITE;
/*!40000 ALTER TABLE `jobs_job` DISABLE KEYS */;
INSERT INTO `jobs_job` VALUES (1,'job0001','IT specialist'),(2,'job0002','HR Manager'),(3,'job0003','accountant'),(4,'job0004','engineer'),(5,'job0005','cater'),(6,'job0006','managing director'),(7,'job0007','catery'),(12,'job0012','culinary'),(13,'job0013','account manager'),(18,'job0014','worker');
/*!40000 ALTER TABLE `jobs_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves_leave`
--

DROP TABLE IF EXISTS `leaves_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves_leave` (
  `leave_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(10) NOT NULL,
  `leave_type` varchar(3) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` longtext NOT NULL,
  `a_s` varchar(1) NOT NULL,
  `a_hod` varchar(1) NOT NULL,
  `a_hr` varchar(1) NOT NULL,
  `a_md` varchar(1) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `date_requested` datetime(6) NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`leave_id`),
  UNIQUE KEY `id` (`id`),
  KEY `leaves_leave_created_by_id_b0033dd7_fk_employees` (`created_by_id`),
  KEY `leaves_leave_employee_id_4949fe61_fk_employees` (`employee_id`),
  CONSTRAINT `leaves_leave_created_by_id_b0033dd7_fk_employees` FOREIGN KEY (`created_by_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `leaves_leave_employee_id_4949fe61_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves_leave`
--

LOCK TABLES `leaves_leave` WRITE;
/*!40000 ALTER TABLE `leaves_leave` DISABLE KEYS */;
INSERT INTO `leaves_leave` VALUES (47,'lve0047','C','2022-03-26','2022-03-27','This is a test leave for sending emails','D','P','P','P','2022-06-01 18:51:35.885000','2022-03-26 02:59:00.210000',22,22),(48,'lve0048','C','2022-03-26','2022-03-27',', employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True','A','D','P','P','2022-06-01 18:51:36.335000','2022-03-26 03:04:28.900000',22,22),(49,'lve0049','C','2022-03-26','2022-03-27',', employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True','A','A','D','P','2022-06-01 18:51:37.341000','2022-03-26 03:06:42.427000',22,22),(50,'lve0050','C','2022-03-26','2022-03-27',', employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True','A','A','A','D','2022-06-01 18:51:38.559000','2022-03-26 03:09:09.326000',22,22),(51,'lve0051','C','2022-03-26','2022-03-27','sgsbgsdgs, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True, employee__is_hr=True','A','A','A','A','2022-06-01 18:51:39.020000','2022-03-26 03:15:40.049000',22,22),(52,'lve0052','C','2022-03-26','2022-03-27','Test','N','N','N','D','2022-06-01 18:51:39.479000','2022-03-26 03:30:50.410000',40,40),(53,'lve0053','C','2022-03-26','2022-03-27','Test','N','N','N','A','2022-06-01 18:51:39.717000','2022-03-26 03:32:32.341000',17,40),(54,'lve0054','C','2022-03-26','2022-03-27','Test','N','N','N','A','2022-06-01 18:51:40.068000','2022-03-26 03:35:00.192000',17,8),(55,'lve0055','C','2022-03-26','2022-03-27','Test','N','N','N','A','2022-06-01 18:51:40.317000','2022-03-26 03:36:43.974000',17,18),(56,'lve0056','C','2022-03-26','2022-03-27','Test','N','N','N','A','2022-06-01 18:51:40.852000','2022-03-26 03:37:25.715000',17,31),(57,'lve0057','C','2022-03-26','2022-03-27','Test','N','N','N','A','2022-06-01 18:51:41.426000','2022-03-26 03:42:28.831000',17,23),(58,'lve0058','C','2022-03-26','2022-03-27','Test','N','N','N','A','2022-06-01 18:51:41.856000','2022-03-26 03:44:13.569000',17,41),(59,'lve0059','C','2022-03-26','2022-03-27','nn','N','N','N','A','2022-06-01 18:51:42.599000','2022-03-26 03:46:05.538000',17,4),(60,'lve0060','C','2022-03-26','2022-03-27','jj','N','N','N','A','2022-06-01 18:51:42.988000','2022-03-26 03:47:22.945000',17,14),(61,'lve0061','C','2022-03-29','2022-03-30','Testing leaves bro','N','N','N','A','2022-06-01 18:51:43.408000','2022-03-29 22:54:54.202000',40,40),(62,'lve0062','C','2022-04-02','2022-04-03','Just Doing Some Tests','N','N','N','A','2022-06-01 18:51:43.988000','2022-04-02 20:57:53.725000',40,40),(63,'lve0063','C','2022-04-03','2022-04-04','Testing Testing One Two  Shay','N','N','A','A','2022-06-01 18:51:44.342000','2022-04-03 01:32:47.539000',20,20),(64,'lve0064','C','2022-04-05','2022-04-06','Testing Again','N','N','P','P','2022-06-01 18:51:44.558000','2022-04-05 19:54:19.117000',20,20),(66,'lve0066','C','2022-05-15','2022-05-16','This is not for you','N','N','N','A','2022-06-01 18:51:44.737000','2022-05-15 21:36:01.815000',17,17),(67,'lve0067','M','2022-05-16','2022-05-24','Testing Leave Request Again','N','N','N','A','2022-06-01 18:51:44.992000','2022-05-16 20:31:10.393000',17,17),(68,'lve0068','C','2022-05-18','2022-05-19','Testing My Backend','N','N','N','A','2022-06-01 18:51:45.344000','2022-05-18 15:48:19.414000',17,146),(70,'lve0069','C','2022-06-08','2022-06-09','abc','N','N','N','A','2022-06-08 01:17:36.925000','2022-06-08 01:17:36.925000',17,20),(71,'lve0071','C','2022-06-13','2022-06-14','asdfghjkjkl;','N','N','N','A','2022-06-13 19:11:19.342000','2022-06-13 19:11:19.343000',17,17),(81,'lve0072','C','2022-06-30','2022-07-10','qwert','N','N','N','A','2022-06-16 01:49:58.096000','2022-06-16 01:49:58.096000',17,17),(82,'lve0082','C','2022-08-06','2022-08-26','Just for test','N','N','N','A','2022-06-16 04:15:40.522000','2022-06-16 04:15:40.522000',17,17),(83,'lve0083','C','2022-09-09','2022-09-10','Just fir anothet ytrtr','N','N','N','A','2022-06-16 04:16:14.611000','2022-06-16 04:16:14.611000',17,17),(84,'lve0084','C','2022-06-17','2022-06-18','Just Testing','A','P','P','P','2022-06-17 19:49:01.059000','2022-06-17 19:48:07.842000',22,22);
/*!40000 ALTER TABLE `leaves_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves_overtime`
--

DROP TABLE IF EXISTS `leaves_overtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves_overtime` (
  `overtime_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(10) NOT NULL,
  `overtime_type` varchar(3) NOT NULL,
  `date` date NOT NULL,
  `hours` int NOT NULL,
  `reason` longtext NOT NULL,
  `a_s` varchar(1) NOT NULL,
  `a_hod` varchar(1) NOT NULL,
  `a_hr` varchar(1) NOT NULL,
  `a_md` varchar(1) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `date_requested` datetime(6) NOT NULL,
  `created_by_id` bigint DEFAULT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`overtime_id`),
  UNIQUE KEY `id` (`id`),
  KEY `leaves_overtime_created_by_id_c1ada1d2_fk_employees` (`created_by_id`),
  KEY `leaves_overtime_employee_id_6eb2a19e` (`employee_id`),
  CONSTRAINT `leaves_overtime_created_by_id_c1ada1d2_fk_employees` FOREIGN KEY (`created_by_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `leaves_overtime_employee_id_6eb2a19e_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves_overtime`
--

LOCK TABLES `leaves_overtime` WRITE;
/*!40000 ALTER TABLE `leaves_overtime` DISABLE KEYS */;
INSERT INTO `leaves_overtime` VALUES (2,'ovt0001','V','2022-06-07',2,'Just for swag','N','N','N','A','2022-06-13 19:16:55.893000','2022-06-07 18:46:51.253000',17,17),(10,'ovt0003','V','2022-06-07',2,'Testing email sending','A','A','A','A','2022-06-13 19:16:56.175000','2022-06-07 19:45:31.736000',22,22),(11,'ovt0011','C','2022-06-09',2,'Just for swag','N','N','N','A','2022-06-13 19:16:56.456000','2022-06-08 00:32:25.623000',17,17),(12,'ovt0012','C','2022-06-08',2,'Just for swag','N','N','N','A','2022-06-13 19:16:56.703000','2022-06-08 00:34:14.094000',17,17),(13,'ovt0013','C','2022-06-10',2,'Just for swag','N','N','N','A','2022-06-13 19:16:56.922000','2022-06-08 00:34:27.663000',17,17),(14,'ovt0014','C','2022-06-25',2,'Just for swag','N','N','N','A','2022-06-13 19:16:57.266000','2022-06-08 00:41:28.153000',17,17),(16,'ovt0016','C','2022-06-08',2,'Just for swag','N','N','N','A','2022-06-13 19:16:57.531000','2022-06-08 01:30:57.595000',17,37),(19,'ovt0019','V','2022-05-13',2,'Just for swag','P','P','P','P','2022-06-13 19:16:58.495000','2022-06-09 03:31:36.395000',17,17),(20,'ovt0020','C','2022-06-17',2,'Let\'s see what i get','N','N','N','A','2022-06-13 19:16:58.727000','2022-06-10 19:45:45.954000',17,17),(21,'ovt0021','V','2022-06-24',3,'Just for Test','N','N','N','A','2022-06-16 04:07:57.743000','2022-06-16 04:07:57.743000',17,17);
/*!40000 ALTER TABLE `leaves_overtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_notification`
--

DROP TABLE IF EXISTS `notifications_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `_type` varchar(1) NOT NULL,
  `message` longtext NOT NULL,
  `message_id` varchar(10) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `recipient_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifi_recipient_id_d055f3f0_fk_employees` (`recipient_id`),
  KEY `notifications_notifi_sender_id_feea9ca3_fk_employees` (`sender_id`),
  CONSTRAINT `notifications_notifi_recipient_id_d055f3f0_fk_employees` FOREIGN KEY (`recipient_id`) REFERENCES `employees_employee` (`employee_id`),
  CONSTRAINT `notifications_notifi_sender_id_feea9ca3_fk_employees` FOREIGN KEY (`sender_id`) REFERENCES `employees_employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_notification`
--

LOCK TABLES `notifications_notification` WRITE;
/*!40000 ALTER TABLE `notifications_notification` DISABLE KEYS */;
INSERT INTO `notifications_notification` VALUES (1,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',1,'2022-06-07 19:38:50.875000',5,22),(2,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',1,'2022-06-07 19:39:42.636000',5,22),(3,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',1,'2022-06-07 19:40:36.931000',5,22),(4,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',1,'2022-06-07 19:42:15.338000',5,22),(5,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',1,'2022-06-07 19:44:10.036000',5,22),(6,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',1,'2022-06-07 19:45:31.984000',5,22),(7,'O','June Doe the/your Supervisor denied your request for overtime.','ovt0003',0,'2022-06-07 19:54:27.580000',22,5),(8,'O','June Doe the/your Supervisor denied your request for overtime.','ovt0003',0,'2022-06-07 19:56:08.640000',22,5),(9,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',0,'2022-06-07 19:56:59.057000',20,22),(10,'O','Angel Damien the Head Of Department denied your request for overtime.','ovt0003',0,'2022-06-07 19:58:28.922000',22,20),(11,'O','KRILLIN BALDILOCKS sent a request for overtime.','ovt0003',0,'2022-06-07 19:59:25.400000',40,22),(12,'O','Test User the Human Resource Manager denied your request for overtime.','ovt0003',0,'2022-06-07 20:01:18.839000',22,40),(14,'O','Gray Yeon the Managing Director approved your request for overtime.','ovt0003',0,'2022-06-07 20:03:20.047000',22,17),(15,'L','Gray Yeon the Managing Director approved your request for a leave.','lve0069',0,'2022-06-08 01:17:37.509000',20,17),(16,'L','Gray Yeon the Managing Director approved your request for a leave.','ovt0015',0,'2022-06-08 01:28:46.941000',NULL,17),(17,'L','Gray Yeon the Managing Director approved your request for a leave.','ovt0016',0,'2022-06-08 01:30:58.238000',37,17),(18,'L','Gray Yeon the Managing Director approved your request for a leave.','ovt0017',0,'2022-06-08 01:35:41.056000',NULL,17),(24,'L','KRILLIN BALDILOCKS sent a request for leave','lve0084',1,'2022-06-17 19:48:08.190000',5,22),(25,'L','KRILLIN BALDILOCKS sent a request for leave','lve0084',0,'2022-06-17 19:49:01.580000',NULL,22);
/*!40000 ALTER TABLE `notifications_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profile` (
  `profile_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `image` varchar(100) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `address` longtext,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `date_updated` datetime(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_users_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,'ple0001','images/users/profile/user-4.jpg','M','','2024-12-09',NULL,NULL,NULL,'2024-12-09 21:14:19.297343','2022-06-19 15:54:18.174000',1),(2,'ple0002','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:07.539000','2022-06-19 15:54:18.205000',15),(3,'ple0003','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:19.002000','2022-06-19 15:54:18.236000',16),(4,'ple0004','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:19.189000','2022-06-19 15:54:18.252000',17),(5,'ple0005','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:19.377000','2022-06-19 15:54:18.283000',18),(6,'ple0006','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:07.852000','2022-06-19 15:54:18.299000',19),(7,'ple0007','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:08.102000','2022-06-19 15:54:18.330000',23),(8,'ple0008','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:08.320000','2022-06-19 15:54:18.346000',24),(9,'ple0009','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:08.539000','2022-06-19 15:54:18.377000',27),(10,'ple0010','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:08.824000','2022-06-19 15:54:18.393000',28),(11,'ple0011','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:09.120000','2022-06-19 15:54:18.424000',29),(12,'ple0012','images/users/profile/user-1.jpg','F','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:05:24.239000','2022-06-19 15:54:18.439000',30),(13,'ple0013','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:09.480000','2022-06-19 15:54:18.471000',31),(14,'ple0014','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:09.808000','2022-06-19 15:54:18.486000',33),(15,'ple0015','images/users/profile/user-5.jpg','F','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:07:54.072000','2022-06-19 15:54:18.517000',34),(16,'ple0016','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:10.120000','2022-06-19 15:54:18.533000',35),(17,'ple0017','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:10.402000','2022-06-19 15:54:18.564000',44),(18,'ple0018','images/users/profile/user-11.jpg','M','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:04:52.882000','2022-06-19 15:54:18.580000',45),(19,'ple0019','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:10.558000','2022-06-19 15:54:18.611000',46),(20,'ple0020','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:10.714000','2022-06-19 15:54:18.627000',47),(21,'ple0021','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:10.933000','2022-06-19 15:54:18.658000',48),(22,'ple0022','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:11.402000','2022-06-19 15:54:18.674000',49),(23,'ple0023','images/users/profile/user-3.jpg','F','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:47:51.595000','2022-06-19 15:54:18.705000',50),(24,'ple0024','images/users/profile/user-6.jpg','M','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:03:14.769000','2022-06-19 15:54:18.721000',51),(25,'ple0025','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:11.745000','2022-06-19 15:54:18.752000',52),(26,'ple0026','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:12.042000','2022-06-19 15:54:18.768000',53),(27,'ple0027','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:12.277000','2022-06-19 15:54:18.799000',54),(28,'ple0028','images/users/profile/user-7.jpg','F','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:08:25.967000','2022-06-19 15:54:18.814000',55),(29,'ple0029','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:19.611000','2022-06-19 15:54:18.846000',56),(30,'ple0030','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:12.667000','2022-06-19 15:54:18.861000',57),(31,'ple0031','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:12.980000','2022-06-19 15:54:18.892000',58),(32,'ple0032','images/users/profile/user-10.jpg','M','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:04:16.971000','2022-06-19 15:54:18.908000',63),(33,'ple0033','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:13.183000','2022-06-19 15:54:18.940000',67),(34,'ple0034','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:13.542000','2022-06-19 15:54:18.955000',68),(35,'ple0035','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:13.917000','2022-06-19 15:54:18.986000',69),(36,'ple0036','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:14.230000','2022-06-19 15:54:19.002000',172),(37,'ple0037','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:14.542000','2022-06-19 15:54:19.033000',173),(38,'ple0038','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:14.808000','2022-06-19 15:54:19.049000',174),(39,'ple0039','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:15.105000','2022-06-19 15:54:19.080000',175),(40,'ple0040','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:19.767000','2022-06-19 15:54:19.096000',176),(41,'ple0041','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:20.064000','2022-06-19 15:54:19.127000',177),(42,'ple0042','images/users/profile/user-2.jpg','M','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:02:21.428000','2022-06-19 15:54:19.142000',178),(43,'ple0043','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:15.402000','2022-06-19 15:54:19.174000',180),(44,'ple0044','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:15.683000','2022-06-19 15:54:19.205000',182),(45,'ple0045','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:20.455000','2022-06-19 15:54:19.221000',183),(46,'ple0046','images/users/profile/user-9.jpg','F','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:09:29.043000','2022-06-19 15:54:19.252000',184),(47,'ple0047','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:15.855000','2022-06-19 15:54:19.267000',185),(48,'ple0048','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:16.136000','2022-06-19 15:54:19.299000',186),(49,'ple0049','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:16.417000','2022-06-19 15:54:19.315000',190),(50,'ple0050','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:16.620000','2022-06-19 15:54:19.346000',191),(51,'ple0051','images/users/profile/user-8.jpg','M','','2022-06-19',NULL,NULL,NULL,'2022-06-19 16:03:43.736000','2022-06-19 15:54:19.361000',192),(52,'ple0052','images/users/profile/user-6.jpg','M',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:53:17.011000','2022-06-19 15:54:19.392000',193),(53,'ple0053','images/users/profile/user-5.jpg','F',NULL,'2022-06-19',NULL,NULL,NULL,'2022-06-19 16:51:20.814000','2022-06-19 15:54:19.408000',194),(54,'ple0054','images/users/profile/default.png','M',NULL,'2024-12-09',NULL,NULL,NULL,'2024-12-09 21:11:26.136813','2024-12-09 21:11:26.136813',195),(55,'ple0055','images/users/profile/chill-guy-ttc-1732421724981667208220_S93L8kC_aBPGuc4.webp','M','Đà Nẵng','2002-11-03','0702623755','Is active','Đà Nẵng','2024-12-09 23:06:21.040139','2024-12-09 21:38:33.529343',196),(56,'ple0056','images/users/profile/chill-guy-ttc-1732421724981667208220_VniAGNw.webp','M','Đà Nẵng','2002-02-05','0702623755','Is active','Đà Nẵng','2024-12-09 23:00:14.520372','2024-12-09 23:00:14.240706',197);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `id` varchar(7) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES ('pbkdf2_sha256$320000$hQcHnd6nXs4SUngO1LxTlf$P/+0+449X4mfkhYx1uEZnB1t7rQ6OVgO8vQkQiDFgpE=','2024-12-09 21:36:05.782298',1,1,'usr0001','admin@kitehrms.com','admin','kite',1,1,'2022-01-30 10:04:45.257000'),('pbkdf2_sha256$216000$tqGMKaZgA86D$tBzpNmRJyZC85jiUnJOtbY4LEWATsvApicoHNkwUW9k=',NULL,0,15,'usr0015','johndoe@kitehrms.com','John','Doe',1,0,'2022-02-02 19:09:08.111000'),('pbkdf2_sha256$216000$9dGT2kpNr3lN$SUYHZbAScX5dRk0OBalv66qkw/HIYW5SAyTwioL9/BI=','2022-02-22 14:11:00.389000',0,16,'usr0016','janedoe@kitehrms.com','Jane','Doe',1,0,'2022-02-02 19:12:28.848000'),('pbkdf2_sha256$216000$2y4ctoFmTqal$h7b8xIMsTHNkJW6ctoKDIW8mfcbSS93nxQaPe6jn53Y=',NULL,0,17,'usr0017','jilldoe@kitehrms.com','Jill','Doe',1,0,'2022-02-02 19:19:41.461000'),('pbkdf2_sha256$320000$fuPo4PrOIUizv2ojwMaDsc$+xlSWql7fhUZSLDN8cL6aSkJ2IWdJrdVFfvkisCa8VM=','2022-06-17 19:48:35.215000',0,18,'usr0018','supervisor@kitehrms.com','June','Doe',1,0,'2022-02-02 19:20:48.053000'),('pbkdf2_sha256$216000$S5yXSC6mqCvo$WC/tx8A7rFJmEoo9YyaPQgHzTv7d48WABoawTniEU5U=',NULL,0,19,'usr0019','jamesdoe@kitehrms.com','James','Doe',1,0,'2022-02-02 19:25:46.515000'),('pbkdf2_sha256$216000$Ab0LMuadSZRd$ti7yMNwC/WAvEBsyhAE4q4SH/tFzFDLsSzolgNuUqNQ=',NULL,0,23,'usr0023','jamesjohn@kitehrms.com','James','John',1,0,'2022-02-03 18:58:39.343000'),('pbkdf2_sha256$216000$ZlRPXbOcjVDd$DzXWNCMNtxyPI4d9W9Oywru1YlaSKRnGPX0FLe5spxI=',NULL,0,24,'usr0024','johnbird@kitehrms.com','John','Bird',1,0,'2022-02-03 19:39:28.919000'),('pbkdf2_sha256$216000$fxWRgpiyjl0D$DotBZl12bdg+MJ8bN7NMDpecpgHgMGH5LVwbWMDlblM=',NULL,0,27,'usr0027','painagato@kitehrms.com','Pain','Nagato',1,1,'2022-02-03 21:24:58.721000'),('pbkdf2_sha256$216000$mTyl1TuIJqxZ$FwZ0jQnzZFF3mo2AH4G87Jw1sX0q8JDka/nGFG9eUJE=',NULL,0,28,'usr0028','erenjaeger@kitehrms.com','Eren','Jaeger',1,0,'2022-02-03 21:27:22.965000'),('pbkdf2_sha256$216000$XC2E76r1JgVY$Hg4OqivWC96BydLbsvTisPyV3yMIRaIGqyScOnjehtY=',NULL,0,29,'usr0029','randomguy@kitehrms.com','Random','Guy',1,0,'2022-02-03 21:30:08.644000'),('pbkdf2_sha256$216000$rJx6H1yCtlgj$PD1fKaPFpsysLTfnW3v5rvPvdULrewLLVgZt5RVbMjE=',NULL,0,30,'usr0030','emma@kitehrms.com','Emma','Promise',1,1,'2022-02-03 21:34:59.397000'),('pbkdf2_sha256$216000$43K4OmZp0yEH$3XnZmZOuQ9qPAKZkrMefn0OMzAPAXrPLhx1lOMGPtZQ=',NULL,0,31,'usr0031','goku@kitehrms.com','Goku','Saiyan',1,0,'2022-02-03 21:36:27.082000'),('pbkdf2_sha256$320000$ojCdHCdgWw6xCqcfKMg14p$f/8nuvrAU55ao2qS3PkaEwageW7q+hmOee3r8v6Oi2w=','2022-06-19 16:01:30.139000',1,33,'usr0033','md@kitehrms.com','Blue','Yeon',1,1,'2022-02-04 21:38:44.150000'),('pbkdf2_sha256$216000$b1HAmZCuy2xa$DRbmfwx1Bo4GYXgVtkqZo31ejUdJGdn6pIbhjWJC1cE=',NULL,0,34,'usr0034','hinatahyuga@kitehrms.com','hinata','hyuga',0,0,'2022-02-04 21:45:50.474000'),('pbkdf2_sha256$216000$R1PcDmV3q59t$pjCiNPH/zmNFJj9ziApkyULdAlbHFRzuLoqIN3Jg0IA=',NULL,0,35,'usr0035','gabrieljohnson@kitehrms.com','Gabriel','Johnson',1,0,'2022-02-05 18:52:29.065000'),('pbkdf2_sha256$320000$0BtMrbhM49rmH2xuyGFXqz$mn9WhVVPx4/+GLh7Lz3K1lib08cUcQORsBUKYiT9B78=','2022-06-07 19:57:48.270000',0,44,'usr0044','hod@kitehrms.com','Angel','Damien',1,1,'2022-02-05 20:48:39.528000'),('pbkdf2_sha256$216000$RU0N15dz94N5$NQm9zx3WMFpdjyJDQdCpZ5ZwqSU2QXOVccbPPK8qgAw=','2022-02-16 14:21:36.573000',0,45,'usr0045','davebond@kitehrms.com','Dave','Bond',1,0,'2022-02-05 20:57:27.800000'),('pbkdf2_sha256$320000$3ItqYAsd8ecH91q9TcrjAX$sbAGxePu2sX0KcZ7dDTMU5JkgsX7VJEOako1hd9BBRQ=','2022-06-17 19:47:29.600000',0,46,'usr0046','employee@kitehrms.com','Krillin','Baldilocks',1,0,'2022-02-05 21:05:47.870000'),('pbkdf2_sha256$216000$JbVLnDO9uLgY$xmGR19ZVVZa/UY6u6HJoADap2PhKn23MjZtyvhefIxE=',NULL,0,47,'usr0047','good@kitehrms.com','Jameyjay','Goodboy',0,0,'2022-02-05 21:15:56.815000'),('pbkdf2_sha256$216000$MaFG1rMoC50A$h0zEgeilWLR3GpNmNinLJg1u5TSitTTRTZXJXol+U4E=',NULL,0,48,'usr0048','johncameron@kitehrms.com','John','Cameron',1,0,'2022-02-05 21:24:52.851000'),('pbkdf2_sha256$216000$0Vp1I1hmFfnB$F4QDfag1Mi7HAsX3fnjgYE0ZivhH7koGGrGE2qvgnQU=',NULL,0,49,'usr0049','gabedaniel@kitehrms.com','Gabe','Daniel',1,0,'2022-02-06 11:55:06.041000'),('pbkdf2_sha256$216000$anS160nvYd7T$L1tCzwlESVgreGVDyAmbeZsZHiSTKG7Xgs8vU9XvGRI=',NULL,0,50,'usr0050','fionakingscrown@kitehrms.com','Fiona','Kingscrown',1,0,'2022-02-06 11:57:58.821000'),('pbkdf2_sha256$216000$2LF5tOiuJTHV$CRDpEftejLNoyNhCdqaPBU+IK4w1iGjBjEW4lF10m58=',NULL,0,51,'usr0051','austinrockfeller@kitehrms.com','Austin','Rockfellter',1,0,'2022-02-06 12:15:28.129000'),('pbkdf2_sha256$216000$OV6ZCsQX2rfO$srNF6QcY86nafweHgcUXQOs0kM0++nar6V9N+Uajqis=',NULL,0,52,'usr0052','gabet@kitehrms.com','Gabe','Daniel',1,0,'2022-02-06 18:33:04.034000'),('pbkdf2_sha256$216000$JovpDpBaDUdq$e7VC4AvKhTJrO+vr97pojglNFkn8XJzFAmty6nq3XEA=',NULL,0,53,'usr0053','gabe@kitehrms.com','Gabe','Daniel',1,0,'2022-02-06 18:34:45.140000'),('pbkdf2_sha256$216000$5W6dvDODXjal$jUatXH791gF+big7KUtsBTBLvsSpYzfUvEz5lh+4YLA=',NULL,0,54,'usr0054','gabeey@kitehrms.com','Gabe','Daniel',1,0,'2022-02-06 18:36:30.792000'),('pbkdf2_sha256$216000$6WxLtUKVOmCN$Jagw8pnq7QEP7NmFm/RsEcUWE5SAy2tzCT4ahUPPFjA=',NULL,0,55,'usr0055','gabi@kitehrms.com','Gabe','Daniel',0,0,'2022-02-06 18:39:39.339000'),('pbkdf2_sha256$216000$EwuWCsDd6Ils$78YbfE7iQIhu59+678RtboJMzHnAW1Wo9r7S2FjjYxU=',NULL,0,56,'usr0056','jenniferanderson@kitehrms.com','Jennifer','Anderson',1,0,'2022-02-07 18:47:04.623000'),('pbkdf2_sha256$216000$YHEipb0P0m7M$SOJVSxhhKruP6ziarOfylXYIZ561rDgD/L78z68lCFM=',NULL,0,57,'usr0057','grayjames@kitehrms.com','Gray','James',1,0,'2022-02-07 20:18:29.537000'),('pbkdf2_sha256$320000$w01jpZpjKFycPFeJFJIlXi$8U9cv5DqIE0NgwomxRdUJXN5DboqofvRnJUhaSavIMw=','2022-03-25 15:14:50.297000',0,58,'usr0058','mark@kitehrms.com','Mark','Example',1,0,'2022-02-08 12:55:19.957000'),('pbkdf2_sha256$216000$It3YpWHFZi9o$9OXxGRUvxHfe46oKbnDTGmc0vrVTs6h/++2732OhAF8=',NULL,0,63,'usr0063','billyjames@kitehrms.com','Billy','JAmes',1,0,'2022-02-08 17:53:54.773000'),('pbkdf2_sha256$320000$IA5awRxngVCJtvLnosdnGW$LDJsSwks99J72n3z0fM4Eb6Vx3jL4cAhH9YnLMj/X+0=','2022-06-13 20:15:42.674000',0,67,'usr0067','hr@kitehrms.com','Test','User',1,1,'2022-03-03 19:43:22.461000'),('',NULL,0,68,'usr0068','testing@kitehrms.com','test','kite',1,0,'2022-03-17 19:14:52.705000'),('pbkdf2_sha256$320000$VhdrssDiU9R39M5D6DhGvx$ZZQpCf5GoTW/Xx4m9T6rnb/pi7Xoo+OCANLgYAPKI24=',NULL,0,69,'usr0069','johnbrew@kitehrms.com','John','Brew',1,0,'2022-03-22 13:26:28.686000'),('pbkdf2_sha256$320000$tOvKHHgFeMswsvUK89xlRu$yloV4wOt8KQYFd2s2FJ2IPBckXRanhNpRCw1tV2kIH4=',NULL,0,172,'usr0172','johndoe13@kitehrms.com','Johnson','Doeson',1,0,'2022-05-17 19:55:36.544000'),('pbkdf2_sha256$320000$ERCuDUsXTr9dXsVQSGRxVi$tz5aM9mS+YUDPs1FvqVephcK1zLO4QMqTxUwP81thxo=',NULL,0,173,'usr0173','johndoe11@kitehrms.com','John','Doe',1,0,'2022-05-17 20:04:43.012000'),('pbkdf2_sha256$320000$ktdidpXosyJ0KyIZG15QDU$zsupOB9ACnOxUDGNJh27YnymF1Mz4k5dCNaIFLD6yIQ=','2022-05-22 23:42:37.368000',0,174,'usr0174','johnsondavid@kitehrms.com','Johnson','David',1,0,'2022-05-17 20:57:00.694000'),('pbkdf2_sha256$320000$n3kIrxAVoCptRFfik9qPYH$E0kY7PRBiR/pc+VVSBMI1JLjrl8K2e4ZrfsJaNdnGPU=',NULL,0,175,'usr0175','johnclient@kitehrms.com','John','Client',1,0,'2022-05-19 04:52:08.963000'),('',NULL,0,176,'usr0176','janeclient@kitehrms.com','Jane','Client',1,0,'2022-05-19 10:23:10.658000'),('',NULL,0,177,'usr0177','juneclient@kitehrms.com','June','Client',1,0,'2022-05-19 10:26:32.018000'),('pbkdf2_sha256$320000$G5yZhq8GPd8G2TN5dRfEDy$5R3pf24SFxehfj3KP8VEFzShYYtYVbEeFlFGut0+6kA=',NULL,0,178,'usr0178','adamsclient@kitehrms.com','Adams','Client',0,0,'2022-05-19 10:30:03.134000'),('',NULL,0,180,'usr0180','jamesclient@kitehrms.com','James','Client',1,0,'2022-05-19 10:40:26.593000'),('',NULL,0,182,'usr0182','jamesolsen@kitehrms.com','James','Olsen',1,0,'2022-05-19 18:43:55.730000'),('pbkdf2_sha256$320000$eFyWNISEUbFeuX64D3zlWk$C4o1pd83W3L2nL0rS7oEeVhJr9iugne5JufzwMwnnkU=',NULL,0,183,'usr0183','janesimmons@kitehrms.com','Jane','Simmons',1,0,'2022-05-19 18:57:57.849000'),('pbkdf2_sha256$320000$raxKUuyuzJruJEakniiSln$yswGByNvLo5ag/c5bxoLXNmr9zNcRI66TNGfzc5I/i0=',NULL,0,184,'usr0184','rubyanda@kitehrms.com','Ruby','Anda',1,0,'2022-05-20 19:03:30.413000'),('pbkdf2_sha256$320000$i4g3IAJ6iyFkLnWDYhdU6c$KWwr9XKyZpbBOq0J2YZB7TAQNJW43p44sy6KovpWmfc=',NULL,0,185,'usr0185','johnnywick@kitehrms.com','Johnny','Wick',1,0,'2022-05-25 09:05:16.491000'),('pbkdf2_sha256$320000$C65QOLh9JBjmfkO3vVHdZW$zYv/PwRAxrCwlcXCsdmgA1/s4+cOBK+QBgJVdFoYDos=',NULL,0,186,'usr0186','nieli@kitehrms.com','Nie','Li',1,0,'2022-06-12 22:01:22.556000'),('pbkdf2_sha256$320000$VUIQFUJ57MgV5BMR74w6ny$vNxuQ0gzUn8s2T7fn+Log/eWwilLeFGlT8wLjNmmxYI=',NULL,0,190,'usr0187','johnnybrown@kitehrms.com','Johnny','Brown',1,0,'2022-06-12 22:19:49.656000'),('pbkdf2_sha256$320000$J4QdG3Rs3P10X71tvCUHq8$jvOIfL0/Ttk2sh0LbWpd0yvPSTrre/WgKfux7ZD/6u8=',NULL,0,191,'usr0191','testinguser@kitehrms.com','Testing','User',1,0,'2022-06-12 22:23:08.836000'),('pbkdf2_sha256$320000$liJsVTAYYvSu95vgbUzmqP$xa7q92MKF+x6cP6tb5Kvs24XtngJC9/MyEHwI/4Wb78=',NULL,0,192,'usr0192','billdoe@kitehrms.com','Bill','Joe',1,0,'2022-06-12 22:25:26.832000'),('pbkdf2_sha256$320000$bLP8vAsQmjb7LXdrE27I3D$1bIRyiVeQ4pK0LgNLmfP+v6eQrgJG2WX8DEBw9IANVQ=',NULL,0,193,'usr0193','mikecollins@kitehrms.com','Mike','Collins',1,0,'2022-06-16 04:03:04.607000'),('pbkdf2_sha256$320000$P643GVjCm0cuG9ZHgGIS9A$ySiZJFDzdL6f2IlaU1VkGwojO+YlEV6kYrTnD94DvPQ=',NULL,0,194,'usr0194','janedoeceo@kitehrms.com','Jane','Doe',0,0,'2022-06-16 11:02:35.458000'),('pbkdf2_sha256$320000$XVjpihJyTgtLesKQkDQih8$dDlfb+/TeUHfWVeQP8B+2h5LQDRcoKbX0JmgrMolG6o=','2024-12-09 21:11:41.543965',1,195,'usr0195','adminduy@gmail.com','','',1,1,'2024-12-09 21:11:26.132910'),('pbkdf2_sha256$320000$3l5gHIKAzCTr6C5SALcHb3$9TaDEFQ9HtTtprBsTwIu+uh0qRNG17CHtWEdSOK9dCk=','2024-12-09 23:05:05.508114',1,196,'usr0196','admin@gmail.com','Vu','Duy',1,1,'2024-12-09 21:38:33.529343'),('pbkdf2_sha256$320000$9j19hJ1ZJfl9E3tV4OYCYP$05lQmQyLiQAjicq7cuV1BYjbZaMh5oPBha7Wa+yxJpQ=','2024-12-09 23:01:19.114508',0,197,'usr0197','maitoan@gmail.com','Toan','Mai',1,0,'2024-12-09 23:00:14.235706');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_perm_user_id_20aca447_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 23:19:04
