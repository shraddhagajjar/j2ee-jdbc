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
-- Database: `ebookshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `price`, `qty`) VALUES
(1001, 'Java for dummies', 'Tan Ah Teck', 11.11, 11),
(1002, 'More Java for dummies', 'Tan Ah Teck', 22.22, 22),
(1003, 'More Java for more dummies', 'Mohammad Ali', 33.33, 33),
(1004, 'A Cup of Java', 'Kumar', 55.55, 55),
(1005, 'A Teaspoon of Java', 'Kevin Jones', 66.66, 66);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
