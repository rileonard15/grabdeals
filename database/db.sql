-- MySQL dump 10.13  Distrib 5.6.20, for osx10.9 (x86_64)
--
-- Host: localhost    Database: buyback
-- ------------------------------------------------------
-- Server version	5.6.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'BUYER'),(1,'SELLER');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add task result',7,'add_taskresult'),(20,'Can change task result',7,'change_taskresult'),(21,'Can delete task result',7,'delete_taskresult'),(22,'Can add color',8,'add_color'),(23,'Can change color',8,'change_color'),(24,'Can delete color',8,'delete_color'),(25,'Can add profile',9,'add_profile'),(26,'Can change profile',9,'change_profile'),(27,'Can delete profile',9,'delete_profile'),(28,'Can add category',10,'add_category'),(29,'Can change category',10,'change_category'),(30,'Can delete category',10,'delete_category'),(31,'Can add size',11,'add_size'),(32,'Can change size',11,'change_size'),(33,'Can delete size',11,'delete_size'),(34,'Can add product',12,'add_product'),(35,'Can change product',12,'change_product'),(36,'Can delete product',12,'delete_product'),(37,'Can add Token',13,'add_token'),(38,'Can change Token',13,'change_token'),(39,'Can delete Token',13,'delete_token'),(40,'Can add image',14,'add_image'),(41,'Can change image',14,'change_image'),(42,'Can delete image',14,'delete_image'),(43,'Can add delivery address',15,'add_deliveryaddress'),(44,'Can change delivery address',15,'change_deliveryaddress'),(45,'Can delete delivery address',15,'delete_deliveryaddress'),(46,'Can add order',16,'add_order'),(47,'Can change order',16,'change_order'),(48,'Can delete order',16,'delete_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$CeJuRI2bOn8u$c6GjmnIMdAVLE1Sv0bPvIMnPLQCkURjrzAGcBSWtoyU=','2017-07-15 04:06:25.402156',1,'administrator','','','cnard1511@gmail.com',1,1,'2017-07-15 04:05:10.069848'),(2,'pbkdf2_sha256$36000$6Lz8acE4IOKq$E2JBlKQlPcC6lxlSXhGAicfORxTkAC2eCiDb15uJH0Y=',NULL,0,'demo-buyer','Demo','Demo','demo-buyer@gmail.com',0,1,'2017-07-15 04:20:48.000000'),(3,'pbkdf2_sha256$36000$7nxaZyRArVKW$nidfxm/digsSVgX9r0aVhZaUAbz986LAxMg2g5vqZEI=',NULL,0,'demo-seller','Demo','Demo','demo-seller@gmail.com',0,1,'2017-07-15 04:24:27.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,2),(2,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('b4671bcf0cf59844f45d96bc05f3d0a4077ec785','2017-07-15 04:31:52.080405',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-15 04:07:42.943510','1','SELLER',1,'[{\"added\": {}}]',2,1),(2,'2017-07-15 04:07:47.936873','2','BUYER',1,'[{\"added\": {}}]',2,1),(3,'2017-07-15 04:20:48.482247','2','demo-buyer',1,'[{\"added\": {}}]',3,1),(4,'2017-07-15 04:21:04.455607','2','demo-buyer',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',3,1),(5,'2017-07-15 04:24:28.042651','3','demo-seller',1,'[{\"added\": {}}]',3,1),(6,'2017-07-15 04:24:43.764932','3','demo-seller',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',3,1),(7,'2017-07-15 04:50:36.907868','1','Category object',1,'[{\"added\": {}}]',10,1),(8,'2017-07-15 04:50:46.382371','2','Category object',1,'[{\"added\": {}}]',10,1),(9,'2017-07-15 04:50:51.204993','3','Category object',1,'[{\"added\": {}}]',10,1),(10,'2017-07-15 04:50:57.217918','4','Category object',1,'[{\"added\": {}}]',10,1),(11,'2017-07-15 04:51:11.227644','5','Category object',1,'[{\"added\": {}}]',10,1),(12,'2017-07-15 04:51:30.654888','6','Category object',1,'[{\"added\": {}}]',10,1),(13,'2017-07-15 04:51:40.237854','1','Color object',1,'[{\"added\": {}}]',8,1),(14,'2017-07-15 04:51:45.596532','2','Color object',1,'[{\"added\": {}}]',8,1),(15,'2017-07-15 04:51:49.894148','3','Color object',1,'[{\"added\": {}}]',8,1),(16,'2017-07-15 04:51:53.118282','4','Color object',1,'[{\"added\": {}}]',8,1),(17,'2017-07-15 04:51:59.558078','5','Color object',1,'[{\"added\": {}}]',8,1),(18,'2017-07-15 04:52:04.634389','6','Color object',1,'[{\"added\": {}}]',8,1),(19,'2017-07-15 04:53:27.131442','1','Size object',1,'[{\"added\": {}}]',11,1),(20,'2017-07-15 04:53:31.775398','2','Size object',1,'[{\"added\": {}}]',11,1),(21,'2017-07-15 04:53:40.183844','3','Size object',1,'[{\"added\": {}}]',11,1),(22,'2017-07-15 04:53:47.772384','4','Size object',1,'[{\"added\": {}}]',11,1),(23,'2017-07-15 04:54:14.142260','5','Size object',1,'[{\"added\": {}}]',11,1),(24,'2017-07-15 04:54:22.951996','6','Size object',1,'[{\"added\": {}}]',11,1),(25,'2017-07-15 05:14:29.622076','1','http://n.nordstrommedia.com/id/92c5fcd0-6d7e-4d22-ac95-cb047845266b.jpeg?w=390&h=421',1,'[{\"added\": {}}]',14,1),(26,'2017-07-15 05:14:39.929597','2','http://n.nordstrommedia.com/id/fe670a9e-9c3d-4345-9b82-fcd237e1411f.jpeg?w=388&h=421',1,'[{\"added\": {}}]',14,1),(27,'2017-07-15 05:14:47.406981','3','http://ecx.images-amazon.com/images/I/51ESFpmADLL._AC_UL260_SR200,260_.jpg',1,'[{\"added\": {}}]',14,1),(28,'2017-07-15 05:15:57.502419','1','Long Sleeve',1,'[{\"added\": {}}]',12,1),(29,'2017-07-15 07:26:35.780106','1','DeliveryAddress object',1,'[{\"added\": {}}]',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_hidden_cd77412f` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_results_taskresult`
--

LOCK TABLES `django_celery_results_taskresult` WRITE;
/*!40000 ALTER TABLE `django_celery_results_taskresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_results_taskresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(4,'auth','permission'),(3,'auth','user'),(13,'authtoken','token'),(5,'contenttypes','contenttype'),(7,'django_celery_results','taskresult'),(6,'sessions','session'),(10,'www','category'),(8,'www','color'),(15,'www','deliveryaddress'),(14,'www','image'),(16,'www','order'),(12,'www','product'),(9,'www','profile'),(11,'www','size');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-15 04:01:39.242470'),(2,'auth','0001_initial','2017-07-15 04:01:39.831271'),(3,'admin','0001_initial','2017-07-15 04:01:39.958671'),(4,'admin','0002_logentry_remove_auto_add','2017-07-15 04:01:39.999467'),(5,'contenttypes','0002_remove_content_type_name','2017-07-15 04:01:40.088099'),(6,'auth','0002_alter_permission_name_max_length','2017-07-15 04:01:40.125834'),(7,'auth','0003_alter_user_email_max_length','2017-07-15 04:01:40.162259'),(8,'auth','0004_alter_user_username_opts','2017-07-15 04:01:40.177209'),(9,'auth','0005_alter_user_last_login_null','2017-07-15 04:01:40.215647'),(10,'auth','0006_require_contenttypes_0002','2017-07-15 04:01:40.219447'),(11,'auth','0007_alter_validators_add_error_messages','2017-07-15 04:01:40.245055'),(12,'auth','0008_alter_user_username_max_length','2017-07-15 04:01:40.278405'),(13,'django_celery_results','0001_initial','2017-07-15 04:01:40.342854'),(14,'sessions','0001_initial','2017-07-15 04:01:40.422703'),(15,'www','0001_initial','2017-07-15 04:01:40.497096'),(16,'www','0002_auto_20170710_0124','2017-07-15 04:01:40.964734'),(17,'authtoken','0001_initial','2017-07-15 04:31:47.403706'),(18,'authtoken','0002_auto_20160226_1747','2017-07-15 04:31:47.544355'),(19,'www','0003_size_measurement','2017-07-15 04:52:54.616147'),(20,'www','0004_auto_20170715_0455','2017-07-15 04:56:01.322918'),(21,'www','0005_deliveryaddress_order','2017-07-15 07:24:54.720645'),(22,'www','0006_order_transaction_id','2017-07-15 07:55:52.859199'),(23,'www','0007_order_confirmation_no','2017-07-15 08:38:36.761513'),(24,'www','0008_order_amount','2017-07-15 08:44:06.190988');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('zmal1fo9j8sni6pz3tqng5ej9k1bcbuy','NzA0NjdlNDZmYTliNzZmMDE0ZjQ4Mzk0Y2UxMTM1YWZlNjM0OTIyNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWYyNWM4OWQ5NDc4MmJmZTNmZDZhNTEzOGRkMTVkYmMyM2FiODlhYyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-07-29 04:06:25.405225');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_category`
--

DROP TABLE IF EXISTS `www_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_category`
--

LOCK TABLES `www_category` WRITE;
/*!40000 ALTER TABLE `www_category` DISABLE KEYS */;
INSERT INTO `www_category` VALUES (1,'2017-07-15 04:50:36.906936','2017-07-15 04:50:36.906994','fashion','fashion'),(2,'2017-07-15 04:50:46.381558','2017-07-15 04:50:46.381613','dress','dress'),(3,'2017-07-15 04:50:51.204007','2017-07-15 04:50:51.204064','women','women'),(4,'2017-07-15 04:50:57.217054','2017-07-15 04:50:57.217100','men','men'),(5,'2017-07-15 04:51:11.226788','2017-07-15 04:51:11.226855','gadget','gadget'),(6,'2017-07-15 04:51:30.654064','2017-07-15 04:51:30.654120','phones','phones');
/*!40000 ALTER TABLE `www_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_color`
--

DROP TABLE IF EXISTS `www_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_color`
--

LOCK TABLES `www_color` WRITE;
/*!40000 ALTER TABLE `www_color` DISABLE KEYS */;
INSERT INTO `www_color` VALUES (1,'2017-07-15 04:51:40.236227','2017-07-15 04:51:40.236345','blue','blue'),(2,'2017-07-15 04:51:45.595575','2017-07-15 04:51:45.595654','green','green'),(3,'2017-07-15 04:51:49.893242','2017-07-15 04:51:49.893347','black','black'),(4,'2017-07-15 04:51:53.116804','2017-07-15 04:51:53.116861','white','white'),(5,'2017-07-15 04:51:59.557102','2017-07-15 04:51:59.557159','maroon','maroon'),(6,'2017-07-15 04:52:04.633591','2017-07-15 04:52:04.633650','yellow','yellow');
/*!40000 ALTER TABLE `www_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_deliveryaddress`
--

DROP TABLE IF EXISTS `www_deliveryaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_deliveryaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `address` longtext,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `www_deliveryaddress_owner_id_e1d4405e_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `www_deliveryaddress_owner_id_e1d4405e_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_deliveryaddress`
--

LOCK TABLES `www_deliveryaddress` WRITE;
/*!40000 ALTER TABLE `www_deliveryaddress` DISABLE KEYS */;
INSERT INTO `www_deliveryaddress` VALUES (1,'2017-07-15 07:26:35.777082','2017-07-15 07:26:35.777232','Somewhere in cebu near ayala front of SM','Clark','Kent','093333333',2);
/*!40000 ALTER TABLE `www_deliveryaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_image`
--

DROP TABLE IF EXISTS `www_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `src` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_image`
--

LOCK TABLES `www_image` WRITE;
/*!40000 ALTER TABLE `www_image` DISABLE KEYS */;
INSERT INTO `www_image` VALUES (1,'2017-07-15 05:14:29.620619','2017-07-15 05:14:29.620693','http://n.nordstrommedia.com/id/92c5fcd0-6d7e-4d22-ac95-cb047845266b.jpeg?w=390&h=421'),(2,'2017-07-15 05:14:39.928859','2017-07-15 05:14:39.928912','http://n.nordstrommedia.com/id/fe670a9e-9c3d-4345-9b82-fcd237e1411f.jpeg?w=388&h=421'),(3,'2017-07-15 05:14:47.404654','2017-07-15 05:14:47.404775','http://ecx.images-amazon.com/images/I/51ESFpmADLL._AC_UL260_SR200,260_.jpg');
/*!40000 ALTER TABLE `www_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_order`
--

DROP TABLE IF EXISTS `www_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `invoice` varchar(10) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `delivery_address_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `confirmation_no` varchar(100) DEFAULT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `www_order_buyer_id_1d34905f_fk_auth_user_id` (`buyer_id`),
  KEY `www_order_delivery_address_id_023e179f_fk_www_deliveryaddress_id` (`delivery_address_id`),
  KEY `www_order_product_id_7547fd9d_fk_www_product_id` (`product_id`),
  CONSTRAINT `www_order_buyer_id_1d34905f_fk_auth_user_id` FOREIGN KEY (`buyer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `www_order_delivery_address_id_023e179f_fk_www_deliveryaddress_id` FOREIGN KEY (`delivery_address_id`) REFERENCES `www_deliveryaddress` (`id`),
  CONSTRAINT `www_order_product_id_7547fd9d_fk_www_product_id` FOREIGN KEY (`product_id`) REFERENCES `www_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_order`
--

LOCK TABLES `www_order` WRITE;
/*!40000 ALTER TABLE `www_order` DISABLE KEYS */;
INSERT INTO `www_order` VALUES (4,'2017-07-15 07:31:26.612547','2017-07-15 07:31:26.612781',2,'N984L5969K',0,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(5,'2017-07-15 08:29:58.149620','2017-07-15 08:29:58.149760',2,'CZXBBTSVER',0,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(6,'2017-07-15 08:31:01.624526','2017-07-15 08:31:01.624632',2,'WCLGNYYXCH',0,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(7,'2017-07-15 08:31:57.802197','2017-07-15 08:31:57.802277',2,'156L2J95DB',0,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(8,'2017-07-15 08:34:48.545916','2017-07-15 08:34:48.546012',2,'VE1LVTQTO7',1,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(9,'2017-07-15 08:42:23.398206','2017-07-15 08:42:23.398310',4,'IIDC78Z4DM',1,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(10,'2017-07-15 08:45:05.455837','2017-07-15 08:45:05.456036',4,'39E5NSQG6U',1,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(11,'2017-07-15 08:47:46.386511','2017-07-15 08:47:46.386600',4,'TMNDAI07TU',1,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(12,'2017-07-15 08:48:41.357201','2017-07-15 08:48:41.357327',4,'Z9D6ID8SN9',1,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,0),(13,'2017-07-15 08:50:10.481635','2017-07-15 08:50:10.481735',4,'BNQ0TXPH5N',1,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,4800),(14,'2017-07-15 08:50:39.542891','2017-07-15 08:50:39.542962',4,'1XYDFZMBM8',0,'n/a','n/a','READY_FOR_DELIVERY',2,1,1,NULL,NULL,4800);
/*!40000 ALTER TABLE `www_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_product`
--

DROP TABLE IF EXISTS `www_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` longtext,
  `quantity` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `price` double NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `www_product_owner_id_7b94d619_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `www_product_owner_id_7b94d619_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_product`
--

LOCK TABLES `www_product` WRITE;
/*!40000 ALTER TABLE `www_product` DISABLE KEYS */;
INSERT INTO `www_product` VALUES (1,'2017-07-15 05:15:57.472963','2017-07-15 05:15:57.473047','Long Sleeve','Long Sleeve for formal attire',10,'XYZSSWAF',1200,3);
/*!40000 ALTER TABLE `www_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_product_categories`
--

DROP TABLE IF EXISTS `www_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `www_product_categories_product_id_category_id_d27b0dda_uniq` (`product_id`,`category_id`),
  KEY `www_product_categories_category_id_e231114e_fk_www_category_id` (`category_id`),
  CONSTRAINT `www_product_categories_category_id_e231114e_fk_www_category_id` FOREIGN KEY (`category_id`) REFERENCES `www_category` (`id`),
  CONSTRAINT `www_product_categories_product_id_f3b3bfc5_fk_www_product_id` FOREIGN KEY (`product_id`) REFERENCES `www_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_product_categories`
--

LOCK TABLES `www_product_categories` WRITE;
/*!40000 ALTER TABLE `www_product_categories` DISABLE KEYS */;
INSERT INTO `www_product_categories` VALUES (1,1,1),(2,1,4);
/*!40000 ALTER TABLE `www_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_product_colors`
--

DROP TABLE IF EXISTS `www_product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_product_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `www_product_colors_product_id_color_id_393d2c47_uniq` (`product_id`,`color_id`),
  KEY `www_product_colors_color_id_0e7a0d05_fk_www_color_id` (`color_id`),
  CONSTRAINT `www_product_colors_color_id_0e7a0d05_fk_www_color_id` FOREIGN KEY (`color_id`) REFERENCES `www_color` (`id`),
  CONSTRAINT `www_product_colors_product_id_befbfc5c_fk_www_product_id` FOREIGN KEY (`product_id`) REFERENCES `www_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_product_colors`
--

LOCK TABLES `www_product_colors` WRITE;
/*!40000 ALTER TABLE `www_product_colors` DISABLE KEYS */;
INSERT INTO `www_product_colors` VALUES (1,1,1),(2,1,3),(3,1,4);
/*!40000 ALTER TABLE `www_product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_product_images`
--

DROP TABLE IF EXISTS `www_product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `www_product_images_product_id_image_id_8a468048_uniq` (`product_id`,`image_id`),
  KEY `www_product_images_image_id_d0566a72_fk_www_image_id` (`image_id`),
  CONSTRAINT `www_product_images_image_id_d0566a72_fk_www_image_id` FOREIGN KEY (`image_id`) REFERENCES `www_image` (`id`),
  CONSTRAINT `www_product_images_product_id_d0758bf0_fk_www_product_id` FOREIGN KEY (`product_id`) REFERENCES `www_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_product_images`
--

LOCK TABLES `www_product_images` WRITE;
/*!40000 ALTER TABLE `www_product_images` DISABLE KEYS */;
INSERT INTO `www_product_images` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `www_product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_product_sizes`
--

DROP TABLE IF EXISTS `www_product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_product_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `www_product_sizes_product_id_size_id_55836260_uniq` (`product_id`,`size_id`),
  KEY `www_product_sizes_size_id_25a2a129_fk_www_size_id` (`size_id`),
  CONSTRAINT `www_product_sizes_size_id_25a2a129_fk_www_size_id` FOREIGN KEY (`size_id`) REFERENCES `www_size` (`id`),
  CONSTRAINT `www_product_sizes_product_id_154a1d08_fk_www_product_id` FOREIGN KEY (`product_id`) REFERENCES `www_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_product_sizes`
--

LOCK TABLES `www_product_sizes` WRITE;
/*!40000 ALTER TABLE `www_product_sizes` DISABLE KEYS */;
INSERT INTO `www_product_sizes` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `www_product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_profile`
--

DROP TABLE IF EXISTS `www_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `timezone` varchar(50) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `telno` varchar(50) DEFAULT NULL,
  `fb_accesstoken` longtext,
  `fb_id` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `www_profile_user_id_6a48cf82_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_profile`
--

LOCK TABLES `www_profile` WRITE;
/*!40000 ALTER TABLE `www_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `www_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `www_size`
--

DROP TABLE IF EXISTS `www_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `measurement` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `www_size`
--

LOCK TABLES `www_size` WRITE;
/*!40000 ALTER TABLE `www_size` DISABLE KEYS */;
INSERT INTO `www_size` VALUES (1,'2017-07-15 04:53:27.129909','2017-07-15 04:53:27.129981','medium','medium','medium'),(2,'2017-07-15 04:53:31.767275','2017-07-15 04:53:31.767450','small','small','small'),(3,'2017-07-15 04:53:40.183164','2017-07-15 04:53:40.183218','large','large','large'),(4,'2017-07-15 04:53:47.769748','2017-07-15 04:53:47.769802','x-large','x-large','x-large'),(5,'2017-07-15 04:54:14.141466','2017-07-15 04:54:14.141519','43','43-in','inches'),(6,'2017-07-15 04:54:22.951238','2017-07-15 04:54:22.951292','20','20-cm','cm');
/*!40000 ALTER TABLE `www_size` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-15 19:12:17
