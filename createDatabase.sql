-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               5.7.12-0ubuntu1 - (Ubuntu)
-- Serwer OS:                    Linux
-- HeidiSQL Wersja:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury bazy danych trener_personalny
DROP DATABASE IF EXISTS `trener_personalny`;
CREATE DATABASE IF NOT EXISTS `trener_personalny` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;
USE `trener_personalny`;


-- Zrzut struktury tabela trener_personalny.adres_uzytkownika
DROP TABLE IF EXISTS `adres_uzytkownika`;
CREATE TABLE IF NOT EXISTS `adres_uzytkownika` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` int(11) NOT NULL,
  `id_miasta` int(11) NOT NULL,
  `ulica` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `nr_mieszkania` varchar(60) COLLATE utf8_polish_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_uzytkownika_id_miasta` (`id_uzytkownika`,`id_miasta`),
  KEY `id_miasta` (`id_miasta`),
  KEY `ad_id_user` (`id_uzytkownika`),
  CONSTRAINT `ad_id_user` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_miasta` FOREIGN KEY (`id_miasta`) REFERENCES `miasta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.cwiczenia
DROP TABLE IF EXISTS `cwiczenia`;
CREATE TABLE IF NOT EXISTS `cwiczenia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `id_partii_miesni` int(11) NOT NULL,
  `opis` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_pmiesni` (`id_partii_miesni`),
  CONSTRAINT `id_pmiesni` FOREIGN KEY (`id_partii_miesni`) REFERENCES `partia_miesni` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.diety
DROP TABLE IF EXISTS `diety`;
CREATE TABLE IF NOT EXISTS `diety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `id_rodzaj_diety` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_produktu` (`id_produktu`),
  KEY `id_rdiety` (`id_rodzaj_diety`),
  KEY `id_duzytkownik` (`id_uzytkownika`),
  CONSTRAINT `id_duzytkownik` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_produktu` FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_rdiety` FOREIGN KEY (`id_rodzaj_diety`) REFERENCES `rodzaje_diet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.dzien_tygodnia
DROP TABLE IF EXISTS `dzien_tygodnia`;
CREATE TABLE IF NOT EXISTS `dzien_tygodnia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.historia_treningow
DROP TABLE IF EXISTS `historia_treningow`;
CREATE TABLE IF NOT EXISTS `historia_treningow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_uzytkownika` int(11) NOT NULL,
  `id_cwiczenia` int(11) NOT NULL,
  `czy_trening_wykonany` int(11) NOT NULL,
  `ilosc_serii` int(11) DEFAULT NULL,
  `ilosc_powtorzen` int(11) DEFAULT NULL,
  `obciazenie` int(11) DEFAULT NULL,
  `data_dodania` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_huzytk` (`id_uzytkownika`),
  KEY `id_hcwicz` (`id_cwiczenia`),
  CONSTRAINT `id_hcwicz` FOREIGN KEY (`id_cwiczenia`) REFERENCES `cwiczenia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_huzytk` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.miasta
DROP TABLE IF EXISTS `miasta`;
CREATE TABLE IF NOT EXISTS `miasta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `kod_woj` varchar(3) COLLATE utf8_polish_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mwoj_k` (`kod_woj`),
  CONSTRAINT `mwoj_k` FOREIGN KEY (`kod_woj`) REFERENCES `wojewodztwa` (`kod_woj`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.partia_miesni
DROP TABLE IF EXISTS `partia_miesni`;
CREATE TABLE IF NOT EXISTS `partia_miesni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.producent
DROP TABLE IF EXISTS `producent`;
CREATE TABLE IF NOT EXISTS `producent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.produkty
DROP TABLE IF EXISTS `produkty`;
CREATE TABLE IF NOT EXISTS `produkty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `weglowodany` decimal(11,2) DEFAULT NULL,
  `bialka` decimal(11,2) DEFAULT NULL,
  `tluszcze` decimal(11,2) DEFAULT NULL,
  `ilosc_kalorii` decimal(11,2) DEFAULT NULL,
  `id_producenta` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_producenta` (`id_producenta`),
  CONSTRAINT `id_producenta` FOREIGN KEY (`id_producenta`) REFERENCES `producent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.rodzaje_diet
DROP TABLE IF EXISTS `rodzaje_diet`;
CREATE TABLE IF NOT EXISTS `rodzaje_diet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.treningi
DROP TABLE IF EXISTS `treningi`;
CREATE TABLE IF NOT EXISTS `treningi` (
  `id` int(11) NOT NULL,
  `id_cwiczenia` int(11) NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `id_dnia` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_cwiczenia` (`id_cwiczenia`),
  KEY `id_uzytkownika` (`id_uzytkownika`),
  KEY `id_dnia` (`id_dnia`),
  CONSTRAINT `id_cwiczenia` FOREIGN KEY (`id_cwiczenia`) REFERENCES `cwiczenia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_dnia` FOREIGN KEY (`id_dnia`) REFERENCES `dzien_tygodnia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_uzytkownika` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownicy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.uzytkownicy
DROP TABLE IF EXISTS `uzytkownicy`;
CREATE TABLE IF NOT EXISTS `uzytkownicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.


-- Zrzut struktury tabela trener_personalny.wojewodztwa
DROP TABLE IF EXISTS `wojewodztwa`;
CREATE TABLE IF NOT EXISTS `wojewodztwa` (
  `kod_woj` varchar(3) COLLATE utf8_polish_ci NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`kod_woj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;