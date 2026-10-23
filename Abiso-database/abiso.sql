-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2026 at 09:12 PM
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
-- Database: `abiso`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `tag` enum('Event','Health','Notice','Reminder') NOT NULL,
  `title` varchar(150) NOT NULL,
  `summary` varchar(300) NOT NULL,
  `full_text` text NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `posted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `staff_id`, `tag`, `title`, `summary`, `full_text`, `pinned`, `posted_at`) VALUES
(1, 2, 'Reminder', 'Keep Our Barangay Clean and Safe For Everyone!', 'A friendly reminder to all residents to practice proper waste disposal, maintain cleanliness, and follow barangay rules to keep our community safe and peaceful.', 'BARANGAY REMINDER\n\nGood day, Barangay Residents!\n\nThis is a friendly reminder to everyone to keep our community clean, peaceful, and safe. Please observe proper waste disposal, maintain cleanliness in your surroundings, and follow barangay rules and regulations.\n\nLet us work together to create a healthier and more harmonious community for everyone.\n\nThank you for your cooperation!\n\n— Barangay Officials', 0, '2026-10-18 22:43:31'),
(3, 2, 'Event', 'Upcoming Barangay Meeting', 'All residents are invited to attend an upcoming barangay meeting to discuss community concerns, upcoming projects, and important matters affecting our neighborhood.', 'Good day, dear residents!\n\nPlease be informed that an upcoming barangay meeting will be held to discuss important community concerns, ongoing projects, peace and order, and other matters concerning our barangay.\n\nAll residents are encouraged to participate and share their suggestions and concerns to help improve our community.\n\nMeeting Details:\n\nDate: To be announced\n\nTime: To be announced\n\nVenue: Barangay Hall\n\nYour presence and participation are highly appreciated. Let us work together for a better, safer, and more progressive barangay.\n\nThank you, and we hope to see you there!\n\n— Your Barangay Officials', 1, '2026-10-18 23:08:50'),
(4, 2, 'Notice', 'Community Clean-Up Drive', 'All residents are encouraged to join our upcoming barangay clean-up drive to promote cleanliness, prevent pollution, and maintain a healthy environment.', 'Good day, dear residents!\n\nWe are inviting everyone to participate in our upcoming Community Clean-Up Drive. This activity aims to keep our streets, public spaces, and surroundings clean and organized.\n\nResidents are encouraged to bring cleaning materials and work together to make our barangay a cleaner and healthier place to live.\n\nActivity Details:\n\nDate: To be announced\n\nTime: 7:00 AM\n\nAssembly Area: Barangay Hall\n\nLet us show our bayanihan spirit and remember that keeping our community clean is everyone\'s responsibility.\n\nThank you for your cooperation!\n\n— Your Barangay Officials', 0, '2026-10-19 01:26:20'),
(7, 2, 'Event', 'Free Community Health Check-Up', 'Residents are invited to join our upcoming health program, offering basic health check-ups and health awareness activities to promote a healthier community.', 'Good day, dear residents!\n\nThe Barangay Health Center, in coordination with our barangay officials, will conduct a Community Health Check-Up to encourage residents to take care of their health and well-being.\n\nThe activity will include basic health screenings, health education, and consultations with available health personnel.\n\nActivity Details:\n\nDate: To be announced\n\nTime: 8:00 AM – 12:00 PM\n\nVenue: Barangay Health Center\n\nAll residents are encouraged to participate. Please bring your health records, if available, and cooperate with the health workers during the activity.\n\nLet us work together toward a healthier and stronger community!\n\nThank you, and stay healthy!\n\n— Your Barangay Officials', 0, '2026-10-22 00:50:47'),
(14, 2, 'Event', 'iiiii', 'oguygyug', 'igyftyfyv', 0, '2026-10-22 01:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_facts`
--

CREATE TABLE `announcement_facts` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `label` varchar(40) NOT NULL,
  `value` varchar(200) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `category` varchar(40) NOT NULL,
  `location` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `status` enum('Waiting','Reviewing','In progress','Resolved','Declined') NOT NULL DEFAULT 'Waiting',
  `filed_on` date NOT NULL,
  `updated_on` date NOT NULL,
  `closed_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `resident_id`, `subject`, `category`, `location`, `details`, `status`, `filed_on`, `updated_on`, `closed_on`) VALUES
(1, 1, 'Videoke past 12am.', 'Noise', 'Zone 7', 'The noise came from blue residence.', 'Resolved', '2026-10-17', '2026-10-18', '2026-10-18'),
(2, 1, 'There is no proper solar lights in Zone 7', 'Roads & Lights', 'Zone 7', 'It is too dark when walking at night.', 'Resolved', '2026-10-17', '2026-10-20', '2026-10-20'),
(3, 1, 'Ayaw ako pautangin ni Mareng Sonya, may magagawa ba kayo tungkol dito?', 'Others', 'Dito sa Zone 4', 'Mula nung nakaluwag-luwag na siya, ayaw na niya magpautang. Napaka-damot!', 'Declined', '2026-10-18', '2026-10-18', '2026-10-18'),
(4, 1, 'Proper cleanliness in the basketball court', 'Sanitation', 'In the basketball court', 'So many basura.', 'In progress', '2026-10-18', '2026-10-19', NULL),
(6, 3, 'Noise from the neighbor', 'Noise', 'Zone 4, Green\'s Residence', 'The Green\'s residence is too loud even in past midnights.', 'Reviewing', '2026-10-18', '2026-10-19', NULL),
(9, 7, 'Solar lights', 'Roads & Lights', 'Purok 6', 'The solar lights in our purok is not working properly anymore. It would be appreciated if you take action asap, because night shift worker and student greatly rely on it.', 'Resolved', '2026-10-22', '2026-10-22', '2026-10-22'),
(10, 1, 'hhhh', 'Sanitation', 'hhh', 'hhh', 'Reviewing', '2026-10-22', '2026-10-22', NULL),
(12, 1, 'iilll', 'Sanitation', 'ooo', 'oouih', 'Waiting', '2026-10-22', '2026-10-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report_notes`
--

CREATE TABLE `report_notes` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_notes`
--

INSERT INTO `report_notes` (`id`, `report_id`, `staff_id`, `note`, `created_on`) VALUES
(1, 1, 2, 'This is noted.', '2026-10-17'),
(2, 2, 2, 'Report accepted. Barangay staff are now working on it.', '2026-10-17'),
(3, 2, 2, 'We will now change the solar lights.', '2026-10-18'),
(4, 3, 2, 'I think this does not have to do with us. We only solved problem for the community.', '2026-10-18'),
(5, 4, 2, 'We will see what we can do about this', '2026-10-18'),
(6, 1, 2, 'They already got fined by the curfew hours.', '2026-10-18'),
(7, 4, 2, 'A staff member will visit the area this week.', '2026-10-18'),
(8, 6, 2, 'Please visit the barangay hall with more details about this report.', '2026-10-19'),
(9, 4, 2, 'The cleaning is on going.', '2026-10-19'),
(10, 2, 2, 'The concern has been addressed. Thank you for reporting it.', '2026-10-20'),
(11, 9, 2, 'Report accepted. Barangay staff are now working on it. A staff member will visit the area this week.', '2026-10-22'),
(12, 9, 2, 'The concern has been addressed. Thank you for reporting it.', '2026-10-22'),
(13, 10, 2, 'Report accepted. Barangay staff are now working on it.', '2026-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `user_id` int(11) NOT NULL,
  `purok` varchar(60) NOT NULL,
  `status` enum('PENDING','VERIFIED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `registered_on` date NOT NULL,
  `decided_on` date DEFAULT NULL,
  `decided_by` int(11) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`user_id`, `purok`, `status`, `registered_on`, `decided_on`, `decided_by`, `contact_number`, `address`) VALUES
(1, 'Purok 7', 'VERIFIED', '2026-10-17', '2026-10-17', NULL, '09873921098', 'House No. 29'),
(3, 'Purok 4', 'VERIFIED', '2026-10-18', '2026-10-18', NULL, NULL, NULL),
(4, 'Purok 1', 'VERIFIED', '2026-10-19', '2026-10-19', NULL, NULL, NULL),
(5, 'Purok 5', 'VERIFIED', '2026-10-19', '2026-10-20', NULL, NULL, NULL),
(6, 'Purok 6', 'VERIFIED', '2026-10-20', '2026-10-20', NULL, '090524817699', 'House No.15'),
(7, 'Purok 6', 'VERIFIED', '2026-10-20', '2026-10-22', NULL, '09058273690', 'House No.25'),
(8, 'Purok 2', 'VERIFIED', '2026-10-22', '2026-10-22', NULL, '09752955012', 'House No.18'),
(9, 'Purok 1', 'PENDING', '2026-10-22', NULL, NULL, '09054378229', 'House No.1');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `user_id` int(11) NOT NULL,
  `position` varchar(60) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `contact_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`user_id`, `position`, `active`, `contact_number`) VALUES
(2, 'Barangay Secretary', 1, '09055201677');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `role` enum('RESIDENT','STAFF') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Ella Mae R. Dolon', 'dolonmaiah@gmail.com', '$2a$12$ndyWAQRuV36RvvTpr9QYROxJPCZwbkoYfd7T323GlBiyWpbZugK/O', 'RESIDENT', '2026-10-17 08:42:19'),
(2, 'ABISO Staff', 'staff@abiso.local', '$2a$12$6hjrYeVXo/DGpsBJRhH08uvbbe9jtTJWck9JAs0n3PMP7MJrK4rKu', 'STAFF', '2026-10-17 10:03:58'),
(3, 'Paulina Dela Cruz', 'delacruzpaulina@gmail.com', '$2a$12$4NU4rowDTMWCmUAUTRpUx.1WTG5DrgTXYYe1KqqB0s1ms55XayOKm', 'RESIDENT', '2026-10-18 23:40:24'),
(4, 'Catlyn Ruiz', 'ruizcatlyn@gmail.com', '$2a$12$11EpF3qvsTc9xZqIZOmTMuCD8GCukY1UjsMWkE3mIYH7djmZlBsdi', 'RESIDENT', '2026-10-19 01:31:43'),
(5, 'Victor Ronel Lumayad', 'lumayad@gmail.com', '$2a$12$g/zhlOMqNxiED6XPutVNZu5uVhKXXZYA3L146e6NyQleDCX5xgS2.', 'RESIDENT', '2026-10-19 01:35:43'),
(6, 'Yasmin Fermin', 'fermin@gmail.com', '$2a$12$FUC894a.yvmvTnqQ8b/KXeoaz.h6JLTj9O22MdR46HsIZld2jcJmW', 'RESIDENT', '2026-10-20 18:30:02'),
(7, 'Yasmien Mae Llona', 'llona@gmail.com', '$2a$12$FoVVDDYhQwDh3c9zXJ2jPuoFqK2BoO.z6/l5AnMtrD.KJvU8BDL6G', 'RESIDENT', '2026-10-20 21:56:13'),
(8, 'John Mark Idanan', 'idanan@gmail.com', '$2a$12$YkMpHnAY91KbflYMZpS/D.ewbJ3vuH/mXXg2ZJHImM8WLoe05cGoW', 'RESIDENT', '2026-10-22 00:32:39'),
(9, 'Maryan Lusantas', 'lusantas@gmail.com', '$2a$12$ZZTU1mCd7Ld5WE0hv0Axj.SpcRRIEcTm0A37G5Jg7AYArkuv6vEta', 'RESIDENT', '2026-10-22 01:58:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `announcement_facts`
--
ALTER TABLE `announcement_facts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `report_notes`
--
ALTER TABLE `report_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `decided_by` (`decided_by`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `announcement_facts`
--
ALTER TABLE `announcement_facts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `report_notes`
--
ALTER TABLE `report_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `announcement_facts`
--
ALTER TABLE `announcement_facts`
  ADD CONSTRAINT `announcement_facts_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `report_notes`
--
ALTER TABLE `report_notes`
  ADD CONSTRAINT `report_notes_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_notes_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `residents`
--
ALTER TABLE `residents`
  ADD CONSTRAINT `residents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `residents_ibfk_2` FOREIGN KEY (`decided_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
