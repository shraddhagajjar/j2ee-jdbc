-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2016 at 11:45 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `student`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseId` int(11) NOT NULL DEFAULT '0',
  `subjectId` varchar(5) DEFAULT NULL,
  `courseNumber` int(11) DEFAULT NULL,
  `numOfCredits` int(11) DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `subjectId`, `courseNumber`, `numOfCredits`) VALUES
(1111, 'CS', 501, 3),
(1112, 'CS', 532, 3),
(1113, 'PHYS', 101, 4),
(1114, 'SOC', 102, 4);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE IF NOT EXISTS `enrollment` (
  `id` int(11) DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id`, `courseId`, `grade`) VALUES
(1001, 1111, 'A'),
(1001, 1112, 'A-'),
(1002, 1113, 'A'),
(1002, 1114, 'B+'),
(1003, 1111, 'A-'),
(1003, 1113, 'B+'),
(1004, 1111, 'A'),
(1004, 1112, 'A'),
(1006, 1111, 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `firstname`, `lastname`) VALUES
(1001, 'Aamir', 'Khan'),
(1002, 'Salman', 'Khan'),
(1003, 'Shah Rukh', 'Khan'),
(1004, 'Deepika', 'Padukone'),
(1005, 'Katrina', 'Kaif'),
(1006, 'shraddha', 'gajjar');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
