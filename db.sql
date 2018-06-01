CREATE DATABASE  IF NOT EXISTS `siomari_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `siomari_db`;
-- MySQL dump 10.13  Distrib 8.0.0-dmr, for Linux (x86_64)
--
-- Host: localhost    Database: siomari_db
-- ------------------------------------------------------
-- Server version	8.0.0-dmr

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
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `caudal_disenio` double NOT NULL,
  `longitud` double NOT NULL,
  `seccion_tipica` varchar(100) NOT NULL,
  `clase` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `estado_descripcion` text NOT NULL,
  `canal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_canal_canal1_idx` (`canal_id`),
  CONSTRAINT `fk_canal_canal1` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` VALUES (3,'0001','CANAL 1',8,3,'RECTANGULAR','RIEGO','REVESTIDO','CANAL_PRINCIPAL','BUENO','ESTA EN BUEN ESTADO',NULL),(4,'0002','CANAL 2',5,1.2,'CIRCULAR','DRENAJE','TIERRA','CANAL_PRINCIPAL','MALO','ESTADO PESIMO ',3),(5,'0003','CANAL 3',7,3,'TRAPEZOIDAL','DRENAJE','REVESTIDO','CANAL_PRINCIPAL','BUENO','EN BUEN ESTADO',4),(6,'0004','CANAL 4',4,4,'RECTANGULAR','RIEGO','TIERRA','CANAL_PRINCIPAL','BUENO','TODO ESTA BIEN',3),(7,'0005','CANAL 5',1,2.8,'TRAPEZOIDAL','RIEGO','REVESTIDO','CANAL_PRINCIPAL','REGULAR','ESTADO EN ESTADO REGULAR',4),(8,'0006','CANAL 6',6,5.4,'CIRCULAR','RIEGO','TIERRA','CANAL_PRINCIPAL','MALO','EN MALAS CONDICIONES',7),(9,'0007','CANAL 7',7,3.4,'RECTANGULAR','RIEGO','MIXTO','CANAL_DISTRIBUCION','REGULAR','SE DEBE REPARAR LA SECCION TIPICA',3),(10,'0008','CANAL 8',9,1.2,'RECTANGULAR','RIEGO','TIERRA','CANAL_LATERAL','BUENO','ESTADO EN OPTIMAS CONDICIONES',4),(11,'0009','CANAL 9',7,4.4,'RECTANGULAR','RIEGO','MIXTO','CANAL_LATERAL','REGULAR','MANTENIMIENTO AL REVESTIMIENTO',5),(12,'0010','CANAL 10',5.5,9,'TRAPEZOIDAL','RIEGO','REVESTIDO','CANAL_LATERAL','MALO','NO SE LE HA HECHO MANTENIMIENTO',6),(13,'0011','CANAL 11',8,10,'RECTANGULAR','RIEGO','REVESTIDO','CANAL_LATERAL','BUENO','BUENO',7),(14,'0012','CANAL 12',8,6,'RECTANGULAR','RIEGO','REVESTIDO','CANAL_LATERAL','BUENO','SDDSDD',8),(15,'0013','CANAL 13',7,9,'RECTANGULAR','RIEGO','TIERRA','CANAL_LATERAL','BUENO','ffffff',9);
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canal_obra`
--

DROP TABLE IF EXISTS `canal_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canal_obra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canal_id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `altitud` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_canal_has_obra_obra1_idx` (`obra_id`),
  KEY `fk_canal_has_obra_canal1_idx` (`canal_id`),
  CONSTRAINT `fk_canal_has_obra_canal1` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_canal_has_obra_obra1` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal_obra`
--

LOCK TABLES `canal_obra` WRITE;
/*!40000 ALTER TABLE `canal_obra` DISABLE KEYS */;
INSERT INTO `canal_obra` VALUES (3,3,3,'UBICADA EN EL KM 1',44.444,32.222,442),(5,4,4,'UBUCADO EN EL KM 0.5',22,44,442),(6,5,5,'1 KM',33,22,442),(7,6,3,'0.5 KM',11,23,442),(8,7,3,'0.3',63,43,443),(9,8,5,'0.3 KM',27,76,77.8),(10,9,3,'3,2 KM, SE DEBE HACER MANTENIMIENTO',11,42,442),(11,10,5,'0.2 KM',NULL,NULL,NULL),(12,11,4,'SE LE DEBE DAR MANTENIMIENTO',NULL,NULL,NULL),(13,12,4,'EN EXELENTES CONDICIONES',NULL,NULL,NULL),(14,13,3,'BBB',NULL,NULL,NULL),(15,14,3,'DDD',NULL,NULL,NULL),(16,15,3,'ffff',NULL,NULL,NULL);
/*!40000 ALTER TABLE `canal_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `climatologia_datos`
--

DROP TABLE IF EXISTS `climatologia_datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `climatologia_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaporacion` float NOT NULL,
  `precipitacion` float NOT NULL,
  `q_precipitacion` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=706 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `climatologia_datos`
--

LOCK TABLES `climatologia_datos` WRITE;
/*!40000 ALTER TABLE `climatologia_datos` DISABLE KEYS */;
INSERT INTO `climatologia_datos` VALUES (58,42.625,57,0.8),(59,42.625,27,0.8),(60,42.625,46,0.8),(61,43.75,15,0.8),(62,43.75,0,0.8),(63,43.75,11,0.8),(64,42.5,105,0.8),(65,42.5,8,0.8),(66,42.5,28,0.8),(67,43.625,42,0.8),(68,43.625,5,0.8),(69,43.625,12,0.8),(70,43.75,62,0.8),(71,43.75,78,0.8),(72,43.75,0,0.8),(73,40.125,29,0.8),(74,40.125,7,0.8),(75,40.125,20,0.8),(76,41.25,32,0.8),(77,41.25,33,0.8),(78,41.25,25,0.8),(79,42.875,23,0.8),(80,42.875,11,0.8),(81,42.875,116,0.8),(82,42.75,36,0.8),(83,42.75,11,0.8),(84,42.75,10,0.8),(85,43.125,6,0.8),(86,43.125,13,0.8),(87,43.125,93,0.8),(88,46,0,0.8),(89,46,96,0.8),(90,46,5,0.8),(91,46.375,10,0.8),(92,46.375,26,0.8),(93,46.375,13,0.8),(94,42.625,27,0.8),(95,42.625,46,0.8),(96,42.625,0,0.8),(97,43.75,0,0.8),(98,43.75,11,0.8),(99,43.75,0,0.8),(100,42.5,8,0.8),(101,42.5,28,0.8),(102,42.5,0,0.8),(103,43.625,16,0.8),(104,43.625,3,0.8),(105,43.625,0,0.8),(106,43.75,0,0.8),(107,43.75,3,0.8),(108,43.75,3,0.8),(109,40.125,7,0.8),(110,40.125,20,0.8),(111,40.125,0,0.8),(112,41.25,33,0.8),(113,41.25,25,0.8),(114,41.25,0,0.8),(115,42.875,111,0.8),(116,42.875,116,0.8),(117,42.875,0,0.8),(118,42.75,11,0.8),(119,42.75,10,0.8),(120,42.75,0,0.8),(121,43.125,13,0.8),(122,43.125,93,0.8),(123,43.125,0,0.8),(124,46,96,0.8),(125,46,5,0.8),(126,46,0,0.8),(127,46.375,26,0.8),(128,46.375,13,0.8),(129,46.375,0,0.8),(130,42.625,13,0.8),(131,42.625,8,0.8),(132,42.625,7,0.8),(133,43.75,0,0.8),(134,43.75,31,0.8),(135,43.75,2,0.8),(136,42.5,92,0.8),(137,42.5,14,0.8),(138,42.5,12,0.8),(139,43.625,3,0.8),(140,43.625,4,0.8),(141,43.625,37,0.8),(142,43.75,15,0.8),(143,43.75,0,0.8),(144,43.75,3,0.8),(145,40.125,9,0.8),(146,40.125,9,0.8),(147,40.125,7,0.8),(148,41.25,6,0.8),(149,41.25,7,0.8),(150,41.25,16,0.8),(151,42.875,0,0.8),(152,42.875,40,0.8),(153,42.875,35,0.8),(154,42.75,13,0.8),(155,42.75,4,0.8),(156,42.75,10,0.8),(157,43.125,58,0.8),(158,43.125,107,0.8),(159,43.125,30,0.8),(160,46,10,0.8),(161,46,17,0.8),(162,46,2,0.8),(163,46.375,1,0.8),(164,46.375,14,0.8),(165,46.375,14,0.8),(166,42.625,0,0.8),(167,42.625,0,0.8),(168,42.625,58,0.8),(169,43.75,0,0.8),(170,43.75,16,0.8),(171,43.75,27,0.8),(172,42.5,20,0.8),(173,42.5,20,0.8),(174,42.5,28,0.8),(175,43.625,24,0.8),(176,43.625,56,0.8),(177,43.625,0,0.8),(178,43.75,49,0.8),(179,43.75,23,0.8),(180,43.75,25,0.8),(181,40.125,30,0.8),(182,40.125,23,0.8),(183,40.125,21,0.8),(184,41.25,0,0.8),(185,41.25,20,0.8),(186,41.25,46,0.8),(187,42.875,29,0.8),(188,42.875,83,0.8),(189,42.875,95,0.8),(190,42.75,57,0.8),(191,42.75,28,0.8),(192,42.75,40,0.8),(193,43.125,127,0.8),(194,43.125,66,0.8),(195,43.125,51,0.8),(196,46,5,0.8),(197,46,110,0.8),(198,46,25,0.8),(199,46.375,5,0.8),(200,46.375,6,0.8),(201,46.375,8,0.8),(202,42.625,90,0.8),(203,42.625,38,0.8),(204,42.625,5,0.8),(205,43.75,11,0.8),(206,43.75,19,0.8),(207,43.75,3,0.8),(208,42.5,17,0.8),(209,42.5,18,0.8),(210,42.5,4,0.8),(211,43.625,56,0.8),(212,43.625,11,0.8),(213,43.625,8,0.8),(214,43.75,35,0.8),(215,43.75,17,0.8),(216,43.75,57,0.8),(217,40.125,32,0.8),(218,40.125,0,0.8),(219,40.125,24,0.8),(220,41.25,48,0.8),(221,41.25,41,0.8),(222,41.25,6,0.8),(223,42.875,66,0.8),(224,42.875,9,0.8),(225,42.875,130,0.8),(226,42.75,87,0.8),(227,42.75,6,0.8),(228,42.75,39,0.8),(229,43.125,5,0.8),(230,43.125,32,0.8),(231,43.125,48,0.8),(232,46,6,0.8),(233,46,16,0.8),(234,46,33,0.8),(235,46.375,9,0.8),(236,46.375,7,0.8),(237,46.375,54,0.8),(238,42.625,0,0.8),(239,42.625,130,0.8),(240,42.625,32,0.8),(241,43.75,15,0.8),(242,43.75,3,0.8),(243,43.75,0,0.8),(244,42.5,33,0.8),(245,42.5,21,0.8),(246,42.5,12,0.8),(247,43.625,0,0.8),(248,43.625,19,0.8),(249,43.625,0,0.8),(250,43.75,30,0.8),(251,43.75,16,0.8),(252,43.75,26,0.8),(253,40.125,22,0.8),(254,40.125,52,0.8),(255,40.125,31,0.8),(256,41.25,0,0.8),(257,41.25,63,0.8),(258,41.25,7,0.8),(259,42.875,46,0.8),(260,42.875,12,0.8),(261,42.875,38,0.8),(262,42.75,29,0.8),(263,42.75,19,0.8),(264,42.75,3,0.8),(265,43.125,28,0.8),(266,43.125,93,0.8),(267,43.125,0,0.8),(268,46,20,0.8),(269,46,121,0.8),(270,46,6,0.8),(271,46.375,0,0.8),(272,46.375,14,0.8),(273,46.375,16,0.8),(274,42.625,2,0.8),(275,42.625,33,0.8),(276,42.625,34,0.8),(277,43.75,29,0.8),(278,43.75,13,0.8),(279,43.75,16,0.8),(280,42.5,8,0.8),(281,42.5,17,0.8),(282,42.5,23,0.8),(283,43.625,2,0.8),(284,43.625,24,0.8),(285,43.625,67,0.8),(286,43.75,33,0.8),(287,43.75,33,0.8),(288,43.75,92,0.8),(289,40.125,22,0.8),(290,40.125,17,0.8),(291,40.125,8,0.8),(292,41.25,19,0.8),(293,41.25,15,0.8),(294,41.25,56,0.8),(295,42.875,65,0.8),(296,42.875,29,0.8),(297,42.875,10,0.8),(298,42.75,0,0.8),(299,42.75,49,0.8),(300,42.75,14,0.8),(301,43.125,3,0.8),(302,43.125,19,0.8),(303,43.125,35,0.8),(304,46,21,0.8),(305,46,89,0.8),(306,46,20,0.8),(307,46.375,18,0.8),(308,46.375,10,0.8),(309,46.375,6,0.8),(310,42.625,13,0.8),(311,42.625,36,0.8),(312,42.625,20,0.8),(313,43.75,21,0.8),(314,43.75,2,0.8),(315,43.75,4,0.8),(316,42.5,6,0.8),(317,42.5,34,0.8),(318,42.5,0,0.8),(319,43.625,6,0.8),(320,43.625,71,0.8),(321,43.625,79,0.8),(322,43.75,16,0.8),(323,43.75,3,0.8),(324,43.75,22,0.8),(325,40.125,23,0.8),(326,40.125,0,0.8),(327,40.125,1,0.8),(328,41.25,32,0.8),(329,41.25,13,0.8),(330,41.25,32,0.8),(331,42.875,8,0.8),(332,42.875,44,0.8),(333,42.875,5,0.8),(334,42.75,38,0.8),(335,42.75,17,0.8),(336,42.75,58,0.8),(337,43.125,8,0.8),(338,43.125,20,0.8),(339,43.125,16,0.8),(340,46,13,0.8),(341,46,19,0.8),(342,46,33,0.8),(343,46.375,12,0.8),(344,46.375,19,0.8),(345,46.375,0,0.8),(346,42.625,11,0.8),(347,42.625,13,0.8),(348,42.625,54,0.8),(349,43.75,22,0.8),(350,43.75,5,0.8),(351,43.75,11,0.8),(352,42.5,31,0.8),(353,42.5,5,0.8),(354,42.5,7,0.8),(355,43.625,8,0.8),(356,43.625,0,0.8),(357,43.625,0,0.8),(358,43.75,70,0.8),(359,43.75,9,0.8),(360,43.75,0,0.8),(361,40.125,19,0.8),(362,40.125,40,0.8),(363,40.125,10,0.8),(364,41.25,41,0.8),(365,41.25,20,0.8),(366,41.25,30,0.8),(367,42.875,15,0.8),(368,42.875,0,0.8),(369,42.875,101,0.8),(370,42.75,25,0.8),(371,42.75,11,0.8),(372,42.75,31,0.8),(373,43.125,80,0.8),(374,43.125,33,0.8),(375,43.125,91,0.8),(376,46,3,0.8),(377,46,6,0.8),(378,46,133,0.8),(379,46.375,15,0.8),(380,46.375,10,0.8),(381,46.375,12,0.8),(382,42.625,78,0.8),(383,42.625,16,0.8),(384,42.625,71,0.8),(385,43.75,25,0.8),(386,43.75,6,0.8),(387,43.75,2,0.8),(388,42.5,48,0.8),(389,42.5,119,0.8),(390,42.5,38,0.8),(391,43.625,147,0.8),(392,43.625,22,0.8),(393,43.625,22,0.8),(394,43.75,26,0.8),(395,43.75,67,0.8),(396,43.75,143,0.8),(397,40.125,18,0.8),(398,40.125,0,0.8),(399,40.125,33,0.8),(400,41.25,31,0.8),(401,41.25,12,0.8),(402,41.25,12,0.8),(403,42.875,17,0.8),(404,42.875,58,0.8),(405,42.875,54,0.8),(406,42.75,72,0.8),(407,42.75,24,0.8),(408,42.75,21,0.8),(409,43.125,37,0.8),(410,43.125,24,0.8),(411,43.125,67,0.8),(412,46,14,0.8),(413,46,9,0.8),(414,46,103,0.8),(415,46.375,49,0.8),(416,46.375,10,0.8),(417,46.375,74,0.8),(418,42.625,15,0.8),(419,42.625,49,0.8),(420,42.625,23,0.8),(421,43.75,22,0.8),(422,43.75,4,0.8),(423,43.75,22,0.8),(424,42.5,58,0.8),(425,42.5,8,0.8),(426,42.5,5,0.8),(427,43.625,20,0.8),(428,43.625,31,0.8),(429,43.625,23,0.8),(430,43.75,3,0.8),(431,43.75,43,0.8),(432,43.75,74,0.8),(433,40.125,11,0.8),(434,40.125,21,0.8),(435,40.125,7,0.8),(436,41.25,16,0.8),(437,41.25,17,0.8),(438,41.25,23,0.8),(439,42.875,19,0.8),(440,42.875,53,0.8),(441,42.875,73,0.8),(442,42.75,45,0.8),(443,42.75,85,0.8),(444,42.75,78,0.8),(445,43.125,8,0.8),(446,43.125,24,0.8),(447,43.125,27,0.8),(448,46,4,0.8),(449,46,7,0.8),(450,46,79,0.8),(451,46.375,47,0.8),(452,46.375,4,0.8),(453,46.375,20,0.8),(454,42.625,18,0.8),(455,42.625,29,0.8),(456,42.625,23,0.8),(457,43.75,6,0.8),(458,43.75,1,0.8),(459,43.75,10,0.8),(460,42.5,10,0.8),(461,42.5,34,0.8),(462,42.5,11,0.8),(463,43.625,4,0.8),(464,43.625,0,0.8),(465,43.625,0,0.8),(466,43.75,6,0.8),(467,43.75,0,0.8),(468,43.75,61,0.8),(469,40.125,11,0.8),(470,40.125,21,0.8),(471,40.125,22,0.8),(472,41.25,35,0.8),(473,41.25,13,0.8),(474,41.25,8,0.8),(475,42.875,28,0.8),(476,42.875,28,0.8),(477,42.875,78,0.8),(478,42.75,34,0.8),(479,42.75,16,0.8),(480,42.75,30,0.8),(481,43.125,31,0.8),(482,43.125,29,0.8),(483,43.125,58,0.8),(484,46,2,0.8),(485,46,27,0.8),(486,46,80,0.8),(487,46.375,10,0.8),(488,46.375,24,0.8),(489,46.375,8,0.8),(490,42.625,7,0.8),(491,42.625,23,0.8),(492,42.625,110,0.8),(493,43.75,7,0.8),(494,43.75,11,0.8),(495,43.75,7,0.8),(496,42.5,1,0.8),(497,42.5,21,0.8),(498,42.5,0,0.8),(499,43.625,32,0.8),(500,43.625,0,0.8),(501,43.625,1,0.8),(502,43.75,44,0.8),(503,43.75,0,0.8),(504,43.75,6,0.8),(505,40.125,11,0.8),(506,40.125,17,0.8),(507,40.125,21,0.8),(508,41.25,102,0.8),(509,41.25,18,0.8),(510,41.25,0,0.8),(511,42.875,40,0.8),(512,42.875,90,0.8),(513,42.875,6,0.8),(514,42.75,25,0.8),(515,42.75,17,0.8),(516,42.75,76,0.8),(517,43.125,6,0.8),(518,43.125,9,0.8),(519,43.125,6,0.8),(520,46,0,0.8),(521,46,0,0.8),(522,46,62,0.8),(523,46.375,15,0.8),(524,46.375,22,0.8),(525,46.375,0,0.8),(526,42.625,42,0.8),(527,42.625,33,0.8),(528,42.625,25,0.8),(529,43.75,7,0.8),(530,43.75,4,0.8),(531,43.75,2,0.8),(532,42.5,21,0.8),(533,42.5,26,0.8),(534,42.5,13,0.8),(535,43.625,0,0.8),(536,43.625,27,0.8),(537,43.625,38,0.8),(538,43.75,8,0.8),(539,43.75,6,0.8),(540,43.75,30,0.8),(541,40.125,2,0.8),(542,40.125,19,0.8),(543,40.125,3,0.8),(544,41.25,2,0.8),(545,41.25,29,0.8),(546,41.25,12,0.8),(547,42.875,2,0.8),(548,42.875,35,0.8),(549,42.875,54,0.8),(550,42.75,13,0.8),(551,42.75,33,0.8),(552,42.75,26,0.8),(553,43.125,3,0.8),(554,43.125,19,0.8),(555,43.125,39,0.8),(556,46,55,0.8),(557,46,14,0.8),(558,46,76,0.8),(559,46.375,5,0.8),(560,46.375,2,0.8),(561,46.375,52,0.8),(562,42.625,47,0.8),(563,42.625,57,0.8),(564,42.625,31,0.8),(565,43.75,11,0.8),(566,43.75,16,0.8),(567,43.75,8,0.8),(568,42.5,17,0.8),(569,42.5,27,0.8),(570,42.5,36,0.8),(571,43.625,10,0.8),(572,43.625,58,0.8),(573,43.625,22,0.8),(574,43.75,0,0.8),(575,43.75,16,0.8),(576,43.75,32,0.8),(577,40.125,26,0.8),(578,40.125,21,0.8),(579,40.125,29,0.8),(580,41.25,37,0.8),(581,41.25,20,0.8),(582,41.25,18,0.8),(583,42.875,39,0.8),(584,42.875,4,0.8),(585,42.875,35,0.8),(586,42.75,8,0.8),(587,42.75,27,0.8),(588,42.75,34,0.8),(589,43.125,180,0.8),(590,43.125,117,0.8),(591,43.125,44,0.8),(592,46,2,0.8),(593,46,24,0.8),(594,46,35,0.8),(595,46.375,19,0.8),(596,46.375,11,0.8),(597,46.375,5,0.8),(598,42.625,62,0.8),(599,42.625,18,0.8),(600,42.625,53,0.8),(601,43.75,10,0.8),(602,43.75,8,0.8),(603,43.75,14,0.8),(604,42.5,34,0.8),(605,42.5,53,0.8),(606,42.5,30,0.8),(607,43.625,6,0.8),(608,43.625,12,0.8),(609,43.625,0,0.8),(610,43.75,59,0.8),(611,43.75,42,0.8),(612,43.75,5,0.8),(613,40.125,17,0.8),(614,40.125,3,0.8),(615,40.125,1,0.8),(616,41.25,41,0.8),(617,41.25,4,0.8),(618,41.25,21,0.8),(619,42.875,34,0.8),(620,42.875,20,0.8),(621,42.875,53,0.8),(622,42.75,40,0.8),(623,42.75,13,0.8),(624,42.75,54,0.8),(625,43.125,14,0.8),(626,43.125,14,0.8),(627,43.125,30,0.8),(628,46,3,0.8),(629,46,17,0.8),(630,46,124,0.8),(631,46.375,16,0.8),(632,46.375,1,0.8),(633,46.375,34,0.8),(634,42.625,89,0.8),(635,42.625,41,0.8),(636,42.625,41,0.8),(637,43.75,7,0.8),(638,43.75,24,0.8),(639,43.75,4,0.8),(640,42.5,113,0.8),(641,42.5,33,0.8),(642,42.5,10,0.8),(643,43.625,53,0.8),(644,43.625,25,0.8),(645,43.625,34,0.8),(646,43.75,14,0.8),(647,43.75,38,0.8),(648,43.75,20,0.8),(649,40.125,10,0.8),(650,40.125,26,0.8),(651,40.125,34,0.8),(652,41.25,112,0.8),(653,41.25,20,0.8),(654,41.25,33,0.8),(655,42.875,44,0.8),(656,42.875,155,0.8),(657,42.875,21,0.8),(658,42.75,45,0.8),(659,42.75,0,0.8),(660,42.75,15,0.8),(661,43.125,50,0.8),(662,43.125,60,0.8),(663,43.125,2,0.8),(664,46,5,0.8),(665,46,123,0.8),(666,46,25,0.8),(667,46.375,16,0.8),(668,46.375,31,0.8),(669,46.375,37,0.8),(670,42.625,34,0.8),(671,42.625,61,0.8),(672,42.625,61,0.8),(673,43.75,2,0.8),(674,43.75,14,0.8),(675,43.75,10,0.8),(676,42.5,8,0.8),(677,42.5,77,0.8),(678,42.5,19,0.8),(679,43.625,0,0.8),(680,43.625,35,0.8),(681,43.625,50,0.8),(682,43.75,0,0.8),(683,43.75,1,0.8),(684,43.75,4,0.8),(685,40.125,8,0.8),(686,40.125,10,0.8),(687,40.125,10,0.8),(688,41.25,57,0.8),(689,41.25,32,0.8),(690,41.25,20,0.8),(691,42.875,21,0.8),(692,42.875,39,0.8),(693,42.875,29,0.8),(694,42.75,44,0.8),(695,42.75,26,0.8),(696,42.75,52,0.8),(697,43.125,58,0.8),(698,43.125,5,0.8),(699,43.125,52,0.8),(700,46,9,0.8),(701,46,126,0.8),(702,46,33,0.8),(703,46.375,9,0.8),(704,46.375,29,0.8),(705,46.375,13,0.8);
/*!40000 ALTER TABLE `climatologia_datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `climatologia_year`
--

DROP TABLE IF EXISTS `climatologia_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `climatologia_year` (
  `year` int(11) NOT NULL,
  `enero` int(11) DEFAULT NULL,
  `febrero` int(11) DEFAULT NULL,
  `marzo` int(11) DEFAULT NULL,
  `abril` int(11) DEFAULT NULL,
  `mayo` int(11) DEFAULT NULL,
  `junio` int(11) DEFAULT NULL,
  `julio` int(11) DEFAULT NULL,
  `agosto` int(11) DEFAULT NULL,
  `septiembre` int(11) DEFAULT NULL,
  `octubre` int(11) DEFAULT NULL,
  `noviembre` int(11) DEFAULT NULL,
  `diciembre` int(11) DEFAULT NULL,
  PRIMARY KEY (`year`),
  KEY `fk_climatologia_year_decada1_idx` (`enero`),
  KEY `fk_climatologia_year_decada2_idx` (`febrero`),
  KEY `fk_climatologia_year_decada3_idx` (`marzo`),
  KEY `fk_climatologia_year_decada4_idx` (`abril`),
  KEY `fk_climatologia_year_decada5_idx` (`mayo`),
  KEY `fk_climatologia_year_decada6_idx` (`junio`),
  KEY `fk_climatologia_year_decada7_idx` (`julio`),
  KEY `fk_climatologia_year_decada8_idx` (`agosto`),
  KEY `fk_climatologia_year_decada9_idx` (`septiembre`),
  KEY `fk_climatologia_year_decada10_idx` (`octubre`),
  KEY `fk_climatologia_year_decada11_idx` (`noviembre`),
  KEY `fk_climatologia_year_decada12_idx` (`diciembre`),
  CONSTRAINT `fk_climatologia_year_decada1` FOREIGN KEY (`enero`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada10` FOREIGN KEY (`octubre`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada11` FOREIGN KEY (`noviembre`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada12` FOREIGN KEY (`diciembre`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada2` FOREIGN KEY (`febrero`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada3` FOREIGN KEY (`marzo`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada4` FOREIGN KEY (`abril`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada5` FOREIGN KEY (`mayo`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada6` FOREIGN KEY (`junio`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada7` FOREIGN KEY (`julio`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada8` FOREIGN KEY (`agosto`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_climatologia_year_decada9` FOREIGN KEY (`septiembre`) REFERENCES `decada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `climatologia_year`
--

LOCK TABLES `climatologia_year` WRITE;
/*!40000 ALTER TABLE `climatologia_year` DISABLE KEYS */;
INSERT INTO `climatologia_year` VALUES (1990,19,20,23,16,24,22,21,17,27,26,25,18),(1991,31,32,35,28,36,34,33,29,39,38,37,30),(1992,43,44,47,40,48,46,45,41,51,50,49,42),(1993,55,56,59,52,60,58,57,53,63,62,61,54),(1994,67,68,71,64,72,70,69,65,75,74,73,66),(1995,79,80,83,76,84,82,81,77,87,86,85,78),(1996,91,92,95,88,96,94,93,89,99,98,97,90),(1997,103,104,107,100,108,106,105,101,111,110,109,102),(1998,115,116,119,112,120,118,117,113,123,122,121,114),(1999,127,128,131,124,132,130,129,125,135,134,133,126),(2000,139,140,143,136,144,142,141,137,147,146,145,138),(2001,151,152,155,148,156,154,153,149,159,158,157,150),(2002,163,164,167,160,168,166,165,161,171,170,169,162),(2003,175,176,179,172,180,178,177,173,183,182,181,174),(2004,187,188,191,184,192,190,189,185,195,194,193,186),(2005,199,200,203,196,204,202,201,197,207,206,205,198),(2006,211,212,215,208,216,214,213,209,219,218,217,210),(2007,223,224,227,220,228,226,225,221,231,230,229,222);
/*!40000 ALTER TABLE `climatologia_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lamina` double NOT NULL,
  `eficiencia` double NOT NULL,
  `caudal` double NOT NULL,
  `horas` int(11) NOT NULL,
  `costo` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,74.5,0.75,0.8,12,40000);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultivo`
--

DROP TABLE IF EXISTS `cultivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cultivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivo`
--

LOCK TABLES `cultivo` WRITE;
/*!40000 ALTER TABLE `cultivo` DISABLE KEYS */;
INSERT INTO `cultivo` VALUES (18,'Arroz'),(22,'Maiz'),(21,'Uva');
/*!40000 ALTER TABLE `cultivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultivo_predio`
--

DROP TABLE IF EXISTS `cultivo_predio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cultivo_predio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predio_id` int(11) NOT NULL,
  `cultivo_id` int(11) NOT NULL,
  `plan_siembra_id` int(11) NOT NULL,
  `hectareas` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_predio_has_cultivo_cultivo1_idx` (`cultivo_id`),
  KEY `fk_predio_has_cultivo_predio1_idx` (`predio_id`),
  KEY `fk_predio_has_cultivo_plan_siembra1_idx` (`plan_siembra_id`),
  CONSTRAINT `fk_predio_has_cultivo_cultivo1` FOREIGN KEY (`cultivo_id`) REFERENCES `cultivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_predio_has_cultivo_plan_siembra1` FOREIGN KEY (`plan_siembra_id`) REFERENCES `plan_siembra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_predio_has_cultivo_predio1` FOREIGN KEY (`predio_id`) REFERENCES `predio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivo_predio`
--

LOCK TABLES `cultivo_predio` WRITE;
/*!40000 ALTER TABLE `cultivo_predio` DISABLE KEYS */;
INSERT INTO `cultivo_predio` VALUES (33,17,21,14,12),(35,14,22,16,8),(36,13,22,15,7);
/*!40000 ALTER TABLE `cultivo_predio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decada`
--

DROP TABLE IF EXISTS `decada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `decada_1` int(11) NOT NULL,
  `decada_2` int(11) NOT NULL,
  `decada_3` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_decada_climatologia_datos_idx` (`decada_1`),
  KEY `fk_decada_climatologia_datos1_idx` (`decada_2`),
  KEY `fk_decada_climatologia_datos2_idx` (`decada_3`),
  CONSTRAINT `fk_decada_climatologia_datos` FOREIGN KEY (`decada_1`) REFERENCES `climatologia_datos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_decada_climatologia_datos1` FOREIGN KEY (`decada_2`) REFERENCES `climatologia_datos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_decada_climatologia_datos2` FOREIGN KEY (`decada_3`) REFERENCES `climatologia_datos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decada`
--

LOCK TABLES `decada` WRITE;
/*!40000 ALTER TABLE `decada` DISABLE KEYS */;
INSERT INTO `decada` VALUES (16,58,59,60),(17,61,62,63),(18,64,65,66),(19,67,68,69),(20,70,71,72),(21,73,74,75),(22,76,77,78),(23,79,80,81),(24,82,83,84),(25,85,86,87),(26,88,89,90),(27,91,92,93),(28,94,95,96),(29,97,98,99),(30,100,101,102),(31,103,104,105),(32,106,107,108),(33,109,110,111),(34,112,113,114),(35,115,116,117),(36,118,119,120),(37,121,122,123),(38,124,125,126),(39,127,128,129),(40,130,131,132),(41,133,134,135),(42,136,137,138),(43,139,140,141),(44,142,143,144),(45,145,146,147),(46,148,149,150),(47,151,152,153),(48,154,155,156),(49,157,158,159),(50,160,161,162),(51,163,164,165),(52,166,167,168),(53,169,170,171),(54,172,173,174),(55,175,176,177),(56,178,179,180),(57,181,182,183),(58,184,185,186),(59,187,188,189),(60,190,191,192),(61,193,194,195),(62,196,197,198),(63,199,200,201),(64,202,203,204),(65,205,206,207),(66,208,209,210),(67,211,212,213),(68,214,215,216),(69,217,218,219),(70,220,221,222),(71,223,224,225),(72,226,227,228),(73,229,230,231),(74,232,233,234),(75,235,236,237),(76,238,239,240),(77,241,242,243),(78,244,245,246),(79,247,248,249),(80,250,251,252),(81,253,254,255),(82,256,257,258),(83,259,260,261),(84,262,263,264),(85,265,266,267),(86,268,269,270),(87,271,272,273),(88,274,275,276),(89,277,278,279),(90,280,281,282),(91,283,284,285),(92,286,287,288),(93,289,290,291),(94,292,293,294),(95,295,296,297),(96,298,299,300),(97,301,302,303),(98,304,305,306),(99,307,308,309),(100,310,311,312),(101,313,314,315),(102,316,317,318),(103,319,320,321),(104,322,323,324),(105,325,326,327),(106,328,329,330),(107,331,332,333),(108,334,335,336),(109,337,338,339),(110,340,341,342),(111,343,344,345),(112,346,347,348),(113,349,350,351),(114,352,353,354),(115,355,356,357),(116,358,359,360),(117,361,362,363),(118,364,365,366),(119,367,368,369),(120,370,371,372),(121,373,374,375),(122,376,377,378),(123,379,380,381),(124,382,383,384),(125,385,386,387),(126,388,389,390),(127,391,392,393),(128,394,395,396),(129,397,398,399),(130,400,401,402),(131,403,404,405),(132,406,407,408),(133,409,410,411),(134,412,413,414),(135,415,416,417),(136,418,419,420),(137,421,422,423),(138,424,425,426),(139,427,428,429),(140,430,431,432),(141,433,434,435),(142,436,437,438),(143,439,440,441),(144,442,443,444),(145,445,446,447),(146,448,449,450),(147,451,452,453),(148,454,455,456),(149,457,458,459),(150,460,461,462),(151,463,464,465),(152,466,467,468),(153,469,470,471),(154,472,473,474),(155,475,476,477),(156,478,479,480),(157,481,482,483),(158,484,485,486),(159,487,488,489),(160,490,491,492),(161,493,494,495),(162,496,497,498),(163,499,500,501),(164,502,503,504),(165,505,506,507),(166,508,509,510),(167,511,512,513),(168,514,515,516),(169,517,518,519),(170,520,521,522),(171,523,524,525),(172,526,527,528),(173,529,530,531),(174,532,533,534),(175,535,536,537),(176,538,539,540),(177,541,542,543),(178,544,545,546),(179,547,548,549),(180,550,551,552),(181,553,554,555),(182,556,557,558),(183,559,560,561),(184,562,563,564),(185,565,566,567),(186,568,569,570),(187,571,572,573),(188,574,575,576),(189,577,578,579),(190,580,581,582),(191,583,584,585),(192,586,587,588),(193,589,590,591),(194,592,593,594),(195,595,596,597),(196,598,599,600),(197,601,602,603),(198,604,605,606),(199,607,608,609),(200,610,611,612),(201,613,614,615),(202,616,617,618),(203,619,620,621),(204,622,623,624),(205,625,626,627),(206,628,629,630),(207,631,632,633),(208,634,635,636),(209,637,638,639),(210,640,641,642),(211,643,644,645),(212,646,647,648),(213,649,650,651),(214,652,653,654),(215,655,656,657),(216,658,659,660),(217,661,662,663),(218,664,665,666),(219,667,668,669),(220,670,671,672),(221,673,674,675),(222,676,677,678),(223,679,680,681),(224,682,683,684),(225,685,686,687),(226,688,689,690),(227,691,692,693),(228,694,695,696),(229,697,698,699),(230,700,701,702),(231,703,704,705);
/*!40000 ALTER TABLE `decada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrega` datetime NOT NULL,
  `suspension` datetime NOT NULL,
  `predio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entregas_predio1_idx` (`predio_id`),
  CONSTRAINT `fk_entregas_predio1` FOREIGN KEY (`predio_id`) REFERENCES `predio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,'2018-05-01 17:26:21','2018-05-02 20:26:21',13),(2,'2018-05-02 16:47:46','2018-05-02 17:47:46',13),(3,'2018-05-08 16:53:27','2018-05-09 16:53:27',14);
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estructura_control`
--

DROP TABLE IF EXISTS `estructura_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estructura_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `coeficiente` double DEFAULT NULL,
  `exponente` double DEFAULT NULL,
  `canal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_estructura_control_canal_idx` (`canal_id`),
  CONSTRAINT `fk_estructura_control_canal` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estructura_control`
--

LOCK TABLES `estructura_control` WRITE;
/*!40000 ALTER TABLE `estructura_control` DISABLE KEYS */;
INSERT INTO `estructura_control` VALUES (1,'12345',0.0809906122446059,0.40353950413976863,3),(3,'232322',0.0809906122446059,0.40353950413976863,3),(4,'5566',1,2,4),(5,'03',0.16935320728838973,0.9622098268667237,8);
/*!40000 ALTER TABLE `estructura_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kc`
--

DROP TABLE IF EXISTS `kc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kc` float NOT NULL,
  `cultivo_id` int(11) NOT NULL,
  `decada` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kc_cultivo1_idx` (`cultivo_id`),
  CONSTRAINT `fk_kc_cultivo1` FOREIGN KEY (`cultivo_id`) REFERENCES `cultivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kc`
--

LOCK TABLES `kc` WRITE;
/*!40000 ALTER TABLE `kc` DISABLE KEYS */;
INSERT INTO `kc` VALUES (46,0.89,18,1),(47,0.89,18,2),(48,0.89,18,3),(49,1.95,18,4),(50,1.95,18,5),(51,1.95,18,6),(52,1.35,18,7),(53,1.35,18,8),(54,1.35,18,9),(55,0.31,18,10),(56,0.31,18,11),(57,0.31,18,12),(58,0.7,21,1),(59,0.7,21,2),(60,0.7,21,3),(61,0.7,21,4),(62,0.7,21,5),(63,0.7,21,6),(64,0.7,21,7),(65,0.7,21,8),(66,0.7,21,9),(67,0.7,21,10),(68,0.7,21,11),(69,0.7,21,12),(70,0.2,22,1),(71,0.3,22,2),(72,0.5,22,3),(73,0.65,22,4),(74,0.8,22,5),(75,0.9,22,6),(76,0.8,22,7),(77,0.6,22,8),(78,0.35,22,9),(79,0.2,22,10),(80,0,22,11),(81,0,22,12);
/*!40000 ALTER TABLE `kc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manejo_agua`
--

DROP TABLE IF EXISTS `manejo_agua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manejo_agua` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `q_solicitado` double NOT NULL,
  `q_extraido` double NOT NULL,
  `q_servido` double NOT NULL,
  `area` double NOT NULL,
  `canal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_manejo_agua_canal1_idx` (`canal_id`),
  CONSTRAINT `fk_manejo_agua_canal1` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manejo_agua`
--

LOCK TABLES `manejo_agua` WRITE;
/*!40000 ALTER TABLE `manejo_agua` DISABLE KEYS */;
INSERT INTO `manejo_agua` VALUES (2,'2018-05-05',0.212,0.222,0.212,20,3),(3,'2018-05-06',0.191,0.222,0.191,25,3),(9,'2018-05-07',0.25,0.23,0.212,30,3),(10,'2018-05-08',0.25,0.286,0.266,35,3),(11,'2018-05-09',0.25,0.286,0.214,50,3),(12,'2018-05-12',0.25,0.286,0.235,150,3),(13,'2018-05-13',0.25,0.286,0.235,200,3),(14,'2018-05-14',0.25,0.411,0.283,200,3),(15,'2018-05-15',0.25,0.411,0.212,200,3),(16,'2018-05-16',0.25,0.304,0.177,200,3),(17,'2018-05-21',0.25,0.2,0.157,200,3),(18,'2018-05-22',0.25,0.207,0.158,200,3),(19,'2018-05-23',0.25,0.253,0.162,200,3),(20,'2018-05-26',0.25,0.286,0.244,200,3),(21,'2018-05-27',0.25,0.39,0.251,200,3),(22,'2018-05-28',0.25,0.39,0.251,200,3),(23,'2018-05-29',0.25,0.215,0.097,200,3),(24,'2018-05-30',0.25,0.215,0.097,200,3),(25,'2018-06-03',0.25,0.295,0.248,200,3),(26,'2018-06-02',0.25,0.295,0.248,200,3),(27,'2018-06-13',0.25,0.207,0.195,200,3),(28,'2018-06-18',0.25,0.207,0.193,200,3),(29,'2018-06-19',0.25,0.207,0.193,200,3),(30,'2018-06-20',0.25,0.207,0.193,200,3),(31,'2018-06-21',0.25,0.207,0.193,200,3),(32,'2018-06-23',0.25,0.341,0.284,200,3),(33,'2018-06-24',0.25,0.35,0.282,200,3),(34,'2018-06-25',0.25,0.35,0.282,200,3),(35,'2018-06-26',0.25,0.341,0.28,200,3),(36,'2018-06-27',0.25,0.237,0.217,200,3),(37,'2018-06-28',0.25,0.237,0.217,200,3),(38,'2018-05-01',3,2.97,0.89,45,4),(39,'2018-05-02',3,3.01,1.205,65,4),(40,'2018-05-03',3,2.985,1.49,86,4),(41,'2018-05-04',3,2.95,1.77,116,4),(42,'2018-05-05',3,3.07,1.655,107,4),(43,'2018-05-06',3,3.01,1.685,130,4),(44,'2018-05-07',3,3.02,1.75,145,4),(45,'2018-05-08',3,3,1.75,144,4),(47,'2018-05-03',2,1.9,1.2,40,5),(48,'2018-05-04',2,1.9,1.3,45,5),(49,'2018-05-05',2,1.95,1.3,45,5),(50,'2018-05-06',2,1.89,1.35,47,5),(51,'2018-05-07',2,2.01,1.35,48,5),(52,'2018-05-08',2,1.92,1.39,49,5),(53,'2018-05-09',2,1.94,1.35,50,5),(54,'2018-05-10',2,1.94,1.37,50,5),(57,'2018-05-27',0.212,0.222,0.212,20,10),(58,'2018-05-27',0.212,0.222,0.212,20,11),(59,'2018-05-27',0.212,0.222,0.212,20,12),(60,'2018-05-27',0.212,0.222,0.212,20,13),(61,'2018-05-27',0.212,0.222,0.212,20,14),(62,'2018-05-27',0.212,0.222,0.212,20,15);
/*!40000 ALTER TABLE `manejo_agua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra`
--

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra`
--

LOCK TABLES `obra` WRITE;
/*!40000 ALTER TABLE `obra` DISABLE KEYS */;
INSERT INTO `obra` VALUES (3,'OBRA 1'),(4,'OBRA 2'),(5,'OBRA 3');
/*!40000 ALTER TABLE `obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_siembra`
--

DROP TABLE IF EXISTS `plan_siembra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_siembra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `periodo` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_siembra`
--

LOCK TABLES `plan_siembra` WRITE;
/*!40000 ALTER TABLE `plan_siembra` DISABLE KEYS */;
INSERT INTO `plan_siembra` VALUES (14,2018,1,1),(15,2018,4,2),(16,2018,4,1);
/*!40000 ALTER TABLE `plan_siembra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predio`
--

DROP TABLE IF EXISTS `predio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `nombre_propietario` varchar(100) NOT NULL,
  `area_total` double NOT NULL,
  `area_potencial_riego` double NOT NULL,
  `area_bajo_riego` double NOT NULL,
  `modulo_riego` double NOT NULL,
  `numero_tomas` double NOT NULL,
  `tipo_suelo` varchar(100) NOT NULL,
  `canal_id` int(11) NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `altitud` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_predio_canal1_idx` (`canal_id`),
  CONSTRAINT `fk_predio_canal1` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predio`
--

LOCK TABLES `predio` WRITE;
/*!40000 ALTER TABLE `predio` DISABLE KEYS */;
INSERT INTO `predio` VALUES (13,'0001001','NOMBRE 1','MIGUEL',7,5,3,10,1,'TIERRA',3,2,1,442),(14,'0002001','NOMBRE 2','ARMANDO',8,4,4,35,1,'TIERRA',4,22,33,442),(15,'000701','NOMBRE 3','JORGE',10,10,10,32,1,'TIERRA',9,2,3,442),(16,'000102','NOMBRE 4','ROBERTO',15,15,15,3.4,1,'TIERRA',3,2,4,442),(17,'000301','NOMBRE 5','MARTA',12,12,12,4.3,1,'TIERRA',5,4,3,443),(18,'000901','NOMBRE 6','LUCIA',25,20,25,4.9,1,'TIERRA',11,5,5,443);
/*!40000 ALTER TABLE `predio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programacion_semanal`
--

DROP TABLE IF EXISTS `programacion_semanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programacion_semanal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` double NOT NULL,
  `ln` double(4,3) NOT NULL,
  `fecha` date NOT NULL,
  `canal_id` int(11) NOT NULL,
  `eficiencia` double(4,3) NOT NULL,
  `caudal` double(4,3) NOT NULL,
  `unidad_zona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programacion_semanal`
--

LOCK TABLES `programacion_semanal` WRITE;
/*!40000 ALTER TABLE `programacion_semanal` DISABLE KEYS */;
INSERT INTO `programacion_semanal` VALUES (6,150,0.120,'2018-05-28',10,0.952,0.298,NULL),(7,205,0.120,'2018-05-28',11,0.955,0.407,NULL),(8,226,0.100,'2018-05-28',12,0.955,0.374,NULL),(9,245,0.100,'2018-05-28',13,0.709,0.405,NULL),(10,175,0.100,'2018-05-28',14,0.781,0.289,NULL),(11,224,0.100,'2018-05-28',15,0.787,0.371,NULL),(12,150,0.000,'2018-05-28',4,0.763,0.313,NULL),(13,205,0.000,'2018-05-28',5,0.687,0.426,NULL),(14,226,0.000,'2018-05-28',6,0.752,0.392,NULL),(15,581,0.000,'2018-05-28',3,0.833,1.552,4),(16,245,0.000,'2018-05-28',7,0.893,0.571,NULL),(17,175,0.000,'2018-05-28',8,0.870,0.370,NULL),(18,224,0.000,'2018-05-28',9,0.901,0.471,NULL),(19,644,0.000,'2018-05-28',3,0.885,1.587,5),(20,1225,0.000,'2018-05-28',3,0.833,3.656,3);
/*!40000 ALTER TABLE `programacion_semanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `zona_id` int(11) NOT NULL,
  `canal_servidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seccion_zona1_idx` (`zona_id`),
  CONSTRAINT `fk_seccion_zona1` FOREIGN KEY (`zona_id`) REFERENCES `zona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (3,'SECCION 1',4,4),(4,'SECCION 2',4,5),(5,'SECCION 3',4,6),(6,'SECCION 4',5,7),(7,'SECCION 5',5,8),(8,'SECCION 6',5,9);
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion_canal`
--

DROP TABLE IF EXISTS `seccion_canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seccion_canal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canal_id` int(11) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_canal_has_seccion_seccion1_idx` (`seccion_id`),
  KEY `fk_canal_has_seccion_canal1_idx` (`canal_id`),
  CONSTRAINT `fk_canal_has_seccion_canal1` FOREIGN KEY (`canal_id`) REFERENCES `canal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_canal_has_seccion_seccion1` FOREIGN KEY (`seccion_id`) REFERENCES `seccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion_canal`
--

LOCK TABLES `seccion_canal` WRITE;
/*!40000 ALTER TABLE `seccion_canal` DISABLE KEYS */;
INSERT INTO `seccion_canal` VALUES (4,3,3),(5,4,3),(10,9,6),(14,5,4),(15,6,5),(16,7,6),(17,8,7),(19,13,6),(20,14,7),(21,15,8),(22,10,3),(23,11,4),(24,12,5);
/*!40000 ALTER TABLE `seccion_canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `canal_servidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (3,'UNIDAD 1',3);
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `predio_id` int(11) NOT NULL,
  `propietario` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_predio1_idx` (`predio_id`),
  CONSTRAINT `fk_usuario_predio1` FOREIGN KEY (`predio_id`) REFERENCES `predio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'1075299552','MIGUEL ','ARMANDO','CALLE 25 B SUR ','NEIVA','86033322','3122456657','miguel@hotmail.con',13,1),(3,'400076973','PABLO','ESCOBAR','CRA 2 B SUR','NEIVA',NULL,'3136547898',NULL,14,0),(4,'400786536','FERNANDO','TORRES','CRA 7 CALLE 56 B','RIVERA',NULL,'3200876565',NULL,15,1),(5,'10763987676','CAMILO','GONZALES','CALLE 5 B 65 E','GARZON','8796545','3177896534','camilo@outlook.com',16,1),(6,'40087687','PABLO','ESCOBAR','CALLE 45 B 9 W 44','NEIVA','88766556',NULL,NULL,17,0),(7,'1087765383','LIZETH','FLORES','CLL 56 W 95','NEIVA','8745676','3147887654','liezeth_flores-8989@gmail.com',18,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  `canal_servidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_zona_unidad_idx` (`unidad_id`),
  CONSTRAINT `fk_zona_unidad` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (4,'ZONA 1',3,3),(5,'ZONA 2',3,3);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-01 15:58:19
