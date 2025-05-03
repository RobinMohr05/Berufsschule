use kosidas2;
drop table if exists Kunde;
CREATE TABLE IF NOT EXISTS Kunde (
    KundeId INT(11) PRIMARY KEY AUTO_INCREMENT,
    Nachname VARCHAR(45),
    Vorname VARCHAR(45),
    Straße_NR VARCHAR(45),
    PLZID INT(11),
    IBAN VARCHAR(34),
    BIC VARCHAR(11)
);
Alter table Kunde CHANGE Straße_NR Strasse VARCHAR(45);
ALTER TABLE Kunde ADD Nummer VARCHAR(3) after Strasse;
CREATE TABLE Bank (
    BIC VARCHAR(11) PRIMARY KEY,
    BankName VARCHAR(45),
    PLZID INT
);
CREATE TABLE Ort (
    PLZID INT PRIMARY KEY,
    PLZ VARCHAR(5),
    Stadt VARCHAR(45)
);
ALTER TABLE Kunde add foreign key(PLZID) references Ort(PLZID), add foreign key(BIC) references Bank(BIC);

