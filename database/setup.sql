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
  `name` varchar(255) NOT NULL,
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.category: ~4 rows (approximately)
INSERT INTO `category` (`id`, `name`, `create_at`, `update_at`, `delete_at`) VALUES
	(1, 'Đồ ăn', '2023-11-23', '2023-11-23', '2023-11-23'),
	(2, 'Nước uống', '2023-11-23', '2023-11-23', '2023-11-23'),
	(3, 'Combo Gà giòn', '2023-11-23', '2023-11-23', '2023-11-23'),
	(4, 'Combo Đồ ăn + nước', '2023-11-23', '2023-11-23', '2023-11-23');

-- Dumping structure for table thegioiamthuc.fooditem
CREATE TABLE IF NOT EXISTS `fooditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `image` text DEFAULT NULL,
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK1_Category` (`category_id`),
  CONSTRAINT `FK1_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.fooditem: ~23 rows (approximately)
INSERT INTO `fooditem` (`id`, `name`, `category_id`, `price`, `image`, `create_at`, `update_at`, `delete_at`) VALUES
	(1, 'Phở bò', 1, 25000, 'https://static.vinwonders.com/production/pho-bo-ha-noi.jpeg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(2, 'Bún chả', 1, 25000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6fLIwELt47v0YX4Rwvo3ogbNWNxbu0wFzbg&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(3, 'Mì xào', 1, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHFfEElklKUevg7uszn4pTM_Nlcn0DWwcOWA&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(4, 'Bánh mì', 1, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSslHniayZoIWjgjjFK_BuLF0Z2z74QuxumvQ&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(5, 'Bún bò Huế', 1, 30000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN-CZ4IzvZVHfypFFe_rg9s6q4wZPz-QRHsw&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(6, 'Gỏi cuốn', 1, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR47tEQ7tThNaZFpNlYj6SPyo7K7XtwPS6aJQ&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(7, 'Súp cua', 1, 25000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThUbl7Xr3qL7yvxBMffFomc8lIUkMaGQvmLw&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(8, 'Bún riêu', 1, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbiAmO2UGsWvRGGtUFXBtwcSKD0-G3WjlgHg&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(9, 'Bún đậu mắm tôm', 1, 35000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG7k81AlPmN_gv8lroOSd3WBHbI6T5zFi2JA&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(10, 'Hamburger', 1, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLP3Of1PPleLWLOTHgWg7PpFPSbgpzZ7whVQ&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(11, 'Gà rán', 1, 55000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiJ8Edc6SeJdpvkZ1J0NENPZeN7_KIUVx4HA&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(12, 'Khoai tây chiên', 1, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBaHEnJ5ewBTeICBBaDyGtlpNYEpmVKoVU4A&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(13, 'Pepsi', 2, 15000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgltSa213CoAwce4cnd3WZCkwQqa3vbXiNwg&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(14, 'Coca', 2, 15000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1dcozcIPfW_ULbp5UoAnlNcDoRQS7BcIUew&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(15, 'Cà phê sữa đá', 2, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKR6XcVVUBbNPK6qWCB-gckJmKPxUAeeQ6zQ&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(16, 'Trà sữa trà đen', 2, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuIgwVTZuh036yKBj-2o0lk5hWv7IeFnBZRQ&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(17, 'Soda', 2, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh0xd5IPh3gOdvsD0cBGYjIvKadMnHA9_Y0g&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(18, 'Tàu hũ nước đường', 1, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlWArbR2ne_J9boAvEHUSc7MSlw_vpO6w4Ag&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(19, 'Sữa chua đá', 2, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL8JRTiPPVytFuPdlY9UsPr4d8ccg35erRdg&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(20, 'Bạc sỉu đá', 2, 20000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzVVLdn2HtzbWMeGiQ7YO4A_ERnuFEZd6GPw&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(21, 'Chè thái', 1, 35000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYW_AqEXurrvADljO_DSgKFuLtS64Tc0z2gA&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(22, 'Gà gỏi hẹ', 1, 60000, 'https://cdn.tgdd.vn/2021/02/CookProduct/thumbcmscn-1200x676-19.jpg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(23, 'Combo gà giòn 1', 3, 120000, 'https://comvanphongonline.com/wp-content/uploads/2019/11/ga-chien-gion.jpg', '2023-11-23', '2023-11-23', '2023-11-23');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.user: ~7 rows (approximately)
INSERT INTO `user` (`id`, `username`, `birth_year`, `gender`, `email`, `hashed_password`, `avatar_path`, `adress`, `status`, `create_at`, `update_at`, `delete-at`) VALUES
	(9, 'manh', 2003, 'nam', 'm@gmail.com', '9ec6579cb8ac60c462e6b6812ec5c91569e9d06fdc3a671721ee703702d1ac99', '1166009.jpg', 'phu yen', 'activate', '2023-11-24', '2023-11-24', '2023-11-24'),
	(10, 'binh', 2002, 'nam', 'b@gmail.com', 'e7010e40c59fd8d4b0760d9bf1c43e35f09cc9fd016f07bc8384c2b605aade3f', 'aa7c1150d67b3ce332c84a90423072f5.gif', '5/30 Lê Hồng Phong', 'activate', '2023-11-24', '2023-11-24', '2023-11-24'),
	(11, 'quang', 2003, 'nam', 'q@gmail.com', '367a4f89913d7ac484ebbd68c9e52287b234d3aaf85d7673821f88ecf405c361', 'image.jpg', 'Phú yên', 'activate', '2023-11-24', '2023-11-24', '2023-11-24'),
	(12, 'Manhha', 2003, 'nam', 'manhquocha12@gmail.com', '028720da0bcac4185d5403eae91bed3319714b8588f4fb9eb7f324569cb6c2e7', '', '114/48/12 Phạm Văn Chiêu Gò Vấp ', 'activate', '2023-11-24', '2023-11-24', '2023-11-24'),
	(13, 'Tuan', 2003, 'nam', 't@gmail.com', '7e8e92db105a9da763efc112e3907d703fffd6ee4fec3c2131899609689d39a6', 'ABE07234-B7CF-49F2-8B12-D122FFFF4350.jpeg', 'Hbs', 'activate', '2023-11-24', '2023-11-24', '2023-11-24'),
	(14, 'binhbobo', 1986, 'nam', 'binhbo@gmail.com', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'swiss-plateau-lone-5120x2880-13261.jpg', 'fpt', 'activate', '2023-11-24', '2023-11-24', '2023-11-24'),
	(15, 'Kedandon', 2003, 'nam', 'tnq2024@gmail.com', '9ad3dcc010b59e09e2ae21909ad73d6e571403b054fe50e9141431be16ee40ee', 'FqsHcVTakAEoek5.jfif', 'alaalaalaa', 'activate', '2023-11-24', '2023-11-24', '2023-11-24');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
