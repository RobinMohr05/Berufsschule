-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: impfung
-- ------------------------------------------------------
-- Server version	8.0.13

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

DROP DATABASE IF EXISTS impfungdb;
CREATE DATABASE IF NOT EXISTS impfungdb;
use impfungdb;

UNLOCK TABLES;
--
-- Table structure for table `arzt`
--

DROP TABLE IF EXISTS `arzt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `arzt` (
  `ArztID` int(11) NOT NULL AUTO_INCREMENT,
  `Titel` varchar(19) DEFAULT NULL,
  `Nachname` varchar(45) DEFAULT NULL,
  `Vorname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ArztID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arzt`
--

LOCK TABLES `arzt` WRITE;
/*!40000 ALTER TABLE `arzt` DISABLE KEYS */;
INSERT INTO `arzt` VALUES (1,'Dr.','Siems','Sibrand'),(2,'Dr.','Beneke','Annekristin'),(3,'Dr.','Keiser','Cordelia'),(4,'Dr.','Butzke','Hartmuth'),(5,'Dr.','Fox','Hannes'),(6,'Dr.','Steinbauer','Ullrich'),(7,'Dr.','Rüdiger','Claudius'),(8,'Dr.','Saager','Leopoldina'),(9,'Dr.','Aulbach','Nadine'),(10,'Dr.','Reichl','Dominic');
/*!40000 ALTER TABLE `arzt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impfstoff`
--

DROP TABLE IF EXISTS `impfstoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `impfstoff` (
  `ImpfstoffID` int(11) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(45) DEFAULT NULL,
  `Anzahl_Dosen` int(11) DEFAULT NULL,
  `Altersgrenze` int(3) DEFAULT NULL,
  `Verträglichkeit` mediumtext,
  `Hinweise` text,
  `ImpfstoffartID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImpfstoffID`),
  KEY `fk_Impfung_Impfungsart_idx` (`ImpfstoffartID`),
  CONSTRAINT `fk_Impfung_Impfungsart` FOREIGN KEY (`ImpfstoffartID`) REFERENCES `impfstoffart` (`impfstoffartid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impfstoff`
--

LOCK TABLES `impfstoff` WRITE;
/*!40000 ALTER TABLE `impfstoff` DISABLE KEYS */;
INSERT INTO `impfstoff` VALUES (1,'BNT 162 (BioNTech/Fosun/Pfizer)',2,16,'sehr gut','keine',1),(2,'mRNA-1273 (Moderna/NIAID)',2,16,'sehr gut','keine',1),(3,'AZD 1222 (AstraZeneca)',2,60,'gut','Trombosen',2),(4,'Ad5-nCoV',2,16,'gut','keine',2);
/*!40000 ALTER TABLE `impfstoff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impfstoffart`
--

DROP TABLE IF EXISTS `impfstoffart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `impfstoffart` (
  `ImpfstoffartID` int(11) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(45) NOT NULL,
  PRIMARY KEY (`ImpfstoffartID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impfstoffart`
--

LOCK TABLES `impfstoffart` WRITE;
/*!40000 ALTER TABLE `impfstoffart` DISABLE KEYS */;
INSERT INTO `impfstoffart` VALUES (1,'Genbasierte Impfstoffe'),(2,'Verkorimpftsoffe'),(3,'Protein-Untereinheiten-Impfstoffe'),(4,'inaktivierte Impfstoffe');
/*!40000 ALTER TABLE `impfstoffart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impfung`
--

DROP TABLE IF EXISTS `impfung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `impfung` (
  `ImpfungID` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  `Zeit` time NOT NULL,
  `Dosisnr` int(11) DEFAULT NULL,
  `Vorkommnisse` text,
  `PatientID` int(11) NOT NULL,
  `ImpfstoffID` int(11) NOT NULL,
  `ArztID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ImpfungID`),
  KEY `fk_Patient_has_Impfung_Impfung1_idx` (`ImpfstoffID`),
  KEY `fk_Patient_has_Impfung_Patient1_idx` (`PatientID`),
  KEY `fk_Patient_Impfung_Arzt1_idx` (`ArztID`),
  CONSTRAINT `fk_Patient_Impfung_Arzt1` FOREIGN KEY (`ArztID`) REFERENCES `arzt` (`arztid`),
  CONSTRAINT `fk_Patient_has_Impfung_Impfung1` FOREIGN KEY (`ImpfstoffID`) REFERENCES `impfstoff` (`impfstoffid`),
  CONSTRAINT `fk_Patient_has_Impfung_Patient1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impfung`
--

LOCK TABLES `impfung` WRITE;
/*!40000 ALTER TABLE `impfung` DISABLE KEYS */;
INSERT INTO `impfung` VALUES (62,'2021-04-03','09:58:00',1322961280,NULL,320,1,2),(63,'2021-01-30','16:48:00',631689200,NULL,302,1,7),(64,'2021-04-24','12:35:00',693343218,NULL,319,1,10),(65,'2021-02-13','12:00:00',1081455915,NULL,335,1,6),(66,'2020-12-31','16:11:00',1593166520,'Schlecht geworden',601,1,3),(67,'2021-01-07','09:18:00',1482955625,NULL,569,1,3),(68,'2021-04-07','08:56:00',1061584204,'Ins Krankenhaus gebracht',330,3,9),(69,'2021-03-11','08:52:00',1885377346,'Ins Krankenhaus gebracht',598,3,9),(70,'2021-03-04','14:08:00',584430719,'Schwindelig geworden',348,1,3),(71,'2021-03-23','09:10:00',1340298347,NULL,570,1,10),(72,'2021-02-26','08:46:00',1823140188,NULL,328,1,3),(73,'2021-02-09','15:55:00',43526830,'Schlecht geworden',300,1,1),(74,'2020-12-28','08:44:00',90896063,NULL,318,1,4),(75,'2021-01-20','10:03:00',91356070,'Schwindelig geworden',604,1,4),(76,'2021-01-03','11:17:00',97939744,NULL,345,1,8),(77,'2021-01-03','15:37:00',61275156,NULL,600,1,2),(78,'2021-01-05','12:40:00',45592004,NULL,323,1,8),(79,'2021-01-07','08:54:00',57176243,NULL,352,1,1),(80,'2021-01-09','14:13:00',60959729,NULL,329,2,2),(81,'2021-01-10','13:06:00',72890735,NULL,532,2,7),(82,'2021-01-11','13:45:00',62769795,'Ins Krankenhaus gebracht',303,2,9),(83,'2021-01-11','10:36:00',54002232,NULL,315,1,1),(84,'2021-01-13','14:01:00',56960074,NULL,566,2,1),(85,'2021-01-20','14:13:00',43620438,NULL,325,1,7),(86,'2021-01-20','07:32:00',55036633,NULL,334,1,1),(87,'2021-01-24','08:37:00',48299103,NULL,595,2,2),(88,'2021-02-11','17:15:00',91086164,NULL,351,2,5),(89,'2021-02-12','08:54:00',63309614,'Schlecht geworden',346,1,5),(90,'2021-02-13','16:42:00',39915438,NULL,322,2,9),(91,'2021-02-17','10:26:00',74482500,NULL,317,1,3),(92,'2021-02-24','16:28:00',61481837,NULL,304,3,6),(93,'2021-02-27','08:59:00',23626761,'Schwindelig geworden',572,2,1),(94,'2021-03-01','07:32:00',67809926,NULL,339,1,1),(95,'2021-03-02','10:57:00',86434458,NULL,567,2,3),(96,'2021-03-05','08:46:00',97394943,'Schwindelig geworden',333,2,2),(97,'2021-03-08','11:20:00',89793296,NULL,349,2,4),(98,'2021-03-06','13:00:00',43786839,'Schwindelig geworden',529,1,4),(99,'2021-03-09','16:33:00',77586144,NULL,602,1,1),(100,'2021-03-01','16:35:00',62005147,NULL,337,3,1),(101,'2021-03-13','12:31:00',26194884,NULL,312,1,7),(102,'2021-03-15','09:45:00',34109889,'Schlecht geworden',336,1,3),(103,'2021-03-17','14:54:00',53641310,'Schwindelig geworden',309,1,9),(104,'2021-03-24','15:51:00',60040274,'Ins Krankenhaus gebracht',568,3,4),(105,'2021-03-24','09:08:00',25043145,NULL,573,2,1),(106,'2021-03-30','09:48:00',25366381,'Schwindelig geworden',314,2,3),(107,'2021-04-04','16:21:00',89772539,NULL,340,1,9),(108,'2021-04-07','09:08:00',78570516,NULL,311,1,9),(109,'2021-04-11','15:28:00',22420686,NULL,326,2,4),(110,'2021-04-18','11:07:00',31297197,NULL,310,3,2),(111,'2021-04-18','17:02:00',63229281,NULL,603,1,2),(112,'2021-04-20','14:52:00',68599764,'Schwindelig geworden',343,1,9),(113,'2021-04-20','08:25:00',62259846,NULL,347,1,2),(114,'2021-04-22','08:43:00',94845618,'Ins Krankenhaus gebracht',597,1,1),(115,'2021-04-25','09:48:00',93356111,'Schwindelig geworden',565,2,2),(116,'2021-04-20','18:06:00',75372001,NULL,602,1,7),(117,'2021-04-19','12:53:00',24042699,NULL,349,2,8),(118,'2021-04-17','14:33:00',15846998,NULL,529,1,1),(119,'2021-04-16','10:19:00',50381398,NULL,333,2,5),(120,'2021-04-15','15:41:00',271966243,'Schlecht geworden',348,1,4),(121,'2021-04-13','12:30:00',13854362,NULL,567,2,8),(122,'2021-04-12','09:05:00',43794348,NULL,339,1,10),(123,'2021-04-10','10:32:00',23489954,NULL,572,2,1),(124,'2021-04-09','10:19:00',967833489,'Schwindelig geworden',328,1,10),(125,'2021-03-31','11:59:00',63043447,NULL,317,1,6),(126,'2021-03-27','13:33:00',397925526,NULL,335,1,6),(127,'2021-03-27','18:15:00',7804093,'Schlecht geworden',322,2,5),(128,'2021-03-26','10:27:00',763616,NULL,346,1,5),(129,'2021-03-25','18:48:00',24597043,'Schwindelig geworden',351,2,5),(130,'2021-03-20','17:28:00',38618107,NULL,300,1,3),(131,'2021-03-13','18:21:00',465593172,NULL,302,1,6),(132,'2021-03-07','10:10:00',24913217,NULL,595,2,6),(133,'2021-03-03','11:36:00',14350720,NULL,604,1,6),(134,'2021-03-03','15:46:00',10837256,NULL,325,1,1),(135,'2021-03-03','09:05:00',4058140,NULL,334,1,9),(136,'2021-02-24','15:34:00',18323270,NULL,566,2,3),(137,'2021-02-22','15:18:00',49102474,NULL,303,2,9),(138,'2021-02-22','12:09:00',22609904,NULL,315,1,1),(139,'2021-02-20','14:39:00',22726324,NULL,532,2,2),(140,'2021-02-20','15:46:00',38314960,NULL,329,2,3),(141,'2021-02-18','10:51:00',317293271,NULL,569,1,6),(142,'2021-02-18','10:27:00',54649915,NULL,352,1,4),(143,'2021-02-16','14:13:00',16295971,'Schlecht geworden',323,1,9),(144,'2021-02-14','12:50:00',73940793,NULL,345,1,9),(145,'2021-02-14','17:10:00',42866245,NULL,600,1,5),(146,'2021-02-11','17:44:00',579867357,NULL,601,1,5),(147,'2021-02-08','10:17:00',77202612,'Schwindelig geworden',318,1,10);
/*!40000 ALTER TABLE `impfung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impfzentrum`
--

DROP TABLE IF EXISTS `impfzentrum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `impfzentrum` (
  `ImpfzentrumID` int(11) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(45) DEFAULT NULL,
  `Strasse` varchar(45) DEFAULT NULL,
  `HausNr` varchar(4) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL,
  `Ort` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ImpfzentrumID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impfzentrum`
--

LOCK TABLES `impfzentrum` WRITE;
/*!40000 ALTER TABLE `impfzentrum` DISABLE KEYS */;
INSERT INTO `impfzentrum` VALUES (1,'An der Messe (Halle 11)','Messedamm','22','14055','Berlin'),(2,'Sporthalle der Berufsbildenden Schule','Mittelfeld','50','06886','Wittenberg'),(3,'Messehallen','Messeplatz','1','20357','Hamburg'),(4,'Schwedenkai','Schwedenkai','1','24103','Kiel'),(5,'ehem. Verbrauchermarkt','Güterstraße','48a','26389','Wilhelmshaven'),(6,'Messehalle 25','Messegelände','25','30521','Hannover'),(7,'Warsetiner Music Hall','Phoenixplatz','4','44263','Dortmund'),(8,'Aachener Eissporthalle','Hubter-Wienen-Straße','8','52070','Aachen'),(9,'Messe Frankfurt am Main Messehalle','Ludwig-Erhard-Anlage','1','60326','Franknfurt am Main'),(10,'Stuttgart Robert-Bosch-Krankenhaus','Auerbachstraße ','110','70376','Stuttgart'),(11,'Messe München / Halle C3 Eingang Nord Tor 17','Paul-Henri-Spaak-Straße','12','81829','München'),(12,'X-Point-Halle','Messestraße','12','94036','Passau');
/*!40000 ALTER TABLE `impfzentrum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `PatientID` int(11) NOT NULL AUTO_INCREMENT,
  `Anrede` varchar(5) DEFAULT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Nachname` varchar(45) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `Strasse` varchar(45) NOT NULL,
  `HausNr` varchar(4) NOT NULL,
  `PLZ` varchar(5) NOT NULL,
  `Ort` varchar(45) NOT NULL,
  `Telefon` varchar(45) NOT NULL,
  `Mobil` varchar(45) NOT NULL,
  `EMail` varchar(45) NOT NULL,
  `ImpfzentrumID` int(11) DEFAULT NULL,
  `PriogruppeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `fk_Patient_Impfzentrum1_idx` (`ImpfzentrumID`),
  KEY `fk_Patient_Priogruppe1_idx` (`PriogruppeID`),
  CONSTRAINT `fk_Patient_Impfzentrum1` FOREIGN KEY (`ImpfzentrumID`) REFERENCES `impfzentrum` (`impfzentrumid`),
  CONSTRAINT `fk_Patient_Priogruppe1` FOREIGN KEY (`PriogruppeID`) REFERENCES `priogruppe` (`priogruppeid`)
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (300,'Herr','Alwin','Baur','1948-07-12','Am Nothbach','135','09306','Zettlitz','03737/14276950','0163/2216423','a12@ultramail.none',2,1),(301,'Herr','Friedhold','Bihler','1976-03-28','Mobilheimpark','151','14052','Charlottenburg','030/71618386','0178/4319870','fbihler@net-mail.none',1,4),(302,'Herr','Horstfried','Settele','1925-04-17','Springstraße','159','39579','Uenglingen','03931/4496820','0171/3499661','horstfried.4-17@bestmail.none',6,1),(303,'Frau','Angelika','Iser','1930-06-28','Am Südhang','77','72660','Beuren','07025/78249820','0167/6010387','aiser@web.none',10,1),(304,'Herr','Conner','Brosius','1958-07-16','Birder Straße','189','44267','Dortmund','0231/16450288','0179/1939557','conner.16@bestmail.none',7,2),(305,'Herr','Sighard','Holze','1990-05-05','Overbergstraße','70','59071','Hamm','02381/23957993','0159/2009034','sighardholze@spam-mail.none',8,3),(306,'Herr','Arnold','Senger','1991-12-25','Schlehenstraße','4','67593','Bermersheim','06244/82222414','0172/2181747','arnoldsenger@inter-mail.none',9,3),(307,'Frau','Steffie','Fichtl','1996-03-04','Hoerstgener Weg','195','27243','Beckeln','04434/27697903','0169/2113862','steffie.fichtl@trashmail.none',5,4),(308,'Frau','Sieglinde','Graf','1997-06-08','Am Schwanenteich','114','63263','Neu-Isenburg','06102/25662375','0166/2612443','sieglinde.graf@validmail.none',9,4),(309,'Herr','Ingomar','Kugler','1927-04-13','Rektoratsweg','87','84547','Emmerting','08679/79557107','0160/9805354','ingomar-kugler@net-mail.none',11,1),(310,'Frau','Joy','Winterstein','1959-12-26','Letterhausstraße','19','29571','Rosche','05803/2897166','0161/6001565','joy.winterstein@trashmail.none',5,2),(311,'Herr','Theobert','Wittrock','1925-10-11','Lohmannskath','146','56459','Willmenrod','02663/15205231','0170/8109306','theobert-wittrock@quickmail.none',8,1),(312,'Herr','Sigmut','Jungermann','1950-06-27','Burscheder Weg','33','79685','Häg-Ehrsberg','07625/59846504','0179/5253943','s-jungermann@trashmail.none',10,1),(313,'Herr','Colin','Giebel','1984-12-04','Mauerstraße','3','71088','Holzgerlingen','07031/73320757','0171/3019873','c.giebel@mymail.none',10,4),(314,'Frau','Mania','Breier','1937-03-18','Dauner Straße','163','54646','Bettingen','06527/32497188','0178/1121290','mania_3-18@email.none',8,1),(315,'Herr','Rembert','Münzner','1971-01-19','St.-Matthias-Straße','106','23826','Todesfelde','04558/80662985','0173/6635496','rembertmuenzner@xyz.none',3,1),(316,'Frau','Gottfrieda','Mittendorf','2003-10-28','Tunnelstraße','92','94130','Obernzell','08591/90585129','0155/6512418','gottfriedamittendorf@justmail.none',12,4),(317,'Herr','Luke','Matthiesen','1983-01-28','Mosewaldstraße','34','41366','Schwalmtal','02163/11220063','0155/5416177','l_matthiesen@hoster.none',7,2),(318,'Frau','Feli','Göttlicher','1947-12-10','Auf der Höhe','114','86444','Affing','08207/6732837','0175/1623574','f.goettlicher@company.none',11,1),(319,'Herr','Balthasar','Breiter','1958-09-23','Heven','26','52349','Düren','02421/87462606','0165/4303564','b-23@validmail.none',8,1),(320,'Herr','Laurenz','Moschner','1924-10-08','Wannenstraße','29','25379','Herzhorn','04124/40578938','0156/5072455','laurenzmoschner@funmail.none',4,1),(321,'Herr','Niclas','Wendorf','1997-01-15','Kottenheimer Straße','125','78594','Gunningen','07424/2091661','0175/1605939','niclaswendorf@spam-mail.none',10,4),(322,'Herr','Patrik','Mahlberg','1941-07-12','Steilstraße','51','21775','Odisheim','04756/42146264','0167/8138715','patrik.mahlberg@live-mail.none',3,1),(323,'Herr','Jannick','Krimmel','1947-02-21','Auf der Geist','62','73460','Hüttlingen','07361/81350071','0178/3015535','jannick-krimmel@email.none',10,1),(324,'Herr','Gottlieb','Haschke','1990-08-04','Moselpromenade','115','82290','Landsberied','08141/61746338','0172/5660529','gottlieb_haschke@funmail.none',11,4),(325,'Herr','Edwin','Röhricht','1949-10-23','Zum Galgenberg','126','57636','Mammelzen','02681/95218065','0167/9873808','edwin0-23@funmail.none',8,1),(326,'Herr','Hansjörg','Krampitz','1932-08-13','Neulandstraße','172','72358','Dormettingen','07427/52068830','0163/2696721','hansjoerg-8-13@ultramail.none',10,1),(327,'Herr','Wilderich','Bretschneider','1970-07-02','Am Ehrenmal','30','31629','Estorf','05025/9869345','0160/8465120','wilderich.bretschneider@validmail.none',6,4),(328,'Frau','Hildtraud','Baum','2001-10-30','An der Aa','87','66849','Landstuhl','06371/36612250','0153/5145744','hildtraud_baum@validmail.none',9,2),(329,'Herr','Bernt','Weaver','1931-10-07','Borngarten','97 b','67728','Münchweiler an der Alsenz','06302/60495774','0151/2376249','bernt.weaver@ultramail.none',9,1),(330,'Herr','Miguel','Tillmanns','1955-09-12','Hövelstraße','83','60435','Frankfurt am Main','069/201890','0160/7563343','m-tillmanns@goggle-mail.none',9,2),(331,'Herr','Ralph','Schwöbel','1990-05-24','Breniger Straße','18a','39291','Küsel','06381/90659211','0167/6712710','r-schwoebel@private.none',6,4),(332,'Herr','Simpert','Pfützner','1967-10-08','Mendt','86','63543','Neuberg','06183/35928251','0162/8746283','simpert08@funmail.none',9,4),(333,'Frau','Sigtrud','Klemme','1939-03-25','Narzissenweg','89','26757','Borkum','04922/30628550','0175/8976572','sigtrud25@private.none',5,1),(334,'Frau','Pauline','Holthausen','1950-04-09','Hagenstraße','144','45770','Marl','02365/14097385','0166/2257122','p_holthausen@hoster.none',7,1),(335,'Herr','Eitelfritz','Thieme','1986-02-06','Pieperfeldweg','115','55595','Allenfeld','06756/269589','0172/4625068','eitelfritz-thieme@justmail.none',8,1),(336,'Herr','Sturmhard','Mosig','1989-12-21','Gaterstraße','84','06886','Lutherstadt Wittenberg','03491/57306760','0175/6557985','sturmhard_21@ultramail.none',2,1),(337,'Herr','Holm','Thiele','1956-10-31','Scheidter Straße','194','54341','Fell','06502/36165835','0170/4509913','holm-31@validmail.none',8,2),(338,'Frau','Sophia','Röver','2003-02-16','Heilmannstraße','196','66957','Kröppen','06331/74267700','0172/7389509','sophia.roever@mymail.none',9,4),(339,'Herr','Rasso','Dogan','1958-01-13','Kalkumer Feld','106','76344','Eggenstein-Leopoldshafen','0721/69659633','0168/9460807','r-1-13@goggle-mail.none',10,1),(340,'Frau','Korinna','Bülow','1985-01-11','Leberstraße','88','45968','Gladbeck','02043/68561288','0170/4877897','korinna-buelow@company.none',7,2),(341,'Frau','Trautlinde','Hoßfeld','1989-10-02','Gemen','117','39307','Brettin','03933/63021266','0173/3576141','trautlindehossfeld@quickmail.none',6,3),(342,'Frau','Susi','Schug','1977-07-04','Im Sief','2','72474','Winterlingen','07434/28758986','0171/9632256','susi-schug@kitty.none',10,4),(343,'Herr','Friedrich','Ihde','1972-06-09','Dörrhoff','147','76479','Steinmauern','07222/60814137','0168/2768512','fihde@xyz.none',10,3),(344,'Frau','Joy','Wegmann','1999-06-01','Oleanderweg','98','55294','Bodenheim','06135/71870924','0151/5886351','joy_wegmann@xyz.none',8,3),(345,'Frau','Helmgard','Dütsch','1985-03-29','Kornfeldstraße','200','35686','Dillenburg','02771/81324301','0176/2563064','h-duetsch@xyz.none',6,3),(346,'Herr','Timotheus','Merl','1947-11-05','Schwarzbachstraße','148','86476','Neuburg an der Kammel','08238/78012685','0153/9815191','timotheus05@goggle-mail.none',11,1),(347,'Frau','Lintrud','Kölzer','1966-11-06','Windhukstraße','104','74586','Frankenhardt','07959/23218181','0164/1343887','lintrudkoelzer@anymail.none',10,3),(348,'Herr','Ekhardt','Dietel','1978-07-18','Schulkamp','43','30539','Hannover','0511/20158785','0169/6914840','ekhardt.dietel@xyz.none',6,2),(349,'Frau','Viktoria','Scheller','1943-11-11','Seifenstraße','147','65385','Rüdesheim am Rhein','06722/39477664','0168/4573246','v-scheller@private.none',9,1),(350,'Herr','Ferdinandus','Brandenburg','1983-06-09','Stimbergstraße','181','56587','Oberraden','02634/50545779','0153/7904236','fbrandenburg@email.none',8,4),(351,'Frau','Ilsegret','Rüther','1938-07-18','Grambker Heerstraße','2','94513','Schönberg','08554/25239555','0164/1790870','ilsegret-18@mymail.none',12,1),(352,'Frau','Ottilie','Quednau','1926-01-16','Auf der Hell','109','23845','Itzstedt','04535/77898176','0178/2378997','o.quednau@email.none',3,1),(353,'Herr','Desiderius','Uhlich','1996-08-07','Diekland','18','89361','Landensberg','08222/75761076','0164/4175426','d-07@kitty.none',11,4),(527,'Herr','Eckard','Ost','2002-06-03','Kannenbäckerstraße','3','55494','Erbach','06764/32228181','0150/6425478','eckard_ost@goggle-mail.none',8,4),(528,'Frau','Ilona','Labyrinth','1992-07-15','Epgerter Straße','88','37170','Uslar','05571/4622144','0177/9655834','ilonalabyrinth@web.none',6,3),(529,'Herr','Maurice','Kay','1926-10-25','Bitzerweg','193','58739','Wickede an der Ruhr','02377/80190115','0152/5928621','maurice_kay@quickmail.none',8,1),(530,'Frau','Sabinchen','Weigl','2002-11-16','Mühlenkamp','120','20257','Hamburg','040/42441460','0167/8397180','s-weigl@live-mail.none',3,4),(531,'Frau','Helma','Bußmann','1987-04-14','Altenburgstraße','45','56766','Horperath','02692/29518933','0169/6832350','h.bussmann@private.none',8,4),(532,'Herr','Ralf','Herm','1938-11-01','Ernst-Toller-Straße','168','19348','Perleberg','03876/67845378','0164/1938903','ralf-1-01@domain.none',1,1),(564,'Frau','Adriane','Rietschel','1999-01-03','Mühlenfeld','12','39110','Magdeburg','0391/74072831','0153/9227903','adriane_rietschel@open-mail.none',6,4),(565,'Frau','Dorle','Nash','1933-04-01','Mönchsweg','31','35216','Biedenkopf','06461/96174419','0152/4108614','dorle.nash@trashmail.none',6,1),(566,'Frau','Reglindis','Rommel','1929-07-04','Fliederstraße','121','56729','Arft','02651/90955727','0171/1983276','reglindis.rommel@live-mail.none',8,1),(567,'Frau','Catrin','Männel','1983-07-23','Further Straße','161','70839','Gerlingen','07156/64805108','0163/1640503','c-maennel@hoster.none',10,3),(568,'Frau','Irena','Heuer','1967-01-29','Schubartstraße','188','09390','Gornsdorf','03721/7605976','0165/2665779','i_heuer@web.none',2,2),(569,'Herr','Amadeus','Dworschak','1999-04-07','Carl-Sonnenschein-Straße','87','64625','Bensheim','06251/79597997','0152/7271246','amadeus-dworschak@bestmail.none',9,1),(570,'Herr','Dietrich','Nebe','1985-09-01','Vorgebirgstraße','31','52445','Titz','02463/38055570','0179/8159996','dietrich-01@email.none',8,2),(571,'Herr','Piet','Rutkowski','1984-05-10','Pastoratsweg','18','68766','Hockenheim','06205/87324326','0176/9303916','p-10@kitty.none',9,4),(572,'Frau','Ursel','Hicks','1943-09-09','Hufen','165','67829','Reiffelbach','06753/22602418','0162/6697654','ursel_hicks@ultramail.none',9,1),(573,'Herr','Jonny','Lehr','1931-05-22','An der Burg','74','54538','Kinderbeuern','06541/16338101','0168/7843171','jonny-5-22@anymail.none',8,1),(574,'Herr','Fritzi','Creutz','2000-07-17','Waltroper Straße','174','73102','Birenbach','07161/32272974','0153/2136836','f.creutz@email.none',10,4),(575,'Herr','Linus','Auch','2002-10-18','Haferweg','43','54636','Ehlenz','06561/32208674','0163/7105892','l_0-18@justmail.none',8,4),(576,'Frau','Thilde','Timmermann','1961-08-28','Spielbergweg','3','37214','Witzenhausen','05542/2860561','0163/5206922','t.28@retromail.none',6,4),(595,'Frau','Nike','Reich','1939-12-24','Regtbrink','20','55469','Pleizenhausen','06761/94667144','0173/7955798','nike_reich@trashmail.none',8,1),(596,'Frau','Herzlinde','Schreiter','1985-07-15','Schmittmannstraße','120','24996','Sterup','04637/49413360','0179/7632295','herzlinde.15@open-mail.none',4,3),(597,'Frau','Nelli','Plöger','1953-08-12','Unter den Eichen','24','70186','Stuttgart','0711/24351440','0166/1200853','nelliploeger@web.none',10,2),(598,'Herr','David','Hain','1957-11-19','Nauheimer Straße','79','25774','Lehe','04882/85013201','0177/6030595','d_hain@mymail.none',5,2),(599,'Herr','Gerdt','Gesing','2000-09-18','Knipperweg','168','56355','Winterwerb','06772/31513218','0167/6563952','gerdt.gesing@web.none',8,4),(600,'Frau','Gerhild','Speicher','1978-11-23','Tannenwäldchen','24','70372','Stuttgart','0711/45149514','0171/6161400','g.23@anymail.none',10,2),(601,'Frau','Henriette','Gerkens','1986-04-09','Wiesengrund','79','55758','Wirschweiler','06785/34697067','0154/7109146','h.4-09@validmail.none',8,1),(602,'Frau','Nathalie','Schöneberg','1957-10-02','Im Kirchenstück','118','27324','Hassel','04254/60511986','0166/5356165','nathalie02@net-mail.none',5,1),(603,'Frau','Margunde','Fackler','1926-06-25','Kengen','1','54675','Lahr','06564/8953541','0153/1337288','margunde_fackler@live-mail.none',8,1),(604,'Frau','Senta','Heydt','1945-08-19','Dorffeld','53','84367','Tann','08572/15282621','0164/3324443','senta_heydt@ultramail.none',11,1);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priogruppe`
--

DROP TABLE IF EXISTS `priogruppe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `priogruppe` (
  `PriogruppeID` int(11) NOT NULL AUTO_INCREMENT,
  `Gruppenname` varchar(45) DEFAULT NULL,
  `Gruppenbezeichung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PriogruppeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priogruppe`
--

LOCK TABLES `priogruppe` WRITE;
/*!40000 ALTER TABLE `priogruppe` DISABLE KEYS */;
INSERT INTO `priogruppe` VALUES (1,'Hochrisiko','Serh hohes Risiko schwerer Verlauf'),(2,'Risiko','Hohes Risiko schwerer Verlauf'),(3,'Geringes Risiko','Geringes Risiko eines schweren Verlaufs'),(4,'Kaum Risiko','Sehr geringes Risiko eines schweren Verlaufs');
/*!40000 ALTER TABLE `priogruppe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-24 10:25:56
