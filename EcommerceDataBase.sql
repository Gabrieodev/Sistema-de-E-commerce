CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Eletrônicos'),(2,'Roupas'),(3,'Livros'),(4,'Beleza'),(5,'Esportes'),(6,'Móveis');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_aniversario` char(5) NOT NULL,
  `id_perfil` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `fk_perfil_cliente` (`id_perfil`),
  CONSTRAINT `fk_perfil_cliente` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_cliente` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Souza','ana.souza@email.com','11999998888','1990-05-20','123.456.789-00','20-05',2),(2,'Bruno Lima','bruno.lima@email.com','21988887777','1985-03-14','234.567.890-11','14-03',2),(3,'Camila Rocha','camila.rocha@email.com','31977776666','1992-12-25','345.678.901-22','25-12',2),(4,'Diego Martins','diego.martins@email.com','41966665555','1988-09-30','456.789.012-33','30-09',3),(5,'Eduarda Pires','eduarda.pires@email.com','51955554444','1995-11-10','567.890.123-44','10-11',2),(6,'Felipe Alves','felipe.alves@email.com','61944443333','2000-07-08','678.901.234-55','08-07',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id_cliente` int NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua das Flores','123','São Paulo','SP','01001-000'),(2,'Av. Brasil','456','Rio de Janeiro','RJ','20040-002'),(3,'Rua da Liberdade','789','Belo Horizonte','MG','30130-010'),(4,'Rua Curitiba','321','Curitiba','PR','80010-000'),(5,'Av. Ipiranga','654','Porto Alegre','RS','90010-001'),(6,'Rua Goiás','987','Goiânia','GO','74000-000');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_especial`
--

DROP TABLE IF EXISTS `evento_especial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_especial` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nome_evento` varchar(100) NOT NULL,
  `data_evento` date DEFAULT NULL,
  `desconto_percentual` decimal(5,2) NOT NULL,
  `tipo_evento` enum('DATA_FIXA','ANIVERSARIO') NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_especial`
--

LOCK TABLES `evento_especial` WRITE;
/*!40000 ALTER TABLE `evento_especial` DISABLE KEYS */;
INSERT INTO `evento_especial` VALUES (1,'Natal','2025-12-25',20.00,'DATA_FIXA'),(2,'Dia das Mães','2025-05-11',15.00,'DATA_FIXA'),(3,'Black Friday','2025-11-28',30.00,'DATA_FIXA'),(4,'Dia do Consumidor','2025-03-15',10.00,'DATA_FIXA'),(5,'Aniversário do Cliente',NULL,40.00,'ANIVERSARIO');
/*!40000 ALTER TABLE `evento_especial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,1,1,1,199.90,199.90),(2,1,3,1,99.90,99.90),(3,2,2,1,89.90,89.90),(4,3,5,1,49.90,49.90),(5,3,6,1,39.90,39.90),(6,4,7,1,129.90,129.90),(7,4,8,1,99.90,99.90),(8,4,9,1,69.90,69.90),(9,5,10,1,79.90,79.90),(10,5,11,1,39.90,39.90),(11,6,12,1,899.90,899.90),(12,6,1,1,199.90,199.90),(13,7,12,1,899.90,899.90),(14,8,11,1,499.90,499.90),(15,9,4,2,59.95,119.90),(16,9,3,1,99.90,99.90),(17,10,5,2,59.90,119.80),(18,11,6,2,74.90,149.80),(19,12,4,1,49.90,49.90),(20,13,9,1,79.90,79.90);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `forma_pagamento` enum('PIX','Débito','Crédito','Boleto') NOT NULL,
  `status_pagamento` enum('Pendente','Aprovado','Recusado','Cancelado') NOT NULL DEFAULT 'Pendente',
  `data_pagamento` datetime DEFAULT NULL,
  `valor_pago` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,'PIX','Aprovado','2025-12-25 10:15:00',159.92),(2,2,'Débito','Aprovado','2025-07-10 14:32:00',89.90),(3,3,'Crédito','Aprovado','2025-05-11 09:47:00',72.42),(4,4,'Crédito','Aprovado','2025-11-28 20:01:00',209.97),(5,5,'PIX','Aprovado','2025-03-15 16:20:00',107.91),(6,6,'Boleto','Aprovado','2025-12-25 11:08:00',239.85),(7,7,'Crédito','Aprovado','2025-07-08 13:15:00',899.90),(8,8,'Débito','Aprovado','2025-07-08 13:45:00',499.90),(9,9,'PIX','Aprovado','2025-09-30 10:00:00',139.90),(10,10,'Crédito','Aprovado','2025-11-28 18:30:00',119.88),(11,11,'Débito','Aprovado','2025-11-10 15:22:00',89.85),(12,12,'Boleto','Aprovado','2025-03-15 17:05:00',44.91),(13,13,'PIX','Aprovado','2025-10-01 08:59:00',79.90);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `data_pedido` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `id_evento` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento_especial` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2025-12-25',159.92,1),(2,1,'2025-07-10',89.90,NULL),(3,1,'2025-05-11',72.42,2),(4,2,'2025-11-28',209.97,3),(5,2,'2025-03-15',107.91,4),(6,3,'2025-12-25',239.85,1),(7,4,'2025-07-08',899.90,NULL),(8,4,'2025-07-08',499.90,NULL),(9,4,'2025-09-30',139.90,5),(10,4,'2025-11-28',119.88,3),(11,5,'2025-11-10',89.85,5),(12,5,'2025-03-15',44.91,4),(13,6,'2025-10-01',79.90,NULL),(14,1,'2025-06-15',150.00,NULL),(15,5,'2025-05-20',150.00,NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_cliente`
--

DROP TABLE IF EXISTS `perfil_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_cliente` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `nome_perfil` varchar(50) NOT NULL,
  `gasto_minimo` decimal(10,2) NOT NULL,
  `gasto_maximo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_cliente`
--

LOCK TABLES `perfil_cliente` WRITE;
/*!40000 ALTER TABLE `perfil_cliente` DISABLE KEYS */;
INSERT INTO `perfil_cliente` VALUES (1,'Conservador',0.00,199.99),(2,'Moderado',200.00,1000.00),(3,'Arrojado',1000.01,9999999.99);
/*!40000 ALTER TABLE `perfil_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int DEFAULT '0',
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Fone Bluetooth','Fone sem fio com cancelamento de ruído',199.90,50,1),(2,'Carregador Turbo','Carregador rápido USB-C 30W',89.90,80,1),(3,'Camiseta Básica','Camiseta de algodão unissex',39.90,100,2),(4,'Jaqueta Jeans','Jaqueta casual estilo urbano',159.90,30,2),(5,'O Hobbit','Livro de fantasia de J.R.R. Tolkien',49.90,70,3),(6,'Clean Code','Guia de boas práticas em programação',99.90,40,3),(7,'Perfume Floral','Fragrância feminina com notas doces',129.90,25,4),(8,'Creme Facial','Hidratante com proteção solar FPS 30',59.90,60,4),(9,'Bola de Futebol','Bola oficial tamanho 5',79.90,45,5),(10,'Luvas de Academia','Luvas para treino com proteção',39.90,70,5),(11,'Cadeira Gamer','Cadeira ergonômica com ajuste de altura',899.90,15,6),(12,'Mesa de Escritório','Mesa com tampo de madeira e estrutura metálica',499.90,10,6);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `AtualizarPerfisClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AtualizarPerfisClientes`()
BEGIN
    UPDATE cliente c
    JOIN (
        SELECT 
            p.id_cliente,
            SUM(p.valor_total) AS total_gasto
        FROM pedido p
        GROUP BY p.id_cliente
    ) gastos ON c.id_cliente = gastos.id_cliente
    JOIN perfil_cliente pc 
      ON gastos.total_gasto BETWEEN pc.gasto_minimo AND pc.gasto_maximo
    SET c.id_perfil = pc.id_perfil;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 21:05:30
