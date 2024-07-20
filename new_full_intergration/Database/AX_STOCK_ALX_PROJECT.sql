-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: AX_STOCK_ALX_PROJECT
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.23.10.2

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
INSERT INTO `category` VALUES ('5','Books','14.29%'),('2','Clothing','15.92%'),('1','Electronics','100.00%'),('3','Furniture','15.65%'),('4','Sports','63.16%');
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
INSERT INTO `inventory` VALUES ('e13e8023-e98a-47ef-9da1-3e257ed8125f','balls','Sports',24,'2024-06-14 18:34:15'),('91aa3f4c-2959-4231-8b5c-1b6e4f5b1b53','check1','Books',-14,'2024-06-12 22:58:02'),('66fc095e-5e3d-4bb0-97d4-009df2af3120','check10','Clothing',10,'2024-06-12 23:02:01'),('2f1a7560-2e71-45eb-87a2-910608d5ae97','check100','Books',59,'2024-06-14 12:48:32'),('2df33315-70d4-4b29-b449-fce0ffeaf6f4','check101','Clothing',20,'2024-06-14 12:48:46'),('3dbcd0e7-4541-4c67-8769-f07fcb813f49','check19','Clothing',12,'2024-06-12 23:02:08'),('1a38d546-b37a-472a-986f-7836222cd7e6','check2','Clothing',8,'2024-06-12 22:59:34'),('aa8eadf5-7adc-48eb-876d-efa19e7aa20c','check2000','Sports',100,'2024-06-15 18:26:02'),('f03d9f24-7bab-4d09-8d56-f9eccf85ca36','check3','Sports',5,'2024-06-12 23:00:33'),('3143568c-2e4a-46ee-9492-cfd909a81235','check4','Electronics',123,'2024-06-12 23:01:11'),('6b664b56-0397-4840-9b6a-16c0d77fac20','check40','Clothing',10,'2024-06-12 23:02:13'),('9125c60a-ace3-4853-8719-e34ce85b8f7f','check5','Electronics',23,'2024-06-12 23:01:21'),('7a7f8ce1-c604-469f-a801-bd032949a1a1','check85645','Books',2,'2024-06-12 23:40:32'),('5d3aa5cb-535e-437f-a7c0-1224a0bfd521','check9','Clothing',12,'2024-06-12 23:01:56'),('ba62898c-f1e5-4550-9786-128ff46e14e6','Godio Brand New','Sports',0,'2024-07-17 19:39:21'),('ef3434ed-34d8-4a1f-8655-e5cfb92e6983','godio small','Sports',42,'2024-06-14 19:09:23'),('a4bc9d16-57db-4e43-b0a4-bec8f23d1430','hj','Books',24,'2024-06-15 00:59:20'),('d4f77aa2-3119-4799-bd07-f4f79b4e84e3','hjsfns','Books',12,'2024-06-15 01:03:36'),('123','igihe','Books',4,'2024-06-12 22:32:23'),('1','Laptop','Electronics',-115,'2023-06-01 10:00:00'),('5','Novel','Books',198,'2023-06-05 11:20:00'),('2','Shirt','Clothing',-1,'2023-06-02 14:30:00'),('3b66f09b-8fbe-4fe5-8b73-c8fba89d7555','soap','Electronics',0,'2024-07-16 09:05:29'),('3','Sofa','Furniture',0,'2023-06-03 09:15:00'),('4','Tennis Racket','Sports',75,'2023-06-04 16:45:00');
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
  `time_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_name` (`item_name`),
  KEY `category_name` (`category_name`),
  KEY `user_name` (`user_name`),
  KEY `fk_outgoing_stock_branch_name` (`branch_name`),
  CONSTRAINT `fk_outgoing_stock_branch_name` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`),
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
INSERT INTO `outgoing_stock` VALUES ('0137a2d1-82df-4598-b8b2-eda6be277036','Laptop','Electronics',NULL,NULL,2,'2024-06-13 16:19:43'),('0d438d86-7043-4656-a929-de21124823fa','check100','Books','muvunyi','Branch A',9,'2024-06-15 00:54:07'),('1','Laptop','Electronics','Bob Johnson','Main Branch',10,'2024-06-13 14:35:37'),('151c4373-ef24-4722-9b25-db1e99586ee8','check10','Clothing','Bob Johnson','Branch A',1,'2024-06-13 14:35:37'),('2','Shirt','Clothing','Bob Johnson','Branch A',25,'2024-06-13 14:35:37'),('214b25a8-47a6-4adb-94b6-581a2de61712','check100','Books','muvunyi','Branch B',1,'2024-06-15 00:39:24'),('3','Sofa','Furniture','Bob Johnson','Branch B',5,'2024-06-13 14:35:37'),('3ea831da-9543-4572-a11e-f9c604b6cb3a','check10','Clothing','Bob Johnson',NULL,1,'2024-06-13 14:35:37'),('4','Tennis Racket','Sports','Bob Johnson','Main Branch',15,'2024-06-13 14:35:37'),('4abb3bbe-0571-49ac-9a0e-ebbad2249c4c','Shirt','Clothing','muvunyi','Branch A',1,'2024-06-15 00:23:00'),('5','Novel','Books','Bob Johnson','Branch A',50,'2024-06-13 14:35:37'),('5dbc84b3-5d2b-4017-913f-fe5e260cf214','soap','Electronics','muvunyi','Branch A',23,'2024-07-17 19:40:26'),('5e475926-724d-4b86-b589-524dea7d5ff9','check100','Books','muvunyi','Branch A',9,'2024-06-15 00:54:09'),('5ffdf2ef-2f68-447a-b160-4cf58159068f','Laptop','Electronics',NULL,'Branch A',6,'2024-06-14 12:25:54'),('603b4df3-5b0c-44d8-8d56-82989a26d4cb','Laptop','Electronics',NULL,NULL,2,'2024-06-13 16:20:15'),('6aa6865f-2401-4ced-a884-9e4217905c39','Laptop','Electronics',NULL,NULL,2,'2024-06-13 16:20:48'),('73e8dcc5-6ab2-4da2-9427-b02fdeeac22d','check100','Books','muvunyi','Branch B',1,'2024-06-15 00:43:13'),('745c4e11-5b94-4f96-a3b2-14a4783039a7','check100','Books','muvunyi','Branch A',9,'2024-06-15 00:54:08'),('7c3819c3-f373-4787-a183-489f8bce06a6','Laptop','Electronics',NULL,'Branch A',6,'2024-06-14 12:31:13'),('81f4bad0-c21e-47d9-871a-00f85e0a1b32','Shirt','Clothing','John Doe','Main Branch',80,'2024-06-14 15:41:37'),('8a8414e5-56f3-46b4-95bd-f3e9d32696cd','check10','Clothing','Bob Johnson',NULL,1,'2024-06-13 14:35:37'),('91f32a91-0803-49aa-a8c8-7ad574eb6137','check100','Books','muvunyi','Branch B',1,'2024-06-15 00:43:16'),('95131cb6-a98a-4c3d-bae4-6551202de583','Laptop','Electronics','muvunyi','Branch A',1,'2024-06-15 00:52:33'),('a9775500-bc81-4686-ab6d-b0d2c2e68a4a','check1','Books','muvunyi','Branch A',1,'2024-06-15 01:04:06'),('ac27a671-3c89-49a0-842b-d87acc48c02f','Laptop','Electronics',NULL,NULL,2,'2024-06-13 16:30:17'),('c5da5bf5-e64a-4dd0-982e-e0656e859b01','Laptop','Electronics',NULL,'Branch A',1,'2024-06-14 12:30:08'),('c6fe3ced-3f69-49e7-87cf-c2597d7322aa','Laptop','Electronics','Jane Smith','Branch A',9,'2024-06-14 12:43:05'),('c711da00-3df6-4d47-8385-d068bbdef763','check100','Books','John Doe','Main Branch',10,'2024-06-14 18:32:19'),('cadaf64b-1fcd-44f0-8e82-d35eefb1a09d','check1','Books','muvunyi','Branch A',1,'2024-06-15 00:57:37'),('f0f64958-2389-4312-af15-73d4014d091b','Novel','Books',NULL,'Branch A',2,'2024-06-14 12:01:33'),('f3620dca-4177-414b-bbda-e22dc440f468','check100','Books','muvunyi','Branch B',1,'2024-06-15 00:39:40'),('f413a8f2-4e47-46e9-a3c8-c5c08e418edb','Laptop','Electronics','John Doe','Main Branch',10,'2024-06-14 15:21:49'),('fc39ae2e-bf53-4c54-a46d-467c15a674b8','Laptop','Electronics','muvunyi','Branch A',1,'2024-06-15 00:20:06'),('ffe8b7b5-0c7e-42da-8fa2-6da5578b069f','Laptop','Electronics','muvunyi','Branch A',1,'2024-06-15 00:21:01');
/*!40000 ALTER TABLE `outgoing_stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_outgoing_stock` BEFORE INSERT ON `outgoing_stock` FOR EACH ROW BEGIN
    IF NEW.category_name IS NULL THEN
        SET NEW.category_name = (
            SELECT category_name
            FROM inventory
            WHERE name = NEW.item_name
            LIMIT 1
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_inventory_on_insert` AFTER INSERT ON `outgoing_stock` FOR EACH ROW BEGIN
    
    UPDATE inventory i
    SET i.inventory_quantity = i.inventory_quantity - NEW.quantity
    WHERE i.name = NEW.item_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `payment_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `total_weekly` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES ('PM003','Cash',405000),('PM001','Mobile Money',5000),('PM002','Pos',10500);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remark`
--

DROP TABLE IF EXISTS `remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remark` (
  `id` varchar(50) NOT NULL,
  `time_stamp` datetime NOT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remark`
--

LOCK TABLES `remark` WRITE;
/*!40000 ALTER TABLE `remark` DISABLE KEYS */;
INSERT INTO `remark` VALUES ('384535a6-fbbf-4e01-9de6-e76d52845bc5','2024-07-18 23:35:31','debt to csk manager\r\n109092043 '),('67bdf8bf-e4de-491b-827e-0e6cb36ac31b','2024-07-18 23:40:55','debt : kuri 10,000 repay on 15000'),('ac3a7f46-3773-4981-b997-c829958a4c73','2024-07-18 22:32:56','vefneuifneiwfne'),('b381cc01-bd91-4823-a153-4e55eec081dd','2024-07-18 22:32:59','vefneuifneiwfne');
/*!40000 ALTER TABLE `remark` ENABLE KEYS */;
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
  `category` varchar(32) DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` int NOT NULL DEFAULT '0',
  `user_name` varchar(32) DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  KEY `item_name` (`item_name`),
  KEY `fk_sale_weekly_category` (`category`),
  KEY `fk_sale_weekly_payment_method` (`payment_method`),
  CONSTRAINT `fk_sale_weekly_category` FOREIGN KEY (`category`) REFERENCES `inventory` (`category_name`),
  CONSTRAINT `fk_sale_weekly_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_method` (`name`),
  CONSTRAINT `sale_weekly_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`name`),
  CONSTRAINT `sale_weekly_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `inventory` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_weekly`
--

LOCK TABLES `sale_weekly` WRITE;
/*!40000 ALTER TABLE `sale_weekly` DISABLE KEYS */;
INSERT INTO `sale_weekly` VALUES ('4762a661-00ba-4b22-a722-a7476d861d70','Laptop','Electronics',12,5000,'muvunyi','2024-07-16 09:06:31','Mobile Money'),('b1538fb8-0d45-4e90-ae1c-fa071f614181','check100','Books',2,5000,'muvunyi','2024-07-16 09:36:53','Cash'),('f3a47596-e76e-4e98-90f6-8581e7d23582','Godio Brand New','Sports',24,400000,'muvunyi','2024-07-17 19:40:01','Cash');
/*!40000 ALTER TABLE `sale_weekly` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_category_from_inventory` BEFORE INSERT ON `sale_weekly` FOR EACH ROW BEGIN
    DECLARE category_name VARCHAR(32);
    
    SELECT i.category_name INTO category_name
    FROM inventory i
    WHERE i.name = NEW.item_name;
    
    IF category_name IS NOT NULL THEN
        SET NEW.category = category_name;
    ELSE
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Item not found in inventory table';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_category_percentage` AFTER INSERT ON `sale_weekly` FOR EACH ROW BEGIN
    DECLARE total_quantity INT;
    DECLARE category_quantity INT;

    
    SELECT SUM(quantity) INTO total_quantity
    FROM sale_weekly;

    
    SELECT SUM(quantity) INTO category_quantity
    FROM sale_weekly
    WHERE category = NEW.category;

    
    UPDATE category c
    SET c.percentage = CONCAT(ROUND((category_quantity * 100.0 / total_quantity), 2), '%')
    WHERE c.name = NEW.category;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_inventory_quantity` AFTER INSERT ON `sale_weekly` FOR EACH ROW BEGIN
    UPDATE inventory i
    SET i.inventory_quantity = i.inventory_quantity - NEW.quantity
    WHERE i.name = NEW.item_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_total_weekly_after_insert` AFTER INSERT ON `sale_weekly` FOR EACH ROW BEGIN
    
    UPDATE payment_method pm
    SET pm.total_weekly = (
        SELECT SUM(price)
        FROM sale_weekly
        WHERE payment_method = NEW.payment_method
    )
    WHERE pm.name = NEW.payment_method;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `user` VALUES ('3','Bob Johnson','password789','inventory','bob.johnson@example.com'),('2','Jane Smith','password456','sales','jane.smith@example.com'),('1','John Doe','password123','admin','john.doe@example.com'),('4','muvunyi','jimmy','sale','muvunyi@gmail.com');
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

-- Dump completed on 2024-07-19 12:28:25
