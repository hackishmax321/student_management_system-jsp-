-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:12 AM
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
-- Table structure for table `university_spevent`
--

CREATE TABLE `university_spevent` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `OpenDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Description` varchar(1000) NOT NULL,
  `Poster` varchar(200) DEFAULT NULL,
  `UniID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university_spevent`
--

INSERT INTO `university_spevent` (`ID`, `Name`, `OpenDate`, `EndDate`, `Time`, `Description`, `Poster`, `UniID`) VALUES
(1, 'Career Fair', '2019-07-19', '2019-07-21', NULL, 'Will decide your career', NULL, 100453),
(2, 'Graduation ', '2019-12-08', '2019-12-14', NULL, 'Final days', NULL, 100453);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `university_spevent`
--
ALTER TABLE `university_spevent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UniIDSP_FK` (`UniID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `university_spevent`
--
ALTER TABLE `university_spevent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `university_spevent`
--
ALTER TABLE `university_spevent`
  ADD CONSTRAINT `UniIDSP_FK` FOREIGN KEY (`UniID`) REFERENCES `university_list` (`UniversityID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
