DROP DATABASE IF EXISTS singletonDB;
CREATE DATABASE IF NOT EXISTS singletonDB;

use singletonDB;

DROP TABLE IF EXISTS abteilung;
CREATE TABLE IF NOT EXISTS abteilung (
	A_ID int PRIMARY KEY auto_increment,
    A_Bezeichnung char(30)
);

DROP TABLE IF EXISTS projekt;
CREATE TABLE IF NOT EXISTS projekt (
	P_ID int PRIMARY KEY auto_increment,
    P_Bezeichnung char(30)
);

DROP TABLE IF EXISTS mitarbeiter;
CREATE TABLE IF NOT EXISTS mitarbeiter (
	M_ID int PRIMARY KEY auto_increment,
    Nachname char(30),
    Vorname char(30),
    A_ID INT,
    FOREIGN KEY (A_ID) REFERENCES abteilung(A_ID)
);

DROP TABLE IF EXISTS projekt_mitarbeiter;
CREATE TABLE IF NOT EXISTS projekt_mitarbeiter (
    M_ID INT,
    P_ID INT,
    Eintritt DATE,
    Austritt DATE,
    PRIMARY KEY (M_ID,P_ID),
    FOREIGN KEY (M_ID) REFERENCES mitarbeiter(M_ID),
    FOREIGN KEY (P_ID) REFERENCES projekt(P_ID)
);

INSERT INTO abteilung VALUES(1,'IT'),(2,'Marketing'),(3,'Support');
INSERT INTO projekt VALUES(1,'Lightspeed'),(2,'Venus'),(3,'ThatsNoMoon');
INSERT INTO mitarbeiter VALUES(1,'Klein','Brigitte',2),(2,'Schröter','Herbert',1),(3,'Kastner','Charola',3),(4,'Haidner','Klaus',2);
INSERT INTO projekt_mitarbeiter VALUES(1,1,'2022-10-01',NULL),(3,2,'2022-07-01','2022-09-01'),(4,3,'2022-01-01',NULL),(2,2,'2022-03-01','2022-06-01');

SELECT * from mitarbeiter JOIN projekt_mitarbeiter ON mitarbeiter.M_ID = projekt_mitarbeiter.M_ID;