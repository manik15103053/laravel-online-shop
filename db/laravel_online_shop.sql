-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 08:05 PM
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
-- Database: `laravel_online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Brand name', 'brand-name', 1, '2023-11-02 21:41:39', '2023-11-02 21:41:39');

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
(7, '2023_10_27_043142_create_sub_categories_table', 4),
(8, '2023_11_01_170302_create_brands_table', 5),
(9, '2023_11_14_163649_create_products_table', 6),
(10, '2023_11_14_164948_create_product_images_table', 6);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `is_featured` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `track_qty` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `price`, `compare_price`, `category_id`, `sub_category_id`, `brand_id`, `is_featured`, `sku`, `barcode`, `track_qty`, `qty`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Test Product', 'test-product', 50.00, 40.00, 33, 2, 1, 'Yes', '50', '123', 'Yes', 50, 1, '<p>This is the best test</p>', '2023-12-01 20:17:58', '2023-12-01 20:17:58'),
(2, 'This is the another product', 'this-is-the-another-product', 50.00, 40.00, 33, 2, 1, 'Yes', '505', '123', 'Yes', 50, 1, '<p>This is the another product</p>', '2023-12-01 20:20:41', '2023-12-01 20:20:41'),
(3, 'This is the best of the test', 'this-is-the-best-of-the-test', 50.00, 50.00, 33, 2, 1, 'Yes', '10', '1241', 'Yes', 544, 1, '<p>This is the best test</p>', '2023-12-21 11:37:30', '2023-12-21 11:37:30'),
(4, 'This is the best products', 'this-is-the-best-products', 50.00, 50.00, 33, 2, 1, 'No', 'tesy', '1241', 'Yes', 20, 1, '<p>This is the best test</p>', '2023-12-22 11:51:06', '2023-12-22 11:51:06'),
(5, 'This the best title', 'this-the-best-title', 50.00, 50.00, 33, 2, 1, 'Yes', '1210', '1241', 'Yes', 20, 1, '<p>This is the beset title</p>', '2023-12-22 11:55:53', '2023-12-22 11:55:53'),
(6, 'This is the best test', 'this-is-the-best-test', 50.00, 50.00, 33, 2, 1, 'No', '10', '1241', 'Yes', 50, 1, '<p>This is the best test</p>', '2023-12-22 11:57:22', '2023-12-22 11:57:22'),
(7, 'This is the best testikjhuk', 'this-is-the-best-testikjhuk', 50.00, 50.00, 34, 1, 1, 'No', '10', '1241', 'Yes', 20, 1, '<p>asdfsdfa</p>', '2023-12-22 12:05:13', '2023-12-22 12:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
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
(41, '1698383021.png', '2023-10-26 23:03:41', '2023-10-26 23:03:41'),
(42, '1699984201.png', '2023-11-14 11:50:01', '2023-11-14 11:50:01'),
(43, '1702831064.jpg', '2023-12-17 10:37:44', '2023-12-17 10:37:44'),
(44, '1702831089.jpg', '2023-12-17 10:38:09', '2023-12-17 10:38:09'),
(45, '1702834713.jpg', '2023-12-17 11:38:33', '2023-12-17 11:38:33'),
(46, '1702834716.jfif', '2023-12-17 11:38:36', '2023-12-17 11:38:36'),
(47, '1702834718.jpg', '2023-12-17 11:38:38', '2023-12-17 11:38:38'),
(48, '1702834933.jpg', '2023-12-17 11:42:13', '2023-12-17 11:42:13'),
(49, '1702834998.jpg', '2023-12-17 11:43:18', '2023-12-17 11:43:18'),
(50, '1702835256.jpg', '2023-12-17 11:47:36', '2023-12-17 11:47:36'),
(51, '1702835376.jpg', '2023-12-17 11:49:36', '2023-12-17 11:49:36'),
(52, '1702835389.jfif', '2023-12-17 11:49:49', '2023-12-17 11:49:49'),
(53, '1702835389.jpg', '2023-12-17 11:49:49', '2023-12-17 11:49:49'),
(54, '1702835389.jpg', '2023-12-17 11:49:49', '2023-12-17 11:49:49'),
(55, '1702835472.jpg', '2023-12-17 11:51:12', '2023-12-17 11:51:12'),
(56, '1702835511.jfif', '2023-12-17 11:51:51', '2023-12-17 11:51:51'),
(57, '1702835511.jpg', '2023-12-17 11:51:51', '2023-12-17 11:51:51'),
(58, '1702835511.jpg', '2023-12-17 11:51:51', '2023-12-17 11:51:51'),
(59, '1702835565.jfif', '2023-12-17 11:52:45', '2023-12-17 11:52:45'),
(60, '1702835565.jpg', '2023-12-17 11:52:45', '2023-12-17 11:52:45'),
(61, '1702835565.jpg', '2023-12-17 11:52:45', '2023-12-17 11:52:45'),
(62, '1702835583.jpg', '2023-12-17 11:53:03', '2023-12-17 11:53:03'),
(63, '1702835588.jfif', '2023-12-17 11:53:08', '2023-12-17 11:53:08'),
(64, '1702835590.jpg', '2023-12-17 11:53:10', '2023-12-17 11:53:10'),
(65, '1703177219.jpg', '2023-12-21 10:46:59', '2023-12-21 10:46:59'),
(66, '1703177225.jfif', '2023-12-21 10:47:05', '2023-12-21 10:47:05'),
(67, '1703177228.jpg', '2023-12-21 10:47:08', '2023-12-21 10:47:08'),
(68, '1703180225.jpg', '2023-12-21 11:37:05', '2023-12-21 11:37:05'),
(69, '1703180226.jfif', '2023-12-21 11:37:06', '2023-12-21 11:37:06'),
(70, '1703180229.jpg', '2023-12-21 11:37:09', '2023-12-21 11:37:09'),
(71, '1703267379.jpg', '2023-12-22 11:49:39', '2023-12-22 11:49:39'),
(72, '1703267381.jfif', '2023-12-22 11:49:41', '2023-12-22 11:49:41'),
(73, '1703267383.jpg', '2023-12-22 11:49:43', '2023-12-22 11:49:43'),
(74, '1703267561.jfif', '2023-12-22 11:52:41', '2023-12-22 11:52:41'),
(75, '1703267561.jpg', '2023-12-22 11:52:41', '2023-12-22 11:52:41'),
(76, '1703267828.jfif', '2023-12-22 11:57:08', '2023-12-22 11:57:08'),
(77, '1703267959.jpg', '2023-12-22 11:59:19', '2023-12-22 11:59:19'),
(78, '1703267960.jfif', '2023-12-22 11:59:20', '2023-12-22 11:59:20'),
(79, '1703267960.jpg', '2023-12-22 11:59:20', '2023-12-22 11:59:20'),
(80, '1703268069.jfif', '2023-12-22 12:01:09', '2023-12-22 12:01:09'),
(81, '1703268069.jpg', '2023-12-22 12:01:09', '2023-12-22 12:01:09'),
(82, '1703268070.jpg', '2023-12-22 12:01:10', '2023-12-22 12:01:10'),
(83, '1703268270.jfif', '2023-12-22 12:04:30', '2023-12-22 12:04:30'),
(84, '1703268270.jpg', '2023-12-22 12:04:30', '2023-12-22 12:04:30'),
(85, '1703268842.jfif', '2023-12-22 12:14:02', '2023-12-22 12:14:02'),
(86, '1703268843.jpg', '2023-12-22 12:14:03', '2023-12-22 12:14:03'),
(87, '1703268843.jpg', '2023-12-22 12:14:03', '2023-12-22 12:14:03'),
(88, '1703270354.jfif', '2023-12-22 12:39:14', '2023-12-22 12:39:14'),
(89, '1703270355.jpg', '2023-12-22 12:39:15', '2023-12-22 12:39:15'),
(90, '1703270355.jpg', '2023-12-22 12:39:15', '2023-12-22 12:39:15'),
(91, '1703270587.jpg', '2023-12-22 12:43:07', '2023-12-22 12:43:07'),
(92, '1703270588.jfif', '2023-12-22 12:43:08', '2023-12-22 12:43:08'),
(93, '1703270588.jpg', '2023-12-22 12:43:08', '2023-12-22 12:43:08'),
(94, '1703270627.jfif', '2023-12-22 12:43:47', '2023-12-22 12:43:47'),
(95, '1703270627.jpg', '2023-12-22 12:43:47', '2023-12-22 12:43:47'),
(96, '1703270628.jpg', '2023-12-22 12:43:48', '2023-12-22 12:43:48'),
(97, '1703270814.jfif', '2023-12-22 12:46:54', '2023-12-22 12:46:54'),
(98, '1703270814.jpg', '2023-12-22 12:46:54', '2023-12-22 12:46:54'),
(99, '1703270815.jpg', '2023-12-22 12:46:55', '2023-12-22 12:46:55'),
(100, '1703270972.jfif', '2023-12-22 12:49:32', '2023-12-22 12:49:32'),
(101, '1703270973.jpg', '2023-12-22 12:49:33', '2023-12-22 12:49:33'),
(102, '1703270973.jpg', '2023-12-22 12:49:33', '2023-12-22 12:49:33'),
(103, '1703270991.jfif', '2023-12-22 12:49:51', '2023-12-22 12:49:51'),
(104, '1703270992.jpg', '2023-12-22 12:49:52', '2023-12-22 12:49:52'),
(105, '1703270992.jpg', '2023-12-22 12:49:52', '2023-12-22 12:49:52'),
(106, '1703271300.jfif', '2023-12-22 12:55:00', '2023-12-22 12:55:00'),
(107, '1703271300.jpg', '2023-12-22 12:55:00', '2023-12-22 12:55:00');

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
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
