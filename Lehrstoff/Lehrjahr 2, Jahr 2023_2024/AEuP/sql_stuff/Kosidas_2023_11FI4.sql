CREATE DATABASE IF NOT EXISTS kosidas_2023_11FI4;
use kosidas_2023_11FI4;
CREATE TABLE IF NOT EXISTS Farbe (
    farbId VARCHAR(7),
    Bezeichnung TEXT,
    PRIMARY KEY (farbId)
);
CREATE TABLE IF NOT EXISTS Kategorie (
    kategorieId INT AUTO_INCREMENT,
    bezeichnung VARCHAR(50),
    PRIMARY KEY (kategorieId)
);
CREATE TABLE IF NOT EXISTS Artikel (
    artikelId INT AUTO_INCREMENT,
    bezeichnung TEXT,
    preis DECIMAL(5 , 2 ),
    kategorieId INT,
    farbId VARCHAR(7),
    PRIMARY KEY (artikelId),
    FOREIGN KEY (kategorieId)
        REFERENCES Kategorie (kategorieId),
    FOREIGN KEY (farbId)
        REFERENCES Farbe (farbId)
);
CREATE TABLE IF NOT EXISTS Kunde (
    kundeId INT AUTO_INCREMENT,
    nachname VARCHAR(45),
    vorname VARCHAR(45),
    strasse_Nr VARCHAR(45),
    plzId INT,
    iban VARCHAR(45),
    bic VARCHAR(45),
    PRIMARY KEY (kundeId)
);
ALTER TABLE Kunde
CHANGE strasse_Nr strasse varchar(45);
ALTER TABLE Kunde
ADD hausnummer varchar(6) AFTER strasse;

CREATE TABLE bank (
    bic VARCHAR(11) PRIMARY KEY,
    bank_name VARCHAR(45),
    plzId INT
);
CREATE TABLE ort(plzId int, plz VARCHAR(5),
stadt VARCHAR(45),
PRIMARY KEY (plzId));
ALTER TABLE Kunde
ADD CONSTRAINT fk_bank foreign key (bic) references bank(bic);
ALTER TABLE Kunde
ADD CONSTRAINT fk_plz_kunde foreign key (plzId) references ort(plzId);
alter table bank
add constraint fk_plz_bank foreign key (plzId) references ort(plzId);