-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 08, 2026 at 06:29 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_dancs`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 16, '2026-06-03 23:41:45', '2026-06-03 23:41:45', NULL),
(7, 18, '2026-06-07 20:03:45', '2026-06-07 20:03:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `variant_id`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(236, 7, 53, 1, '2026-06-07 20:03:45', '2026-06-07 20:04:24', '2026-06-07 20:04:24'),
(237, 7, 55, 1, '2026-06-07 20:04:37', '2026-06-07 20:05:05', '2026-06-07 20:05:05'),
(238, 7, 60, 1, '2026-06-07 20:06:41', '2026-06-07 20:07:01', '2026-06-07 20:07:01'),
(239, 7, 61, 1, '2026-06-07 20:07:28', '2026-06-07 20:07:47', '2026-06-07 20:07:47'),
(240, 7, 59, 1, '2026-06-07 20:08:15', '2026-06-07 20:20:17', '2026-06-07 20:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'active', '2025-06-29 02:44:00', '2025-06-29 02:44:00', NULL),
(2, NULL, 'active', '2025-06-29 02:44:29', '2025-06-29 02:44:29', NULL),
(3, NULL, 'active', '2025-06-29 02:44:49', '2025-06-29 02:44:49', NULL),
(4, NULL, 'active', '2025-06-29 02:45:05', '2025-06-29 02:45:05', NULL),
(5, NULL, 'active', '2025-06-29 02:45:24', '2025-06-29 02:45:24', NULL),
(6, NULL, 'active', '2025-06-29 02:45:45', '2025-06-29 02:45:45', NULL),
(7, NULL, 'active', '2025-06-29 02:46:07', '2025-07-09 02:42:26', NULL),
(8, 1, 'active', '2025-06-29 02:46:42', '2025-06-29 02:46:42', NULL),
(9, 1, 'active', '2025-06-29 03:40:06', '2025-06-29 03:40:06', NULL),
(10, NULL, 'active', '2025-06-29 07:24:11', '2025-06-29 07:24:11', NULL),
(11, NULL, 'active', '2025-07-02 12:17:34', '2025-07-02 12:17:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `language_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `language_code`, `name`, `description`, `created_at`, `updated_at`) VALUES
(3, 2, 'en', 'Dining Room', 'Dining Room', '2025-06-29 02:44:29', '2025-06-29 02:44:29'),
(4, 2, 'vi', 'Phòng ăn', 'Phòng ăn', '2025-06-29 02:44:29', '2025-06-29 02:44:29'),
(5, 3, 'en', 'Bedroom', 'Bedroom', '2025-06-29 02:44:49', '2025-06-29 02:44:49'),
(6, 3, 'vi', 'Phòng ngủ', 'Phòng ngủ', '2025-06-29 02:44:49', '2025-06-29 02:44:49'),
(7, 4, 'en', 'Kitchen', 'Kitchen', '2025-06-29 02:45:05', '2025-06-29 02:45:05'),
(8, 4, 'vi', 'Phòng bếp', 'Phòng bếp', '2025-06-29 02:45:05', '2025-06-29 02:45:05'),
(9, 5, 'en', 'Office', 'Office', '2025-06-29 02:45:24', '2025-06-29 02:45:24'),
(10, 5, 'vi', 'Phòng làm việc', 'Phòng làm việc', '2025-06-29 02:45:24', '2025-06-29 02:45:24'),
(11, 6, 'en', 'Exterior', 'Exterior', '2025-06-29 02:45:45', '2025-06-29 02:45:45'),
(12, 6, 'vi', 'Ngoại thất', 'Ngoại thất', '2025-06-29 02:45:45', '2025-06-29 02:45:45'),
(15, 8, 'en', 'Water table', 'Water table', '2025-06-29 02:46:42', '2025-06-29 02:46:42'),
(16, 8, 'vi', 'Bàn nước', 'Bàn nước', '2025-06-29 02:46:42', '2025-06-29 02:46:42'),
(17, 9, 'en', 'Armchair', 'Armchair', '2025-06-29 03:40:06', '2025-06-29 03:40:06'),
(18, 9, 'vi', 'Armchair', 'Armchair', '2025-06-29 03:40:06', '2025-06-29 03:40:06'),
(19, 10, 'en', 'Test', 'Test', '2025-06-29 07:24:11', '2025-06-29 07:24:11'),
(20, 10, 'vi', 'Test', 'Test', '2025-06-29 07:24:11', '2025-06-29 07:24:11'),
(21, 11, 'en', 'sd', 'đ', '2025-07-02 12:17:34', '2025-07-02 12:17:34'),
(22, 11, 'vi', 'gế công thái học', 'đ', '2025-07-02 12:17:34', '2025-07-02 12:17:34'),
(25, 7, 'en', 'Sofa', 'Sofa', '2025-07-09 02:42:26', '2025-07-09 02:42:26'),
(26, 7, 'vi', 'Sofa', 'Sofa', '2025-07-09 02:42:26', '2025-07-09 02:42:26'),
(27, 1, 'en', 'Living Room', 'Living Room', '2026-06-02 17:17:35', '2026-06-02 17:17:35'),
(28, 1, 'vi', 'Phòng khách', 'Phòng khách', '2026-06-02 17:17:35', '2026-06-02 17:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_percent` int DEFAULT NULL,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `min_order_amount` decimal(10,2) DEFAULT NULL,
  `max_uses` int NOT NULL,
  `used_count` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `expires_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_percent`, `max_discount_amount`, `discount_amount`, `min_order_amount`, `max_uses`, `used_count`, `is_active`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'TET2025', 30, 200000.00, NULL, 120000.00, 20, 5, 1, '2025-08-14 00:00:00', '2025-06-29 03:52:57', '2025-08-05 07:59:30'),
(2, 'TEST', 100, 1000000.00, NULL, 10000000.00, 10, 0, 1, '2025-07-29 00:00:00', '2025-07-27 08:40:35', '2025-07-27 08:40:35'),
(3, 'TEST1', NULL, NULL, 6000000.00, 10000000.00, 5, 1, 1, '2026-07-30 00:00:00', '2025-07-27 08:42:56', '2026-06-03 18:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '440e0bbb-5f86-4b23-8beb-90b9aa978ad8', 'database', 'default', '{\"uuid\":\"440e0bbb-5f86-4b23-8beb-90b9aa978ad8\",\"displayName\":\"App\\\\Mail\\\\OrderCancelledMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:27:\\\"App\\\\Mail\\\\OrderCancelledMail\\\":4:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:107;s:9:\\\"relations\\\";a:2:{i:0;s:7:\\\"payment\\\";i:1;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"cancelReason\\\";s:11:\\\"hết hàng\\\";s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"khoanvph54622@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1754707315,\"delay\":null}', 'InvalidArgumentException: View [emails.orders.cancelled] not found. in C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\View\\FileViewFinder.php:138\nStack trace:\n#0 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\View\\FileViewFinder.php(78): Illuminate\\View\\FileViewFinder->findInPaths(\'emails.orders.c...\', Array)\n#1 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Factory.php(150): Illuminate\\View\\FileViewFinder->find(\'emails.orders.c...\')\n#2 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(444): Illuminate\\View\\Factory->make(\'emails.orders.c...\', Array)\n#3 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(419): Illuminate\\Mail\\Mailer->renderView(\'emails.orders.c...\', Array)\n#4 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(312): Illuminate\\Mail\\Mailer->addContent(Object(Illuminate\\Mail\\Message), \'emails.orders.c...\', NULL, NULL, Array)\n#5 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send(\'emails.orders.c...\', Array, Object(Closure))\n#6 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#8 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#9 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#10 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#11 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#12 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#13 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#14 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#15 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#16 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#17 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#19 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#21 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#24 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#26 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#27 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#29 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#31 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#32 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#33 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#34 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#35 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\symfony\\console\\Command\\Command.php(318): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#36 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#37 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\symfony\\console\\Application.php(1092): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\symfony\\console\\Application.php(341): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#39 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\symfony\\console\\Application.php(192): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\laravel-interior-main\\laravel-interior-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#43 {main}', '2025-08-08 19:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`code`, `name`, `created_at`) VALUES
('en', 'English', '2025-06-09 09:42:30'),
('vi', 'Vietnamese', '2025-06-09 09:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2025_06_07_131250_create_roles_table', 1),
(4, '2025_06_08_000010_create_permissions_table', 1),
(5, '2025_06_08_000020_create_role_permissions_table', 1),
(6, '2025_06_08_000030_create_users_table', 1),
(7, '2025_06_08_000040_create_languages_table', 1),
(8, '2025_06_08_000050_create_categories_table', 1),
(9, '2025_06_08_000060_create_category_translations_table', 1),
(10, '2025_06_08_000070_create_products_table', 1),
(11, '2025_06_08_000080_create_product_translations_table', 1),
(12, '2025_06_08_000090_create_product_options_table', 1),
(13, '2025_06_08_000100_create_product_option_values_table', 1),
(14, '2025_06_08_000110_create_product_variants_table', 1),
(15, '2025_06_08_000120_create_variant_option_values_table', 1),
(16, '2025_06_08_000130_create_images_table', 1),
(17, '2025_06_08_000140_create_carts_table', 1),
(18, '2025_06_08_000150_create_cart_items_table', 1),
(19, '2025_06_08_000160_create_coupons_table', 1),
(20, '2025_06_08_000170_create_orders_table', 1),
(21, '2025_06_08_000180_create_order_items_table', 1),
(22, '2025_06_08_000190_create_order_status_logs_table', 1),
(23, '2025_06_08_000200_create_reviews_table', 1),
(24, '2025_06_08_000210_create_user_coupons_table', 1),
(25, '2025_06_08_000220_create_wishlists_table', 1),
(26, '2025_06_08_000230_create_sales_statistics_table', 1),
(27, '2025_06_20_151651_add_otp_fields_to_users_table', 1),
(28, '2025_06_20_170149_add_is_verified_to_users_table', 1),
(29, '2025_06_26_035512_create_payments_table', 1),
(30, '2025_06_27_182911_add_status_to_product_options_table', 1),
(31, '2025_06_27_183235_add_color_code_to_product_option_values_table', 1),
(32, '2025_06_27_184918_add_category_id_to_product_options_table', 1),
(33, '2025_06_27_200235_update_product_options_make_product_id_nullable', 1),
(34, '2025_06_28_175556_add_deleted_at_to_product_options_and_product_option_values', 1),
(35, '2025_06_28_193819_add_type_to_product_options_table', 1),
(36, '2025_06_28_220723_add_dimensions_and_warranty_to_products', 1),
(37, '2025_06_28_220753_add_material_and_style_to_product_translations', 1),
(38, '2025_06_28_230346_create_product_variant_option_values_table', 1),
(39, '2025_06_29_010913_add_name_to_product_variants_table', 1),
(40, '2025_06_29_012827_add_color_to_product_variants_table', 1),
(41, '2025_06_29_013304_modify_variant_name_nullable_in_product_variants_table', 1),
(42, '2025_06_29_014130_add_image_to_products_table', 1),
(43, '2025_07_02_175716_add_composite_key_to_product_variants_table', 2),
(44, '2025_07_02_182202_add_material_and_dimensions_to_product_variants_table', 3),
(45, '2025_07_02_191541_add_size_to_product_variants_table', 4),
(46, '2025_07_09_093620_add_auto_hidden_by_category_to_products_table', 5),
(47, '2025_07_10_201514_add_remember_token_to_users_table', 6),
(48, '2025_07_17_043512_create_post_categories_table', 7),
(49, '2025_07_17_054325_add_deleted_at_to_carts_table', 8),
(50, '2025_07_17_073018_add_deleted_at_to_cart_items_table', 8),
(51, '2025_07_17_043536_create_posts_table', 9),
(52, '2025_07_17_234307_add_booking_code_to_orders_table', 9),
(53, '2025_07_24_140816_add_max_discount_amount_to_coupons_table', 9),
(54, '2025_07_24_152126_add_discount_id_to_orders_table', 9),
(55, '2025_07_24_161800_add_address_avatar_to_users_table', 9),
(56, '2025_07_25_130626_add_is_visible_to_reviews_table', 10),
(57, '2025_07_27_101351_add_created_at_to_order_status_logs_table', 11),
(58, '2025_07_27_101555_add_timestamps_to_order_status_logs_table', 12),
(59, '2025_08_09_024311_add_cancel_reason_to_orders_table', 13),
(60, '2025_09_22_155454_add_shipping_at_to_orders_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_amount` decimal(14,2) DEFAULT NULL,
  `status` enum('pending','confirmed','shipping','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `shipping_at` timestamp NULL DEFAULT NULL,
  `cancel_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `booking_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `coupon_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `total_amount`, `status`, `shipping_at`, `cancel_reason`, `created_at`, `updated_at`, `deleted_at`, `booking_code`, `discount_id`) VALUES
(182, 16, NULL, 'asd', '1234534234', 'chí hòa', 9000000.00, 'cancelled', NULL, 'Người dùng đã tự hủy đơn', '2026-06-03 23:42:45', '2026-06-03 23:59:13', NULL, NULL, NULL),
(183, 16, NULL, 'asd', '1234534234', 'chí hòa', 9000000.00, 'cancelled', NULL, 'Người dùng đã tự hủy đơn', '2026-06-04 00:00:00', '2026-06-04 17:58:57', NULL, NULL, NULL),
(184, 16, NULL, 'asd', '1234534234', 'hong minh', 9000000.00, 'shipping', '2026-06-07 08:24:02', NULL, '2026-06-04 17:58:17', '2026-06-07 08:24:02', NULL, NULL, NULL),
(185, 18, NULL, 'Quốc', '0312456896', 'Hà Đông', 15000000.00, 'pending', NULL, NULL, '2026-06-07 20:04:24', '2026-06-07 20:04:24', NULL, NULL, NULL),
(186, 18, NULL, 'Quốc', '0312456896', 'Hà đông', 14000000.00, 'pending', NULL, NULL, '2026-06-07 20:05:05', '2026-06-07 20:05:05', NULL, NULL, NULL),
(187, 18, NULL, 'Quốc', '0312456896', '.', 3000000.00, 'completed', '2026-06-07 21:39:59', NULL, '2026-06-07 20:07:01', '2026-06-07 21:40:18', NULL, NULL, NULL),
(188, 18, NULL, 'Quốc', '0312456896', '.', 2000000.00, 'completed', '2026-06-07 21:39:21', NULL, '2026-06-07 20:07:47', '2026-06-07 21:39:35', NULL, NULL, NULL),
(189, 18, NULL, 'Quốc', '0312456896', 'tố hữu', 4500000.00, 'shipping', '2026-06-07 20:21:13', NULL, '2026-06-07 20:20:16', '2026-06-07 20:21:13', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL COMMENT 'price per unit at time of purchase',
  `total_price` decimal(14,2) DEFAULT NULL,
  `variant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price_snapshot` decimal(10,2) NOT NULL COMMENT 'snapshot of original variant price',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `variant_id`, `quantity`, `unit_price`, `total_price`, `variant_name`, `base_price_snapshot`, `created_at`, `updated_at`) VALUES
(222, 185, 53, 1, 15000000.00, 15000000.00, 'Variant 1', 0.00, '2026-06-07 20:04:24', '2026-06-07 20:04:24'),
(223, 186, 55, 1, 14000000.00, 14000000.00, 'z00 - 9 - 8', 0.00, '2026-06-07 20:05:05', '2026-06-07 20:05:05'),
(224, 187, 60, 1, 3000000.00, 3000000.00, 'z01 - 124 - 123', 0.00, '2026-06-07 20:07:01', '2026-06-07 20:07:01'),
(225, 188, 61, 1, 2000000.00, 2000000.00, 'z01 - 124 - 123', 0.00, '2026-06-07 20:07:47', '2026-06-07 20:07:47'),
(226, 189, 59, 1, 4500000.00, 4500000.00, 'z00 - 15 - 14', 0.00, '2026-06-07 20:20:17', '2026-06-07 20:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_status_logs`
--

CREATE TABLE `order_status_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `old_status` enum('pending','confirmed','shipping','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `new_status` enum('pending','confirmed','shipping','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `changed_by` bigint UNSIGNED DEFAULT NULL,
  `changed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_logs`
--

INSERT INTO `order_status_logs` (`id`, `order_id`, `old_status`, `new_status`, `changed_by`, `changed_at`, `created_at`, `updated_at`) VALUES
(175, 184, 'pending', 'confirmed', 14, '2026-06-07 08:23:56', '2026-06-07 08:23:56', '2026-06-07 08:23:56'),
(176, 184, 'confirmed', 'shipping', 14, '2026-06-07 08:24:02', '2026-06-07 08:24:02', '2026-06-07 08:24:02'),
(177, 189, 'pending', 'confirmed', 14, '2026-06-07 20:21:08', '2026-06-07 20:21:08', '2026-06-07 20:21:08'),
(178, 189, 'confirmed', 'shipping', 14, '2026-06-07 20:21:13', '2026-06-07 20:21:13', '2026-06-07 20:21:13'),
(179, 188, 'pending', 'confirmed', 14, '2026-06-07 21:39:12', '2026-06-07 21:39:12', '2026-06-07 21:39:12'),
(180, 188, 'confirmed', 'shipping', 14, '2026-06-07 21:39:21', '2026-06-07 21:39:21', '2026-06-07 21:39:21'),
(181, 188, 'shipping', 'completed', NULL, '2026-06-07 21:39:35', '2026-06-07 21:39:35', '2026-06-07 21:39:35'),
(182, 187, 'pending', 'confirmed', 14, '2026-06-07 21:39:54', '2026-06-07 21:39:54', '2026-06-07 21:39:54'),
(183, 187, 'confirmed', 'shipping', 14, '2026-06-07 21:39:59', '2026-06-07 21:39:59', '2026-06-07 21:39:59'),
(184, 187, 'shipping', 'completed', NULL, '2026-06-07 21:40:18', '2026-06-07 21:40:18', '2026-06-07 21:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` bigint UNSIGNED DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `transaction_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `user_id`, `amount`, `method`, `status`, `transaction_code`, `paid_at`, `created_at`, `updated_at`) VALUES
(163, 182, 16, 9000000, 'cod', 'pending', NULL, NULL, '2026-06-03 23:42:45', '2026-06-03 23:42:45'),
(164, 183, 16, 9000000, 'cod', 'pending', NULL, NULL, '2026-06-04 00:00:00', '2026-06-04 00:00:00'),
(165, 184, 16, 9000000, 'cod', 'pending', NULL, NULL, '2026-06-04 17:58:17', '2026-06-04 17:58:17'),
(166, 185, 18, 15000000, 'cod', 'pending', NULL, NULL, '2026-06-07 20:04:24', '2026-06-07 20:04:24'),
(167, 186, 18, 14000000, 'cod', 'pending', NULL, NULL, '2026-06-07 20:05:05', '2026-06-07 20:05:05'),
(168, 187, 18, 3000000, 'cod', 'paid', NULL, NULL, '2026-06-07 20:07:01', '2026-06-07 21:40:18'),
(169, 188, 18, 2000000, 'cod', 'paid', NULL, NULL, '2026-06-07 20:07:47', '2026-06-07 21:39:35'),
(170, 189, 18, 4500000, 'cod', 'pending', NULL, NULL, '2026-06-07 20:20:17', '2026-06-07 20:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('draft','published') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `thumbnail`, `category_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(6, 'CHIÊM NGƯỠNG CÁC DÒNG SẢN PHẨM CHO MÙA MỚI', 'chiem-nguong-cac-dong-san-pham-cho-mua-moi', 'Bên cạnh việc tiếp tục làm mới không gian cửa hàng, mang đến trải nghiệm độc đáo cho khách hàng, Style House sẽ giới thiệu những dòng sản phẩm mới với thiết kế hợp thời, kiểu dáng đa dạng cùng chất lượng cao. Hãy cùng khám phá các sản phẩm mới sẽ có mặt tại các cửa hàng Style House.', 'uploads/posts/1753160983_Ban-Nuoc-Valencia-Mat-Da-04.jpg', 2, 1, 'draft', '2025-07-21 22:09:43', '2025-07-21 22:09:43'),
(8, 'Tối Giản nhưng Tinh Tế – Vẻ Đẹp Mộc Mạc của Không Gian Nội Thất Bắc Âu', 'toi-gian-nhung-tinh-te-ve-dep-moc-mac-cua-khong-gian-noi-that-bac-au', 'Trong nhịp sống hiện đại đầy hối hả, con người ngày càng có xu hướng tìm về sự đơn giản và gần gũi với thiên nhiên. Và đó cũng chính là lý do phong cách nội thất Bắc Âu (Scandinavian) trở nên phổ biến – với những thiết kế tối giản nhưng tinh tế, nhẹ nhàng mà không kém phần ấm cúng.\r\n\r\nBức ảnh trên là một ví dụ điển hình: bộ bàn ghế gỗ với tông màu trắng - gỗ tự nhiên nhẹ nhàng, chân ghế thanh mảnh và đường nét gọn gàng. Từng chi tiết đều thể hiện rõ tinh thần “ít mà chất” (less is more) – một triết lý cốt lõi của phong cách Bắc Âu.\r\n\r\nĐiểm đặc biệt của thiết kế này nằm ở sự kết hợp hài hòa giữa vật liệu gỗ và sắc trắng, tạo nên cảm giác thanh thoát và thoáng đãng. Những chiếc ghế có phần tựa lưng hình trái tim cách điệu, vừa đáng yêu vừa tạo sự thoải mái cho người sử dụng. Bàn tròn với chân trụ trắng tạo sự đối xứng và cân bằng không gian, đồng thời tối ưu hóa diện tích, phù hợp với các quán cà phê, phòng ăn nhỏ hoặc góc đọc sách tại gia.\r\n\r\nKhông gian xung quanh – với bức tường gạch sơn trắng và sàn gạch xám – càng tôn thêm vẻ đẹp giản dị và sạch sẽ, mang lại cảm giác thư thái, dễ chịu mỗi khi ngồi xuống.', 'uploads/posts/1753180438_effect9.jpg', 2, 1, 'draft', '2025-07-22 03:33:58', '2025-07-22 03:33:58'),
(9, 'Không Gian Nghỉ Ngơi Hoàn Hảo: Tối Giản, Tinh Tế và Đầy Cảm Hứng', 'khong-gian-nghi-ngoi-hoan-hao-toi-gian-tinh-te-va-day-cam-hung', 'Trong một thế giới ngày càng bận rộn, không gian phòng ngủ không chỉ là nơi để nghỉ ngơi mà còn trở thành “ốc đảo” bình yên giúp tái tạo năng lượng sau mỗi ngày dài. Và một thiết kế tối giản, tinh tế như trong bức ảnh trên chính là lựa chọn hoàn hảo cho những ai đang tìm kiếm sự thư giãn trọn vẹn.\r\n\r\nChiếc giường với phần đầu giường bằng gỗ tự nhiên tạo điểm nhấn ấm áp cho không gian. Màu gỗ trầm ấm mang lại cảm giác gần gũi, dễ chịu, đồng thời kết hợp hài hòa với bộ chăn ga trắng tinh khôi – tượng trưng cho sự sạch sẽ, thư thái và nhẹ nhàng.\r\n\r\nBàn đầu giường tròn bằng gỗ cùng mặt đá trắng, đi kèm chiếc đèn ngủ thiết kế hiện đại với chân đồng ánh kim tinh tế, tạo nên sự cân bằng giữa cổ điển và hiện đại. Bình hoa nhỏ với nhánh cây khô mộc mạc là điểm nhấn nhẹ nhàng, đủ để tăng tính thẩm mỹ mà không làm rối mắt.\r\n\r\nTất cả các chi tiết trong không gian này đều được bố trí gọn gàng, có chủ đích, đúng tinh thần của phong cách Minimalism (tối giản) – nơi mà sự đơn giản mang lại cảm giác an yên, thoải mái và dễ chịu.', 'uploads/posts/1753180513_effect8.jpg', 3, 1, 'draft', '2025-07-22 03:35:13', '2025-07-22 03:35:13'),
(10, 'Phòng Khách Tối Giản – Nơi Giao Thoa Giữa Nghệ Thuật và Cuộc Sống', 'phong-khach-toi-gian-noi-giao-thoa-giua-nghe-thuat-va-cuoc-song', 'Một không gian phòng khách không chỉ đơn thuần là nơi tiếp khách, mà còn là trái tim của ngôi nhà – nơi thể hiện gu thẩm mỹ, cá tính và cảm xúc của gia chủ. Hình ảnh trên là minh chứng rõ nét cho một phòng khách lý tưởng: thanh lịch, cân đối và ngập tràn ánh sáng.\r\n\r\nChiếc sofa màu xanh pastel trở thành điểm nhấn trung tâm, mang đến cảm giác mát mẻ, dễ chịu và thư giãn. Gam màu dịu nhẹ này không chỉ làm dịu tâm trạng mà còn dễ dàng phối hợp với các tông màu khác như be, trắng, hoặc gỗ tự nhiên.\r\n\r\nChiếc ghế bành nhung màu vàng mật ong tạo nên sự tương phản hoàn hảo, giúp căn phòng thêm sinh động mà vẫn giữ được vẻ hài hòa tổng thể. Kết hợp cùng thảm trải sàn màu xanh nhạt, bàn trà đá marble với khung đen thanh mảnh và đèn sàn kiểu dáng tinh tế, không gian toát lên vẻ hiện đại và tinh tế đến từng chi tiết.\r\n\r\nĐặc biệt, ánh sáng tự nhiên từ cửa sổ lớn phủ rèm trắng mỏng tạo nên một bầu không khí thoáng đãng, tươi sáng. Những chậu cây xanh đặt khéo léo trong phòng không chỉ mang lại sinh khí mà còn làm dịu mắt, kết nối con người với thiên nhiên.', 'uploads/posts/1753180598_phong-khach-voi-sofa-penny.jpg', 2, 1, 'draft', '2025-07-22 03:36:38', '2025-07-22 03:36:38'),
(11, '“Mây” – Tựa Như Gió Thoảng Qua Miền Quê', 'may-tua-nhu-gio-thoang-qua-mien-que', 'Nhẹ nhàng, thư thái, và gần gũi với thiên nhiên – đó là cảm giác mà bạn sẽ cảm nhận được ngay khi chạm mắt đến Bộ sưu tập Mây – một sáng tạo mới nhất từ Nhà Xinh, lấy cảm hứng từ vẻ đẹp mộc mạc, bình dị của hồn quê Việt Nam.\r\nNhững sợi mây được đan tay tỉ mỉ, tạo nên các đường cong mềm mại, uyển chuyển, vừa tạo cảm giác thoải mái khi sử dụng, vừa giữ vững yếu tố thẩm mỹ cao cấp. Các nghệ nhân đã khéo léo đan tay từng sợi mây, tạo nên cấu trúc nhẹ nhàng, mềm mại nhưng không kém phần vững chắc. Phần viền khung gỗ beech được xử lý mượt mà, định hình cá tính cho không gian sống hiện đại.\r\nMỗi chiếc ghế ăn, armchair hay bàn ăn không chỉ đóng vai trò chức năng, mà còn khơi gợi hình ảnh hiên nhà xưa, nơi có tiếng võng đung đưa, làn gió nhẹ xuyên qua vòm lá. \r\n\r\nVới Mây, bạn không chỉ bày trí một căn phòng, mà đang thổi vào không gian sống của mình một tâm hồn Việt – êm dịu, hiền hòa và đầy chiều sâu.', 'uploads/posts/1753180746_SOFA-MAY.webp', 2, 1, 'draft', '2025-07-22 03:39:06', '2025-07-22 03:39:06'),
(12, 'Nội thất của căn hộ mang nét đẹp nghệ thuật hài hòa giữa truyền thống và hiện đại', 'noi-that-cua-can-ho-mang-net-dep-nghe-thuat-hai-hoa-giua-truyen-thong-va-hien-dai', 'Với nội thất được thiết kế chỉnh chu, căn hộ thuộc sở hữu của một nữ doanh nhân có niềm yêu thích sâu sắc với nét đẹp truyền thống cùng các sản phẩm nội thất mộc mạc, tinh tế. Không gian đã thể hiện rõ cách chọn thiết kế nội thất kỹ lưỡng, sử dụng vật liệu tự nhiên, thân thiện với môi trường.\r\nKhi bước chân vào có thể cảm nhận sự thông thoáng, tươi mát của một không gian mở với ánh sáng tự nhiên ngập tràn. Không gian phòng khách với sofa vải rộng rãi, êm ái kết nối với phòng ăn, phòng đọc sách. Những chiếc bàn nước tròn mặt gỗ chân kính, vừa lạ mắt vừa tiết kiệm không gian.', 'uploads/posts/1753180824_noi-that-can-ho-cao-cap.jpg', 2, 1, 'draft', '2025-07-22 03:40:24', '2025-07-22 03:40:24'),
(13, 'Gian Bếp Hiện Đại – Nơi Thắp Lửa Yêu Thương Trong Mỗi Bữa Cơm Gia Đình', 'gian-bep-hien-dai-noi-thap-lua-yeu-thuong-trong-moi-bua-com-gia-dinh', 'Trong mỗi ngôi nhà, gian bếp không chỉ là nơi nấu ăn mà còn là nơi gắn kết tình cảm giữa các thành viên. Một không gian bếp đẹp, tiện nghi và tinh tế sẽ truyền cảm hứng để mỗi bữa ăn trở thành một khoảnh khắc đáng nhớ. Hình ảnh trên là minh chứng rõ nét cho một phòng bếp lý tưởng của thời đại mới.\r\n\r\nĐiểm nhấn của không gian chính là đảo bếp trung tâm với mặt đá vân mây sang trọng, chân bếp sơn đen lì tạo sự mạnh mẽ, vững chãi. Ba chiếc ghế cao chân gỗ phối mặt trắng tạo nên điểm cân bằng hoàn hảo giữa cổ điển và hiện đại, vừa tiện dụng vừa mang giá trị thẩm mỹ cao.\r\n\r\nTủ bếp trên màu trắng kết hợp với tủ dưới màu đen đậm, tạo nên sự tương phản hài hòa, thời thượng. Thiết kế này giúp không gian bếp vừa sáng sủa, rộng rãi lại vừa ấm cúng, sạch sẽ. Hệ thống đèn LED âm tủ cùng gạch ốp tường dạng lưới trắng mang đến cảm giác gọn gàng, tinh tế và dễ lau chùi.\r\n\r\nNgoài ra, khu vực này còn được trang trí nhẹ nhàng với bình hoa trắng tinh khôi, chậu cây xanh tươi, giúp không gian bếp thêm sinh động và gần gũi với thiên nhiên.', 'uploads/posts/1753180918_nha-xinh-tu-bep-lovely-600x400.jpg', 2, 1, 'draft', '2025-07-22 03:41:58', '2025-07-22 03:41:58'),
(15, 'Ghế Sofa Góc Nỉ Hiện Đại – Sang Trọng Cho Phòng Khách', 'ghe-sofa-goc-ni-hien-dai-sang-trong-cho-phong-khach', 'Ghế sofa góc nỉ là lựa chọn lý tưởng cho những không gian phòng khách hiện đại, trẻ trung và tiện nghi. Với thiết kế chữ L rộng rãi, sản phẩm không chỉ mang lại cảm giác thoải mái khi sử dụng mà còn giúp tối ưu diện tích căn phòng, tạo nên điểm nhấn sang trọng cho không gian sống.\r\n\r\nMẫu sofa được phối màu xám – trắng tinh tế, dễ dàng kết hợp với nhiều phong cách nội thất khác nhau. Phần đệm ngồi màu xám đậm tạo cảm giác sạch sẽ, chắc chắn, trong khi phần thân ghế màu trắng giúp tổng thể trở nên sáng và hiện đại hơn. Thiết kế ghế dài bên phải giúp người dùng có thể nằm nghỉ, đọc sách, xem tivi hoặc thư giãn sau một ngày làm việc.\r\n\r\nChất liệu nỉ mềm mại mang lại cảm giác êm ái khi ngồi, đồng thời tạo vẻ đẹp ấm cúng cho phòng khách. Các đường may chia ô trên bề mặt ghế giúp sản phẩm thêm phần nổi bật, gọn gàng và có tính thẩm mỹ cao. Đi kèm là các gối tựa nhiều họa tiết, vừa tăng sự thoải mái vừa làm cho bộ sofa trở nên sinh động hơn.\r\n\r\nƯu điểm nổi bật\r\n\r\nThiết kế sofa góc chữ L hiện đại, phù hợp phòng khách gia đình, căn hộ, chung cư.\r\n\r\nMàu sắc xám trắng trang nhã, dễ phối với bàn trà, thảm và các đồ nội thất khác.\r\n\r\nĐệm ngồi rộng rãi, êm ái, tạo cảm giác thoải mái khi sử dụng lâu.\r\n\r\nGhế có phần nằm thư giãn tiện lợi, phù hợp xem tivi, nghỉ ngơi hoặc tiếp khách.\r\n\r\nKiểu dáng sang trọng, giúp không gian phòng khách trở nên gọn gàng và đẳng cấp hơn.', 'uploads/posts/1780561752_ghe-sofa-goc-ni-dep-sf70.1.jpg', 2, 14, 'published', '2026-06-04 01:29:12', '2026-06-04 01:29:12'),
(16, 'SOFA VĂNG NỈ HIỆN ĐẠI – TỐI GIẢN MÀ SANG TRỌNG', 'sofa-vang-ni-hien-dai-toi-gian-ma-sang-trong', 'Mẫu sofa văng màu ghi xám được thiết kế theo phong cách hiện đại, đơn giản nhưng rất tinh tế, phù hợp với nhiều không gian phòng khách, căn hộ chung cư, studio hoặc phòng làm việc.\r\n\r\nGhế sử dụng form dáng thẳng gọn gàng, phần tựa lưng may chần nút nhẹ tạo điểm nhấn, kết hợp tay vịn vuông chắc chắn và chân gỗ cao thanh thoát. Màu xám trung tính giúp không gian trở nên sang hơn, dễ phối với bàn trà, thảm, kệ trang trí và các tone nội thất khác.\r\n\r\nĐiểm nổi bật của mẫu sofa này là có đôn rời đi kèm, có thể dùng để gác chân, làm ghế phụ hoặc sắp xếp linh hoạt tùy diện tích phòng. Chất liệu nỉ/vải mềm mại, tạo cảm giác êm ái khi ngồi, phù hợp cho sinh hoạt gia đình, tiếp khách hoặc thư giãn hằng ngày.', 'uploads/posts/1780847208_duoi.jpg', 2, 14, 'published', '2026-06-07 08:46:48', '2026-06-07 08:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(4, 'Phòng Ngủ', 'p', '2026-06-07 09:36:43', '2026-06-07 09:36:43'),
(5, 'Phòng Khách', 'phong-khach', '2026-06-07 09:37:04', '2026-06-07 09:37:04'),
(6, 'Phòng Làm Việc', 'phong-lm-vc', '2026-06-07 09:37:25', '2026-06-07 09:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `dimensions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty_months` int DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `auto_hidden_by_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `attribute_id`, `image`, `base_price`, `dimensions`, `warranty_months`, `status`, `created_at`, `updated_at`, `deleted_at`, `auto_hidden_by_category`) VALUES
(42, 7, 6, 'products/cznt1fJZe4q0hRFMmm5uSGZZG5zPpaPn7Z8ebOLL.jpg', 0.00, 'D1600 - R800 - C800 mm', 12, 'active', '2026-06-07 08:45:12', '2026-06-07 08:45:12', NULL, 0),
(43, 7, 6, 'products/qVVwpaBce33Z0dwZA1yhHXkZYNxlaZ471eFda4rT.jpg', 0.00, 'D2000 - R1000 - C720 mm', 12, 'active', '2026-06-07 08:48:18', '2026-06-07 08:48:18', NULL, 0),
(44, 8, 17, 'products/L5j4iBvQPeAb9iS2dL9nh4D8AXU2z9DPDIX9MU9g.jpg', 0.00, 'D2000 - R1000 - C720 mm', 12, 'active', '2026-06-07 09:12:23', '2026-06-07 09:12:23', NULL, 0),
(45, 8, 17, 'products/w8gDzBRraTRrgdrYOAyvHrzX74YzZuXYVB1Oz4JS.jpg', 0.00, '100 x 100 x 32cm', 12, 'active', '2026-06-07 09:16:26', '2026-06-07 09:16:26', NULL, 0),
(46, 3, 19, 'products/P44HF2T8935cH4pKgVgDF2Xv4SO1j6r2K0BmvT5k.webp', 0.00, '1m6 x 2m (có thể đặt theo yêu cầu)', 12, 'active', '2026-06-07 09:19:54', '2026-06-07 09:19:54', NULL, 0),
(47, 3, 19, 'products/2Z1hreGnCSdVvYhSV2SDzKPjI6goWbPOwhreGHr8.jpg', 0.00, '180 x 200cm', 12, 'active', '2026-06-07 09:23:51', '2026-06-07 09:23:51', NULL, 0),
(48, 4, 21, 'products/cJWI3nbWnXLiQueqlCjgRr56ZaQsC4prNWQK1YjL.jpg', 0.00, 'D3300-R600-C810', 12, 'active', '2026-06-07 09:28:09', '2026-06-07 09:28:09', NULL, 0),
(49, 5, 22, 'products/OXGuafQ3Odppx4j2L3cDgDRWMS28MB37YfhiQoFy.png', 0.00, '75 x 30 x 180cm', 12, 'active', '2026-06-07 09:32:23', '2026-06-07 09:32:23', NULL, 0),
(50, 5, 22, 'products/9Jxu81IzNmIP7UQuvwNZRmCEopa7za9HYNKFJRn5.jpg', 0.00, '140 x 120 x 75cm', 12, 'active', '2026-06-07 09:34:46', '2026-06-07 09:34:46', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('color','size','material','group') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product_id`, `name`, `type`, `status`, `created_at`, `updated_at`, `deleted_at`, `category_id`) VALUES
(1, NULL, 'Màu', 'color', 'active', '2025-06-29 02:48:55', '2025-06-29 04:14:24', '2025-07-02 21:12:02', 9),
(2, NULL, 'Kiểu dáng', 'material', 'active', '2025-06-29 02:49:27', '2025-06-29 06:41:42', '2025-07-02 20:47:56', 7),
(3, NULL, 'Kích cỡ', 'size', 'active', '2025-06-29 02:49:57', '2025-07-02 21:20:35', NULL, 7),
(4, NULL, 'Màu Sắc', 'color', 'active', '2025-06-29 03:11:20', '2025-07-22 03:51:13', NULL, 7),
(5, NULL, 'Loại chân ghế', 'material', 'active', '2025-06-29 06:25:08', '2025-06-29 06:40:50', '2025-07-02 20:47:05', 7),
(6, NULL, 'Chất liệu', 'material', 'active', '2025-06-29 06:25:48', '2025-07-03 06:43:11', NULL, 7),
(7, NULL, 'Màu', 'color', 'active', '2025-06-29 07:24:38', '2025-06-29 07:24:38', '2025-07-02 20:47:23', 10),
(8, NULL, 'ghế', 'color', 'active', '2025-07-02 12:18:28', '2025-07-02 12:18:28', '2025-07-02 20:47:20', 11),
(9, NULL, 'ghế', 'size', 'active', '2025-07-02 12:18:52', '2025-07-02 12:19:22', '2025-07-02 20:47:18', 11),
(10, NULL, 'ghế', 'material', 'active', '2025-07-02 12:19:44', '2025-07-02 12:19:44', '2025-07-02 20:47:16', 11),
(11, NULL, 'Chất liệu', 'material', 'active', '2025-07-22 03:49:19', '2025-07-22 03:49:19', NULL, 9),
(12, NULL, 'Màu', 'color', 'active', '2025-07-22 03:49:42', '2025-07-23 07:06:31', NULL, 9),
(13, NULL, 'Kích cỡ', 'size', 'active', '2025-07-22 03:53:03', '2025-07-22 03:53:03', NULL, 9),
(17, NULL, 'Chất liệu', 'group', 'active', '2026-06-07 09:09:20', '2026-06-07 09:09:20', NULL, 8),
(19, NULL, 'Chất liệu', 'group', 'active', '2026-06-07 09:17:12', '2026-06-07 09:17:12', NULL, 3),
(21, NULL, 'Chất liệu', 'group', 'active', '2026-06-07 09:24:48', '2026-06-07 09:24:48', NULL, 4),
(22, NULL, 'Chất liệu', 'group', 'active', '2026-06-07 09:29:14', '2026-06-07 09:29:14', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_option_values`
--

CREATE TABLE `product_option_values` (
  `id` bigint UNSIGNED NOT NULL,
  `product_option_id` bigint UNSIGNED NOT NULL,
  `type` enum('color','size','material') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_option_values`
--

INSERT INTO `product_option_values` (`id`, `product_option_id`, `type`, `value`, `color_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(91, 3, NULL, 'D2200 - R1050 - C680 mm', NULL, '2025-07-02 21:20:35', '2025-07-02 21:20:35', NULL),
(92, 3, NULL, 'D1800 - R840 - C800 mm', NULL, '2025-07-02 21:20:35', '2025-07-02 21:20:35', NULL),
(93, 3, NULL, 'D1600 - R800 - C800 mm', NULL, '2025-07-02 21:20:35', '2025-07-02 21:20:35', NULL),
(94, 3, NULL, 'D2240 - R950 - C780 mm', NULL, '2025-07-02 21:20:35', '2025-07-02 21:20:35', NULL),
(95, 3, NULL, 'D2400 - R900 - C850mm', NULL, '2025-07-02 21:20:35', '2025-07-02 21:20:35', NULL),
(96, 3, NULL, 'D2000 - R1000 - C720 mm', NULL, '2025-07-02 21:20:35', '2025-07-02 21:20:35', NULL),
(107, 6, NULL, 'Gỗ beech bọc vải', NULL, '2025-07-03 06:43:11', '2025-07-03 06:43:11', NULL),
(108, 6, NULL, 'Chân kim loại bọc da bò tự nhiên', NULL, '2025-07-03 06:43:11', '2025-07-03 06:43:11', NULL),
(109, 6, NULL, 'Khung gỗ - Bọc vải cao cấp', NULL, '2025-07-03 06:43:11', '2025-07-03 06:43:11', NULL),
(110, 6, NULL, 'Chân kim loại sơn đen, bọc vải cao cấp', NULL, '2025-07-03 06:43:11', '2025-07-03 06:43:11', NULL),
(111, 11, NULL, 'Chân kim loại, mặt ngồi nệm bọc vải cao cấp', NULL, '2025-07-22 03:49:19', '2025-07-22 03:49:19', NULL),
(112, 11, NULL, 'Mặt nhựa bọc da bò đã thuộc', NULL, '2025-07-22 03:49:19', '2025-07-22 03:49:19', NULL),
(113, 11, NULL, 'Gỗ Beech tự nhiên, mây công nghiệp, bọc vải', NULL, '2025-07-22 03:49:19', '2025-07-22 03:49:19', NULL),
(114, 11, NULL, 'Khung gỗ Ash - nệm bọc vải', NULL, '2025-07-22 03:49:19', '2025-07-22 03:49:19', NULL),
(121, 4, NULL, 'Đen', '#000000', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(122, 4, NULL, 'Đỏ', '#e31616', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(123, 4, NULL, 'Trắng', '#fdfcfc', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(124, 4, NULL, 'Xám', '#747273', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(125, 4, NULL, 'Xanh navy', '#042d58', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(126, 4, NULL, 'Kem', '#d4d5be', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(127, 4, NULL, 'Cam', '#e68428', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(128, 4, NULL, 'Hồng', '#ff3dae', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(129, 4, NULL, 'Vàng', '#e7ea48', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(130, 4, NULL, 'Tím', '#b82acb', '2025-07-22 03:51:13', '2025-07-22 03:51:13', NULL),
(136, 13, NULL, 'D900 - R850 - C720 mm', NULL, '2025-07-22 03:53:03', '2025-07-22 03:53:03', NULL),
(137, 13, NULL, 'D700 - R745 - C755 mm', NULL, '2025-07-22 03:53:03', '2025-07-22 03:53:03', NULL),
(138, 13, NULL, 'D510 - R850 - C790/420 mm', NULL, '2025-07-22 03:53:03', '2025-07-22 03:53:03', NULL),
(139, 13, NULL, 'D750- R670- C730 mm', NULL, '2025-07-22 03:53:03', '2025-07-22 03:53:03', NULL),
(140, 12, NULL, 'Red', '#db1a1a', '2025-07-23 07:06:31', '2025-07-23 07:06:31', NULL),
(141, 12, NULL, 'Black', '#000000', '2025-07-23 07:06:31', '2025-07-23 07:06:31', NULL),
(142, 12, NULL, 'Gray', '#6f6767', '2025-07-23 07:06:31', '2025-07-23 07:06:31', NULL),
(143, 12, NULL, 'Blue', '#045d1f', '2025-07-23 07:06:31', '2025-07-23 07:06:31', NULL),
(144, 12, NULL, 'Navy blue', '#062a7f', '2025-07-23 07:06:31', '2025-07-23 07:06:31', NULL),
(147, 17, 'color', 'z00', '#000000', '2026-06-07 09:09:20', '2026-06-07 09:09:20', NULL),
(148, 17, 'size', '8', NULL, '2026-06-07 09:09:20', '2026-06-07 09:09:20', NULL),
(149, 17, 'material', '9', NULL, '2026-06-07 09:09:20', '2026-06-07 09:09:20', NULL),
(152, 19, 'color', 'z00', '#000000', '2026-06-07 09:17:12', '2026-06-07 09:17:12', NULL),
(153, 19, 'size', '10', NULL, '2026-06-07 09:17:12', '2026-06-07 09:17:12', NULL),
(154, 19, 'material', '11', NULL, '2026-06-07 09:17:12', '2026-06-07 09:17:12', NULL),
(157, 21, 'color', 'z00', '#000000', '2026-06-07 09:24:48', '2026-06-07 09:24:48', NULL),
(158, 21, 'size', '14', NULL, '2026-06-07 09:24:48', '2026-06-07 09:24:48', NULL),
(159, 21, 'material', '15', NULL, '2026-06-07 09:24:48', '2026-06-07 09:24:48', NULL),
(160, 22, 'color', 'z01', '#000000', '2026-06-07 09:29:14', '2026-06-07 09:29:14', NULL),
(161, 22, 'size', '123', NULL, '2026-06-07 09:29:14', '2026-06-07 09:29:14', NULL),
(162, 22, 'material', '124', NULL, '2026-06-07 09:29:14', '2026-06-07 09:29:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `language_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `language_code`, `name`, `material`, `style`, `description`, `created_at`, `updated_at`) VALUES
(42, 42, 'vi', 'Ghế Sofa Góc Nỉ', 'Gỗ Beech bọc vải nhập khẩu cao cấp', 'Hiện đại', 'Sofa góc L nỉ SF70.Đặc điểm nhận diện: ghế sofa góc chữ L, chất liệu nỉ/vải, màu ghi phối trắng, có đôn dài nằm bên phải, kiểu hiện đại phòng khách', '2026-06-07 08:45:12', '2026-06-07 08:45:12'),
(43, 43, 'vi', 'Ghế Sofa Văng Nỉ', 'Gỗ Beech bọc vải nhập khẩu cao cấp', 'Hiện đại', 'Mẫu sofa văng màu ghi xám được thiết kế theo phong cách hiện đại, đơn giản nhưng rất tinh tế, phù hợp với nhiều không gian phòng khách, căn hộ chung cư, studio hoặc phòng làm việc', '2026-06-07 08:48:18', '2026-06-07 08:48:18'),
(44, 44, 'vi', 'Bàn trà hiện đại', 'White', 'Hiện đại', 'Bàn trà sofa phòng khách hiện đại BSFDK22 với thiết kế hiện đại, sang trọng giúp dễ dàng décor được với nhiều loại không gian khác nhau.', '2026-06-07 09:12:23', '2026-06-07 09:12:23'),
(45, 45, 'vi', 'Bàn đá', 'Đá', 'Hiện đại', 'Trong không gian phòng khách hiện đại, bàn trà không chỉ đơn thuần là nơi để đặt ly trà, quyển sách hay những vật dụng nhỏ nhắn, mà nó còn là một phần quan trọng trong việc thể hiện phong cách, gu thẩm mỹ của gia chủ. Một chiếc bàn trà phòng khách mặt đá hiện đại không chỉ góp phần tôn lên vẻ đẹp của phòng khách mà còn mang đến sự tiện nghi và đẳng cấp cho không gian sống của bạn', '2026-06-07 09:16:26', '2026-06-07 09:16:26'),
(46, 46, 'vi', 'Giường Ngủ Bọc Da', 'Khung gỗ tự nhiên, bọc da cao cấp', 'Hiện đại', 'Mẫu giường ngủ bọc da hiện đại mang phong cách tối giản, phù hợp với những không gian phòng ngủ sang trọng và tinh tế. Thiết kế đầu giường cao, bọc đệm êm ái giúp tạo cảm giác thoải mái khi tựa lưng đọc sách, xem điện thoại hoặc nghỉ ngơi', '2026-06-07 09:19:54', '2026-06-07 09:19:54'),
(47, 47, 'vi', 'Giường Gỗ Công Nghiệp', 'Gỗ công nghiệp MDF/MFC phủ Melamine vân gỗ', 'Hiện đại', 'Việc sở hữu mẫu giường ngủ gỗ công nghiệp trong thế giới nội thất hiện nay đã trở nên phổ biến. Khi mà gỗ công nghiệp với bảng màu đa dạng, thiết kế đơn giản, thanh lịch, phù hợp với cuộc sống hiện đại. Anh chị cùng chiêm ngưỡng thiết kế giường ngủ gỗ công nghiệp cực đẹp và hiện đại LG-GN274 nhé', '2026-06-07 09:23:51', '2026-06-07 09:23:51'),
(48, 48, 'vi', 'Tủ Bếp Hiện Đại', '100% gỗ công nghiệp cao cấp', 'Hiện đại', 'Tủ bếp được thiết kế theo phong cách hiện đại, có ưu điểm là tận dụng tối đa không gian, không nhiều chi tiết thừa và tối ưu hoá chi phí đầu tư', '2026-06-07 09:28:09', '2026-06-07 09:28:09'),
(49, 49, 'vi', 'Tủ Kệ Sách', 'gỗ công nghiệp MDF dày 17mm 2 mặt phủ melamine chống trầy chống ẩm.', 'Hiện đại', 'TKS-09 mẫu tủ kệ sách, tủ tài liệu lựa chọn thích hợp cho văn phòng, phòng làm việc tại nhà. Thiết kế tủ gỗ chắc chắn, nhiều ngăn tủ lưu trữ tài liệu. Đây sẽ là lựa chọn thích hợp cho những người dùng có nhiều tài liệu, sách, đồ dùng hoặc TKS-09 vẫn là một mẫu tủ kệ sách trang trí phòng làm việc của bạn thêm tiện nghi hơn', '2026-06-07 09:32:23', '2026-06-07 09:32:23'),
(50, 50, 'vi', 'Bàn Làm Việc', 'Gỗ công nghiệp MDF/MFC phủ Melamine vân gỗ', 'Hiện đại', 'Chỉ cạnh dán chắc chắn, khung kệ vững như núi, đảm bảo chắc chắn, dù bạn có để cả chục cuốn sách lên đó.', '2026-06-07 09:34:46', '2026-06-07 09:34:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `composite_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dimensions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `composite_key`, `name`, `sku`, `variant_name`, `price`, `stock_quantity`, `weight`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`, `color`, `material`, `size`, `dimensions`) VALUES
(53, 42, NULL, 'Variant 1', 'SKU-1780847104895-0', 'Variant 1', 15000000.00, 4, 500.00, 'variant_images/eLaMpxHb5AF80LzgHZqJ5XSK5O0iCIMjkIbuUTZY.jpg', 'active', '2026-06-07 08:45:12', '2026-06-07 20:04:24', NULL, NULL, NULL, NULL, NULL),
(54, 43, NULL, 'Variant 1', 'SKU-1780847294308-0', 'Variant 1', 16000000.00, 4, 550.00, 'variant_images/HP4eTJEVMWfZCQ9PLi4x8Y5q3yd0LWfiVQAZIEng.jpg', 'active', '2026-06-07 08:48:18', '2026-06-07 08:48:18', NULL, NULL, NULL, NULL, NULL),
(55, 44, NULL, 'z00 - 9 - 8', 'SKU-1780848738201-0', 'z00 - 9 - 8', 14000000.00, 2, 300.00, 'variant_images/sxE1dReA33P2F4VOH9oUBm6UeQomYabbgxTy5w8S.jpg', 'active', '2026-06-07 09:12:23', '2026-06-07 20:05:05', NULL, 'z00', '9', '8', NULL),
(56, 45, NULL, 'z00 - 9 - 8', 'SKU-1780848979856-0', 'z00 - 9 - 8', 7900000.00, 3, 400.00, 'variant_images/7zntJpCTrcG0CD9Plyz3QFtesgTNJt1vvGXtNgkQ.jpg', 'active', '2026-06-07 09:16:26', '2026-06-07 09:16:26', NULL, 'z00', '9', '8', NULL),
(57, 46, NULL, 'z00 - 11 - 10', 'SKU-1780849187821-0', 'z00 - 11 - 10', 10000000.00, 6, 200.00, 'variant_images/SgzK2FDIwjCsom8D1eR9Om5mPJ9GS9U9aMxQDGVT.webp', 'active', '2026-06-07 09:19:54', '2026-06-07 09:19:54', NULL, 'z00', '11', '10', NULL),
(58, 47, NULL, 'z00 - 11 - 10', 'SKU-1780849424795-0', 'z00 - 11 - 10', 7500000.00, 8, 180.00, 'variant_images/ZKg7Zck61jtBhfXIzPU05E1zC9eXB8yaRuUK4Ngn.jpg', 'active', '2026-06-07 09:23:51', '2026-06-07 09:23:51', NULL, 'z00', '11', '10', NULL),
(59, 48, NULL, 'z00 - 15 - 14', 'SKU-1780849674401-0', 'z00 - 15 - 14', 4500000.00, 4, 150.00, 'variant_images/Ehr8RaSn0X7s3ZURJO3V5VFNFEhUy5XSg3uSTbEO.jpg', 'active', '2026-06-07 09:28:09', '2026-06-07 20:20:17', NULL, 'z00', '15', '14', NULL),
(60, 49, NULL, 'z01 - 124 - 123', 'SKU-1780849907281-0', 'z01 - 124 - 123', 3000000.00, 2, 103.00, 'variant_images/KxC7GdqPjpXbck9sPW7Ovfwpb2IW26cDGstiBPlM.png', 'active', '2026-06-07 09:32:23', '2026-06-07 20:07:01', NULL, 'z01', '124', '123', NULL),
(61, 50, NULL, 'z01 - 124 - 123', 'SKU-1780850080379-0', 'z01 - 124 - 123', 2000000.00, 4, 60.00, 'variant_images/44b9PfqnkqsdcsWYNUEPo5V5ybC1NAMgeGeLcHNu.jpg', 'active', '2026-06-07 09:34:46', '2026-06-07 20:07:47', NULL, 'z01', '124', '123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_option_values`
--

CREATE TABLE `product_variant_option_values` (
  `id` bigint UNSIGNED NOT NULL,
  `product_variant_id` bigint UNSIGNED NOT NULL,
  `product_option_id` bigint UNSIGNED NOT NULL,
  `product_option_value_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_item_id` bigint UNSIGNED NOT NULL,
  `rating` tinyint NOT NULL COMMENT '1-5',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `order_item_id`, `rating`, `comment`, `is_visible`, `created_at`, `updated_at`) VALUES
(5, 18, 225, 5, 'sản phầm đẹp', 1, '2026-06-07 22:53:24', '2026-06-07 22:53:24'),
(6, 18, 224, 5, 'sản phầm đúng như hình rất phù hợp', 1, '2026-06-07 22:54:29', '2026-06-07 22:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_statistics`
--

CREATE TABLE `sales_statistics` (
  `id` bigint UNSIGNED NOT NULL,
  `period_type` enum('daily','monthly','yearly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `total_orders` int NOT NULL,
  `total_revenue` decimal(15,2) NOT NULL,
  `total_products_sold` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('q5k3lacB52FAxfEAAZi6pJe0J9jdcrYYjyl5Un5S', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWUFjVFhFMDZKQ29lZzNpcmNGQTlJUXN3TkViaXNrN3VTWkFFOFRxUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hdXRoL29yZGVycyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE0O30=', 1780900069),
('y3ruX1ZDaDKO2XShNa7ErUjgBnWmh4UbZD0KOFBO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1B1YkVaNklkRklta09KcWNUY01QM3pTa0dMQzhFTEFuRW5xV2tLaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jbGllbnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1780893618);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_verified`, `password`, `otp`, `otp_expires_at`, `phone`, `role_id`, `status`, `created_at`, `updated_at`, `deleted_at`, `remember_token`, `province`, `district`, `avatar`) VALUES
(14, 'Dũng', 'dungnguyen05chtb@gmail.com', NULL, 1, '$2y$12$jlkpTivZA063OB5LbKoZRueU6/AEED99q.LVIM6ABMuYQspc//8sS', NULL, NULL, '0396712324', 1, 'active', '2026-06-02 08:40:58', '2026-06-02 08:41:17', NULL, NULL, NULL, NULL, NULL),
(16, 'dũng', 'nguyenvankhoa22052005@gmail.com', NULL, 1, '$2y$12$Yi7/Bp7tPpqh3KugPcGZquzQXImoa29zHHfjYYSDB8B41yBZWurK6', NULL, NULL, '1234534234', 2, 'active', '2026-06-02 09:36:54', '2026-06-04 18:02:52', NULL, NULL, NULL, NULL, 'avatars/SEybut3j1kXt2Qi91uOlR0UrLEyKi1Qy6AuASv9T.png'),
(17, 'Quốc', 'quochu9425@gmail.com', NULL, 0, '$2y$12$MUkQiPonDprCwNkyZst0dOtut/FU1F8mrg/64EvoPRAktYyaNwpP.', '693727', '2026-06-02 19:22:04', '0349280459', 2, 'active', '2026-06-02 19:12:04', '2026-06-02 19:12:04', NULL, NULL, NULL, NULL, NULL),
(18, 'Quốc', 'chuquocgi9425@gmail.com', NULL, 1, '$2y$12$adv6x1CpdLc79Kwkvwuwb.fS04OdInEwR7oH9Q.xKu4W4E.tGLvpS', NULL, NULL, '0312456896', 2, 'active', '2026-06-07 08:27:57', '2026-06-07 08:28:15', NULL, 'Ipl5wvPkJA9VEXmggzx0N9fzzaDhNYAWIRq1GR1WShdGBe7FvNaoBAeHubvW', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_coupons`
--

CREATE TABLE `user_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variant_option_values`
--

CREATE TABLE `variant_option_values` (
  `variant_id` bigint UNSIGNED NOT NULL,
  `product_option_value_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(19, 18, 43, '2026-06-07 20:03:39', '2026-06-07 20:03:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_language_code_unique` (`category_id`,`language_code`),
  ADD KEY `category_translations_language_code_foreign` (`language_code`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`),
  ADD KEY `images_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_booking_code_unique` (`booking_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`),
  ADD KEY `orders_discount_id_foreign` (`discount_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `order_status_logs`
--
ALTER TABLE `order_status_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_status_logs_order_id_foreign` (`order_id`),
  ADD KEY `order_status_logs_changed_by_foreign` (`changed_by`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_options_product_id_foreign` (`product_id`),
  ADD KEY `product_options_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_option_values`
--
ALTER TABLE `product_option_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_option_values_product_option_id_foreign` (`product_option_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_translations_product_id_language_code_unique` (`product_id`,`language_code`),
  ADD KEY `product_translations_language_code_foreign` (`language_code`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`),
  ADD UNIQUE KEY `product_variants_composite_key_unique` (`composite_key`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_option_values`
--
ALTER TABLE `product_variant_option_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_option_unique` (`product_variant_id`,`product_option_id`),
  ADD KEY `product_variant_option_values_product_option_id_foreign` (`product_option_id`),
  ADD KEY `product_variant_option_values_product_option_value_id_foreign` (`product_option_value_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_user_id_order_item_id_unique` (`user_id`,`order_item_id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sales_statistics`
--
ALTER TABLE `sales_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_coupons_user_id_coupon_id_unique` (`user_id`,`coupon_id`),
  ADD KEY `user_coupons_coupon_id_foreign` (`coupon_id`),
  ADD KEY `user_coupons_order_id_foreign` (`order_id`);

--
-- Indexes for table `variant_option_values`
--
ALTER TABLE `variant_option_values`
  ADD PRIMARY KEY (`variant_id`,`product_option_value_id`),
  ADD KEY `variant_option_values_product_option_value_id_foreign` (`product_option_value_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `order_status_logs`
--
ALTER TABLE `order_status_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_option_values`
--
ALTER TABLE `product_option_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `product_variant_option_values`
--
ALTER TABLE `product_variant_option_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_statistics`
--
ALTER TABLE `sales_statistics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_coupons`
--
ALTER TABLE `user_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_language_code_foreign` FOREIGN KEY (`language_code`) REFERENCES `languages` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `images_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_status_logs`
--
ALTER TABLE `order_status_logs`
  ADD CONSTRAINT `order_status_logs_changed_by_foreign` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_status_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_option_values`
--
ALTER TABLE `product_option_values`
  ADD CONSTRAINT `product_option_values_product_option_id_foreign` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_language_code_foreign` FOREIGN KEY (`language_code`) REFERENCES `languages` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_option_values`
--
ALTER TABLE `product_variant_option_values`
  ADD CONSTRAINT `product_variant_option_values_product_option_id_foreign` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_option_values_product_option_value_id_foreign` FOREIGN KEY (`product_option_value_id`) REFERENCES `product_option_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_option_values_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD CONSTRAINT `user_coupons_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_coupons_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variant_option_values`
--
ALTER TABLE `variant_option_values`
  ADD CONSTRAINT `variant_option_values_product_option_value_id_foreign` FOREIGN KEY (`product_option_value_id`) REFERENCES `product_option_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variant_option_values_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
