-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 02:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_name` varchar(100) NOT NULL COMMENT 'Course Name',
  `c_id` int(11) NOT NULL COMMENT 'Course ID, Primary key that auto-increments',
  `c_desc` text NOT NULL COMMENT 'Description for course',
  `c_price` varchar(10) NOT NULL COMMENT 'Price of a course',
  `c_no_of_lessons` int(11) NOT NULL COMMENT 'Number of lessons in a course',
  `c_image` varchar(100) NOT NULL COMMENT 'Path to course image',
  `i_id` int(11) NOT NULL COMMENT 'Instructor ID, foreign key from instructor table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_name`, `c_id`, `c_desc`, `c_price`, `c_no_of_lessons`, `c_image`, `i_id`) VALUES
('Introduction to Python', 101, 'Learn the basics of Python programming, including syntax, variables, and loops.', '49.99', 10, 'python_course.jpg', 1),
('Web Development with HTML & CSS', 102, 'Build beautiful and responsive websites using HTML and CSS.', '59.99', 15, 'web_dev_course.jpg', 2),
('JavaScript Essentials', 103, 'Master the fundamentals of JavaScript to create dynamic web pages.', '69.99', 20, 'javascript_course.jpg', 1),
('Machine Learning Basics', 104, 'An introductory course on machine learning concepts and algorithms.', '89.99', 12, 'ml_course.jpg', 3),
('Data Science with Python', 105, 'Learn data analysis and visualization techniques using Python.', '99.99', 18, 'data_science_course.jpg', 1),
('Cybersecurity Fundamentals', 106, 'Understand the principles of cybersecurity and learn to protect systems.', '79.99', 10, 'cybersecurity_course.jpg', 4),
('Cloud Computing with AWS', 107, 'Explore cloud computing services and solutions using AWS.', '119.99', 14, 'aws_course.jpg', 5),
('Mobile App Development with Flutter', 108, 'Create cross-platform mobile apps using Flutter.', '89.99', 20, 'flutter_course.jpg', 2),
('SQL for Data Management', 109, 'Learn how to manage and query databases using SQL.', '39.99', 8, 'sql_course.jpg', 3),
('Artificial Intelligence Foundations', 110, 'Delve into the world of AI and its real-world applications.', '109.99', 16, 'ai_course.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `i_name` varchar(50) NOT NULL COMMENT 'Instructor''s name',
  `i_id` int(11) NOT NULL COMMENT 'Instructor''s ID, Primary key, auto-incremented',
  `i_phone` varchar(13) NOT NULL COMMENT 'Instructor''s phone number',
  `i_email` varchar(40) NOT NULL COMMENT 'Instructor''s email address',
  `i_image` int(11) NOT NULL COMMENT 'Instructor''s Image Path',
  `i_bio` int(11) NOT NULL COMMENT 'Instructor''s Bio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`i_name`, `i_id`, `i_phone`, `i_email`, `i_image`, `i_bio`) VALUES
('John Doe', 1, '123-456-7890', 'john.doe@example.com', 0, 0),
('Jane Smith', 2, '234-567-8901', 'jane.smith@example.com', 0, 0),
('Robert Brown', 3, '345-678-9012', 'robert.brown@example.com', 0, 0),
('Emily White', 4, '456-789-0123', 'emily.white@example.com', 0, 0),
('Michael Green', 5, '567-890-1234', 'michael.green@example.com', 0, 0),
('Sarah Black', 6, '678-901-2345', 'sarah.black@example.com', 0, 0),
('David Gray', 7, '789-012-3456', 'david.gray@example.com', 0, 0),
('Linda Blue', 8, '890-123-4567', 'linda.blue@example.com', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `old_cart`
--

CREATE TABLE `old_cart` (
  `p_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `p_id` int(11) NOT NULL,
  `p_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`p_id`, `p_date_time`) VALUES
(1, '2024-12-01 09:30:00'),
(2, '2024-12-01 10:45:00'),
(3, '2024-12-01 12:00:00'),
(4, '2024-12-02 08:15:00'),
(5, '2024-12-02 14:30:00'),
(6, '2024-12-02 16:00:00'),
(7, '2024-12-03 11:00:00'),
(8, '2024-12-03 13:30:00'),
(9, '2024-12-04 09:45:00'),
(10, '2024-12-04 10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `s_name` varchar(50) NOT NULL,
  `s_email` varchar(50) NOT NULL,
  `s_password` varchar(50) NOT NULL,
  `s_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`s_name`, `s_email`, `s_password`, `s_id`) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'password123', 1),
('Bob Smith', 'bob.smith@example.com', 'securepass456', 2),
('Charlie Brown', 'charlie.brown@example.com', 'mypassword789', 3),
('Diana Prince', 'diana.prince@example.com', 'wonderwoman123', 4),
('Ethan Hunt', 'ethan.hunt@example.com', 'impossible456', 5),
('Fiona Green', 'fiona.green@example.com', 'greenforest789', 6),
('George Clarke', 'george.clarke@example.com', 'clarke123', 7),
('Hannah Lee', 'hannah.lee@example.com', 'lee_hannah456', 8),
('Ian Wright', 'ian.wright@example.com', 'wrightian789', 9),
('Jessica Miller', 'jessica.miller@example.com', 'millertime123', 10),
('test', 'test@test.com', 't@test', 13),
('John Saleh', 'johnsaleh4@outlook.com', '123456', 15),
('جون صالح', 'arabictest@test.com', 'اختبار', 16),
('Test Name', 'signuptest@test.com', 'signuptest', 18),
('John Nageh', 'johnnageh@gmail.com', 'password', 19),
('etsiojtseiofjseothsejrioawethuaet', 'test@test.com', 'etstset', 20),
('tsetase', 'ser@esr.com', 'easetase', 21),
('Test', 'testing@test.com', 'password', 23);

-- --------------------------------------------------------

--
-- Table structure for table `student_cart`
--

CREATE TABLE `student_cart` (
  `s_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `fk_i_id` (`i_id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`i_id`);

--
-- Indexes for table `old_cart`
--
ALTER TABLE `old_cart`
  ADD KEY `p_id` (`p_id`),
  ADD KEY `s_id` (`s_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `student_cart`
--
ALTER TABLE `student_cart`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `c_id` (`c_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Course ID, Primary key that auto-increments', AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Instructor''s ID, Primary key, auto-incremented', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_i_id` FOREIGN KEY (`i_id`) REFERENCES `instructor` (`i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `old_cart`
--
ALTER TABLE `old_cart`
  ADD CONSTRAINT `old_cart_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `payment` (`p_id`),
  ADD CONSTRAINT `old_cart_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`),
  ADD CONSTRAINT `old_cart_ibfk_3` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`);

--
-- Constraints for table `student_cart`
--
ALTER TABLE `student_cart`
  ADD CONSTRAINT `student_cart_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`s_id`),
  ADD CONSTRAINT `student_cart_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
