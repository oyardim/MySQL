CREATE DATABASE  IF NOT EXISTS `schule` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `schule`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: schule
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ag`
--

DROP TABLE IF EXISTS `ag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ag` (
  `idag` int(11) NOT NULL,
  `ag_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lehrer_idlehrer` int(11) NOT NULL,
  PRIMARY KEY (`idag`,`lehrer_idlehrer`),
  KEY `fk_ag_lehrer1_idx` (`lehrer_idlehrer`),
  CONSTRAINT `fk_ag_lehrer1` FOREIGN KEY (`lehrer_idlehrer`) REFERENCES `lehrer` (`idlehrer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ag`
--

LOCK TABLES `ag` WRITE;
/*!40000 ALTER TABLE `ag` DISABLE KEYS */;
INSERT INTO `ag` VALUES (1,'Theater',1),(2,'Orchester',2),(3,'Homepage',3),(4,'Fotografie',4),(5,'Bigband',5),(6,'Holzwerken',1),(7,'Sport',1);
/*!40000 ALTER TABLE `ag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etage`
--

DROP TABLE IF EXISTS `etage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etage` (
  `idetage` int(11) NOT NULL,
  `etage_nummer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schule_idschule` int(11) NOT NULL,
  `gebaude_idgebaude` int(11) NOT NULL,
  PRIMARY KEY (`idetage`,`schule_idschule`,`gebaude_idgebaude`),
  KEY `fk_etage_gebaude1_idx` (`gebaude_idgebaude`),
  CONSTRAINT `fk_etage_gebaude1` FOREIGN KEY (`gebaude_idgebaude`) REFERENCES `gebaude` (`idgebaude`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etage`
--

LOCK TABLES `etage` WRITE;
/*!40000 ALTER TABLE `etage` DISABLE KEYS */;
INSERT INTO `etage` VALUES (1,'erdgeschoss',1,1),(2,'e1',1,1),(3,'e2',1,1),(4,'e3',1,1),(5,'e4',1,1);
/*!40000 ALTER TABLE `etage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gebaude`
--

DROP TABLE IF EXISTS `gebaude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gebaude` (
  `idgebaude` int(11) NOT NULL,
  `ort` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strasse_hn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plz` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idgebaude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebaude`
--

LOCK TABLES `gebaude` WRITE;
/*!40000 ALTER TABLE `gebaude` DISABLE KEYS */;
INSERT INTO `gebaude` VALUES (1,'Düsseldorf','Wagnerstrasse 500','40280');
/*!40000 ALTER TABLE `gebaude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klasse` (
  `idklasse` int(11) NOT NULL,
  `klassen_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `klassen_leiter` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etage_idetage` int(11) NOT NULL,
  `etage_schule_idschule` int(11) NOT NULL,
  PRIMARY KEY (`idklasse`,`etage_idetage`,`etage_schule_idschule`),
  KEY `fk_klasse_etage1_idx` (`etage_idetage`,`etage_schule_idschule`),
  CONSTRAINT `fk_klasse_etage1` FOREIGN KEY (`etage_idetage`, `etage_schule_idschule`) REFERENCES `etage` (`idetage`, `schule_idschule`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
INSERT INTO `klasse` VALUES (1,'8A','Omer_Yardim',1,1),(2,'8B','Elisabeth_Jonas',2,1),(3,'8C','Peter_Pratts',3,1),(4,'8D','Christian_Wiesenhoff',4,1);
/*!40000 ALTER TABLE `klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konferenz`
--

DROP TABLE IF EXISTS `konferenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konferenz` (
  `idkonferenz` int(11) NOT NULL,
  `dauer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bezeichnung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idkonferenz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konferenz`
--

LOCK TABLES `konferenz` WRITE;
/*!40000 ALTER TABLE `konferenz` DISABLE KEYS */;
INSERT INTO `konferenz` VALUES (1,'1 Stunde','15.09.22','zeugnisbesprechung'),(2,'1 Stunde','20.09.22','schülerverweis');
/*!40000 ALTER TABLE `konferenz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer`
--

DROP TABLE IF EXISTS `lehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer` (
  `idlehrer` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vorname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idlehrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer`
--

LOCK TABLES `lehrer` WRITE;
/*!40000 ALTER TABLE `lehrer` DISABLE KEYS */;
INSERT INTO `lehrer` VALUES (1,'Buttenmüller','Georg'),(2,'Zimmermann','Josef'),(3,'Amann','Brigitte'),(4,'Huber','Erika'),(5,'Rees','Günter');
/*!40000 ALTER TABLE `lehrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer_has_klasse`
--

DROP TABLE IF EXISTS `lehrer_has_klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer_has_klasse` (
  `lehrer_idlehrer` int(11) NOT NULL,
  `klasse_idklasse` int(11) NOT NULL,
  PRIMARY KEY (`lehrer_idlehrer`,`klasse_idklasse`),
  KEY `fk_lehrer_has_klasse_klasse1_idx` (`klasse_idklasse`),
  KEY `fk_lehrer_has_klasse_lehrer1_idx` (`lehrer_idlehrer`),
  CONSTRAINT `fk_lehrer_has_klasse_klasse1` FOREIGN KEY (`klasse_idklasse`) REFERENCES `klasse` (`idklasse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lehrer_has_klasse_lehrer1` FOREIGN KEY (`lehrer_idlehrer`) REFERENCES `lehrer` (`idlehrer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer_has_klasse`
--

LOCK TABLES `lehrer_has_klasse` WRITE;
/*!40000 ALTER TABLE `lehrer_has_klasse` DISABLE KEYS */;
INSERT INTO `lehrer_has_klasse` VALUES (1,1),(2,1),(3,2),(4,3);
/*!40000 ALTER TABLE `lehrer_has_klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrer_has_konferenz`
--

DROP TABLE IF EXISTS `lehrer_has_konferenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrer_has_konferenz` (
  `lehrer_idlehrer` int(11) NOT NULL,
  `konferenz_idkonferenz` int(11) NOT NULL,
  PRIMARY KEY (`lehrer_idlehrer`,`konferenz_idkonferenz`),
  KEY `fk_lehrer_has_konferenz_konferenz1_idx` (`konferenz_idkonferenz`),
  KEY `fk_lehrer_has_konferenz_lehrer1_idx` (`lehrer_idlehrer`),
  CONSTRAINT `fk_lehrer_has_konferenz_konferenz1` FOREIGN KEY (`konferenz_idkonferenz`) REFERENCES `konferenz` (`idkonferenz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lehrer_has_konferenz_lehrer1` FOREIGN KEY (`lehrer_idlehrer`) REFERENCES `lehrer` (`idlehrer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrer_has_konferenz`
--

LOCK TABLES `lehrer_has_konferenz` WRITE;
/*!40000 ALTER TABLE `lehrer_has_konferenz` DISABLE KEYS */;
INSERT INTO `lehrer_has_konferenz` VALUES (1,1),(2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `lehrer_has_konferenz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raum`
--

DROP TABLE IF EXISTS `raum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raum` (
  `idraum` int(11) NOT NULL,
  `nummer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plaetze` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unterricht_idunterricht` int(11) NOT NULL,
  `unterricht_klasse_idklasse` int(11) NOT NULL,
  `unterricht_klasse_etage_idetage` int(11) NOT NULL,
  `unterricht_klasse_etage_schule_idschule` int(11) NOT NULL,
  PRIMARY KEY (`idraum`,`unterricht_idunterricht`,`unterricht_klasse_idklasse`,`unterricht_klasse_etage_idetage`,`unterricht_klasse_etage_schule_idschule`),
  KEY `fk_raum_unterricht1_idx` (`unterricht_idunterricht`,`unterricht_klasse_idklasse`,`unterricht_klasse_etage_idetage`,`unterricht_klasse_etage_schule_idschule`),
  CONSTRAINT `fk_raum_unterricht1` FOREIGN KEY (`unterricht_idunterricht`, `unterricht_klasse_idklasse`, `unterricht_klasse_etage_idetage`, `unterricht_klasse_etage_schule_idschule`) REFERENCES `unterricht` (`idunterricht`, `klasse_idklasse`, `klasse_etage_idetage`, `klasse_etage_schule_idschule`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raum`
--

LOCK TABLES `raum` WRITE;
/*!40000 ALTER TABLE `raum` DISABLE KEYS */;
INSERT INTO `raum` VALUES (1,'R110','15',1,1,1,1),(2,'R111','12',1,1,1,1),(3,'R112','20',1,1,1,1),(4,'R113','25',1,1,1,1),(5,'R114','15',1,1,1,1),(6,'R115','12',1,1,1,1),(7,'R116','14',1,1,1,1),(8,'R117','16',1,1,1,1);
/*!40000 ALTER TABLE `raum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schueler`
--

DROP TABLE IF EXISTS `schueler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schueler` (
  `idschueler` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vorname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `klasse` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geburtsdatum` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geschlecht` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strasse_hn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plz` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefonnummer` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zeugnis_idzeugnis` int(11) NOT NULL,
  `klasse_idklasse` int(11) NOT NULL,
  PRIMARY KEY (`idschueler`,`zeugnis_idzeugnis`,`klasse_idklasse`),
  KEY `fk_schueler_zeugnis1_idx` (`zeugnis_idzeugnis`),
  KEY `fk_schueler_klasse1_idx` (`klasse_idklasse`),
  CONSTRAINT `fk_schueler_klasse1` FOREIGN KEY (`klasse_idklasse`) REFERENCES `klasse` (`idklasse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_schueler_zeugnis1` FOREIGN KEY (`zeugnis_idzeugnis`) REFERENCES `zeugnis` (`idzeugnis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schueler`
--

LOCK TABLES `schueler` WRITE;
/*!40000 ALTER TABLE `schueler` DISABLE KEYS */;
INSERT INTO `schueler` VALUES (1,'Schmidt','Carla','8A','21.05.09','w','Wagnerstrasse 14','40212','212567328',1,1),(2,'Lang','Michael','8A','22.05.09','m','Wagnerstrasse 15','40212','212567329',1,1),(3,'Daunert','Oliver','8A','23.05.09','m','Wagnerstrasse 16','40212','212567330',1,1),(4,'Galver','Sylvia','8A','24.05.09','m','Wagnerstrasse 17','40212','212567331',1,1),(5,'Yardim','Omer','8A','25.05.09','m','Wagnerstrasse 18','40212','212567332',1,1),(6,'Mueller','Arrno','8B','26.05.09','m','Wagnerstrasse 19','40212','212567333',1,2),(7,'Schreiber','Robert','8B','27.05.09','m','Wagnerstrasse 20','40212','212567334',1,2),(8,'Jonas','Elisabeth','8B','28.05.09','w','Wagnerstrasse 21','40212','212567335',1,2),(9,'Faust','Viola','8B','29.05.09','w','Wagnerstrasse 22','40212','212567336',1,2),(10,'Pratts','Peter','8C','30.05.09','m','Wagnerstrasse 23','40212','212567337',1,3),(11,'Obmann','Otto','8C','31.05.09','m','Wagnerstrasse 24','40212','212567338',1,3),(12,'Pauli','Antonia','8C','01.06.09','m','Wagnerstrasse 25','40212','212567339',1,3),(13,'Kulick','Sabine','8C','02.06.09','w','Wagnerstrasse 26','40212','212567340',1,3),(14,'Wiesenhoff','Christian','8D','03.06.09','m','Wagnerstrasse 27','40212','212567341',1,4),(15,'Zimmermann','Anne','8D','04.06.09','w','Wagnerstrasse 28','40212','212567342',1,4),(16,'Ebert','Anne','8D','05.06.09','w','Wagnerstrasse 29','40212','212567343',1,4),(17,'Schwarzm�ller','Maria','8D','06.06.09','w','Wagnerstrasse 30','40212','212567344',1,4);
/*!40000 ALTER TABLE `schueler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schueler_has_ag`
--

DROP TABLE IF EXISTS `schueler_has_ag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schueler_has_ag` (
  `schueler_idschueler` int(11) NOT NULL,
  `ag_idag` int(11) NOT NULL,
  PRIMARY KEY (`schueler_idschueler`,`ag_idag`),
  KEY `fk_schueler_has_ag_ag1_idx` (`ag_idag`),
  KEY `fk_schueler_has_ag_schueler1_idx` (`schueler_idschueler`),
  CONSTRAINT `fk_schueler_has_ag_ag1` FOREIGN KEY (`ag_idag`) REFERENCES `ag` (`idag`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_schueler_has_ag_schueler1` FOREIGN KEY (`schueler_idschueler`) REFERENCES `schueler` (`idschueler`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schueler_has_ag`
--

LOCK TABLES `schueler_has_ag` WRITE;
/*!40000 ALTER TABLE `schueler_has_ag` DISABLE KEYS */;
INSERT INTO `schueler_has_ag` VALUES (1,1),(2,2),(3,2),(4,3),(5,4),(6,2),(7,5);
/*!40000 ALTER TABLE `schueler_has_ag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schule`
--

DROP TABLE IF EXISTS `schule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schule` (
  `idschule` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gebaude_idgebaude` int(11) NOT NULL,
  PRIMARY KEY (`idschule`,`gebaude_idgebaude`),
  KEY `fk_schule_gebaude1_idx` (`gebaude_idgebaude`),
  CONSTRAINT `fk_schule_gebaude1` FOREIGN KEY (`gebaude_idgebaude`) REFERENCES `gebaude` (`idgebaude`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schule`
--

LOCK TABLES `schule` WRITE;
/*!40000 ALTER TABLE `schule` DISABLE KEYS */;
INSERT INTO `schule` VALUES (1,'Krahenhöhe',1);
/*!40000 ALTER TABLE `schule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unterricht`
--

DROP TABLE IF EXISTS `unterricht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unterricht` (
  `idunterricht` int(11) NOT NULL,
  `fach` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stunden` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `klasse_idklasse` int(11) NOT NULL,
  `klasse_etage_idetage` int(11) NOT NULL,
  `klasse_etage_schule_idschule` int(11) NOT NULL,
  `lehrer_idlehrer` int(11) NOT NULL,
  PRIMARY KEY (`idunterricht`,`klasse_idklasse`,`klasse_etage_idetage`,`klasse_etage_schule_idschule`,`lehrer_idlehrer`),
  KEY `fk_unterricht_klasse1_idx` (`klasse_idklasse`,`klasse_etage_idetage`,`klasse_etage_schule_idschule`),
  KEY `fk_unterricht_lehrer1_idx` (`lehrer_idlehrer`),
  CONSTRAINT `fk_unterricht_klasse1` FOREIGN KEY (`klasse_idklasse`, `klasse_etage_idetage`, `klasse_etage_schule_idschule`) REFERENCES `klasse` (`idklasse`, `etage_idetage`, `etage_schule_idschule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unterricht_lehrer1` FOREIGN KEY (`lehrer_idlehrer`) REFERENCES `lehrer` (`idlehrer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unterricht`
--

LOCK TABLES `unterricht` WRITE;
/*!40000 ALTER TABLE `unterricht` DISABLE KEYS */;
INSERT INTO `unterricht` VALUES (1,'Deutsch','4',1,1,1,1),(2,'Mathe','5',2,2,1,2),(3,'Sport','2',2,2,1,2),(4,'Englisch','3',3,3,1,3),(5,'Geschichte','2',3,3,1,3),(6,'Physik','3',4,4,1,4),(7,'Chemie','2',4,4,1,4);
/*!40000 ALTER TABLE `unterricht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zeugnis`
--

DROP TABLE IF EXISTS `zeugnis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zeugnis` (
  `idzeugnis` int(11) NOT NULL,
  `wintersemester` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sommersemester` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idzeugnis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeugnis`
--

LOCK TABLES `zeugnis` WRITE;
/*!40000 ALTER TABLE `zeugnis` DISABLE KEYS */;
INSERT INTO `zeugnis` VALUES (1,'w1','s1');
/*!40000 ALTER TABLE `zeugnis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-23 13:08:09
