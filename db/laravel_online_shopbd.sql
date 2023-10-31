-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2023 at 06:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_online_shopbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(28, 'Hadphone', 'hadphone', '28.png', 1, '2023-10-24 11:10:12', '2023-10-24 11:10:12'),
(29, 'Mobile Phone', 'mobile-phone', '29.png', 1, '2023-10-26 22:56:00', '2023-10-26 22:56:01'),
(30, 'Laptop', 'laptop', '30.png', 1, '2023-10-26 22:56:29', '2023-10-26 22:56:31'),
(31, 'Smart Watch', 'smart-watch', '31.png', 1, '2023-10-26 22:57:59', '2023-10-26 22:57:59'),
(32, 'Coxmetix', 'coxmetix', '32.png', 1, '2023-10-26 22:58:25', '2023-10-26 22:58:25'),
(33, 'Computer', 'computer', '33.png', 1, '2023-10-26 22:58:53', '2023-10-26 22:58:53'),
(34, 'Electonix', 'electonix', '34.png', 1, '2023-10-26 22:59:48', '2023-10-26 22:59:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_16_181225_create_categories_table', 2),
(6, '2023_10_24_045331_create_temp_images_table', 3),
(7, '2023_10_27_043142_create_sub_categories_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 34, 'Test subcategory', 'test-subcategory', 1, '2023-10-31 10:42:29', '2023-10-31 10:42:29'),
(2, 33, 'This is the another sub category', 'this-is-the-another-sub-category', 1, '2023-10-31 10:42:59', '2023-10-31 10:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

CREATE TABLE `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_images`
--

INSERT INTO `temp_images` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '1698127138.jpg', '2023-10-23 23:58:58', '2023-10-23 23:58:58'),
(2, '1698127225.png', '2023-10-24 00:00:26', '2023-10-24 00:00:26'),
(3, '1698127234.png', '2023-10-24 00:00:34', '2023-10-24 00:00:34'),
(4, '1698127257.png', '2023-10-24 00:00:57', '2023-10-24 00:00:57'),
(5, '1698127538.png', '2023-10-24 00:05:38', '2023-10-24 00:05:38'),
(6, '1698127590.png', '2023-10-24 00:06:30', '2023-10-24 00:06:30'),
(7, '1698127668.png', '2023-10-24 00:07:48', '2023-10-24 00:07:48'),
(8, '1698134026.png', '2023-10-24 01:53:46', '2023-10-24 01:53:46'),
(9, '1698134174.png', '2023-10-24 01:56:14', '2023-10-24 01:56:14'),
(10, '1698134205.png', '2023-10-24 01:56:45', '2023-10-24 01:56:45'),
(11, '1698136520.png', '2023-10-24 02:35:20', '2023-10-24 02:35:20'),
(12, '1698136581.png', '2023-10-24 02:36:21', '2023-10-24 02:36:21'),
(13, '1698138135.png', '2023-10-24 03:02:15', '2023-10-24 03:02:15'),
(14, '1698138294.png', '2023-10-24 03:04:54', '2023-10-24 03:04:54'),
(15, '1698152803.png', '2023-10-24 07:06:44', '2023-10-24 07:06:44'),
(16, '1698152862.png', '2023-10-24 07:07:42', '2023-10-24 07:07:42'),
(17, '1698152988.png', '2023-10-24 07:09:48', '2023-10-24 07:09:48'),
(18, '1698153135.png', '2023-10-24 07:12:15', '2023-10-24 07:12:15'),
(19, '1698153164.png', '2023-10-24 07:12:44', '2023-10-24 07:12:44'),
(20, '1698153699.png', '2023-10-24 07:21:39', '2023-10-24 07:21:39'),
(21, '1698154211.png', '2023-10-24 07:30:11', '2023-10-24 07:30:11'),
(22, '1698154415.png', '2023-10-24 07:33:35', '2023-10-24 07:33:35'),
(23, '1698154556.png', '2023-10-24 07:35:56', '2023-10-24 07:35:56'),
(24, '1698163622.png', '2023-10-24 10:07:02', '2023-10-24 10:07:02'),
(25, '1698163756.png', '2023-10-24 10:09:16', '2023-10-24 10:09:16'),
(26, '1698164481.png', '2023-10-24 10:21:21', '2023-10-24 10:21:21'),
(27, '1698164545.png', '2023-10-24 10:22:25', '2023-10-24 10:22:25'),
(28, '1698164559.png', '2023-10-24 10:22:39', '2023-10-24 10:22:39'),
(29, '1698164575.png', '2023-10-24 10:22:55', '2023-10-24 10:22:55'),
(30, '1698166291.png', '2023-10-24 10:51:31', '2023-10-24 10:51:31'),
(31, '1698166315.png', '2023-10-24 10:51:55', '2023-10-24 10:51:55'),
(32, '1698167388.png', '2023-10-24 11:09:48', '2023-10-24 11:09:48'),
(33, '1698167408.png', '2023-10-24 11:10:08', '2023-10-24 11:10:08'),
(34, '1698382540.png', '2023-10-26 22:55:40', '2023-10-26 22:55:40'),
(35, '1698382554.png', '2023-10-26 22:55:54', '2023-10-26 22:55:54'),
(36, '1698382586.png', '2023-10-26 22:56:26', '2023-10-26 22:56:26'),
(37, '1698382676.png', '2023-10-26 22:57:56', '2023-10-26 22:57:56'),
(38, '1698382702.png', '2023-10-26 22:58:22', '2023-10-26 22:58:22'),
(39, '1698382730.png', '2023-10-26 22:58:51', '2023-10-26 22:58:51'),
(40, '1698382786.png', '2023-10-26 22:59:46', '2023-10-26 22:59:46'),
(41, '1698383021.png', '2023-10-26 23:03:41', '2023-10-26 23:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `phone`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$3VwDoz9eK25rfuiEQ2422uo613Z9jtoYAJUhKSsvqKqV1kOSSKbx2', 2, NULL, NULL, NULL, '2023-10-13 09:29:59', '2023-10-13 09:29:59'),
(2, 'User', 'User@gmail.com', NULL, '$2y$10$b5BnuPybr1DjgVyuAJcSSeK9J1XqXpCkg/bYvGaj/7QDZ5plXwnMu', 1, NULL, NULL, NULL, '2023-10-13 09:34:31', '2023-10-13 09:34:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_images`
--
ALTER TABLE `temp_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
