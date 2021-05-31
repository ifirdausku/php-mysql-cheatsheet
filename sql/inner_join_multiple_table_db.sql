/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.10-MariaDB : Database - phpapidb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`phpapidb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `phpapidb`;

/*Table structure for table `bahan` */

DROP TABLE IF EXISTS `bahan`;

CREATE TABLE `bahan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_bahan` varchar(10) NOT NULL,
  `nama_bahan` varchar(50) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `awal` decimal(10,0) NOT NULL,
  `qty` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `bahan` */

insert  into `bahan`(`id`,`kode_bahan`,`nama_bahan`,`satuan`,`awal`,`qty`) values 
(1,'0000000001','BAHAN 1','MTR',10,0),
(2,'0000000002','BAHAN 2','MTR',20,0),
(3,'0000000003','BAHAN 3','CM',30,0),
(4,'0000000004','BAHAN 4','CM',40,0),
(5,'0000000005','BAHAN 5','BIJI',50,0);

/*Table structure for table `keluar` */

DROP TABLE IF EXISTS `keluar`;

CREATE TABLE `keluar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_keluar` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_bahan` varchar(10) NOT NULL,
  `qty` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `keluar` */

insert  into `keluar`(`id`,`no_keluar`,`tanggal`,`kode_bahan`,`qty`) values 
(1,'A','2021-04-30','0000000001',1),
(2,'B','2021-04-30','0000000002',1),
(3,'C','2021-04-30','0000000003',1);

/*Table structure for table `masuk` */

DROP TABLE IF EXISTS `masuk`;

CREATE TABLE `masuk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_masuk` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_bahan` varchar(10) NOT NULL,
  `qty` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `masuk` */

insert  into `masuk`(`id`,`no_masuk`,`tanggal`,`kode_bahan`,`qty`) values 
(1,'A','2021-04-30','0000000001',9),
(2,'B','2021-04-30','0000000002',7),
(3,'C','2021-04-30','0000000003',5),
(4,'D','2021-04-30','0000000001',10),
(5,'E','2021-04-30','0000000002',10),
(6,'F','2021-04-30','0000000003',10);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
