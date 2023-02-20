-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 20, 2023 at 02:17 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devio_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add company', 8, 'add_company'),
(30, 'Can change company', 8, 'change_company'),
(31, 'Can delete company', 8, 'delete_company'),
(32, 'Can view company', 8, 'view_company');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$HO0Y9Qd7aIZqQsKRQZYy3W$ywk+YtAWJwVpXT9h7nP+YHaZX781SO5yffnomfaT3Co=', '2023-02-19 14:50:00.240014', 1, 'ratulhasan', '', '', '', 1, 1, '2023-02-19 14:49:44.525264');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base_company`
--

CREATE TABLE `base_company` (
  `id` bigint NOT NULL,
  `name` varchar(200) NOT NULL,
  `bio` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `base_company`
--

INSERT INTO `base_company` (`id`, `name`, `bio`) VALUES
(1, 'BPG', 'Blue Planet Group is a renowned Local conglomerate with joint collaboration of local residential entrepreneurs. BPG has been started its journey since 2003 through the establishment of MM Spinning Mill.'),
(2, 'WellDev', 'We offer innovative, high performing and customer-centric software development. From creating robust designs to implementing and maintaining highly scalable applications, we are with you all the way. Our holistic approach, professional support and fl'),
(3, 'ADA', 'ADA provides services that enable enterprises and brands to drive topline growth through digital marketing and sales transformation across Asia. It operates three data-driven service segments: 1. Marketing Solutions: • Performance marketing, which en'),
(4, 'Brain Station 23', 'Brain Station 23 Limited is a homegrown software development company providing state-of-the-art software & IT solutions for fintech, telco, eCommerce, pharma, manufacturing, retail, etc. industries both locally & globally since 2006.'),
(5, 'Grameenphone Ltd', 'The right and contemporary use of technology is key to the progress of a nation. Keeping this in mind, Grameenphone always brings future-proof technology in order to facilitate your progress. The possibilities in this new world are immense and someon');

-- --------------------------------------------------------

--
-- Table structure for table `base_user`
--

CREATE TABLE `base_user` (
  `id` bigint NOT NULL,
  `username` varchar(200) NOT NULL,
  `bio` longtext,
  `company_id` bigint DEFAULT NULL,
  `stack` varchar(200) DEFAULT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `social_link` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `base_user`
--

INSERT INTO `base_user` (`id`, `username`, `bio`, `company_id`, `stack`, `profile_pic`, `social_link`) VALUES
(1, 'hasibulhasan', 'Experienced software engineer with 4 years experience having a passion for building innovative solutions with cutting edge technologies.', 2, 'Python | Flask | FastAPI | JavaScript | ML Enthusiast', 'uploads/avatar_u0hmEMY.png', 'https://www.linkedin.com/in/hasib404/'),
(2, 'ratulhasanshaon', 'A software engineer with a passion to develop innovative and creative software solutions for entire sdlc.', 1, 'Python || Django', 'uploads/avatar_aTR7Ctx.png', 'https://www.linkedin.com/in/ratulhasanshaon/'),
(3, 'tauratislam', 'Two years experienced full-stack software engineer with sophisticated interpersonal and multitasking capabilitie', 1, 'php | ajax | laravel', 'uploads/avatar_L5TJR60.png', 'https://www.linkedin.com/in/tauratislam/');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-02-19 14:51:49.509191', '1', 'BPG', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-02-19 14:52:22.880957', '2', 'WellDev', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-02-19 14:52:47.174611', '3', 'ADA', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-02-19 14:53:30.512836', '4', 'Brain Station 23', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-02-19 14:54:28.511124', '5', 'Grameenphone Ltd', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-02-19 14:57:15.173370', '1', 'hasibulhasan', 1, '[{\"added\": {}}]', 7, 1),
(7, '2023-02-19 14:58:31.567521', '2', 'ratulhasanshaon', 1, '[{\"added\": {}}]', 7, 1),
(8, '2023-02-19 14:59:40.275827', '3', 'tauratislam', 1, '[{\"added\": {}}]', 7, 1),
(9, '2023-02-19 15:00:24.663526', '3', 'tauratislam', 2, '[{\"changed\": {\"fields\": [\"Bio\"]}}]', 7, 1),
(10, '2023-02-19 15:00:34.633882', '2', 'ratulhasanshaon', 2, '[{\"changed\": {\"fields\": [\"Bio\"]}}]', 7, 1),
(11, '2023-02-19 15:00:41.951890', '1', 'hasibulhasan', 2, '[{\"changed\": {\"fields\": [\"Bio\"]}}]', 7, 1),
(12, '2023-02-20 02:02:23.943206', '2', 'ratulhasanshaon', 2, '[{\"changed\": {\"fields\": [\"Profile pic\"]}}]', 7, 1),
(13, '2023-02-20 02:16:34.574989', '2', 'ratulhasanshaon', 2, '[{\"changed\": {\"fields\": [\"Bio\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'base', 'company'),
(7, 'base', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-19 14:48:31.325954'),
(2, 'auth', '0001_initial', '2023-02-19 14:48:31.946592'),
(3, 'admin', '0001_initial', '2023-02-19 14:48:32.096621'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-19 14:48:32.110231'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-19 14:48:32.122296'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-19 14:48:32.207354'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-19 14:48:32.277620'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-19 14:48:32.312555'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-19 14:48:32.329621'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-19 14:48:32.410709'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-19 14:48:32.417749'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-19 14:48:32.448176'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-19 14:48:32.526108'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-19 14:48:32.603846'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-19 14:48:32.635856'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-19 14:48:32.650902'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-19 14:48:32.717874'),
(18, 'base', '0001_initial', '2023-02-19 14:48:32.744098'),
(19, 'base', '0002_company', '2023-02-19 14:48:32.771123'),
(20, 'base', '0003_user_company', '2023-02-19 14:48:32.838623'),
(21, 'base', '0004_user_stack', '2023-02-19 14:48:32.862577'),
(22, 'base', '0005_user_profile_pic_user_social_link', '2023-02-19 14:48:32.908685'),
(23, 'sessions', '0001_initial', '2023-02-19 14:48:32.951759');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('z43dx1b4bf2lk07onjz1lyabeno3u1ta', '.eJxVjMsOwiAQRf-FtSE8pGVcuu83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxIXocXpdyOMD647SHestyZjq-syk9wVedAup5b4eT3cv4OCvXxrZRk8QgbKfojx7CipTISoM7IZvNZajWAwghuNs9YTJGN1AgCk6Fi8P_nZODo:1pTl0q:T5x6i2h5EvVhfAr4xB56jw-WufAfMuBepBJCU21GjTQ', '2023-03-05 14:50:00.246014');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `base_company`
--
ALTER TABLE `base_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `base_user`
--
ALTER TABLE `base_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_user_company_id_4e49d587_fk_base_company_id` (`company_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `base_company`
--
ALTER TABLE `base_company`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `base_user`
--
ALTER TABLE `base_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `base_user`
--
ALTER TABLE `base_user`
  ADD CONSTRAINT `base_user_company_id_4e49d587_fk_base_company_id` FOREIGN KEY (`company_id`) REFERENCES `base_company` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
