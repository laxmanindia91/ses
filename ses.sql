-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2016 at 11:20 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ses`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=124 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `isActive`) VALUES
(1, 'Jquery', 1),
(2, 'JavaScript', 1),
(119, 'Java', 1),
(123, 'Bootstrap', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(50) NOT NULL,
  `duration` varchar(30) NOT NULL,
  `startdatetime` datetime NOT NULL,
  `enddatetime` datetime NOT NULL,
  `totalquestion` int(50) NOT NULL,
  `totalmarks` int(50) NOT NULL,
  `level` varchar(30) NOT NULL,
  `category` varchar(20) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `exam_name`, `duration`, `startdatetime`, `enddatetime`, `totalquestion`, `totalmarks`, `level`, `category`, `isActive`) VALUES
(1, 'anusha', '10', '2016-11-28 14:03:39', '2016-12-30 14:03:39', 15, 30, 'Medium', '1,2', 1),
(2, 'abc', '20', '2016-11-28 14:04:32', '2016-12-02 14:04:32', 10, 20, 'Tough', '119', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_ques`
--

CREATE TABLE IF NOT EXISTS `exam_ques` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `ques_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `level` varchar(50) NOT NULL,
  `category` int(10) NOT NULL,
  `createdby` varchar(50) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `level`, `category`, `createdby`, `createdon`, `isActive`) VALUES
(17, 'gds', 'medium', 2, 'admin', '2016-11-29 08:44:29', 1),
(18, 'what is jquery', 'easy', 1, 'admin', '2016-11-29 08:51:01', 1),
(19, 'what is java?', 'medium', 119, 'admin', '2016-11-29 08:51:35', 1),
(20, 'what is java1?\r\n', 'tough', 119, 'admin', '2016-11-29 08:52:01', 1),
(21, 'what is bootstrap?', 'easy', 123, 'admin', '2016-11-29 08:52:37', 1),
(22, 'what is jquery2?', 'medium', 1, 'admin', '2016-11-29 09:42:39', 1),
(23, 'what is javascript??', 'medium', 2, 'admin', '2016-11-29 09:42:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ques_option`
--

CREATE TABLE IF NOT EXISTS `ques_option` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) NOT NULL,
  `options` varchar(300) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ques_option`
--

INSERT INTO `ques_option` (`id`, `question_id`, `options`, `answer`, `isActive`) VALUES
(3, 17, 'dsg,dgsd2,dsgsds3,dsgds4', '2', 1),
(4, 18, 'option1,option2,option3,option4', '2', 1),
(5, 19, 'java11,java12,java13,java14', '3', 1),
(6, 20, 'java21,java22,java23,java24', '3', 1),
(7, 21, 'bootstrap11,bootstrap12,bootstrap13,bootstrap14', '4', 1),
(8, 22, 'jqery21,jqery22,jqery23,jqery24', '3', 1),
(9, 23, 'javascript11,javascript12,javascript13,javascript14', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) NOT NULL,
  `usr_id` int(10) NOT NULL,
  `marks_obtained` int(50) NOT NULL,
  `total_marks` int(50) NOT NULL,
  `created_on` datetime NOT NULL,
  `test_level` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `exam_id`, `usr_id`, `marks_obtained`, `total_marks`, `created_on`, `test_level`, `category`) VALUES
(1, 1, 4, 0, 30, '2016-11-30 16:12:18', 'Medium', '1,2'),
(2, 2, 4, 2, 20, '2016-11-30 16:12:36', 'Tough', '119'),
(3, 1, 4, 0, 30, '2016-11-30 16:14:30', 'Medium', '1,2'),
(4, 1, 4, 4, 30, '2016-11-30 16:19:53', 'Medium', '1,2'),
(5, 1, 4, 2, 30, '2016-11-30 16:23:29', 'Medium', '1,2');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `studentname` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobilno` varchar(12) NOT NULL,
  `role` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `createdon` varchar(20) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `studentname`, `password`, `email`, `mobilno`, `role`, `category`, `createdon`, `isActive`) VALUES
(1, 'navi', '1234', '0', '12344', 'student', '1', '2016/11/18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stud_attempt_test_result`
--

CREATE TABLE IF NOT EXISTS `stud_attempt_test_result` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) NOT NULL,
  `usr_id` int(10) NOT NULL,
  `ques_id` int(10) NOT NULL,
  `option` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobileno` varchar(12) NOT NULL,
  `role` varchar(50) NOT NULL,
  `createdon` date NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `mobileno`, `role`, `createdon`, `isActive`) VALUES
(1, 'admin', '123', 'laxman091@gmail.com', '67', 'adminstrator', '2016-11-09', 1),
(4, 'student', '123', 'gabaanusha109@gmail.com', '45654', 'student', '2016-11-09', 1),
(5, 'content', '123', 'gabaanusha109@gmail.com', '45654', 'content', '2016-11-09', 1),
(6, 'student1', '1233', 'abxc@gn.coi', '3457890332', 'student', '2016-11-23', 1),
(7, 'admin1234', '123576', 'gabariya11@gmail.com', '9999999999', 'administrator', '2016-11-23', 0),
(8, 'admin34', '123yfty', 'gabariya11@gmail.com', '4556666666', 'administrator', '2016-11-28', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
