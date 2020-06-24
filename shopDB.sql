-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopdb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClients` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(64) DEFAULT NULL,
  `client_surname` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `adress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClients`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Jakub','Tołściuk','lmao@gmail.com','Poznań, Pogodna 5'),(2,'Marek','Kowalski','adsf@gmail.com','Wrocław, Ziemniaczana 3'),(3,'Tomasz','Kowal','TomaszKowal@gmail.com','Kraków, Akcyzowa 2'),(4,'Karol','Jakubowicz','KJakubowicz@gmail.com','Warszawa, Mokotowska 2'),(5,'Marcin','Chrzanowski','adsfdfg@gmail.com','Gdańsk, Lustrzana 2');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clients_and_their_orders`
--

DROP TABLE IF EXISTS `clients_and_their_orders`;
/*!50001 DROP VIEW IF EXISTS `clients_and_their_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clients_and_their_orders` AS SELECT 
 1 AS `order_status`,
 1 AS `idClients`,
 1 AS `client_surname`,
 1 AS `product_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `deliverytest`
--

DROP TABLE IF EXISTS `deliverytest`;
/*!50001 DROP VIEW IF EXISTS `deliverytest`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deliverytest` AS SELECT 
 1 AS `idOrders`,
 1 AS `estimated_delivery(idOrders)`,
 1 AS `product_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderators` (
  `idModerators` int NOT NULL AUTO_INCREMENT,
  `moderator_name` varchar(45) DEFAULT NULL,
  `moderator_surname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idModerators`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderators`
--

LOCK TABLES `moderators` WRITE;
/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
INSERT INTO `moderators` VALUES (1,'Jakub','Kowlaski','JakubKowalski@gmail.com'),(2,'Jakub','Maly','JakubMaly@gmail.com'),(3,'Marek','Duzy','swietnyemail@gmail.com'),(4,'Marcin','Taranek','eadfsafs@gmail.com'),(5,'Janek','Banek','xdxxddx@gmail.com');
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL,
  `order_status` enum('product send','preparing to send','waiting for payment') DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `Clients_idClients` int NOT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `fk_Orders_Clients1_idx` (`Clients_idClients`),
  CONSTRAINT `fk_Orders_Clients1` FOREIGN KEY (`Clients_idClients`) REFERENCES `clients` (`idClients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'product send','2017-11-05 00:00:00',1),(2,'product send','2016-12-04 00:00:00',2),(3,'preparing to send','2019-10-27 13:27:40',3),(4,'waiting for payment','2020-01-13 15:30:21',4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_and_opinion_about_it`
--

DROP TABLE IF EXISTS `product_and_opinion_about_it`;
/*!50001 DROP VIEW IF EXISTS `product_and_opinion_about_it`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_and_opinion_about_it` AS SELECT 
 1 AS `Product name`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idProducts` int NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_status` enum('avaible','ordered') DEFAULT NULL,
  `Sellers_idSellers` int NOT NULL,
  `Orders_idOrders` int DEFAULT NULL,
  PRIMARY KEY (`idProducts`),
  KEY `fk_Products_Sellers1_idx` (`Sellers_idSellers`),
  KEY `fk_Products_Orders1_idx` (`Orders_idOrders`),
  CONSTRAINT `fk_Products_Orders1` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`),
  CONSTRAINT `fk_Products_Sellers1` FOREIGN KEY (`Sellers_idSellers`) REFERENCES `sellers` (`idSellers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Router CI270',10.20,'ordered',1,1),(2,'GPS module',20.31,'ordered',2,2),(3,'Wires (20)',70.02,'avaible',4,3),(4,'Pendrive 64GB',40.27,'avaible',3,4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_reviews`
--

DROP TABLE IF EXISTS `products_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_reviews` (
  `idProducts_reviews` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `Products_idProducts` int NOT NULL,
  `Clients_idClients` int NOT NULL,
  PRIMARY KEY (`idProducts_reviews`),
  KEY `fk_Products_reviews_Products1_idx` (`Products_idProducts`),
  KEY `fk_Products_reviews_Clients1_idx` (`Clients_idClients`),
  CONSTRAINT `fk_Products_reviews_Clients1` FOREIGN KEY (`Clients_idClients`) REFERENCES `clients` (`idClients`),
  CONSTRAINT `fk_Products_reviews_Products1` FOREIGN KEY (`Products_idProducts`) REFERENCES `products` (`idProducts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_reviews`
--

LOCK TABLES `products_reviews` WRITE;
/*!40000 ALTER TABLE `products_reviews` DISABLE KEYS */;
INSERT INTO `products_reviews` VALUES (1,'Very good product. I am happy now.','5',2,4),(2,'Fine enough.','3',1,3);
/*!40000 ALTER TABLE `products_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `idSellers` int NOT NULL,
  `seller_name` varchar(45) DEFAULT NULL,
  `seller_surname` varchar(45) DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idSellers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Jakub','Kowalski','Google'),(2,'Tomasz','Kowal','IBM'),(3,'Marek','Makowski','Amazon'),(4,'Afrodyta','Toczkowska','Cisco Systems');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers_reviews`
--

DROP TABLE IF EXISTS `sellers_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers_reviews` (
  `idSellers_reviews` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `Sellers_idSellers` int NOT NULL,
  `Clients_idClients` int NOT NULL,
  PRIMARY KEY (`idSellers_reviews`),
  UNIQUE KEY `idSellers_reviews_UNIQUE` (`idSellers_reviews`),
  KEY `fk_Sellers_reviews_Sellers_idx` (`Sellers_idSellers`),
  KEY `fk_Sellers_reviews_Clients1_idx` (`Clients_idClients`),
  CONSTRAINT `fk_Sellers_reviews_Clients1` FOREIGN KEY (`Clients_idClients`) REFERENCES `clients` (`idClients`),
  CONSTRAINT `fk_Sellers_reviews_Sellers` FOREIGN KEY (`Sellers_idSellers`) REFERENCES `sellers` (`idSellers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers_reviews`
--

LOCK TABLES `sellers_reviews` WRITE;
/*!40000 ALTER TABLE `sellers_reviews` DISABLE KEYS */;
INSERT INTO `sellers_reviews` VALUES (1,'This man sells great products.','5',3,2),(2,'This man sells bad products.','1',2,4);
/*!40000 ALTER TABLE `sellers_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `show_all_clients`
--

DROP TABLE IF EXISTS `show_all_clients`;
/*!50001 DROP VIEW IF EXISTS `show_all_clients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_all_clients` AS SELECT 
 1 AS `client_name`,
 1 AS `client_surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `show_all_moderators`
--

DROP TABLE IF EXISTS `show_all_moderators`;
/*!50001 DROP VIEW IF EXISTS `show_all_moderators`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_all_moderators` AS SELECT 
 1 AS `moderator_name`,
 1 AS `moderator_surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `clients_and_their_orders`
--

/*!50001 DROP VIEW IF EXISTS `clients_and_their_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clients_and_their_orders` AS select `orders`.`order_status` AS `order_status`,`clients`.`idClients` AS `idClients`,`clients`.`client_surname` AS `client_surname`,`products`.`product_name` AS `product_name` from ((`orders` join `clients` on((`orders`.`Clients_idClients` = `clients`.`idClients`))) join `products` on((`products`.`Orders_idOrders` = `orders`.`idOrders`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `deliverytest`
--

/*!50001 DROP VIEW IF EXISTS `deliverytest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `deliverytest` AS select `orders`.`idOrders` AS `idOrders`,`estimated_delivery`(`orders`.`idOrders`) AS `estimated_delivery(idOrders)`,`products`.`product_name` AS `product_name` from (`orders` join `products` on((`products`.`Orders_idOrders` = `orders`.`idOrders`))) where (`orders`.`order_status` = 'product send') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_and_opinion_about_it`
--

/*!50001 DROP VIEW IF EXISTS `product_and_opinion_about_it`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_and_opinion_about_it` AS select `products`.`product_name` AS `Product name`,`products_reviews`.`description` AS `Description` from (`products_reviews` join `products` on((`products`.`idProducts` = `products_reviews`.`Products_idProducts`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_all_clients`
--

/*!50001 DROP VIEW IF EXISTS `show_all_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_all_clients` AS select `clients`.`client_name` AS `client_name`,`clients`.`client_surname` AS `client_surname` from `clients` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_all_moderators`
--

/*!50001 DROP VIEW IF EXISTS `show_all_moderators`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_all_moderators` AS select `moderators`.`moderator_name` AS `moderator_name`,`moderators`.`moderator_surname` AS `moderator_surname` from `moderators` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-29 23:03:21
