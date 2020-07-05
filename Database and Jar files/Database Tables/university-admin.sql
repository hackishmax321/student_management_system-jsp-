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
-- Table structure for table `university-admin`
--

CREATE TABLE `university-admin` (
  `UniversityID` int(11) NOT NULL,
  `AcademicS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `university-admin`
--

INSERT INTO `university-admin` (`UniversityID`, `AcademicS`) VALUES
(100453, '23243242');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `university-admin`
--
ALTER TABLE `university-admin`
  ADD PRIMARY KEY (`UniversityID`,`AcademicS`),
  ADD KEY `AdminID_FK` (`AcademicS`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `university-admin`
--
ALTER TABLE `university-admin`
  ADD CONSTRAINT `AdminID_FK` FOREIGN KEY (`AcademicS`) REFERENCES `university` (`StaffID`),
  ADD CONSTRAINT `UniID_FK` FOREIGN KEY (`UniversityID`) REFERENCES `university_list` (`UniversityID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
