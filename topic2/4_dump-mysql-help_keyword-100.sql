-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.17
/*
CREATED via command in CMD (not in MySQL>)
	mysqldump -u root -p mysql help_keyword --where="true limit 100" > D:/Cloud/Git/geekbrains-db/topic2/4_dump-mysql-help_keyword-100.sql
*/
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
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--
-- WHERE:  true limit 100

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (224,'(JSON'),(225,'->'),(227,'->>'),(46,'<>'),(616,'ACCOUNT'),(413,'ACTION'),(40,'ADD'),(637,'ADMIN'),(107,'AES_DECRYPT'),(108,'AES_ENCRYPT'),(332,'AFTER'),(95,'AGAINST'),(659,'AGGREGATE'),(333,'ALGORITHM'),(479,'ALL'),(41,'ALTER'),(334,'ANALYZE'),(50,'AND'),(302,'ANY_VALUE'),(414,'ARCHIVE'),(480,'AS'),(255,'ASC'),(395,'AT'),(504,'AUTOCOMMIT'),(438,'AUTOEXTEND_SIZE'),(335,'AUTO_INCREMENT'),(336,'AVG_ROW_LENGTH'),(518,'BACKUP'),(532,'BEFORE'),(505,'BEGIN'),(51,'BETWEEN'),(72,'BIGINT'),(103,'BINARY'),(687,'BINLOG'),(303,'BIN_TO_UUID'),(8,'BOOL'),(9,'BOOLEAN'),(62,'BOTH'),(399,'BTREE'),(256,'BY'),(33,'BYTE'),(695,'CACHE'),(446,'CALL'),(279,'CAN_ACCESS_COLUMN'),(280,'CAN_ACCESS_DATABASE'),(281,'CAN_ACCESS_TABLE'),(282,'CAN_ACCESS_VIEW'),(415,'CASCADE'),(53,'CASE'),(596,'CATALOG_NAME'),(75,'CEIL'),(76,'CEILING'),(506,'CHAIN'),(337,'CHANGE'),(538,'CHANNEL'),(34,'CHAR'),(30,'CHARACTER'),(670,'CHARSET'),(338,'CHECK'),(339,'CHECKSUM'),(617,'CIPHER'),(597,'CLASS_ORIGIN'),(638,'CLIENT'),(452,'CLOSE'),(340,'COALESCE'),(690,'CODE'),(307,'COLLATE'),(672,'COLLATION'),(341,'COLUMN'),(342,'COLUMNS'),(598,'COLUMN_NAME'),(312,'COMMENT'),(507,'COMMIT'),(521,'COMMITTED'),(416,'COMPACT'),(313,'COMPLETION'),(663,'COMPONENT'),(417,'COMPRESSED'),(343,'COMPRESSION'),(466,'CONCURRENT'),(593,'CONDITION'),(344,'CONNECTION'),(508,'CONSISTENT'),(345,'CONSTRAINT'),(599,'CONSTRAINT_CATALOG'),(600,'CONSTRAINT_NAME'),(601,'CONSTRAINT_SCHEMA'),(594,'CONTINUE'),(102,'CONVERT'),(254,'COUNT'),(42,'CREATE'),(252,'CREATE_DH_PARAMETERS'),(497,'CROSS'),(418,'CSV'),(264,'CUME_DIST'),(618,'CURRENT'),(115,'CURRENT_ROLE'),(314,'CURRENT_USER'),(591,'CURSOR'),(602,'CURSOR_NAME');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-13 11:21:21
