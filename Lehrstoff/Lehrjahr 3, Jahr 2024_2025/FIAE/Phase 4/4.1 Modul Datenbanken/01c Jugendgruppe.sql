-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Jugendgruppe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Jugendgruppe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Jugendgruppe` DEFAULT CHARACTER SET utf8 ;
USE `Jugendgruppe` ;

-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Teilnehmer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Teilnehmer` (
  `TeilnehmerID` INT NOT NULL,
  `Nachname` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `StrasseNr` VARCHAR(45) NULL,
  `PLZ` VARCHAR(45) NULL,
  `Ort` VARCHAR(45) NULL,
  `Geburtsdatum` DATE NULL,
  PRIMARY KEY (`TeilnehmerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Betreuer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Betreuer` (
  `BetreuerID` INT NOT NULL,
  `Nachname` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `StrasseNr` VARCHAR(45) NULL,
  `PLZ` VARCHAR(45) NULL,
  `Ort` VARCHAR(45) NULL,
  `Geburtsdatum` DATE NULL,
  PRIMARY KEY (`BetreuerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Kategorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Kategorie` (
  `KategorieID` INT NOT NULL,
  `Bezeichnung` VARCHAR(45) NULL,
  PRIMARY KEY (`KategorieID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Veranstaltung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Veranstaltung` (
  `VeranstaltungID` INT NOT NULL,
  `Bezeichnung` VARCHAR(45) NULL,
  `DatumVon` DATE NULL,
  `DatumBis` DATE NULL,
  `Kategorie_KategorieID` INT NOT NULL,
  PRIMARY KEY (`VeranstaltungID`),
  INDEX `fk_Veranstaltung_Kategorie1_idx` (`Kategorie_KategorieID` ASC) VISIBLE,
  CONSTRAINT `fk_Veranstaltung_Kategorie1`
    FOREIGN KEY (`Kategorie_KategorieID`)
    REFERENCES `Jugendgruppe`.`Kategorie` (`KategorieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Teilnehmer_has_Veranstaltung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Teilnehmer_has_Veranstaltung` (
  `Teilnehmer_TeilnehmerID` INT NOT NULL,
  `Veranstaltung_VeranstaltungID` INT NOT NULL,
  `Einwilligung` TINYINT NULL,
  `Vorkommnisse` TEXT NULL,
  PRIMARY KEY (`Teilnehmer_TeilnehmerID`, `Veranstaltung_VeranstaltungID`),
  INDEX `fk_Teilnehmer_has_Veranstaltung_Veranstaltung1_idx` (`Veranstaltung_VeranstaltungID` ASC) VISIBLE,
  INDEX `fk_Teilnehmer_has_Veranstaltung_Teilnehmer_idx` (`Teilnehmer_TeilnehmerID` ASC) VISIBLE,
  CONSTRAINT `fk_Teilnehmer_has_Veranstaltung_Teilnehmer`
    FOREIGN KEY (`Teilnehmer_TeilnehmerID`)
    REFERENCES `Jugendgruppe`.`Teilnehmer` (`TeilnehmerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teilnehmer_has_Veranstaltung_Veranstaltung1`
    FOREIGN KEY (`Veranstaltung_VeranstaltungID`)
    REFERENCES `Jugendgruppe`.`Veranstaltung` (`VeranstaltungID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Veranstaltung_has_Betreuer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Veranstaltung_has_Betreuer` (
  `Veranstaltung_VeranstaltungID` INT NOT NULL,
  `Betreuer_BetreuerID` INT NOT NULL,
  `Leiter` TINYINT NULL,
  PRIMARY KEY (`Veranstaltung_VeranstaltungID`, `Betreuer_BetreuerID`),
  INDEX `fk_Veranstaltung_has_Betreuer_Betreuer1_idx` (`Betreuer_BetreuerID` ASC) VISIBLE,
  INDEX `fk_Veranstaltung_has_Betreuer_Veranstaltung1_idx` (`Veranstaltung_VeranstaltungID` ASC) VISIBLE,
  CONSTRAINT `fk_Veranstaltung_has_Betreuer_Veranstaltung1`
    FOREIGN KEY (`Veranstaltung_VeranstaltungID`)
    REFERENCES `Jugendgruppe`.`Veranstaltung` (`VeranstaltungID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veranstaltung_has_Betreuer_Betreuer1`
    FOREIGN KEY (`Betreuer_BetreuerID`)
    REFERENCES `Jugendgruppe`.`Betreuer` (`BetreuerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Medizinische Informationen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Medizinische Informationen` (
  `MedInfID` INT NOT NULL,
  `Bezeichung` VARCHAR(45) NULL,
  PRIMARY KEY (`MedInfID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jugendgruppe`.`Teilnehmer_has_Medizinische Informationen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Jugendgruppe`.`Teilnehmer_has_Medizinische Informationen` (
  `Teilnehmer_TeilnehmerID` INT NOT NULL,
  `Medizinische Informationen_MedInfID` INT NOT NULL,
  `Hinweise` VARCHAR(45) NULL,
  PRIMARY KEY (`Teilnehmer_TeilnehmerID`, `Medizinische Informationen_MedInfID`),
  INDEX `fk_Teilnehmer_has_Medizinische Informationen_Medizinische I_idx` (`Medizinische Informationen_MedInfID` ASC) VISIBLE,
  INDEX `fk_Teilnehmer_has_Medizinische Informationen_Teilnehmer1_idx` (`Teilnehmer_TeilnehmerID` ASC) VISIBLE,
  CONSTRAINT `fk_Teilnehmer_has_Medizinische Informationen_Teilnehmer1`
    FOREIGN KEY (`Teilnehmer_TeilnehmerID`)
    REFERENCES `Jugendgruppe`.`Teilnehmer` (`TeilnehmerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teilnehmer_has_Medizinische Informationen_Medizinische Inf1`
    FOREIGN KEY (`Medizinische Informationen_MedInfID`)
    REFERENCES `Jugendgruppe`.`Medizinische Informationen` (`MedInfID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
