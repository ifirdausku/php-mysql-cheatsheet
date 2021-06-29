-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for phpapidb
DROP DATABASE IF EXISTS `phpapidb`;
CREATE DATABASE IF NOT EXISTS `phpapidb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `phpapidb`;

-- Dumping structure for table phpapidb.bahan
DROP TABLE IF EXISTS `bahan`;
CREATE TABLE IF NOT EXISTS `bahan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_bahan` varchar(10) NOT NULL,
  `nama_bahan` varchar(50) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `golongan` varchar(16) NOT NULL COMMENT 'ambil data dari tabel golongan',
  `gambar` varchar(32) NOT NULL COMMENT 'nama gambar sesuai dengan kode bahan waktu upload',
  `awal` decimal(10,2) NOT NULL,
  `username` varchar(16) NOT NULL,
  `disimpan` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_bahan` (`kode_bahan`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table phpapidb.bahan: 6 rows
/*!40000 ALTER TABLE `bahan` DISABLE KEYS */;
REPLACE INTO `bahan` (`id`, `kode_bahan`, `nama_bahan`, `satuan`, `golongan`, `gambar`, `awal`, `username`, `disimpan`) VALUES
	(1, '0000000001', 'BAHAN 1', 'MTR', 'A', '', 10.00, 'root', '2021-06-20 16:51:40'),
	(2, '0000000002', 'BAHAN 2', 'MTR', 'A', '', 20.00, 'root', '2021-06-20 16:51:40'),
	(3, '0000000003', 'BAHAN 3', 'CM', 'C', '', 30.00, 'root', '2021-06-20 16:51:40'),
	(4, '0000000004', 'BAHAN 4', 'CM', 'B', '', 40.00, 'root', '2021-06-20 16:51:40'),
	(5, '0000000005', 'BAHAN 5', 'BIJI', 'B', '', 50.00, 'root', '2021-06-20 16:51:40'),
	(6, '0000000006', 'BAHAN 6', 'CM', 'B', '', 60.00, 'root', '2021-06-20 16:51:40');
/*!40000 ALTER TABLE `bahan` ENABLE KEYS */;

-- Dumping structure for table phpapidb.bahan_golongan
DROP TABLE IF EXISTS `bahan_golongan`;
CREATE TABLE IF NOT EXISTS `bahan_golongan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `golongan` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table phpapidb.bahan_golongan: 3 rows
/*!40000 ALTER TABLE `bahan_golongan` DISABLE KEYS */;
REPLACE INTO `bahan_golongan` (`id`, `golongan`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');
/*!40000 ALTER TABLE `bahan_golongan` ENABLE KEYS */;

-- Dumping structure for view phpapidb.kartu_stok_bahan
DROP VIEW IF EXISTS `kartu_stok_bahan`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `kartu_stok_bahan` (
	`kode_bahan` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tanggal` DATE NOT NULL,
	`qty_masuk` DECIMAL(10,2) NOT NULL,
	`qty_keluar` DECIMAL(10,2) NOT NULL,
	`Balance` DECIMAL(33,2) NULL
) ENGINE=MyISAM;

-- Dumping structure for table phpapidb.keluar
DROP TABLE IF EXISTS `keluar`;
CREATE TABLE IF NOT EXISTS `keluar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_keluar` varchar(20) NOT NULL COMMENT 'nomor keluar formatnya K-TAHUNBULANNOMORKELUAR dari tabel nomor kolom keluar',
  `tanggal` date NOT NULL,
  `validasi` date NOT NULL COMMENT 'validasi user setelah di input',
  `username` varchar(16) NOT NULL,
  `disimpan` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table phpapidb.keluar: 4 rows
/*!40000 ALTER TABLE `keluar` DISABLE KEYS */;
REPLACE INTO `keluar` (`id`, `no_keluar`, `tanggal`, `validasi`, `username`, `disimpan`) VALUES
	(1, 'K-2021080001', '2021-08-01', '2021-08-02', '', '2021-06-20 17:29:40'),
	(2, 'K-2021080002', '2021-08-01', '2021-08-02', '', '2021-06-20 17:29:40'),
	(3, 'K-2021080003', '2021-08-02', '0000-00-00', '', '2021-06-20 17:29:40'),
	(4, 'K-2021080004', '2021-08-04', '0000-00-00', '', '2021-06-20 17:29:40');
/*!40000 ALTER TABLE `keluar` ENABLE KEYS */;

-- Dumping structure for table phpapidb.keluar_detail
DROP TABLE IF EXISTS `keluar_detail`;
CREATE TABLE IF NOT EXISTS `keluar_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_keluar` int(10) unsigned NOT NULL,
  `no_keluar` varchar(20) NOT NULL,
  `no` int(3) unsigned NOT NULL COMMENT 'nomor urut',
  `kode_bahan` varchar(10) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table phpapidb.keluar_detail: 4 rows
/*!40000 ALTER TABLE `keluar_detail` DISABLE KEYS */;
REPLACE INTO `keluar_detail` (`id`, `id_keluar`, `no_keluar`, `no`, `kode_bahan`, `qty`) VALUES
	(1, 1, 'K-2021080001', 1, '0000000001', 3.30),
	(2, 2, 'K-2021080002', 1, '0000000002', 6.00),
	(3, 3, 'K-2021080003', 1, '0000000003', 9.00),
	(4, 4, 'K-2021080004', 1, '0000000004', 1.50);
/*!40000 ALTER TABLE `keluar_detail` ENABLE KEYS */;

-- Dumping structure for table phpapidb.masuk
DROP TABLE IF EXISTS `masuk`;
CREATE TABLE IF NOT EXISTS `masuk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_masuk` varchar(20) NOT NULL COMMENT 'nomor masuk formatnya K-TAHUNBULANNOMORMASUK dari tabel nomor kolom masuk',
  `tanggal` date NOT NULL,
  `validasi` date NOT NULL COMMENT 'validasi user setelah di input',
  `username` varchar(16) NOT NULL,
  `disimpan` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table phpapidb.masuk: 6 rows
/*!40000 ALTER TABLE `masuk` DISABLE KEYS */;
REPLACE INTO `masuk` (`id`, `no_masuk`, `tanggal`, `validasi`, `username`, `disimpan`) VALUES
	(1, 'M-2021080001', '2021-08-01', '2021-08-01', '', '0000-00-00 00:00:00'),
	(2, 'M-2021080002', '2021-08-03', '2021-08-04', '', '0000-00-00 00:00:00'),
	(3, 'M-2021080003', '2021-08-05', '2021-08-06', '', '0000-00-00 00:00:00'),
	(4, 'M-2021080004', '2021-08-02', '0000-00-00', '', '0000-00-00 00:00:00'),
	(5, 'M-2021080005', '2021-08-04', '0000-00-00', '', '0000-00-00 00:00:00'),
	(6, 'M-2021080006', '2021-08-06', '0000-00-00', '', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `masuk` ENABLE KEYS */;

-- Dumping structure for table phpapidb.masuk_detail
DROP TABLE IF EXISTS `masuk_detail`;
CREATE TABLE IF NOT EXISTS `masuk_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_masuk` int(10) unsigned NOT NULL,
  `no_masuk` varchar(20) NOT NULL,
  `no` int(3) unsigned NOT NULL COMMENT 'nomor urut',
  `kode_bahan` varchar(10) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table phpapidb.masuk_detail: 6 rows
/*!40000 ALTER TABLE `masuk_detail` DISABLE KEYS */;
REPLACE INTO `masuk_detail` (`id`, `id_masuk`, `no_masuk`, `no`, `kode_bahan`, `qty`) VALUES
	(1, 1, 'M-2021080001', 1, '0000000001', 1.00),
	(2, 2, 'M-2021080002', 1, '0000000002', 2.00),
	(3, 3, 'M-2021080003', 1, '0000000003', 3.00),
	(4, 4, 'M-2021080004', 1, '0000000001', 4.00),
	(5, 5, 'M-2021080005', 1, '0000000002', 2.00),
	(6, 6, 'M-2021080006', 1, '0000000003', 3.00);
/*!40000 ALTER TABLE `masuk_detail` ENABLE KEYS */;

-- Dumping structure for table phpapidb.nomor
DROP TABLE IF EXISTS `nomor`;
CREATE TABLE IF NOT EXISTS `nomor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `periode` varchar(7) NOT NULL,
  `masuk` int(10) unsigned NOT NULL,
  `keluar` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='tabel untuk urutan nomer masuk dan nomer keluar sesuai periode';

-- Dumping data for table phpapidb.nomor: 3 rows
/*!40000 ALTER TABLE `nomor` DISABLE KEYS */;
REPLACE INTO `nomor` (`id`, `periode`, `masuk`, `keluar`) VALUES
	(1, '2021-06', 5, 6),
	(2, '2021-07', 3, 2),
	(3, '2021-08', 6, 4);
/*!40000 ALTER TABLE `nomor` ENABLE KEYS */;

-- Dumping structure for view phpapidb.stok_bahan
DROP VIEW IF EXISTS `stok_bahan`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `stok_bahan` (
	`kode_bahan` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nama_bahan` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`awal` DECIMAL(10,2) NOT NULL,
	`masuk` DECIMAL(32,2) NULL,
	`keluar` DECIMAL(32,2) NULL,
	`stok` DECIMAL(56,2) NULL
) ENGINE=MyISAM;

-- Dumping structure for table phpapidb.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL COMMENT 'gambar profil jpg sesuai username',
  `password` varchar(32) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `pass_decrypt` varchar(32) NOT NULL,
  `level` int(2) NOT NULL,
  `sub_level` int(2) NOT NULL,
  `ket_level` varchar(32) NOT NULL,
  `login_terakhir` datetime NOT NULL,
  `login_terakhir_ip` varchar(16) NOT NULL,
  `login_terakhir_device` datetime NOT NULL,
  `access_token` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table phpapidb.user: 2 rows
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `username`, `password`, `nama`, `pass_decrypt`, `level`, `sub_level`, `ket_level`, `login_terakhir`, `login_terakhir_ip`, `login_terakhir_device`, `access_token`) VALUES
	(1, 'root', '', 'root', 'root', 1, 1, 'root', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', ''),
	(2, 'admin', '', 'admin', 'admin', 2, 1, 'administrator', '0000-00-00 00:00:00', '127.0.0.1', '0000-00-00 00:00:00', '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for view phpapidb.kartu_stok_bahan
DROP VIEW IF EXISTS `kartu_stok_bahan`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `kartu_stok_bahan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kartu_stok_bahan` AS WITH Tb0 as
( SELECT masuk.no_masuk as no_bukti,masuk.tanggal,masuk_detail.kode_bahan,masuk_detail.qty as qty_masuk,0 'qty_keluar' from masuk,masuk_detail WHERE masuk.no_masuk=masuk_detail.no_masuk
        UNION
  SELECT keluar.no_keluar as no_bukti,keluar.tanggal,keluar_detail.kode_bahan,0 'qty_masuk',keluar_detail.qty as qty_keluar from keluar,keluar_detail WHERE keluar.no_keluar=keluar_detail.no_keluar
)

, Tb1 as
( 
    SELECT tanggal,kode_bahan,qty_masuk,qty_keluar,Row_Number() over (order by tanggal asc) as OrderId
        FROM    
            Tb0
)

SELECT T1.kode_bahan,T1.tanggal,T1.qty_masuk,T1.qty_keluar,(Sum(T2.qty_masuk) - Sum(T2.qty_keluar)) as Balance FROM Tb1 as T1
            INNER JOIN
                Tb1 as T2
                ON T1.OrderId >= T2.OrderId
                Group By T1.kode_bahan,T1.tanggal,T1.qty_masuk,T1.qty_keluar
                Order BY tanggal ;

-- Dumping structure for view phpapidb.stok_bahan
DROP VIEW IF EXISTS `stok_bahan`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `stok_bahan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stok_bahan` AS SELECT 
	bahan.kode_bahan,
	bahan.nama_bahan,
	bahan.awal,
	COALESCE(vmasuk,0) AS masuk, 
	COALESCE(vkeluar,0) AS keluar,
	COALESCE(bahan.awal,0)+COALESCE(SUM(vmasuk),0)-COALESCE(vkeluar,0) AS stok
FROM
	bahan
		LEFT JOIN (SELECT bahan.kode_bahan, SUM(masuk_detail.qty) AS vmasuk FROM bahan, masuk, masuk_detail
						WHERE bahan.kode_bahan=masuk_detail.kode_bahan AND masuk.validasi<>'0000-00-00'
						GROUP BY masuk_detail.kode_bahan ASC) AS m
				ON bahan.kode_bahan=m.kode_bahan
		LEFT JOIN (SELECT bahan.kode_bahan, SUM(keluar_detail.qty) AS vkeluar FROM bahan, keluar, keluar_detail
						WHERE bahan.kode_bahan=keluar_detail.kode_bahan AND keluar.validasi<>'0000-00-00'
						GROUP BY keluar_detail.kode_bahan ASC) AS k
				ON bahan.kode_bahan=k.kode_bahan
GROUP BY bahan.kode_bahan ASC
ORDER BY bahan.kode_bahan ASC ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
