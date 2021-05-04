/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.10-MariaDB : Database - mydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `mydb`;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `barang` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `test` */

insert  into `test`(`id`,`barang`,`tanggal`) values 
(1,'brg1','2021-05-01'),
(2,'brg2','2021-05-01'),
(3,'brg3','2021-05-02'),
(4,'brg4','2021-05-04'),
(5,'brg4','2021-05-04');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
