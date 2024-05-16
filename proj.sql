-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2024 at 02:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proj`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` enum('available','borrowed','disable','pending') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `image`, `status`) VALUES
(1, 'x-men', 'https://cdn.marvel.com/u/prod/marvel/i/mg/c/f0/589ddfc222e9c/clean.jpg', 'available'),
(2, 'vision', 'https://cdn.marvel.com/u/prod/marvel/i/mg/6/30/59fa1354e2a53/clean.jpg', 'borrowed'),
(3, 'Thor', 'https://cdn.marvel.com/u/prod/marvel/i/mg/8/e0/646b6a2ec150d/clean.jpg', 'disable'),
(4, 'Marvel', 'https://cdn.marvel.com/u/prod/marvel/i/mg/9/40/650c4b242f7fd/clean.jpg', 'pending'),
(5, 'Spider-man', 'https://cdn.marvel.com/u/prod/marvel/i/mg/7/00/65e885a60d94b/clean.jpg', 'available'),
(6, 'Loki', 'https://cdn.marvel.com/u/prod/marvel/i/mg/7/10/649da298739aa/clean.jpg', 'borrowed'),
(7, 'The Incredible Hulk', 'https://cdn.marvel.com/u/prod/marvel/i/mg/6/30/648b0f4fa0418/standard_incredible.jpg', 'disable'),
(8, 'Gurdians of Galaxy', 'https://cdn.marvel.com/u/prod/marvel/i/mg/7/30/65298fa66fc26/clean.jpg', 'pending'),
(9, 'Ghost Rider', 'https://cdn.marvel.com/u/prod/marvel/i/mg/8/04/65e9e8df48ddc/standard_incredible.png', 'available'),
(10, 'Doctor Strange', 'https://cdn.marvel.com/u/prod/marvel/i/mg/a/03/640905fe13486/clean.jpg', 'borrowed'),
(11, 'Daredevil', 'https://cdn.marvel.com/u/prod/marvel/i/mg/b/d0/646d2f30dbca3/standard_incredible.jpg', 'available'),
(12, 'Captain Marvel', 'https://cdn.marvel.com/u/prod/marvel/i/mg/9/20/649d8a33f1b0b/standard_incredible.png', 'available'),
(13, 'Falcon', 'https://cdn.marvel.com/u/prod/marvel/i/mg/6/00/601afd5d18443/clean.jpg', 'available'),
(14, 'Captain America', 'https://cdn.marvel.com/u/prod/marvel/i/mg/3/40/652990a1219cc/clean.jpg', 'available'),
(15, 'Black Panther', 'https://cdn.marvel.com/u/prod/marvel/i/mg/4/b0/648736bc759e9/clean.jpg', 'available'),
(16, 'Avengers', 'https://cdn.marvel.com/u/prod/marvel/i/mg/1/c0/654bcd7baa5ab/standard_incredible.jpg', 'available'),
(17, 'Venom', 'https://cdn.marvel.com/u/prod/marvel/i/mg/d/d0/641e083568545/clean.jpg', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `get_return`
--

CREATE TABLE `get_return` (
  `return_id` int(20) NOT NULL,
  `request-id` int(20) NOT NULL,
  `staff_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `get_return`
--

INSERT INTO `get_return` (`return_id`, `request-id`, `staff_id`) VALUES
(1, 1, 21),
(2, 2, 22),
(3, 3, 23),
(4, 4, 24),
(5, 5, 25),
(6, 6, 26),
(7, 7, 27),
(8, 8, 28),
(9, 9, 29),
(10, 10, 30);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `history_id` int(20) NOT NULL,
  `request-id` int(20) NOT NULL,
  `return-id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `request-id`, `return-id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `book_id` int(20) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `borrowed_date` date NOT NULL,
  `returned_date` date NOT NULL,
  `request_id` int(20) NOT NULL,
  `lender_id` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`book_id`, `borrower_id`, `borrowed_date`, `returned_date`, `request_id`, `lender_id`) VALUES
(1, 1, '2024-04-01', '2024-04-10', 1, 11),
(2, 2, '2024-04-02', '2024-04-11', 2, 12),
(3, 3, '2024-04-03', '2024-04-12', 3, 11),
(4, 4, '2024-04-04', '2024-04-13', 4, 14),
(5, 5, '2024-04-05', '2024-04-14', 5, 15),
(6, 6, '2024-04-06', '2024-04-15', 6, 11),
(7, 7, '2024-04-07', '2024-04-16', 7, 17),
(8, 8, '2024-04-08', '2024-04-17', 8, 18),
(9, 9, '2024-04-09', '2024-04-18', 9, 11),
(10, 10, '2024-04-10', '2024-04-19', 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `major` varchar(20) DEFAULT NULL,
  `school` varchar(60) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `role` int(20) NOT NULL DEFAULT 1,
  `name-title` enum('Mr.','Mrs.','Miss') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `major`, `school`, `email`, `password`, `gender`, `role`, `name-title`) VALUES
(1, 'Borrower 1', 'Major 1', 'School 1', 'borrower1@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'male', 1, 'Mr.'),
(2, 'Borrower 2', 'Major 2', 'School 2', 'borrower2@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'female', 1, 'Miss'),
(3, 'Borrower 3', 'Major 3', 'School 3', 'borrower3@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'male', 1, 'Mr.'),
(4, 'Borrower 4', 'Major 4', 'School 4', 'borrower4@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'female', 1, 'Miss'),
(5, 'Borrower 5', 'Major 5', 'School 5', 'borrower5@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'male', 1, 'Mr.'),
(6, 'Borrower 6', 'Major 6', 'School 6', 'borrower6@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'female', 1, 'Miss'),
(7, 'Borrower 7', 'Major 7', 'School 7', 'borrower7@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'male', 1, 'Mr.'),
(8, 'Borrower 8', 'Major 8', 'School 8', 'borrower8@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'female', 1, 'Miss'),
(9, 'Borrower 9', 'Major 9', 'School 9', 'borrower9@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'male', 1, 'Mr.'),
(10, 'Borrower 10', 'Major 10', 'School 10', 'borrower10@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'female', 1, 'Miss'),
(11, 'Lender 1', NULL, NULL, 'lender1@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(12, 'Lender 2', NULL, NULL, 'lender2@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(13, 'Lender 3', NULL, NULL, 'lender3@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(14, 'Lender 4', NULL, NULL, 'lender4@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(15, 'Lender 5', NULL, NULL, 'lender5@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(16, 'Lender 6', NULL, NULL, 'lender6@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(17, 'Lender 7', NULL, NULL, 'lender7@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(18, 'Lender 8', NULL, NULL, 'lender8@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(19, 'Lender 9', NULL, NULL, 'lender9@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(20, 'Lender 10', NULL, NULL, 'lender10@example.com', '$2b$10$IbpMrmtPVjY/0/lzzzhX4OG.t9eGwmL.SP9YsawdQimRafAAPO6w6', NULL, 3, NULL),
(21, 'Staff 1', NULL, NULL, 'staff1@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(22, 'Staff 2', NULL, NULL, 'staff2@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(23, 'Staff 3', NULL, NULL, 'staff3@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(24, 'Staff 4', NULL, NULL, 'staff4@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(25, 'Staff 5', NULL, NULL, 'staff5@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(26, 'Staff 6', NULL, NULL, 'staff6@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(27, 'Staff 7', NULL, NULL, 'staff7@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(28, 'Staff 8', NULL, NULL, 'staff8@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(29, 'Staff 9', NULL, NULL, 'staff9@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(30, 'Staff 10', NULL, NULL, 'staff10@example.com', '$2b$10$ibyd.mnKeGTvCZPgqbI8YOHIImZ/IHBiKJueiNlymxUooicMxHoYa', NULL, 2, NULL),
(31, 'dean', 'Computer Engineering', 'School of Information Technology', 'dean@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', NULL, 1, NULL),
(32, 'sam', 'Computer Engineering', 'School of Information Technology', 'sam@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'male', 1, 'Mr.'),
(34, 'billy', 'Computer Engineering', 'School of Information Technology', 'billy@example.com', '$2b$10$yhwuJ0Z8j68J4QSMDRw61OLb6cEK9q6g8IU3Yjy3mUy7srqq2g2fG', 'male', 1, 'Mr.'),
(35, 'fred', 'Business Law and Chi', 'law', 'fred@example.com', '$2b$10$xAnFabfVnoUISpP6nAtcWOBI8nHfMH43p.qUI7ZB0z9unmJvHIDXK', NULL, 1, NULL),
(36, 'smith', 'Computer Engineering', 'School of Information Technology', 'smith@example.com', '$2b$10$0a08MBnIzwzbNVbftGWSbeaWyL3IiSo9zE9sSDWpZ5WPrdDUFyf7O', NULL, 1, NULL),
(37, 'Xin', 'Medicine', 'medicine', 'xin@gmail.com', '$2b$10$9kFqHGMQavtmB7mSHxoQP.IQk9d6bk404AefWxCXxvZjFoj1YAkCC', NULL, 1, NULL),
(38, 'ball', 'Anti-Aging and Regen', 'antiAging', 'ball@gmail.com', '$2b$10$mfXsY85af6pXze4dh.kOke9F//kIxDRM0DTfNJrdhLG0aLcK9euPC', NULL, 1, NULL),
(39, 'Xin', 'English', 'liberalArts', 'xin@example.com', '$2b$10$hWg1TsoLD9B1ODrtcixVT.0H5SncwZDqUaLj4QrTgJ508lOQOUh2m', NULL, 1, NULL),
(40, 'Veil', 'Medicine', 'medicine', 'viel@gmail.com', '$2b$10$fExSmDJy.jtDPdV5rbf5wea2wxQ3mvSHx7.axRTcnFdGhnaMkSg4O', NULL, 1, NULL),
(41, 'Dua', 'Applied Chemistry', 'science', 'dua@gmail.com', '$2b$10$vBUy3LTiMg6IazuISBzTt.3IyOmdTc9N55JxvTyPjDvq4x0LCOq52', NULL, 1, NULL),
(42, 'Supra', 'Nursing Science', 'nursing', 'supra@gmail.com', '$2b$10$x99p/oWRTWlEtjBTuclteuRm8LxTkBbJixnOinuuZSFWgcE9rjbqi', NULL, 1, NULL),
(43, 'Ei Thazin ', 'Computer Engineering', 'it', 'tun0@gmail.com', '$2b$10$E84BJR3GpdOozSwwe0j0UOHYBrzcQ6GOclTD3rniIyjSlKdT/eapW', NULL, 1, NULL),
(44, 'August', 'Computer Engineering', 'it', 'august@gmail.com', '$2b$10$4DAmRE316R0Kx/GSPxnoWuW30./CcbcmEROuufN5b15ngjDRZeeW.', NULL, 1, NULL),
(45, 'jj', 'IT', 'CE', 'vi@k.com', '$2b$10$0iRBQogEpdWemrJ03WZApOzpTyXSsJMSsDThJoVktVLChPgb5lSt6', NULL, 1, NULL),
(46, 'jjj', 'Laws', 'law', 'gfgf@n.com', '$2b$10$rl/TXBuelPiwwcGTp8VukeHqWoUmLpTLbJkOHZ/M8vNa7.uaGulPi', NULL, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `get_return`
--
ALTER TABLE `get_return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `request-id` (`request-id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `return-id` (`return-id`),
  ADD KEY `request-id` (`request-id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `book-id` (`book_id`),
  ADD KEY `borrower-id` (`borrower_id`),
  ADD KEY `lender-id` (`lender_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `get_return`
--
ALTER TABLE `get_return`
  ADD CONSTRAINT `get_return_ibfk_4` FOREIGN KEY (`request-id`) REFERENCES `request` (`request_id`),
  ADD CONSTRAINT `get_return_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_6` FOREIGN KEY (`return-id`) REFERENCES `get_return` (`return_id`),
  ADD CONSTRAINT `history_ibfk_7` FOREIGN KEY (`request-id`) REFERENCES `request` (`request_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`lender_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
