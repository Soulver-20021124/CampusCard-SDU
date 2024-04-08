-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: xdb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `x_good`
--

DROP TABLE IF EXISTS `x_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_good` (
  `good_id` int NOT NULL AUTO_INCREMENT,
  `good_name` varchar(50) NOT NULL,
  `business` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `time` varchar(30) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_good`
--

LOCK TABLES `x_good` WRITE;
/*!40000 ALTER TABLE `x_good` DISABLE KEYS */;
INSERT INTO `x_good` VALUES (1,'薯片','乐事',7,0,'2023-8-15','http://localhost:9999/file/1e03ba4ceb3e49fb942bdf388a8ab624.webp'),(2,'可乐','百事',3,0,'2023-8-15','http://localhost:9999/file/2174bb0d99984a379b037c17ba63e125.webp'),(3,'雪碧','百事',3,0,'2023-8-15','http://localhost:9999/file/f416dd92ce9447419d56a26170485640.webp'),(4,'脸盆','天猫超市',5,0,'2023-8-15','http://localhost:9999/file/4e7f9e593a7a4dcaaaadf9e3e9b61b4e.webp'),(5,'沐浴露','天猫超市',20,0,'2023-8-15','http://localhost:9999/file/429b31d5b0154a71ae5ae63c27ed5905.webp'),(6,'肥皂','天猫超市',8,0,'2023-8-18','http://localhost:9999/file/26b22b2f27a24c6a97f765d027d07b62.webp'),(7,'卫生纸','心相印',5,0,'2023-8-15','http://localhost:9999/file/ba2995497fd84af4be92d690ac35a25a.webp'),(8,'晾衣架','天猫超市',4,1,'2023-8-15','http://localhost:9999/file/86efe7ff315c4c77831a5a00704c2d2f.jpg'),(9,'钢笔','晨光',10,1,'2023-8-19','http://localhost:9999/file/c9493814cc6c48298818a0bd921ddfad.webp'),(10,'记事本','晨光',2,1,'2023-8-30','http://localhost:9999/file/bbce276ce75a414eb138182c3fb92115.jpg'),(11,'山大书签','山东大学',50,1,'2023-9-6','http://localhost:9999/file/6d1b0d897910477ba2880fa9cbe606c5.jpg'),(12,'山大书签','山东大学',50,1,'2023-9-6','http://localhost:9999/file/da6d7e5138e24a60b92bf7ae4947d93b.webp'),(13,'山大书签','山东大学',30,1,'2023-9-7','http://localhost:9999/file/c1f8617d1cc5431183094c1292c9f459.webp'),(14,'山大书签','山东大学',30,1,'2023-9-7','http://localhost:9999/file/47e49b108aaf4cbbbcb36ad0b6334c9b.webp'),(15,'山大书签','山东大学',30,1,'2023-9-7','http://localhost:9999/file/72596d50cb1e4355bdf0a8305835d09d.webp'),(16,'山大书签','山东大学',50,1,'2023-9-15','http://localhost:9999/file/b6a0e07dbe8441d1b4f9329b77b1e9d9.webp'),(17,'山大书签','山东大学',30,1,'2023-9-16','http://localhost:9999/file/6d1b0d897910477ba2880fa9cbe606c5.jpg');
/*!40000 ALTER TABLE `x_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_information`
--

DROP TABLE IF EXISTS `x_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_information` (
  `information_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_information`
--

LOCK TABLES `x_information` WRITE;
/*!40000 ALTER TABLE `x_information` DISABLE KEYS */;
INSERT INTO `x_information` VALUES (4,'管理员于2023-8-30发布了名为教材费用的缴费事项，请及时缴费。如已缴费请忽略','缴费',1),(5,'管理员于2023-8-30发布了名为教材费用的缴费事项，请及时缴费。如已缴费请忽略','缴费',2),(6,'管理员于2023-8-30发布了名为教材费用的缴费事项，请及时缴费。如已缴费请忽略','缴费',3),(7,'管理员于2023-8-30发布了名为教材费用的缴费事项，请及时缴费。如已缴费请忽略','缴费',4),(8,'管理员于2023-8-30发布了名为教材费用的缴费事项，请及时缴费。如已缴费请忽略','缴费',15),(9,'管理员于2023-8-30发布了名为教材费用的缴费事项，请及时缴费。如已缴费请忽略','缴费',16),(10,'管理员于2023-8-30发布了名为教材费用的缴费事项，请及时缴费。如已缴费请忽略','缴费',17),(11,'管理员于2023-9-3发布了名为 住宿费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-03',1),(12,'管理员于2023-9-3发布了名为 住宿费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-03',2),(13,'管理员于2023-9-3发布了名为 住宿费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-03',3),(14,'管理员于2023-9-3发布了名为 住宿费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-03',4),(15,'管理员于2023-9-3发布了名为 住宿费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-03',15),(16,'管理员于2023-9-3发布了名为 住宿费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-03',16),(17,'管理员于2023-9-3发布了名为 住宿费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-03',17),(18,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-05',18),(19,'您于2023-09-05进行了挂失操作，请确保是本人所操作','挂失2023-09-05',18),(20,'您于2023-09-05进行了解挂操作，请确保是本人所操作','解挂2023-09-05',18),(21,'您于2023-09-05进行了挂失操作，请确保是本人所操作','挂失2023-09-05',18),(22,'您于2023-09-05进行了解挂操作，请确保是本人所操作','解挂2023-09-05',18),(23,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-05',19),(24,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-05',20),(25,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-05',21),(26,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',1),(27,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',2),(28,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',3),(29,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',4),(30,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',15),(31,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',16),(32,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',17),(33,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',18),(34,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',19),(35,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',20),(36,'管理员于2023-9-6发布了名为 水电费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',21),(37,'管理员于 2023-09-06 同意了你的退费申请 50 元已返回你的账户','退费成功 2023-09-06',2),(38,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-06',22),(39,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',1),(40,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',2),(41,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',3),(42,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',4),(43,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',15),(44,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',16),(45,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',17),(46,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',18),(47,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',19),(48,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',20),(49,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',21),(50,'管理员于2023-9-6发布了名为 学分费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-06',22),(51,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-07',23),(52,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',1),(53,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',2),(54,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',3),(55,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',4),(56,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',15),(57,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',16),(58,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',17),(59,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',18),(60,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',19),(61,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',20),(62,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',21),(63,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',22),(64,'管理员于2023-9-7发布了名为 网费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',23),(65,'管理员于 2023-09-07 同意了你的退费申请 10 元已返回你的账户','退费成功 2023-09-07',23),(66,'管理员于 2023-09-07 拒绝了你的退费申请 ','退费失败 2023-09-07',23),(67,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-07',24),(68,'管理员于 2023-09-07 拒绝了你的退费申请 ','退费失败 2023-09-07',24),(69,'管理员于 2023-09-07 同意了你的退费申请 10 元已返回你的账户','退费成功 2023-09-07',24),(70,'管理员于 2023-09-07 同意了你的退费申请 30 元已返回你的账户','退费成功 2023-09-07',24),(71,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-07',25),(73,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',1),(74,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',2),(75,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',3),(76,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',4),(77,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',15),(78,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',16),(79,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',17),(80,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',18),(81,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',19),(82,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',20),(83,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',21),(84,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',22),(85,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',23),(86,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',24),(87,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',25),(88,'管理员于2023-9-7发布了名为 军训服装费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-07',26),(89,'管理员于 2023-09-07 同意了你的退费申请 30 元已返回你的账户','退费成功 2023-09-07',25),(90,'管理员于 2023-09-07 拒绝了你的退费申请 ','退费失败 2023-09-07',25),(91,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-15',27),(92,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',1),(93,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',2),(94,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',3),(95,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',4),(96,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',15),(97,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',16),(98,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',17),(99,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',18),(100,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',19),(101,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',20),(102,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',21),(103,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',22),(104,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',23),(105,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',24),(106,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',25),(107,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',26),(108,'管理员于2023-9-15发布了名为 学费 的缴费事项，请及时缴费。如已缴费请忽略','缴费2023-09-15',27),(109,'管理员于 2023-09-15 同意了你的退费申请 10 元已返回你的账户','退费成功 2023-09-15',27),(110,'管理员于 2023-09-15 拒绝了你的退费申请 ','退费失败 2023-09-15',27),(111,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-16',28),(112,'请尽快完善个人信息。如已完善请忽略','完善个人信息2023-09-16',29),(113,'管理员于 2023-09-16 同意了你的退费申请 30 元已返回你的账户','退费成功 2023-09-16',25),(114,'管理员于 2023-09-16 拒绝了你的退费申请 ','退费失败 2023-09-16',25),(115,'您于2023-09-21进行了挂失操作，请确保是本人所操作','挂失2023-09-21',25),(116,'您于2023-09-21进行了解挂操作，请确保是本人所操作','解挂2023-09-21',25),(117,'您于2023-09-21进行了挂失操作，请确保是本人所操作','挂失2023-09-21',25),(118,'您于2023-09-21进行了补办操作，您的新校园卡号是61275403请确保是本人所操作','补办2023-09-21',25);
/*!40000 ALTER TABLE `x_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_is_pay`
--

DROP TABLE IF EXISTS `x_is_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_is_pay` (
  `is_pay_id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `payment_name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`is_pay_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `x_is_pay_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `x_payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_is_pay`
--

LOCK TABLES `x_is_pay` WRITE;
/*!40000 ALTER TABLE `x_is_pay` DISABLE KEYS */;
INSERT INTO `x_is_pay` VALUES (1,3,2,'教材费用',150,'2023-09-03','张三'),(2,3,3,'教材费用',150,'2023-09-03','李四'),(3,3,4,'教材费用',150,'2023-09-03','王五'),(4,3,15,'教材费用',150,'2023-09-03','刘平'),(11,3,16,'教材费用',150,'2023-09-03','张伟'),(12,3,17,'教材费用',150,'2023-09-03','刘强'),(19,3,18,'教材费用',150,'2023-09-05','Alice'),(21,6,2,'住宿费',100,'2023-09-06','张三'),(22,3,21,'教材费用',150,'2023-09-06','李倩'),(23,6,21,'住宿费',100,'2023-09-06','李倩'),(24,6,20,'住宿费',100,'2023-09-06','李飞'),(25,7,2,'水电费',50,'2023-09-06','张三'),(26,8,22,'学分费',300,'2023-09-06','王明'),(27,9,23,'网费',180,'2023-09-07','张钊'),(28,9,24,'网费',180,'2023-09-07','小明'),(29,7,24,'水电费',50,'2023-09-07','小明'),(30,10,25,'军训服装费',100,'2023-09-07','郝宗铎'),(31,7,25,'水电费',50,'2023-09-07','郝宗铎'),(32,11,27,'学费',500,'2023-09-15','李华'),(33,3,25,'教材费用',150,'2023-09-21','郝宗铎');
/*!40000 ALTER TABLE `x_is_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_library`
--

DROP TABLE IF EXISTS `x_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_library` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(30) DEFAULT NULL,
  `seat_floor` int DEFAULT NULL,
  `seat_name` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_library`
--

LOCK TABLES `x_library` WRITE;
/*!40000 ALTER TABLE `x_library` DISABLE KEYS */;
INSERT INTO `x_library` VALUES (1,'未使用',1,'102',NULL,NULL),(2,'未使用',1,'103',NULL,NULL),(3,'未使用',1,'104',NULL,NULL),(4,'未使用',2,'102',NULL,NULL),(5,'未使用',2,'103',NULL,NULL),(6,'未使用',2,'104',NULL,NULL),(7,'未使用',1,'204',NULL,NULL),(8,'未使用',1,'203',NULL,NULL),(9,'未使用',1,'202',NULL,NULL),(10,'未使用',1,'201',NULL,NULL),(11,'未使用',2,'204',NULL,NULL),(12,'未使用',2,'203',NULL,NULL),(13,'未使用',2,'202',NULL,NULL),(14,'未使用',2,'201',NULL,NULL),(15,'未使用',3,'102',NULL,NULL),(16,'未使用',3,'103',NULL,NULL),(17,'未使用',3,'104',NULL,NULL),(18,'未使用',1,'101',NULL,NULL),(19,'未使用',1,'301',NULL,NULL),(20,'未使用',1,'302',NULL,NULL),(21,'未使用',1,'303',NULL,NULL),(22,'未使用',1,'304',NULL,NULL),(23,'未使用',1,'401',NULL,NULL),(24,'未使用',1,'402',NULL,NULL),(25,'未使用',1,'403',NULL,NULL),(26,'未使用',1,'404',NULL,NULL),(27,'未使用',1,'501',NULL,NULL),(28,'未使用',1,'502',NULL,NULL),(29,'未使用',1,'503',NULL,NULL),(30,'未使用',1,'504',NULL,NULL),(31,'未使用',1,'601',NULL,NULL),(32,'未使用',1,'602',NULL,NULL),(33,'未使用',1,'603',NULL,NULL),(34,'未使用',1,'604',NULL,NULL),(35,'使用中',1,'701',27,'lihua'),(36,'未使用',1,'702',NULL,NULL),(37,'未使用',2,'302',NULL,NULL),(38,'未使用',2,'304',NULL,NULL),(39,'未使用',2,'401',NULL,NULL),(40,'未使用',2,'402',NULL,NULL),(41,'未使用',2,'403',NULL,NULL),(42,'未使用',2,'404',NULL,NULL),(43,'未使用',2,'501',NULL,NULL),(44,'未使用',2,'502',NULL,NULL),(45,'未使用',2,'503',NULL,NULL),(46,'未使用',2,'504',NULL,NULL),(47,'未使用',2,'601',NULL,NULL),(48,'未使用',2,'602',NULL,NULL),(49,'未使用',2,'603',NULL,NULL),(50,'未使用',2,'604',NULL,NULL),(51,'未使用',2,'301',NULL,NULL),(52,'未使用',2,'303',NULL,NULL),(53,'未使用',2,'101',NULL,NULL),(54,'未使用',3,'302',NULL,NULL),(55,'未使用',3,'304',NULL,NULL),(56,'未使用',3,'401',NULL,NULL),(57,'未使用',3,'402',NULL,NULL),(58,'未使用',3,'403',NULL,NULL),(59,'未使用',3,'404',NULL,NULL),(60,'未使用',3,'501',NULL,NULL),(61,'未使用',3,'502',NULL,NULL),(62,'未使用',3,'503',NULL,NULL),(63,'未使用',3,'504',NULL,NULL),(64,'未使用',3,'201',NULL,NULL),(65,'未使用',3,'202',NULL,NULL),(66,'未使用',3,'203',NULL,NULL),(67,'未使用',3,'204',NULL,NULL),(68,'未使用',3,'301',NULL,NULL),(69,'未使用',3,'303',NULL,NULL),(70,'未使用',3,'101',NULL,NULL),(71,'未使用',4,'302',NULL,NULL),(72,'未使用',4,'304',NULL,NULL),(73,'未使用',4,'401',NULL,NULL),(74,'未使用',4,'402',NULL,NULL),(75,'未使用',4,'403',NULL,NULL),(76,'未使用',4,'404',NULL,NULL),(77,'未使用',4,'501',NULL,NULL),(78,'未使用',4,'502',NULL,NULL),(79,'未使用',4,'503',NULL,NULL),(80,'未使用',4,'504',NULL,NULL),(81,'未使用',4,'201',NULL,NULL),(82,'未使用',4,'202',NULL,NULL),(83,'未使用',4,'203',NULL,NULL),(84,'未使用',4,'204',NULL,NULL),(85,'未使用',4,'301',NULL,NULL),(86,'未使用',4,'303',NULL,NULL),(87,'未使用',4,'101',NULL,NULL),(88,'未使用',4,'102',NULL,NULL),(89,'未使用',4,'103',NULL,NULL),(90,'未使用',4,'104',NULL,NULL),(91,'未使用',4,'601',NULL,NULL),(92,'未使用',4,'602',NULL,NULL),(93,'未使用',4,'603',NULL,NULL),(94,'未使用',4,'604',NULL,NULL),(95,'未使用',4,'701',NULL,NULL),(96,'未使用',5,'401',NULL,NULL),(97,'未使用',5,'402',NULL,NULL),(98,'未使用',5,'403',NULL,NULL),(99,'未使用',5,'404',NULL,NULL),(100,'未使用',5,'501',NULL,NULL),(101,'未使用',5,'502',NULL,NULL),(102,'未使用',5,'503',NULL,NULL),(103,'未使用',5,'504',NULL,NULL),(104,'未使用',5,'201',NULL,NULL),(105,'未使用',5,'202',NULL,NULL),(106,'未使用',5,'203',NULL,NULL),(107,'未使用',5,'204',NULL,NULL),(108,'未使用',5,'301',NULL,NULL),(109,'未使用',5,'303',NULL,NULL),(110,'未使用',5,'101',NULL,NULL),(111,'未使用',5,'102',NULL,NULL),(112,'未使用',5,'103',NULL,NULL),(113,'未使用',5,'104',NULL,NULL),(114,'未使用',5,'601',NULL,NULL),(115,'未使用',5,'602',NULL,NULL),(116,'未使用',5,'603',NULL,NULL),(117,'未使用',6,'604',NULL,NULL),(118,'未使用',6,'701',NULL,NULL),(119,'未使用',5,'302',NULL,NULL),(120,'未使用',5,'304',NULL,NULL),(121,'未使用',6,'302',NULL,NULL),(122,'未使用',6,'304',NULL,NULL),(123,'未使用',6,'401',NULL,NULL),(124,'未使用',6,'402',NULL,NULL),(125,'未使用',6,'403',NULL,NULL),(126,'未使用',6,'404',NULL,NULL),(127,'未使用',6,'501',NULL,NULL),(128,'未使用',6,'502',NULL,NULL),(129,'未使用',6,'503',NULL,NULL),(130,'未使用',6,'504',NULL,NULL),(131,'未使用',6,'201',NULL,NULL),(132,'未使用',6,'202',NULL,NULL),(133,'未使用',6,'203',NULL,NULL),(134,'未使用',6,'204',NULL,NULL),(135,'未使用',6,'301',NULL,NULL),(136,'未使用',6,'303',NULL,NULL),(137,'未使用',6,'101',NULL,NULL),(138,'未使用',6,'102',NULL,NULL),(139,'未使用',6,'103',NULL,NULL),(140,'未使用',6,'104',NULL,NULL),(141,'未使用',6,'601',NULL,NULL),(142,'未使用',6,'602',NULL,NULL),(143,'未使用',6,'603',NULL,NULL),(144,'未使用',7,'302',NULL,NULL),(145,'未使用',7,'304',NULL,NULL),(146,'未使用',7,'401',NULL,NULL),(147,'未使用',7,'402',NULL,NULL),(148,'未使用',7,'403',NULL,NULL),(149,'未使用',7,'404',NULL,NULL),(150,'未使用',7,'501',NULL,NULL),(151,'未使用',7,'502',NULL,NULL),(152,'未使用',7,'503',NULL,NULL),(153,'未使用',7,'504',NULL,NULL),(154,'未使用',7,'201',NULL,NULL),(155,'未使用',7,'202',NULL,NULL),(156,'未使用',7,'203',NULL,NULL),(157,'未使用',7,'204',NULL,NULL),(158,'未使用',7,'301',NULL,NULL),(159,'未使用',7,'303',NULL,NULL),(160,'未使用',7,'101',NULL,NULL),(161,'未使用',7,'102',NULL,NULL),(162,'未使用',7,'103',NULL,NULL),(163,'未使用',7,'104',NULL,NULL),(164,'未使用',7,'601',NULL,NULL),(165,'未使用',7,'602',NULL,NULL),(166,'未使用',7,'603',NULL,NULL),(167,'未使用',7,'604',NULL,NULL),(168,'未使用',7,'701',NULL,NULL),(169,'未使用',7,'702',NULL,NULL),(170,'未使用',7,'703',NULL,NULL),(171,'未使用',7,'704',NULL,NULL),(172,'未使用',7,'801',NULL,NULL),(173,'未使用',7,'802',NULL,NULL);
/*!40000 ALTER TABLE `x_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_menu`
--

DROP TABLE IF EXISTS `x_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `component` varchar(100) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `redirect` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `is_leaf` varchar(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_menu`
--

LOCK TABLES `x_menu` WRITE;
/*!40000 ALTER TABLE `x_menu` DISABLE KEYS */;
INSERT INTO `x_menu` VALUES (1,'Layout','/sys','/sys/user','sysManage','系统管理','userManage',0,'N',0),(2,'sys/user','user',NULL,'userList','用户列表','user',1,'Y',0),(3,'sys/role','role',NULL,'roleList','角色列表','roleManage',1,'Y',0),(4,'Layout','/test','/test/test2','test','商品购买','goodLayout',0,'N',0),(5,'test/good','good','','good','商品管理','goods',4,'Y',0),(6,'test/buy','buy','','buy','购物页面','shopping',4,'Y',0),(7,'test/record','record','','record','消费记录','record',4,'Y',0),(8,'Layout','/test2','/test2/test2','test2','其他功能','functions',0,'N',0),(9,'test3/functions','functions',NULL,'functions','校园卡相关功能','table',16,'Y',0),(10,'test2/payment','payment',NULL,'payment','缴费管理','manage',8,'Y',0),(11,'test2/pay','pay',NULL,'pay','缴费','pay',8,'Y',0),(12,'test/singlerecord','singlerecord',NULL,'singlerecord','个人消费记录','record',4,'Y',0),(13,'test2/pie','pie',NULL,'pie','消费偏好饼状图','pie',4,'Y',0),(14,'test2/library','library',NULL,'library','图书馆预约','library',8,'Y',0),(15,'test2/isPay','isPay',NULL,'isPay','已支付事项','form',8,'Y',0),(16,'Layout','/test3','/test3/test','test3','个人中心','user',0,'N',0),(17,'test3/adminInfo','adminInfo',NULL,'adminInfo','个人信息修改','form',16,'Y',0),(18,'sys/student','student',NULL,'student','学生列表','form',1,'Y',0),(19,'test3/studentInfo','studentInfo',NULL,'studentInfo','个人信息修改','form',16,'Y',0),(20,'test/refund','refund',NULL,'refund','退费处理','refund',4,'Y',0);
/*!40000 ALTER TABLE `x_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_payment`
--

DROP TABLE IF EXISTS `x_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `payment_name` varchar(100) DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_payment`
--

LOCK TABLES `x_payment` WRITE;
/*!40000 ALTER TABLE `x_payment` DISABLE KEYS */;
INSERT INTO `x_payment` VALUES (3,150,'教材费用',0,'2023-08-24'),(6,100,'住宿费',0,'2023-9-3'),(7,50,'水电费',0,'2023-9-6'),(8,300,'学分费',0,'2023-9-6'),(9,180,'网费',1,'2023-9-7'),(10,100,'军训服装费',0,'2023-9-7'),(11,500,'学费',0,'2023-9-15');
/*!40000 ALTER TABLE `x_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_record`
--

DROP TABLE IF EXISTS `x_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `cost` int NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `user_name` varchar(50) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  `refund` int DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `x_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `x_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_record`
--

LOCK TABLES `x_record` WRITE;
/*!40000 ALTER TABLE `x_record` DISABLE KEYS */;
INSERT INTO `x_record` VALUES (1,66,'购物',1,0,'admin','2023-08-21',1),(2,5,'购物',1,0,'admin','2023-08-21',1),(3,66,'购物',1,0,'admin','2023-08-21',1),(4,5,'购物',1,0,'admin','2023-08-21',1),(5,5,'购物',1,0,'admin','2023-08-21',1),(6,5,'购物',1,0,'admin','2023-08-21',1),(7,5,'购物',1,0,'admin','2023-08-21',1),(8,5,'购物',1,0,'admin','2023-08-21',1),(9,5,'购物',1,0,'admin','2023-08-21',1),(10,200,'缴费',1,0,'admin','2023-08-21',1),(11,20,'购物',2,0,'张三','2023-08-21',1),(12,20,'充值',1,0,'admin','2023-08-21',1),(13,66,'购物',2,0,'张三','2023-08-21',1),(14,5,'购物',2,0,'张三','2023-08-21',1),(15,5,'购物',2,0,'张三','2023-08-21',1),(16,5,'购物',2,0,'张三','2023-08-21',1),(17,5,'购物',2,0,'张三','2023-08-21',1),(18,200,'缴费',3,0,'李四','2023-08-23',1),(19,200,'充值',2,0,'张三','2023-08-23',1),(20,200,'缴费',3,0,'李四','2023-08-23',1),(21,200,'充值',2,0,'张三','2023-08-23',1),(22,200,'缴费',3,0,'李四','2023-08-23',1),(23,200,'充值',2,0,'张三','2023-08-23',1),(24,200,'缴费',3,0,'李四','2023-08-23',1),(25,200,'充值',2,0,'张三','2023-08-23',1),(26,200,'缴费',2,0,'张三','2023-08-23',1),(27,200,'充值',2,0,'张三','2023-08-23',1),(28,200,'充值',2,0,'张三','2023-08-23',1),(29,200,'充值',3,0,'李四','2023-08-23',1),(30,100,'充值',2,0,'张三','2023-08-23',1),(31,100,'充值',3,0,'李四','2023-08-23',1),(32,100,'充值',3,0,'李四','2023-08-23',1),(33,100,'充值',3,0,'李四','2023-08-23',1),(34,100,'充值',2,0,'张三','2023-08-23',1),(35,100,'充值',2,0,'张三','2023-08-23',1),(36,100,'充值',2,0,'张三','2023-08-23',1),(37,100,'充值',3,0,'李四','2023-08-23',1),(38,100,'充值',2,0,'张三','2023-08-23',1),(39,100,'充值',2,0,'张三','2023-08-23',1),(40,200,'缴费',2,0,'张三','2023-08-23',1),(41,200,'缴费',2,0,'张三','2023-08-23',1),(42,200,'缴费',2,0,'张三','2023-08-23',1),(43,100,'缴费',2,0,'张三','2023-08-24',1),(44,100,'充值',2,0,'张三','2023-08-26',1),(45,100,'充值',2,0,'张三','2023-08-26',1),(46,10,'充值',2,0,'张三','2023-08-26',1),(47,10,'充值',2,0,'张三','2023-08-26',1),(48,10,'充值',2,0,'张三','2023-08-26',1),(49,10,'充值',2,0,'张三','2023-08-26',1),(50,10,'充值',2,0,'张三','2023-08-26',1),(51,10,'充值',2,0,'张三','2023-08-26',1),(52,10,'充值',2,0,'张三','2023-08-26',1),(53,10,'充值',2,0,'张三','2023-08-26',1),(54,10,'充值',2,0,'张三','2023-08-26',1),(55,10,'充值',2,0,'张三','2023-08-26',1),(56,10,'充值',2,0,'张三','2023-08-26',1),(57,10,'充值',2,0,'张三','2023-08-26',1),(58,10,'充值',2,0,'张三','2023-08-26',1),(59,10,'充值',2,0,'张三','2023-08-26',1),(60,10,'充值',2,0,'张三','2023-08-26',1),(61,10,'充值',2,0,'张三','2023-08-26',1),(62,10,'充值',2,0,'张三','2023-08-26',1),(63,10,'充值',2,0,'张三','2023-08-26',1),(64,10,'充值',2,0,'张三','2023-08-26',1),(65,10,'充值',2,0,'张三','2023-08-26',1),(66,10,'充值',2,0,'张三','2023-08-26',1),(67,10,'充值',2,0,'张三','2023-08-26',1),(68,10,'充值',2,0,'张三','2023-08-26',1),(69,10,'充值',2,0,'张三','2023-08-26',1),(70,10,'充值',2,0,'张三','2023-08-26',1),(71,10,'充值',2,0,'张三','2023-08-26',1),(72,10,'充值',2,0,'张三','2023-08-26',1),(73,10,'充值',2,0,'张三','2023-08-26',1),(74,10,'充值',2,0,'张三','2023-08-26',1),(75,10,'充值',2,0,'张三','2023-08-26',1),(76,10,'充值',2,0,'张三','2023-08-26',1),(77,10,'充值',1,0,'admin','2023-08-27',1),(78,10,'充值',2,0,'张三','2023-08-28',1),(79,10,'补卡',2,0,'张三','2023-09-01',1),(80,150,'缴费',3,0,'李四','2023-09-03',1),(81,150,'缴费',3,0,'李四','2023-09-03',1),(82,150,'缴费',3,0,'李四','2023-09-03',1),(83,150,'缴费',3,0,'李四','2023-09-03',1),(84,150,'缴费',3,0,'李四','2023-09-03',1),(85,150,'缴费',3,0,'李四','2023-09-03',1),(86,150,'缴费',16,0,'张伟','2023-09-03',1),(87,110,'充值',16,0,'张伟','2023-09-03',1),(88,150,'缴费',3,0,'李四','2023-09-03',1),(89,150,'缴费',17,0,'李强','2023-09-03',1),(90,100,'充值',16,0,'张伟','2023-09-03',1),(91,100,'充值',17,0,'李强','2023-09-03',1),(92,150,'缴费',3,0,'李四','2023-09-03',1),(93,150,'缴费',2,0,'张三','2023-09-03',1),(94,2,'购物',2,0,'张三','2023-09-03',1),(95,2,'购物',3,0,'李四','2023-09-03',1),(96,2,'购物',18,0,'Alice','2023-09-03',1),(97,10,'充值',2,0,'张三','2023-09-03',1),(98,10,'充值',18,0,'Alice','2023-09-03',1),(99,2,'购物',18,0,'Alice','2023-09-05',1),(100,100,'充值',18,0,'Alice','2023-09-05',1),(101,100,'缴费',3,0,'李四','2023-09-05',1),(102,150,'缴费',3,0,'李四','2023-09-05',1),(103,150,'缴费',3,0,'李四','2023-09-05',1),(104,100,'缴费',18,0,'Alice','2023-09-05',1),(105,150,'缴费',3,0,'李四','2023-09-05',1),(106,100,'充值',19,0,'张朋','2023-09-05',1),(107,100,'缴费',20,0,'李飞','2023-09-05',1),(108,10,'购物',21,0,'李倩','2023-09-05',1),(109,10,'购物',21,0,'李倩','2023-09-05',1),(110,10,'购物',21,0,'李倩','2023-09-05',1),(111,2,'购物',21,0,'李倩','2023-09-05',1),(112,10,'购物',2,0,'张三','2023-09-05',1),(113,4,'购物',2,0,'张三','2023-09-05',1),(114,5,'购物',2,0,'张三','2023-09-05',1),(115,10,'购物',2,0,'张三','2023-09-05',1),(116,2,'购物',2,0,'张三','2023-09-05',1),(117,2,'购物',2,0,'张三','2023-09-05',1),(118,2,'购物',2,0,'张三','2023-09-05',1),(119,2,'购物',2,0,'张三','2023-09-05',1),(120,2,'购物',2,0,'张三','2023-09-05',1),(121,4,'购物',3,0,'李四','2023-09-05',1),(122,2,'购物',2,0,'张三','2023-09-05',1),(123,10,'购物',2,0,'张三','2023-09-05',1),(124,4,'购物',2,0,'张三','2023-09-05',1),(125,2,'购物',2,0,'张三','2023-09-05',1),(126,10,'购物',2,0,'张三','2023-09-05',1),(127,4,'购物',2,0,'张三','2023-09-05',1),(128,5,'购物',3,0,'李四','2023-09-05',1),(129,20,'购物',2,0,'张三','2023-09-05',1),(130,5,'购物',2,0,'张三','2023-09-05',1),(131,10,'购物',2,0,'张三','2023-09-05',1),(132,2,'购物',2,0,'张三','2023-09-05',1),(133,2,'购物',2,0,'张三','2023-09-05',1),(134,2,'购物',3,0,'李四','2023-09-05',1),(135,2,'购物',3,0,'李四','2023-09-06',1),(136,2,'购物',3,0,'李四','2023-09-06',1),(137,2,'购物',2,0,'张三','2023-09-06',1),(138,10,'购物',3,0,'李四','2023-09-06',1),(139,20,'购物',3,0,'李四','2023-09-06',1),(140,10,'购物',3,0,'李四','2023-09-06',1),(141,20,'购物',2,0,'张三','2023-09-06',1),(142,10,'购物',2,0,'张三','2023-09-06',1),(143,5,'购物',3,0,'李四','2023-09-06',1),(144,10,'购物',2,0,'张三','2023-09-06',1),(145,20,'购物',2,0,'张三','2023-09-06',1),(146,5,'购物',2,0,'张三','2023-09-06',1),(147,10,'购物',2,0,'张三','2023-09-06',0),(148,100,'缴费',2,0,'张三','2023-09-06',1),(149,100,'充值',21,0,'李倩','2023-09-06',1),(150,150,'缴费',21,0,'李倩','2023-09-06',1),(151,200,'充值',21,0,'李倩','2023-09-06',1),(152,100,'缴费',21,0,'李倩','2023-09-06',1),(153,200,'充值',20,0,'李飞','2023-09-06',1),(154,100,'缴费',20,0,'李飞','2023-09-06',0),(155,50,'购物',2,0,'张三','2023-09-06',0),(156,50,'缴费',2,0,'张三','2023-09-06',1),(157,50,'购物',22,0,'王明','2023-09-06',1),(158,300,'充值',22,0,'王明','2023-09-06',1),(159,300,'缴费',22,0,'王明','2023-09-06',1),(160,30,'购物',23,0,'张钊','2023-09-07',1),(161,10,'购物',23,0,'张钊','2023-09-07',0),(162,300,'充值',23,0,'张钊','2023-09-07',1),(163,180,'缴费',23,0,'张钊','2023-09-07',1),(164,30,'购物',24,0,'小明','2023-09-07',0),(165,10,'购物',24,0,'小明','2023-09-07',0),(166,5,'购物',24,0,'小明','2023-09-07',1),(167,300,'充值',24,0,'小明','2023-09-07',1),(168,180,'缴费',24,0,'小明','2023-09-07',1),(169,50,'缴费',24,0,'小明','2023-09-07',1),(170,30,'购物',25,0,'郝宗铎','2023-09-07',0),(171,10,'购物',25,0,'郝宗铎','2023-09-07',2),(172,300,'充值',25,0,'郝宗铎','2023-09-07',1),(173,100,'缴费',25,0,'郝宗铎','2023-09-07',1),(174,50,'缴费',25,0,'郝宗铎','2023-09-07',1),(175,30,'购物',25,0,'郝宗铎','2023-09-14',0),(176,50,'购物',27,0,'李华','2023-09-15',1),(177,500,'充值',27,0,'李华','2023-09-15',1),(178,500,'缴费',27,0,'李华','2023-09-15',1),(179,10,'购物',27,0,'李华','2023-09-15',0),(180,5,'购物',25,0,'郝宗铎','2023-09-21',2),(181,150,'缴费',25,0,'郝宗铎','2023-09-21',1),(182,10,'补卡',25,0,'郝宗铎','2023-09-21',1),(183,200,'充值',25,0,'郝宗铎','2023-09-21',1);
/*!40000 ALTER TABLE `x_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_role`
--

DROP TABLE IF EXISTS `x_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `role_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_role`
--

LOCK TABLES `x_role` WRITE;
/*!40000 ALTER TABLE `x_role` DISABLE KEYS */;
INSERT INTO `x_role` VALUES (1,'admin','管理员'),(2,'student','学生');
/*!40000 ALTER TABLE `x_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_role_menu`
--

DROP TABLE IF EXISTS `x_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_role_menu`
--

LOCK TABLES `x_role_menu` WRITE;
/*!40000 ALTER TABLE `x_role_menu` DISABLE KEYS */;
INSERT INTO `x_role_menu` VALUES (11,1,1),(12,1,2),(13,1,3),(14,1,4),(15,1,5),(17,1,7),(18,2,4),(20,2,6),(21,2,12),(22,1,8),(23,1,9),(24,1,10),(26,2,8),(27,2,9),(28,2,11),(30,2,13),(31,1,14),(32,2,14),(33,1,16),(34,2,16),(35,1,17),(37,1,18),(38,2,19),(39,1,20);
/*!40000 ALTER TABLE `x_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_student`
--

DROP TABLE IF EXISTS `x_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(30) DEFAULT NULL,
  `student_num` varchar(30) DEFAULT NULL,
  `dept` varchar(30) DEFAULT NULL,
  `grade` varchar(30) DEFAULT NULL,
  `user_id` int NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `x_student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `x_user` (`id`),
  CONSTRAINT `x_student_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `x_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_student`
--

LOCK TABLES `x_student` WRITE;
/*!40000 ALTER TABLE `x_student` DISABLE KEYS */;
INSERT INTO `x_student` VALUES (1,'张三','2021001539','软件学院','21',2,'男','8666666','1823991127@qq.com',0,'4号楼'),(2,'李四','2022003029','材料学院','20',3,'女','18765912354','1823991127@qq.com',0,NULL),(3,'王五','2022001568','艺术学院','20',4,'男','13966667772',NULL,0,NULL),(4,'张伟','2021277077','软件学院','21',16,'男','18765977932','1823991127@qq.com',0,NULL),(5,'刘强','2020282402','软件学院','23',17,'男','18677778888','1823991127@qq.com',0,NULL),(6,'李平','2020256785',NULL,'22',15,'男','18765977932',NULL,0,NULL),(7,'Alice','2020894014','软件学院','20',18,'女','18765977932','111823@qq.com',0,NULL),(8,'张朋','2022082251','材料科学与工程学院','20',19,'男','18776597896','18@qq.com',0,NULL),(9,'李飞','2021857289','软件学院','20',20,'男','11888965324','18@qq.com',0,NULL),(10,'李倩','2023843135','生命科学学院','22',21,'女','18765977932','189@qq.com',0,NULL),(11,'王明','2020355522','软件学院','21',22,'男','18765977932','1823991127@qq.com',0,'山东大学兴隆山校区'),(12,'张钊','2022843139','软件学院','21',23,'男','18765977932','18223@qq.com',0,'软件园4号楼'),(13,'小明','2022060473','软件学院','22',24,'男','18765977932','18@qq.com',0,'软件园4号楼'),(14,'郝宗铎','2022157750','软件学院','21',25,'男','18765977932','111@qq.com',0,'软件园4号楼'),(15,'小红','2020417239','电气科学与工程学院','20',26,'女','13864860198','11@qq.com',0,'无'),(16,'李华','2020872731','软件学院','21',27,'男','18765977932','1823991127@qq.com',0,'山东大学'),(17,NULL,'2020337435',NULL,NULL,28,NULL,NULL,NULL,1,NULL),(18,NULL,'2022431575',NULL,NULL,29,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `x_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_user`
--

DROP TABLE IF EXISTS `x_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `money` int DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `gender` varchar(20) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_user`
--

LOCK TABLES `x_user` WRITE;
/*!40000 ALTER TABLE `x_user` DISABLE KEYS */;
INSERT INTO `x_user` VALUES (1,'admin','$2a$10$RT6TTjmIxTxltlc7USmkMe31zdpVvPfxXmXD3ne/TWdvIURjOBEfe','1823991127@qq.com',NULL,0,494,'http://localhost:9999/file/0f6f2f370b544304bbfd9598b726504b.jpg',0,'男','38569579'),(2,'zhangsan','$2a$10$mkTpSI8MwZ89OnBKrhmf4uqY8xiIiIsd4eRZ6.0qkIgCaJ/vsTAcm','1823991127@qq.com','8666666',1,139,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','21321217'),(3,'lisi','$2a$10$mkTpSI8MwZ89OnBKrhmf4uqY8xiIiIsd4eRZ6.0qkIgCaJ/vsTAcm','1823991127@qq.com','18765912354',1,100,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'女','79717195'),(4,'wangwu','$2a$10$mkTpSI8MwZ89OnBKrhmf4uqY8xiIiIsd4eRZ6.0qkIgCaJ/vsTAcm','wangwu@gmail.com','13966667772',1,100,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','94848886'),(15,'liping','$2a$10$T5giDGlf8s89tp.cmgo4U.QtAAj9N9GEg.y60ggHWdHVtbxzFMv1e','1823991127@qq.com','18765977932',1,100,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','72062292'),(16,'zhangwei','$2a$10$5nnKPnv10goqjwrzNOYyJOHK8xfBk1pXPTNQUt0EHMgrE8to.OwU6','1823991127@qq.com','18765977932',1,160,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','95305732'),(17,'liqiang','$2a$10$AlppmFBN2sJrCKpSMZLulO2LZqZbkKXKsfvHFTsBW/RplLF7fhT7C','1823991127@qq.com','18677778888',1,50,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','49188010'),(18,'Alice','$2a$10$Q4fIc2CMsrT6Rv7iONaKC.hpn4qyEpwS/VOdi2rJrWVBsly0.lVEu','111823@qq.com','18765977932',1,86,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'女','84200769'),(19,'zhangpeng','$2a$10$DqQzBK99ETJCXr9pFGREEuDBAhmEeU/HQbyM75bxw9Xl8XTijjYjO','18@qq.com','18776597896',1,0,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','53419734'),(20,'lifei','$2a$10$EGEBYhlRtPs0Bzc83bTf4OydvuCWtdLOaCV2qUTjJYEIXXvaYB.lK','18@qq.com','11888965324',1,100,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','53468651'),(21,'liqian','$2a$10$0bmuHzWVbe348c85WHrGHeuimSic6JfoKVYRWYtvK3On58xxItFMq','189@qq.com','18765977932',1,118,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'女','49828899'),(22,'wangming','$2a$10$SbrbXMMYsKj2.WFkWsv2tu/g60Yq.FsSL72g/JaG0UweU8u9pWoJa','1823991127@qq.com','18765977932',1,50,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','17614826'),(23,'zhangzhao','$2a$10$hgKFuq6yhJI8k./80g/2F.aHxHrF/fiK3jUlMijXshWxtjK4epJo6','18223@qq.com','18765977932',1,190,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','36866942'),(24,'xiaoming','$2a$10$4W873RGHQuUiERAddX.b7.NEc5uUXRg57k6To5QJHsOUSaprkvP7m','18@qq.com','18765977932',1,165,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','79656049'),(25,'haozongduo','$2a$10$RnhUVD0f1Y4nTkjE8oSoCePPWueDKfNmgyeMfyVxmoTq9BXfX4Xpe','111@qq.com','18765977932',1,275,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','61275403'),(26,'xiaohong','$2a$10$.DvtzbgRUQaMru6k10Yxt.ztjr3reqnY2ht6qD2UCcsKSaqxMuucG','11@qq.com','13864860198',1,100,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'女','61161338'),(27,'lihua','$2a$10$enuWKMCHK9IJBbbCLTPbhOu6JdlUnLZwj6tPEG/fQwn5GpqpM3/WG','1823991127@qq.com','18765977932',1,50,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',0,'男','72762680'),(28,'lihua','$2a$10$Y84Jd9v0FRQkQGqkkxe1TuEYn.hC3VtnpfqbxBVmMukMeh8pDD0JG',NULL,NULL,0,100,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',1,NULL,'88605544'),(29,'lihua','$2a$10$AQLLhs8zalSyq9pWkbUNl.pdU7FLuZ9vQ42XpzMLhBB1/ZGxBwGHe',NULL,NULL,NULL,100,'http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg',1,NULL,'39696411');
/*!40000 ALTER TABLE `x_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `x_user_role`
--

DROP TABLE IF EXISTS `x_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `x_user_role`
--

LOCK TABLES `x_user_role` WRITE;
/*!40000 ALTER TABLE `x_user_role` DISABLE KEYS */;
INSERT INTO `x_user_role` VALUES (7,4,2),(168,15,2),(255,3,2),(269,18,2),(272,19,2),(315,21,2),(317,20,2),(318,16,2),(322,2,2),(327,22,2),(328,1,1),(336,23,2),(346,24,2),(349,26,2),(365,27,2),(376,25,2);
/*!40000 ALTER TABLE `x_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-26  9:59:10
