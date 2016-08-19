-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: professor_stats
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `week` int(11) DEFAULT NULL,
  `season_year` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `run_date` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES (1,1,2016,'WAITING','2016-08-19 00:00:00','2016-08-08 00:00:00','2016-08-19 13:44:24');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leagues` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `league_name` varchar(255) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `leagues_team_id_fkey` (`team_id`),
  CONSTRAINT `leagues_team_id_fkey` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'Northern Nightmare','2015-05-05 00:00:00','2015-05-05 00:00:00',1),(2,'Loser LEague','2015-05-05 00:00:00','2015-05-05 00:00:00',2);
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_projections`
--

DROP TABLE IF EXISTS `player_projections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_projections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `week` int(11) DEFAULT NULL,
  `season_year` int(11) DEFAULT NULL,
  `rush_yards` int(11) DEFAULT NULL,
  `player_id` bigint(20) unsigned DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `player_projections_player_id_fkey` (`player_id`),
  CONSTRAINT `player_projections_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_projections`
--

LOCK TABLES `player_projections` WRITE;
/*!40000 ALTER TABLE `player_projections` DISABLE KEYS */;
INSERT INTO `player_projections` VALUES (1,1,2016,100,1,'2016-05-05 00:00:00','2016-05-05 00:00:00'),(2,1,2016,10,2,'2016-05-05 00:00:00','2016-05-05 00:00:00');
/*!40000 ALTER TABLE `player_projections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `team` varchar(255) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Adrian','Peterson','RB','MIN','2015-05-05 00:00:00','2015-05-05 00:00:00'),(2,'Rob','Gronkowski','TE','NE','2015-05-05 00:00:00','2015-05-05 00:00:00');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` bigint(20) NOT NULL,
  `inserted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES (20160506152634,'2016-08-11 19:07:59'),(20160511174224,'2016-08-11 19:07:59'),(20160602191917,'2016-08-11 19:07:59'),(20160617183607,'2016-08-11 19:07:59');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoring_settings`
--

DROP TABLE IF EXISTS `scoring_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scoring_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `points_for` int(11) DEFAULT NULL,
  `required_per` int(11) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `league_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `scoring_settings_league_id_fkey` (`league_id`),
  CONSTRAINT `scoring_settings_league_id_fkey` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoring_settings`
--

LOCK TABLES `scoring_settings` WRITE;
/*!40000 ALTER TABLE `scoring_settings` DISABLE KEYS */;
INSERT INTO `scoring_settings` VALUES (1,'RB','rush_yards',1,20,'2016-05-05 00:00:00','2015-05-05 00:00:00',1),(2,'RB','rush_yards',5,100,'2016-05-05 00:00:00','2016-05-05 00:00:00',1),(3,'RB','rush_yards',1,100,'2016-05-05 00:00:00','2015-05-05 00:00:00',2),(4,'TE','rush_yards',1,10,'2016-05-05 00:00:00','2016-05-05 00:00:00',1),(5,'TE','rush_yards',1,10,'2016-05-05 00:00:00','2016-05-05 00:00:00',2);
/*!40000 ALTER TABLE `scoring_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_players`
--

DROP TABLE IF EXISTS `team_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_players` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  `player_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `team_players_team_id_fkey` (`team_id`),
  KEY `team_players_player_id_fkey` (`player_id`),
  CONSTRAINT `team_players_player_id_fkey` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `team_players_team_id_fkey` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_players`
--

LOCK TABLES `team_players` WRITE;
/*!40000 ALTER TABLE `team_players` DISABLE KEYS */;
INSERT INTO `team_players` VALUES (1,'2015-05-05 00:00:00','2015-05-05 00:00:00',1,1),(2,'2015-05-05 00:00:00','2015-05-05 00:00:00',2,1),(3,'2015-05-05 00:00:00','2015-05-05 00:00:00',1,2),(4,'2015-05-05 00:00:00','2015-05-05 00:00:00',2,2);
/*!40000 ALTER TABLE `team_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Jake n Bake','jacob.hafdahl@gmail.com','2015-05-05 00:00:00','2015-05-05 00:00:00'),(2,'Phils Pansies','p.callister@sportradar.com','2015-05-05 00:00:00','2015-05-05 00:00:00');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-19  8:50:50
