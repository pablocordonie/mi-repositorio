CREATE DATABASE  IF NOT EXISTS `social_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `social_web`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: social_web
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `ID_comentario` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ID_usuario` mediumint unsigned DEFAULT NULL,
  `ID_publicacion` mediumint unsigned DEFAULT NULL,
  `texto` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_comentario`),
  KEY `comentarios_IDusuario_fk` (`ID_usuario`),
  KEY `comentarios_IDpublicacion_fk` (`ID_publicacion`),
  CONSTRAINT `comentarios_IDpublicacion_fk` FOREIGN KEY (`ID_publicacion`) REFERENCES `publicaciones` (`ID_publicacion`) ON DELETE RESTRICT,
  CONSTRAINT `comentarios_IDusuario_fk` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `ID_usuario` mediumint unsigned NOT NULL,
  `ID_publicacion` mediumint unsigned NOT NULL,
  `like_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `like_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_usuario`,`ID_publicacion`),
  KEY `likes_IDpublicacion_fk` (`ID_publicacion`),
  CONSTRAINT `likes_IDpublicacion_fk` FOREIGN KEY (`ID_publicacion`) REFERENCES `publicaciones` (`ID_publicacion`) ON DELETE RESTRICT,
  CONSTRAINT `likes_IDusuario_fk` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicaciones` (
  `ID_publicacion` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ID_usuario` mediumint unsigned DEFAULT NULL,
  `foto` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_publicacion`),
  KEY `publicaciones_IDusuario_fk` (`ID_usuario`),
  CONSTRAINT `publicaciones_IDusuario_fk` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_seguidor`
--

DROP TABLE IF EXISTS `usuario_seguidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_seguidor` (
  `ID_usuario` mediumint unsigned NOT NULL,
  `ID_seguidor` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_aceptado` tinyint NOT NULL DEFAULT (1),
  `usuario_baneado` tinyint NOT NULL DEFAULT (0),
  PRIMARY KEY (`ID_usuario`,`ID_seguidor`),
  KEY `seguidor_IDseguidor_fk` (`ID_seguidor`),
  CONSTRAINT `seguidor_IDseguidor_fk` FOREIGN KEY (`ID_seguidor`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT,
  CONSTRAINT `seguidor_IDusuario_fk` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_seguidor`
--

LOCK TABLES `usuario_seguidor` WRITE;
/*!40000 ALTER TABLE `usuario_seguidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_seguidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_usuario` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nickname` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password_usuario` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `bio` varchar(200) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `codigo_validacion` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario_validado` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_usuario`),
  UNIQUE KEY `usuarios_nickname_uq` (`nickname`),
  UNIQUE KEY `usuarios_email_uq` (`email`),
  CONSTRAINT `usuarios_fecha_nacimiento_ck` CHECK ((`fecha_nacimiento` > _utf8mb4'1900-01-01'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-02  1:45:51
