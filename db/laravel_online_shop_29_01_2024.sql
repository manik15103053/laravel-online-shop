-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2024 at 03:35 AM
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
(3, 'HP', 'hp', 1, '2024-01-19 06:24:21', '2024-01-19 06:24:21'),
(4, 'Lenovo', 'lenovo', 1, '2024-01-19 06:24:29', '2024-01-19 06:24:29'),
(5, 'ASUS', 'asus', 1, '2024-01-19 06:24:44', '2024-01-19 06:24:44'),
(6, 'Samsung', 'samsung', 1, '2024-01-19 06:24:52', '2024-01-19 06:24:52'),
(7, 'IPhone', 'iphone', 1, '2024-01-19 06:25:06', '2024-01-19 06:25:06'),
(8, 'Apple', 'apple', 1, '2024-01-19 06:27:12', '2024-01-19 06:27:12'),
(9, 'Oppo', 'oppo', 1, '2024-01-19 06:27:21', '2024-01-19 06:27:21'),
(10, 'Realme', 'realme', 1, '2024-01-19 06:27:40', '2024-01-19 06:27:52');

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
  `show_home` varchar(14) DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `show_home`, `created_at`, `updated_at`) VALUES
(38, 'Mobile phone', 'mobile-phone', '38.jpg', 1, 'Yes', '2024-01-21 12:23:08', '2024-01-21 12:23:08'),
(39, 'Computer', 'computer', '39.jpg', 1, 'Yes', '2024-01-21 12:23:29', '2024-01-21 12:23:29'),
(40, 'DSLR', 'dslr', '40.jpg', 1, 'Yes', '2024-01-21 12:24:10', '2024-01-21 12:24:10'),
(41, 'Monitor', 'monitor', '41.webp', 1, 'Yes', '2024-01-21 12:25:46', '2024-01-21 12:25:46');

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
(24, 'Samsung A57', 'samsung-a57', 50.00, 50.00, 38, 21, 6, 'Yes', '50', '1241', 'Yes', 251, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:39:28', '2024-01-22 11:39:28'),
(25, 'iPhone maxPro13', 'iphone-maxpro13', 50000.00, 4500.00, 38, 19, 7, 'Yes', '210', '1241', 'Yes', 5020, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:40:52', '2024-01-22 11:40:52'),
(26, 'Oppo A57', 'oppo-a57', 200000.00, 200000.00, 38, 20, 9, 'Yes', '1540', '1241', 'Yes', 25, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:42:45', '2024-01-22 11:42:45'),
(27, 'Realme A78', 'realme-a78', 18000.00, 18000.00, 38, 20, 9, 'Yes', '5010', '1241', 'Yes', 500, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:45:23', '2024-01-22 11:45:43'),
(28, 'DSLR A98', 'dslr-a98', 50000.00, 45000.00, 40, 17, 6, 'No', '1540', '102', 'Yes', 3210, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:47:45', '2024-01-22 11:47:45'),
(29, 'Monitor A65', 'monitor-a65', 50000.00, 45000.00, 41, 12, 3, 'No', '521', '1241', 'Yes', 120, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:49:14', '2024-01-22 11:49:14'),
(30, 'Laptop A95', 'laptop-a95', 50000.00, 45000.00, 39, 15, 3, 'No', '1110', '1241', 'Yes', 2100, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:50:43', '2024-01-22 11:50:43'),
(31, 'Smart Watch A57', 'smart-watch-a57', 4000.00, 3500.00, 38, 21, 6, 'No', '101', '1241', 'Yes', 120, 1, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', '2024-01-22 11:55:10', '2024-01-22 11:55:10');

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

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `sort_order`, `created_at`, `updated_at`) VALUES
(28, 24, '24-28-1705945168-1705945135.jpg', NULL, '2024-01-22 11:39:28', '2024-01-22 11:39:28'),
(29, 24, '24-29-1705945168-1705945145.jpg', NULL, '2024-01-22 11:39:28', '2024-01-22 11:39:28'),
(30, 25, '25-30-1705945252-1705945218.png', NULL, '2024-01-22 11:40:52', '2024-01-22 11:40:52'),
(31, 25, '25-31-1705945256-1705945224.jpg', NULL, '2024-01-22 11:40:56', '2024-01-22 11:40:56'),
(32, 25, '25-32-1705945256-1705945235.jpg', NULL, '2024-01-22 11:40:56', '2024-01-22 11:40:56'),
(33, 26, '26-33-1705945365-1705945317.jpg', NULL, '2024-01-22 11:42:45', '2024-01-22 11:42:45'),
(34, 26, '26-34-1705945366-1705945326.jpg', NULL, '2024-01-22 11:42:46', '2024-01-22 11:42:46'),
(35, 27, '27-35-1705945523-1705945485.jpg', NULL, '2024-01-22 11:45:23', '2024-01-22 11:45:23'),
(36, 27, 'NULL', NULL, '2024-01-22 11:45:43', '2024-01-22 11:45:43'),
(37, 28, '28-37-1705945665-1705945636.jpg', NULL, '2024-01-22 11:47:45', '2024-01-22 11:47:45'),
(38, 28, '28-38-1705945665-1705945640.jfif', NULL, '2024-01-22 11:47:45', '2024-01-22 11:47:45'),
(39, 29, '29-39-1705945754-1705945726.jpg', NULL, '2024-01-22 11:49:14', '2024-01-22 11:49:14'),
(40, 30, '30-40-1705945843-1705945823.jpg', NULL, '2024-01-22 11:50:43', '2024-01-22 11:50:43'),
(41, 31, '31-41-1705946110-1705946088.jpg', NULL, '2024-01-22 11:55:10', '2024-01-22 11:55:10'),
(42, 31, '31-42-1705946111-1705946088.png', NULL, '2024-01-22 11:55:11', '2024-01-22 11:55:11');

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
  `show_home` varchar(15) DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `status`, `show_home`, `created_at`, `updated_at`) VALUES
(12, 41, 'HP Monitor', 'hp-monitor', 1, 'Yes', '2024-01-21 12:26:09', '2024-01-21 12:26:09'),
(13, 41, 'Dell Monitor', 'dell-monitor', 1, 'Yes', '2024-01-21 12:26:22', '2024-01-21 12:26:22'),
(14, 41, 'Lenovo Monitor', 'lenovo-monitor', 1, 'Yes', '2024-01-21 12:26:36', '2024-01-21 12:26:36'),
(15, 39, 'HP Laptop', 'hp-laptop', 1, 'Yes', '2024-01-21 12:26:56', '2024-01-21 12:26:56'),
(16, 39, 'Lenovo laptop', 'lenovo-laptop', 1, 'Yes', '2024-01-21 12:27:25', '2024-01-21 12:33:09'),
(17, 40, 'Sony DSLR', 'sony-dslr', 1, 'Yes', '2024-01-21 12:33:33', '2024-01-21 12:33:33'),
(18, 40, 'Dell DSLR', 'dell-dslr', 1, 'Yes', '2024-01-21 12:34:04', '2024-01-21 12:34:04'),
(19, 38, 'iPhone', 'iphone', 1, 'Yes', '2024-01-21 12:34:19', '2024-01-21 12:34:19'),
(20, 38, 'Oppo', 'oppo', 1, 'Yes', '2024-01-21 12:34:33', '2024-01-21 12:34:33'),
(21, 38, 'Samsung', 'samsung', 1, 'Yes', '2024-01-21 12:34:50', '2024-01-21 12:34:50');

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
(188, '1704576647.jpg', '2024-01-06 15:30:47', '2024-01-06 15:30:47'),
(189, '1704576647.jpg', '2024-01-06 15:30:47', '2024-01-06 15:30:47'),
(190, '1704576648.jfif', '2024-01-06 15:30:48', '2024-01-06 15:30:48'),
(191, '1704609915.jfif', '2024-01-07 00:45:15', '2024-01-07 00:45:15'),
(192, '1704609915.jpg', '2024-01-07 00:45:15', '2024-01-07 00:45:15'),
(193, '1704610336.jfif', '2024-01-07 00:52:16', '2024-01-07 00:52:16'),
(194, '1704610337.jpg', '2024-01-07 00:52:17', '2024-01-07 00:52:17'),
(195, '1704610337.jpg', '2024-01-07 00:52:17', '2024-01-07 00:52:17'),
(196, '1704610404.jfif', '2024-01-07 00:53:24', '2024-01-07 00:53:24'),
(197, '1704610404.jpg', '2024-01-07 00:53:24', '2024-01-07 00:53:24'),
(198, '1704610749.jpg', '2024-01-07 00:59:09', '2024-01-07 00:59:09'),
(199, '1704610749.jpg', '2024-01-07 00:59:09', '2024-01-07 00:59:09'),
(200, '1704610750.jpg', '2024-01-07 00:59:10', '2024-01-07 00:59:10'),
(201, '1704611059.jpg', '2024-01-07 01:04:19', '2024-01-07 01:04:19'),
(202, '1704611059.jpg', '2024-01-07 01:04:19', '2024-01-07 01:04:19'),
(203, '1704611067.jfif', '2024-01-07 01:04:27', '2024-01-07 01:04:27'),
(204, '1704611068.jpg', '2024-01-07 01:04:28', '2024-01-07 01:04:28'),
(205, '1704611476.jpg', '2024-01-07 01:11:16', '2024-01-07 01:11:16'),
(206, '1704611476.jpg', '2024-01-07 01:11:16', '2024-01-07 01:11:16'),
(207, '1704612293.jfif', '2024-01-07 01:24:53', '2024-01-07 01:24:53'),
(208, '1704612293.jpg', '2024-01-07 01:24:53', '2024-01-07 01:24:53'),
(209, '1704612715.jpg', '2024-01-07 01:31:55', '2024-01-07 01:31:55'),
(210, '1704612715.jpg', '2024-01-07 01:31:55', '2024-01-07 01:31:55'),
(211, '1704612758.jfif', '2024-01-07 01:32:38', '2024-01-07 01:32:38'),
(212, '1704612759.jpg', '2024-01-07 01:32:39', '2024-01-07 01:32:39'),
(213, '1704699576.jpg', '2024-01-08 01:39:36', '2024-01-08 01:39:36'),
(214, '1704699577.jpg', '2024-01-08 01:39:37', '2024-01-08 01:39:37'),
(215, '1705652802.jpg', '2024-01-19 02:26:42', '2024-01-19 02:26:42'),
(216, '1705652803.jfif', '2024-01-19 02:26:43', '2024-01-19 02:26:43'),
(217, '1705660901.jpg', '2024-01-19 04:41:41', '2024-01-19 04:41:41'),
(218, '1705660902.jfif', '2024-01-19 04:41:42', '2024-01-19 04:41:42'),
(219, '1705665806.jpg', '2024-01-19 06:03:26', '2024-01-19 06:03:26'),
(220, '1705665807.jfif', '2024-01-19 06:03:27', '2024-01-19 06:03:27'),
(221, '1705666150.jfif', '2024-01-19 06:09:10', '2024-01-19 06:09:10'),
(222, '1705666589.jpg', '2024-01-19 06:16:29', '2024-01-19 06:16:29'),
(223, '1705666656.jfif', '2024-01-19 06:17:36', '2024-01-19 06:17:36'),
(224, '1705666755.jpg', '2024-01-19 06:19:15', '2024-01-19 06:19:15'),
(225, '1705667369.jfif', '2024-01-19 06:29:29', '2024-01-19 06:29:29'),
(226, '1705667370.jpg', '2024-01-19 06:29:30', '2024-01-19 06:29:30'),
(227, '1705667410.jpg', '2024-01-19 06:30:10', '2024-01-19 06:30:10'),
(228, '1705667411.jpg', '2024-01-19 06:30:11', '2024-01-19 06:30:11'),
(229, '1705667411.png', '2024-01-19 06:30:11', '2024-01-19 06:30:11'),
(230, '1705667423.jpg', '2024-01-19 06:30:23', '2024-01-19 06:30:23'),
(231, '1705667765.jpg', '2024-01-19 06:36:05', '2024-01-19 06:36:05'),
(232, '1705667765.jpg', '2024-01-19 06:36:05', '2024-01-19 06:36:05'),
(233, '1705667773.jpg', '2024-01-19 06:36:13', '2024-01-19 06:36:13'),
(234, '1705861383.jpg', '2024-01-21 12:23:03', '2024-01-21 12:23:03'),
(235, '1705861403.jpg', '2024-01-21 12:23:23', '2024-01-21 12:23:23'),
(236, '1705861447.jpg', '2024-01-21 12:24:07', '2024-01-21 12:24:07'),
(237, '1705861543.webp', '2024-01-21 12:25:43', '2024-01-21 12:25:43'),
(238, '1705945135.jpg', '2024-01-22 11:38:55', '2024-01-22 11:38:55'),
(239, '1705945145.jpg', '2024-01-22 11:39:05', '2024-01-22 11:39:05'),
(240, '1705945218.png', '2024-01-22 11:40:18', '2024-01-22 11:40:18'),
(241, '1705945224.jpg', '2024-01-22 11:40:24', '2024-01-22 11:40:24'),
(242, '1705945235.jpg', '2024-01-22 11:40:35', '2024-01-22 11:40:35'),
(243, '1705945317.jpg', '2024-01-22 11:41:57', '2024-01-22 11:41:57'),
(244, '1705945326.jpg', '2024-01-22 11:42:06', '2024-01-22 11:42:06'),
(245, '1705945485.jpg', '2024-01-22 11:44:45', '2024-01-22 11:44:45'),
(246, '1705945636.jpg', '2024-01-22 11:47:16', '2024-01-22 11:47:16'),
(247, '1705945640.jfif', '2024-01-22 11:47:20', '2024-01-22 11:47:20'),
(248, '1705945726.jpg', '2024-01-22 11:48:46', '2024-01-22 11:48:46'),
(249, '1705945823.jpg', '2024-01-22 11:50:23', '2024-01-22 11:50:23'),
(250, '1705946088.jpg', '2024-01-22 11:54:48', '2024-01-22 11:54:48'),
(251, '1705946088.png', '2024-01-22 11:54:48', '2024-01-22 11:54:48');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
