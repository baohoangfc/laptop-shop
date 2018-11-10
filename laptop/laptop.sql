-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2017 at 08:32 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `cname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_parent` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `cname`, `id_parent`) VALUES
(0, '---', 0),
(1, 'PC', 0),
(2, 'LAPTOP', 0),
(3, 'MSI GAMING', 2),
(4, 'Alienware', 2),
(16, 'Asus', 2),
(17, 'Lenovo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `id_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guaranree`
--

CREATE TABLE `guaranree` (
  `id_guaranree` int(11) NOT NULL,
  `date` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `guaranree`
--

INSERT INTO `guaranree` (`id_guaranree`, `date`) VALUES
(1, '12 Tháng'),
(2, '24 Tháng');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_order`, `id_product`, `quantity`) VALUES
(9, 1, 1),
(10, 3, 1),
(11, 4, 1),
(12, 5, 1),
(13, 6, 1),
(14, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `mid` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`mid`, `username`, `password`, `fullname`, `email`, `address`, `phone`, `enable`, `role_id`) VALUES
(1, 'admin', '$2a$10$QnX/bxX1CryN/5lbiKCN4.s.agwYDe5xtb7SKyfcxx2sUFdHZYFMC', 'Bão', '', '', '', 1, 1),
(3, 'baobui', '$2a$10$QnX/bxX1CryN/5lbiKCN4.s.agwYDe5xtb7SKyfcxx2sUFdHZYFMC', 'Trần Hoàng Bão', '', '', '', 1, 2),
(4, 'baohoangfc@gmail.com', '$2a$10$DSv5DxumXn4MGIboFMVMWOlig0tkoft0gch.RmjkqOL3KU1XZFmPm', 'Trần Hoàng Bão', 'baohoangfc@gmail.com', 'Điện An Điện Bàn', '123', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `id_payment` int(11) NOT NULL,
  `total` float(10,0) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id_order`, `role_id`, `address`, `date`, `email`, `phone`, `id_payment`, `total`, `status`) VALUES
(26, 3, 'Điện An Điện Bàn', '2017-09-29 04:56:20', 'baohoangfc@gmail.com', '1287074066', 0, 2323, 0),
(27, 3, 'Điện An Điện Bàn', '2017-09-29 05:57:04', 'baohoangfc@gmail.com', '123', 0, 2323, 0),
(28, 3, 'Điện An Điện Bàn', '2017-09-29 05:57:40', 'baohoangfc@gmail.com', '123', 0, 2323, 0),
(29, 3, 'Điện An Điện Bàn', '2017-09-29 06:04:19', 'baohoangfc@gmail.com', '123', 0, 2323, 0),
(30, 3, '', '2017-09-29 18:00:53', '', '', 2, 4646, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetail`
--

CREATE TABLE `ordersdetail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ordersdetail`
--

INSERT INTO `ordersdetail` (`id`, `id_order`, `price`, `quantity`, `id_product`) VALUES
(58, 26, 2323, 1, 9),
(59, 27, 2323, 1, 9),
(60, 28, 2323, 1, 9),
(61, 29, 2323, 1, 9),
(62, 30, 2323, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `name_pay` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_payment`, `name_pay`) VALUES
(1, 'Giao Hàng'),
(2, 'Thanh Toán PayPal');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(255) NOT NULL,
  `name_product` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` text COLLATE utf8_unicode_ci NOT NULL,
  `price_sale` float DEFAULT NULL,
  `preview` text COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `id_status` int(11) NOT NULL DEFAULT '1',
  `production_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_categories` int(255) NOT NULL,
  `picture` text COLLATE utf8_unicode_ci NOT NULL,
  `id_guaranree` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `name_product`, `price`, `price_sale`, `preview`, `details`, `id_status`, `production_code`, `date_create`, `id_categories`, `picture`, `id_guaranree`) VALUES
(1, 'Laptop MSI GP72M 7REX Leopard Pro 873XVN', '27000000', 26540000, 'CPU : Kaby lake - Intel Core i7 7700HQ(2.8Ghz, 6MB Cache, Up to 3.8Ghz), Chipset : Intel HM175 ', '<p>Hãng sản xuất                                                       MSI Gaming\nTên sản phẩm                                                       MSI GP72M 7REX </p>873XVN Leopard Pro (GeForce® GTX 1050 Ti, 4GB                                                                                                          GDDR5)\nBộ vi xử lý \nBộ vi xử lý	<p> Kaby lake - Intel Core i7 7700HQ, Chipset : Intel HM175\nTốc độ	 2.8Ghz, Up to 3.8Ghz </p>\nBộ nhớ đệm	6MB Cache\nBộ nhớ trong \nDung lượng	8GB (1x8GB)DDR4 \nSố khe cắm	 2 khe cắm \nỔ cứng \nDung lượng	 1TB SATA 7200rpm\nTốc độ vòng quay	 \nỔ đĩa quang (ODD) 	không có\nHiển thị \nMàn hình	17.3" Full HD, Anti-Glare (1920*1080) eDP 120Hz Vivid Color 94% (I)\nĐộ phân giải	1920*1080\nĐồ Họa (VGA) \nCard màn hình	Nvidia Geforce GTX1050Ti 4GB GDDR5\nKết nối (Network) \nWireless	Intel 3168 Sandy Peak 1 (1x1 802.11 ac)\nLan	Killer E2400 Gigabit Ethernet with Killer Shield\nBluetooth	Bluetooth v4.0\nBàn phím , Chuột \nKiểu bàn phím	 Bàn phím tiêu chuẩn , Có bàn phím số , Keyboard by Steelseries, Backlight multi color KB\nChuột	Cảm ứng đa điểm\nGiao tiếp mở rộng \nKết nối USB	1x USB 2.0, 2xUSB 3.0,1x USB 3.0 Type-C, 1x Mini - DisplayPort(v1.2)\nKết nối HDMI/VGA	1xHDMI\nKhe cắm thẻ nhớ	Card reader SD (XC/HC)\nTai nghe	1x Mic-in/Headphone-out\nCamera	HD type (30fps@720p)\nDung lượng pin	6-cell \nSạc pin	Đi kèm\nHệ điều hành đi kèm	 PC DOS\nTrọng Lượng	2.6kg\nMàu sắc	 Đen', 1, 'NBMS0093', '2017-09-23 08:43:09', 3, '', 0),
(3, 'IphoneX', '3434', 1, 'sdsds', 'sdsd', 1, 'md5', '2017-09-22 07:14:57', 4, 'SOA-01_40116897778433.gif', 2),
(4, 'sdsdsd', '2323', 1, 'dsd', 'sdsd', 1, 'sdsd', '2017-09-20 14:26:01', 2, 'SOA-01_40154137312736.gif', 0),
(5, 'sdsdsd', '32', 1, 'sd', 'sd', 1, 'sdsd', '2017-09-20 14:26:03', 3, 'SOA-01_40188528738108.gif', 0),
(6, 'sdsd', '2323', 1, 'sdsd', 'sds', 1, 'sds', '2017-09-22 07:13:28', 3, 'soa-introduction-7-638_40202798241878.jpg', 2),
(9, 'sdsdsds', '2323', 23232, 'sdsd', 'sdsd', 1, 'sdsdssd', '2017-09-20 15:34:22', 1, 'soa-introduction-7-638_2516881692687.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'MOD'),
(3, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id_slide` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id_slide`, `image`) VALUES
(1, '21763523_487467518318767_2047069409_n_3384818548208.png'),
(2, '21706765_488008264931359_1911442665_o_4418457710542.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `guaranree`
--
ALTER TABLE `guaranree`
  ADD PRIMARY KEY (`id_guaranree`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id_slide`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guaranree`
--
ALTER TABLE `guaranree`
  MODIFY `id_guaranree` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `ordersdetail`
--
ALTER TABLE `ordersdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id_slide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
