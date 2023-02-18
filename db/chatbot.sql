-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2023 at 05:43 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `uname` text NOT NULL,
  `dname` text NOT NULL,
  `uphone` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `uname`, `dname`, `uphone`, `date`) VALUES
(6, 'akib', 'Dr Sumon Rahman Chowdhury', '000', '2023-02-14 12:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `id` int(11) NOT NULL,
  `input` text NOT NULL,
  `output` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`id`, `input`, `output`) VALUES
(24, 'Bloating', 'IBS'),
(25, 'Increased thirst', 'Diabetes'),
(26, 'Coughing', 'Asthma'),
(27, 'Shortness of breath', 'Heart Attack'),
(28, 'Nausea', 'Diarrhea'),
(29, 'watery stools', 'Diarrhea'),
(30, 'Chest discomfort', 'Heart Attack'),
(31, 'Difficulty breathing', 'Asthma'),
(32, 'Pee a lot', 'Diabetes'),
(33, 'stomach pain', 'IBS'),
(34, 'Vomiting', 'Diarrhea'),
(35, 'Chest pain', 'Heart Attack'),
(36, 'Wheezing when exhaling', 'Asthma'),
(37, 'very hungry', 'Diabetes'),
(38, 'feeling sick', 'IBS'),
(39, 'Bloating', 'Diarrhea'),
(40, 'discomfort in shoulders', 'Heart Attack'),
(41, 'breath problem', 'Asthma'),
(42, 'blurry vision', 'Diabetes'),
(43, 'heartburn', 'IBS'),
(44, 'Blood in stool', 'Diarrhea'),
(45, 'neck Pain', 'Heart Attack'),
(46, 'exhaling problem', 'Asthma'),
(47, 'tired feeling', 'Diabetes'),
(48, 'abdominal cramping', 'IBS'),
(49, 'loose motion', 'Diarrhea'),
(50, 'dry skin', 'Diabetes'),
(51, 'neck discomfort', 'Heart Attack'),
(52, 'Wheezing', 'Asthma'),
(53, 'swelling stomach', 'Diarrhea'),
(54, 'loosing weight', 'Diabetes'),
(55, 'Back Pain', 'Heart Attack'),
(56, 'trouble berating', 'Asthma'),
(57, 'lack energy', 'IBS'),
(58, 'Mucus in stool', 'Diarrhea'),
(59, 'stomach pain', 'IBS'),
(61, 'neck discomfort', 'Heart Attack'),
(62, 'watery stools', 'Diarrhea'),
(63, 'Wheezing', 'Asthma'),
(64, 'discomfort in shoulders', 'Heart Attack'),
(65, 'dry skin', 'Diabetes'),
(66, 'exhaling problem', 'Asthma'),
(67, 'very hungry', 'Diabetes'),
(68, 'Blood in stool', 'Diarrhea'),
(69, 'heartburn', 'IBS');

-- --------------------------------------------------------

--
-- Table structure for table `dname`
--

CREATE TABLE `dname` (
  `id` int(11) NOT NULL,
  `dname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dname`
--

INSERT INTO `dname` (`id`, `dname`) VALUES
(32, 'Diabetes'),
(33, 'Heart Attack'),
(34, 'Asthma'),
(35, 'IBS'),
(36, 'Diarrhea');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `dname` text NOT NULL,
  `disease` text NOT NULL,
  `dtime` text NOT NULL,
  `address` longtext NOT NULL,
  `lati` text NOT NULL,
  `longi` text NOT NULL,
  `qualification` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `dname`, `disease`, `dtime`, `address`, `lati`, `longi`, `qualification`) VALUES
(1, 'Dr Sumon Rahman Chowdhury', 'Diabetes', 'Evening 7 pm To 9 pm (Friday Closed) ', 'Halishahar Road, Uttor Moddho Halishohor, HaliShohor, Chattogram, Chattogram District, Chattogram Division, 4216, Bangladesh', '22.325106', '91.7825195', 'MBBS, CCD (Diabetology) MMed (Endocrinology), MACE (USA) Post Graduate Diploma in Diabetes (Cardif, '),
(2, 'Dr. Asiful Riyed', 'Heart Attack', '8 A.M to 10 P.M', 'chittagong', '22.3336887', '91.8342162', 'M.B.B.S'),
(3, 'Dr. FKR Mujumdar', 'Asthma', ' Evening 7 pm To 9 pm (Friday Closed)', 'Chattogram, Chattogram District, Chattogram Division, 4000, Bangladesh', '22.3336887', '91.8342162', 'M.B.B.S'),
(4, 'Dr Sumon Rahman Chowdhury', 'IBS', 'Evening 7 pm To 9 pm (Friday Closed)', 'Chattogram, Chattogram District, Chattogram Division, 4000, Bangladesh', '22.3336887', '91.8342162', 'MBBS'),
(5, 'Dr Irfath', 'Diarrhea', 'Evening 7 pm To 9 pm (Friday Closed)', 'Chattogram, Chattogram District, Chattogram Division, 4000, Bangladesh', '22.3336887', '91.8342162', 'MBBS');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `mobile` int(11) NOT NULL,
  `pass` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `email`, `mobile`, `pass`) VALUES
(21, 'fkr@gmail.com', 1234, '$2a$10$vgI1mY52/YIK0Y4uZJfTDufjiNNBDrKeUEB4CHTRC6iAfnbbeZGEq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dname`
--
ALTER TABLE `dname`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `dname`
--
ALTER TABLE `dname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
