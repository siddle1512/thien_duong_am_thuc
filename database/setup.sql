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
	(1, 'siddle@gmail.com', 'siddle', '2023-11-18', '2023-11-18', '2023-11-18');

-- Dumping structure for table thegioiamthuc.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.category: ~7 rows (approximately)
INSERT INTO `category` (`id`, `name`, `create_at`, `update_at`, `delete_at`) VALUES
	(1, 'Đồ ăn', '2023-11-23', '2023-11-23', '2023-11-23'),
	(2, 'Nước uống', '2023-11-23', '2023-11-23', '2023-11-23'),
	(3, 'Thức ăn nhẹ', '2023-11-23', '2023-11-23', '2023-11-23'),
	(4, 'Gà rán', '2023-11-23', '2023-11-23', '2023-11-23'),
	(5, 'Burger', '2023-11-24', '2023-11-24', '2023-11-24'),
	(6, 'Combo', '2023-11-24', '2023-11-24', '2023-11-24'),
	(7, 'Món tráng miệng', '2023-11-24', '2023-11-24', '2023-11-24');

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
  CONSTRAINT `FK1_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.fooditem: ~72 rows (approximately)
INSERT INTO `fooditem` (`id`, `name`, `category_id`, `price`, `image`, `create_at`, `update_at`, `delete_at`) VALUES
	(1, 'Cơm Gà Teriyaki', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-Teriyaki.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(2, 'Cơm Gà Tenderods', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-TENDERODS.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(3, 'Mì Ý Sốt Cà Xúc Xích Gà Viên', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/MY-Y-POP.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(4, '5 Cánh Gà Rán', 4, 83000, 'https://static.kfcvietnam.com.vn/images/items/lg/5-HW.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(5, '3 Cánh Gà Rán', 4, 54000, 'https://static.kfcvietnam.com.vn/images/items/lg/3-HW.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(6, 'Mì Ý Sốt Cà Xúc Xích Gà Zinger', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/MY-Y-ZINGER.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(7, '1 Miếng Gà Rán', 4, 35000, 'https://static.kfcvietnam.com.vn/images/items/lg/1-Fried-Chicken.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(8, '6 Miếng Gà Rán', 4, 188000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/e/e/ee8e7512368728-6mingggin_1.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(9, '2 Miếng Gà Rán', 4, 70000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/d/1/d1834d87116836-2mingggin_1.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(10, 'Burger Tôm', 5, 44000, 'https://static.kfcvietnam.com.vn/images/items/lg/Burger-Shrimp.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(11, '4 Miếng Gà Rán', 4, 126000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/4/2/427e7a3136f84a-4mingggin_1.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(12, 'Khoai tây chiên', 3, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/5/5/5532107fb902fd-1860001_khoaivua21.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(13, 'PEPSI', 2, 12000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/2/2/22a5960148a32e-2mienggaran14.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(14, 'COCA', 2, 12000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1dcozcIPfW_ULbp5UoAnlNcDoRQS7BcIUew&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(15, 'Cacao Sữa Đá', 2, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/c/5/c5ded2aa5f7b3c-2mienggaran19.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(16, 'Trà Đào', 2, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/0/f/0f550a170bb756-tradao.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(17, '7 UP', 2, 12000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh0xd5IPh3gOdvsD0cBGYjIvKadMnHA9_Y0g&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
	(18, 'Nước Ép Xoài Đào', 2, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/x/o/xoai_dao_menu.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(19, 'Burger Gà Quay Flava', 5, 54000, 'https://static.kfcvietnam.com.vn/images/items/lg/Burger-Flava.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(20, 'Burger Zinger', 5, 54000, 'https://static.kfcvietnam.com.vn/images/items/lg/Burger-Zinger.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(21, 'Pepsi Không Calo', 2, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/l/y/lypepsi-03.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(22, 'Mì Ý Sốt Bò Bằm', 1, 45000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/m/_/m__2.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(23, 'Phô Mai Viên', 3, 44000, 'https://static.kfcvietnam.com.vn/images/items/lg/6-Chewy-Cheese.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(24, 'Bánh Xoài Đào', 7, 10000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/p/m/pmp-plated.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(25, 'Tropical Sundae', 7, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/k/e/kemsundae-06.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(26, 'Kem Ốc Quế Sữa Tươi', 7, 5000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/b/a/ba9d396f70568c-kemvani201.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(27, 'Kem Ốc Quế Socola', 7, 7000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/c/4/c400652c2a03e0-chocolateicecream01.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(28, 'Kem SUNDAES Dâu', 7, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/d/0/d01402ed11976b-kemsundeadau.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(29, 'Kem SUNDAES Socola', 7, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/1/9/192dcb48e7393a-kemsocola16.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(30, 'Salad Hạt', 3, 35000, 'https://static.kfcvietnam.com.vn/images/items/lg/SALAD-HAT.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(31, 'Salad Pop', 3, 35000, 'https://static.kfcvietnam.com.vn/images/items/lg/SALAD-HAT-GA-VIEN.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(32, 'Súp Rong Biển', 3, 17000, 'https://static.kfcvietnam.com.vn/images/items/lg/Soup-Rong-Bien.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(33, 'Pizza Bò Phô Mai', 1, 170000, 'https://img.dominos.vn/Menu+BG+1.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(34, 'Pizza Rau Củ Thập Cẩm ', 1, 90000, 'https://img.dominos.vn/Veggie-mania-Pizza-Rau-Cu-Thap-Cam.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(35, 'Pizza Phô Mai Truyền Thống', 1, 90000, 'https://img.dominos.vn/Pizza-Pho-Mai-Hao-Hang-Cheese-Mania.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(36, 'Pizza Xúc Xích Ý Truyền Thống', 1, 115000, 'https://img.dominos.vn/Pepperoni-feast-Pizza-Xuc-Xich-Y.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(37, 'Combo Nhóm 1', 6, 172000, 'https://static.kfcvietnam.com.vn/images/items/lg/D6.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(38, 'Combo Nhóm 2', 6, 190000, 'https://static.kfcvietnam.com.vn/images/items/lg/D7-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(39, 'Combo Nhóm 3', 6, 230000, 'https://static.kfcvietnam.com.vn/images/items/lg/D8-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(40, 'Combo Gà Rán', 6, 87000, 'https://static.kfcvietnam.com.vn/images/items/lg/D1-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(41, 'Combo Mì Ý', 6, 87000, 'https://static.kfcvietnam.com.vn/images/items/lg/D3-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(42, 'Combo Salad Hạt', 6, 80000, 'https://static.kfcvietnam.com.vn/images/items/lg/D4-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(43, 'Pasion Panna Cotta', 7, 35000, 'https://phuclong.com.vn/uploads/dish/a9686c8f36a908-passionpannacotta.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(44, 'Tiramisu Mini', 7, 35000, 'https://phuclong.com.vn/uploads/dish/dd626a9639b006-tiramisumini.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(45, 'Bánh Phô Mai Cà Phê', 7, 30000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_PHOMAICAPHE.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(46, 'Bánh Phô Mai Chanh Dây', 7, 30000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_PHOMAICHANHDAY.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(47, 'Bánh Phô Mai Trà Xanh', 7, 30000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_PHOMAITRAXANH.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(48, 'Bánh Chuối', 7, 25000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_BANHCHUOI.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(49, 'Combo Gà Que Kem Xốt Cajun A', 6, 90000, 'https://static.kfcvietnam.com.vn/images/items/lg/A-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(50, 'Combo Gà Que Kem Xốt Cajuun B', 6, 90000, 'https://static.kfcvietnam.com.vn/images/items/lg/B-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(51, '1 Gà Que Kem Xốt Cajun', 3, 40000, 'https://static.kfcvietnam.com.vn/images/items/lg/1-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(52, '2 Gà Que Kem Xốt Cajun', 3, 80000, 'https://static.kfcvietnam.com.vn/images/items/lg/2-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(53, 'Combo Gà Địa Trung Hải A', 6, 93000, 'https://static.kfcvietnam.com.vn/images/items/lg/combo-ga-cuon-dia-trung-hai-a.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(54, 'Combo Gà Địa Trung Hải B', 6, 199000, 'https://static.kfcvietnam.com.vn/images/items/lg/combo-ga-cuon-dia-trung-hai-c.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(55, '3 Gà Miếng Nuggets', 4, 27000, 'https://static.kfcvietnam.com.vn/images/items/lg/3_Nuggests.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(56, '5 Gà Miếng Nuggets', 4, 40000, 'https://static.kfcvietnam.com.vn/images/items/lg/5_Nuggests.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(57, '10 Gà Miếng Nuggets', 4, 75000, 'https://static.kfcvietnam.com.vn/images/items/lg/10_Nuggests.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(58, 'Xiên Que', 3, 20000, 'https://static.kfcvietnam.com.vn/images/items/lg/2-Skewers.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(59, 'Xiên Tenderods', 3, 20000, 'https://static.kfcvietnam.com.vn/images/items/lg/2-Tenderods.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(60, 'Cơm trộn Hàn Quốc', 1, 45000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5XLpeaxpGfCPsjbTlnSnzLxLwn1s0RTzD-g&usqp=CAU', '2023-11-24', '2023-11-24', '2023-11-24'),
	(61, 'Tokbokki', 1, 45000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRchqFsGMs-qu_31gPGOtIeYhIj41OyxLUatg&usqp=CAU', '2023-11-24', '2023-11-24', '2023-11-24'),
	(62, 'Tokbokki Phô Mai', 1, 60000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXa6lEr94nhSlIe-PVjAGDOANYhhej1ln-kA&usqp=CAU', '2023-11-24', '2023-11-24', '2023-11-24'),
	(63, 'Trà Chanh Lipton', 2, 15000, 'https://static.kfcvietnam.com.vn/images/items/lg/Lipton.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(64, 'Cơm Trắng', 1, 10000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/b/3/b3ad51b912e4e5-2mienggaran24.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(65, 'Súp Bí Đỏ', 3, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/s/_/s_p_b_.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(66, 'Burger Gà Giòn', 5, 35000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/9/2/92d27d47dadbfc-hambugerlon.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(67, 'Cơm Gà Bít Tết', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-Steak.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(68, 'Cơm Gà Rán', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-F.Chicken.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(69, 'AQUAFINA', 2, 15000, 'https://static.kfcvietnam.com.vn/images/items/lg/Aquafina-500ml.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(71, 'Lẩu gà lá é', 1, 80000, 'https://i-giadinh.vnecdn.net/2022/12/08/Buoc-7-Thanh-pham-7-3595-1670471747.jpg', '2023-11-27', '2023-11-27', '2023-11-27'),
	(72, 'Piza thập cẩm', 1, 100000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVIG2vrhFm2_8bI4TCqi1_lygdssC3rabscbjzwaq4g0H3xYtGyGMuyKfo8Zh6o72WgRM&usqp=CAU', '2023-11-29', '2023-11-29', '2023-11-29');

-- Dumping structure for table thegioiamthuc.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_price` bigint(20) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete_at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK1_User` (`user_id`),
  CONSTRAINT `FK1_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.order: ~45 rows (approximately)
INSERT INTO `order` (`id`, `user_id`, `total_price`, `payment`, `status`, `create_at`, `update_at`, `delete_at`) VALUES
	(176, 26, 2980000, 'Tiền mặt', 'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(177, 26, 100000, 'Tiền mặt', 'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(178, 45, 279000, 'Vnpay', 'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(179, 40, 80000, 'Tiền mặt', 'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(180, 53, 45000, 'Vnpay', 'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(181, 53, 45000, 'Tiền mặt', 'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(182, 40, 45000, 'Vnpay', 'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(183, 40, 54000, 'Tiền mặt', 'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(184, 40, 135000, 'Tiền mặt', 'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(185, 40, 100000, 'Vnpay', 'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(186, 40, 100000, 'Tiền mặt', 'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(187, 40, 80000, 'Tiền mặt', 'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(188, 40, 45000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(189, 40, 45000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(190, 40, 45000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(191, 57, 80000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(192, 40, 9648000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(193, 26, 54000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(194, 26, 450000, 'Tiền mặt', 'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(195, 26, 1511028360, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(196, 26, 1040000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(197, 26, 45000000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(198, 26, 10000000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(199, 26, 80000000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(200, 26, 800000000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(201, 26, 10000000, 'Tiền mặt', 'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(202, 66, 45000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(203, 66, 15000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(204, 66, 45000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(205, 26, 15000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(206, 68, 4500000, 'Tiền mặt', 'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(207, 68, 45000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(208, 68, 80000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(209, 68, 4500000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(210, 69, 1000000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(211, 26, 4500000, 'Tiền mặt', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(212, 26, 28045000, 'Vnpay', 'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(213, 66, 100000, 'Tiền mặt', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(214, 66, 45000, 'Tiền mặt', 'Đã hủy', '2023-12-09', '2023-12-09', '2023-12-09'),
	(215, 40, 45000, 'Tiền mặt', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(216, 40, 45000, 'Vnpay', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(217, 26, 100000, 'Vnpay', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(218, 26, 45000, 'Vnpay', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(219, 68, 100000, 'Tiền mặt', 'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(220, 68, 100000, 'Tiền mặt', 'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(221, 40, 100000, 'Tiền mặt', 'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(222, 40, 15000, 'Vnpay', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(223, 26, 12000, 'Tiền mặt', 'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(224, 26, 100000, 'Vnpay', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(225, 26, 100000, 'Vnpay', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(226, 89, 8000000, 'Tiền mặt', 'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09');

-- Dumping structure for table thegioiamthuc.order_data
CREATE TABLE IF NOT EXISTS `order_data` (
  `order_id` int(11) NOT NULL,
  `footitem_id` int(11) NOT NULL,
  `amout` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`order_id`,`footitem_id`),
  KEY `footitem_id` (`footitem_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `FK1_Order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FK2_Fooditem` FOREIGN KEY (`footitem_id`) REFERENCES `fooditem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.order_data: ~54 rows (approximately)
INSERT INTO `order_data` (`order_id`, `footitem_id`, `amout`) VALUES
	(176, 2, 64),
	(176, 72, 1),
	(177, 72, 1),
	(178, 1, 1),
	(178, 19, 1),
	(178, 71, 1),
	(178, 72, 1),
	(179, 71, 1),
	(180, 2, 1),
	(181, 3, 1),
	(182, 2, 1),
	(183, 19, 1),
	(184, 2, 3),
	(185, 72, 1),
	(186, 72, 1),
	(187, 71, 1),
	(188, 2, 1),
	(189, 2, 1),
	(190, 2, 1),
	(191, 71, 1),
	(192, 1, 200),
	(192, 19, 12),
	(193, 5, 1),
	(194, 2, 10),
	(195, 2, 8623513),
	(196, 71, 13),
	(197, 68, 1000),
	(198, 72, 100),
	(199, 71, 1000),
	(200, 71, 10000),
	(201, 72, 100),
	(202, 1, 1),
	(203, 69, 1),
	(204, 3, 1),
	(205, 69, 1),
	(206, 2, 100),
	(207, 1, 1),
	(208, 71, 1),
	(209, 68, 100),
	(210, 72, 10),
	(211, 68, 100),
	(212, 1, 400),
	(212, 2, 1),
	(212, 72, 100),
	(213, 72, 1),
	(214, 3, 1),
	(215, 2, 1),
	(216, 2, 1),
	(217, 72, 1),
	(218, 68, 1),
	(219, 72, 1),
	(220, 72, 1),
	(221, 72, 1),
	(222, 69, 1),
	(223, 14, 1),
	(224, 72, 1),
	(225, 72, 1),
	(226, 71, 100);

-- Dumping structure for table thegioiamthuc.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `gender` varchar(55) DEFAULT '',
  `email` varchar(255) NOT NULL,
  `hashed_password` varchar(64) NOT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `adress` longtext DEFAULT NULL,
  `status` enum('activate','deactivate') DEFAULT NULL,
  `create_at` date DEFAULT current_timestamp(),
  `update_at` date DEFAULT current_timestamp(),
  `delete-at` date DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table thegioiamthuc.user: ~27 rows (approximately)
INSERT INTO `user` (`id`, `username`, `birth_year`, `gender`, `email`, `hashed_password`, `avatar_path`, `adress`, `status`, `create_at`, `update_at`, `delete-at`) VALUES
	(26, 'ducbinh', 2003, 'Nam', 'b@gmail.com', 'bf764799b81162cb806537fbe3968386b99536c77c7d5662befa01c8e4ba301f', '350095919_964039858378522_6691988549857456533_n.png', '["Nhà ở xã hội An Phú Thịnh Block B, Phường Nhơn Bình, Thành phố Quy Nhơn, Tỉnh Bình Định","Nhà ở xã hội An Phú Thịnh Block B, Xã Mỹ Phương, Huyện Ba Bể, Tỉnh Bắc Kạn","Xóm XYZ, Xã Đào Viên, Huyện Quế Võ, Tỉnh Bắc Ninh"]', 'deactivate', '2023-11-26', '2023-11-26', '2023-11-26'),
	(27, 'TuanDiem', 2003, 'Nam', 'h@gmail.com', 'aaa9402664f1a41f40ebbc52c9993eb66aeb366602958fdfaa283b71e64db123', '396293123_1505949916847510_790371987468921811_n.jpg', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'deactivate', '2023-11-27', '2023-11-27', '2023-11-27'),
	(28, 'Kirby', 2003, 'Nam', 'tnq2024@gmail.com', '9ad3dcc010b59e09e2ae21909ad73d6e571403b054fe50e9141431be16ee40ee', 'FqsHcVTakAEoek5.jfif', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'deactivate', '2023-11-27', '2023-11-27', '2023-11-27'),
	(29, 'Tien', 2003, 'Nam', 'aggsndndndn@gmail.com', '6955b2914394a4d173715e0c6fd3922cb2e4397463351d60c40eac27882fac0c', 'IMG_20231107_224025.jpg', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'deactivate', '2023-11-28', '2023-11-28', '2023-11-28'),
	(30, 'dsada', 3213, 'Nam', 'meo@gmail.com', 'e32939b51a3293028fd1d006c292986c112bab965fa05c1f1ecd44778d1d310e', '399323963_369849725604966_5149915207159457397_n.jpg', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'deactivate', '2023-11-28', '2023-11-28', '2023-11-28'),
	(31, 'sonntqe170212@fpt.edu.vn', 2003, 'Nam', 'camila9942012@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'deactivate', '2023-11-28', '2023-11-28', '2023-11-28'),
	(32, 'dsada', 321, 'Nam', 'v@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '350095919_964039858378522_6691988549857456533_n.png', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'deactivate', '2023-11-29', '2023-11-29', '2023-11-29'),
	(36, 'binhbo22', 2002, 'Nam', 'binhbo22@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'activate', '2023-11-29', '2023-11-29', '2023-11-29'),
	(38, 'nthehien338@gmail.com', 4, 'Nam', 'hienntss171243@fpt.edu.vn', 'a1847dce79ffd6015fca593ecf0d2f849364f71fa22674363474a9bd517b458e', '377121718_763853592237775_1891219953287888842_n.png', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'activate', '2023-12-01', '2023-12-01', '2023-12-01'),
	(39, 'binhbo22', 1999, 'Nam', 'q@gmail.com', '367a4f89913d7ac484ebbd68c9e52287b234d3aaf85d7673821f88ecf405c361', '396293123_1505949916847510_790371987468921811_n.jpg', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'activate', '2023-12-05', '2023-12-05', '2023-12-05'),
	(40, 'Hứa Đức Bình', 2003, 'Nam', 'binh1@gmail.com', 'e7010e40c59fd8d4b0760d9bf1c43e35f09cc9fd016f07bc8384c2b605aade3f', 'FB16450E-7786-4835-AC21-0E6406D6033C.jpeg', '["Xóm ABC, Xã Vĩnh Tiến, Huyện Vĩnh Lộc, Tỉnh Thanh Hóa","Xóm XYZ, Xã Xương Lâm, Huyện Lạng Giang, Tỉnh Bắc Giang"]', 'activate', '2023-12-07', '2023-12-07', '2023-12-07'),
	(42, 'Huy ', 2003, 'Nam', 'aaaaa@as', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'item-1.png', '["Nhà ở xã hội An Phú Thịnh Block B, Tỉnh Bình Định, Thành phố Quy Nhơn, Phường Nhơn Bình","Xóm ABC, Tỉnh Gia Lai, Huyện KBang, Xã KRong","Xóm XYZ, Tỉnh Phú Thọ, Huyện Lâm Thao, Xã Cao Xá"]', 'activate', '2023-12-07', '2023-12-07', '2023-12-07'),
	(45, 'Kirby', 1, 'Nam', 'Xatthu2049@gmail.com', '7db0ea7ad8a8a909c6d400bd64a3d20141f15c4b3efa153e88f2fccaf3db22d8', 'VRChat_2023-12-02_19-22-17.600_1920x1080.png', '["Ninh Tịnh 1 , Tỉnh Phú Yên, Thành phố Tuy Hoà, Phường 9"]', 'activate', '2023-12-07', '2023-12-07', '2023-12-07'),
	(51, 'Phúc', 2000, 'Nam', 'phucnthqe170051@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'z1646493449412_004_48c2bbd63c89aaa3055915a21f833aaf.jpg', '["405a, Phường Phú Thượng, Quận Tây Hồ, Thành phố Hà Nội"]', NULL, '2023-12-07', '2023-12-07', '2023-12-07'),
	(52, 'Hứa Đức Bình', 2001, 'Nam', 'binh2@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '[]', NULL, '2023-12-07', '2023-12-07', '2023-12-07'),
	(53, 'Đức Bình', 2003, 'Nam', 'binhbo@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '["Xóm ABC, Phường Trưng Vương, Thành phố Uông Bí, Tỉnh Quảng Ninh"]', NULL, '2023-12-07', '2023-12-07', '2023-12-07'),
	(54, 'MrA', 1890, 'Nam', 'ttlevejn@eurokool.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '[]', NULL, '2023-12-07', '2023-12-07', '2023-12-07'),
	(55, 'MrA', 1700, 'Nam', '123@gmail.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '[]', NULL, '2023-12-07', '2023-12-07', '2023-12-07'),
	(56, 'dsa', 123, 'Nam', 't@123', 'de04d58dc5ccc4b9671c3627fb8d626fe4a15810bc1fe3e724feea761965fb71', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '[]', NULL, '2023-12-08', '2023-12-08', '2023-12-08'),
	(57, 'voo danh', 231312, 'Nam', 'b2@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '313020018_2140568879472240_3418682621231501783_n.png', '["Xóm ABC, Xã Đồng Kỳ, Huyện Yên Thế, Tỉnh Bắc Giang"]', NULL, '2023-12-08', '2023-12-08', '2023-12-08'),
	(66, 'Phúc', 2000, 'Nam', 'tranphuc16102003@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '["405a, Phường Vĩnh Phúc, Quận Ba Đình, Thành phố Hà Nội"]', NULL, '2023-12-08', '2023-12-08', '2023-12-08'),
	(68, 'binhhua', 2011, 'Nam', 'binhbobinhbo22@gmail.com', 'e7010e40c59fd8d4b0760d9bf1c43e35f09cc9fd016f07bc8384c2b605aade3f', 'shadow session 2.jpg', '["Nhà ở xã hội An Phú Thịnh Block B, Phường Nhơn Bình, Thành phố Quy Nhơn, Tỉnh Bình Định"]', NULL, '2023-12-08', '2023-12-08', '2023-12-08'),
	(69, 'tuan', 2003, 'Nam', 'kbtorgan@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'moi-dieu-can-biet-cho-con-cach-nuoi-cham-soc-va-huan-luyen-202203311033114159.jpg', '["phố Làng Trạch, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội"]', NULL, '2023-12-08', '2023-12-08', '2023-12-08'),
	(70, 'xiquan643@gmail.com', 1514, 'Nam', 'xiquan643@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '["hai ba trung, Xã Vĩnh Lại, Huyện Lâm Thao, Tỉnh Phú Thọ"]', NULL, '2023-12-08', '2023-12-08', '2023-12-08'),
	(82, 'tien', 2003, 'Nam', 'Tien11@gmail.co', '4fc82b26aecb47d2868c4efbe3581732a3e7cbcc6c2efb32062c08170a05eeb8', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '[]', NULL, '2023-12-09', '2023-12-09', '2023-12-09'),
	(83, 'hungtdqe170194@fpt.edu.vn', 1512, 'Nam', 'devupclub@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '[]', NULL, '2023-12-09', '2023-12-09', '2023-12-09'),
	(89, 'Vunt286', 2001, 'Nam', 'vunt286@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', '360_F_331699188_lRpvqxO5QRtwOM05gR50ImaaJgBx68vi.jpg', '[]', NULL, '2023-12-09', '2023-12-09', '2023-12-09');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
