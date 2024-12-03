-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_biblioteca
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `meus_clientes`
--

DROP TABLE IF EXISTS `meus_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meus_clientes` (
  `id_cliente` smallint(6) NOT NULL,
  `nome_cliente` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meus_clientes`
--

LOCK TABLES `meus_clientes` WRITE;
/*!40000 ALTER TABLE `meus_clientes` DISABLE KEYS */;
INSERT INTO `meus_clientes` VALUES (22,'Fábio'),(34,'Alberto'),(63,'Eric');
/*!40000 ALTER TABLE `meus_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_autores`
--

DROP TABLE IF EXISTS `tbl_autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_autores` (
  `id_autor` smallint(6) NOT NULL,
  `nome_autor` varchar(50) NOT NULL,
  `sobrenome_autor` varchar(60) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_autores`
--

LOCK TABLES `tbl_autores` WRITE;
/*!40000 ALTER TABLE `tbl_autores` DISABLE KEYS */;
INSERT INTO `tbl_autores` VALUES (1,'Daniel','Barret'),(2,'Gerald','Carter'),(3,'Mark','Sobell'),(4,'William','Stanek'),(5,'Richard','Blum'),(6,'Jostein','Gaarder'),(7,'Umberto','Eco'),(8,'Neil','De Grasse Tyson'),(9,'Stephen','Hawking'),(10,'Stephen','Jay Gould'),(11,'Charles','Darwin'),(12,'Alan','Turing'),(13,'Simon','Monk'),(14,'Paul','Scherz');
/*!40000 ALTER TABLE `tbl_autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_categorias` (
  `id_categoria` smallint(6) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES (1,'Tecnologia'),(2,'História'),(3,'Literatura'),(4,'Astronomia'),(5,'Botânica');
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_editoras`
--

DROP TABLE IF EXISTS `tbl_editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_editoras` (
  `id_editora` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome_editora` varchar(50) NOT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_editoras`
--

LOCK TABLES `tbl_editoras` WRITE;
/*!40000 ALTER TABLE `tbl_editoras` DISABLE KEYS */;
INSERT INTO `tbl_editoras` VALUES (1,'Prentice Hall'),(2,'O´Reilly'),(3,'Microsoft Press'),(4,'Wiley'),(5,'McGraw-Hill Education'),(6,'Springer');
/*!40000 ALTER TABLE `tbl_editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livro`
--

DROP TABLE IF EXISTS `tbl_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_livro` (
  `id_livro` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome_livro` varchar(70) NOT NULL,
  `isbn13` char(13) DEFAULT NULL,
  `isbn10` char(10) DEFAULT NULL,
  `data_pub` date NOT NULL,
  `preco_livro` decimal(6,2) NOT NULL,
  `id_autor` smallint(6) NOT NULL,
  `id_editora` smallint(6) NOT NULL,
  `id_categoria` smallint(6) NOT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `fk_id_autor` (`id_autor`),
  KEY `fk_id_editora` (`id_editora`),
  KEY `fk_id_categoria` (`id_categoria`),
  CONSTRAINT `fk_id_autor` FOREIGN KEY (`id_autor`) REFERENCES `tbl_autores` (`id_autor`),
  CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  CONSTRAINT `fk_id_editora` FOREIGN KEY (`id_editora`) REFERENCES `tbl_editoras` (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livro`
--

LOCK TABLES `tbl_livro` WRITE;
/*!40000 ALTER TABLE `tbl_livro` DISABLE KEYS */;
INSERT INTO `tbl_livro` VALUES (29,'Linux Command Line and Shell Scripting','9781118983843','111898384X','2015-01-09',68.35,5,4,1),(30,'SSH, The Secure Shell','9780596008956','0596008953','2005-05-17',58.30,1,2,1),(31,'Using Samba','9780596002565','0596002564','2003-12-21',61.45,2,2,1),(32,'Fedora and Red Hat Linux','9780133477436','0133477436','2014-01-10',62.24,3,1,1),(33,'Windows Server 2012 Inside Out','9780735666313','0735666318','2013-01-25',66.80,4,3,1),(34,'Microsoft Exchange Server 2010','9780735640610','0735640610','2010-12-01',45.30,4,3,1),(35,'Practical Electronics for Inventors','9781259587542','1259587541','2016-03-24',67.80,13,5,1);
/*!40000 ALTER TABLE `tbl_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teste_incremento`
--

DROP TABLE IF EXISTS `tbl_teste_incremento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_teste_incremento` (
  `id_teste` smallint(6) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_teste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teste_incremento`
--

LOCK TABLES `tbl_teste_incremento` WRITE;
/*!40000 ALTER TABLE `tbl_teste_incremento` DISABLE KEYS */;
INSERT INTO `tbl_teste_incremento` VALUES (1,'Lucas'),(2,'Jordana'),(3,'Ana'),(4,'Henrique'),(5,'Rafael'),(6,'Admilson');
/*!40000 ALTER TABLE `tbl_teste_incremento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-04 19:03:20
