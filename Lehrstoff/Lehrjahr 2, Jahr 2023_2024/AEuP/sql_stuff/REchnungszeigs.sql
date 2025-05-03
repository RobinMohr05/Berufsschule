DROP DATABASE IF EXISTS aufgabe2von3_1_6;
CREATE DATABASE IF NOT EXISTS Aufgabe2von3_1_6;
USE Aufgabe2von3_1_6;

CREATE TABLE IF NOT EXISTS Artikel (
    ANr INT PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung TEXT NOT NULL,
    Bestand INT NOT NULL,
    Verkaufspreis_Vorschlag DOUBLE(8 , 2 ) NOT NULL DEFAULT 0.00,
    DatumÄnderungVerkaufspreis TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Kunde (
    KNr INT PRIMARY KEY AUTO_INCREMENT,
    Nachname TEXT NOT NULL,
    Vorname TEXT NOT NULL,
    Straße TEXT NOT NULL,
    Hausnr VARCHAR(5) NOT NULL,
    Plz VARCHAR(5) NOT NULL,
    Ort TEXT NOT NULL,
    TelefonNr TEXT,
    EMail TEXT NOT NULL,
    Kartenstatus TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Rechnung (
    RNr INT PRIMARY KEY AUTO_INCREMENT,
    KNr INT NOT NULL,
    AuftragNr INT NOT NULL,
    Datum TEXT NOT NULL,
    Betrag INT NOT NULL,
    Mahnstatus TEXT NOT NULL,
    Mahngebür DOUBLE(8 , 2 ) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (KNr)
        REFERENCES Kunde (KNr)
);
CREATE TABLE IF NOT EXISTS Lastschrift (
    LNr INT PRIMARY KEY AUTO_INCREMENT,
    KNr INT NOT NULL,
    RNr INT NOT NULL,
    Datum TEXT NOT NULL,
    Betrag DOUBLE(8 , 2 ) NOT NULL DEFAULT 0.00,
    LastschriftText TEXT NOT NULL,
    FOREIGN KEY (KNr)
        REFERENCES Kunde (KNr),
    FOREIGN KEY (RNr)
        REFERENCES Rechnung (RNr)
);
CREATE TABLE IF NOT EXISTS Gutschrift (
    GNr INT PRIMARY KEY AUTO_INCREMENT,
    KNr INT NOT NULL,
    Datum TEXT NOT NULL,
    Betrag DOUBLE(8 , 2 ) NOT NULL DEFAULT 0.00,
    GutschriftText TEXT NOT NULL,
    FOREIGN KEY (KNr)
        REFERENCES Kunde (KNr)
);

CREATE TABLE IF NOT EXISTS Rechnungsposition (
    RNr INT NOT NULL,
    ANr INT NOT NULL,
    PRIMARY KEY (RNr , ANr),
    FOREIGN KEY (RNr)
        REFERENCES Rechnung (RNr),
    FOREIGN KEY (ANr)
        REFERENCES Artikel (ANr),
    Menge INT NOT NULL,
    Einzelpreis DOUBLE(8 , 2 )
);