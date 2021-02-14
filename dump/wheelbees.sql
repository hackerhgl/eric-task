-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: wheelbees
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adonis_schema`
--

DROP TABLE IF EXISTS `adonis_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adonis_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  `migration_time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema`
--

LOCK TABLES `adonis_schema` WRITE;
/*!40000 ALTER TABLE `adonis_schema` DISABLE KEYS */;
INSERT INTO `adonis_schema` VALUES (1,'database/migrations/1587988332388_users',1,'2020-12-07 21:01:24'),(2,'database/migrations/1592489784670_api_tokens',1,'2020-12-07 21:01:24'),(3,'database/migrations/1607390538312_update_users',2,'2020-12-08 01:23:08'),(4,'database/migrations/1607424285888_social_auth_users',3,'2020-12-08 10:53:47'),(10,'database/migrations/1607438430216_update_user_fbs',4,'2020-12-08 21:29:16'),(12,'database/migrations/1607480849633_verification_codes',5,'2020-12-09 05:00:00'),(13,'database/migrations/1610032734433_versions',6,'2021-01-22 19:47:24'),(14,'database/migrations/1611861656835_license_plates',7,'2021-01-28 20:12:21'),(15,'database/migrations/1612013595971_notify_users',8,'2021-01-30 18:11:44'),(16,'database/migrations/1612096909791_users',9,'2021-02-03 16:59:26'),(18,'database/migrations/1612620460297_avatars',10,'2021-02-06 14:12:40'),(19,'database/migrations/1612726622268_user_statuses',11,'2021-02-07 19:45:06');
/*!40000 ALTER TABLE `adonis_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `api_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `api_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
INSERT INTO `api_tokens` VALUES (215,81,'Opaque Access Token','opaque_token','7dcd55738c79094ed1a4e33b68945817ba230a985907deb6c197954c36767106',NULL,'2020-12-23 16:58:09'),(216,88,'Opaque Access Token','opaque_token','591e8fecb9a7ba32d7057a2bb68ca4fa6784fa096d9c649faa73a8db335b5da8',NULL,'2020-12-23 17:37:47'),(217,81,'Opaque Access Token','opaque_token','4b7aa833bee4c3214beaa15c96e41344bed1ef96017a7211df27c66ac0c0fbac',NULL,'2020-12-23 17:46:57'),(218,81,'Opaque Access Token','opaque_token','507f24031d6288ab174161765e1d9dffbc13fb69de6cff385cf864a4bc028a17',NULL,'2020-12-30 12:20:32'),(219,81,'Opaque Access Token','opaque_token','bfc516c0240693ba6c8565d7cb73853c76596b6d936d994a03a24cc0d4f575a5',NULL,'2020-12-30 13:15:57'),(227,81,'Opaque Access Token','opaque_token','243696ea2be125f613bf33d8001260aab2566208879a19c3edbabdc2a61d2520',NULL,'2020-12-31 19:15:56'),(228,81,'Opaque Access Token','opaque_token','a4dad23e67dbd202c1426ba875204de5029eb2ff5a17bf1548d720d0776f3f33',NULL,'2020-12-31 19:39:14'),(233,81,'Opaque Access Token','opaque_token','835fbac2d29910f345b3abd8787250f2d5d14b7361e2821f6de3155ce79f7094',NULL,'2021-01-03 18:40:00'),(234,81,'Opaque Access Token','opaque_token','7f7de35aa3fa1739ec7da4dd42002699f6255370e46274b7c252c6b8267d2a4f',NULL,'2021-01-07 15:09:03'),(235,81,'Opaque Access Token','opaque_token','a8365e87a3004491334c839a3ff1000c4e9b4a767c1ec608085d4843cd991d5b',NULL,'2021-01-07 18:00:31'),(237,81,'Opaque Access Token','opaque_token','0b2b74dcd8d0ed8304bc2cd72cb502f2a78e6c134182de3c1b557e1ff4f9a2a5',NULL,'2021-01-22 20:07:43'),(240,81,'Opaque Access Token','opaque_token','0edd2fc6f479a1255c00e6911f0f55a905ce7349b6c5ed250b1e46e11e0eac76',NULL,'2021-01-28 18:07:54'),(241,81,'Opaque Access Token','opaque_token','c8fd473f69dfdd08b48a4767f20efde062caaadf2a28b4a9ffb35c6dba43a75b',NULL,'2021-01-28 18:20:51'),(242,81,'Opaque Access Token','opaque_token','2fde5ba837f49238e6e6576ae8c7a2d6a5bbc24c7038fcf9576a9c40222f5e03',NULL,'2021-01-28 18:22:33'),(243,81,'Opaque Access Token','opaque_token','3cb22d8fe48c1f7b3d0846c075d42a32b244b3dfd6f2d3913a788694a6110aba',NULL,'2021-01-28 18:31:04'),(244,81,'Opaque Access Token','opaque_token','fe799bc5363551ba02d536fb0d83602842d0688e7c17c116e4b4487d88e55947',NULL,'2021-01-28 18:37:09'),(245,81,'Opaque Access Token','opaque_token','48e0d6af46785ccdfd77cd471d08a70c82c288d09efc21ba9e27c64114242468',NULL,'2021-01-28 18:37:28'),(246,81,'Opaque Access Token','opaque_token','4efb93238c1454bf9fe05f08f3822af67a3e54bc1516830b3925dc0d4954dc3c',NULL,'2021-01-28 18:38:06'),(247,81,'Opaque Access Token','opaque_token','37b15029cc7fbe8b9361b4f0d5a4ba6efcc0bbc2dca4c8f7abb6251ecd86510d',NULL,'2021-01-28 18:38:55'),(248,81,'Opaque Access Token','opaque_token','a6a4ee95c8719d12a5660ec53b01574271593c539dbbb2bb304867de78939eda',NULL,'2021-01-28 19:14:46'),(252,81,'Opaque Access Token','opaque_token','9497817174f7243ab32e00ff7fbe42365c7459ef02179604b1824c0648831f78',NULL,'2021-01-30 15:41:07'),(253,81,'Opaque Access Token','opaque_token','8bd64f0c8df7b2729ef5769830094ffeb7b48a0673fb56fe5eb74ac3dc010495',NULL,'2021-01-30 17:00:01'),(254,81,'Opaque Access Token','opaque_token','39f4e9f6d396fe59ce41db0ecb2a4a5c307da9db2cc4bd6295a80944abcbbe20',NULL,'2021-01-30 18:11:10'),(255,96,'Opaque Access Token','opaque_token','d447fbcd787b0011f3c9bc314f4557c1aff02b855ae9f3371483a0268279f11d',NULL,'2021-01-30 18:13:56'),(256,96,'Opaque Access Token','opaque_token','58a6834bf3b46bb82fe63c9cca216a6f9e962abaf1bbcb6fa0b7f6785e0241de',NULL,'2021-01-30 18:14:51'),(257,96,'Opaque Access Token','opaque_token','76e5b5435c8516c9e19e4796a34f51da10082bbd211851983708c8d81a19a4ce',NULL,'2021-01-30 18:15:09'),(258,81,'Opaque Access Token','opaque_token','d1896624f12f2a545e6f2f819a623dea739b54ab3e23696c00f9bbb379ef9472',NULL,'2021-01-30 18:15:12'),(259,96,'Opaque Access Token','opaque_token','3074a022bfbfceb3512e2a9613d249ba2b716e6a4911a4c9623f66dfe5fea26d',NULL,'2021-01-30 18:15:15'),(260,81,'Opaque Access Token','opaque_token','30309bafd59bc855dfe87608d89f07cf54672d25c78bf71e99287f9cc77ee710',NULL,'2021-01-30 18:20:04'),(261,96,'Opaque Access Token','opaque_token','18fca65fdb2c5ae0f2de8738588538345fd1de2a47485bbca4c694683aed7213',NULL,'2021-01-31 08:34:48'),(266,81,'Opaque Access Token','opaque_token','ce54d717ccdbc42995f826c358bea35ddca92dbfd950b624b1f1079cc5a626f4',NULL,'2021-01-31 12:19:25'),(274,98,'Opaque Access Token','opaque_token','a5f4feba95a018f30d406b7d6d7f53e32616349da7ebcc7b0af1553fa1341c4f',NULL,'2021-02-03 17:01:04'),(275,101,'Opaque Access Token','opaque_token','c20117edf626ada510c70f66f79022ec9f58bd2c582c9c2e32afb88e536508aa',NULL,'2021-02-03 17:01:15'),(276,103,'Opaque Access Token','opaque_token','e0116fbd12c29b61c7605e2b688e559bae0c666b325a2ca6e356a519360aaa95',NULL,'2021-02-03 17:06:30'),(277,105,'Opaque Access Token','opaque_token','69738588a0bbb5288f851902c068f915eb3eea1115539cd886dcd2dbb24f8998',NULL,'2021-02-03 17:06:58'),(279,81,'Opaque Access Token','opaque_token','2d31fe1449279dc362da18a7d4dac81e4c451b61bbc66d07568d7067d34fe9f2',NULL,'2021-02-06 14:14:58'),(280,81,'Opaque Access Token','opaque_token','33e9f31d0f5badcd4e8cf3e006c87cecf3c0d12af6851b32e6926a30a67edb8a',NULL,'2021-02-07 21:40:10'),(281,81,'Opaque Access Token','opaque_token','5f3cd83db13c53d2d69510b33895e1faee5efb510ef293131ccbd7eb254d6bd0',NULL,'2021-02-09 07:41:04'),(282,81,'Opaque Access Token','opaque_token','f754c2133bfbcce54ea6b2272069780f9f64d86f97b1ab68fd568689171b9d8e',NULL,'2021-02-13 19:19:50'),(285,81,'Opaque Access Token','opaque_token','0ca775d2a0e919e6793889e317bc31f3f9ee5ec2fc09bf5fb4fd86d5a672a849',NULL,'2021-02-13 20:16:26');
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `platform` enum('android','ios','web','sdk') NOT NULL,
  `latest` varchar(10) DEFAULT NULL,
  `minimum` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_version_platform_unique` (`platform`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
INSERT INTO `app_version` VALUES (1,'ios','1.0.0','1.0.0','2021-01-30 15:44:04','2021-01-30 15:44:04'),(2,'android','2.1.1','1.0.1','2021-01-24 14:29:52','2021-01-24 14:29:52'),(3,'web','1.0.0','1.0.0','2021-01-22 20:08:24','2021-01-22 20:08:24'),(4,'sdk','1.0.0','1.0.0','2021-01-22 20:08:24','2021-01-22 20:08:24');
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_plates`
--

DROP TABLE IF EXISTS `license_plates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `license_plates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(50) NOT NULL,
  `country` varchar(2) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_plates_no_country_unique` (`no`,`country`),
  KEY `license_plates_user_id_foreign` (`user_id`),
  KEY `license_plates_no_country_index` (`no`,`country`),
  CONSTRAINT `license_plates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_plates`
--

LOCK TABLES `license_plates` WRITE;
/*!40000 ALTER TABLE `license_plates` DISABLE KEYS */;
INSERT INTO `license_plates` VALUES (13,'pk-1012','pk',81,1,'2021-02-09 21:44:51','2021-02-09 21:44:51');
/*!40000 ALTER TABLE `license_plates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_users`
--

DROP TABLE IF EXISTS `notify_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(50) NOT NULL,
  `country` varchar(2) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notify_users_no_country_user_id_unique` (`no`,`country`,`user_id`),
  KEY `notify_users_user_id_foreign` (`user_id`),
  KEY `notify_users_no_country_user_id_index` (`no`,`country`,`user_id`),
  CONSTRAINT `notify_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_users`
--

LOCK TABLES `notify_users` WRITE;
/*!40000 ALTER TABLE `notify_users` DISABLE KEYS */;
INSERT INTO `notify_users` VALUES (1,'Pk-1012','pk',96,1,'2021-01-30 18:18:03','2021-01-30 18:18:03'),(2,'Pk-1012','pk',81,1,'2021-01-30 19:32:48','2021-01-30 19:32:48'),(3,'Pk-1013','pk',81,1,'2021-02-12 19:41:24','2021-02-12 19:41:24'),(4,'pk-1012a','PK',81,1,'2021-02-12 19:50:45','2021-02-12 19:50:45'),(5,'pk-1012aa','PK',81,1,'2021-02-12 19:58:01','2021-02-12 19:58:01');
/*!40000 ALTER TABLE `notify_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(180) DEFAULT NULL,
  `remember_me_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `apple` varchar(255) DEFAULT NULL,
  `role` enum('guest','user','deo','admin','super-admin') NOT NULL DEFAULT 'user',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `country` varchar(2) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `google` (`google`),
  UNIQUE KEY `facebook` (`facebook`),
  UNIQUE KEY `apple` (`apple`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (81,'hackerhgl@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$Yj6PdsuHVOZuEyxOW117hg$f0mL9JJqxk83t0UBTt9Z3Y5KJyGOyasLrux4E5oOcXo',NULL,'2021-02-10 18:58:09','2021-02-07 21:45:18','Boo baaxxx',NULL,NULL,NULL,NULL,'admin',1,0,1,'pk','user-avatars/81.jpg','Rise n shine hellow workingaa'),(88,'hackerhgl1@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$ZnwkPTD+sP1WKXGRB1WecA$wiQfvMSW8uK20Oq5/n4voj8xot9uLbFUSnoY51ViDL8',NULL,'2020-12-23 17:37:47','2020-12-23 17:37:47',NULL,NULL,NULL,NULL,NULL,'user',1,0,0,NULL,NULL,NULL),(96,'hiqbal@voxlabs.io','$argon2id$v=19$t=3,m=4096,p=1$q0izjbIg2QAnNwDwwYhx9Q$s/mDZCFilxE912ySShrkcRA6d83Klkq0j8usBQz/ARE',NULL,'2021-01-31 14:02:49','2021-01-31 14:02:49',NULL,NULL,NULL,NULL,NULL,'user',1,0,1,NULL,NULL,NULL),(98,'hackerhgl12@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$foQVVOJhfeqqyYSYMWAntQ$cpQeboVwE3SqBCuhNn6369QXTzGKnPaK4iSdNEBoH8s',NULL,'2021-02-03 17:01:04','2021-02-03 17:01:04',NULL,NULL,NULL,NULL,NULL,'user',1,0,0,'PK',NULL,NULL),(101,'hackerhgl14@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$xzLfsaTg8a0XWekRfyzrpA$Wa/IRaRqHEhU9VsfSg82xs3ZZsxaClUvk6tdnpr2iNs',NULL,'2021-02-03 17:01:15','2021-02-03 17:01:15',NULL,NULL,NULL,NULL,NULL,'user',1,0,0,'PK',NULL,NULL),(103,'hackerhgl141@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$LiHe3eaDG2ECNVAcLsCh0w$r/pCZTJzM7f5ozT2xVHKZyGy7zPWSWbekvnGymIs6M8',NULL,'2021-02-03 17:06:30','2021-02-03 17:06:30','teasd',NULL,NULL,NULL,NULL,'user',1,0,0,'PK',NULL,NULL),(105,'hackerhgl149@gmail.com','$argon2id$v=19$t=3,m=4096,p=1$hxJsunYlX/BKSBsWv+0ZBQ$P1HvQ7u9OuZylkiFkrR5yiJtYWFBR+5SjuRrNJiOxjk',NULL,'2021-02-03 17:06:58','2021-02-03 17:06:58','teasd',NULL,NULL,NULL,NULL,'user',1,0,0,'PK',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_codes`
--

DROP TABLE IF EXISTS `verification_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `type` enum('email','password') NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `verification_codes_code_type_user_id_unique` (`code`,`type`,`user_id`),
  KEY `verification_codes_user_id_foreign` (`user_id`),
  KEY `verification_codes_code_type_user_id_index` (`code`,`type`,`user_id`),
  CONSTRAINT `verification_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_codes`
--

LOCK TABLES `verification_codes` WRITE;
/*!40000 ALTER TABLE `verification_codes` DISABLE KEYS */;
INSERT INTO `verification_codes` VALUES (23,'2673d3','email',81,0,'2020-12-30 16:20:37','2020-12-23 16:58:09','2020-12-30 13:20:37'),(24,'1279b5','email',88,1,'2020-12-23 20:37:47','2020-12-23 17:37:47','2020-12-23 17:37:47'),(25,'55abd3','password',81,1,'2020-12-31 18:29:03','2020-12-31 15:29:03','2020-12-31 15:29:03'),(28,'b54a98','email',96,0,'2021-01-30 21:15:04','2021-01-30 18:13:56','2021-01-30 18:15:04'),(29,'1e47af','password',96,0,'2021-01-31 17:02:49','2021-01-31 12:56:42','2021-01-31 14:02:49'),(30,'0c9015','email',98,1,'2021-02-03 20:01:04','2021-02-03 17:01:04','2021-02-03 17:01:04'),(31,'360ba1','email',101,1,'2021-02-03 20:01:15','2021-02-03 17:01:15','2021-02-03 17:01:15'),(32,'bbf2a3','email',103,1,'2021-02-03 20:06:30','2021-02-03 17:06:30','2021-02-03 17:06:30'),(33,'d1b09a','email',105,1,'2021-02-03 20:06:58','2021-02-03 17:06:58','2021-02-03 17:06:58');
/*!40000 ALTER TABLE `verification_codes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-14 17:41:05
