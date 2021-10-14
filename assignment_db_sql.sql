-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for assignement
CREATE DATABASE IF NOT EXISTS `assignement` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `assignement`;

-- Dumping structure for table assignement.acedemic_infos
CREATE TABLE IF NOT EXISTS `acedemic_infos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned DEFAULT NULL,
  `school_name` varchar(100) DEFAULT NULL,
  `school_grade` varchar(50) DEFAULT NULL,
  `school_roll_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_acedemic` (`student_id`),
  CONSTRAINT `FK_users_acedemic` FOREIGN KEY (`student_id`) REFERENCES `users` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table assignement.acedemic_infos: ~4 rows (approximately)
/*!40000 ALTER TABLE `acedemic_infos` DISABLE KEYS */;
INSERT INTO `acedemic_infos` (`id`, `student_id`, `school_name`, `school_grade`, `school_roll_number`) VALUES
	(1, 1, 'School A', 'A', '789'),
	(2, 2, 'School b', 'B', '456'),
	(3, 3, 'School c', 'C', '123'),
	(4, 4, 'School D', 'D', '741');
/*!40000 ALTER TABLE `acedemic_infos` ENABLE KEYS */;

-- Dumping structure for table assignement.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `amount` varchar(50) DEFAULT '0',
  `tax` varchar(50) DEFAULT '0',
  `discount` varchar(50) DEFAULT '0',
  `net_amount` varchar(50) DEFAULT '0',
  PRIMARY KEY (`invoice_id`),
  KEY `FK_users_invoices` (`student_id`),
  CONSTRAINT `FK_users_invoices` FOREIGN KEY (`student_id`) REFERENCES `users` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table assignement.invoices: ~3 rows (approximately)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` (`invoice_id`, `student_id`, `issue_date`, `due_date`, `amount`, `tax`, `discount`, `net_amount`) VALUES
	(1, 2, '2021-01-05', '2021-01-15', '1000', '10', '10', '1000'),
	(2, 2, '2021-02-01', '2021-02-15', '500', '5', '5', '500'),
	(3, 4, '2021-02-01', '2021-02-15', '500', '5', '5', '500');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Dumping structure for table assignement.parents
CREATE TABLE IF NOT EXISTS `parents` (
  `parent_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) unsigned NOT NULL,
  `parent_firstname` varchar(100) DEFAULT NULL,
  `parent_lastname` varchar(100) DEFAULT NULL,
  `parent_phone` varchar(50) DEFAULT NULL,
  `parent_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`parent_id`),
  KEY `FK_parents_users` (`student_id`),
  CONSTRAINT `FK_parents_users` FOREIGN KEY (`student_id`) REFERENCES `users` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table assignement.parents: ~4 rows (approximately)
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` (`parent_id`, `student_id`, `parent_firstname`, `parent_lastname`, `parent_phone`, `parent_email`) VALUES
	(1, 1, 'Chandra', 'Prakash', '9999999999', 'chandra.prakash@gmail.com'),
	(2, 2, 'Tanuj', 'Virwani', '8888888888', 'tanuj.virwani@yahoo.com'),
	(3, 3, 'Nikhil', 'Sharma', '7777777777', 'nikhil.sharma@gmail.com'),
	(4, 4, 'Rohit', 'Jain', '2456789310', 'rohit.jain11@rediffmail.com');
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;

-- Dumping structure for table assignement.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` varchar(150) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FK__invoices` (`invoice_id`),
  CONSTRAINT `FK__invoices` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table assignement.payments: ~3 rows (approximately)
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`payment_id`, `invoice_id`, `payment_date`, `payment_amount`, `payment_mode`) VALUES
	(1, 1, '2021-01-05', '500', 'Cash'),
	(2, 1, '2021-01-10', '500', 'Cash'),
	(3, 2, '2021-02-05', '500', 'Cash');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

-- Dumping structure for table assignement.users
CREATE TABLE IF NOT EXISTS `users` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table assignement.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`student_id`, `firstname`, `lastname`, `phone`, `email`) VALUES
	(1, 'Himanshu', 'Vyas', '9876543210', 'himanshu@gmail.com'),
	(2, 'Akash', 'Vyas', '123456789', 'aakash@gmail.com'),
	(3, 'Anuj', 'Gupta', '8974563210', 'anuj.gupta@gmail.com'),
	(4, 'Deepak', 'Mehta', '8745632109', 'deepak.mehta@yahoo.co.in');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
