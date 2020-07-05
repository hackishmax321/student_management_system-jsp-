-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2019 at 09:07 PM
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
-- Table structure for table `problem_like`
--

CREATE TABLE `problem_like` (
  `ProID` int(11) NOT NULL,
  `LikeFrom` varchar(50) NOT NULL,
  `Date_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problem_like`
--

INSERT INTO `problem_like` (`ProID`, `LikeFrom`, `Date_Time`) VALUES
(1, 'Himash', NULL),
(26, 'Himash', NULL),
(28, 'Himash', NULL),
(29, 'Himash', NULL),
(29, 'ishanGa2', NULL),
(29, 'Risitha', NULL),
(29, 'YashRaj', NULL),
(31, 'Himash', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `problem_like`
--
ALTER TABLE `problem_like`
  ADD PRIMARY KEY (`ProID`,`LikeFrom`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `problem_like`
--
ALTER TABLE `problem_like`
  ADD CONSTRAINT `CommentID_FK` FOREIGN KEY (`ProID`) REFERENCES `comment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
