-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:08 AM
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
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Handle` varchar(25) NOT NULL,
  `DateE` date DEFAULT NULL,
  `TimeE` time DEFAULT NULL,
  `Venue` varchar(50) NOT NULL,
  `Target` varchar(25) DEFAULT 'All',
  `Description` varchar(200) NOT NULL,
  `Category` varchar(50) NOT NULL DEFAULT 'S',
  `Poster` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`ID`, `Name`, `Handle`, `DateE`, `TimeE`, `Venue`, `Target`, `Description`, `Category`, `Poster`) VALUES
(1, 'APP Development Workshop', 'University of Moratuwa', '2019-03-30', '09:03:00', 'Savoy 3D', 'All', '', 'W', 'resources/images.jpg'),
(2, 'Homecoming', 'SLIT ', '2019-04-03', '19:05:00', 'dfh', 'University of Peradeniya', 'Students\' Night', 'S', NULL),
(3, 'Fright Night', 'River Com', '2019-04-20', '18:00:00', 'Placid Hotel 2', 'NSBM', '', 'S', NULL),
(4, 'ACBT ICT Workshop', 'ACBT', '2019-05-10', '09:05:00', 'Main Auditorium of University of Kelaniya', 'All', '', 'W', NULL),
(5, 'International', 'CSSL', '2019-05-23', NULL, 'CSSL Main HQ', 'University of Moratuwa', '', 'C', 'resources/download.png'),
(6, 'Lets Talk', 'WHO', '2019-04-03', NULL, 'Hotel Savana - Hall NO. 03', 'University of Peradeniya', '', 'S', 'resources/poster.jpg'),
(7, 'IOT Sri Lanka', 'Mobitel', '2019-05-08', NULL, 'Mount Lavania Hotel', 'All', '', 'W', 'resources/image_1525239718-adb4245ba2.jpg'),
(8, 'E - Commerce Magento & Beyon', 'ISM AP-AC', '2019-04-19', NULL, 'Spark  Auditorium, Anandaha Nahimi Mw', 'All', '', 'S', 'resources/e-Commerce, Magento and beyond (8).jpg'),
(9, '9 MOIS', '', '2019-04-08', NULL, 'IT Department', 'All', '', 'S', 'resources/download (1).png'),
(10, 'JAGS2dgs', 'fdg', '2019-03-13', NULL, 'Placid Hotel 2', 'All', '', 'S', 'resources/ID - 10638279( D. P. I Gayantha).jpg'),
(11, 'Avengers End Game', 'NSBM Movie Society', '2019-04-30', NULL, 'Savoy 3D', 'All', 'Join With us to watch Premier of AEG', 'E', 'resources/MV5BMTkxNTQzNTg4Nl5BMl5BanBnXkFtZTgwMzYzNDQ2NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg'),
(12, 'Start Up Sri Lanka ', 'SLASSCOM', '2019-05-22', NULL, 'MAS Innovation Center', 'All', 'AS You See...', 'W', 'resources/e_flyer_3 (1)_0.png'),
(13, 'Start Up Sri Lanka ', 'SLASSCOM', '2019-05-22', NULL, 'MAS Innovation Center', 'University of Sabaragamuw', 'AS You See...', 'C', 'resources/e_flyer_3 (1)_0.png'),
(14, 'Night of Hackers', 'IXXX Cop.', '2019-05-17', NULL, 'NSBM', 'All', 'Join uus and win prices...', 'S', 'resources/MV5BMGY1NTVmY2QtN2NiOS00OWIyLWI0NGMtZTdiOTAxMTBjYWJlXkEyXkFqcGdeQXVyNDUzMzc3NTQ@._V1_.jpg'),
(15, 'Test 123', 'SLT', '2019-05-23', NULL, 'Placid Hotel 2sgd', 'All', 'vbbvnv --Test 4345', 'S', 'resources/MV5BMjE3MjY1OTc1Nl5BMl5BanBnXkFtZTgwMDk3NjczNjM@._V1_.jpg'),
(16, 'Test 1234', 'SLT', '2019-05-24', NULL, 'Placid Hotel', 'All', 'TESRWE', 'S', 'resources/MV5BMjE3MjY1OTc1Nl5BMl5BanBnXkFtZTgwMDk3NjczNjM@._V1_.jpg'),
(17, 'Test 12345', 'SLT', '2019-05-30', NULL, 'Placid Hotel', 'All', 'hhhjj', 'S', 'resources/MV5BMjE3MjY1OTc1Nl5BMl5BanBnXkFtZTgwMDk3NjczNjM@._V1_.jpg'),
(18, 'JAGS2dgs', 'SLT', '2019-05-15', NULL, 'Placid Hotel 2', 'All', 'jjkjk', 'S', 'resources/MV5BMzVjOTMwNjMtZGZlZi00NDZlLTg2N2EtMGNlYTA2ODZmMmJkXkEyXkFqcGdeQXVyMTE5NDkxMA@@._V1_SY1000_CR0,0,709,1000_AL_.jpg'),
(19, 'JAGS2dgs', 'sdsd', '2019-05-21', NULL, 'Placid Hotel 2', 'All', '', 'S', 'resources/MV5BMzVjOTMwNjMtZGZlZi00NDZlLTg2N2EtMGNlYTA2ODZmMmJkXkEyXkFqcGdeQXVyMTE5NDkxMA@@._V1_SY1000_CR0,0,709,1000_AL_.jpg'),
(20, 'JAGS2dgs', 'SLT', '2019-05-24', '15:02:00', 'Placid Hotel 2', 'All', 'kn,n,', 'S', 'resources/MV5BMzVjOTMwNjMtZGZlZi00NDZlLTg2N2EtMGNlYTA2ODZmMmJkXkEyXkFqcGdeQXVyMTE5NDkxMA@@._V1_SY1000_CR0,0,709,1000_AL_.jpg'),
(21, 'Final Test', 'SLT', '2019-05-11', '07:19:00', 'Placid Hotel', 'All', 'hj', 'S', 'resources/1024px-Logo_of_YouTube_(2015-2017).svg.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
