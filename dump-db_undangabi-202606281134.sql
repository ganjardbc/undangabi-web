-- MySQL dump 10.13  Distrib 9.4.0, for macos15.4 (arm64)
--
-- Host: localhost    Database: db_undangabi
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `article_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_article_id_unique` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'AR0001','AR00011624512786cover.png','Lorem ipsum dolor ismet.','Lorem','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.','active',1,NULL,'1','2020-06-28 12:08:45','2021-06-23 22:33:06'),(2,'AR0002','AR00021624512778cover.png','Lorem ipsum dolor ismet.','Lorem','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.','active',1,NULL,'1','2020-06-28 12:08:45','2021-06-23 22:32:58'),(3,'AR0003','AR00031624512770cover.png','Lorem ipsum dolor ismet.','Lorem','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.','active',1,NULL,'1','2020-06-28 12:08:45','2021-06-23 22:32:50'),(4,'AR0004','AR00041624512762cover.png','Lorem ipsum dolor ismet.','Lorem','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.','active',1,NULL,'1','2020-06-28 12:08:45','2021-06-23 22:32:42');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefits`
--

DROP TABLE IF EXISTS `benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benefits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `benefit_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `benefits_benefit_id_unique` (`benefit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefits`
--

LOCK TABLES `benefits` WRITE;
/*!40000 ALTER TABLE `benefits` DISABLE KEYS */;
INSERT INTO `benefits` VALUES (1,'BN0001','BN00011624512727icon.png','Sebarkan Link','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','active',1,NULL,'1','2020-06-28 12:08:45','2021-06-23 22:42:38'),(2,'BN0002','BN00021624512719icon.png','Buat Undangan','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','active',1,NULL,'1','2020-06-28 12:08:45','2021-06-23 22:42:24'),(3,'BN0003','BN00031625574177icon.png','Daftar Akun','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','active',1,NULL,'1','2020-06-28 12:08:45','2021-07-06 05:22:59');
/*!40000 ALTER TABLE `benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bizpars`
--

DROP TABLE IF EXISTS `bizpars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bizpars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bizpars_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bizpars`
--

LOCK TABLES `bizpars` WRITE;
/*!40000 ALTER TABLE `bizpars` DISABLE KEYS */;
INSERT INTO `bizpars` VALUES (1,'DS0001','active','status','Lorem ipsum dolor ismet.',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(2,'DS0002','inactive','status','Lorem ipsum dolor ismet.',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(3,'AD0001','gallery','gallery','Lorem ipsum dolor ismet.',NULL,'1','2020-06-28 12:08:45','2021-06-30 19:24:58'),(4,'AD0002','cover','gallery','Lorem ipsum dolor ismet.',NULL,'1','2020-06-28 12:08:45','2021-06-30 19:25:09'),(7,'PR0001','wedding','invitation','Lorem ipsum dolor ismet.',NULL,'1','2020-06-28 12:08:45','2021-06-30 19:25:40'),(8,'PR0002','other','invitation','Lorem ipsum dolor ismet.',NULL,'1','2020-06-28 12:08:45','2021-06-30 19:25:49'),(15,'BZ-1629858609580','bronze','packet','bronze','1',NULL,'2021-08-24 19:30:11',NULL),(16,'BZ-1629858621554','silver','packet','silver','1',NULL,'2021-08-24 19:30:22',NULL),(17,'BZ-1629858639042','diamond','packet','diamond','1',NULL,'2021-08-24 19:30:40',NULL),(18,'BZ-1643953456307','rsvp_1','rsvp','rsvp 1','1','1','2022-02-03 22:44:17','2022-02-03 22:45:12'),(19,'BZ-1643953468271','rsvp_2','rsvp','rsvp 2','1',NULL,'2022-02-03 22:44:29',NULL),(20,'BZ-1643953480019','rsvp_3','rsvp','rsvp 3','1',NULL,'2022-02-03 22:44:41',NULL);
/*!40000 ALTER TABLE `bizpars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brides`
--

DROP TABLE IF EXISTS `brides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brides` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bride_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_name_editor` tinyint(1) DEFAULT NULL,
  `is_nick_name_editor` tinyint(1) DEFAULT NULL,
  `is_about_editor` tinyint(1) DEFAULT NULL,
  `is_parent_editor` tinyint(1) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brides_bride_id_unique` (`bride_id`),
  KEY `brides_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `brides_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brides`
--

LOCK TABLES `brides` WRITE;
/*!40000 ALTER TABLE `brides` DISABLE KEYS */;
INSERT INTO `brides` VALUES (4,'EV-1624339612992','EV-16243396129921625501477ScreenShot20210705at23.11.06.png','Ganjar Hadiatna','Ganjar','Pengantin Pria','Putra dari Bapak Adih Purnama dan Ibu Ai Rohayati',NULL,'active',NULL,NULL,NULL,NULL,1,6,'1','2','2021-06-21 22:26:54','2023-11-30 22:51:34'),(5,'EV-1624339649294','EV-16243396492941625501491ScreenShot20210705at23.09.56.png','Iis Kartika','Iis','Pengantin Wanita','Putri dari Bapak Ade dan Ibu Aan',NULL,'active',NULL,NULL,NULL,NULL,1,6,'1','2','2021-06-21 22:27:30','2023-11-30 22:51:28'),(12,'BR-1720224682210','BR-172022468221017202273325e5b35db09c45.jpeg','Ganjar Hadiatna','Ganjar',NULL,'Amet commodo rem et','Consectetur deleniti','active',0,0,0,0,1,13,'1','1','2024-07-05 17:11:29','2024-07-05 17:55:32');
/*!40000 ALTER TABLE `brides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_category_id_unique` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'CT0001',NULL,'Pernikahan','Lorem ipsum dolor ismet.','active',1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(2,'CT0002',NULL,'Acara','Lorem ipsum dolor ismet.','active',1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(3,'CT0003','CT00031624025992icon1.png','Perayaan','Lorem ipsum dolor ismet.','active',1,NULL,'1','2020-06-28 12:08:45','2021-06-18 07:19:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comments_comment_id_unique` (`comment_id`),
  KEY `comments_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `comments_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (12,'FE-1624435208092','FE-162443520809216437029912560pxBankCentralAsia.svg.png','BCA','NOT SET','active',0,6,'GUEST','1','2021-06-23 01:00:08','2022-02-01 01:09:54'),(13,'FE-1624435351964','FE-16244353519641643702852LogoBNIBankNegaraIndonesia46Vector.png','BNI','NOT SET','active',0,6,'GUEST','1','2021-06-23 01:02:32','2022-02-01 01:09:12');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `streaming_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_event_id_unique` (`event_id`),
  KEY `events_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `events_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (6,'EV-1624340073272',NULL,'Siraman','Siraman','2021-07-21','14:00 - Selesai','WIB','Kp. Cilumber Rt. 02 Rw. 09 Desa Cibogo Kecamatan Lembang Kabupaten Bandung Barat',NULL,'active',1,6,'1','1','2021-06-21 22:34:34','2022-08-26 01:25:53'),(7,'EV-1624383084261',NULL,'Akad','Akad','2021-07-22','08:00 - Selesai','WIB','Kp. Cilumber Rt. 02 Rw. 09 Desa Cibogo Kecamatan Lembang Kabupaten Bandung Barat',NULL,'active',1,6,'1','2','2021-06-22 10:31:25','2023-11-30 22:56:24');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `feedback_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `work` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feedbacks_feedback_id_unique` (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'FB0001','','Lorem ipsum dolor ismet.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Lorem','active',1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(2,'FB0002','','Lorem ipsum dolor ismet.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Lorem','active',1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(3,'FB0003','','Lorem ipsum dolor ismet.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Lorem','active',1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(4,'FB0004','','Lorem ipsum dolor ismet.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','Lorem','active',1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `galleries_gallery_id_unique` (`gallery_id`),
  KEY `galleries_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `galleries_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (6,'GL-1624339885404','GL-16243398854041624381943ScreenShot20210623at00.12.13.png','Galeri 1','gallery',NULL,'active',1,6,'1','1','2021-06-21 22:39:45','2021-06-30 19:46:12'),(7,'GL-1624381967611','GL-16243819676111624382044ScreenShot20210623at00.13.54.png','Galeri 2','gallery',NULL,'active',1,6,'1','1','2021-06-22 10:12:49','2021-06-30 19:46:16'),(8,'GL-1624382147586','GL-16243821475861624382822ScreenShot20210623at00.26.48.png','Galeri 3','gallery',NULL,'active',1,6,'1','1','2021-06-22 10:15:48','2021-06-30 19:46:04'),(9,'GL-1624382202117','GL-16243822021171624382389ScreenShot20210623at00.18.28.png','Galeri 4','gallery',NULL,'active',1,6,'1','1','2021-06-22 10:16:43','2021-06-30 19:46:00'),(10,'GL-1624382239004','GL-16243822390041624382432ScreenShot20210623at00.20.20.png','Galeri 5','gallery',NULL,'active',1,6,'1','1','2021-06-22 10:17:20','2021-06-30 19:45:48'),(11,'GL-1624382248436','GL-16243822484361624382445ScreenShot20210623at00.19.23.png','Galeri 6','gallery',NULL,'active',1,6,'1','1','2021-06-22 10:17:29','2021-06-30 19:45:39'),(12,'GL-1625107626361','GL-16251076263611625110353ScreenShot20210701at09.52.41.png','Cover 1','cover',NULL,'active',1,6,'1','1','2021-06-30 19:47:07','2021-06-30 20:32:36'),(13,'GL-1625109781227','GL-16251097812271625110468ScreenShot20210701at10.16.37.png','Cover 2','cover',NULL,'active',1,6,'1','1','2021-06-30 20:23:02','2021-06-30 20:34:28'),(14,'GL-1625110338931','GL-16251103389311625110558ScreenShot20210701at10.34.09.png','Cover 3','cover',NULL,'active',1,6,'1','1','2021-06-30 20:32:20','2021-06-30 20:36:00'),(15,'GL-1625110496826','GL-16251104968261625110516ScreenShot20210701at10.22.32.png','Cover 4','cover',NULL,'active',1,6,'1','1','2021-06-30 20:34:58','2021-06-30 20:35:16'),(16,'GL-1625229442559','GL-16252294425591625501869ScreenShot20210705at23.17.36.png','Cover 5','cover',NULL,'active',1,6,'1','1','2021-07-02 05:37:23','2021-07-05 09:17:49');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_books`
--

DROP TABLE IF EXISTS `guest_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_book_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` int unsigned NOT NULL DEFAULT '0',
  `present_type` enum('present','not_present') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'present',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guest_books_guest_book_id_unique` (`guest_book_id`),
  KEY `guest_books_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `guest_books_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_books`
--

LOCK TABLES `guest_books` WRITE;
/*!40000 ALTER TABLE `guest_books` DISABLE KEYS */;
INSERT INTO `guest_books` VALUES (1,'GB-1701358187912',NULL,'Ganjar',NULL,NULL,'Ahuy Mang',1,'present','active',0,6,'1','1','2023-11-30 08:30:52','2023-11-30 08:42:24'),(10,'GB-1701409479343',NULL,'Rendjana Wedding','Di Tempat',NULL,'Lorem ipsum',1,'present','active',0,6,'2','2','2023-11-30 22:44:45','2023-11-30 22:44:45'),(11,'GB-1701409565252',NULL,'Ucup',NULL,NULL,NULL,3,'present','active',0,6,'2','2','2023-11-30 22:46:20','2023-11-30 22:46:20'),(13,'GB-1701412842609',NULL,'Rendjana Wedding','Di Tempat',NULL,'Lorem ipsum',1,'present','active',0,6,'2','2','2023-11-30 23:40:47','2023-11-30 23:40:47');
/*!40000 ALTER TABLE `guest_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` int unsigned DEFAULT '0',
  `present_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rsvp` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_present` tinyint(1) DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `bride_id` bigint unsigned DEFAULT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guests_guest_id_unique` (`guest_id`),
  KEY `guests_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `guests_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (6,'GE-1624340573810',NULL,'Ganjar Hadiatna','085111222333','TEST','Buat test aja',2,'will-present','rsvp_3',1,'active',1,0,6,'1','1','2021-06-21 22:42:54','2023-09-21 02:21:42'),(11,'GE-1625907146391',NULL,'Ahmad','1622136542527','Jl. mana weh','Lorem',1,'will-present',NULL,1,'active',1,0,6,'6','1','2021-07-10 01:52:26','2023-09-21 02:21:33'),(12,'GE-1625907187140',NULL,'Gustavian','085111222333','Jl. mana weh','Lorem',0,'not-present','rsvp_2',0,'active',1,0,6,'6','1','2021-07-10 01:53:07','2022-02-03 22:50:55'),(28,'GE-6-686670832445',NULL,'Ganjar',NULL,'Mana aja boleh',NULL,1,'will-present','rsvp_1',1,'active',1,0,6,'1','1','2022-02-04 01:26:46','2023-09-21 02:21:25'),(29,'GE-6-345806301295',NULL,'Hadiatna SH PD',NULL,'Mana aja boleh',NULL,1,'will-present','rsvp_1',1,'active',1,0,6,'1','1','2022-02-04 01:26:46','2023-09-21 02:21:19'),(30,'GE-6-2913062701',NULL,'Ahmad',NULL,'Mana aja boleh',NULL,0,'waiting-response','sesi_1',NULL,'active',1,0,6,'1',NULL,'2022-02-07 20:12:50',NULL),(31,'GE-6-816624957445',NULL,'Hadi',NULL,'Mana aja boleh',NULL,0,'waiting-response','sesi_2',NULL,'active',1,0,6,'1',NULL,'2022-02-07 20:12:50',NULL),(32,'GE-6-962595776097',NULL,'Gunawan',NULL,'Mana aja boleh','Hampura moal bisa hadir',0,'not-present',NULL,0,'active',1,0,6,'1','6','2022-02-07 20:12:50','2022-02-07 21:11:01'),(33,'GE-1644290480200',NULL,'UNDANGABI',NULL,NULL,'AHUYYY',2,'will-present','rsvp_2',1,'active',1,0,6,'6','1','2022-02-07 20:21:20','2023-09-21 02:21:12'),(37,'GE-1644290480202',NULL,'UNDANGABI 2',NULL,NULL,'ahuy ahuy ahuy',0,'waiting-response','rsvp_3',NULL,'active',1,0,6,'6','1','2022-02-07 20:37:27','2022-02-13 19:47:07'),(38,'GE-1644291782474',NULL,'Uding Sarifudin',NULL,NULL,'SAMAWA BRADER',1,'will-present','rsvp_3',1,'active',1,0,6,'6','1','2022-02-07 20:43:02','2023-09-21 02:21:02'),(39,'GE-1644296547140',NULL,'Bejo',NULL,NULL,'Coba lagi',1,'will-present',NULL,1,'active',1,0,6,'6','1','2022-02-07 22:02:27','2023-09-21 02:20:55'),(40,'GE-1644638653609',NULL,'Ahmad Saeful',NULL,NULL,'Ahuy',1,'will-present','rsvp_2',1,'active',1,0,6,'6','1','2022-02-11 21:04:13','2023-09-21 02:20:48'),(41,'GE-1644811728193',NULL,'Agus Sopandi',NULL,NULL,'BUAT TEST AJA',50,'will-present','rsvp_3',1,'active',1,0,6,'6','6','2022-02-13 21:08:48','2023-06-20 19:32:36'),(44,'GE-1661499920307',NULL,'test',NULL,'test',NULL,0,'waiting-response','rsvp_1',NULL,'active',0,0,6,'1','1','2022-08-26 00:45:28','2022-08-30 04:00:06'),(46,'GE-1687313792832',NULL,'Udin Saripuddin',NULL,NULL,'Ahuy Guys',2,'will-present','rsvp_3',1,'active',1,0,6,'6','1','2023-06-20 19:16:32','2023-09-21 02:20:33'),(47,'GE-1687314282585',NULL,'Umay Gunawan',NULL,NULL,'SAMAWA BRADER',5,'will-present','rsvp_3',1,'active',1,0,6,'6','6','2023-06-20 19:24:42','2023-06-20 19:27:47');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invitation_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_link` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `greeting_quotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `closing_quotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `privacy` enum('public','private') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `is_available` tinyint(1) NOT NULL,
  `is_free_trial` tinyint(1) DEFAULT '0',
  `is_reservation_enable` tinyint(1) DEFAULT NULL,
  `is_qrcode_enable` tinyint(1) DEFAULT NULL,
  `is_prokes_enable` tinyint(1) DEFAULT '0',
  `show_guest_qrcode` tinyint(1) DEFAULT NULL,
  `show_invitation_qrcode` tinyint(1) DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `discount` bigint DEFAULT NULL,
  `total_price` bigint DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  `theme_id` bigint unsigned DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `song_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invitations_invitation_id_unique` (`invitation_id`),
  UNIQUE KEY `invitations_shortlink` (`short_link`),
  KEY `invitations_user_id_foreign` (`user_id`),
  CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES (6,'IV-1624334162067','ganjar-iis','IV-16243341620671707147281cover2.png','IV-16243341620671707147205WhatsAppImage20240129at18.22.051.jpeg','Ganjar & Iis','Kp. Cilumber Rt. 02 Rw. 09 Desa Cibogo Kecamatan Lembang Kabupaten Bandung Barat','<iframe width=\"100%\" height=\"500\" src=\"https://www.youtube.com/embed/mQVLfhdX89s\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>',NULL,'2024-07-22','09.00 - 17.00','WIB',NULL,NULL,NULL,NULL,'-6.802928','107.642335','diamond','active','public',1,0,1,1,NULL,NULL,NULL,350000,0,350000,1,36,1,3,2,'1','1','2021-06-21 20:56:03','2024-05-09 20:52:14'),(13,'INV-1710626950799','Vel-a-est-adipisicin','INV-17106269507991738310437WhatsAppImage20250108at23.27.30.jpeg','INV-17106269507991738310424WhatsAppImage20250108at23.27.303.jpeg','Syukuran Rajab Keluarga<br/>Bpk. Ganjar Hadiatna','Iste proident dolor',NULL,NULL,'2024-03-19','08:00 - 13:00','WIB',NULL,'<p>Sampai Jumpa di Hari Acara</p>',NULL,'<p>Salam penutup</p>',NULL,NULL,'diamond','active','public',0,1,1,1,NULL,NULL,NULL,0,0,0,0,26,2,1,1,'1','1','2024-03-16 15:10:23','2025-01-31 01:04:14');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `love_stories`
--

DROP TABLE IF EXISTS `love_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `love_stories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `love_story_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `love_stories_love_story_id_unique` (`love_story_id`),
  KEY `love_stories_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `love_stories_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `love_stories`
--

LOCK TABLES `love_stories` WRITE;
/*!40000 ALTER TABLE `love_stories` DISABLE KEYS */;
INSERT INTO `love_stories` VALUES (1,'SE-1689307251789','SE-16893072517891689307634banner1.png','First Meet','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','2023-07-14','active',0,6,'1','1','2023-07-13 21:01:00','2023-07-13 21:07:14'),(2,'SE-1689309425284',NULL,'Engagement','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','2023-07-14','active',0,6,'1',NULL,'2023-07-13 21:37:15',NULL);
/*!40000 ALTER TABLE `love_stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2021_03_05_152552_create_roles_table',1),(3,'2021_03_05_152600_create_users_table',1),(4,'2021_03_05_152617_create_password_resets_table',1),(5,'2021_03_05_152628_create_failed_jobs_table',1),(6,'2021_03_05_161827_create_bizpars_table',1),(7,'2021_03_06_051234_create_categories_table',1),(8,'2021_03_19_132004_create_articles_table',1),(9,'2021_03_19_133045_create_benefits_table',1),(10,'2021_03_19_135941_create_feedbacks_table',1),(11,'2021_05_07_140557_create_permissions_table',1),(12,'2021_05_07_141501_create_role_permissions_table',1),(13,'2021_06_18_025739_create_themes_table',1),(14,'2021_06_18_025748_create_songs_table',1),(15,'2021_06_18_032805_create_invitations_table',1),(16,'2021_06_18_062441_create_events_table',2),(17,'2021_06_18_070153_create_galleries_table',3),(18,'2021_06_18_071924_create_comments_table',4),(19,'2021_06_18_072908_create_guests_table',5),(20,'2021_06_18_074321_create_brides_table',6),(21,'2021_06_18_074333_create_parents_table',6),(22,'2021_07_12_232812_create_special_thanks_table',7),(23,'2023_07_14_031902_create_love_stories_table',8),(24,'2023_09_21_023238_create_reservation_schedules_table',9),(25,'2023_09_21_023314_create_reservation_lists_table',9),(26,'2023_09_21_035121_create_guest_books_table',10);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `bride_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parents_parent_id_unique` (`parent_id`),
  KEY `parents_bride_id_foreign` (`bride_id`),
  CONSTRAINT `parents_bride_id_foreign` FOREIGN KEY (`bride_id`) REFERENCES `brides` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (6,'PR-1624339764000',NULL,'Bapak Adih Purnama','Ayah kandung','active',1,4,'1','1','2021-06-21 22:29:24','2021-06-22 08:06:30'),(7,'PR-1624339793802',NULL,'Ibu Ai Rohayati','Ibu kandung','active',1,4,'1','1','2021-06-21 22:29:54','2021-06-22 08:06:23'),(8,'PR-1624339824405',NULL,'Bapak Ade','Ayah kandung','active',1,5,'1','1','2021-06-21 22:30:25','2021-06-22 08:06:36'),(9,'PR-1624339835667',NULL,'Ibu Aan','Ibu kandung','active',1,5,'1','1','2021-06-21 22:30:37','2021-06-22 08:06:43');
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_permission_id_unique` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'PR-000000001','dashboard','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(2,'PR-000000002','bizpars','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(3,'PR-000000003','themes','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(4,'PR-000000004','songs','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(5,'PR-000000005','invitations','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(6,'PR-000000006','events','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(7,'PR-000000007','categories','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(8,'PR-000000008','brides','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(9,'PR-000000009','parents','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(10,'PR-000000010','guests','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(11,'PR-000000011','galleries','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(12,'PR-000000012','articles','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(13,'PR-000000013','benefits','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(14,'PR-000000014','feedbacks','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(15,'PR-000000015','permissions','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(16,'PR-000000016','roles','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(17,'PR-000000017','users','Lorem ipsum dolor ismet.','active',NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(18,'PR-1624005967227','comments','comments','active',NULL,NULL,NULL,NULL),(19,'PR-1626133543944','specialthanks','Special Thanks','active',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\User',1,'my-token','73c86f6ec4db8351ebe20895c2e14fa4faf7f254bad7a08338286676a6531065','[\"*\"]','2021-06-18 19:22:04','2021-06-17 22:59:22','2021-06-18 19:22:04'),(9,'App\\User',1,'my-token','28996d5d32af7fc3df9ce50ada584927eead9076273c43161ad0cad4ecde7753','[\"*\"]','2021-06-23 23:14:44','2021-06-21 20:42:18','2021-06-23 23:14:44'),(13,'App\\User',1,'my-token','bdffd6c82e0774fe934adab2a4b1c8477e3be0ab88c63b7bc428cd0e284b2cf1','[\"*\"]','2021-07-02 21:49:16','2021-07-02 01:48:48','2021-07-02 21:49:16'),(17,'App\\User',1,'my-token','3754fe7a09614a69b73f201a490f7bd40503a52e88277f26324857f3b51e83de','[\"*\"]','2021-07-06 03:25:34','2021-07-06 03:22:42','2021-07-06 03:25:34'),(25,'App\\User',1,'my-token','c34ecd81cf8c17f8bf52be56baeaf28df10847d1356f75a6555e57ef66060844','[\"*\"]','2021-07-12 17:11:12','2021-07-12 16:48:54','2021-07-12 17:11:12'),(47,'App\\User',1,'my-token','3fe42036228dc8491e0be9ccb62cd33e62823e12c725980ac7ce50b2dff10606','[\"*\"]','2022-08-05 06:04:34','2022-08-03 19:07:36','2022-08-05 06:04:34'),(48,'App\\User',1,'my-token','b0831ce2842f7596b54388cddc28e64c68fed80dbc233697ff38bc7c79c14806','[\"*\"]','2022-08-11 22:49:24','2022-08-10 19:46:57','2022-08-11 22:49:24'),(50,'App\\User',1,'my-token','07ce2744a05407c9e869abc9dd450ad9b3f0f8f06b35bb141fd0a440b8190f9f','[\"*\"]','2022-08-31 22:24:30','2022-08-25 04:14:46','2022-08-31 22:24:30'),(55,'App\\User',1,'my-token','aa5e19f8f18e1dfda2c1f3085fabe87eb3d6027f48168ad9ae495c0b4b248607','[\"*\"]','2022-11-05 02:56:11','2022-11-05 02:56:11','2022-11-05 02:56:11'),(73,'App\\User',1,'my-token','c2b20a8212ad3fb78dcb062464c57918f3e09ec31569fc06924f9a86770e51c1','[\"*\"]','2024-02-21 08:56:29','2024-02-21 07:57:50','2024-02-21 08:56:29'),(75,'App\\User',1,'my-token','d69936c11b9225c4b1030a8f2115826a08ceeead2d09ef963a8174e2abbbd4cf','[\"*\"]','2024-04-05 14:41:25','2024-04-05 14:41:08','2024-04-05 14:41:25'),(79,'App\\User',1,'my-token','d344740959a07c6e01d2cfaa2b68214f2687f1b3a8bdecd1adc2dbad1fa7c8eb','[\"*\"]','2024-05-09 21:17:11','2024-05-09 19:33:29','2024-05-09 21:17:11'),(80,'App\\User',1,'my-token','4ee0e5a694c2f1d604e665c7f19ba906147e79b8d5baf9e424e96bcdfd7f74dc','[\"*\"]','2024-07-05 18:09:37','2024-07-05 17:04:15','2024-07-05 18:09:37'),(83,'App\\User',1,'my-token','6abbca80c5761785a048a71ba499a7267afe73262df5653165e82aca763f237f','[\"*\"]','2025-01-31 01:59:45','2025-01-31 00:59:09','2025-01-31 01:59:45'),(91,'App\\User',1,'my-token','a44b121ea365b8b074cc294347cf3976b87a53e169b5e29c77c8e28077f9d22d','[\"*\"]','2025-04-06 23:03:11','2025-04-06 09:34:20','2025-04-06 23:03:11'),(92,'App\\User',1,'my-token','f3c1931abfc78443e8b6c734f544084505d604c1929fc7c55f070979ec6b85cd','[\"*\"]','2025-06-05 09:05:23','2025-06-05 08:28:24','2025-06-05 09:05:23'),(93,'App\\User',1,'my-token','5a17cb6cc9b6c4e90f7d8cb4f93db772a83b9007f51b756d02a5f4d0c7480e9f','[\"*\"]','2026-06-27 21:27:02','2026-06-27 21:25:25','2026-06-27 21:27:02');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_lists`
--

DROP TABLE IF EXISTS `reservation_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reservation_list_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance` int unsigned DEFAULT '0',
  `present_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_invited` tinyint unsigned DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `bride_id` bigint unsigned DEFAULT NULL,
  `reservation_schedule_id` bigint unsigned DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservation_lists_reservation_list_id_unique` (`reservation_list_id`),
  KEY `reservation_lists_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `reservation_lists_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_lists`
--

LOCK TABLES `reservation_lists` WRITE;
/*!40000 ALTER TABLE `reservation_lists` DISABLE KEYS */;
INSERT INTO `reservation_lists` VALUES (2,'RL-1695363973833',NULL,'test',NULL,NULL,NULL,5,'will-present',0,'active',0,6,4,4,'1','1','2023-09-21 23:26:20','2023-11-27 19:05:45'),(3,'RL-1695363993258',NULL,'test 2',NULL,NULL,'Test Wae',3,'will-present',0,'active',0,6,NULL,3,'1','6','2023-09-21 23:26:41','2023-11-27 22:12:44'),(4,'RL-1701131631418',NULL,'test 3',NULL,NULL,NULL,0,'waiting-response',0,'active',0,6,NULL,NULL,'1','1','2023-11-27 17:34:02','2023-11-27 17:34:13'),(6,'GE-6-48608086172',NULL,'Rendjana Wedding',NULL,'Di Tempat','Lorem ipsum',1,'will-present',NULL,'active',1,6,NULL,NULL,'1','2','2023-11-27 18:30:30','2023-11-30 18:39:42'),(7,'RL-1701151373743',NULL,'Ganjar Hadiatna',NULL,NULL,'Ahuy',3,'will-present',NULL,'active',1,6,NULL,4,'6','6','2023-11-27 23:02:53','2023-11-27 23:02:53'),(15,'RL-1704555450666',NULL,'Test',NULL,NULL,NULL,2,'will-present',NULL,'active',1,6,NULL,3,'6','6','2024-01-06 08:37:30','2024-01-06 08:37:30');
/*!40000 ALTER TABLE `reservation_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_schedules`
--

DROP TABLE IF EXISTS `reservation_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reservation_schedule_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_date` date NOT NULL,
  `schedule_time` varchar(192) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_timezone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservation_schedules_reservation_schedule_id_unique` (`reservation_schedule_id`),
  KEY `reservation_schedules_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `reservation_schedules_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_schedules`
--

LOCK TABLES `reservation_schedules` WRITE;
/*!40000 ALTER TABLE `reservation_schedules` DISABLE KEYS */;
INSERT INTO `reservation_schedules` VALUES (3,'RS-1695361059549','2023-09-30','09:00 - 12:00','WIB','Sesi 1','active',0,6,'1',NULL,'2023-09-21 22:38:05',NULL),(4,'RS-1695361165796','2023-09-30','12:00 - 15:00','WIB','Sesi 2','active',0,6,'1',NULL,'2023-09-21 22:39:40',NULL);
/*!40000 ALTER TABLE `reservation_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_permissions_role_id_foreign` (`role_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1,1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(2,1,2,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(3,1,3,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(4,1,4,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(5,1,5,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(6,1,6,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(7,1,7,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(8,1,8,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(10,1,10,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(11,1,11,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(12,1,12,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(13,1,13,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(14,1,14,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(15,1,15,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(16,1,16,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(17,1,17,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(18,2,1,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(19,2,5,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(20,2,6,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(22,2,8,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(23,2,9,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(24,2,10,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(25,2,11,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(27,2,18,NULL,NULL,'2021-06-18 01:46:57','2021-06-18 01:46:57'),(28,1,19,NULL,NULL,'2021-07-12 16:45:59','2021-07-12 16:45:59');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_role_id_unique` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE0001','admin','Lorem ipsum dolor ismet.','active','2020-06-28 12:08:45','2020-06-28 12:08:45'),(2,'ROLE0002','customer','Lorem ipsum dolor ismet.','active','2020-06-28 12:08:45','2020-06-28 12:08:45');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `song_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `song` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `songs_song_id_unique` (`song_id`),
  KEY `songs_category_id_foreign` (`category_id`),
  CONSTRAINT `songs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'SG0001','SG00011626762556pristine609.mp3','SONGS 1','Lorem ipsum dolor ismet.','active',1,1,NULL,'1','2020-06-28 12:08:45','2021-07-19 23:29:16'),(2,'SG0002',NULL,'SONGS 2','Lorem ipsum dolor ismet.','active',1,2,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(3,'SG0003',NULL,'SONGS 3','Lorem ipsum dolor ismet.','active',1,3,NULL,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(5,'SH0004','SH00041626762409pristine609.mp3','SONGS 4','Lorem ipsum','active',1,2,'1','1','2021-06-17 23:08:23','2021-07-19 23:26:49');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_thanks`
--

DROP TABLE IF EXISTS `special_thanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_thanks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `specialthanks_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_editor` tinyint(1) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `invitation_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `special_thanks_specialthanks_id_unique` (`specialthanks_id`),
  KEY `special_thanks_invitation_id_foreign` (`invitation_id`),
  CONSTRAINT `special_thanks_invitation_id_foreign` FOREIGN KEY (`invitation_id`) REFERENCES `invitations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_thanks`
--

LOCK TABLES `special_thanks` WRITE;
/*!40000 ALTER TABLE `special_thanks` DISABLE KEYS */;
INSERT INTO `special_thanks` VALUES (2,'SE-1626134343925','SE-16261343439251661509533banner.png','fa fa-lw fa-globe','UNDANGABI','https://undangabi.com','active',NULL,1,6,'1','1','2021-07-12 16:59:05','2022-08-26 03:25:33'),(3,'SE-1626134749738','SE-162613474973816615095144664661926cashpaymenticonmoneyiconhdpngdownload.png','fa fa-lw fa-camera','Zeal Photography','https://www.instagram.com/zealphotography_14/','active',NULL,1,6,'1','1','2021-07-12 17:05:50','2022-08-26 03:25:14'),(4,'SE-1661509317882','SE-16615093178821661509502349260.png',NULL,'Test 2','test 2','active',NULL,0,6,'1','1','2022-08-26 03:22:13','2022-08-26 03:25:02'),(5,'SE-1720228164990',NULL,NULL,'Excepturi rerum aliq','Qui ad cupidatat off','active',0,0,13,'1',NULL,'2024-07-05 18:09:29',NULL);
/*!40000 ALTER TABLE `special_thanks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `is_available` tinyint(1) NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_theme_id_unique` (`theme_id`),
  KEY `themes_category_id_foreign` (`category_id`),
  CONSTRAINT `themes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (7,'TH-1642216393849','TH-16422163938491689216826roseoriginal.png','ROSE THEME','ROSE THEME','active',1,1,'1','1','2022-01-14 13:13:15','2023-07-12 12:53:47'),(9,'TH-1642732027932','TH-16427320279321689221757daisyoriginal.png','DAISY THEME','DAISY THEME','active',1,1,'1','1','2022-01-20 12:27:10','2023-07-12 14:15:57'),(10,'TH-1642824330599','TH-16428243305991689221866lilyoriginal.png','LILY THEME','LILY THEME','active',1,1,'1','1','2022-01-21 14:05:31','2023-07-12 14:17:46'),(12,'TH-1644142260684','TH-16441422606841689215703alamanda.png','ALAMANDA THEME','ALAMANDA THEME','active',1,1,'1','1','2022-02-05 20:11:02','2023-07-12 12:35:03'),(14,'TH-1645775387363','TH-16457753873631658493680InstagramPost–clover.png','CLOVER THEME','CLOVER THEME','active',1,1,'1','1','2022-02-24 17:49:48','2022-07-21 22:41:20'),(15,'TH-1651199175700','TH-16511991757001689215732lilysagegreen.png','LILY THEME - SAGE GREEN','LILY THEME - SAGE GREEN','active',1,1,'1','1','2022-04-28 12:26:17','2023-07-12 12:35:32'),(16,'TH-1651838345001','TH-16518383450011689216862rosesagegreen.png','ROSE THEME - SAGE GREEN','ROSE THEME - SAGE GREEN','active',1,1,'1','1','2022-05-05 21:59:06','2023-07-12 12:54:22'),(17,'TH-1659160482827','TH-16591604828271689221803roseoriginal.png','ROSE THEME - CUSTOM 1','ROSE THEME - CUSTOM 1 (English Version)','inactive',1,1,'1','1','2022-07-29 15:54:44','2023-09-13 21:47:08'),(20,'TH-1660976214763','TH-16609762147631663758840767A6B9FEE0C4B0E862A5BF14643AEB8.jpeg','CLOVER THEME - FORMAL EVENT','CLOVER THEME - FORMAL EVENT','active',1,2,'1','1','2022-08-19 16:16:55','2022-09-20 21:14:00'),(21,'TH-1675403689801','TH-16754036898011689221777daisyengagement.png','DAISY THEME - ENGAGEMENT','DAISY THEME - ENGAGEMENT','active',1,2,'1','1','2023-02-02 15:54:51','2023-07-12 14:16:17'),(22,'TH-1677307603023','TH-16773076030231689216777diviaoriginal.png','DIVIA THEME','DIVIA THEME','active',1,1,'1','1','2023-02-24 16:46:44','2023-07-12 12:52:57'),(23,'TH-1677553230053','TH-16775532300531689216801diviasagegreen.png','DIVIA THEME - SAGE GREEN','DIVIA THEME - SAGE GREEN','active',1,1,'1','1','2023-02-27 13:00:31','2023-07-12 12:53:21'),(24,'TH-1685962308305','TH-16859623083051689215685traditionalblackgold.png','TRADITIONAL - BLACK GOLD','TRADITIONAL - BLACK GOLD','active',1,1,'1','1','2023-06-04 20:51:50','2023-07-12 12:34:45'),(25,'TH-1686036860211','TH-16860368602111689215676traditionalbrown.png','TRADITIONAL - BROWN','TRADITIONAL - BROWN','active',1,1,'1','1','2023-06-05 17:34:21','2023-07-12 12:34:36'),(26,'TH-1686190608591','TH-16861906085911689215666traditionalgreen.png','TRADITIONAL - GREEN','TRADITIONAL - GREEN','active',1,1,'1','1','2023-06-07 12:16:50','2023-07-12 12:34:26'),(27,'TH-1693491074353','TH-16934910743531699167624LavenderLightBlue.png','LILY - LIGHT BLUE','LILY - LIGHT BLUE','active',1,1,'1','1','2023-08-31 00:11:15','2023-11-04 17:00:24'),(28,'TH-1694234919026','TH-16942349190261699167635LavenderSageGreen.png','TULIP - SAGE GREEN','TULIP - SAGE GREEN','active',1,1,'1','1','2023-09-08 14:48:40','2023-11-04 17:00:35'),(29,'TH-1695100119192','TH-16951001191921699167680LavenderLightBlue.png','TULIP - LIGHT BLUE','TULIP - LIGHT BLUE','active',1,1,'1','1','2023-09-18 15:08:40','2023-11-04 17:01:20'),(30,'TH-1697771133884','TH-16977711338841699167652LavenderBurgundy.png','TULIP - BURGUNDY','TULIP - BURGUNDY','active',1,1,'1','1','2023-10-19 13:05:34','2023-11-04 17:00:52'),(31,'TH-1698473022493',NULL,'TULIP - FULL WHITE','TULIP - FULL WHITE','active',0,1,'1',NULL,'2023-10-27 16:03:43',NULL),(32,'TH-1698806844675',NULL,'PINK FLOWERS','PINK FLOWERS','active',1,1,'1','1','2023-10-31 12:47:48','2023-11-01 11:03:41'),(33,'TH-1698887011009',NULL,'BLUE FLOWERS','BLUE FLOWERS','active',1,1,'1',NULL,'2023-11-01 11:03:32',NULL),(34,'TH-1699092166434',NULL,'BLACK TRANSPARENT','BLACK TRANSPARENT','active',1,1,'1','1','2023-11-03 20:02:47','2023-11-04 16:16:30'),(35,'TH-1699165004349',NULL,'SAGE GREEN TRANSPARENT','SAGE GREEN TRANSPARENT','active',1,1,'1','1','2023-11-04 16:16:45','2023-11-16 09:53:23'),(36,'TH-1715308488561',NULL,'SIMPLE WEB','SIMPLE WEB','active',1,1,'1',NULL,'2024-05-09 19:34:49',NULL);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `role_id` bigint unsigned NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin','admin@gmail.com',NULL,'$2y$10$SAxExoRE0MLJojGiG44uMuh1zGd2uClaoW7qNab1PzYVhsrGh.i0S',NULL,1,'active',1,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45'),(2,'Customer','customer','customer@gmail.com',NULL,'$2y$10$SAxExoRE0MLJojGiG44uMuh1zGd2uClaoW7qNab1PzYVhsrGh.i0S',NULL,1,'active',2,NULL,'2020-06-28 12:08:45','2020-06-28 12:08:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_undangabi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-28 11:34:43
