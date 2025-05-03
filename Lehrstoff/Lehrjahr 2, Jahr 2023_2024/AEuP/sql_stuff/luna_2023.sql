-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: luna
-- ------------------------------------------------------
-- Server version	8.0.13

DROP DATABASE IF EXISTS luna;
CREATE DATABASE IF NOT EXISTS luna;
use luna;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblabteilung`
--

DROP TABLE IF EXISTS `tblabteilung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblabteilung` (
  `A_Nr` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `A_Name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `A_Stadt` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`A_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblabteilung`
--

LOCK TABLES `tblabteilung` WRITE;
/*!40000 ALTER TABLE `tblabteilung` DISABLE KEYS */;
INSERT INTO `tblabteilung` VALUES ('a1','Beratung','München'),('a2','Diagnose','München'),('a3','Freigabe','Stuttgart');
/*!40000 ALTER TABLE `tblabteilung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmitarbeiter`
--

DROP TABLE IF EXISTS `tblmitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblmitarbeiter` (
  `M_Nr` bigint(20) NOT NULL DEFAULT '0',
  `A_Nr` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `M_Name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `M_Vorname` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`M_Nr`),
  KEY `IX_arbeitet` (`A_Nr`),
  CONSTRAINT `tblmitarbeiter_ibfk_1` FOREIGN KEY (`A_Nr`) REFERENCES `tblabteilung` (`a_nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmitarbeiter`
--

LOCK TABLES `tblmitarbeiter` WRITE;
/*!40000 ALTER TABLE `tblmitarbeiter` DISABLE KEYS */;
INSERT INTO `tblmitarbeiter` VALUES (2581,'a2','Kaufmann','Brigitte'),(9031,'a2','Meier','Rainer'),(10102,'a3','Huber','Petra'),(18316,'a1','Müller','Gabriele'),(20659,'a2','Süss','Xaver'),(25384,'a3','Keller','Hans'),(28559,'a1','Mozer','Sibille'),(29346,'a2','Probst','Andreas'),(29443,'a2','Eberhardt','Franz');
/*!40000 ALTER TABLE `tblmitarbeiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprojekt`
--

DROP TABLE IF EXISTS `tblprojekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tblprojekt` (
  `P_Nr` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `P_Name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `P_Mittel` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`P_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprojekt`
--

LOCK TABLES `tblprojekt` WRITE;
/*!40000 ALTER TABLE `tblprojekt` DISABLE KEYS */;
INSERT INTO `tblprojekt` VALUES ('p1','Apollo',120000),('p2','Gemini',95000),('p3','Merkur',186500);
/*!40000 ALTER TABLE `tblprojekt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltaetigkeit`
--

DROP TABLE IF EXISTS `tbltaetigkeit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbltaetigkeit` (
  `T_Nr` bigint(20) NOT NULL DEFAULT '0',
  `M_Nr` bigint(20) NOT NULL DEFAULT '0',
  `P_Nr` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `T_Taetigkeit` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `T_Einstellungsdatum` datetime NOT NULL DEFAULT '1990-01-01 00:00:00',
  PRIMARY KEY (`T_Nr`),
  KEY `IX_bearbeitet` (`M_Nr`),
  KEY `IX_fuer` (`P_Nr`),
  CONSTRAINT `tbltaetigkeit_ibfk_1` FOREIGN KEY (`M_Nr`) REFERENCES `tblmitarbeiter` (`m_nr`),
  CONSTRAINT `tbltaetigkeit_ibfk_2` FOREIGN KEY (`P_Nr`) REFERENCES `tblprojekt` (`p_nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltaetigkeit`
--

LOCK TABLES `tbltaetigkeit` WRITE;
/*!40000 ALTER TABLE `tbltaetigkeit` DISABLE KEYS */;
INSERT INTO `tbltaetigkeit` VALUES (1,10102,'p1','Projektleiter','1988-10-01 00:00:00'),(2,10102,'p3','Gruppenleiter','1989-01-01 00:00:00'),(3,25384,'p2','Sachbearbeiter','1988-02-15 00:00:00'),(4,18316,'p2',NULL,'1989-06-01 00:00:00'),(5,29346,'p2',NULL,'1987-12-15 00:00:00'),(6,2581,'p3','Projektleiter','1989-10-15 00:00:00'),(7,9031,'p1','Gruppenleiter','1989-04-15 00:00:00'),(8,28559,'p1',NULL,'1988-08-01 00:00:00'),(9,28559,'p2','Sachbearbeiter','1989-02-01 00:00:00'),(10,9031,'p3','Sachbearbeiter','1988-11-15 00:00:00'),(11,29346,'p1','Sachbearbeiter','1989-04-01 00:00:00'),(12,29443,'p2','Sachbearbeiter','1989-10-16 00:00:00'),(13,20659,'p2','Sachbearbeiter','1989-10-15 00:00:00');
/*!40000 ALTER TABLE `tbltaetigkeit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-19 13:15:03
