-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2023 at 07:46 AM
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
  `uphone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `uname`, `dname`, `uphone`) VALUES
(1, 'Fkr', 'Dr. Asiful Riyed', '8801854652339'),
(2, 'fkr', 'Dr. FKR Mujumdar', '1234'),
(3, 'abc', 'Dr Sumon Rahman Chowdhury', '01788817293');

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
(1, 'Urinate (pee) a lot, often at night ', 'Diabetes'),
(2, 'Diabetes', 'Diabetes'),
(3, 'pressure or tightness in the chest', 'Myocardial infarction (Heart Attack)'),
(4, 'Coughing, especially at night or in the morning', 'Asthma'),
(5, 'Myocardial infarction (Heart Attack)', 'Myocardial infarction (Heart Attack)'),
(6, 'Asthma', 'Asthma'),
(7, 'Are very thirsty', 'Diabetes'),
(8, ' a fast heart rate', 'Myocardial infarction (Heart Attack)'),
(9, 'Lose weight without trying', 'Diabetes'),
(10, ' a fast heart rate', 'Myocardial infarction (Heart Attack)'),
(11, 'Wheezing, a whistling sound when you breathe', 'Asthma'),
(12, 'Abdominal pain or cramps, usually in the lower half of the abdomen. ', 'IBS-Irritable Bowel Movement'),
(13, 'IBS-Irritable Bowel Movement', 'IBS-Irritable Bowel Movement'),
(14, 'Have blurry vision ', 'Diabetes'),
(15, 'sense of impending doom ', 'Myocardial infarction (Heart Attack)'),
(16, 'Tightness, pain, or pressure in your chest ', 'Asthma'),
(17, 'Bowel movements that are harder or looser than usual', 'IBS-Irritable Bowel Movement'),
(18, 'having a low or subnormal temperature', 'cold'),
(19, 'an unusually cold spring that was followed by a sweltering summer', 'cold'),
(20, 'lacking in friendliness or warmth of feeling', 'cold'),
(21, 'having or showing a lack of friendliness or interest in others', 'cold'),
(22, 'having lost consciousness', 'cold'),
(23, 'causing or marked by an atmosphere lacking in cheer', 'cold');

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
(1, 'Diabetes'),
(2, 'Myocardial infarction (Heart Attack)'),
(3, 'Asthma'),
(4, 'IBS-Irritable Bowel Movement'),
(8, 'Abdominal aortic aneurysm'),
(9, 'Acne'),
(10, 'Acute'),
(11, 'Bacterial'),
(12, 'Carcinoid'),
(13, 'Deafblindness'),
(14, 'Earache'),
(15, 'Febrile'),
(16, 'Gallbladder'),
(17, 'Haemorrhoids (piles) Hand'),
(18, 'Idiopathic'),
(19, 'Kidney'),
(20, 'Labyrinthitis'),
(21, 'Malaria'),
(22, 'Nasal'),
(23, 'Obesity'),
(24, 'Paget\'s'),
(25, 'Rare tumours Raynaud\'s'),
(26, 'Scabies'),
(27, 'Testicular'),
(28, 'Ulcerative'),
(29, 'cancer'),
(30, 'Warts'),
(31, 'Yellow fever');

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
(2, 'Dr. Asiful Riyed', 'Diabetes', '8 A.M to 10 P.M', 'chittagong', '22.3336887', '91.8342162', 'M.B.B.S'),
(3, 'Dr. FKR Mujumdar', 'Diabetes', ' Evening 7 pm To 9 pm (Friday Closed)', 'Chattogram, Chattogram District, Chattogram Division, 4000, Bangladesh', '22.3336887', '91.8342162', 'M.B.B.S'),
(4, 'Dr Sumon Rahman Chowdhury', 'cold', 'Evening 7 pm To 9 pm (Friday Closed)', 'Chattogram, Chattogram District, Chattogram Division, 4000, Bangladesh', '22.3336887', '91.8342162', 'MBBS');

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
(12, 'info@parkviewappointment.com', 2147483647, '[object Promise]'),
(13, 'info@parkviewappointment.com', 2147483647, '$2a$10$CUsaHfpC8UFS5RDlv2E0TOHJbq0QD2zV7wMpRQ/sLf.MDZ0IjDkHK'),
(14, 'info@parkviewappointment.com', 34345345, '$2a$10$XYWvJN7ahYC7uRpGccQ42e/BhURxCa93coRsZdlhKypc/mjqzKWai'),
(15, 'info@parkviewappointment.com', 45353456, '$2a$10$DsJXDzBlY31gn4w0Bn9S5O9EqHFhCjhIZoafN2/nBlOefeIT8zaJW'),
(16, 'info@parkviewappointment.com', 2147483647, '$2a$10$HYXfYAJIDfbzDS9Et3b2aeMdrMqHn7qifeEiZaCtlpcjkdoi4koOG'),
(17, 'info@parkviewappointment.com', 45345345, '$2a$10$KN04gACI/KZ5Bi360DS4Mus/Mw.bzn006LKJ.jD7EDGXJP5aIEp/a'),
(18, 'info@parkviewappointment.com', 45345345, '$2a$10$IgWW9dhAJRiBH3T2drS20OqRlCIsZNqQLzSBptTY0xxn97qEC1WVu'),
(19, 'fkr@gmail.com', 1234, '$2a$10$ykhxlDLK1vRcGp7jXph.Euv/TjGAbjTu/wDnUSOaRckcV6rdd6uzy'),
(20, 'fkr2@gmail.com', 12345, '$2a$10$vakRrbs.pGpJaOp8yoZ5T.M3cbrM8jzBuLvnhUarC6V0z0QoBVOeu');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `dname`
--
ALTER TABLE `dname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
