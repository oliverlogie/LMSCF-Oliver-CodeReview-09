-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2020 at 01:25 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_oliver_kraus_postoffice`
--
CREATE DATABASE IF NOT EXISTS `cr09_oliver_kraus_postoffice` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_oliver_kraus_postoffice`;

-- --------------------------------------------------------

--
-- Table structure for table `bring_pickup`
--

CREATE TABLE `bring_pickup` (
  `bring_pickup_id` int(11) NOT NULL,
  `fk_employees_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `fk_customer_adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `fk_customer_adress_id`) VALUES
(1, 'Anna Mana', 1),
(2, 'Micheal Neuhold', 2),
(3, 'Lisa Innauer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_adress`
--

CREATE TABLE `customer_adress` (
  `customer_adress_id` int(11) NOT NULL,
  `customer_street` varchar(50) DEFAULT NULL,
  `customer_number` int(10) DEFAULT NULL,
  `customer_zip` int(4) DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_adress`
--

INSERT INTO `customer_adress` (`customer_adress_id`, `customer_street`, `customer_number`, `customer_zip`, `customer_city`, `customer_country`) VALUES
(1, 'Favoritenstraße', 80, 1040, 'Vienna', 'Austria'),
(2, 'Tokiostraße', 15, 1010, 'Vienna', 'Austria'),
(3, 'Donaustraße', 56, 1200, 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employees_id` int(11) NOT NULL,
  `employees_name` varchar(50) DEFAULT NULL,
  `employee_departement` varchar(50) DEFAULT NULL,
  `fk_post_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employees_id`, `employees_name`, `employee_departement`, `fk_post_office_id`) VALUES
(1, 'Nathanial Blue', 'Counter', 1),
(2, 'Margret Miller', 'Postman', 2),
(3, 'Nina Reis', 'Accounting', 3);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `pkg_weight` int(11) DEFAULT NULL,
  `pkg_size` int(11) DEFAULT NULL,
  `fk_process_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `pkg_weight`, `pkg_size`, `fk_process_id`) VALUES
(1, 100, 30, 1),
(2, 200, 60, 2),
(3, 500, 100, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post_office`
--

CREATE TABLE `post_office` (
  `post_office_id` int(11) NOT NULL,
  `opening_hours` varchar(50) DEFAULT NULL,
  `fk_post_office_location_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office`
--

INSERT INTO `post_office` (`post_office_id`, `opening_hours`, `fk_post_office_location_id`, `fk_package_id`) VALUES
(1, '9:00 - 18:00', 1, 1),
(2, '13:00-20:00', 2, 2),
(3, '11:00-17:00', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post_office_location`
--

CREATE TABLE `post_office_location` (
  `post_office_location_id` int(11) NOT NULL,
  `post_street` varchar(50) DEFAULT NULL,
  `post_number` int(11) DEFAULT NULL,
  `post_zip` int(4) DEFAULT NULL,
  `post_city` varchar(50) DEFAULT NULL,
  `post_country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office_location`
--

INSERT INTO `post_office_location` (`post_office_location_id`, `post_street`, `post_number`, `post_zip`, `post_city`, `post_country`) VALUES
(1, 'Milanostraße', 15, 1050, 'Vienna', 'Austria'),
(2, 'Ghettostraße', 20, 1040, 'Vienna', 'Austria'),
(3, 'Pockelgasse', 59, 1220, 'Vienna', 'Austria'),
(4, 'Ungergasse', 17, 1020, 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `processing_system`
--

CREATE TABLE `processing_system` (
  `process_id` int(11) NOT NULL,
  `receive_date` date DEFAULT NULL,
  `receive_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing_system`
--

INSERT INTO `processing_system` (`process_id`, `receive_date`, `receive_time`) VALUES
(1, '2020-02-01', '12:57:34'),
(2, '2020-05-03', '09:15:37'),
(3, '2020-03-25', '14:35:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bring_pickup`
--
ALTER TABLE `bring_pickup`
  ADD PRIMARY KEY (`bring_pickup_id`),
  ADD KEY `fk_employees_id` (`fk_employees_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_adress_id` (`fk_customer_adress_id`);

--
-- Indexes for table `customer_adress`
--
ALTER TABLE `customer_adress`
  ADD PRIMARY KEY (`customer_adress_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employees_id`),
  ADD KEY `fk_post_office_id` (`fk_post_office_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_process_id` (`fk_process_id`);

--
-- Indexes for table `post_office`
--
ALTER TABLE `post_office`
  ADD PRIMARY KEY (`post_office_id`),
  ADD KEY `fk_post_office_location_id` (`fk_post_office_location_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indexes for table `post_office_location`
--
ALTER TABLE `post_office_location`
  ADD PRIMARY KEY (`post_office_location_id`);

--
-- Indexes for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`process_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bring_pickup`
--
ALTER TABLE `bring_pickup`
  MODIFY `bring_pickup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_adress`
--
ALTER TABLE `customer_adress`
  MODIFY `customer_adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_office`
--
ALTER TABLE `post_office`
  MODIFY `post_office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_office_location`
--
ALTER TABLE `post_office_location`
  MODIFY `post_office_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `processing_system`
--
ALTER TABLE `processing_system`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bring_pickup`
--
ALTER TABLE `bring_pickup`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employees_id` FOREIGN KEY (`fk_employees_id`) REFERENCES `employees` (`employees_id`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_adress_id` FOREIGN KEY (`fk_customer_adress_id`) REFERENCES `customer_adress` (`customer_adress_id`) ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_post_office_id` FOREIGN KEY (`fk_post_office_id`) REFERENCES `post_office` (`post_office_id`) ON UPDATE CASCADE;

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `fk_process_id` FOREIGN KEY (`fk_process_id`) REFERENCES `processing_system` (`process_id`) ON UPDATE CASCADE;

--
-- Constraints for table `post_office`
--
ALTER TABLE `post_office`
  ADD CONSTRAINT `fk_package_id` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_post_office_location_id` FOREIGN KEY (`fk_post_office_location_id`) REFERENCES `post_office_location` (`post_office_location_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
