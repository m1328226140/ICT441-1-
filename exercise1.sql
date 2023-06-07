-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-06-01 03:27:35
-- 服务器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `exercise1`
--

-- --------------------------------------------------------

--
-- 表的结构 `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `phone_number`) VALUES
(1, 'Sam', 'Doe', 'M', '666-1234'),
(2, 'Jane', 'Doe', 'F', '666-5678'),
(3, 'Bob', 'Smith', 'M', '666-9876'),
(4, 'Alice', 'Molly', 'F', '888-4321'),
(5, 'Daisy', 'Jane', 'F', '111-4321'),
(6, 'Iris', 'Jane', 'F', '222-4321'),
(7, 'Lee', 'Karen', 'M', '598-4321'),
(8, 'Paul', 'Owen', 'M', '666-4321'),
(9, 'Tom', 'Mark', 'M', '999-4321'),
(10, 'Tom', 'Wilson', 'M', '888-2468');

-- --------------------------------------------------------

--
-- 表的结构 `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `food_name` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `origin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`id`, `food_name`, `price`, `origin`) VALUES
(1, 'Hamburger', 5.00, 'USA'),
(2, 'Fish and Chips', 6.39, 'UK'),
(3, 'Whole wheat bread', 3.99, 'China'),
(4, 'Pasta', 4.89, 'Italy'),
(5, 'Australian beef', 11.30, 'Australia');

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`) VALUES
(1, 1, '2022-01-01'),
(2, 2, '2022-01-02'),
(3, 3, '2022-01-03'),
(4, 4, '2022-01-04'),
(5, 5, '2022-01-05'),
(6, 6, '2022-01-06'),
(7, 7, '2022-01-07'),
(8, 8, '2022-01-08'),
(9, 9, '2022-01-09'),
(10, 10, '2022-01-10'),
(12, 1, '2022-01-30'),
(13, 2, '2022-02-02'),
(14, 3, '2022-02-03'),
(15, 4, '2022-02-04');

-- --------------------------------------------------------

--
-- 表的结构 `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `food_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 2, 4, 1),
(5, 2, 5, 1),
(6, 3, 1, 3),
(7, 3, 2, 1),
(8, 4, 3, 2),
(9, 4, 4, 2),
(10, 5, 1, 1),
(11, 5, 2, 1),
(12, 5, 3, 1),
(13, 5, 4, 1),
(14, 5, 5, 1),
(15, 2, 1, 2);

--
-- 转储表的索引
--

--
-- 表的索引 `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- 表的索引 `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `food_id` (`food_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 限制导出的表
--

--
-- 限制表 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- 限制表 `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
