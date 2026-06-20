CREATE DATABASE  IF NOT EXISTS `locadora` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `locadora`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: locadora
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_nascimento` varchar(20) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Silva','ana.silva@locadora.com','12/03/1985','12345678900','F'),(2,'Bruno Oliveira','bruno.oliveira@locadora.com','23/07/1990','23456789011','M'),(3,'Carla Pereira','carla.pereira@locadora.com','05/11/1982','34567890122','F'),(4,'Daniel Costa','daniel.costa@locadora.com','18/02/1995','45678901233','M'),(5,'Eduardo Almeida','eduardo.almeida@locadora.com','30/08/1988','56789012344','M'),(6,'Fernanda Lima','fernanda.lima@locadora.com','14/01/1992','67890123455','F'),(7,'Guilherme Rocha','guilherme.rocha@locadora.com','28/09/1986','78901234566','M'),(8,'Helena Fernandes','helena.fernandes@locadora.com','21/05/1993','89012345677','F'),(9,'Igor Santos','igor.santos@locadora.com','02/12/1984','90123456788','M'),(10,'Juliana Mendes','juliana.mendes@locadora.com','17/06/1991','51234567899','F'),(11,'Leonardo Martins','leonardo.martins@locadora.com','19/04/1987','12345678901','M'),(12,'Mariana Souza','mariana.souza@locadora.com','03/10/1996','23456789012','F'),(13,'Nelson Ribeiro','nelson.ribeiro@locadora.com','29/07/1983','34567890123','M'),(14,'Olivia Azevedo','olivia.azevedo@locadora.com','15/11/1994','45678901234','F'),(15,'Paulo Batista','paulo.batista@locadora.com','07/03/1989','56789012345','M'),(16,'Amanda Arantes','amanda.arantes@email.com','1995-05-12','11122233344','F'),(17,'Gessandro Arantes','gessandro.arantes@email.com','1998-09-23','55566677788','M'),(18,'Geandro Arantes','geandro.arantes@email.com','1987-01-30','99900011122','M'),(19,'Claudia Arantes','claudia.arantes@email.com','2001-07-14','44455566677','F');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diretor`
--

DROP TABLE IF EXISTS `diretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor` (
  `id_diretor` int NOT NULL AUTO_INCREMENT,
  `nome_diretor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_diretor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor`
--

LOCK TABLES `diretor` WRITE;
/*!40000 ALTER TABLE `diretor` DISABLE KEYS */;
INSERT INTO `diretor` VALUES (1,'Steven Spielberg'),(2,'Martin Scorsese'),(3,'Quentin Tarantino'),(4,'Christopher Nolan'),(5,'James Cameron'),(6,'Ridley Scott'),(7,'Alfred Hitchcock'),(8,'Stanley Kubrick'),(9,'Peter Jackson'),(10,'Francis Ford Coppola');
/*!40000 ALTER TABLE `diretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `id_filme` int NOT NULL AUTO_INCREMENT,
  `titulo_filme` varchar(50) DEFAULT NULL,
  `ano_lancamento` int DEFAULT NULL,
  `clas_indicativa` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `id_diretor` int DEFAULT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `id_diretor` (`id_diretor`),
  CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`id_diretor`) REFERENCES `diretor` (`id_diretor`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Jurassic Park',1993,'13','Aventura',1),(2,'E.T. the Extra-Terrestrial',1982,'10','Ficção Científica',1),(3,'Taxi Driver',1976,'16','Drama',2),(4,'Goodfellas',1990,'18','Crime',2),(5,'Pulp Fiction',1994,'18','Crime',3),(6,'Django Unchained',2012,'18','Western',3),(7,'Inception',2010,'13','Ficção Científica',4),(8,'The Dark Knight',2008,'13','Ação',4),(9,'Titanic',1997,'13','Romance',5),(10,'Avatar',2009,'13','Ficção Científica',5),(11,'Gladiator',2000,'16','Ação',6),(12,'Blade Runner',1982,'15','Ficção Científica',6),(13,'Psycho',1960,'18','Terror',7),(14,'Vertigo',1958,'13','Suspense',7),(15,'2001: A Space Odyssey',1968,'12','Ficção Científica',8),(16,'The Shining',1980,'18','Terror',8),(17,'The Lord of the Rings: The Fellowship of the Ring',2001,'12','Fantasia',9),(18,'The Lord of the Rings: The Return of the King',2003,'12','Fantasia',9),(19,'The Godfather',1972,'18','Crime',10),(20,'Apocalypse Now',1979,'18','Guerra',10),(21,'Schindler\'s List',1993,'16','Drama',1),(22,'Jaws',1975,'13','Terror',1),(23,'Raging Bull',1980,'16','Drama',2),(24,'The Departed',2006,'18','Crime',2),(25,'Kill Bill: Vol. 1',2003,'18','Ação',3),(26,'Inglourious Basterds',2009,'18','Guerra',3),(27,'Interstellar',2014,'10','Ficção Científica',4),(28,'Memento',2000,'16','Mistério',4),(29,'Aliens',1986,'15','Ficção Científica',5),(30,'True Lies',1994,'15','Ação',5),(31,'Homem de Ferro',2008,'12','Ação',1),(32,'Capitão América: Guerra Civil',2016,'12','Ação',2),(33,'Mulher-Maravilha',2017,'12','Ação',3),(34,'O Homem de Aço',2013,'12','Ação',4),(35,'Inception',2010,'14','Ficção',1),(36,'Avatar',2009,'12','Ficção',2),(37,'Django Unchained',2012,'16','Ação',3),(38,'The Lord of the Rings',2001,'12','Fantasia',4),(39,'Cidade de Deus',2002,'16','Drama',1),(40,'Central do Brasil',1998,'12','Drama',2),(41,'O Auto da Compadecida',2000,'10','Comédia',3),(42,'Tropa de Elite',2007,'16','Ação',4);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacao` (
  `id_locacao` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_filme` int DEFAULT NULL,
  `data_emprestimo` date DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL,
  `data_baixa_dev` date DEFAULT NULL,
  PRIMARY KEY (`id_locacao`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_filme` (`id_filme`),
  CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id_filme`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,1,1,'2024-01-01','2024-01-08','2024-01-08'),(2,2,2,'2024-01-02','2024-01-09','2024-01-09'),(3,3,3,'2024-01-03','2024-01-10','2024-01-11'),(4,4,4,'2024-01-04','2024-01-11','2024-01-11'),(5,5,5,'2024-01-05','2024-01-12','2024-01-12'),(6,6,6,'2024-01-06','2024-01-13','2024-01-13'),(7,7,7,'2024-01-07','2024-01-14','2024-01-15'),(8,8,8,'2024-01-08','2024-01-15','2024-01-15'),(9,9,9,'2024-01-09','2024-01-16','2024-01-17'),(10,10,10,'2024-01-10','2024-01-17','2024-01-17'),(11,11,11,'2024-01-11','2024-01-18','2024-01-18'),(12,12,12,'2024-01-12','2024-01-19','2024-01-19'),(13,13,13,'2024-01-13','2024-01-20','2024-01-21'),(14,14,14,'2024-01-14','2024-01-21','2024-01-21'),(15,15,15,'2024-01-15','2024-01-22','2024-01-22'),(16,1,16,'2024-01-16','2024-01-23','2024-01-24'),(17,2,17,'2024-01-17','2024-01-24','2024-01-24'),(18,3,18,'2024-01-18','2024-01-25','2024-01-26'),(19,4,19,'2024-01-19','2024-01-26','2024-01-26'),(20,5,20,'2024-01-20','2024-01-27','2024-01-27'),(21,6,21,'2024-01-21','2024-01-28','2024-01-28'),(22,7,22,'2024-01-22','2024-01-29','2024-01-30'),(23,8,23,'2024-01-23','2024-01-30','2024-01-30'),(24,9,24,'2024-01-24','2024-01-31','2024-02-01'),(25,10,25,'2024-01-25','2024-02-01','2024-02-01'),(26,11,26,'2024-01-26','2024-02-02','2024-02-02'),(27,12,27,'2024-01-27','2024-02-03','2024-02-03'),(28,13,28,'2024-01-28','2024-02-04','2024-02-05'),(29,14,29,'2024-01-29','2024-02-05','2024-02-05'),(30,15,30,'2024-01-30','2024-02-06','2024-02-06'),(31,1,1,'2024-01-31','2024-02-07','2024-02-08'),(32,2,2,'2024-02-01','2024-02-08','2024-02-08'),(33,3,3,'2024-02-02','2024-02-09','2024-02-10'),(34,4,4,'2024-02-03','2024-02-10','2024-02-10'),(35,5,5,'2024-02-04','2024-02-11','2024-02-11'),(36,6,6,'2024-02-05','2024-02-12','2024-02-12'),(37,7,7,'2024-02-06','2024-02-13','2024-02-14'),(38,8,8,'2024-02-07','2024-02-14','2024-02-14'),(39,9,9,'2024-02-08','2024-02-15','2024-02-16'),(40,10,10,'2024-02-09','2024-02-16','2024-02-16'),(41,11,11,'2024-02-10','2024-02-17','2024-02-17'),(42,12,12,'2024-02-11','2024-02-18','2024-02-18'),(43,13,13,'2024-02-12','2024-02-19','2024-02-20'),(44,14,14,'2024-02-13','2024-02-20','2024-02-20'),(45,15,15,'2024-02-14','2024-02-21','2024-02-21'),(46,1,16,'2024-02-15','2024-02-22','2024-02-23'),(47,2,17,'2024-02-16','2024-02-23','2024-02-23'),(48,3,18,'2024-02-17','2024-02-24','2024-02-25'),(49,4,19,'2024-02-18','2024-02-25','2024-02-25'),(50,5,20,'2024-02-19','2024-02-26','2024-02-26'),(51,6,21,'2024-02-20','2024-02-27','2024-02-27'),(52,7,22,'2024-02-21','2024-02-28','2024-02-29'),(53,8,23,'2024-02-22','2024-02-29','2024-02-29'),(54,9,24,'2024-02-23','2024-03-01','2024-03-02'),(55,10,25,'2024-02-24','2024-03-02','2024-03-02'),(56,11,26,'2024-02-25','2024-03-03','2024-03-03'),(57,12,27,'2024-02-26','2024-03-04','2024-03-04'),(58,13,28,'2024-02-27','2024-03-05','2024-03-06'),(59,14,29,'2024-02-28','2024-03-06','2024-03-06'),(60,15,30,'2024-02-29','2024-03-07','2024-03-07'),(61,1,1,'2024-03-01','2024-03-08','2024-03-09'),(62,2,2,'2024-03-02','2024-03-09','2024-03-09'),(63,3,3,'2024-03-03','2024-03-10','2024-03-11'),(64,4,4,'2024-03-04','2024-03-11','2024-03-11'),(65,5,5,'2024-03-05','2024-03-12','2024-03-12'),(66,6,6,'2024-03-06','2024-03-13','2024-03-13'),(67,7,7,'2024-03-07','2024-03-14','2024-03-15'),(68,8,8,'2024-03-08','2024-03-15','2024-03-15'),(69,9,9,'2024-03-09','2024-03-16','2024-03-17'),(70,10,10,'2024-03-10','2024-03-17','2024-03-17'),(71,11,11,'2024-03-11','2024-03-18','2024-03-18'),(72,12,12,'2024-03-12','2024-03-19','2024-03-19'),(73,13,13,'2024-03-13','2024-03-20','2024-03-21'),(74,14,14,'2024-03-14','2024-03-21','2024-03-21'),(75,15,15,'2024-03-15','2024-03-22','2024-03-22'),(76,1,16,'2024-03-16','2024-03-23','2024-03-24'),(77,2,17,'2024-03-17','2024-03-24','2024-03-24'),(78,3,18,'2024-03-18','2024-03-25','2024-03-26'),(79,4,19,'2024-03-19','2024-03-26','2024-03-26'),(80,5,20,'2024-03-20','2024-03-27','2024-03-27'),(81,6,21,'2024-03-21','2024-03-28','2024-03-28'),(82,7,22,'2024-03-22','2024-03-29','2024-03-30'),(83,8,23,'2024-03-23','2024-03-30','2024-03-30'),(84,9,24,'2024-03-24','2024-03-31','2024-04-01'),(85,10,25,'2024-03-25','2024-04-01','2024-04-01'),(86,11,26,'2024-03-26','2024-04-02','2024-04-02'),(87,12,27,'2024-03-27','2024-04-03','2024-04-03'),(88,13,28,'2024-03-28','2024-04-04','2024-04-05'),(89,14,29,'2024-03-29','2024-04-05','2024-04-05'),(90,15,30,'2024-03-30','2024-04-06','2024-04-06'),(91,1,1,'2024-03-31','2024-04-07','2024-04-08'),(92,2,2,'2024-04-01','2024-04-08','2024-04-08'),(93,3,3,'2024-04-02','2024-04-09','2024-04-10'),(94,4,4,'2024-04-03','2024-04-10','2024-04-10'),(95,5,5,'2024-04-04','2024-04-11','2024-04-11'),(96,6,6,'2024-04-05','2024-04-12','2024-04-12'),(97,7,7,'2024-04-06','2024-04-13','2024-04-14'),(98,8,8,'2024-04-07','2024-04-14','2024-04-14'),(99,9,9,'2024-04-08','2024-04-15','2024-04-16'),(100,10,10,'2024-04-09','2024-04-16','2024-04-16'),(101,16,31,'2026-06-20','2026-06-27',NULL),(102,17,32,'2026-06-20','2026-06-27',NULL),(103,18,33,'2026-06-20','2026-06-27',NULL),(104,19,34,'2026-06-20','2026-06-27',NULL),(105,16,31,'2024-04-10','2024-04-17',NULL),(106,17,32,'2024-04-11','2024-04-18',NULL),(107,18,33,'2024-04-12','2024-04-19',NULL),(108,19,34,'2024-04-13','2024-04-20',NULL);
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-20 20:03:59
