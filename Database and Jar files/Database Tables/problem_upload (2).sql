-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2019 at 08:23 AM
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
-- Table structure for table `problem_upload`
--

CREATE TABLE `problem_upload` (
  `id` int(11) NOT NULL,
  `Uploader` varchar(255) NOT NULL,
  `ProblemID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problem_upload`
--

INSERT INTO `problem_upload` (`id`, `Uploader`, `ProblemID`, `filename`, `path`, `added_date`) VALUES
(23, 'Himash', 2, 'Continue.txt', 'resources/Continue.txt', '2019-05-15 04:54:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `problem_upload`
--
ALTER TABLE `problem_upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProbemID_FK` (`ProblemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `problem_upload`
--
ALTER TABLE `problem_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `problem_upload`
--
ALTER TABLE `problem_upload`
  ADD CONSTRAINT `ProbemID_FK` FOREIGN KEY (`ProblemID`) REFERENCES `problem` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
