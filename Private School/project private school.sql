-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: privateschool
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `subdate` date DEFAULT NULL,
  `ormark` decimal(4,1) unsigned DEFAULT '0.0',
  `tmark` decimal(4,1) unsigned DEFAULT '0.0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,'first assignment','private-school/HTML-CSS','2021-01-20',20.0,80.0),(2,'second assignment','private-school/HTML-CSS','2021-02-15',20.0,80.0),(3,'third assignment','web-application','2021-02-28',20.0,80.0),(4,'fourth assignment','design-patterns','2021-03-15',20.0,80.0),(5,'fifth assignment','advanced-front-end','2021-03-31',20.0,80.0),(6,'individual project','private-school/mySQL','2021-02-28',20.0,80.0),(7,'team project','group-project','2021-03-31',20.0,80.0),(8,'first assignment','private-school/HTML-CSS','2021-01-31',20.0,80.0),(9,'second assignment','private-school/HTML-CSS','2021-02-28',20.0,80.0),(10,'third assignment','web-application','2021-03-31',20.0,80.0),(11,'fourth assignment','design-patterns','2021-04-30',20.0,80.0),(12,'fifth assignment','advanced-front-end','2021-05-31',20.0,80.0),(13,'individual project','private-school/mySQL','2021-03-15',20.0,80.0),(14,'team project','group-project','2021-06-30',20.0,80.0);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcourse`
--

DROP TABLE IF EXISTS `assignmentcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentcourse` (
  `acid` int unsigned NOT NULL AUTO_INCREMENT,
  `aid` int NOT NULL,
  `cid` int unsigned NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `fk_assignment` (`aid`),
  KEY `fk_asscourse` (`cid`),
  CONSTRAINT `fk_asscourse` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `fk_assignment` FOREIGN KEY (`aid`) REFERENCES `assignment` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcourse`
--

LOCK TABLES `assignmentcourse` WRITE;
/*!40000 ALTER TABLE `assignmentcourse` DISABLE KEYS */;
INSERT INTO `assignmentcourse` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4);
/*!40000 ALTER TABLE `assignmentcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cid` int unsigned NOT NULL AUTO_INCREMENT,
  `ctitle` varchar(20) DEFAULT NULL,
  `cstream` varchar(20) DEFAULT NULL,
  `ctype` varchar(10) DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `edate` date DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'cb8','javascript','full-time','2021-01-01','2021-03-31'),(2,'cb8','javascript','part-time','2021-01-01','2021-06-30'),(3,'cb8','c#','full-time','2021-01-01','2021-03-31'),(4,'cb8','c#','part-time','2021-01-01','2021-06-30');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `gid` int unsigned NOT NULL AUTO_INCREMENT,
  `sid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  `aid` int NOT NULL,
  `ormark` decimal(4,1) unsigned DEFAULT NULL,
  `tmark` decimal(4,1) unsigned DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `fk_assignments` (`aid`),
  KEY `fk_courses` (`cid`),
  KEY `fk_students` (`sid`),
  CONSTRAINT `fk_assignments` FOREIGN KEY (`aid`) REFERENCES `assignment` (`aid`),
  CONSTRAINT `fk_courses` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `fk_students` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,1,1,20.0,54.0),(2,1,1,2,NULL,NULL),(3,1,1,3,17.0,64.0),(4,1,4,1,14.0,53.0),(5,2,3,1,NULL,NULL),(6,2,3,2,16.0,77.0),(7,2,3,6,NULL,NULL),(8,3,1,1,12.0,73.0),(9,3,1,2,20.0,64.0),(10,3,1,3,15.0,32.0),(11,3,1,4,17.0,42.0),(12,3,1,5,NULL,NULL),(13,4,2,1,20.0,75.0),(14,4,2,6,NULL,NULL),(15,4,3,2,19.0,49.0),(16,4,3,3,19.0,41.0),(17,5,2,1,18.0,62.0),(18,5,3,1,NULL,NULL),(19,5,3,2,NULL,NULL),(20,6,1,2,17.0,79.0),(21,6,1,3,20.0,45.0),(22,6,3,1,NULL,NULL),(23,6,3,2,11.0,64.0),(24,6,3,3,18.0,36.0),(25,7,3,1,NULL,NULL),(26,7,3,2,14.0,60.0),(27,7,3,3,20.0,33.0),(28,8,1,1,NULL,NULL),(29,8,1,2,20.0,84.0),(30,8,1,3,16.0,57.0),(31,9,1,1,NULL,NULL),(32,9,1,2,15.0,36.0),(33,9,1,3,15.0,43.0),(34,9,4,3,NULL,NULL),(35,10,4,1,NULL,NULL),(36,10,4,5,8.0,80.0),(37,10,4,6,16.0,46.0),(38,11,2,1,17.0,33.0),(39,11,2,3,20.0,54.0),(40,12,4,1,NULL,NULL),(41,12,4,2,11.0,76.0),(42,13,2,1,NULL,NULL),(43,13,2,2,13.0,65.0),(44,13,2,3,18.0,39.0),(45,13,4,1,16.0,71.0),(46,13,4,2,9.0,25.0),(47,14,2,3,NULL,NULL),(48,14,2,4,15.0,63.0),(49,15,3,1,17.0,67.0),(50,15,3,2,NULL,NULL),(51,15,3,3,13.0,58.0),(52,16,2,1,NULL,NULL),(53,16,2,2,NULL,NULL),(54,16,2,3,18.0,45.0),(55,16,2,4,16.0,36.0),(56,16,2,5,14.0,57.0),(57,16,2,6,NULL,NULL),(58,16,2,7,NULL,NULL),(59,17,1,1,11.0,46.0),(60,17,1,2,20.0,67.0),(61,17,4,4,18.0,39.0),(62,17,4,5,14.0,42.0),(63,18,3,1,NULL,NULL),(64,18,3,5,20.0,73.0),(65,18,3,6,16.0,52.0),(66,19,2,1,14.0,64.0),(67,19,2,2,7.0,10.0),(68,19,3,1,15.0,29.0),(69,19,3,2,NULL,NULL),(70,19,3,5,NULL,NULL),(71,20,1,5,11.0,71.0),(72,20,1,6,NULL,NULL),(73,20,1,7,19.0,75.0);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `sid` int unsigned NOT NULL AUTO_INCREMENT,
  `sfname` varchar(20) DEFAULT NULL,
  `slname` varchar(20) DEFAULT NULL,
  `sdob` date DEFAULT NULL,
  `tfees` decimal(6,1) unsigned DEFAULT '0.0',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Lena','Giannopoulou','1987-05-15',5000.0),(2,'Chrysa','Metaxa','1988-06-17',2500.0),(3,'Kaiti','Katsarou','2000-01-25',2500.0),(4,'Iliana','Ioannidi','1985-10-10',5000.0),(5,'Konstantinos','Kokkinos','1983-06-13',5000.0),(6,'Loukas','Kontos','1982-02-02',5000.0),(7,'Spyros','Megalos','1999-05-29',2500.0),(8,'Grigoris','Antoniou','2000-01-01',2500.0),(9,'Athanasios','Samaras','2001-12-24',5000.0),(10,'Nefeli','Papaioannou','2004-11-30',2500.0),(11,'Antonis','Michelakis','1980-10-12',2500.0),(12,'Konstantina','Papadopoulou','1987-07-25',2500.0),(13,'Xenofon','Spirou','1995-04-03',5000.0),(14,'Vasileios','Iordanou','1993-07-18',2500.0),(15,'Valentina','Georgiou','1998-10-24',2500.0),(16,'Eleni','Rapti','1983-09-08',2500.0),(17,'Markos','Maurotsoukalos','1985-12-27',5000.0),(18,'Xenia','Georgopoulou','1994-02-08',2500.0),(19,'Fotini','Stefanidi','1997-03-03',5000.0),(20,'Pavlina','Papadaki','1985-01-19',2500.0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentcourse`
--

DROP TABLE IF EXISTS `studentcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentcourse` (
  `scid` int unsigned NOT NULL AUTO_INCREMENT,
  `sid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  PRIMARY KEY (`scid`),
  KEY `fk_student` (`sid`),
  KEY `fk_course` (`cid`),
  CONSTRAINT `fk_course` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `fk_student` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentcourse`
--

LOCK TABLES `studentcourse` WRITE;
/*!40000 ALTER TABLE `studentcourse` DISABLE KEYS */;
INSERT INTO `studentcourse` VALUES (1,1,1),(2,1,4),(3,2,3),(4,3,1),(5,4,2),(6,4,3),(7,5,2),(8,5,3),(9,6,3),(10,6,1),(11,7,3),(12,8,1),(13,9,1),(14,9,4),(15,10,4),(16,11,2),(17,12,4),(18,13,2),(19,13,4),(20,14,2),(21,15,3),(22,16,2),(23,17,1),(24,17,4),(25,18,3),(26,19,2),(27,19,3),(28,20,1);
/*!40000 ALTER TABLE `studentcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `tid` int unsigned NOT NULL AUTO_INCREMENT,
  `tfname` varchar(20) DEFAULT NULL,
  `tlname` varchar(20) DEFAULT NULL,
  `tsubject` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,'Iakovos','Xanthopoulos','javascript'),(2,'Stavros','Papaioannou','c#'),(3,'Zacharias','Iordanou','javascript'),(4,'Konstantina','Giannopoulou','javascript'),(5,'Stella','Dimitriou','html/css'),(6,'Kostas','Michelakos','c#'),(7,'Margarita','Papadopoulos','databases'),(8,'Mihalis','Kokkinos','databases');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainercourse`
--

DROP TABLE IF EXISTS `trainercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainercourse` (
  `tcid` int unsigned NOT NULL AUTO_INCREMENT,
  `tid` int unsigned NOT NULL,
  `cid` int unsigned NOT NULL,
  PRIMARY KEY (`tcid`),
  KEY `fk_trainer` (`tid`),
  KEY `fk_trcourse` (`cid`),
  CONSTRAINT `fk_trainer` FOREIGN KEY (`tid`) REFERENCES `trainer` (`tid`),
  CONSTRAINT `fk_trcourse` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainercourse`
--

LOCK TABLES `trainercourse` WRITE;
/*!40000 ALTER TABLE `trainercourse` DISABLE KEYS */;
INSERT INTO `trainercourse` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,1),(6,3,3),(7,4,2),(8,4,4),(9,5,1),(10,5,2),(11,5,3),(12,5,4),(13,6,3),(14,7,1),(15,7,3),(16,8,2),(17,8,4);
/*!40000 ALTER TABLE `trainercourse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-30 11:59:47
