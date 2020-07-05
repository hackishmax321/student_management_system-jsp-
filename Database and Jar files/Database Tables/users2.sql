-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:15 AM
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
-- Table structure for table `users2`
--

CREATE TABLE `users2` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `PhoneNo` varchar(10) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `University` varchar(50) DEFAULT NULL,
  `UniID` varchar(20) DEFAULT NULL,
  `Password` varchar(12) NOT NULL,
  `Verified` tinyint(1) NOT NULL DEFAULT '0',
  `UserImg` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users2`
--

INSERT INTO `users2` (`ID`, `FirstName`, `LastName`, `DoB`, `PhoneNo`, `Email`, `University`, `UniID`, `Password`, `Verified`, `UserImg`) VALUES
INSERT INTO `users2` (`ID`, `FirstName`, `LastName`, `DoB`, `PhoneNo`, `Email`, `University`, `UniID`, `Password`, `Verified`, `UserImg`) VALUES
INSERT INTO `users2` (`ID`, `FirstName`, `LastName`, `DoB`, `PhoneNo`, `Email`, `University`, `UniID`, `Password`, `Verified`, `UserImg`) VALUES
(3, 'Ishan89', 'Gayantha', '2019-03-26', '0342257187', 'hacish123@gmail.com', '', '', '77', 0, NULL);
INSERT INTO `users2` (`ID`, `FirstName`, `LastName`, `DoB`, `PhoneNo`, `Email`, `University`, `UniID`, `Password`, `Verified`, `UserImg`) VALUES
INSERT INTO `users2` (`ID`, `FirstName`, `LastName`, `DoB`, `PhoneNo`, `Email`, `University`, `UniID`, `Password`, `Verified`, `UserImg`) VALUES
(5, 'Ishan6', 'Gayantha', '2021-06-04', '0342257187', 'hacish123@gmail.com', '', '', '111', 1, NULL),
(6, 'Ishan90', 'Gayantha', '2019-08-03', '0342257187', 'hacish123@gmail.com', '', '', '11', 0, NULL);
INSERT INTO `users2` (`ID`, `FirstName`, `LastName`, `DoB`, `PhoneNo`, `Email`, `University`, `UniID`, `Password`, `Verified`, `UserImg`) VALUES
INSERT INTO `users2` (`ID`, `FirstName`, `LastName`, `DoB`, `PhoneNo`, `Email`, `University`, `UniID`, `Password`, `Verified`, `UserImg`) VALUES
(8, 'Kalpa', 'Degala', '1996-11-11', '0772345523', 'deegalaKalpa123@yahoomail.com', 'university of Sabaragamuwa', '1223422', '11122', 0, NULL),
(9, 'Uoghi', 'Nicolas', '1993-02-11', '0723437899', 'Uoghi45@russianmail.com', 'NSBM', '23243242', '333', 0, NULL),
(10, 'Gashan', 'Gayantha', '2019-04-08', '0342257187', 'hacish123@gmail.com', 'university of Sabaragamuwa', '23243245', '1111', 1, NULL),
(11, 'Gehan', 'Block', '1989-08-12', '0764589345', 'block89@yahoo.com', 'University of Colombo', '679078S', '00000000s', 0, NULL),
(12, 'MacTrish', 'Macmad Trish', '1997-07-25', '0112312954', 'mactrish234@yahoo.com', 'NSBM', '23246232', 'gen188888', 0, NULL),
(13, 'GrimLand', 'Griman Soisa', '1995-05-08', '0774532122', 'grimland123@gmail.com', 'NSBM', '10234534', '111111111', 0, NULL),
(14, 'Ishan123', 'Gayantha', '2003-05-09', '342257187', 'hacish123@gmail.com', 'university of Sabaragamuwa', '23243245', '111111111', 0, NULL),
(15, 'Ishan3545', 'Gayantha', '2003-05-09', '0342257187', 'hacish123@gmail.com', 'university of Sabaragamuwa', '23243245', '111111111', 0, NULL),
(16, 'Ishan12134', 'Gayantha', '2019-05-09', '0342257187', 'hacish123@gmail.com', 'university of Sabaragamuwa', '23243245', '222222222', 0, NULL),
(17, 'Ishan2124234', 'Gayantha', '2019-05-09', '0342257187', 'hacish123@gmail.com', 'university of Sabaragamuwa', '23243245', '1212121212', 0, NULL),
(18, 'Ishan3wrsr', 'Gayantha', '2019-05-09', '0342257187', 'hacish123@gmail.com', 'university of Sabaragamuwa', '57', '1212121212', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users2`
--
ALTER TABLE `users2`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users2`
--
ALTER TABLE `users2`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;