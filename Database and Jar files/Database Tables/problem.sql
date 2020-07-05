-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:11 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javeeesample`
--

-- --------------------------------------------------------

--
-- Table structure for table `problem`
--

CREATE TABLE `problem` (
  `ID` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Category` varchar(50) DEFAULT 'Not Given',
  `Uploader` varchar(50) NOT NULL,
  `Taker` varchar(50) DEFAULT 'Not Taken',
  `Submitted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problem`
--

INSERT INTO `problem` (`ID`, `Title`, `Description`, `Category`, `Uploader`, `Taker`, `Submitted`) VALUES
(1, 'MONOVA Project', 'Blah- Blah', 'Not Given', 'TEx GI', 'Ishan', 0),
(2, 'APEX Safeguard', 'An IoT project is the act of connecting any physical object to the Internet to collect and share data. How we use and share that data depends on the purpose of the IoT project. Whether you’re connecting windmills to monitor performance data, or connecting machinery to monitor itself for breakage, the data generated from these projects can be used in a variety of ways. With the right hardware, software, connectivity, and know how, you can connect any object in the home, factory, or farm and strea', 'Security', 'APEX Sri Lanka', 'Not Taken', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `problem`
--
ALTER TABLE `problem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
