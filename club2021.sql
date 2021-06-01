-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2021 at 01:17 PM
-- Server version: 5.7.34-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `club2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `committees`
--

CREATE TABLE `committees` (
  `committee_id` int(11) NOT NULL,
  `position` varchar(35) NOT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `committees`
--

INSERT INTO `committees` (`committee_id`, `position`, `member_id`) VALUES
(27, 'Field Day - Coord', 1111),
(28, 'Field Day - SSB', 549),
(29, 'Field Day - CW', 230),
(30, 'Field Day - GOTA', 82),
(31, 'Repeater - Lead', 230),
(32, 'Repeater', 346),
(33, 'Repeater', 202);

-- --------------------------------------------------------

--
-- Table structure for table `elmers`
--

CREATE TABLE `elmers` (
  `elmer_id` int(11) NOT NULL,
  `position` varchar(20) NOT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elmers`
--

INSERT INTO `elmers` (`elmer_id`, `position`, `member_id`) VALUES
(1, 'General Help', 474),
(2, 'Digital Modes', 474),
(3, 'Digital Modes', 346),
(4, 'Digital Modes', 230),
(5, 'VHF-UHF', 185),
(6, 'Interference', 538),
(7, 'Kits/Assembly', 185),
(9, 'PC Programming', 202),
(10, 'ARRL VEC Liaison', 951),
(26, 'Troubleshooting', 1072);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(10) NOT NULL,
  `forename` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surname` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `street` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `house` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `postcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USA',
  `emailpers` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailfail` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `phonepri` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonealt` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonework` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `showdetail` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `callsign` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licclass` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arrlmember` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT NULL,
  `membertype` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  `expiredate` date DEFAULT NULL,
  `duesdate` date DEFAULT NULL,
  `newsdist` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duesamount` decimal(10,2) NOT NULL DEFAULT '20.00',
  `payment_by` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duesreceived` decimal(10,2) DEFAULT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `members`
--

-- --------------------------------------------------------

--
-- Table structure for table `officers`
--

CREATE TABLE `officers` (
  `officer_id` int(11) NOT NULL,
  `position` varchar(15) NOT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `officers`
--


-- --------------------------------------------------------

--
-- Table structure for table `silent_key`
--

CREATE TABLE `silent_key` (
  `sk_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `born` date DEFAULT NULL,
  `passed` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `silent_key`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `committees`
--
ALTER TABLE `committees`
  ADD PRIMARY KEY (`committee_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `elmers`
--
ALTER TABLE `elmers`
  ADD PRIMARY KEY (`elmer_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `id` (`member_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `officers`
--
ALTER TABLE `officers`
  ADD PRIMARY KEY (`officer_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `silent_key`
--
ALTER TABLE `silent_key`
  ADD PRIMARY KEY (`sk_id`),
  ADD KEY `member_id` (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `committees`
--
ALTER TABLE `committees`
  MODIFY `committee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `elmers`
--
ALTER TABLE `elmers`
  MODIFY `elmer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1205;

--
-- AUTO_INCREMENT for table `officers`
--
ALTER TABLE `officers`
  MODIFY `officer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `silent_key`
--
ALTER TABLE `silent_key`
  MODIFY `sk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `committees`
--
ALTER TABLE `committees`
  ADD CONSTRAINT `committees_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `elmers`
--
ALTER TABLE `elmers`
  ADD CONSTRAINT `elmers_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `officers`
--
ALTER TABLE `officers`
  ADD CONSTRAINT `officers_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `silent_key`
--
ALTER TABLE `silent_key`
  ADD CONSTRAINT `sk_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
