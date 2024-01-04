-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 04, 2024 at 06:18 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `CONTRACT`
--

CREATE TABLE `CONTRACT` (
  `dId` int NOT NULL,
  `ctId` int NOT NULL,
  `Sdate` date DEFAULT NULL,
  `Ctime` time DEFAULT NULL,
  `Cname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `cId` int NOT NULL,
  `Cname` varchar(255) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DEALER`
--

CREATE TABLE `DEALER` (
  `dId` int NOT NULL,
  `Dname` varchar(255) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DEALER_ITEM`
--

CREATE TABLE `DEALER_ITEM` (
  `dId` int NOT NULL,
  `iId` int NOT NULL,
  `dprice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DEALER_SHOP`
--

CREATE TABLE `DEALER_SHOP` (
  `dId` int NOT NULL,
  `sId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `sId` int DEFAULT NULL,
  `SSN` char(9) NOT NULL,
  `Ename` varchar(255) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Sdate` date DEFAULT NULL,
  `Edate` date DEFAULT NULL,
  `Etype` varchar(50) DEFAULT NULL,
  `Level` int DEFAULT NULL,
  `Asalary` decimal(10,2) DEFAULT NULL,
  `Agency` varchar(255) DEFAULT NULL,
  `Hsalary` decimal(10,2) DEFAULT NULL,
  `Institute` varchar(255) DEFAULT NULL,
  `Itype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ITEM`
--

CREATE TABLE `ITEM` (
  `iId` int NOT NULL,
  `Iname` varchar(255) DEFAULT NULL,
  `Sprice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OLDPRICE`
--

CREATE TABLE `OLDPRICE` (
  `iId` int NOT NULL,
  `Sprice` decimal(10,2) NOT NULL,
  `Sdate` date DEFAULT NULL,
  `Edate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ORDERS`
--

CREATE TABLE `ORDERS` (
  `oId` int NOT NULL,
  `sId` int DEFAULT NULL,
  `cId` int DEFAULT NULL,
  `Odate` date DEFAULT NULL,
  `Ddate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ORDER_ITEM`
--

CREATE TABLE `ORDER_ITEM` (
  `oId` int NOT NULL,
  `sId` int NOT NULL,
  `iId` int NOT NULL,
  `Icount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SHOP`
--

CREATE TABLE `SHOP` (
  `sId` int NOT NULL,
  `Sname` varchar(255) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `StateAb` char(2) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Sdate` date DEFAULT NULL,
  `Telno` varchar(15) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SHOP_CUSTOMER`
--

CREATE TABLE `SHOP_CUSTOMER` (
  `sId` int NOT NULL,
  `cId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SHOP_ITEM`
--

CREATE TABLE `SHOP_ITEM` (
  `sId` int NOT NULL,
  `iId` int NOT NULL,
  `Scount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CONTRACT`
--
ALTER TABLE `CONTRACT`
  ADD PRIMARY KEY (`dId`,`ctId`);

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `DEALER`
--
ALTER TABLE `DEALER`
  ADD PRIMARY KEY (`dId`);

--
-- Indexes for table `DEALER_ITEM`
--
ALTER TABLE `DEALER_ITEM`
  ADD PRIMARY KEY (`dId`,`iId`),
  ADD KEY `iId` (`iId`);

--
-- Indexes for table `DEALER_SHOP`
--
ALTER TABLE `DEALER_SHOP`
  ADD PRIMARY KEY (`dId`,`sId`),
  ADD KEY `sId` (`sId`);

--
-- Indexes for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `sId` (`sId`);

--
-- Indexes for table `ITEM`
--
ALTER TABLE `ITEM`
  ADD PRIMARY KEY (`iId`);

--
-- Indexes for table `OLDPRICE`
--
ALTER TABLE `OLDPRICE`
  ADD PRIMARY KEY (`iId`,`Sprice`);

--
-- Indexes for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD PRIMARY KEY (`oId`),
  ADD KEY `sId` (`sId`),
  ADD KEY `cId` (`cId`);

--
-- Indexes for table `ORDER_ITEM`
--
ALTER TABLE `ORDER_ITEM`
  ADD PRIMARY KEY (`oId`,`sId`,`iId`),
  ADD KEY `sId` (`sId`),
  ADD KEY `iId` (`iId`);

--
-- Indexes for table `SHOP`
--
ALTER TABLE `SHOP`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `SHOP_CUSTOMER`
--
ALTER TABLE `SHOP_CUSTOMER`
  ADD PRIMARY KEY (`sId`,`cId`),
  ADD KEY `cId` (`cId`);

--
-- Indexes for table `SHOP_ITEM`
--
ALTER TABLE `SHOP_ITEM`
  ADD PRIMARY KEY (`sId`,`iId`),
  ADD KEY `iId` (`iId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CONTRACT`
--
ALTER TABLE `CONTRACT`
  ADD CONSTRAINT `CONTRACT_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `DEALER` (`dId`);

--
-- Constraints for table `DEALER_ITEM`
--
ALTER TABLE `DEALER_ITEM`
  ADD CONSTRAINT `DEALER_ITEM_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `DEALER` (`dId`),
  ADD CONSTRAINT `DEALER_ITEM_ibfk_2` FOREIGN KEY (`iId`) REFERENCES `ITEM` (`iId`);

--
-- Constraints for table `DEALER_SHOP`
--
ALTER TABLE `DEALER_SHOP`
  ADD CONSTRAINT `DEALER_SHOP_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `DEALER` (`dId`),
  ADD CONSTRAINT `DEALER_SHOP_ibfk_2` FOREIGN KEY (`sId`) REFERENCES `SHOP` (`sId`);

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `SHOP` (`sId`);

--
-- Constraints for table `OLDPRICE`
--
ALTER TABLE `OLDPRICE`
  ADD CONSTRAINT `OLDPRICE_ibfk_1` FOREIGN KEY (`iId`) REFERENCES `ITEM` (`iId`);

--
-- Constraints for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `SHOP` (`sId`),
  ADD CONSTRAINT `ORDERS_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `CUSTOMER` (`cId`);

--
-- Constraints for table `ORDER_ITEM`
--
ALTER TABLE `ORDER_ITEM`
  ADD CONSTRAINT `ORDER_ITEM_ibfk_1` FOREIGN KEY (`oId`) REFERENCES `ORDERS` (`oId`),
  ADD CONSTRAINT `ORDER_ITEM_ibfk_2` FOREIGN KEY (`sId`) REFERENCES `SHOP` (`sId`),
  ADD CONSTRAINT `ORDER_ITEM_ibfk_3` FOREIGN KEY (`iId`) REFERENCES `ITEM` (`iId`);

--
-- Constraints for table `SHOP_CUSTOMER`
--
ALTER TABLE `SHOP_CUSTOMER`
  ADD CONSTRAINT `SHOP_CUSTOMER_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `SHOP` (`sId`),
  ADD CONSTRAINT `SHOP_CUSTOMER_ibfk_2` FOREIGN KEY (`cId`) REFERENCES `CUSTOMER` (`cId`);

--
-- Constraints for table `SHOP_ITEM`
--
ALTER TABLE `SHOP_ITEM`
  ADD CONSTRAINT `SHOP_ITEM_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `SHOP` (`sId`),
  ADD CONSTRAINT `SHOP_ITEM_ibfk_2` FOREIGN KEY (`iId`) REFERENCES `ITEM` (`iId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
