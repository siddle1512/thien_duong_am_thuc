-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for thegioiamthuc
CREATE DATABASE IF NOT EXISTS `thegioiamthuc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `thegioiamthuc`;

-- Dumping structure for table thegioiamthuc.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(255) NOT NULL DEFAULT '',
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.admin: ~2 rows (approximately)
INSERT INTO `admin` (`id`, `username`, `hashed_password`, `create_at`, `update_at`, `delete_at`) VALUES
	(1, 'siddle@gmail.com', 'siddle', '0000-00-00', '0000-00-00', '2023-11-18'),
	(2, 'admin@gmail.com', '123', '2023-11-18', '2023-11-18', '2023-11-18');

-- Dumping structure for table thegioiamthuc.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tên loại đồ ăn',
  `slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Đường dẫn đến web',
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.category: ~0 rows (approximately)

-- Dumping structure for table thegioiamthuc.fooditem
CREATE TABLE IF NOT EXISTS `fooditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_Category` (`category_id`),
  CONSTRAINT `FK1_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.fooditem: ~0 rows (approximately)

-- Dumping structure for table thegioiamthuc.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_price` bigint(20) NOT NULL DEFAULT 0,
  `payment` enum('cash','vnpay') NOT NULL,
  `status` enum('processing','shipping','done','canceled') NOT NULL,
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK1_User` (`user_id`),
  CONSTRAINT `FK1_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.order: ~0 rows (approximately)

-- Dumping structure for table thegioiamthuc.order_data
CREATE TABLE IF NOT EXISTS `order_data` (
  `order_id` int(11) NOT NULL,
  `footitem_id` int(11) NOT NULL,
  `amout` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`order_id`,`footitem_id`),
  KEY `footitem_id` (`footitem_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `FK1_Order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2_Fooditem` FOREIGN KEY (`footitem_id`) REFERENCES `fooditem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.order_data: ~0 rows (approximately)

-- Dumping structure for table thegioiamthuc.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `gender` varchar(55) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `hashed_password` varchar(64) NOT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `adress` longtext NOT NULL,
  `status` enum('activate','deactivate') NOT NULL,
  `create_at` date NOT NULL DEFAULT current_timestamp(),
  `update_at` date NOT NULL DEFAULT current_timestamp(),
  `delete-at` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.user: ~3 rows (approximately)
INSERT INTO `user` (`id`, `username`, `birth_year`, `gender`, `email`, `hashed_password`, `avatar_path`, `adress`, `status`, `create_at`, `update_at`, `delete-at`) VALUES
	(1, 'hua duc binh', 2003, 'Nam', 'binhbo22@gmail.com', '123', NULL, '123lele', 'activate', '2023-11-23', '2023-11-23', '2023-11-23'),
	(2, 'dsadsa', 3123, 'male', 'binhbobinhbo22@gmail.com', '16ecab1875791e2b6ed0c9a6dae5a12a79d92120e1c3afbd3a9c8535ce44666d', '2023-09-08_12.57.38.png', 'dsadsa', 'activate', '2023-11-23', '2023-11-23', '2023-11-23'),
	(3, 'binh', 2003, 'male', 'b@gmail.com', '3fde2ae5e8f2ff6fdf87ad36fcf04d4a6e82953687df0cbde33a6add91f620e8', 'a0b01dc7cba6588c2e01334f10e3d3dc.jpg', '5/30 Lê Hồng Phong', 'activate', '2023-11-23', '2023-11-23', '2023-11-23');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
