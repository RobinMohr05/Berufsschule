DROP DATABASE IF EXISTS VeranstaltungsBucher;
 
CREATE DATABASE IF NOT EXISTS  VeranstaltungsBucher; # Auch genannt Tournee in Aufgabenblatt 3.1 Aufgabe 2
 
use VeranstaltungsBucher;
 
CREATE TABLE IF NOT EXISTS Preiskategorie (
    PreiskategorieId INT AUTO_INCREMENT PRIMARY KEY,
    Bezeichnung TEXT
);
CREATE TABLE IF NOT EXISTS Künstler (
    KünstlerId INT AUTO_INCREMENT PRIMARY KEY,
    Adresse TEXT,
    KünstlerName TEXT
);
CREATE TABLE IF NOT EXISTS Besucher (
    BesucherId INT AUTO_INCREMENT PRIMARY KEY,
    Email TEXT
);
CREATE TABLE IF NOT EXISTS Location (
    LocationId INT AUTO_INCREMENT PRIMARY KEY,
    LocationName TEXT,
    Anzahl_Plaetze_gesamt INT
);
CREATE TABLE IF NOT EXISTS Tournee (
    TourneeId INT AUTO_INCREMENT PRIMARY KEY,
    Adresse TEXT,
    TourneeName TEXT
);
CREATE TABLE IF NOT EXISTS Veranstaltung (
    VeranstaltungsId INT AUTO_INCREMENT PRIMARY KEY,
    Beginn TEXT,
    Durchführungsdatum TEXT,
    LocationId INT,
    FOREIGN KEY (LocationId)
        REFERENCES Location (LocationId),
    TourneeId INT,
    FOREIGN KEY (TourneeId)
        REFERENCES Tournee (TourneeId)
);
 
CREATE TABLE IF NOT EXISTS Preiskategorie_Veranstaltung(
VeranstaltungsId int, PreiskategorieId int,
PRIMARY KEY (VeranstaltungsId, PreiskategorieId),
Preis INT NOT NULL,
FOREIGN KEY (VeranstaltungsId) REFERENCES Veranstaltung (VeranstaltungsId),
FOREIGN KEY (PreiskategorieId) REFERENCES preiskategorie (PreiskategorieId)
);
CREATE TABLE IF NOT EXISTS Preiskategorie_Location(
LocationId int, PreiskategorieId int,
PRIMARY KEY (LocationId, PreiskategorieId),
FOREIGN KEY (PreiskategorieId) REFERENCES preiskategorie(PreiskategorieId),
FOREIGN KEY (LocationId) REFERENCES location (LocationId)
);
CREATE TABLE IF NOT EXISTS Veranstaltung_Kuenstler (
    KünstlerId INT,
    VeranstaltungsId INT,
    PRIMARY KEY (KünstlerId , VeranstaltungsId),
    FOREIGN KEY (VeranstaltungsId)
        REFERENCES Veranstaltung (VeranstaltungsId),
    FOREIGN KEY (KünstlerId)
        REFERENCES Künstler (KünstlerId),
    Gage VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Veranstaltung_Besucher (
	BesucherId int,
    VeranstaltungsId int,
	PRIMARY KEY (VeranstaltungsId , BesucherId),
    FOREIGN KEY (BesucherId)
        REFERENCES Besucher (BesucherId),
    FOREIGN KEY (VeranstaltungsId)
        REFERENCES Veranstaltung (VeranstaltungsId),
    Sitzplatz INT NOT NULL
);
 
ALTER TABLE tournee MODIFY TourneeName VARCHAR(50); # 3.1 DDL Aufgabe 2 a)
 
ALTER TABLE Veranstaltung_Besucher RENAME TO Veranstaltungsbesucher; # 3.1 DDL Aufgabe 2 b)
ALTER TABLE Preiskategorie_Location RENAME TO Locationpreise; # 3.1 DDL Aufgabe 2 b)
ALTER TABLE Preiskategorie_Veranstaltung RENAME TO Veranstaltungspreise; # 3.1 DDL Aufgabe 2 b)
ALTER TABLE Veranstaltung_Kuenstler RENAME TO Teilnehmende_Kuenstler; # 3.1 DDL Aufgabe 2 b)
 
ALTER TABLE Location DROP Anzahl_Plaetze_gesamt; # 3.1 DDL Aufgabe 2 c)
 
ALTER TABLE Künstler ADD Besonderheiten VARCHAR(100); # 3.1 DDL Aufgabe 2 d)
 
CREATE TABLE IF NOT EXISTS Ort (  # 3.1 DDL Aufgabe 2 e)
    OrtId INT AUTO_INCREMENT PRIMARY KEY,
    PLZ TEXT,
    OrtName TEXT
);
 
ALTER TABLE Location ADD COLUMN OrtId INT, ADD FOREIGN KEY (OrtId) REFERENCES Ort(OrtId);  # 3.1 DDL Aufgabe 2 f)
ALTER TABLE Künstler ADD COLUMN OrtId INT, ADD FOREIGN KEY (OrtId) REFERENCES Ort(OrtId);  # 3.1 DDL Aufgabe 2 f)

update küsntler set KünstlerName = "asdf" where KünstlerId in (1,2,3);
