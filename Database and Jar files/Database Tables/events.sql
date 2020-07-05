-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:09 AM
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
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Handle` varchar(25) NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Target` varchar(50) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`ID`, `Name`, `Handle`, `Venue`, `Target`, `Image`, `Description`, `Type`) VALUES
(1, 'SIPMA Test', 'SLIT ', 'Youth Center, Maharagama', 'All', '0030254586.jpg', 'Crack status of all PC video games protected by DRM like DENUVO, STEAM or VMPROTECT. Crackwatch monitors cracks for all games for new cracks from', 'S'),
(2, 'AIDS', 'University of Moratuwa', 'Main Auditorium of University of Moratuwa', 'All', '1.2-1600x1200.jpg', '', 'S'),
(3, 'Dogd', 'ass', 'Main Auditorium of University of Moratuwa', 'All', '', '', ''),
(4, 'Jacl', '', 'Main Auditorium of University of Moratuwa', 'All', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
