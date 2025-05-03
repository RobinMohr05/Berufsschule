DROP DATABASE IF EXISTS Kosidasdb;

CREATE DATABASE Kosidasdb;

USE Kosidasdb;

--
-- Table structure for table `ort`
--

DROP TABLE IF EXISTS `ort`;
CREATE TABLE `ort` (
  `plzid` int(11) NOT NULL AUTO_INCREMENT,
  `plz` varchar(5) DEFAULT NULL,
  `stadt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`plzid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO `ort` VALUES (1,'90402','Nuernberg'),(2,'80271','Muenchen'),(3,'97070','Wuerzburg'),(4,'97816','Lohr am Main'),(5,'30139','Hannover'),(6,'97084','Wuerzburg'),(7,'97262','Hausen b. Wuerzburg'),(8,'97074','Wuerzburg'),(9,'97273','Kuernach'),(10,'97228','Rottendorf'),(11,'97072','Wuerzburg'),(12,'97279','Prosselsheim'),(13,'97070','Wuerzburg'),(14,'97076','Wuerzburg');

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
CREATE TABLE `kategorie` (
  `kategorieid` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kategorieid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `kategorie` VALUES (1,'Schuhe'),(2,'Kleidung'),(3,'Accessoires');

--
-- Table structure for table `farbe`
--

DROP TABLE IF EXISTS `farbe`;
CREATE TABLE `farbe` (
  `farbid` varchar(10) NOT NULL,
  `bezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`farbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `farbe` VALUES ('#000000','schwarz'),('#0000FF','blau '),('#00FF00','grue?n'),('#c0c0c0','grau'),('#FF0000','rot'),('#FFA500','orange'),('#FFc0cb','pink'),('#FFFF00','gelb'),('#FFFFFF','weiss');

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `bic` varchar(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `plzid` int(11) NOT NULL,
  PRIMARY KEY (`bic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bank` VALUES ('BYLADEM1SWU','Sparkasse Mainfranken Wuerzburg',3),('COBADEFFXXX','Commerzbank Nuernberg',1),('DEUTDEMMXXX','Deutsche bank Muenchen',2),('GENODEF1GEM','Raiffeisenbank Main-Spessart',4),('PBNKDEFFXXX','Postbank Hannover',5), ('GENODEF1P17','PSD Nürnberg',1);

--
-- Table structure for table `artikel`
--

DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (
  `artikelid` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(45) DEFAULT NULL,
  `kategorieid` int(11) NOT NULL,
  `farbid` varchar(10) NOT NULL,
  `preis` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`artikelid`)
) ENGINE=InnoDB AUTO_INCREMENT=134492 DEFAULT CHARSET=utf8;

INSERT INTO `artikel` VALUES (134456,'Sportschuh River',1,'#000000',59.95),(134457,'Sportschuh River',1,'#0000FF',59.95),(134458,'Sportschuh River',1,'#FF0000',59.95),(134459,'Sportschuh light',1,'#000000',79.99),(134460,'Sportschuh light',1,'#0000FF',79.99),(134461,'Sportschuh light',1,'#FF0000',79.99),(134462,'Sportschuh natural',1,'#000000',69.95),(134463,'Sportschuh natural',1,'#0000FF',69.95),(134464,'Sportschuh natural',1,'#FF0000',69.95),(134465,'UEFA EURO 2016 Deutschland',2,'#FFFFFF',79.95),(134466,'Poloshirt London',2,'#FFFFFF',19.95),(134467,'Poloshirt London',2,'#00FF00',19.95),(134468,'Poloshirt London',2,'#FF0000',19.95),(134469,'Poloshirt London',2,'#c0c0c0',19.95),(134470,'Poloshirt London',2,'#FFFF00',19.95),(134471,'Longsleeve O.L',2,'#FFFFFF',25.90),(134472,'Longsleeve O.L',2,'#00FF00',25.90),(134473,'Longsleeve O.L',2,'#FF0000',25.90),(134474,'Longsleeve O.L',2,'#c0c0c0',25.90),(134475,'Longsleeve O.L',2,'#FFFF00',25.90),(134476,'Longsleeve O.L',2,'#FFA500',25.90),(134477,'Tanktop O.L',2,'#FFFFFF',19.95),(134478,'Tanktop O.L',2,'#00FF00',19.95),(134479,'Tanktop O.L',2,'#FF0000',19.95),(134480,'Tanktop O.L',2,'#c0c0c0',19.95),(134481,'Tanktop O.L',2,'#FFFF00',19.95),(134482,'UEFA EURO 2016 Ball',3,'#FFFFFF',24.95),(134483,'FIFA WM 2014 Ball',3,'#FFFFFF',19.95),(134484,'KOSidas Team-Tasche',3,'#000000',59.90),(134485,'KOSidas Team-Tasche',3,'#c0c0c0',59.90),(134486,'KOSidas Team-Tasche',3,'#0000FF',59.90),(134487,'Trainingshose CHECK',2,'#000000',29.90),(134488,'Trainingshose CHECK',2,'#0000FF',29.90),(134489,'Trainingshose CHECK',2,'#c0c0c0',29.90),(134490,'Trainingshose CHECK',2,'#FFc0cb',29.90),(134491,'Trainingshose CHECK',2,'#FFFF00',29.90);

--
-- Table structure for table `kunde`
--

DROP TABLE IF EXISTS `kunde`;
CREATE TABLE `kunde` (
  `kundeid` int(11) NOT NULL AUTO_INCREMENT,
  `nachname` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  `strasse` varchar(45) DEFAULT NULL,
  `nummer` varchar(3) DEFAULT NULL,
  `plzid` int(11) NOT NULL,
  `iban` varchar(34) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`kundeid`)
) ENGINE=InnoDB AUTO_INCREMENT=1127 DEFAULT CHARSET=utf8;

INSERT INTO `kunde` VALUES (1111,'Albrecht','Hans','Hauptstrasse', '34',3,'DE10469451550427046185','BYLADEM1SWU'),(1112,'Baertler','Eberhard','Schulstrasse', '12',1,'DE51079383193895505600','COBADEFFXXX'),(1113,'Becker','Claudia','Gartenstrasse','3',1,'DE87280552538644833256','COBADEFFXXX'),(1114,'Hoffmann','Matthias','Bahnhofstrasse','44',4,'DE11313795553717407131','GENODEF1GEM'),(1115,'Kleineschaar','Peter','Bergstrasse','133',5,'DE90309027474883622234','PBNKDEFFXXX'),(1116,'Koenig','Johanna','Birkenweg','2',2,'DE32275197427003047056','DEUTDEMMXXX'),(1117,'Mueller','Michael','Lindenstrasse','78',3,'DE81387768871052634813','BYLADEM1SWU'),(1118,'Neumann','Laura','Kirchstrasse','1',1,'DE41686535144085322226','COBADEFFXXX'),(1119,'Pfennig','Sabine','Waldstrasse','99',5,'DE15122666281748667001','PBNKDEFFXXX'),(1120,'Schaefer','Andreas','Ringstrasse','2',4,'DE41263293419445891556','GENODEF1GEM'),(1121,'Schmidt','Stefan','Schillerstrasse','10a',2,'DE39045846737026319413','DEUTDEMMXXX'),(1122,'Schneider','Lennard','Amselweg','9',2,'DE75809870422109655695','DEUTDEMMXXX'),(1123,'Schulz','Oliver','Jahnstrasse','7',3,'DE18575040339719722166','BYLADEM1SWU'),(1124,'Schwarz','Ulrich','Buchenweg','59',2,'DE98178293021402181160','DEUTDEMMXXX'),(1125,'Wagner','Richi','Wiesenstrasse','71',4,'DE71968839911149658452','GENODEF1GEM'),(1126,'Westermann','Arndt','Am Sportplatz','26',1,'DE75809870422109655695','COBADEFFXXX');

--
-- Table structure for table `mitarbeiter`
--

DROP TABLE IF EXISTS `mitarbeiter`;
CREATE TABLE `mitarbeiter` (
  `mitarbeiterid` int(11) NOT NULL,
  `nachname` varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  `strasse` varchar(45) DEFAULT NULL,
  `nummer` varchar(3) DEFAULT NULL,
  `plzid` int(11) NOT NULL,
  `geschlecht` char(1) DEFAULT NULL,
  `gehalt` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`mitarbeiterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mitarbeiter` VALUES (1002,'Janicks','Inke','Ringweg','11',13,'w',7000.00),(1005,'Zirpe','Michael','Hammelburgerstrasse', '34',6,'m',7000.00),(1006,'Lemme','Markus','Im Trepp','19',7,'m',5300.00),(1007,'Trost','Christiane','Bergstrasse', '46',8,'w',4800.00),(1008,'Schroeter','Roland','Hauptstrasse', '10',9,'m',4500.00),(1009,'Reichelt','Silke','Langestrasse', '54',10,'w',3900.00),(1010,'Pfau','Erich','Hallesche strasse', '16',11,'m',2800.00),(1011,'Taro','Ulrich','Nicolaiplatz', '2',8,'m',2900.00),(1012,'Marx','Christine','Suellerstrasse', '21',12,'w',2100.00),(1013,'Wicki','Joerg','Weidenstrasse', '51',13,'m',2455.00),(1014,'Ecke','Silvia','Brandstrasse', '3b',6,'w',2700.00),(1015,'Mieder','Christa','Dorfweg', '22',12,'w',2600.00),(1016,'Jach','Bernd','Nordstrasse' ,'11',10,'m',1200.00),(1017,'Schockler','Peter','Gerberweg', '1',6,'m',3000.00),(1018,'Renner','Manfred','Launsingerstrasse', '45',14,'m',2555.00);

--
-- Table structure for table `bestand`
--

DROP TABLE IF EXISTS `bestand`;
CREATE TABLE `bestand` (
  `bestandID` int(11) NOT NULL AUTO_INCREMENT,
  `artikelid` int(11) NOT NULL,
  `groesse` varchar(3) DEFAULT NULL,
  `anzahl` int(11) DEFAULT NULL,
  PRIMARY KEY (`bestandID`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

INSERT INTO `bestand` VALUES (1,134456,'38',123),(2,134456,'39',125),(3,134456,'40',22),(4,134456,'41',135),(5,134456,'42',67),(6,134456,'43',22),(7,134456,'44',68),(8,134456,'45',142),(9,134456,'46',86),(10,134457,'38',37),(11,134457,'39',133),(12,134457,'40',84),(13,134457,'41',39),(14,134457,'42',62),(15,134457,'43',25),(16,134457,'44',98),(17,134457,'45',63),(18,134457,'46',103),(19,134458,'38',109),(20,134458,'39',138),(21,134458,'40',88),(22,134458,'41',92),(23,134458,'42',53),(24,134458,'43',103),(25,134458,'44',36),(26,134458,'45',57),(27,134458,'46',75),(28,134459,'38',32),(29,134459,'39',40),(30,134459,'40',54),(31,134459,'41',94),(32,134459,'42',46),(33,134459,'43',81),(34,134459,'44',128),(35,134459,'45',75),(36,134459,'46',44),(37,134460,'38',135),(38,134460,'39',101),(39,134460,'40',126),(40,134460,'41',34),(41,134460,'42',18),(42,134460,'43',62),(43,134460,'44',141),(44,134460,'45',75),(45,134460,'46',90),(46,134461,'38',72),(47,134461,'39',84),(48,134461,'40',89),(49,134461,'41',76),(50,134461,'42',31),(51,134461,'43',74),(52,134461,'44',117),(53,134461,'45',144),(54,134461,'46',149),(55,134462,'38',79),(56,134462,'39',34),(57,134462,'40',149),(58,134462,'41',71),(59,134462,'42',108),(60,134462,'43',97),(61,134462,'44',38),(62,134462,'45',31),(63,134462,'46',141),(64,134463,'38',76),(65,134463,'39',39),(66,134463,'40',99),(67,134463,'41',148),(68,134463,'42',73),(69,134463,'43',59),(70,134463,'44',145),(71,134463,'45',66),(72,134463,'46',69),(73,134464,'38',81),(74,134464,'39',102),(75,134464,'40',45),(76,134464,'41',32),(77,134464,'42',120),(78,134464,'43',102),(79,134464,'44',80),(80,134464,'45',13),(81,134464,'46',18),(82,134465,'S',40),(83,134465,'M',51),(84,134465,'L',56),(85,134465,'XL',126),(86,134465,'XXL',75),(87,134466,'S',118),(88,134466,'M',113),(89,134466,'L',62),(90,134466,'XL',96),(91,134466,'XXL',60),(92,134467,'S',100),(93,134467,'M',113),(94,134467,'L',35),(95,134467,'XL',147),(96,134467,'XXL',56),(97,134468,'S',83),(98,134468,'M',92),(99,134468,'L',8),(100,134468,'XL',93),(101,134468,'XXL',67),(102,134469,'S',92),(103,134469,'M',88),(104,134469,'L',29),(105,134469,'XL',79),(106,134469,'XXL',73),(107,134470,'S',11),(108,134470,'M',72),(109,134470,'L',140),(110,134470,'XL',2),(111,134470,'XXL',34),(112,134471,'S',11),(113,134471,'M',90),(114,134471,'L',41),(115,134471,'XL',117),(116,134471,'XXL',90),(117,134472,'S',148),(118,134472,'M',118),(119,134472,'L',132),(120,134472,'XL',91),(121,134472,'XXL',125),(122,134473,'S',79),(123,134473,'M',144),(124,134473,'L',114),(125,134473,'XL',58),(126,134473,'XXL',91),(127,134474,'S',15),(128,134474,'M',100),(129,134474,'L',7),(130,134474,'XL',37),(131,134474,'XXL',109),(132,134475,'S',50),(133,134475,'M',16),(134,134475,'L',56),(135,134475,'XL',60),(136,134475,'XXL',148),(137,134476,'S',87),(138,134476,'M',86),(139,134476,'L',66),(140,134476,'XL',1),(141,134476,'XXL',8),(142,134477,'S',36),(143,134477,'M',129),(144,134477,'L',148),(145,134477,'XL',49),(146,134477,'XXL',118),(147,134478,'S',103),(148,134478,'M',73),(149,134478,'L',126),(150,134478,'XL',49),(151,134478,'XXL',64),(152,134479,'S',56),(153,134479,'M',77),(154,134479,'L',85),(155,134479,'XL',107),(156,134479,'XXL',97),(157,134480,'S',149),(158,134480,'M',28),(159,134480,'L',39),(160,134480,'XL',109),(161,134480,'XXL',123),(162,134481,'S',111),(163,134481,'M',146),(164,134481,'L',134),(165,134481,'XL',46),(166,134481,'XXL',84),(167,134482,'UNI',85),(168,134483,'UNI',9),(169,134484,'UNI',126),(170,134485,'UNI',55),(171,134486,'UNI',133),(172,134487,'S',78),(173,134487,'M',78),(174,134487,'L',74),(175,134487,'XL',139),(176,134487,'XXL',43),(177,134488,'S',127),(178,134488,'M',70),(179,134488,'L',119),(180,134488,'XL',107),(181,134488,'XXL',113),(182,134489,'S',21),(183,134489,'M',129),(184,134489,'L',146),(185,134489,'XL',102),(186,134489,'XXL',94),(187,134490,'S',31),(188,134490,'M',51),(189,134490,'L',130),(190,134490,'XL',83),(191,134490,'XXL',126),(192,134491,'S',3),(193,134491,'M',47),(194,134491,'L',133),(195,134491,'XL',22),(196,134491,'XXL',26);


--
-- Table structure for table `bestellung`
--

DROP TABLE IF EXISTS `bestellung`;
CREATE TABLE `bestellung` (
  `bestellid` int(11) NOT NULL AUTO_INCREMENT,
  `bestelldatum` date NOT NULL,
  `kundeid` int(11) NOT NULL,
  PRIMARY KEY (`bestellid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `bestellung` VALUES (1,'2016-05-16',1119),(2,'2016-05-20',1117),(3,'2016-05-23',1122),(4,'2016-05-25',1111),(5,'2016-05-29',1126),(6,'2016-06-01',1115),(7,'2016-06-06',1124),(8,'2016-06-11',1125),(9,'2016-06-18',1113),(10,'2016-06-30',1117);

--
-- Table structure for table `posten`
--

DROP TABLE IF EXISTS `posten`;

CREATE TABLE `posten` (
  `bestellid` int(11) NOT NULL,
  `artikelid` int(11) NOT NULL,
  `anzahl` int(11) DEFAULT NULL,
  `groesse` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `posten` VALUES (1,134458,1,'40'),(1,134465,1,'M'),(2,134467,1,'M'),(3,134475,2,'L'),(3,134485,1,'UNI'),(3,134491,2,'L'),(4,134481,2,'M'),(4,134483,3,'UNI'),(5,134463,1,'41'),(6,134468,1,'XL'),(7,134458,1,'38'),(7,134465,1,'L'),(7,134468,2,'S'),(8,134487,2,'S'),(9,134479,1,'M'),(9,134490,2,'XXL'),(10,134460,1,'42');


-- ADD FOREIGN KEY Table kunde --
ALTER TABLE kunde
ADD FOREIGN KEY (plzid) REFERENCES ort(plzid),
ADD FOREIGN KEY (bic) REFERENCES bank(bic);

-- ADD FOREIGN KEY Table bestellung --
ALTER TABLE bestellung
ADD FOREIGN KEY (kundeid) REFERENCES kunde(kundeid);

-- ADD FOREIGN KEY Table posten --
ALTER TABLE posten
ADD FOREIGN KEY (bestellid) REFERENCES bestellung(bestellid),
ADD FOREIGN KEY (artikelid) REFERENCES artikel(artikelid);

-- ADD FOREIGN KEY Table artikel --
ALTER TABLE artikel
ADD FOREIGN KEY (kategorieid) REFERENCES kategorie(kategorieid),
ADD FOREIGN KEY (farbid) REFERENCES farbe(farbid);

-- ADD FOREIGN KEY Table mitarbeiter --
ALTER TABLE mitarbeiter
ADD FOREIGN KEY (plzid) REFERENCES ort(plzid);

-- ADD FOREIGN KEY Table bestand --
ALTER TABLE bestand
ADD FOREIGN KEY (artikelid) REFERENCES artikel(artikelid);

-- ADD FOREIGN KEY Table bank
ALTER TABLE bank
ADD FOREIGN KEY(plzid) REFERENCES ort(plzid);

