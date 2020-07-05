-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:07 AM
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
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) NOT NULL,
  `announcement` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `UniversityID` int(11) NOT NULL,
  `Sender` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `announcement`, `category`, `UniversityID`, `Sender`) VALUES
(1, 'ugihkjhkjhkjhjhj', 'student', 10012, NULL),
(2, 'oooww', 'student', 10012, NULL),
(3, 'aaaaa', 'teacher', 10012, NULL),
(4, 'Fuck You Soldier', 'teacher', 10012, NULL),
(5, 'As You see... ', 'teacher', 10012, NULL),
(6, 'As You see... ', 'student', 10014, NULL),
(7, 'All Students should participate next event..', 'Undergraduate', 10012, 'ishanGa2'),
(8, '', 'Undergraduate', 10012, 'ishanGa2'),
(9, 'I here by your side', 'Undergraduate', 10012, 'ishanGa2'),
(10, 'Hate is what we got', 'Undergraduate', 10012, 'Himash');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UniIDAnn_FK` (`UniversityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `UniIDAnn_FK` FOREIGN KEY (`UniversityID`) REFERENCES `identified_university` (`UniID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
