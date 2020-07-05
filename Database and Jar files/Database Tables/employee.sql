-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2019 at 01:54 PM
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
-- Database: `employee`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `firstname`, `lastname`, `filename`, `path`, `added_date`) VALUES
(1, 'dharmesh', 'mourya', 'EAadhaar Dharmesh Mourya.pdf', 'resources\\EAadhaar Dharmesh Mourya.pdf', '2018-10-18 16:52:12'),
(2, 'dharmya', 'mourya', 'Dharmesh Resume.docx', 'resources\\Dharmesh Resume.docx', '2018-10-18 16:53:48'),
(3, 'tt', 'tt', 'mqdefault.jpg', 'resources\\mqdefault.jpg', '2018-10-18 16:54:24'),
(4, 'qq', 'qq', 'subtittle.txt', 'resources\\subtittle.txt', '2018-10-18 16:54:39'),
(5, 'qq', 'qq', '2.txt', 'resources\\2.txt', '2018-10-18 17:00:46'),
(6, 'Ishan', 'Gayantha', '20190130_115719.jpg', 'resources\\20190130_115719.jpg', '2019-03-31 04:37:13'),
(8, 'dfd', 'fdg', '20190130_115719.jpg', 'resources\\20190130_115719.jpg', '2019-03-31 06:08:44'),
(9, 'fd', 'fg', 'dcy8ygu-545441cd-391d-401e-a4f6-47d96b5fcff5.png', 'resources\\dcy8ygu-545441cd-391d-401e-a4f6-47d96b5fcff5.png', '2019-03-31 06:11:19'),
(10, 'JAGS2dgs', 'sdsd', 'sustainable-wallpaper.jpg', 'resources\\sustainable-wallpaper.jpg', '2019-03-31 06:55:10'),
(11, 'JAGS2dgs2', 'sdsd', 'dept-of-marine-engineering-02-mobile.jpg', 'resources\\dept-of-marine-engineering-02-mobile.jpg', '2019-03-31 06:59:19'),
(12, 'Ishan 788', 'Gayantha', 'ArboWebForestUserManual.pdf', 'resources;ArboWebForestUserManual.pdf', '2019-03-31 15:49:23'),
(13, 'Ishan2', 'Gayantha2', 'Continue.txt', 'resources;Continue.txt', '2019-03-31 18:37:17'),
(14, 'Ishan', 'Gayantha', 'ISAD254SL Coursework (Provisional).pdf', 'resources;ISAD254SL Coursework (Provisional).pdf', '2019-05-08 11:52:03'),
(15, 'Ishan', 'Gayantha', 'ISAD254SL Coursework (Provisional).pdf', 'resources;ISAD254SL Coursework (Provisional).pdf', '2019-05-08 11:57:08'),
(16, 'Himash', 'Gayantha', 'Fact Analysis (Group No. 11).docx', 'resources;Fact Analysis (Group No. 11).docx', '2019-05-08 11:58:17'),
(17, 'Himash', 'Gayantha2', 'Mother\'s ID.psd', 'resources;Mother\'s ID.psd', '2019-05-08 12:01:01'),
(18, 'Himash', 'Gayantha2', 'Mother\'s ID.psd', 'resources;Mother\'s ID.psd', '2019-05-08 12:02:05'),
(19, 'Himash', 'Bagawath Geetha', 'PUSL2002_Model_Paper.pdf', 'resources;PUSL2002_Model_Paper.pdf', '2019-05-08 12:06:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
