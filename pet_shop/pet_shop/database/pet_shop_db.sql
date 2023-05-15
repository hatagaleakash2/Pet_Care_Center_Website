-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2022 at 08:32 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(8, 1, 0, 0, 1, '2022-08-19 23:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Food', 'Sample Description', 1, '2021-06-21 10:17:41'),
(4, 'Accessories', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2021-06-21 16:34:04'),
(5, 'Animal', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:20:43'),
(6, 'Medicine', '&lt;p&gt;&amp;nbsp;we sell medicine also&amp;nbsp;&lt;/p&gt;', 1, '2022-08-19 23:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23'),
(2, 'Akash', 'Hatagale', 'Male', '8698221746', 'akash@gmail.com', '94754d0abb89e4cf0a7f1c494dbb9d2c', 'anand nagar', '2022-08-19 23:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 'pcs', 250, 'M', '2021-06-21 13:01:30', '2021-06-21 13:05:23'),
(2, 1, 20, 'Sample', 300, 'L', '2021-06-21 13:07:00', NULL),
(3, 4, 150, 'pcs', 500, 'M', '2021-06-21 16:50:37', NULL),
(4, 3, 50, 'pack', 150, 'M', '2021-06-21 16:51:12', NULL),
(5, 5, 30, 'pcs', 50, 'M', '2021-06-21 16:51:35', NULL),
(6, 4, 10, 'pcs', 550, 'L', '2021-06-21 16:51:54', NULL),
(7, 6, 100, 'pcs', 150, 'S', '2021-06-22 15:50:47', NULL),
(8, 6, 150, 'pcs', 180, 'M', '2021-06-22 15:51:13', NULL),
(9, 12, 545, '20', 550, 'NONE', '2022-08-19 23:24:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1100, 2, 1, '2021-06-22 13:48:54', '2021-06-22 14:49:15'),
(2, 1, 'Sample Address', 'cod', 750, 3, 1, '2021-06-22 15:26:07', '2021-06-22 15:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(8, 4, 5, 'Bed for both', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 22:52:43'),
(9, 1, 1, 'pedigree', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:03:52'),
(10, 4, 4, 'belt', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:04:32'),
(11, 4, 5, 'sweeter', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:05:02'),
(12, 4, 5, 'bed', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:05:20'),
(13, 1, 3, 'wiscus', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:05:47'),
(14, 1, 3, 'wiscus2', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:06:52'),
(15, 1, 3, 'wiscus1', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:07:15'),
(16, 1, 3, 'wiscus3', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:07:36'),
(17, 1, 3, 'wiscus4', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:07:57'),
(18, 1, 3, 'wiscus 6', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:08:16'),
(19, 1, 1, 'pedigee1', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:08:58'),
(20, 1, 1, 'pedigee2', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:09:22'),
(21, 1, 1, 'pedigee', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:09:51'),
(22, 1, 1, 'pedigee6', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:10:16'),
(23, 1, 1, 'dfadf', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:11:42'),
(24, 1, 1, 'dfa', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:12:03'),
(25, 1, 1, 'dsfa', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:12:18'),
(26, 1, 1, 'sfdsaf', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:12:36'),
(27, 4, 4, 'dfs', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:13:20'),
(28, 4, 4, 'dsgadsfg', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:13:38'),
(29, 4, 4, 'dsfads', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'xs'),
(2, 's'),
(3, 'm'),
(4, 'l'),
(5, 'xl'),
(6, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(6, 5, 'Dog', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:21:24'),
(7, 5, 'Cat', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:21:35'),
(8, 5, 'Rabbit', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:21:50'),
(9, 5, 'Birds', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:22:10'),
(10, 4, 'Cat Need', '&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;&lt;p&gt;fkjjsadlk sdjkfhlkadsjhf a;ksdhflkjadsh aksdhflkjaj ksdhhflak lkshdfkl kajsdhflk adskjfhakjs lkadfhl lkdshfl llkasdhf kj lkjsdjhflk&amp;nbsp; lksdhflakjdjf llksadjflksd&lt;/p&gt;&lt;p&gt;sddkfhlkadsjflkjshdlkfhadshfl laskjdjfhlkasdjlkjh a&lt;/p&gt;', 1, '2022-08-19 23:24:18'),
(11, 6, ' For Dog', '&lt;p&gt;contact to Docter&lt;/p&gt;', 1, '2022-08-19 23:30:10'),
(12, 6, 'For Cat', '&lt;p&gt;Contact to doctor&lt;/p&gt;', 1, '2022-08-19 23:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Pet Care Center'),
(6, 'short_name', 'We care Pet&apos;s'),
(11, 'logo', 'uploads/1660892400_favicon.ico'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1660892400_labrador.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Akash', 'Hatagale', 'akash', '21232f297a57a5a743894a0e4a801fc3', 'uploads/1660922820_akash photo.jpg', NULL, 1, '2021-01-20 14:02:37', '2022-08-19 20:57:30'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
