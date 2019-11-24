-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.30-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5684
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for flask_blog
DROP DATABASE IF EXISTS `flask_blog`;
CREATE DATABASE IF NOT EXISTS `flask_blog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `flask_blog`;

-- Dumping structure for table flask_blog.alembic_version
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE IF NOT EXISTS `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table flask_blog.alembic_version: ~1 rows (approximately)
DELETE FROM `alembic_version`;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` (`version_num`) VALUES
	('2dac09069aec');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;

-- Dumping structure for table flask_blog.post
DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(140) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_post_timestamp` (`timestamp`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table flask_blog.post: ~0 rows (approximately)
DELETE FROM `post`;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `body`, `timestamp`, `user_id`) VALUES
	(1, 'Hello world, this is great', '2019-11-24 19:26:11', 1),
	(2, 'Praesent ut ligula non mgi', '2019-11-24 19:32:25', 1),
	(3, 'Etiam feugiat lorem non metus. Nullam quis ante. In consectetuer turpis ut velit. Cras non dolor. Phasellus ullamcorper ipsum rutrum nunc.', '2019-11-24 19:32:25', 1),
	(4, 'Morbi nec metus. Aenean viverra rhoncus pede. Donec sodales sagittis magna.', '2019-11-24 19:32:25', 2),
	(5, 'Suspendisse enim turpis dictum sed', '2019-11-24 19:32:25', 2),
	(6, 'Morbi mollis tellus ac sapien', '2019-11-24 19:32:25', 2),
	(7, 'Phasellus nec sem in justo', '2019-11-24 19:32:25', 2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table flask_blog.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password_hash` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_user_email` (`email`),
  UNIQUE KEY `ix_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table flask_blog.user: ~0 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`) VALUES
	(1, 'namnvhue', 'namnvhue@gmail.com', 'pbkdf2:sha256:150000$1i2Zgat1$c0e49618a475d5f0b7abc444cb12552fe8162a98b475c11c26b72831f6d0e0ef'),
	(2, 'admin', 'alababi@gmail.com', 'pbkdf2:sha256:150000$1i2Zgat1$c0e49618a475d5f0b7abc444cb12552fe8162a98b475c11c26b72831f6d0e0ef');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
