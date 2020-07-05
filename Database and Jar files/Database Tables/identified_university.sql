-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:10 AM
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
-- Table structure for table `identified_university`
--

CREATE TABLE `identified_university` (
  `UniID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `identified_university`
--

INSERT INTO `identified_university` (`UniID`, `Name`) VALUES
(10011, 'University of Test Lanka'),
(10012, 'NSBM'),
(10013, 'UOK'),
(10014, 'University of Peradeniya'),
(10015, 'University of Keleniya'),
(10016, 'NSBM Green University');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `identified_university`
--
ALTER TABLE `identified_university`
  ADD PRIMARY KEY (`UniID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `identified_university`
--
ALTER TABLE `identified_university`
  MODIFY `UniID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10017;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
