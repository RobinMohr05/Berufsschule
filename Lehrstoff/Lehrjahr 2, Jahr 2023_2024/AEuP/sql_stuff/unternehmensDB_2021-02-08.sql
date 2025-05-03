-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 08. Feb 2021 um 08:30
-- Server-Version: 10.4.17-MariaDB
-- PHP-Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `unternehmensdb`
--
DROP DATABASE IF EXISTS unternehmensdb;
CREATE DATABASE IF NOT EXISTS `unternehmensdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `unternehmensdb`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `abteilung`
--

CREATE TABLE `abteilung` (
  `ABTEILUNGSNR` int(11) NOT NULL,
  `BEZEICHNUNG` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `abteilung`
--

INSERT INTO `abteilung` (`ABTEILUNGSNR`, `BEZEICHNUNG`) VALUES
(1, 'Geschäftsführung'),
(2, 'Support'),
(3, 'Rechnungswesen'),
(4, 'Einkauf'),
(5, 'Vertrieb'),
(6, 'Verwaltung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `ARTIKELNR` int(11) NOT NULL,
  `BEZEICHNUNG` varchar(50) DEFAULT NULL,
  `HERSTELLER` int(11) DEFAULT NULL,
  `NETTOPREIS` decimal(10,2) DEFAULT NULL,
  `MWST` int(11) DEFAULT NULL,
  `BESTAND` int(11) DEFAULT NULL,
  `MINDESTBESTAND` int(11) DEFAULT NULL,
  `KATEGORIE` int(11) DEFAULT NULL,
  `BESTELLVORSCHLAG` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`ARTIKELNR`, `BEZEICHNUNG`, `HERSTELLER`, `NETTOPREIS`, `MWST`, `BESTAND`, `MINDESTBESTAND`, `KATEGORIE`, `BESTELLVORSCHLAG`) VALUES
(1, '106075', 1, '137.93', 2, 100, 10, 1, '1'),
(2, '106055', 1, '172.14', 2, 100, 10, 1, '1'),
(3, '753S', 2, '111.21', 2, 100, 10, 1, '1'),
(4, '757P', 2, '145.69', 2, 100, 10, 1, '1'),
(5, '1200NF', 2, '602.59', 2, 100, 10, 1, '0'),
(6, 'CanoScan LiDE 20', 7, '47.41', 2, 100, 10, 2, '1'),
(7, 'CanoScan 5000F', 7, '132.76', 2, 100, 10, 2, '0'),
(8, 'Perfection1670', 8, '81.03', 2, 100, 10, 2, '0'),
(9, 'ScanJet 2400', 4, '63.79', 2, 100, 10, 2, '1'),
(10, 'ScanJet 8290', 4, '1507.76', 2, 100, 10, 2, '1'),
(11, 'Millenium G450', 5, '81.03', 2, 100, 10, 3, '0'),
(12, 'Millenium G550', 5, '85.34', 2, 100, 10, 3, '0'),
(13, 'Millenium G650', 5, '137.07', 2, 100, 10, 3, '1'),
(14, 'Millenium P750', 5, '197.41', 2, 5, 10, 3, '1'),
(15, 'Parhelia 512', 5, '309.48', 2, 100, 10, 3, '1'),
(16, 'SV0802N', 2, '55.17', 2, 100, 10, 4, '1'),
(17, 'SP0802N', 2, '63.79', 2, 100, 10, 4, '0'),
(18, 'SV1203N', 2, '72.41', 2, 100, 10, 4, '1'),
(19, 'SP1604N', 2, '93.97', 2, 100, 10, 4, '1'),
(20, 'MHT2060AH', 9, '197.41', 2, 100, 10, 4, '0'),
(21, 'Aureon 5.1 Fun', 6, '33.62', 2, 100, 10, 5, '1'),
(22, 'Aureon 5.1 Fun Games', 6, '42.24', 2, 100, 10, 5, '1'),
(23, 'Aureon 5.1 Sky', 6, '68.10', 2, 100, 10, 5, '1'),
(24, 'Aureon 5.1 USB', 6, '85.34', 2, 100, 10, 5, '0'),
(25, 'Aureon 5.1 Universe', 6, '206.03', 2, 100, 10, 5, '0'),
(26, 'Internet Keyboard', 10, '17.23', 2, 100, 10, 6, '0'),
(27, 'Office Keyboard', 10, '25.85', 2, 100, 10, 6, '1'),
(28, 'Natural MultiMedia', 10, '23.28', 2, 100, 10, 6, '1'),
(29, 'MultiMedia Keyboard refresh', 10, '27.59', 2, 100, 10, 6, '0'),
(30, 'WL Optical Desctop for Bluetooth', 10, '128.45', 2, 100, 10, 6, '1'),
(31, 'DeskJet 3520', 4, '33.62', 2, 100, 10, 7, '1'),
(32, 'OfficeJet 7140xi', 4, '539.97', 2, 100, 10, 7, '0'),
(33, 'LaserJet 1150', 4, '240.51', 2, 100, 10, 7, '1'),
(34, 'i250', 7, '46.55', 2, 100, 10, 7, '1'),
(35, 'BJC-5500', 7, '645.69', 2, 100, 10, 7, '0'),
(36, 'Stylus C44 Plus', 8, '46.55', 2, 100, 10, 7, '0'),
(37, 'Stylus Photo R300', 8, '150.00', 2, 100, 10, 7, '1'),
(38, 'Basic Optical Mouse SB', 10, '12.07', 2, 100, 10, 10, '1'),
(39, 'Mouse Blue', 10, '25.00', 2, 100, 10, 10, '1'),
(40, 'Wireless InteliMouse Explorer BT', 10, '72.41', 2, 100, 10, 10, '0'),
(41, 'Windows 2000 Professional', 10, '124.14', 2, 100, 10, 8, '0'),
(42, 'Windows XP Home Edition', 10, '101.97', 2, 100, 10, 8, '1'),
(43, 'Office XP Pro', 10, '516.38', 2, 100, 10, 8, '1'),
(44, 'Visual Studio.NET 2003', 10, '1766.38', 2, 100, 10, 8, '1'),
(45, 'Works Suite 2004', 10, '93.97', 2, 100, 10, 8, '1'),
(46, 'SC-152A', 2, '13.79', 2, 100, 10, 9, '1'),
(47, 'SW252', 2, '33.62', 2, 100, 10, 9, '0'),
(48, 'SM-352', 2, '59.48', 2, 100, 10, 9, '1'),
(49, 'SD-616', 2, '25.00', 2, 100, 10, 9, '1'),
(50, 'SC-152A schwarz', 2, '14.66', 2, 100, 10, 9, '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `BESTELLNR` int(11) NOT NULL,
  `KUNDENNR` int(11) DEFAULT NULL,
  `BESTELLDATUM` date DEFAULT NULL,
  `LIEFERDATUM` date DEFAULT NULL,
  `RECHNUNGSBETRAG` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`BESTELLNR`, `KUNDENNR`, `BESTELLDATUM`, `LIEFERDATUM`, `RECHNUNGSBETRAG`) VALUES
(1, 1, '2001-02-20', '2001-11-20', '359.68'),
(2, 2, '2001-02-20', '2001-11-20', '107.99'),
(3, 3, '2001-02-20', '2001-11-20', '322.99'),
(4, 4, '2001-02-20', '2001-11-20', '109.00'),
(5, 5, '2001-02-20', '2001-11-20', '109.00'),
(6, 6, '2001-02-20', '2001-11-20', '31.99'),
(7, 7, '2001-02-20', '2001-11-20', '267.99'),
(8, 8, '2001-02-20', '2001-11-20', '98.99'),
(9, 9, '2001-02-20', '2001-11-20', '29.00'),
(10, 10, '2001-02-20', '2001-11-20', '388.00'),
(11, 11, '2001-02-20', '2001-11-20', '229.00'),
(12, 12, '2001-02-20', '2001-11-20', '54.00'),
(13, 13, '2001-02-20', '2001-11-20', '173.00'),
(14, 14, '2001-02-20', '2001-11-20', '164.99'),
(15, 15, '2001-02-20', '2001-11-20', '54.00'),
(16, 16, '2001-02-20', '2001-11-20', '156.00'),
(17, 17, '2001-02-20', '2001-11-20', '54.00'),
(18, 18, '2001-02-20', '2001-11-20', '54.00'),
(19, 19, '2001-02-20', '2001-11-20', '144.00'),
(20, 20, '2001-02-20', '2001-11-20', '74.00'),
(21, 21, '2001-02-20', '2001-11-20', '599.05'),
(22, 22, '2001-02-20', '2001-11-20', '109.01'),
(23, 23, '2001-02-20', '2001-11-20', '626.37'),
(24, 24, '2001-02-20', '2001-11-20', '457.99'),
(25, 25, '2001-02-20', '2001-11-20', '27.00'),
(26, 9, '2001-02-20', '2001-11-20', '171.99'),
(27, 26, '2001-02-20', '2001-11-20', '54.00'),
(28, 27, '2001-02-20', '2001-11-20', '84.00'),
(29, 28, '2001-02-20', '2001-11-20', '797.99'),
(30, 29, '2001-02-20', '2001-11-20', '81.01'),
(31, 30, '2001-02-20', '2001-11-20', '359.00'),
(32, 31, '2001-02-20', '2001-11-20', '84.00'),
(33, 15, '2001-02-20', '2001-11-20', '28.00'),
(34, 32, '2001-02-20', '2001-11-20', '169.00'),
(35, 33, '2001-02-20', '2001-11-20', '239.00'),
(36, 4, '2001-02-20', '2001-11-20', '736.36'),
(37, 34, '2001-02-20', '2001-11-20', '109.01'),
(38, 35, '2001-02-20', '2001-11-20', '118.29'),
(39, 36, '2001-02-20', '2001-11-20', '148.99'),
(40, 37, '2001-02-20', '2001-11-20', '74.00'),
(41, 38, '2001-02-20', '2001-11-20', '188.00'),
(42, 39, '2001-02-20', '2001-11-20', '59.97'),
(43, 40, '2001-02-20', '2001-11-20', '84.00'),
(44, 41, '2001-02-20', '2001-11-20', '98.99'),
(45, 42, '2001-02-20', '2001-11-20', '154.00'),
(46, 23, '2001-02-20', '2001-11-20', '14.00'),
(47, 43, '2001-02-20', '2001-11-20', '39.00'),
(48, 44, '2001-02-20', '2001-11-20', '0.00'),
(49, 45, '2001-02-20', '2001-11-20', '626.37'),
(50, 46, '2001-02-20', '2001-11-20', '127.99'),
(51, 47, '2001-02-20', '2001-11-20', '198.00'),
(52, 7, '2001-02-20', '2001-11-20', '81.01'),
(53, 48, '2001-02-20', '2001-11-20', '54.00'),
(54, 49, '2001-02-20', '2001-11-20', '144.00'),
(55, 50, '2001-02-20', '2001-11-20', '457.99'),
(56, 51, '2001-02-20', '2001-11-20', '32.00'),
(57, 42, '2001-02-20', '2001-11-20', '160.00'),
(58, 52, '2001-02-20', '2001-11-20', '84.00'),
(59, 53, '2001-02-20', '2001-11-20', '1252.73'),
(60, 54, '2001-02-20', '2001-11-20', '98.99'),
(61, 55, '2001-02-20', '2001-11-20', '258.01'),
(62, 56, '2001-02-20', '2001-11-20', '201.99'),
(63, 57, '2001-02-20', '2001-11-20', '169.00'),
(64, 58, '2001-02-20', '2001-11-20', '397.28'),
(65, 2, '2001-02-20', '2001-11-20', '3798.00'),
(66, 59, '2001-02-20', '2001-11-20', '131.98'),
(67, 60, '2001-02-20', '2001-11-20', '308.98'),
(68, 29, '2001-02-20', '2001-11-20', '159.00'),
(69, 61, '2001-02-20', '2001-11-20', '462.00'),
(70, 62, '2001-02-20', '2001-11-20', '150.00'),
(71, 36, '2001-02-20', '2001-11-20', '82.00'),
(72, 63, '2001-02-20', '2001-11-20', '4235.97'),
(73, 64, '2001-02-20', '2001-11-20', '768.00'),
(74, 17, '2001-02-20', '2001-11-20', '2442.26'),
(75, 43, '2001-02-20', '2001-11-20', '1506.26'),
(76, 65, '2001-02-20', '2001-11-20', '1429.38'),
(77, 66, '2001-02-20', '2001-11-20', '1699.98'),
(78, 67, '2001-02-20', '2001-11-20', '839.99'),
(79, 68, '2001-02-20', '2001-11-20', '198.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hersteller`
--

CREATE TABLE `hersteller` (
  `HERSTELLERNR` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `hersteller`
--

INSERT INTO `hersteller` (`HERSTELLERNR`, `NAME`) VALUES
(1, 'Belinea'),
(2, 'Samsung'),
(3, 'Sony'),
(4, 'HP'),
(5, 'Matrox'),
(6, 'Terratec'),
(7, 'Canon'),
(8, 'Epson'),
(9, 'Fujitsu'),
(10, 'Microsoft'),
(11, 'Asus'),
(12, 'Acer'),
(13, 'Dell');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jobticket`
--

CREATE TABLE `jobticket` (
  `ID` int(11) NOT NULL,
  `BESTELLNR` int(11) DEFAULT NULL,
  `MITARBEITERNR` int(11) DEFAULT NULL,
  `GUELTIG_BIS` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `jobticket`
--

INSERT INTO `jobticket` (`ID`, `BESTELLNR`, `MITARBEITERNR`, `GUELTIG_BIS`) VALUES
(1, 1, 1, '2001-01-20'),
(2, 1, 1, '2001-01-20'),
(3, 4, 2, '2001-01-23'),
(4, 6, 2, '2001-01-23'),
(5, 6, 2, '2001-01-25'),
(6, 7, 3, '2001-02-03');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `KATEGORIENR` int(11) NOT NULL,
  `BEZEICHNUNG` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`KATEGORIENR`, `BEZEICHNUNG`) VALUES
(1, 'Monitore'),
(2, 'Scanner'),
(3, 'Grafikkarten'),
(4, 'Festplatten'),
(5, 'Soundkarten'),
(6, 'Keyboards'),
(7, 'Drucker'),
(8, 'Software'),
(9, 'Laufwerke'),
(10, 'Mäuse'),
(11, '3,5-Zoll-Disketten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `KUNDENNR` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `VORNAME` varchar(50) DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `PLZ` char(14) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `TELEFON_GESCH` varchar(25) DEFAULT NULL,
  `TELEFON_PRIVAT` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `ZAHLUNGSART` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`KUNDENNR`, `NAME`, `VORNAME`, `STRASSE`, `PLZ`, `ORT`, `TELEFON_GESCH`, `TELEFON_PRIVAT`, `EMAIL`, `ZAHLUNGSART`) VALUES
(1, 'Loewe', 'Arthur', 'Sebastianstraße 134', '50737', 'Köln', NULL, '19467383', NULL, 'B'),
(2, 'Adler', 'Felix', 'Goethestraße 4', '30453', 'Hannover', '9856023452', '10562382', 'adler@on-line.de', 'R'),
(3, 'Stein', 'Johannes', 'Elisabethenstr. 23', '53111', 'Bonn', '99746227', '99746228', 'johnny@hip.de', 'N'),
(4, 'Falkner', 'Michael', 'Querfeldstraße 21', '65187', 'Wiesbaden', '13726583', '48892768', 'mischa24@wysiwyg.com', 'V'),
(5, 'Lederer', 'Helene', 'Rennbahnstraße 6', '50733', 'Köln', '87126534', '32675491', 'lele@lederer-world.de', 'K'),
(6, 'Kogen', 'Arnold', 'Clara-Viebig-Straße 17', '53179', 'Bonn', NULL, '55819269', NULL, 'B'),
(7, 'Schneider', 'Benedikt', 'Vahrendorfer Stadtweg 61', '21075', 'Hamburg', NULL, '93728815', 'benni@postfach-online.de', 'B'),
(8, 'Dietrich', 'Diana', 'Kastanienallee 675', '65199', 'Wiesbaden', NULL, '56112894', 'diedietrich@on-line.de', 'V'),
(9, 'Voglin', 'Jakob', 'Engeldamm 34', '12487', 'Berlin', '999657324', '12432673', 'voglin@berliner-tagblatt.de', 'K'),
(10, 'Stern', 'Martin', 'Knaufstraße 453', '50858', 'Köln', '72891174', '17582964', 'martin.stern@on-line.de', 'B'),
(11, 'Marsch', 'Ronald', 'Große Telegraphenstraße 95', '50769', 'Köln', '16547326', '99234713', 'ronnie@on-line.de', 'B'),
(12, 'Fromkess', 'Leon', 'Schmittgasser Kirchweg 44', '53129', 'Bonn', '67346248', '19684375', 'leon.fromkess@lola.com', 'R'),
(13, 'Badel', 'Sarah', 'Am Ginsterpfad 74', '51147', 'Köln', '17483763', '82675271', 's.badel@on-line.de', 'R'),
(14, 'Schäfer', 'Willi', 'Bei der blauen Brücke 119', '22083', 'Hamburg', '02857204', '86756251', 'schaefer32@lola.com', 'R'),
(15, 'Front', 'Jeremias', 'Reichskanzlerstraße 71', '22525', 'Hamburg', '5685710', '86957248', 'jerry@gartenlaubenfreunde.de', 'B'),
(16, 'Wilhelms', 'Simon', 'Gustav-Freytag-Straße 22', '51069', 'Köln', '19785737', '98760438', NULL, 'N'),
(17, 'Grunpeter', 'Sascha', 'Pascalstraße 64', '52121', 'Bonn', '918574736', '11768462', 'sagrun@lola.com', 'R'),
(18, 'Marx', 'Alfred', 'Gabriele-Muenter-Straße 102', '51371', 'Leverkusen', '02759285', '849647286', 'alfred_marx@on-line.de', 'R'),
(19, 'Kops', 'Bernhard', 'Gunther-Plüschow-Straße 47', '50739', 'Köln', '10675849', '61969285', 'berniekops@lola.com', 'B'),
(20, 'Elson', 'Andrea', 'Herzog-Alf-Weg 13', '20459', 'Hamburg', '28795823', '967584483', 'elson@elsons-laedchen.de', 'R'),
(21, 'Kaplan', 'Marvin', 'Oskar-Schlemmer-Straße 72', '50933', 'Köln', NULL, '96857385', 'marvin@marc-aurel-jg-2001.de', 'K'),
(22, 'Glaister', 'Gabrielle', 'Simrockallee 2', '53227', 'Bonn', '97857358', '304760583', 'gabyglaister@on-line.de', 'N'),
(23, 'Knutt', 'Robert', 'Metzgerstraße 81', '52076', 'Aachen', '29786682', '10684937', 'robert@robert-knutt.de', 'B'),
(24, 'Reiner', 'Robert', 'Pattscheider Weg 7', '51147', 'Köln', '19587238', '017589375', 'meathead@lola.com', 'B'),
(25, 'Grunert', 'Paul', 'Jütländer Allee 236', '22415', 'Hamburg', '19473825', '47294978', 'paul@briefmarken-hamburg.de', 'R'),
(26, 'Free', 'Oliver', 'Pferdmengesstraße 58', '50672', 'Köln', '19473067', '94728395', 'ollifree@fc-koelle-for-ever.de', 'K'),
(27, 'Frankau', 'Nicholas', 'Rennbahnstraße 83', '65207', 'Wiesbaden', '10264738', '91650376', 'nick.frank@on-line.de', 'R'),
(28, 'Weinberger', 'Eduard', 'Modersohnstraße 112', '10965', 'Berlin', '57480399', '10275748', 'weinberger@lola.com', 'K'),
(29, 'Mann', 'Miriam', 'Wielandplatz 8', '99425', 'Weimar', '19786854', '19786743', 'miriam-mann@on-line.de', 'N'),
(30, 'Waring', 'Georg', 'Merkenicher Ringstraße 313', '51103', 'Köln', '01896748', '71835738', 'waring@polstermoebel-schmidt.de', 'R'),
(31, 'Locke', 'Albert', 'Bundesgrenzschutzplatz 32', '53177', 'Bonn', '47382765', '19684758', 'Bertie@Wooster.de', 'K'),
(32, 'Mills', 'Michael', 'Im Grund 4', '51063', 'Köln', '86758685', '10894519', 'michael@mills-and-more.de', 'R'),
(33, 'Brisebois', 'Danielle', 'Bismarckstraße 9', '53721', 'Siegburg', '91856748', '27685710', 'danielle@tricatel.fr', 'R'),
(34, 'Dorning', 'Robert', 'Hunnebeckweg 21', '48147', 'Münster', '57483910', '153424352', 'dorne@hip.de', 'N'),
(35, 'Sperber', 'Milo', 'Zypressenweg 3', '22457', 'Hamburg', '67582978', '564736540', 'milo@lola.com', 'B'),
(36, 'Fabrizi', 'Mario', 'Auf dem Hunnenrücken 19', '50999', 'Köln', '142398079', '09978699', 'mario.fabrizi@on-line.de', 'K'),
(37, 'Anderson', 'Margarete', 'Machabäerstraße 34', '50735', 'Köln', '27685741', '09987890', 'gretel.anderson@on-line.de', 'V'),
(38, 'May', 'Jakob', 'In der Dasladen 9', '51373', 'Leverkusen', '197869504', '19785673', 'mayday@pc-helfer-leverkusen.de', 'N'),
(39, 'Palk', 'Anna', 'Winston-Churchill-Straße 80', '53129', 'Bonn', '197867513', '154635241', 'anpal@on-line.de', 'R'),
(40, 'Kaufmann', 'Andreas', 'Am Alten Brauhaus 11', '51105', 'Köln', '0796835460', '01758362', 'andy@koelner-taxis.de', 'V'),
(41, 'Bussell', 'Mark', 'Hanfgartenstraße 63', '81475', 'München', '473829201', '13246359', 'bussell@bavaria-bank.de', 'R'),
(42, 'Clement', 'Richard', 'Fröbelstraße 26', '12161', 'Berlin', NULL, '57297867', 'clem@on-line.de', 'B'),
(43, 'Handl', 'Irene', 'Berberitzenweg 7', '50678', 'Köln', '84736291', '98675842', 'irenehandl@lola.com', 'R'),
(44, 'Landesberg', 'Stefan', 'Kleiner Griechenmarkt 19', '51107', 'Köln', '08978569', '186759472', 'Steve@metal-rules.de', 'N'),
(45, 'Lenhart', 'Heidi', 'Mozartstraße 73', '51371', 'Leverkusen', '19705832', '879685740', 'heidi@montana-dreaming.de', 'R'),
(46, 'Wendt', 'Georg', 'Froschkönigweg 32', '50767', 'Köln', '23142312', '06905964', 'Georg@on-line.de', 'R'),
(47, 'Masur', 'Richard', 'Up den Wiemen 46', '22609', 'Hamburg', '29671323', '29685749', 'masur@on-line.de', 'R'),
(48, 'Gross', 'Michael', 'Neptunstraße 33', '12621', 'Berlin', '37685940', '197867580', 'm.gross@lola.com', 'B'),
(49, 'Hirsch', 'Andreas', 'Waidmarkt 16', '50735', 'Köln', '19783060', '57483657', 'andreas.hirsch@on-line.de', 'N'),
(50, 'Hecht', 'Jessica', 'Im Teich 42', '51105', 'Köln', '26453756', '98786029', 'jessie.hecht@lola.com', 'R'),
(51, 'Kaminski', 'Melvin', 'Neue ABC-Straße 504', '22607', 'Hamburg', '97860169', '57192060', 'mel@bancroft-and-brooks.com', 'B'),
(52, 'Schäfer', 'Natalie', 'Mittelstraße 50', '53225', 'Bonn', '58672901', '91254341', 'nati@on-line.de', 'N'),
(53, 'Persky', 'Lisa', 'Keplerstraße 48', '40489', 'Düsseldorf', '19562109', '38295647', 'lisa.persky@kunsthaus-persky.de', 'N'),
(54, 'Steuer', 'Paul', 'Langweidenstraße 67', '60386', 'Frankfurt Main', '01867493', '19887960', 'paul.steuer@on-line.de', 'R'),
(55, 'Karn', 'Richard', 'Jan-Wellem-Straße 34', '50668', 'Köln', '97860927', '37681936', 'karn.koeln@on-line.de', 'V'),
(56, 'Barron', 'Marion', 'Im Fuldchen 7', '60435', 'Frankfurt Main', '13241735', '91703275', 'barron.marion@lola.com', 'B'),
(57, 'Mull', 'Martin', 'Rautendeleinweg 29', '40593', 'Düsseldorf', '10923874', '57463524', 'mamu@on-line.de', 'N'),
(58, 'Kay', 'Sylvia', 'Gutzkowstraße 58', '21079', 'Hamburg', '95847772', '17584637', 'kay@web-postfaecher.de', 'R'),
(59, 'Singer', 'Alex', 'Neumoorstück 15', '20459', 'Hamburg', '96857682', '19685733', 'alex@lola.com', 'N'),
(60, 'Zagorsky', 'Annette', 'Isarstraße 75', '30559', 'Hannover', '286957483', '10395738', 'annette@zagorsky-verlag-und-druck.de', 'R'),
(61, 'Hecht', 'Gina', 'Schulgasse 28', '65207', 'Wiesbaden', '195748372', '83746293', 'gina.hecht@on-line.de', 'R'),
(62, 'Penner', 'Jonathan', 'Von-Lapp-Straße 66', '53125', 'Bonn', '17581253', '28547639', 'penner@lola.com', 'B'),
(63, 'Kampmann', 'Stefan', 'Gustav-Mahler-Straße 64', '50733', 'Köln', '19463827', '12647366', 'kampmann@computer-kampmann.de', 'R'),
(64, 'Rasche', 'David', 'Boxgraben 9', '52078', 'Aachen', '18675943', '19574838', 'dave@com-cafe.de', 'N'),
(65, 'Wolf', 'Susanne', 'Veilchenstieg 26', '22297', 'Hamburg', '96857486', '768574676', 'susi.wolf@on-line.de', 'R'),
(66, 'Barber', 'Paul', 'Mühlenweg 19', '10405', 'Berlin', NULL, '46375483', NULL, 'R'),
(67, 'Martin', 'Melanie', 'Löwengasse 17', '51105', 'Köln', '57465748', '97867586', 'melanie.martin@on-line.de', 'R'),
(68, 'Lukas', 'Karl', 'Max-Hartig-Weg 20', '60386', 'Frankfurt Main', '91657438', '35462817', 'k.lukas@lola.com', 'N'),
(69, 'Zucker', 'David', 'Abbestraße 38', '09114', 'Chemnitz', '97860231', '16453271', 'd.zucker@zucker-suess.de', 'R'),
(70, 'Sim', 'Gerald', 'Lobositzstraße 63', '51103', 'Köln', '57463892', '18675290', 'gerald.s@on-line.de', 'R'),
(71, 'Arnold', 'Thomas', 'Industriestraße 543', '21109', 'Hamburg', '18796851', '57481503', 'tom@mayim-bialik-fans.de', 'B'),
(72, 'Hart', 'Melissa', 'Gurkenweg 4', '30655', 'Hannover', '94768592', '37685749', 'lisa.hart@lola.com', 'R'),
(73, 'Ure', 'Gudrun', 'Lochumer Weg 23', '50668', 'Köln', NULL, '28675942', 'gudrun.ure@on-line.de', 'N'),
(74, 'Anwar', 'Mina', 'Putzdelle 86', '51379', 'Leverkusen', '19675849', '16574638', 'm.anwar@on-line.de', 'N'),
(75, 'Kerr', 'Annette', 'Brander Heide 37', '52066', 'Aachen', '19786758', '97867592', 'anette.kerr@modehaus-kerr-aachen.de', 'R'),
(76, 'Lembeck', 'Helene', 'Fuldaer Straße 73', '60486', 'Frankfurt Main', '67581930', '19786024', 'lele39@on-line.de', 'V'),
(77, 'Fleischer', 'Karl', 'Kriemhildstraße 38', '21109', 'Hamburg', '18695783', '97867261', 'fleischer@web-postfaecher.de', 'R'),
(78, 'Kaufmann', 'Andreas', 'Fabriciusstieg 47', '20257', 'Hamburg', '96847392', '53427164', 'andreas.kaufmann@zmuda.de', 'K'),
(79, 'Eles', 'Sandor', 'Diedenhofer Straße 63', '22419', 'Hamburg', '98362781', '87926715', 'sandor.eles@on-line.de', 'R'),
(80, 'Voland', 'Herbert', 'Düsseldorfer Straße 90', '50939', 'Köln', '86932710', '83756493', 'herbert.voland@on-line.de', 'R'),
(81, 'Stoller', 'Alfred', 'Voltastraße 53', '60388', 'Frankfurt Main', '00418673', '65884192', 'alfi.stoller@lola.com', 'N'),
(82, 'Martin', 'Georg', 'Hermesgasse 17', '51145', 'Köln', '29675813', '16475855', 'g.martin@web-postfaecher.de', 'B'),
(83, 'Durdan', 'Richard', 'Görlitzer Straße 41', '60313', 'Frankfurt Main', '96815376', '27681930', 'dickdurdan@lola.com', 'K'),
(84, 'Bonner', 'Frank', 'Shakespeareplatz 35', '14055', 'Berlin', '36277361', '17564832', 'frank.bonner2@on-line.de', 'R'),
(85, 'Baden-Semper', 'Nina', 'Brookdamm 68', '20457', 'Hamburg', '27564932', '04437193', 'nina@web-postfaecher.de', 'R'),
(86, 'Mandan', 'Robert', 'Kösener Weg 8', '40489', 'Düsseldorf', '56473329', '17564932', 'robert.mandan@on-line.de', 'N'),
(87, 'Fenacolini', 'Anna', 'Josef-Hirn-Platz 4', '50597', 'Stuttgart', '19685493', '57463829', 'anna.fenacolini@stuttgart-uni.de', 'R'),
(88, 'Hordern', 'Michael', 'Schwengelkamp 44', '20255', 'Hamburg', '19685723', '375847650', 'michael.hordern@on-line.de', 'R'),
(89, 'Dane', 'Alexandra', 'Langeler Kreuzweg 92', '51063', 'Köln', '195647382', '95768323', 'xandra@fc-koelle-for-ever.de', 'N'),
(90, 'Scolari', 'Peter', 'Ella-Kay-Straße 85', '13357', 'Berlin', '18574639', '26574619', 'peter.scolari@on-line.de', 'R'),
(91, 'Herbert', 'Philipp', 'Am Pulverhof 52', '22045', 'Hamburg', '28576462', '82868584', 'philipp.herbert@lola.com', 'R'),
(92, 'Kraft', 'Robert', 'Hohenzollernring 103', '14129', 'Berlin', '18463728', '07869237', 'kraft@tierhaus-kraft.de', 'N'),
(93, 'Donner', 'Robert', 'Bebelplatz 12', '51149', 'Köln', '18679684', '37586472', 'donner@donner-und-blitz-medien.de', 'R'),
(94, 'Sadowsky', 'Adam', 'Colmarer Straße 73', '28327', 'Bremen', '96857328', '17564834', 'adam.sadowsky@on-line.de', 'R'),
(95, 'Hartman', 'Philipp', 'Hamburger Hochstraße 19', '22767', 'Hamburg', '29371826', '85647291', 'philipp@radio-bill.de', 'N'),
(96, 'Piekarsky', 'Julia', 'Quinxer Straße 6', '52074', 'Aachen', '28574639', '17685743', 'piekarsky@web-postfaecher.de', 'R'),
(97, 'Eiding', 'Paul', 'Goerdelerstraße 37', '65195', 'Wiesbaden', NULL, '27564832', NULL, 'N'),
(98, 'Ritter', 'Hannes', 'Emschertalstraße 73', '44149', 'Dortmund', '27584637', NULL, 'hannes.ritter@lola.com', 'R'),
(99, 'Adrian', 'Iris', 'Vulkanstraße 46', '50677', 'Köln', '18675943', '27564839', 'iris.adrian@on-line.de', 'N'),
(100, 'Slotky', 'Anna', 'Anita-Ree-Straße 61', '22087', 'Hamburg', '28574635', '29186753', 'slotky@zzzorro.de', 'K');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE `mitarbeiter` (
  `MITARBEITERNR` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `VORNAME` varchar(50) DEFAULT NULL,
  `STRASSE` varchar(50) DEFAULT NULL,
  `PLZ` char(14) DEFAULT NULL,
  `ORT` varchar(50) DEFAULT NULL,
  `GEHALT` decimal(10,2) DEFAULT NULL,
  `ABTEILUNG` int(11) DEFAULT NULL,
  `TELEFONNUMMER` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `EINTRITTSDATUM` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`MITARBEITERNR`, `NAME`, `VORNAME`, `STRASSE`, `PLZ`, `ORT`, `GEHALT`, `ABTEILUNG`, `TELEFONNUMMER`, `EMAIL`, `EINTRITTSDATUM`) VALUES
(1, 'Ross', 'Hagen', 'Hauptstraße 67', '53123', 'Bonn', '7500.00', 1, '43567890', 'hagen.ross@beispielfirma.de', '1986-01-01'),
(2, 'Roberts', 'Patrick', 'Schillerstraße 154', '53229', 'Bonn', '7000.00', 1, '98761462', 'p.roberts@beispielfirma.de', '1986-01-01'),
(3, 'Hummer', 'Stefan', 'Sonnenhag 74', '53175', 'Bonn', '7000.00', 1, '98120421', 'stefanhummer@beispielfirma.de', '1986-01-01'),
(4, 'Gerhard', 'David', 'Nibelungenstraße 21', '52115', 'Bonn', '2500.00', 2, '67294738', 'dave.g@beispielfirma.de', '1986-01-01'),
(5, 'Weinert', 'Eduard', 'Quellenweg 57', '53177', 'Bonn', '2000.00', 2, '78646193', 'eduard.weinert@beispielfirma.de', '1986-01-01'),
(6, 'Michaels', 'Connie', 'Benedek Straße 5', '53756', 'St. Augustin', '2500.00', 3, '12345655', 'connie.michaels@beispielfirma.de', '1986-01-01'),
(7, 'Osser', 'Bernd', 'Usambaraweg 28', '50732', 'Köln', '2200.00', 3, '27913020', 'b.osser@beispielfirma.de', '1986-01-01'),
(8, 'Koppes', 'Karin', 'Kopenhagener Straße 34', '53177', 'Bonn', '2400.00', 4, '98766754', 'karin.koppes@beispielfirma.de', '1986-01-01'),
(9, 'Wilding', 'Alexander', 'Sedanstraße 172', '53229', 'Bonn', '2300.00', 4, '28652947', 'alex.wilding@beispielfirma.de', '1986-01-01'),
(10, 'Schmidt', 'Peter', 'Konrad-Adenauer-Straße 49', '50997', 'Köln', '2500.00', 5, '68371020', 'p.schmidt@beispielfirma.de', '1986-01-01'),
(11, 'Müller', 'Ole', 'Lutherstraße 4', '50823', 'Köln', '2600.00', 5, '682037741', 'o.mueller@beispielfirma.de', '1986-01-01'),
(12, 'Meier', 'Wilhelm', 'Römerstraße 53', '53229', 'Bonn', '2400.00', 5, '91821573', 'willi.meier@beispielfirma.de', '1986-01-01'),
(13, 'Schiff', 'Martin', 'Truchseßstraße 74', '53127', 'Bonn', '2500.00', 5, '65744583', 'martin.schiff@beispielfirma.de', '1986-01-01'),
(14, 'Lehne', 'Luise', 'Lyngsbergstraße 93', '53113', 'Bonn', '2000.00', 6, '12341756', 'luise.lehne@beispielfirma.de', '1986-01-01'),
(15, 'Remsen', 'Kevin', 'Nonnenstrombergstraße 22', '50672', 'Köln', '1800.00', 6, '94128882', 'kevin.remsen@beispielfirma.de', '1986-01-01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mwstsatz`
--

CREATE TABLE `mwstsatz` (
  `MWSTNR` int(11) NOT NULL,
  `PROZENT` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mwstsatz`
--

INSERT INTO `mwstsatz` (`MWSTNR`, `PROZENT`) VALUES
(1, '7.00'),
(2, '19.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `posten`
--

CREATE TABLE `posten` (
  `BESTELLNR` int(11) NOT NULL,
  `ARTIKELNR` int(11) NOT NULL,
  `BESTELLMENGE` int(11) DEFAULT NULL,
  `LIEFERMENGE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `posten`
--

INSERT INTO `posten` (`BESTELLNR`, `ARTIKELNR`, `BESTELLMENGE`, `LIEFERMENGE`) VALUES
(1, 1, 1, 1),
(1, 2, 1, 1),
(2, 34, 2, 2),
(3, 11, 1, 1),
(3, 20, 1, 1),
(4, 45, 1, 1),
(5, 19, 1, 1),
(6, 46, 2, 2),
(7, 8, 1, 1),
(7, 37, 1, 1),
(8, 12, 1, 1),
(9, 39, 1, 1),
(10, 25, 1, 1),
(10, 30, 1, 1),
(11, 20, 1, 1),
(12, 36, 1, 1),
(13, 41, 1, 1),
(13, 49, 1, 1),
(14, 6, 3, 3),
(15, 36, 1, 1),
(16, 21, 4, 4),
(17, 34, 1, 1),
(18, 34, 1, 1),
(19, 41, 1, 1),
(20, 17, 1, 1),
(21, 2, 3, 3),
(22, 19, 1, 1),
(23, 32, 1, 1),
(24, 14, 2, 2),
(25, 28, 1, 1),
(26, 8, 1, 1),
(26, 21, 2, 2),
(27, 36, 1, 1),
(28, 40, 1, 1),
(29, 4, 1, 1),
(29, 27, 1, 1),
(29, 43, 1, 1),
(30, 28, 3, 3),
(31, 15, 1, 1),
(32, 18, 1, 1),
(33, 38, 2, 2),
(34, 4, 1, 1),
(35, 25, 1, 1),
(36, 6, 2, 2),
(36, 32, 1, 1),
(37, 19, 1, 1),
(38, 42, 1, 1),
(39, 3, 1, 1),
(39, 26, 1, 1),
(40, 17, 1, 1),
(41, 23, 1, 1),
(41, 45, 1, 1),
(42, 27, 2, 2),
(43, 18, 1, 1),
(44, 24, 1, 1),
(45, 7, 1, 1),
(46, 38, 1, 1),
(47, 21, 1, 1),
(49, 32, 1, 1),
(50, 16, 2, 2),
(51, 13, 1, 1),
(51, 47, 1, 1),
(52, 28, 3, 3),
(53, 34, 1, 1),
(54, 41, 1, 1),
(55, 14, 2, 2),
(56, 29, 1, 1),
(57, 1, 1, 1),
(58, 18, 1, 1),
(59, 32, 2, 2),
(60, 24, 1, 1),
(61, 30, 1, 1),
(61, 45, 1, 1),
(62, 11, 2, 2),
(62, 38, 1, 1),
(63, 4, 1, 1),
(64, 33, 1, 1),
(64, 42, 1, 1),
(65, 10, 1, 1),
(65, 44, 1, 1),
(66, 26, 1, 1),
(66, 36, 1, 1),
(66, 49, 2, 2),
(67, 27, 1, 1),
(67, 33, 1, 1),
(68, 13, 1, 1),
(69, 7, 3, 3),
(70, 18, 1, 1),
(70, 22, 1, 1),
(70, 50, 1, 1),
(71, 6, 1, 1),
(71, 28, 1, 1),
(72, 1, 2, 2),
(72, 6, 4, 4),
(72, 10, 1, 1),
(72, 11, 1, 1),
(72, 12, 2, 2),
(73, 4, 1, 1),
(73, 43, 1, 1),
(74, 3, 1, 1),
(74, 4, 1, 1),
(74, 7, 1, 1),
(74, 9, 1, 1),
(74, 11, 1, 1),
(74, 14, 1, 1),
(74, 17, 1, 1),
(74, 20, 1, 1),
(74, 22, 1, 1),
(74, 26, 1, 1),
(74, 29, 1, 1),
(74, 34, 1, 1),
(74, 37, 1, 1),
(74, 38, 1, 1),
(74, 41, 1, 1),
(74, 42, 1, 1),
(74, 43, 1, 1),
(74, 48, 1, 1),
(74, 50, 1, 1),
(75, 5, 1, 1),
(75, 8, 1, 1),
(75, 13, 1, 1),
(75, 23, 1, 1),
(75, 26, 1, 1),
(75, 33, 1, 1),
(75, 39, 1, 1),
(75, 42, 1, 1),
(75, 49, 1, 1),
(76, 3, 3, 3),
(76, 12, 1, 1),
(76, 24, 1, 1),
(76, 32, 1, 1),
(76, 45, 2, 2),
(77, 46, 10, 10),
(77, 47, 10, 10),
(77, 48, 10, 10),
(77, 49, 10, 10),
(77, 50, 10, 10),
(78, 9, 1, 1),
(78, 16, 1, 1),
(78, 22, 1, 1),
(78, 36, 1, 1),
(78, 43, 1, 1),
(79, 34, 1, 1),
(79, 41, 1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `abteilung`
--
ALTER TABLE `abteilung`
  ADD PRIMARY KEY (`ABTEILUNGSNR`);

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`ARTIKELNR`),
  ADD KEY `HERSTELLER` (`HERSTELLER`),
  ADD KEY `MWST` (`MWST`),
  ADD KEY `KATEGORIE` (`KATEGORIE`);

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`BESTELLNR`),
  ADD KEY `KUNDENNR` (`KUNDENNR`);

--
-- Indizes für die Tabelle `hersteller`
--
ALTER TABLE `hersteller`
  ADD PRIMARY KEY (`HERSTELLERNR`);

--
-- Indizes für die Tabelle `jobticket`
--
ALTER TABLE `jobticket`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MITARBEITERNR` (`MITARBEITERNR`),
  ADD KEY `BESTELLNR` (`BESTELLNR`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`KATEGORIENR`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`KUNDENNR`);

--
-- Indizes für die Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD PRIMARY KEY (`MITARBEITERNR`),
  ADD KEY `ABTEILUNG` (`ABTEILUNG`);

--
-- Indizes für die Tabelle `mwstsatz`
--
ALTER TABLE `mwstsatz`
  ADD PRIMARY KEY (`MWSTNR`);

--
-- Indizes für die Tabelle `posten`
--
ALTER TABLE `posten`
  ADD PRIMARY KEY (`BESTELLNR`,`ARTIKELNR`),
  ADD KEY `ARTIKELNR` (`ARTIKELNR`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `artikel_ibfk_1` FOREIGN KEY (`HERSTELLER`) REFERENCES `hersteller` (`herstellernr`),
  ADD CONSTRAINT `artikel_ibfk_2` FOREIGN KEY (`MWST`) REFERENCES `mwstsatz` (`mwstnr`),
  ADD CONSTRAINT `artikel_ibfk_3` FOREIGN KEY (`KATEGORIE`) REFERENCES `kategorie` (`kategorienr`);

--
-- Constraints der Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD CONSTRAINT `bestellung_ibfk_1` FOREIGN KEY (`KUNDENNR`) REFERENCES `kunde` (`kundennr`);

--
-- Constraints der Tabelle `jobticket`
--
ALTER TABLE `jobticket`
  ADD CONSTRAINT `jobticket_ibfk_1` FOREIGN KEY (`MITARBEITERNR`) REFERENCES `mitarbeiter` (`mitarbeiternr`),
  ADD CONSTRAINT `jobticket_ibfk_2` FOREIGN KEY (`BESTELLNR`) REFERENCES `bestellung` (`BESTELLNR`);

--
-- Constraints der Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD CONSTRAINT `mitarbeiter_ibfk_1` FOREIGN KEY (`ABTEILUNG`) REFERENCES `abteilung` (`ABTEILUNGSNR`);

--
-- Constraints der Tabelle `posten`
--
ALTER TABLE `posten`
  ADD CONSTRAINT `posten_ibfk_1` FOREIGN KEY (`ARTIKELNR`) REFERENCES `artikel` (`ARTIKELNR`),
  ADD CONSTRAINT `posten_ibfk_2` FOREIGN KEY (`BESTELLNR`) REFERENCES `bestellung` (`BESTELLNR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
