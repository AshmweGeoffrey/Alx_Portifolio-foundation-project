-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: AX_STOCK_ALX_PROJECT
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.23.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` varchar(50) NOT NULL,
  `branch_name` varchar(16) NOT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('2','Branch A'),('3','Branch B'),('1','Main Branch');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` varchar(50) NOT NULL,
  `name` varchar(32) NOT NULL,
  `percentage` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('5','Books','5%'),('2','Clothing','15%'),('1','Electronics','20%'),('3','Furniture','25%'),('4','Sports','10%');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` varchar(50) NOT NULL,
  `name` varchar(64) NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `inventory_quantity` int NOT NULL DEFAULT '0',
  `incoming_time_stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `category_name` (`category_name`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`category_name`) REFERENCES `category` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('1','Laptop','Electronics',50,'2023-06-01 10:00:00'),('5','Novel','Books',200,'2023-06-05 11:20:00'),('2','Shirt','Clothing',100,'2023-06-02 14:30:00'),('3','Sofa','Furniture',20,'2023-06-03 09:15:00'),('4','Tennis Racket','Sports',75,'2023-06-04 16:45:00');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outgoing_stock`
--

DROP TABLE IF EXISTS `outgoing_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outgoing_stock` (
  `id` varchar(50) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `category_name` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `branch_name` varchar(16) DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_name` (`item_name`),
  KEY `category_name` (`category_name`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `outgoing_stock_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `inventory` (`name`),
  CONSTRAINT `outgoing_stock_ibfk_2` FOREIGN KEY (`category_name`) REFERENCES `category` (`name`),
  CONSTRAINT `outgoing_stock_ibfk_3` FOREIGN KEY (`user_name`) REFERENCES `user` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outgoing_stock`
--

LOCK TABLES `outgoing_stock` WRITE;
/*!40000 ALTER TABLE `outgoing_stock` DISABLE KEYS */;
INSERT INTO `outgoing_stock` VALUES ('1','Laptop','Electronics','Bob Johnson','Main Branch',10),('2','Shirt','Clothing','Bob Johnson','Branch A',25),('3','Sofa','Furniture','Bob Johnson','Branch B',5),('4','Tennis Racket','Sports','Bob Johnson','Main Branch',15),('5','Novel','Books','Bob Johnson','Branch A',50);
/*!40000 ALTER TABLE `outgoing_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_weekly`
--

DROP TABLE IF EXISTS `sale_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_weekly` (
  `id` varchar(50) NOT NULL,
  `item_name` varchar(64) DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` int NOT NULL DEFAULT '0',
  `user_name` varchar(32) DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  KEY `item_name` (`item_name`),
  CONSTRAINT `sale_weekly_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`name`),
  CONSTRAINT `sale_weekly_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `inventory` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_weekly`
--

LOCK TABLES `sale_weekly` WRITE;
/*!40000 ALTER TABLE `sale_weekly` DISABLE KEYS */;
INSERT INTO `sale_weekly` VALUES ('1','Laptop',8,1000,'Jane Smith','2023-06-06 08:30:00'),('2','Shirt',20,30,'Jane Smith','2023-06-07 10:15:00'),('3','Sofa',3,500,'Jane Smith','2023-06-08 14:00:00'),('4','Tennis Racket',10,80,'Jane Smith','2023-06-09 16:45:00'),('5','Novel',40,15,'Jane Smith','2023-06-10 11:20:00');
/*!40000 ALTER TABLE `sale_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `access_control` varchar(32) DEFAULT NULL,
  `email` varchar(32) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('3','Bob Johnson','password789','inventory','bob.johnson@example.com'),('2','Jane Smith','password456','sales','jane.smith@example.com'),('1','John Doe','password123','admin','john.doe@example.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10  1:02:07
