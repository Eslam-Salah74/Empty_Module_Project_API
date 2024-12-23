-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 08:50 AM
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
-- Database: `master_travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `activity_code` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `name`, `activity_code`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"TICKETING\",\"ar\":\"\\u0627\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\"}', '1', 1, NULL, '2024-06-05 04:51:25', '2024-06-05 04:51:44'),
(2, '{\"en\":\"TOURISM\",\"ar\":\"\\u0627\\u0644\\u0633\\u064a\\u0627\\u062d\\u0629\"}', '2', 1, NULL, '2024-06-05 04:52:24', '2024-06-05 04:52:24'),
(3, '{\"en\":\"AUMRA TICKETING\",\"ar\":\"\\u0637\\u064a\\u0631\\u0627\\u0646 \\u0639\\u0645\\u0631\\u0629\"}', '3', 1, NULL, '2024-06-05 04:53:35', '2024-06-05 04:53:35'),
(4, '{\"en\":\"VISA\",\"ar\":\"\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\"}', '4', 1, NULL, '2024-06-05 04:54:18', '2024-06-05 04:54:18'),
(5, '{\"en\":\"GENERAL EXENSES\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0639\\u0645\\u0648\\u0645\\u064a\\u0647\"}', '5', 1, NULL, '2024-06-05 04:55:14', '2024-06-05 04:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'role', 'created on role', 'Modules\\MasterData\\RoleAndPermission\\App\\Models\\Role', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"Super Admin\",\"guard_name\":\"sanctum\",\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(2, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"\\u0645\\u0635\\u0631\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(3, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"status\":1,\"country_id\":1,\"deleted_at\":null,\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(4, 'area', 'created on area', 'Modules\\MasterData\\Area\\App\\Models\\Area', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"\\u0645\\u0635\\u0631 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629\",\"status\":1,\"city_id\":1,\"deleted_at\":null,\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(5, 'branch', 'created on branch', 'Modules\\MasterData\\Branch\\App\\Models\\Branch', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"\\u0627\\u0644\\u0645\\u0631\\u0643\\u0632 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\",\"branch_code\":\"01\",\"status\":1,\"email\":\"tsmv_admin@mv-is.com\",\"mobile\":\"01111111111\",\"user_name\":null,\"user_email\":null,\"user_mobile\":null,\"area_id\":1,\"branchable_id\":null,\"branchable_type\":null,\"deleted_at\":null,\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(6, 'department', 'created on department', 'Modules\\MasterData\\Department\\App\\Models\\Department', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"\\u0627\\u062f\\u0645\\u0646\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(7, 'user', 'created on user', 'App\\Models\\User', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"Super Admin\",\"email\":\"tsmv_admin@mv-is.com\",\"email_verified_at\":null,\"password\":\"$2y$12$yCpGil\\/qyPHTMYQmPna2j.VLq6Z73TGm5\\/ZqDiopE7bFr8tg0PwES\",\"status\":1,\"remember_token\":null,\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\",\"deleted_at\":null}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(8, 'employee', 'created on employee', 'Modules\\MasterData\\Employees\\App\\Models\\Employee', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"department_id\":1,\"branch_id\":1,\"branches_accessibility\":0,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-05-30T15:00:31.000000Z\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(9, 'chart_class', 'created on chart_class', 'Modules\\Accounting\\ChartClass\\App\\Models\\ChartClass', 1, 'created', NULL, NULL, '{\"attributes\":{\"id\":1,\"name\":\"\\u0623\\u0635\\u0648\\u0644\",\"status\":1,\"type\":\"debit\",\"deleted_at\":null,\"created_at\":\"2024-05-30T15:25:55.000000Z\",\"updated_at\":\"2024-05-30T15:25:55.000000Z\"}}', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(10, 'chart_class', 'created on chart_class', 'Modules\\Accounting\\ChartClass\\App\\Models\\ChartClass', 2, 'created', NULL, NULL, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645\\u0627\\u062a\",\"status\":1,\"type\":\"credit\",\"deleted_at\":null,\"created_at\":\"2024-05-30T15:25:55.000000Z\",\"updated_at\":\"2024-05-30T15:25:55.000000Z\"}}', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(11, 'chart_class', 'created on chart_class', 'Modules\\Accounting\\ChartClass\\App\\Models\\ChartClass', 3, 'created', NULL, NULL, '{\"attributes\":{\"id\":3,\"name\":\"\\u0627\\u0644\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a\",\"status\":1,\"type\":\"debit\",\"deleted_at\":null,\"created_at\":\"2024-05-30T15:25:55.000000Z\",\"updated_at\":\"2024-05-30T15:25:55.000000Z\"}}', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(12, 'chart_class', 'created on chart_class', 'Modules\\Accounting\\ChartClass\\App\\Models\\ChartClass', 4, 'created', NULL, NULL, '{\"attributes\":{\"id\":4,\"name\":\"\\u0627\\u0644\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a\",\"status\":1,\"type\":\"credit\",\"deleted_at\":null,\"created_at\":\"2024-05-30T15:25:55.000000Z\",\"updated_at\":\"2024-05-30T15:25:55.000000Z\"}}', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(13, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u0627\\u0644\\u0627\\u0635\\u0648\\u0644 \\u0627\\u0644\\u062b\\u0627\\u0628\\u062a\\u0647\",\"code\":\"1\",\"status\":1,\"class_id\":1,\"parent_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:20:52.000000Z\",\"updated_at\":\"2024-06-01T09:20:52.000000Z\"}}', NULL, '2024-06-01 06:20:52', '2024-06-01 06:20:52'),
(14, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u0623\\u062b\\u0627\\u062b \\u0648\\u0645\\u0633\\u062a\\u0644\\u0632\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0643\\u0627\\u062a\\u0628\",\"code\":\"11\",\"status\":0,\"class_id\":1,\"parent_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:26:08.000000Z\",\"updated_at\":\"2024-06-01T09:26:08.000000Z\"}}', NULL, '2024-06-01 06:26:08', '2024-06-01 06:26:08'),
(15, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:26:19.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:26:08.000000Z\"}}', NULL, '2024-06-01 06:26:19', '2024-06-01 06:26:19'),
(16, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0622\\u0644\\u0627\\u062a\",\"code\":\"12\",\"status\":1,\"class_id\":1,\"parent_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:29:52.000000Z\",\"updated_at\":\"2024-06-01T09:29:52.000000Z\"}}', NULL, '2024-06-01 06:29:52', '2024-06-01 06:29:52'),
(17, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u0627\\u0644\\u0627\\u062a \\u062d\\u0627\\u0633\\u0628\\u0647\",\"status\":0,\"code\":\"121\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:30:45.000000Z\",\"updated_at\":\"2024-06-01T09:30:45.000000Z\"}}', NULL, '2024-06-01 06:30:45', '2024-06-01 06:30:45'),
(18, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u0627\\u062c\\u0647\\u0632\\u0629 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\\u0647\",\"status\":0,\"code\":\"122\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:31:29.000000Z\",\"updated_at\":\"2024-06-01T09:31:29.000000Z\"}}', NULL, '2024-06-01 06:31:29', '2024-06-01 06:31:29'),
(19, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0645\\u0627\\u0643\\u0628\\u0646\\u0627\\u062a \\u0627\\u0644\\u062a\\u0635\\u0648\\u064a\\u0631\",\"status\":0,\"code\":\"123\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:32:12.000000Z\",\"updated_at\":\"2024-06-01T09:32:12.000000Z\"}}', NULL, '2024-06-01 06:32:12', '2024-06-01 06:32:12'),
(20, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:32:22.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:32:12.000000Z\"}}', NULL, '2024-06-01 06:32:22', '2024-06-01 06:32:22'),
(21, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:32:29.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:31:29.000000Z\"}}', NULL, '2024-06-01 06:32:29', '2024-06-01 06:32:29'),
(22, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:32:35.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:30:45.000000Z\"}}', NULL, '2024-06-01 06:32:35', '2024-06-01 06:32:35'),
(23, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u0643\\u0645\\u0628\\u064a\\u0648\\u062a\\u0631\\u0627\\u062a\",\"status\":1,\"code\":\"124\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:33:06.000000Z\",\"updated_at\":\"2024-06-01T09:33:06.000000Z\"}}', NULL, '2024-06-01 06:33:06', '2024-06-01 06:33:06'),
(24, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u062a\\u0644\\u064a\\u0641\\u0648\\u0646\\u0627\\u062a\",\"status\":0,\"code\":\"125\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:33:36.000000Z\",\"updated_at\":\"2024-06-01T09:33:36.000000Z\"}}', NULL, '2024-06-01 06:33:36', '2024-06-01 06:33:36'),
(25, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:33:44.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:33:36.000000Z\"}}', NULL, '2024-06-01 06:33:44', '2024-06-01 06:33:44'),
(26, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"\\u0643\\u0627\\u0645\\u064a\\u0631\\u0627\\u062a \\u0645\\u0631\\u0627\\u0642\\u0628\\u0647\",\"status\":1,\"code\":\"126\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:34:10.000000Z\",\"updated_at\":\"2024-06-01T09:34:10.000000Z\"}}', NULL, '2024-06-01 06:34:10', '2024-06-01 06:34:10'),
(27, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"\\u0627\\u0644\\u062e\\u0632\\u0646\\u0647\",\"status\":0,\"code\":\"127\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:34:42.000000Z\",\"updated_at\":\"2024-06-01T09:34:42.000000Z\"}}', NULL, '2024-06-01 06:34:42', '2024-06-01 06:34:42'),
(28, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:34:51.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:34:42.000000Z\"}}', NULL, '2024-06-01 06:34:51', '2024-06-01 06:34:51'),
(29, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"name\":\"\\u0634\\u0628\\u0643\\u0647 \\u0627\\u0644\\u0646\\u062a\",\"status\":1,\"code\":\"128\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:35:20.000000Z\",\"updated_at\":\"2024-06-01T09:35:20.000000Z\"}}', NULL, '2024-06-01 06:35:20', '2024-06-01 06:35:20'),
(30, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"name\":\"\\u0645\\u0627\\u0643\\u064a\\u0646\\u0647 \\u0639\\u062f \\u0627\\u0644\\u0646\\u0642\\u062f\\u064a\\u0647\",\"status\":1,\"code\":\"129\",\"type_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:35:58.000000Z\",\"updated_at\":\"2024-06-01T09:35:58.000000Z\"}}', NULL, '2024-06-01 06:35:58', '2024-06-01 06:35:58'),
(31, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u0628\\u0631\\u0627\\u0645\\u062c \\u0627\\u0644\\u0643\\u0645\\u0628\\u064a\\u0648\\u062a\\u0631\",\"code\":\"113\",\"status\":1,\"class_id\":1,\"parent_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:37:16.000000Z\",\"updated_at\":\"2024-06-01T09:37:16.000000Z\"}}', NULL, '2024-06-01 06:37:16', '2024-06-01 06:37:16'),
(32, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"13\",\"updated_at\":\"2024-06-01T09:37:59.000000Z\"},\"old\":{\"code\":\"113\",\"updated_at\":\"2024-06-01T09:37:16.000000Z\"}}', NULL, '2024-06-01 06:37:59', '2024-06-01 06:37:59'),
(33, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"name\":\"\\u0628\\u0631\\u0627\\u0645\\u062c \\u0627\\u0644\\u0643\\u0645\\u0628\\u064a\\u0648\\u062a\\u0631\",\"status\":0,\"code\":\"131\",\"type_id\":4,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:38:42.000000Z\",\"updated_at\":\"2024-06-01T09:38:42.000000Z\"}}', NULL, '2024-06-01 06:38:42', '2024-06-01 06:38:42'),
(34, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:38:51.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:38:42.000000Z\"}}', NULL, '2024-06-01 06:38:51', '2024-06-01 06:38:51'),
(35, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u0627\\u0644\\u0631\\u062e\\u0635\\u0647\",\"code\":\"14\",\"status\":0,\"class_id\":1,\"parent_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:39:58.000000Z\",\"updated_at\":\"2024-06-01T09:39:58.000000Z\"}}', NULL, '2024-06-01 06:39:58', '2024-06-01 06:39:58'),
(36, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:40:07.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:39:58.000000Z\"}}', NULL, '2024-06-01 06:40:07', '2024-06-01 06:40:07'),
(37, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":11,\"name\":\"\\u0627\\u0644\\u0631\\u062e\\u0635\\u0647\",\"status\":1,\"code\":\"141\",\"type_id\":5,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:40:34.000000Z\",\"updated_at\":\"2024-06-01T09:40:34.000000Z\"}}', NULL, '2024-06-01 06:40:34', '2024-06-01 06:40:34'),
(38, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"\\u0627\\u0644\\u0627\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0645\\u062a\\u062f\\u0627\\u0648\\u0644\\u0647\",\"code\":\"2\",\"status\":1,\"class_id\":1,\"parent_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:43:34.000000Z\",\"updated_at\":\"2024-06-01T09:43:34.000000Z\"}}', NULL, '2024-06-01 06:43:34', '2024-06-01 06:43:34'),
(39, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"\\u0627\\u0644\\u0646\\u0642\\u062f\\u064a\\u0647\",\"code\":\"21\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:44:19.000000Z\",\"updated_at\":\"2024-06-01T09:44:19.000000Z\"}}', NULL, '2024-06-01 06:44:19', '2024-06-01 06:44:19'),
(40, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":12,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649\",\"status\":1,\"code\":\"211\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:46:51.000000Z\",\"updated_at\":\"2024-06-01T09:46:51.000000Z\"}}', NULL, '2024-06-01 06:46:51', '2024-06-01 06:46:51'),
(41, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":13,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0627\\u0631\",\"status\":1,\"code\":\"212\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:47:25.000000Z\",\"updated_at\":\"2024-06-01T09:47:25.000000Z\"}}', NULL, '2024-06-01 06:47:25', '2024-06-01 06:47:25'),
(42, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0627\\u0631 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"updated_at\":\"2024-06-01T09:47:41.000000Z\"},\"old\":{\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0627\\u0631\",\"updated_at\":\"2024-06-01T09:47:25.000000Z\"}}', NULL, '2024-06-01 06:47:41', '2024-06-01 06:47:41'),
(43, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"updated_at\":\"2024-06-01T09:47:56.000000Z\"},\"old\":{\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649\",\"updated_at\":\"2024-06-01T09:46:51.000000Z\"}}', NULL, '2024-06-01 06:47:56', '2024-06-01 06:47:56'),
(44, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":14,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u064a\\u0648\\u0631\\u0648 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"213\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:48:47.000000Z\",\"updated_at\":\"2024-06-01T09:48:47.000000Z\"}}', NULL, '2024-06-01 06:48:47', '2024-06-01 06:48:47'),
(45, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 15, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":15,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0627\\u0633\\u062a\\u0631\\u0644\\u064a\\u0646\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"214\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:49:35.000000Z\",\"updated_at\":\"2024-06-01T09:49:35.000000Z\"}}', NULL, '2024-06-01 06:49:35', '2024-06-01 06:49:35'),
(46, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 16, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":16,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"215\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:50:22.000000Z\",\"updated_at\":\"2024-06-01T09:50:22.000000Z\"}}', NULL, '2024-06-01 06:50:22', '2024-06-01 06:50:22'),
(47, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 17, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":17,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"status\":1,\"code\":\"216\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:51:27.000000Z\",\"updated_at\":\"2024-06-01T09:51:27.000000Z\"}}', NULL, '2024-06-01 06:51:27', '2024-06-01 06:51:27'),
(48, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 18, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":18,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0629 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"status\":1,\"code\":\"217\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:52:02.000000Z\",\"updated_at\":\"2024-06-01T09:52:02.000000Z\"}}', NULL, '2024-06-01 06:52:02', '2024-06-01 06:52:02'),
(49, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0648\\u0643\",\"code\":\"212\",\"status\":0,\"class_id\":1,\"parent_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-01T09:52:54.000000Z\",\"updated_at\":\"2024-06-01T09:52:54.000000Z\"}}', NULL, '2024-06-01 06:52:54', '2024-06-01 06:52:54'),
(50, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T09:58:37.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T09:52:54.000000Z\"}}', NULL, '2024-06-01 06:58:37', '2024-06-01 06:58:37'),
(51, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"name\":\"\\u0628\\u0646\\u0648\\u0643\",\"code\":\"22\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:02:41.000000Z\",\"updated_at\":\"2024-06-01T10:02:41.000000Z\"}}', NULL, '2024-06-01 07:02:41', '2024-06-01 07:02:41'),
(52, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":0,\"updated_at\":\"2024-06-01T10:03:24.000000Z\"},\"old\":{\"status\":1,\"updated_at\":\"2024-06-01T09:58:37.000000Z\"}}', NULL, '2024-06-01 07:03:24', '2024-06-01 07:03:24'),
(53, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 19, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":19,\"name\":\"\\u0628\\u0646\\u0643 \\u0627\\u0644\\u062a\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0649 \\u0645\\u0635\\u0631\\u0649\",\"status\":1,\"code\":\"221\",\"type_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:04:58.000000Z\",\"updated_at\":\"2024-06-01T10:04:58.000000Z\"}}', NULL, '2024-06-01 07:04:58', '2024-06-01 07:04:58'),
(54, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 20, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":20,\"name\":\"\\u0628\\u0646\\u0643 \\u0627\\u0644\\u062a\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0649 \\u062f\\u0648\\u0644\\u0627\\u0631\",\"status\":1,\"code\":\"222\",\"type_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:05:32.000000Z\",\"updated_at\":\"2024-06-01T10:05:32.000000Z\"}}', NULL, '2024-06-01 07:05:32', '2024-06-01 07:05:32'),
(55, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 21, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":21,\"name\":\"\\u0628\\u0646\\u0643 \\u0627\\u0644\\u062a\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0649 \\u0631\\u064a\\u0627\\u0644\",\"status\":1,\"code\":\"223\",\"type_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:06:09.000000Z\",\"updated_at\":\"2024-06-01T10:06:09.000000Z\"}}', NULL, '2024-06-01 07:06:09', '2024-06-01 07:06:09'),
(56, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 22, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":22,\"name\":\"\\u0628\\u0646\\u0643 \\u0645\\u0635\\u0631 \\u0645\\u0635\\u0631\\u0649\",\"status\":1,\"code\":\"224\",\"type_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:07:02.000000Z\",\"updated_at\":\"2024-06-01T10:07:02.000000Z\"}}', NULL, '2024-06-01 07:07:02', '2024-06-01 07:07:02'),
(57, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 23, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":23,\"name\":\"\\u0628\\u0646\\u0643 \\u0645\\u0635\\u0631 \\u062f\\u0648\\u0644\\u0627\\u0631\",\"status\":1,\"code\":\"225\",\"type_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:07:25.000000Z\",\"updated_at\":\"2024-06-01T10:07:25.000000Z\"}}', NULL, '2024-06-01 07:07:25', '2024-06-01 07:07:25'),
(58, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 24, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":24,\"name\":\"\\u0628\\u0646\\u0643 \\u0645\\u0635\\u0631 \\u0631\\u064a\\u0627\\u0644\",\"status\":1,\"code\":\"226\",\"type_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:07:49.000000Z\",\"updated_at\":\"2024-06-01T10:07:49.000000Z\"}}', NULL, '2024-06-01 07:07:49', '2024-06-01 07:07:49'),
(59, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"name\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644\",\"code\":\"223\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:31:41.000000Z\",\"updated_at\":\"2024-06-01T10:31:41.000000Z\"}}', NULL, '2024-06-01 07:31:41', '2024-06-01 07:31:41'),
(60, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"23\",\"updated_at\":\"2024-06-01T10:31:55.000000Z\"},\"old\":{\"code\":\"223\",\"updated_at\":\"2024-06-01T10:31:41.000000Z\"}}', NULL, '2024-06-01 07:31:55', '2024-06-01 07:31:55'),
(61, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 25, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":25,\"name\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 \\u0645\\u0635\\u0631\\u0649\",\"status\":1,\"code\":\"231\",\"type_id\":10,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:33:29.000000Z\",\"updated_at\":\"2024-06-01T10:33:29.000000Z\"}}', NULL, '2024-06-01 07:33:29', '2024-06-01 07:33:29'),
(62, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 26, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":26,\"name\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 - \\u062f\\u0648\\u0644\\u0627\\u0631\",\"status\":1,\"code\":\"232\",\"type_id\":10,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:34:04.000000Z\",\"updated_at\":\"2024-06-01T10:34:04.000000Z\"}}', NULL, '2024-06-01 07:34:04', '2024-06-01 07:34:04'),
(63, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 27, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":27,\"name\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 - \\u064a\\u0648\\u0631\\u0648\",\"status\":0,\"code\":\"233\",\"type_id\":10,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:34:33.000000Z\",\"updated_at\":\"2024-06-01T10:34:33.000000Z\"}}', NULL, '2024-06-01 07:34:33', '2024-06-01 07:34:33'),
(64, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T10:34:40.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T10:34:33.000000Z\"}}', NULL, '2024-06-01 07:34:40', '2024-06-01 07:34:40'),
(65, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 28, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":28,\"name\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 - \\u0631\\u064a\\u0627\\u0644\",\"status\":0,\"code\":\"234\",\"type_id\":10,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:35:09.000000Z\",\"updated_at\":\"2024-06-01T10:35:09.000000Z\"}}', NULL, '2024-06-01 07:35:10', '2024-06-01 07:35:10'),
(66, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 28, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T10:35:16.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T10:35:09.000000Z\"}}', NULL, '2024-06-01 07:35:16', '2024-06-01 07:35:16'),
(67, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":11,\"name\":\"\\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\",\"code\":\"24\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:36:59.000000Z\",\"updated_at\":\"2024-06-01T10:36:59.000000Z\"}}', NULL, '2024-06-01 07:36:59', '2024-06-01 07:36:59'),
(68, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u0639\\u0627\\u0645\\u0647\",\"updated_at\":\"2024-06-01T10:45:28.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0639\\u0645\\u0644\\u0627\\u0621\",\"updated_at\":\"2024-06-01T10:36:59.000000Z\"}}', NULL, '2024-06-01 07:45:28', '2024-06-01 07:45:28'),
(69, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T10:46:16.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T10:45:28.000000Z\"}}', NULL, '2024-06-01 07:46:16', '2024-06-01 07:46:16'),
(70, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":12,\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u0639\\u0645\\u0631\\u0629\",\"code\":\"25\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:47:34.000000Z\",\"updated_at\":\"2024-06-01T10:47:34.000000Z\"}}', NULL, '2024-06-01 07:47:34', '2024-06-01 07:47:34'),
(71, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":13,\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 \\u0639\\u0645\\u0631\\u0629\",\"code\":\"26\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:48:34.000000Z\",\"updated_at\":\"2024-06-01T10:48:34.000000Z\"}}', NULL, '2024-06-01 07:48:34', '2024-06-01 07:48:34'),
(72, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u062d\\u062c\",\"updated_at\":\"2024-06-01T10:48:50.000000Z\"},\"old\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u0639\\u0645\\u0631\\u0629\",\"updated_at\":\"2024-06-01T10:47:34.000000Z\"}}', NULL, '2024-06-01 07:48:50', '2024-06-01 07:48:50'),
(73, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647- \\u0639\\u0645\\u0631\\u0629\",\"updated_at\":\"2024-06-01T10:49:01.000000Z\"},\"old\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 \\u0639\\u0645\\u0631\\u0629\",\"updated_at\":\"2024-06-01T10:48:34.000000Z\"}}', NULL, '2024-06-01 07:49:01', '2024-06-01 07:49:01'),
(74, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 -\\u0639\\u0645\\u0631\\u0629\",\"updated_at\":\"2024-06-01T10:49:17.000000Z\"},\"old\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647- \\u0639\\u0645\\u0631\\u0629\",\"updated_at\":\"2024-06-01T10:49:01.000000Z\"}}', NULL, '2024-06-01 07:49:17', '2024-06-01 07:49:17'),
(75, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":14,\"name\":\"\\u0627\\u0631\\u0635\\u062f\\u0647 \\u0645\\u062f\\u064a\\u0646\\u0647 \\u0627\\u062e\\u0631\\u0649\",\"code\":\"27\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:50:23.000000Z\",\"updated_at\":\"2024-06-01T10:50:23.000000Z\"}}', NULL, '2024-06-01 07:50:23', '2024-06-01 07:50:23'),
(76, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 29, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":29,\"name\":\"\\u0636\\u0631\\u064a\\u0628\\u0647 \\u062e\\u0635\\u0645 \\u0648\\u062a\\u062d\\u0635\\u064a\\u0644\",\"status\":1,\"code\":\"271\",\"type_id\":14,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:51:34.000000Z\",\"updated_at\":\"2024-06-01T10:51:34.000000Z\"}}', NULL, '2024-06-01 07:51:34', '2024-06-01 07:51:34'),
(77, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 30, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":30,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0645\\u0642\\u062f\\u0645\",\"status\":1,\"code\":\"272\",\"type_id\":14,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:52:23.000000Z\",\"updated_at\":\"2024-06-01T10:52:23.000000Z\"}}', NULL, '2024-06-01 07:52:23', '2024-06-01 07:52:23'),
(78, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 31, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":31,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0645\\u0633\\u062a\\u062d\\u0642\",\"status\":1,\"code\":\"273\",\"type_id\":14,\"deleted_at\":null,\"created_at\":\"2024-06-01T10:52:54.000000Z\",\"updated_at\":\"2024-06-01T10:52:54.000000Z\"}}', NULL, '2024-06-01 07:52:54', '2024-06-01 07:52:54'),
(79, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 32, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":32,\"name\":\"\\u0627\\u0644\\u0646\\u0639\\u0645\\u0627\\u0646\\u0649 \\u0644\\u0644\\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"241\",\"type_id\":11,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:21:42.000000Z\",\"updated_at\":\"2024-06-01T11:21:42.000000Z\"}}', NULL, '2024-06-01 08:21:42', '2024-06-01 08:21:42'),
(80, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 33, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":33,\"name\":\"\\u0646\\u064a\\u0648 \\u062d\\u0648\\u0631\\u0633\",\"status\":1,\"code\":\"242\",\"type_id\":11,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:22:16.000000Z\",\"updated_at\":\"2024-06-01T11:22:16.000000Z\"}}', NULL, '2024-06-01 08:22:16', '2024-06-01 08:22:16'),
(81, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 34, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":34,\"name\":\"\\u0627\\u0646 \\u062a\\u0631\\u0628\",\"status\":1,\"code\":\"243\",\"type_id\":11,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:22:43.000000Z\",\"updated_at\":\"2024-06-01T11:22:43.000000Z\"}}', NULL, '2024-06-01 08:22:43', '2024-06-01 08:22:43'),
(82, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 35, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":35,\"name\":\"\\u0645\\u064a\\u0627\\u0633\\u064a\\u0646\",\"status\":1,\"code\":\"244\",\"type_id\":11,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:24:22.000000Z\",\"updated_at\":\"2024-06-01T11:24:22.000000Z\"}}', NULL, '2024-06-01 08:24:22', '2024-06-01 08:24:22'),
(83, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 36, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":36,\"name\":\"\\u062a\\u0648\\u0644\\u064a\\u0646 \\u062a\\u0648\\u0631\\u0632\",\"status\":1,\"code\":\"245\",\"type_id\":11,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:26:20.000000Z\",\"updated_at\":\"2024-06-01T11:26:20.000000Z\"}}', NULL, '2024-06-01 08:26:20', '2024-06-01 08:26:20'),
(84, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 15, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":15,\"name\":\"\\u0639\\u0647\\u062f \\u0627\\u0644\\u0645\\u0648\\u0638\\u0641\\u064a\\u0646\",\"code\":\"28\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:29:59.000000Z\",\"updated_at\":\"2024-06-01T11:29:59.000000Z\"}}', NULL, '2024-06-01 08:29:59', '2024-06-01 08:29:59'),
(85, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 37, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":37,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0639\\u064a\\u0633\\u0648\\u0649\",\"status\":1,\"code\":\"281\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:31:01.000000Z\",\"updated_at\":\"2024-06-01T11:31:01.000000Z\"}}', NULL, '2024-06-01 08:31:01', '2024-06-01 08:31:01'),
(86, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 38, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":38,\"name\":\"\\u0647\\u0628\\u0647\",\"status\":1,\"code\":\"282\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:31:24.000000Z\",\"updated_at\":\"2024-06-01T11:31:24.000000Z\"}}', NULL, '2024-06-01 08:31:24', '2024-06-01 08:31:24'),
(87, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 39, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":39,\"name\":\"\\u0645\\u0631\\u0648\\u0627\\u0646\",\"status\":1,\"code\":\"283\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:31:47.000000Z\",\"updated_at\":\"2024-06-01T11:31:47.000000Z\"}}', NULL, '2024-06-01 08:31:47', '2024-06-01 08:31:47'),
(88, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 40, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":40,\"name\":\"\\u0641\\u062a\\u062d\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0639\\u0644\\u0649\",\"status\":1,\"code\":\"284\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:32:13.000000Z\",\"updated_at\":\"2024-06-01T11:32:13.000000Z\"}}', NULL, '2024-06-01 08:32:13', '2024-06-01 08:32:13'),
(89, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 41, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":41,\"name\":\"\\u0627\\u0644\\u0634\\u064a\\u062e \\u0633\\u0639\\u064a\\u062f\",\"status\":1,\"code\":\"285\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:33:35.000000Z\",\"updated_at\":\"2024-06-01T11:33:35.000000Z\"}}', NULL, '2024-06-01 08:33:35', '2024-06-01 08:33:35'),
(90, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 42, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":42,\"name\":\"\\u0645\\u064a\\u0631\\u0646\\u0627 \\u0632\\u063a\\u0644\\u0648\\u0644\",\"status\":1,\"code\":\"286\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:34:12.000000Z\",\"updated_at\":\"2024-06-01T11:34:12.000000Z\"}}', NULL, '2024-06-01 08:34:12', '2024-06-01 08:34:12'),
(91, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 43, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":43,\"name\":\"\\u0631\\u064a\\u0645\",\"status\":1,\"code\":\"287\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:34:37.000000Z\",\"updated_at\":\"2024-06-01T11:34:37.000000Z\"}}', NULL, '2024-06-01 08:34:37', '2024-06-01 08:34:37'),
(92, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 44, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":44,\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0628\\u062f \\u0627\\u0644\\u062c\\u0644\\u064a\\u0644\",\"status\":1,\"code\":\"288\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:35:07.000000Z\",\"updated_at\":\"2024-06-01T11:35:07.000000Z\"}}', NULL, '2024-06-01 08:35:07', '2024-06-01 08:35:07'),
(93, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 45, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":45,\"name\":\"\\u062f\\u0639\\u0627\\u0621 \\u0627\\u064a\\u0645\\u0646\",\"status\":0,\"code\":\"289\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:35:36.000000Z\",\"updated_at\":\"2024-06-01T11:35:36.000000Z\"}}', NULL, '2024-06-01 08:35:36', '2024-06-01 08:35:36'),
(94, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T11:35:47.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T11:35:36.000000Z\"}}', NULL, '2024-06-01 08:35:47', '2024-06-01 08:35:47'),
(95, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 46, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":46,\"name\":\"\\u0643\\u0631\\u064a\\u0645 \\u062a\\u0623\\u0645\\u064a\\u0646\\u0627\\u062a\",\"status\":1,\"code\":\"2810\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:38:30.000000Z\",\"updated_at\":\"2024-06-01T11:38:30.000000Z\"}}', NULL, '2024-06-01 08:38:30', '2024-06-01 08:38:30'),
(96, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 47, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":47,\"name\":\"\\u0627\\u064a\\u0647\",\"status\":1,\"code\":\"2811\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T11:38:55.000000Z\",\"updated_at\":\"2024-06-01T11:38:55.000000Z\"}}', NULL, '2024-06-01 08:38:55', '2024-06-01 08:38:55'),
(97, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000\",\"updated_at\":\"2024-06-01T11:42:25.000000Z\"},\"old\":{\"code\":\"1\",\"updated_at\":\"2024-06-01T09:20:52.000000Z\"}}', NULL, '2024-06-01 08:42:25', '2024-06-01 08:42:25'),
(98, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10000\",\"updated_at\":\"2024-06-01T11:48:02.000000Z\"},\"old\":{\"code\":\"1000\",\"updated_at\":\"2024-06-01T11:42:25.000000Z\"}}', NULL, '2024-06-01 08:48:02', '2024-06-01 08:48:02'),
(99, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10100\",\"updated_at\":\"2024-06-01T11:48:40.000000Z\"},\"old\":{\"code\":\"10000\",\"updated_at\":\"2024-06-01T11:48:02.000000Z\"}}', NULL, '2024-06-01 08:48:40', '2024-06-01 08:48:40'),
(100, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10000\",\"updated_at\":\"2024-06-01T11:48:52.000000Z\"},\"old\":{\"code\":\"10100\",\"updated_at\":\"2024-06-01T11:48:40.000000Z\"}}', NULL, '2024-06-01 08:48:52', '2024-06-01 08:48:52'),
(101, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10100\",\"updated_at\":\"2024-06-01T11:50:00.000000Z\"},\"old\":{\"code\":\"11\",\"updated_at\":\"2024-06-01T09:26:19.000000Z\"}}', NULL, '2024-06-01 08:50:00', '2024-06-01 08:50:00'),
(102, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000010200\",\"updated_at\":\"2024-06-01T11:50:27.000000Z\"},\"old\":{\"code\":\"12\",\"updated_at\":\"2024-06-01T09:29:52.000000Z\"}}', NULL, '2024-06-01 08:50:27', '2024-06-01 08:50:27'),
(103, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10200\",\"updated_at\":\"2024-06-01T11:50:43.000000Z\"},\"old\":{\"code\":\"1000010200\",\"updated_at\":\"2024-06-01T11:50:27.000000Z\"}}', NULL, '2024-06-01 08:50:43', '2024-06-01 08:50:43'),
(104, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1\",\"updated_at\":\"2024-06-01T11:51:56.000000Z\"},\"old\":{\"code\":\"10000\",\"updated_at\":\"2024-06-01T11:48:52.000000Z\"}}', NULL, '2024-06-01 08:51:56', '2024-06-01 08:51:56'),
(105, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"11\",\"updated_at\":\"2024-06-01T11:52:38.000000Z\"},\"old\":{\"code\":\"10100\",\"updated_at\":\"2024-06-01T11:50:00.000000Z\"}}', NULL, '2024-06-01 08:52:38', '2024-06-01 08:52:38'),
(106, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000012\",\"updated_at\":\"2024-06-01T11:52:50.000000Z\"},\"old\":{\"code\":\"10200\",\"updated_at\":\"2024-06-01T11:50:43.000000Z\"}}', NULL, '2024-06-01 08:52:50', '2024-06-01 08:52:50'),
(107, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"12\",\"updated_at\":\"2024-06-01T11:52:59.000000Z\"},\"old\":{\"code\":\"1000012\",\"updated_at\":\"2024-06-01T11:52:50.000000Z\"}}', NULL, '2024-06-01 08:52:59', '2024-06-01 08:52:59'),
(108, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280001\",\"updated_at\":\"2024-06-01T12:04:38.000000Z\"},\"old\":{\"code\":\"281\",\"updated_at\":\"2024-06-01T11:31:01.000000Z\"}}', NULL, '2024-06-01 09:04:38', '2024-06-01 09:04:38'),
(109, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 38, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280002\",\"updated_at\":\"2024-06-01T12:08:31.000000Z\"},\"old\":{\"code\":\"282\",\"updated_at\":\"2024-06-01T11:31:24.000000Z\"}}', NULL, '2024-06-01 09:08:31', '2024-06-01 09:08:31'),
(110, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 39, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280003\",\"updated_at\":\"2024-06-01T12:08:49.000000Z\"},\"old\":{\"code\":\"283\",\"updated_at\":\"2024-06-01T11:31:47.000000Z\"}}', NULL, '2024-06-01 09:08:49', '2024-06-01 09:08:49');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(111, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 40, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280004\",\"updated_at\":\"2024-06-01T12:08:58.000000Z\"},\"old\":{\"code\":\"284\",\"updated_at\":\"2024-06-01T11:32:13.000000Z\"}}', NULL, '2024-06-01 09:08:58', '2024-06-01 09:08:58'),
(112, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 41, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280005\",\"updated_at\":\"2024-06-01T12:09:06.000000Z\"},\"old\":{\"code\":\"285\",\"updated_at\":\"2024-06-01T11:33:35.000000Z\"}}', NULL, '2024-06-01 09:09:06', '2024-06-01 09:09:06'),
(113, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 42, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280006\",\"updated_at\":\"2024-06-01T12:09:14.000000Z\"},\"old\":{\"code\":\"286\",\"updated_at\":\"2024-06-01T11:34:12.000000Z\"}}', NULL, '2024-06-01 09:09:14', '2024-06-01 09:09:14'),
(114, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280007\",\"updated_at\":\"2024-06-01T12:09:29.000000Z\"},\"old\":{\"code\":\"287\",\"updated_at\":\"2024-06-01T11:34:37.000000Z\"}}', NULL, '2024-06-01 09:09:29', '2024-06-01 09:09:29'),
(115, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280008\",\"updated_at\":\"2024-06-01T12:09:38.000000Z\"},\"old\":{\"code\":\"288\",\"updated_at\":\"2024-06-01T11:35:07.000000Z\"}}', NULL, '2024-06-01 09:09:38', '2024-06-01 09:09:38'),
(116, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280009\",\"updated_at\":\"2024-06-01T12:09:53.000000Z\"},\"old\":{\"code\":\"289\",\"updated_at\":\"2024-06-01T11:35:47.000000Z\"}}', NULL, '2024-06-01 09:09:53', '2024-06-01 09:09:53'),
(117, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280010\",\"updated_at\":\"2024-06-01T12:10:00.000000Z\"},\"old\":{\"code\":\"2810\",\"updated_at\":\"2024-06-01T11:38:30.000000Z\"}}', NULL, '2024-06-01 09:10:00', '2024-06-01 09:10:00'),
(118, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 47, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"280011\",\"updated_at\":\"2024-06-01T12:10:09.000000Z\"},\"old\":{\"code\":\"2811\",\"updated_at\":\"2024-06-01T11:38:55.000000Z\"}}', NULL, '2024-06-01 09:10:09', '2024-06-01 09:10:09'),
(119, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"240001\",\"updated_at\":\"2024-06-01T12:10:35.000000Z\"},\"old\":{\"code\":\"241\",\"updated_at\":\"2024-06-01T11:21:42.000000Z\"}}', NULL, '2024-06-01 09:10:35', '2024-06-01 09:10:35'),
(120, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"240002\",\"updated_at\":\"2024-06-01T12:10:49.000000Z\"},\"old\":{\"code\":\"242\",\"updated_at\":\"2024-06-01T11:22:16.000000Z\"}}', NULL, '2024-06-01 09:10:49', '2024-06-01 09:10:49'),
(121, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 34, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"240003\",\"updated_at\":\"2024-06-01T12:10:56.000000Z\"},\"old\":{\"code\":\"243\",\"updated_at\":\"2024-06-01T11:22:43.000000Z\"}}', NULL, '2024-06-01 09:10:56', '2024-06-01 09:10:56'),
(122, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"240004\",\"updated_at\":\"2024-06-01T12:11:03.000000Z\"},\"old\":{\"code\":\"244\",\"updated_at\":\"2024-06-01T11:24:22.000000Z\"}}', NULL, '2024-06-01 09:11:03', '2024-06-01 09:11:03'),
(123, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"240005\",\"updated_at\":\"2024-06-01T12:11:11.000000Z\"},\"old\":{\"code\":\"245\",\"updated_at\":\"2024-06-01T11:26:20.000000Z\"}}', NULL, '2024-06-01 09:11:11', '2024-06-01 09:11:11'),
(124, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"270003\",\"updated_at\":\"2024-06-01T12:11:36.000000Z\"},\"old\":{\"code\":\"273\",\"updated_at\":\"2024-06-01T10:52:54.000000Z\"}}', NULL, '2024-06-01 09:11:36', '2024-06-01 09:11:36'),
(125, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"270002\",\"updated_at\":\"2024-06-01T12:11:45.000000Z\"},\"old\":{\"code\":\"272\",\"updated_at\":\"2024-06-01T10:52:23.000000Z\"}}', NULL, '2024-06-01 09:11:45', '2024-06-01 09:11:45'),
(126, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 29, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"270001\",\"updated_at\":\"2024-06-01T12:11:53.000000Z\"},\"old\":{\"code\":\"271\",\"updated_at\":\"2024-06-01T10:51:34.000000Z\"}}', NULL, '2024-06-01 09:11:53', '2024-06-01 09:11:53'),
(127, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 28, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"230004\",\"updated_at\":\"2024-06-01T12:12:01.000000Z\"},\"old\":{\"code\":\"234\",\"updated_at\":\"2024-06-01T10:35:16.000000Z\"}}', NULL, '2024-06-01 09:12:01', '2024-06-01 09:12:01'),
(128, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"230003\",\"updated_at\":\"2024-06-01T12:12:12.000000Z\"},\"old\":{\"code\":\"233\",\"updated_at\":\"2024-06-01T10:34:40.000000Z\"}}', NULL, '2024-06-01 09:12:12', '2024-06-01 09:12:12'),
(129, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 26, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"230002\",\"updated_at\":\"2024-06-01T12:12:21.000000Z\"},\"old\":{\"code\":\"232\",\"updated_at\":\"2024-06-01T10:34:04.000000Z\"}}', NULL, '2024-06-01 09:12:21', '2024-06-01 09:12:21'),
(130, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"230001\",\"updated_at\":\"2024-06-01T12:12:30.000000Z\"},\"old\":{\"code\":\"231\",\"updated_at\":\"2024-06-01T10:33:29.000000Z\"}}', NULL, '2024-06-01 09:12:30', '2024-06-01 09:12:30'),
(131, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"220006\",\"updated_at\":\"2024-06-01T12:12:37.000000Z\"},\"old\":{\"code\":\"226\",\"updated_at\":\"2024-06-01T10:07:49.000000Z\"}}', NULL, '2024-06-01 09:12:37', '2024-06-01 09:12:37'),
(132, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"220005\",\"updated_at\":\"2024-06-01T12:12:45.000000Z\"},\"old\":{\"code\":\"225\",\"updated_at\":\"2024-06-01T10:07:25.000000Z\"}}', NULL, '2024-06-01 09:12:45', '2024-06-01 09:12:45'),
(133, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"220004\",\"updated_at\":\"2024-06-01T12:12:53.000000Z\"},\"old\":{\"code\":\"224\",\"updated_at\":\"2024-06-01T10:07:02.000000Z\"}}', NULL, '2024-06-01 09:12:53', '2024-06-01 09:12:53'),
(134, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"220003\",\"updated_at\":\"2024-06-01T12:13:01.000000Z\"},\"old\":{\"code\":\"223\",\"updated_at\":\"2024-06-01T10:06:09.000000Z\"}}', NULL, '2024-06-01 09:13:01', '2024-06-01 09:13:01'),
(135, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"220002\",\"updated_at\":\"2024-06-01T12:13:10.000000Z\"},\"old\":{\"code\":\"222\",\"updated_at\":\"2024-06-01T10:05:32.000000Z\"}}', NULL, '2024-06-01 09:13:10', '2024-06-01 09:13:10'),
(136, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"220001\",\"updated_at\":\"2024-06-01T12:13:18.000000Z\"},\"old\":{\"code\":\"221\",\"updated_at\":\"2024-06-01T10:04:58.000000Z\"}}', NULL, '2024-06-01 09:13:18', '2024-06-01 09:13:18'),
(137, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"140001\",\"updated_at\":\"2024-06-01T12:14:11.000000Z\"},\"old\":{\"code\":\"141\",\"updated_at\":\"2024-06-01T09:40:34.000000Z\"}}', NULL, '2024-06-01 09:14:11', '2024-06-01 09:14:11'),
(138, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"130001\",\"updated_at\":\"2024-06-01T12:14:21.000000Z\"},\"old\":{\"code\":\"131\",\"updated_at\":\"2024-06-01T09:38:51.000000Z\"}}', NULL, '2024-06-01 09:14:21', '2024-06-01 09:14:21'),
(139, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120009\",\"updated_at\":\"2024-06-01T12:14:28.000000Z\"},\"old\":{\"code\":\"129\",\"updated_at\":\"2024-06-01T09:35:58.000000Z\"}}', NULL, '2024-06-01 09:14:28', '2024-06-01 09:14:28'),
(140, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120008\",\"updated_at\":\"2024-06-01T12:14:47.000000Z\"},\"old\":{\"code\":\"128\",\"updated_at\":\"2024-06-01T09:35:20.000000Z\"}}', NULL, '2024-06-01 09:14:47', '2024-06-01 09:14:47'),
(141, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120007\",\"updated_at\":\"2024-06-01T12:16:20.000000Z\"},\"old\":{\"code\":\"127\",\"updated_at\":\"2024-06-01T09:34:51.000000Z\"}}', NULL, '2024-06-01 09:16:20', '2024-06-01 09:16:20'),
(142, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120006\",\"updated_at\":\"2024-06-01T12:16:29.000000Z\"},\"old\":{\"code\":\"126\",\"updated_at\":\"2024-06-01T09:34:10.000000Z\"}}', NULL, '2024-06-01 09:16:29', '2024-06-01 09:16:29'),
(143, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120005\",\"updated_at\":\"2024-06-01T12:16:38.000000Z\"},\"old\":{\"code\":\"125\",\"updated_at\":\"2024-06-01T09:33:44.000000Z\"}}', NULL, '2024-06-01 09:16:38', '2024-06-01 09:16:38'),
(144, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120004\",\"updated_at\":\"2024-06-01T12:16:47.000000Z\"},\"old\":{\"code\":\"124\",\"updated_at\":\"2024-06-01T09:33:06.000000Z\"}}', NULL, '2024-06-01 09:16:47', '2024-06-01 09:16:47'),
(145, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120003\",\"updated_at\":\"2024-06-01T12:16:55.000000Z\"},\"old\":{\"code\":\"123\",\"updated_at\":\"2024-06-01T09:32:22.000000Z\"}}', NULL, '2024-06-01 09:16:55', '2024-06-01 09:16:55'),
(146, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120002\",\"updated_at\":\"2024-06-01T12:17:01.000000Z\"},\"old\":{\"code\":\"122\",\"updated_at\":\"2024-06-01T09:32:29.000000Z\"}}', NULL, '2024-06-01 09:17:01', '2024-06-01 09:17:01'),
(147, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"120001\",\"updated_at\":\"2024-06-01T12:17:09.000000Z\"},\"old\":{\"code\":\"121\",\"updated_at\":\"2024-06-01T09:32:35.000000Z\"}}', NULL, '2024-06-01 09:17:09', '2024-06-01 09:17:09'),
(148, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u0646\\u0642\\u062f\\u064a\\u0629\",\"updated_at\":\"2024-06-01T12:23:38.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0646\\u0642\\u062f\\u064a\\u0647\",\"updated_at\":\"2024-06-01T09:44:19.000000Z\"}}', NULL, '2024-06-01 09:23:38', '2024-06-01 09:23:38'),
(149, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T12:24:35.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T10:03:24.000000Z\"}}', NULL, '2024-06-01 09:24:35', '2024-06-01 09:24:35'),
(150, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0646\\u0642\\u062f\\u064a\\u0629\",\"updated_at\":\"2024-06-01T12:25:45.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0646\\u0642\\u062f\\u064a\\u0629\",\"updated_at\":\"2024-06-01T12:23:38.000000Z\"}}', NULL, '2024-06-01 09:25:45', '2024-06-01 09:25:45'),
(151, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 48, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":48,\"name\":\"\\u0627\\u0633\\u0644\\u0627\\u0645 \\u064a\\u0627\\u0642\\u0648\\u062a\",\"status\":0,\"code\":\"280012\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:27:21.000000Z\",\"updated_at\":\"2024-06-01T12:27:21.000000Z\"}}', NULL, '2024-06-01 09:27:21', '2024-06-01 09:27:21'),
(152, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 48, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T12:27:30.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T12:27:21.000000Z\"}}', NULL, '2024-06-01 09:27:30', '2024-06-01 09:27:30'),
(153, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 49, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":49,\"name\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0645\\u062d\\u0645\\u062f\\u0649\",\"status\":1,\"code\":\"280013\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:28:06.000000Z\",\"updated_at\":\"2024-06-01T12:28:06.000000Z\"}}', NULL, '2024-06-01 09:28:06', '2024-06-01 09:28:06'),
(154, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 50, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":50,\"name\":\"\\u0634\\u0639\\u0628\\u0627\\u0646\",\"status\":1,\"code\":\"280014\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:29:15.000000Z\",\"updated_at\":\"2024-06-01T12:29:15.000000Z\"}}', NULL, '2024-06-01 09:29:15', '2024-06-01 09:29:15'),
(155, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 51, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":51,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0627\\u0634\\u0631\\u0641\",\"status\":1,\"code\":\"280015\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:29:44.000000Z\",\"updated_at\":\"2024-06-01T12:29:44.000000Z\"}}', NULL, '2024-06-01 09:29:44', '2024-06-01 09:29:44'),
(156, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 52, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":52,\"name\":\"\\u0639\\u0645\\u0631\\u0648 \\u064a\\u0648\\u0633\\u0641\",\"status\":1,\"code\":\"280016\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:30:30.000000Z\",\"updated_at\":\"2024-06-01T12:30:30.000000Z\"}}', NULL, '2024-06-01 09:30:30', '2024-06-01 09:30:30'),
(157, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 53, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":53,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0646\\u0648\\u0631\",\"status\":1,\"code\":\"280017\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:31:00.000000Z\",\"updated_at\":\"2024-06-01T12:31:00.000000Z\"}}', NULL, '2024-06-01 09:31:00', '2024-06-01 09:31:00'),
(158, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 54, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":54,\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0637\\u064a\\u0647\",\"status\":1,\"code\":\"280018\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:31:57.000000Z\",\"updated_at\":\"2024-06-01T12:31:57.000000Z\"}}', NULL, '2024-06-01 09:31:57', '2024-06-01 09:31:57'),
(159, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 55, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":55,\"name\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0632\\u063a\\u0628\\u064a\",\"status\":1,\"code\":\"280019\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:32:42.000000Z\",\"updated_at\":\"2024-06-01T12:32:42.000000Z\"}}', NULL, '2024-06-01 09:32:42', '2024-06-01 09:32:42'),
(160, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 56, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":56,\"name\":\"\\u0645\\u0646\\u0647 \\u062d\\u0627\\u0641\\u0638\",\"status\":1,\"code\":\"280020\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:33:19.000000Z\",\"updated_at\":\"2024-06-01T12:33:19.000000Z\"}}', NULL, '2024-06-01 09:33:19', '2024-06-01 09:33:19'),
(161, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 57, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":57,\"name\":\"\\u0645\\u0646\\u0647 \\u0639\\u0628\\u062f \\u0627\\u0644\\u0644\\u0647\",\"status\":1,\"code\":\"280021\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:33:55.000000Z\",\"updated_at\":\"2024-06-01T12:33:55.000000Z\"}}', NULL, '2024-06-01 09:33:55', '2024-06-01 09:33:55'),
(162, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 58, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":58,\"name\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0631\\u062d\\u0645\\u0646\",\"status\":1,\"code\":\"280022\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:34:31.000000Z\",\"updated_at\":\"2024-06-01T12:34:31.000000Z\"}}', NULL, '2024-06-01 09:34:31', '2024-06-01 09:34:31'),
(163, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 59, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":59,\"name\":\"\\u0645\\u0647\\u0646\\u062f\",\"status\":1,\"code\":\"280023\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:35:00.000000Z\",\"updated_at\":\"2024-06-01T12:35:00.000000Z\"}}', NULL, '2024-06-01 09:35:00', '2024-06-01 09:35:00'),
(164, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 60, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":60,\"name\":\"\\u0645\\u064a\",\"status\":1,\"code\":\"280024\",\"type_id\":15,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:35:21.000000Z\",\"updated_at\":\"2024-06-01T12:35:21.000000Z\"}}', NULL, '2024-06-01 09:35:21', '2024-06-01 09:35:21'),
(165, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 16, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":16,\"name\":\"\\u0633\\u0644\\u0641 \\u0627\\u0644\\u0645\\u0648\\u0638\\u0641\\u064a\\u0646\",\"code\":\"29\",\"status\":0,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:36:10.000000Z\",\"updated_at\":\"2024-06-01T12:36:10.000000Z\"}}', NULL, '2024-06-01 09:36:11', '2024-06-01 09:36:11'),
(166, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T12:36:25.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T12:36:10.000000Z\"}}', NULL, '2024-06-01 09:36:25', '2024-06-01 09:36:25'),
(167, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 61, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":61,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0639\\u064a\\u0633\\u0648\\u0649 \\u0633\\u0644\\u0641\",\"status\":0,\"code\":\"290001\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:41:51.000000Z\",\"updated_at\":\"2024-06-01T12:41:51.000000Z\"}}', NULL, '2024-06-01 09:41:51', '2024-06-01 09:41:51'),
(168, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 62, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":62,\"name\":\"\\u0647\\u0628\\u0647  \\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290002\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:43:53.000000Z\",\"updated_at\":\"2024-06-01T12:43:53.000000Z\"}}', NULL, '2024-06-01 09:43:53', '2024-06-01 09:43:53'),
(169, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 63, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":63,\"name\":\"\\u0645\\u0631\\u0648\\u0627\\u0646 \\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290003\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:45:39.000000Z\",\"updated_at\":\"2024-06-01T12:45:39.000000Z\"}}', NULL, '2024-06-01 09:45:39', '2024-06-01 09:45:39'),
(170, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 64, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":64,\"name\":\"\\u0641\\u062a\\u062d\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0639\\u0644\\u0649\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290004\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:46:28.000000Z\",\"updated_at\":\"2024-06-01T12:46:28.000000Z\"}}', NULL, '2024-06-01 09:46:28', '2024-06-01 09:46:28'),
(171, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 65, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":65,\"name\":\"\\u0627\\u0644\\u0634\\u064a\\u062e \\u0633\\u0639\\u064a\\u062f\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290005\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:48:12.000000Z\",\"updated_at\":\"2024-06-01T12:48:12.000000Z\"}}', NULL, '2024-06-01 09:48:12', '2024-06-01 09:48:12'),
(172, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 66, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":66,\"name\":\"\\u0645\\u064a\\u0631\\u0646\\u0627 \\u0632\\u063a\\u0644\\u0648\\u0644\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290006\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:49:19.000000Z\",\"updated_at\":\"2024-06-01T12:49:19.000000Z\"}}', NULL, '2024-06-01 09:49:19', '2024-06-01 09:49:19'),
(173, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 67, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":67,\"name\":\"\\u0631\\u064a\\u0645\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290007\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:50:11.000000Z\",\"updated_at\":\"2024-06-01T12:50:11.000000Z\"}}', NULL, '2024-06-01 09:50:11', '2024-06-01 09:50:11'),
(174, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 68, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":68,\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0628\\u062f \\u0627\\u0644\\u062c\\u0644\\u064a\\u0644\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290008\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:51:11.000000Z\",\"updated_at\":\"2024-06-01T12:51:11.000000Z\"}}', NULL, '2024-06-01 09:51:11', '2024-06-01 09:51:11'),
(175, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 69, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":69,\"name\":\"\\u062f\\u0639\\u0627\\u0621 \\u0627\\u064a\\u0645\\u0646\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290009\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:52:04.000000Z\",\"updated_at\":\"2024-06-01T12:52:04.000000Z\"}}', NULL, '2024-06-01 09:52:04', '2024-06-01 09:52:04'),
(176, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 70, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":70,\"name\":\"\\u0643\\u0631\\u064a\\u0645 \\u062a\\u0623\\u0645\\u064a\\u0646\\u0627\\u062a \\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290010\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:52:48.000000Z\",\"updated_at\":\"2024-06-01T12:52:48.000000Z\"}}', NULL, '2024-06-01 09:52:48', '2024-06-01 09:52:48'),
(177, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 71, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":71,\"name\":\"\\u0627\\u064a\\u0647\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290011\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:53:32.000000Z\",\"updated_at\":\"2024-06-01T12:53:32.000000Z\"}}', NULL, '2024-06-01 09:53:32', '2024-06-01 09:53:32'),
(178, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 72, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":72,\"name\":\"\\u0627\\u0633\\u0644\\u0627\\u0645 \\u064a\\u0627\\u0642\\u0648\\u062a\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290012\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:54:05.000000Z\",\"updated_at\":\"2024-06-01T12:54:05.000000Z\"}}', NULL, '2024-06-01 09:54:05', '2024-06-01 09:54:05'),
(179, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 73, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":73,\"name\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0645\\u062d\\u0645\\u062f\\u0649\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290013\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:54:40.000000Z\",\"updated_at\":\"2024-06-01T12:54:40.000000Z\"}}', NULL, '2024-06-01 09:54:40', '2024-06-01 09:54:40'),
(180, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 74, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":74,\"name\":\"\\u0634\\u0639\\u0628\\u0627\\u0646\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290014\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:55:11.000000Z\",\"updated_at\":\"2024-06-01T12:55:11.000000Z\"}}', NULL, '2024-06-01 09:55:11', '2024-06-01 09:55:11'),
(181, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 75, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":75,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0627\\u0634\\u0631\\u0641\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290015\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:55:59.000000Z\",\"updated_at\":\"2024-06-01T12:55:59.000000Z\"}}', NULL, '2024-06-01 09:55:59', '2024-06-01 09:55:59'),
(182, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 76, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":76,\"name\":\"\\u0639\\u0645\\u0631\\u0648 \\u064a\\u0648\\u0633\\u0641\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290016\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:56:41.000000Z\",\"updated_at\":\"2024-06-01T12:56:41.000000Z\"}}', NULL, '2024-06-01 09:56:41', '2024-06-01 09:56:41'),
(183, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 77, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":77,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0646\\u0648\\u0631\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290017\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T12:57:15.000000Z\",\"updated_at\":\"2024-06-01T12:57:15.000000Z\"}}', NULL, '2024-06-01 09:57:15', '2024-06-01 09:57:15'),
(184, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 78, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":78,\"name\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0637\\u064a\\u0647\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290018\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:01:06.000000Z\",\"updated_at\":\"2024-06-01T13:01:06.000000Z\"}}', NULL, '2024-06-01 10:01:06', '2024-06-01 10:01:06'),
(185, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 79, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":79,\"name\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0632\\u063a\\u0628\\u064a\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"29001\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:01:37.000000Z\",\"updated_at\":\"2024-06-01T13:01:37.000000Z\"}}', NULL, '2024-06-01 10:01:37', '2024-06-01 10:01:37'),
(186, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 79, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"290019\",\"updated_at\":\"2024-06-01T13:01:52.000000Z\"},\"old\":{\"code\":\"29001\",\"updated_at\":\"2024-06-01T13:01:37.000000Z\"}}', NULL, '2024-06-01 10:01:52', '2024-06-01 10:01:52'),
(187, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 80, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":80,\"name\":\"\\u0645\\u0646\\u0647 \\u062d\\u0627\\u0641\\u0638\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290020\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:02:58.000000Z\",\"updated_at\":\"2024-06-01T13:02:58.000000Z\"}}', NULL, '2024-06-01 10:02:58', '2024-06-01 10:02:58'),
(188, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 80, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:03:20.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T13:02:58.000000Z\"}}', NULL, '2024-06-01 10:03:20', '2024-06-01 10:03:20'),
(189, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 79, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:03:28.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T13:01:52.000000Z\"}}', NULL, '2024-06-01 10:03:28', '2024-06-01 10:03:28'),
(190, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 78, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:03:36.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T13:01:06.000000Z\"}}', NULL, '2024-06-01 10:03:36', '2024-06-01 10:03:36'),
(191, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 77, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:03:45.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:57:15.000000Z\"}}', NULL, '2024-06-01 10:03:45', '2024-06-01 10:03:45'),
(192, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 76, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:03:59.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:56:41.000000Z\"}}', NULL, '2024-06-01 10:03:59', '2024-06-01 10:03:59'),
(193, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 74, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:04:10.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:55:11.000000Z\"}}', NULL, '2024-06-01 10:04:10', '2024-06-01 10:04:10'),
(194, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 73, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:04:21.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:54:40.000000Z\"}}', NULL, '2024-06-01 10:04:21', '2024-06-01 10:04:21'),
(195, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 72, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:04:30.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:54:05.000000Z\"}}', NULL, '2024-06-01 10:04:31', '2024-06-01 10:04:31'),
(196, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 71, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:04:40.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:53:32.000000Z\"}}', NULL, '2024-06-01 10:04:40', '2024-06-01 10:04:40'),
(197, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 70, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:05:04.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:52:48.000000Z\"}}', NULL, '2024-06-01 10:05:04', '2024-06-01 10:05:04'),
(198, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 69, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:05:11.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:52:04.000000Z\"}}', NULL, '2024-06-01 10:05:11', '2024-06-01 10:05:11'),
(199, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 68, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:05:18.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:51:11.000000Z\"}}', NULL, '2024-06-01 10:05:18', '2024-06-01 10:05:18'),
(200, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 67, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:05:24.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:50:11.000000Z\"}}', NULL, '2024-06-01 10:05:24', '2024-06-01 10:05:24'),
(201, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 66, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:05:32.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:49:19.000000Z\"}}', NULL, '2024-06-01 10:05:32', '2024-06-01 10:05:32'),
(202, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 65, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:05:41.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:48:12.000000Z\"}}', NULL, '2024-06-01 10:05:41', '2024-06-01 10:05:41'),
(203, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 64, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:05:52.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:46:28.000000Z\"}}', NULL, '2024-06-01 10:05:52', '2024-06-01 10:05:52'),
(204, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 63, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:06:02.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T12:45:39.000000Z\"}}', NULL, '2024-06-01 10:06:02', '2024-06-01 10:06:02'),
(205, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 61, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-01T13:06:17.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T12:41:51.000000Z\"}}', NULL, '2024-06-01 10:06:17', '2024-06-01 10:06:17'),
(206, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 81, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":81,\"name\":\"\\u0645\\u0646\\u0647 \\u0639\\u0628\\u062f \\u0627\\u0644\\u0644\\u0647\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290021\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:07:08.000000Z\",\"updated_at\":\"2024-06-01T13:07:08.000000Z\"}}', NULL, '2024-06-01 10:07:08', '2024-06-01 10:07:08'),
(207, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 82, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":82,\"name\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0631\\u062d\\u0645\\u0646\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290022\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:08:00.000000Z\",\"updated_at\":\"2024-06-01T13:08:00.000000Z\"}}', NULL, '2024-06-01 10:08:00', '2024-06-01 10:08:00'),
(208, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 83, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":83,\"name\":\"\\u0645\\u0647\\u0646\\u062f\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290023\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:08:36.000000Z\",\"updated_at\":\"2024-06-01T13:08:36.000000Z\"}}', NULL, '2024-06-01 10:08:36', '2024-06-01 10:08:36'),
(209, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 84, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":84,\"name\":\"\\u0645\\u064a\\t\\u0633\\u0644\\u0641\",\"status\":1,\"code\":\"290024\",\"type_id\":16,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:09:04.000000Z\",\"updated_at\":\"2024-06-01T13:09:04.000000Z\"}}', NULL, '2024-06-01 10:09:04', '2024-06-01 10:09:04'),
(210, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:11:51.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T11:51:56.000000Z\"}}', NULL, '2024-06-01 10:11:51', '2024-06-01 10:11:51'),
(211, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:12:03.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T13:11:51.000000Z\"}}', NULL, '2024-06-01 10:12:03', '2024-06-01 10:12:03'),
(212, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-01T13:12:20.000000Z\"},\"old\":{\"updated_at\":\"2024-06-01T13:12:03.000000Z\"}}', NULL, '2024-06-01 10:12:20', '2024-06-01 10:12:20'),
(213, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 17, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":17,\"name\":\"\\u0641\\u064a\\u0632\\u0627\",\"code\":\"230\",\"status\":1,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:16:51.000000Z\",\"updated_at\":\"2024-06-01T13:16:51.000000Z\"}}', NULL, '2024-06-01 10:16:51', '2024-06-01 10:16:51'),
(214, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 17, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":0,\"updated_at\":\"2024-06-01T13:22:36.000000Z\"},\"old\":{\"status\":1,\"updated_at\":\"2024-06-01T13:16:51.000000Z\"}}', NULL, '2024-06-01 10:22:36', '2024-06-01 10:22:36'),
(215, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000\",\"updated_at\":\"2024-06-01T13:26:07.000000Z\"},\"old\":{\"code\":\"1\",\"updated_at\":\"2024-06-01T13:12:20.000000Z\"}}', NULL, '2024-06-01 10:26:07', '2024-06-01 10:26:07'),
(216, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1\",\"updated_at\":\"2024-06-01T13:26:39.000000Z\"},\"old\":{\"code\":\"1000\",\"updated_at\":\"2024-06-01T13:26:07.000000Z\"}}', NULL, '2024-06-01 10:26:39', '2024-06-01 10:26:39'),
(217, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"2000\",\"updated_at\":\"2024-06-01T13:33:17.000000Z\"},\"old\":{\"code\":\"2\",\"updated_at\":\"2024-06-01T09:43:34.000000Z\"}}', NULL, '2024-06-01 10:33:17', '2024-06-01 10:33:17'),
(218, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"20001\",\"updated_at\":\"2024-06-01T13:33:29.000000Z\"},\"old\":{\"code\":\"21\",\"updated_at\":\"2024-06-01T12:25:45.000000Z\"}}', NULL, '2024-06-01 10:33:29', '2024-06-01 10:33:29'),
(219, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"2\",\"updated_at\":\"2024-06-01T13:33:54.000000Z\"},\"old\":{\"code\":\"2000\",\"updated_at\":\"2024-06-01T13:33:17.000000Z\"}}', NULL, '2024-06-01 10:33:54', '2024-06-01 10:33:54'),
(220, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"21\",\"updated_at\":\"2024-06-01T13:34:13.000000Z\"},\"old\":{\"code\":\"20001\",\"updated_at\":\"2024-06-01T13:33:29.000000Z\"}}', NULL, '2024-06-01 10:34:13', '2024-06-01 10:34:13'),
(221, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":0,\"updated_at\":\"2024-06-01T13:34:31.000000Z\"},\"old\":{\"status\":1,\"updated_at\":\"2024-06-01T12:24:35.000000Z\"}}', NULL, '2024-06-01 10:34:31', '2024-06-01 10:34:31'),
(222, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 85, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":85,\"name\":\"\\u0641\\u064a\\u0632\\u0627 \\u0627\\u0633\\u0644\\u0627\\u0645\",\"status\":0,\"code\":\"23001\",\"type_id\":17,\"deleted_at\":null,\"created_at\":\"2024-06-01T13:35:40.000000Z\",\"updated_at\":\"2024-06-01T13:35:40.000000Z\"}}', NULL, '2024-06-01 10:35:40', '2024-06-01 10:35:40'),
(223, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10\",\"updated_at\":\"2024-06-01T13:42:35.000000Z\"},\"old\":{\"code\":\"1\",\"updated_at\":\"2024-06-01T13:26:39.000000Z\"}}', NULL, '2024-06-01 10:42:35', '2024-06-01 10:42:35'),
(224, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"101\",\"updated_at\":\"2024-06-01T13:42:46.000000Z\"},\"old\":{\"code\":\"11\",\"updated_at\":\"2024-06-01T11:52:38.000000Z\"}}', NULL, '2024-06-01 10:42:47', '2024-06-01 10:42:47'),
(225, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102\",\"updated_at\":\"2024-06-01T13:42:58.000000Z\"},\"old\":{\"code\":\"12\",\"updated_at\":\"2024-06-01T11:52:59.000000Z\"}}', NULL, '2024-06-01 10:42:58', '2024-06-01 10:42:58'),
(226, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102001\",\"updated_at\":\"2024-06-01T13:46:07.000000Z\"},\"old\":{\"code\":\"120001\",\"updated_at\":\"2024-06-01T12:17:09.000000Z\"}}', NULL, '2024-06-01 10:46:07', '2024-06-01 10:46:07'),
(227, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102002\",\"updated_at\":\"2024-06-01T13:46:20.000000Z\"},\"old\":{\"code\":\"120002\",\"updated_at\":\"2024-06-01T12:17:01.000000Z\"}}', NULL, '2024-06-01 10:46:20', '2024-06-01 10:46:20'),
(228, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102003\",\"updated_at\":\"2024-06-01T13:46:27.000000Z\"},\"old\":{\"code\":\"120003\",\"updated_at\":\"2024-06-01T12:16:55.000000Z\"}}', NULL, '2024-06-01 10:46:27', '2024-06-01 10:46:27'),
(229, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102004\",\"updated_at\":\"2024-06-01T13:47:11.000000Z\"},\"old\":{\"code\":\"120004\",\"updated_at\":\"2024-06-01T12:16:47.000000Z\"}}', NULL, '2024-06-01 10:47:11', '2024-06-01 10:47:11'),
(230, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102005\",\"updated_at\":\"2024-06-01T13:47:18.000000Z\"},\"old\":{\"code\":\"120005\",\"updated_at\":\"2024-06-01T12:16:38.000000Z\"}}', NULL, '2024-06-01 10:47:18', '2024-06-01 10:47:18'),
(231, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102006\",\"updated_at\":\"2024-06-01T13:47:31.000000Z\"},\"old\":{\"code\":\"120006\",\"updated_at\":\"2024-06-01T12:16:29.000000Z\"}}', NULL, '2024-06-01 10:47:31', '2024-06-01 10:47:31'),
(232, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102007\",\"updated_at\":\"2024-06-01T13:47:38.000000Z\"},\"old\":{\"code\":\"120007\",\"updated_at\":\"2024-06-01T12:16:20.000000Z\"}}', NULL, '2024-06-01 10:47:38', '2024-06-01 10:47:38'),
(233, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102008\",\"updated_at\":\"2024-06-01T13:47:46.000000Z\"},\"old\":{\"code\":\"120008\",\"updated_at\":\"2024-06-01T12:14:47.000000Z\"}}', NULL, '2024-06-01 10:47:46', '2024-06-01 10:47:46'),
(234, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"102009\",\"updated_at\":\"2024-06-01T13:47:53.000000Z\"},\"old\":{\"code\":\"120009\",\"updated_at\":\"2024-06-01T12:14:28.000000Z\"}}', NULL, '2024-06-01 10:47:53', '2024-06-01 10:47:53'),
(235, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"103\",\"updated_at\":\"2024-06-01T13:48:07.000000Z\"},\"old\":{\"code\":\"13\",\"updated_at\":\"2024-06-01T09:37:59.000000Z\"}}', NULL, '2024-06-01 10:48:07', '2024-06-01 10:48:07');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(236, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"103001\",\"updated_at\":\"2024-06-01T13:48:25.000000Z\"},\"old\":{\"code\":\"130001\",\"updated_at\":\"2024-06-01T12:14:21.000000Z\"}}', NULL, '2024-06-01 10:48:25', '2024-06-01 10:48:25'),
(237, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"104\",\"updated_at\":\"2024-06-01T13:48:45.000000Z\"},\"old\":{\"code\":\"14\",\"updated_at\":\"2024-06-01T09:40:07.000000Z\"}}', NULL, '2024-06-01 10:48:45', '2024-06-01 10:48:45'),
(238, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"104001\",\"updated_at\":\"2024-06-01T13:49:02.000000Z\"},\"old\":{\"code\":\"140001\",\"updated_at\":\"2024-06-01T12:14:11.000000Z\"}}', NULL, '2024-06-01 10:49:02', '2024-06-01 10:49:02'),
(239, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"20\",\"updated_at\":\"2024-06-01T13:49:24.000000Z\"},\"old\":{\"code\":\"2\",\"updated_at\":\"2024-06-01T13:33:54.000000Z\"}}', NULL, '2024-06-01 10:49:24', '2024-06-01 10:49:24'),
(240, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"201\",\"updated_at\":\"2024-06-01T13:49:51.000000Z\"},\"old\":{\"code\":\"21\",\"updated_at\":\"2024-06-01T13:34:13.000000Z\"}}', NULL, '2024-06-01 10:49:51', '2024-06-01 10:49:51'),
(241, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"202\",\"updated_at\":\"2024-06-01T13:52:05.000000Z\"},\"old\":{\"code\":\"22\",\"updated_at\":\"2024-06-01T10:02:41.000000Z\"}}', NULL, '2024-06-01 10:52:05', '2024-06-01 10:52:05'),
(242, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"202001\",\"updated_at\":\"2024-06-01T13:52:26.000000Z\"},\"old\":{\"code\":\"220001\",\"updated_at\":\"2024-06-01T12:13:18.000000Z\"}}', NULL, '2024-06-01 10:52:26', '2024-06-01 10:52:26'),
(243, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"202002\",\"updated_at\":\"2024-06-01T13:52:42.000000Z\"},\"old\":{\"code\":\"220002\",\"updated_at\":\"2024-06-01T12:13:10.000000Z\"}}', NULL, '2024-06-01 10:52:42', '2024-06-01 10:52:42'),
(244, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"202003\",\"updated_at\":\"2024-06-01T13:52:53.000000Z\"},\"old\":{\"code\":\"220003\",\"updated_at\":\"2024-06-01T12:13:01.000000Z\"}}', NULL, '2024-06-01 10:52:53', '2024-06-01 10:52:53'),
(245, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"202004\",\"updated_at\":\"2024-06-01T13:53:01.000000Z\"},\"old\":{\"code\":\"220004\",\"updated_at\":\"2024-06-01T12:12:53.000000Z\"}}', NULL, '2024-06-01 10:53:01', '2024-06-01 10:53:01'),
(246, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"202005\",\"updated_at\":\"2024-06-01T13:53:08.000000Z\"},\"old\":{\"code\":\"220005\",\"updated_at\":\"2024-06-01T12:12:45.000000Z\"}}', NULL, '2024-06-01 10:53:08', '2024-06-01 10:53:08'),
(247, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"202006\",\"updated_at\":\"2024-06-01T13:53:14.000000Z\"},\"old\":{\"code\":\"220006\",\"updated_at\":\"2024-06-01T12:12:37.000000Z\"}}', NULL, '2024-06-01 10:53:14', '2024-06-01 10:53:14'),
(248, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"203\",\"updated_at\":\"2024-06-01T13:53:29.000000Z\"},\"old\":{\"code\":\"23\",\"updated_at\":\"2024-06-01T10:31:55.000000Z\"}}', NULL, '2024-06-01 10:53:29', '2024-06-01 10:53:29'),
(249, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"203001\",\"updated_at\":\"2024-06-01T13:53:45.000000Z\"},\"old\":{\"code\":\"230001\",\"updated_at\":\"2024-06-01T12:12:30.000000Z\"}}', NULL, '2024-06-01 10:53:45', '2024-06-01 10:53:45'),
(250, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 26, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"203002\",\"updated_at\":\"2024-06-01T13:53:56.000000Z\"},\"old\":{\"code\":\"230002\",\"updated_at\":\"2024-06-01T12:12:21.000000Z\"}}', NULL, '2024-06-01 10:53:56', '2024-06-01 10:53:56'),
(251, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"203003\",\"updated_at\":\"2024-06-01T13:54:04.000000Z\"},\"old\":{\"code\":\"230003\",\"updated_at\":\"2024-06-01T12:12:12.000000Z\"}}', NULL, '2024-06-01 10:54:04', '2024-06-01 10:54:04'),
(252, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 28, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"203004\",\"updated_at\":\"2024-06-01T13:54:11.000000Z\"},\"old\":{\"code\":\"230004\",\"updated_at\":\"2024-06-01T12:12:01.000000Z\"}}', NULL, '2024-06-01 10:54:11', '2024-06-01 10:54:11'),
(253, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"204\",\"updated_at\":\"2024-06-01T13:54:41.000000Z\"},\"old\":{\"code\":\"24\",\"updated_at\":\"2024-06-01T10:46:16.000000Z\"}}', NULL, '2024-06-01 10:54:41', '2024-06-01 10:54:41'),
(254, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"204001\",\"updated_at\":\"2024-06-01T13:55:08.000000Z\"},\"old\":{\"code\":\"240001\",\"updated_at\":\"2024-06-01T12:10:35.000000Z\"}}', NULL, '2024-06-01 10:55:08', '2024-06-01 10:55:08'),
(255, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 34, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"204003\",\"updated_at\":\"2024-06-01T13:55:29.000000Z\"},\"old\":{\"code\":\"240003\",\"updated_at\":\"2024-06-01T12:10:56.000000Z\"}}', NULL, '2024-06-01 10:55:29', '2024-06-01 10:55:29'),
(256, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"204004\",\"updated_at\":\"2024-06-01T13:55:37.000000Z\"},\"old\":{\"code\":\"240004\",\"updated_at\":\"2024-06-01T12:11:03.000000Z\"}}', NULL, '2024-06-01 10:55:37', '2024-06-01 10:55:37'),
(257, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"204005\",\"updated_at\":\"2024-06-01T13:55:47.000000Z\"},\"old\":{\"code\":\"240005\",\"updated_at\":\"2024-06-01T12:11:11.000000Z\"}}', NULL, '2024-06-01 10:55:47', '2024-06-01 10:55:47'),
(258, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"205\",\"updated_at\":\"2024-06-01T13:56:09.000000Z\"},\"old\":{\"code\":\"25\",\"updated_at\":\"2024-06-01T10:48:50.000000Z\"}}', NULL, '2024-06-01 10:56:09', '2024-06-01 10:56:09'),
(259, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"206\",\"updated_at\":\"2024-06-01T13:56:20.000000Z\"},\"old\":{\"code\":\"26\",\"updated_at\":\"2024-06-01T10:49:17.000000Z\"}}', NULL, '2024-06-01 10:56:20', '2024-06-01 10:56:20'),
(260, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"207\",\"updated_at\":\"2024-06-01T13:56:29.000000Z\"},\"old\":{\"code\":\"27\",\"updated_at\":\"2024-06-01T10:50:23.000000Z\"}}', NULL, '2024-06-01 10:56:29', '2024-06-01 10:56:29'),
(261, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 29, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"207001\",\"updated_at\":\"2024-06-01T13:56:57.000000Z\"},\"old\":{\"code\":\"270001\",\"updated_at\":\"2024-06-01T12:11:53.000000Z\"}}', NULL, '2024-06-01 10:56:57', '2024-06-01 10:56:57'),
(262, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"207002\",\"updated_at\":\"2024-06-01T13:57:04.000000Z\"},\"old\":{\"code\":\"270002\",\"updated_at\":\"2024-06-01T12:11:45.000000Z\"}}', NULL, '2024-06-01 10:57:04', '2024-06-01 10:57:04'),
(263, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"207003\",\"updated_at\":\"2024-06-01T13:57:11.000000Z\"},\"old\":{\"code\":\"270003\",\"updated_at\":\"2024-06-01T12:11:36.000000Z\"}}', NULL, '2024-06-01 10:57:11', '2024-06-01 10:57:11'),
(264, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208\",\"updated_at\":\"2024-06-01T13:57:35.000000Z\"},\"old\":{\"code\":\"28\",\"updated_at\":\"2024-06-01T11:29:59.000000Z\"}}', NULL, '2024-06-01 10:57:35', '2024-06-01 10:57:35'),
(265, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208001\",\"updated_at\":\"2024-06-01T13:57:57.000000Z\"},\"old\":{\"code\":\"280001\",\"updated_at\":\"2024-06-01T12:04:38.000000Z\"}}', NULL, '2024-06-01 10:57:57', '2024-06-01 10:57:57'),
(266, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 38, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208002\",\"updated_at\":\"2024-06-01T13:58:03.000000Z\"},\"old\":{\"code\":\"280002\",\"updated_at\":\"2024-06-01T12:08:31.000000Z\"}}', NULL, '2024-06-01 10:58:03', '2024-06-01 10:58:03'),
(267, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 39, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208003\",\"updated_at\":\"2024-06-01T13:58:11.000000Z\"},\"old\":{\"code\":\"280003\",\"updated_at\":\"2024-06-01T12:08:49.000000Z\"}}', NULL, '2024-06-01 10:58:11', '2024-06-01 10:58:11'),
(268, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 40, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208004\",\"updated_at\":\"2024-06-01T13:58:18.000000Z\"},\"old\":{\"code\":\"280004\",\"updated_at\":\"2024-06-01T12:08:58.000000Z\"}}', NULL, '2024-06-01 10:58:18', '2024-06-01 10:58:18'),
(269, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 41, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208005\",\"updated_at\":\"2024-06-01T13:58:27.000000Z\"},\"old\":{\"code\":\"280005\",\"updated_at\":\"2024-06-01T12:09:06.000000Z\"}}', NULL, '2024-06-01 10:58:27', '2024-06-01 10:58:27'),
(270, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 42, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208006\",\"updated_at\":\"2024-06-01T13:58:33.000000Z\"},\"old\":{\"code\":\"280006\",\"updated_at\":\"2024-06-01T12:09:14.000000Z\"}}', NULL, '2024-06-01 10:58:33', '2024-06-01 10:58:33'),
(271, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208007\",\"updated_at\":\"2024-06-01T13:58:39.000000Z\"},\"old\":{\"code\":\"280007\",\"updated_at\":\"2024-06-01T12:09:29.000000Z\"}}', NULL, '2024-06-01 10:58:39', '2024-06-01 10:58:39'),
(272, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208008\",\"updated_at\":\"2024-06-01T13:58:45.000000Z\"},\"old\":{\"code\":\"280008\",\"updated_at\":\"2024-06-01T12:09:38.000000Z\"}}', NULL, '2024-06-01 10:58:45', '2024-06-01 10:58:45'),
(273, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208009\",\"updated_at\":\"2024-06-01T13:58:52.000000Z\"},\"old\":{\"code\":\"280009\",\"updated_at\":\"2024-06-01T12:09:53.000000Z\"}}', NULL, '2024-06-01 10:58:52', '2024-06-01 10:58:52'),
(274, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208010\",\"updated_at\":\"2024-06-01T13:59:02.000000Z\"},\"old\":{\"code\":\"280010\",\"updated_at\":\"2024-06-01T12:10:00.000000Z\"}}', NULL, '2024-06-01 10:59:02', '2024-06-01 10:59:02'),
(275, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 47, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208011\",\"updated_at\":\"2024-06-01T13:59:10.000000Z\"},\"old\":{\"code\":\"280011\",\"updated_at\":\"2024-06-01T12:10:09.000000Z\"}}', NULL, '2024-06-01 10:59:10', '2024-06-01 10:59:10'),
(276, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 48, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208012\",\"updated_at\":\"2024-06-01T13:59:17.000000Z\"},\"old\":{\"code\":\"280012\",\"updated_at\":\"2024-06-01T12:27:30.000000Z\"}}', NULL, '2024-06-01 10:59:17', '2024-06-01 10:59:17'),
(277, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 49, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208013\",\"updated_at\":\"2024-06-01T13:59:25.000000Z\"},\"old\":{\"code\":\"280013\",\"updated_at\":\"2024-06-01T12:28:06.000000Z\"}}', NULL, '2024-06-01 10:59:25', '2024-06-01 10:59:25'),
(278, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 50, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208014\",\"updated_at\":\"2024-06-01T13:59:31.000000Z\"},\"old\":{\"code\":\"280014\",\"updated_at\":\"2024-06-01T12:29:15.000000Z\"}}', NULL, '2024-06-01 10:59:31', '2024-06-01 10:59:31'),
(279, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 51, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208015\",\"updated_at\":\"2024-06-01T13:59:37.000000Z\"},\"old\":{\"code\":\"280015\",\"updated_at\":\"2024-06-01T12:29:44.000000Z\"}}', NULL, '2024-06-01 10:59:37', '2024-06-01 10:59:37'),
(280, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 52, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208016\",\"updated_at\":\"2024-06-01T13:59:43.000000Z\"},\"old\":{\"code\":\"280016\",\"updated_at\":\"2024-06-01T12:30:30.000000Z\"}}', NULL, '2024-06-01 10:59:43', '2024-06-01 10:59:43'),
(281, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 53, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208017\",\"updated_at\":\"2024-06-01T13:59:48.000000Z\"},\"old\":{\"code\":\"280017\",\"updated_at\":\"2024-06-01T12:31:00.000000Z\"}}', NULL, '2024-06-01 10:59:48', '2024-06-01 10:59:48'),
(282, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 54, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208018\",\"updated_at\":\"2024-06-01T13:59:54.000000Z\"},\"old\":{\"code\":\"280018\",\"updated_at\":\"2024-06-01T12:31:57.000000Z\"}}', NULL, '2024-06-01 10:59:54', '2024-06-01 10:59:54'),
(283, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 55, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208019\",\"updated_at\":\"2024-06-01T13:59:59.000000Z\"},\"old\":{\"code\":\"280019\",\"updated_at\":\"2024-06-01T12:32:42.000000Z\"}}', NULL, '2024-06-01 11:00:00', '2024-06-01 11:00:00'),
(284, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 56, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208020\",\"updated_at\":\"2024-06-01T14:00:10.000000Z\"},\"old\":{\"code\":\"280020\",\"updated_at\":\"2024-06-01T12:33:19.000000Z\"}}', NULL, '2024-06-01 11:00:10', '2024-06-01 11:00:10'),
(285, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 57, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208021\",\"updated_at\":\"2024-06-01T14:00:15.000000Z\"},\"old\":{\"code\":\"280021\",\"updated_at\":\"2024-06-01T12:33:55.000000Z\"}}', NULL, '2024-06-01 11:00:15', '2024-06-01 11:00:15'),
(286, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 58, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208022\",\"updated_at\":\"2024-06-01T14:00:21.000000Z\"},\"old\":{\"code\":\"280022\",\"updated_at\":\"2024-06-01T12:34:31.000000Z\"}}', NULL, '2024-06-01 11:00:21', '2024-06-01 11:00:21'),
(287, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 59, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208023\",\"updated_at\":\"2024-06-01T14:00:26.000000Z\"},\"old\":{\"code\":\"280023\",\"updated_at\":\"2024-06-01T12:35:00.000000Z\"}}', NULL, '2024-06-01 11:00:26', '2024-06-01 11:00:26'),
(288, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 60, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"208024\",\"updated_at\":\"2024-06-01T14:00:31.000000Z\"},\"old\":{\"code\":\"280024\",\"updated_at\":\"2024-06-01T12:35:21.000000Z\"}}', NULL, '2024-06-01 11:00:31', '2024-06-01 11:00:31'),
(289, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209\",\"updated_at\":\"2024-06-01T14:00:51.000000Z\"},\"old\":{\"code\":\"29\",\"updated_at\":\"2024-06-01T12:36:25.000000Z\"}}', NULL, '2024-06-01 11:00:51', '2024-06-01 11:00:51'),
(290, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 61, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209001\",\"updated_at\":\"2024-06-01T14:01:33.000000Z\"},\"old\":{\"code\":\"290001\",\"updated_at\":\"2024-06-01T13:06:17.000000Z\"}}', NULL, '2024-06-01 11:01:33', '2024-06-01 11:01:33'),
(291, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 62, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209002\",\"updated_at\":\"2024-06-01T14:01:39.000000Z\"},\"old\":{\"code\":\"290002\",\"updated_at\":\"2024-06-01T12:43:53.000000Z\"}}', NULL, '2024-06-01 11:01:39', '2024-06-01 11:01:39'),
(292, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 63, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209003\",\"updated_at\":\"2024-06-01T14:01:44.000000Z\"},\"old\":{\"code\":\"290003\",\"updated_at\":\"2024-06-01T13:06:02.000000Z\"}}', NULL, '2024-06-01 11:01:44', '2024-06-01 11:01:44'),
(293, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 64, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209004\",\"updated_at\":\"2024-06-01T14:01:49.000000Z\"},\"old\":{\"code\":\"290004\",\"updated_at\":\"2024-06-01T13:05:52.000000Z\"}}', NULL, '2024-06-01 11:01:49', '2024-06-01 11:01:49'),
(294, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 65, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209005\",\"updated_at\":\"2024-06-01T14:02:02.000000Z\"},\"old\":{\"code\":\"290005\",\"updated_at\":\"2024-06-01T13:05:41.000000Z\"}}', NULL, '2024-06-01 11:02:02', '2024-06-01 11:02:02'),
(295, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 66, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209006\",\"updated_at\":\"2024-06-01T14:07:58.000000Z\"},\"old\":{\"code\":\"290006\",\"updated_at\":\"2024-06-01T13:05:32.000000Z\"}}', NULL, '2024-06-01 11:07:58', '2024-06-01 11:07:58'),
(296, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 67, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209007\",\"updated_at\":\"2024-06-01T14:08:04.000000Z\"},\"old\":{\"code\":\"290007\",\"updated_at\":\"2024-06-01T13:05:24.000000Z\"}}', NULL, '2024-06-01 11:08:04', '2024-06-01 11:08:04'),
(297, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 68, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209008\",\"updated_at\":\"2024-06-01T14:08:10.000000Z\"},\"old\":{\"code\":\"290008\",\"updated_at\":\"2024-06-01T13:05:18.000000Z\"}}', NULL, '2024-06-01 11:08:10', '2024-06-01 11:08:10'),
(298, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 69, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209009\",\"updated_at\":\"2024-06-01T14:08:16.000000Z\"},\"old\":{\"code\":\"290009\",\"updated_at\":\"2024-06-01T13:05:11.000000Z\"}}', NULL, '2024-06-01 11:08:16', '2024-06-01 11:08:16'),
(299, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 70, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209010\",\"updated_at\":\"2024-06-01T14:08:22.000000Z\"},\"old\":{\"code\":\"290010\",\"updated_at\":\"2024-06-01T13:05:04.000000Z\"}}', NULL, '2024-06-01 11:08:22', '2024-06-01 11:08:22'),
(300, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 71, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209011\",\"updated_at\":\"2024-06-01T14:08:28.000000Z\"},\"old\":{\"code\":\"290011\",\"updated_at\":\"2024-06-01T13:04:40.000000Z\"}}', NULL, '2024-06-01 11:08:28', '2024-06-01 11:08:28'),
(301, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 72, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209012\",\"updated_at\":\"2024-06-01T14:08:33.000000Z\"},\"old\":{\"code\":\"290012\",\"updated_at\":\"2024-06-01T13:04:30.000000Z\"}}', NULL, '2024-06-01 11:08:33', '2024-06-01 11:08:33'),
(302, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 73, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209013\",\"updated_at\":\"2024-06-01T14:08:41.000000Z\"},\"old\":{\"code\":\"290013\",\"updated_at\":\"2024-06-01T13:04:21.000000Z\"}}', NULL, '2024-06-01 11:08:41', '2024-06-01 11:08:41'),
(303, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 74, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209014\",\"updated_at\":\"2024-06-01T14:08:47.000000Z\"},\"old\":{\"code\":\"290014\",\"updated_at\":\"2024-06-01T13:04:10.000000Z\"}}', NULL, '2024-06-01 11:08:47', '2024-06-01 11:08:47'),
(304, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 75, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209015\",\"updated_at\":\"2024-06-01T14:08:52.000000Z\"},\"old\":{\"code\":\"290015\",\"updated_at\":\"2024-06-01T12:55:59.000000Z\"}}', NULL, '2024-06-01 11:08:52', '2024-06-01 11:08:52'),
(305, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 76, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209016\",\"updated_at\":\"2024-06-01T14:09:00.000000Z\"},\"old\":{\"code\":\"290016\",\"updated_at\":\"2024-06-01T13:03:59.000000Z\"}}', NULL, '2024-06-01 11:09:00', '2024-06-01 11:09:00'),
(306, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 77, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209017\",\"updated_at\":\"2024-06-01T14:09:05.000000Z\"},\"old\":{\"code\":\"290017\",\"updated_at\":\"2024-06-01T13:03:45.000000Z\"}}', NULL, '2024-06-01 11:09:05', '2024-06-01 11:09:05'),
(307, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 78, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209018\",\"updated_at\":\"2024-06-01T14:09:09.000000Z\"},\"old\":{\"code\":\"290018\",\"updated_at\":\"2024-06-01T13:03:36.000000Z\"}}', NULL, '2024-06-01 11:09:09', '2024-06-01 11:09:09'),
(308, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 79, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209019\",\"updated_at\":\"2024-06-01T14:09:14.000000Z\"},\"old\":{\"code\":\"290019\",\"updated_at\":\"2024-06-01T13:03:28.000000Z\"}}', NULL, '2024-06-01 11:09:14', '2024-06-01 11:09:14'),
(309, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 81, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209021\",\"updated_at\":\"2024-06-01T14:09:24.000000Z\"},\"old\":{\"code\":\"290021\",\"updated_at\":\"2024-06-01T13:07:08.000000Z\"}}', NULL, '2024-06-01 11:09:24', '2024-06-01 11:09:24'),
(310, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 82, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209022\",\"updated_at\":\"2024-06-01T14:09:32.000000Z\"},\"old\":{\"code\":\"290022\",\"updated_at\":\"2024-06-01T13:08:00.000000Z\"}}', NULL, '2024-06-01 11:09:32', '2024-06-01 11:09:32'),
(311, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 83, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209023\",\"updated_at\":\"2024-06-01T14:09:40.000000Z\"},\"old\":{\"code\":\"290023\",\"updated_at\":\"2024-06-01T13:08:36.000000Z\"}}', NULL, '2024-06-01 11:09:40', '2024-06-01 11:09:40'),
(312, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 84, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"209024\",\"updated_at\":\"2024-06-01T14:09:45.000000Z\"},\"old\":{\"code\":\"290024\",\"updated_at\":\"2024-06-01T13:09:04.000000Z\"}}', NULL, '2024-06-01 11:09:45', '2024-06-01 11:09:45'),
(313, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 18, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":18,\"name\":\"\\u0641\\u064a\\u0632\\u0627 1\",\"code\":\"2010\",\"status\":0,\"class_id\":1,\"parent_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-01T14:14:10.000000Z\",\"updated_at\":\"2024-06-01T14:14:10.000000Z\"}}', NULL, '2024-06-01 11:14:10', '2024-06-01 11:14:10'),
(314, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1100000\",\"updated_at\":\"2024-06-02T07:10:08.000000Z\"},\"old\":{\"code\":\"10\",\"updated_at\":\"2024-06-01T13:42:35.000000Z\"}}', NULL, '2024-06-02 04:10:08', '2024-06-02 04:10:08'),
(315, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10\",\"updated_at\":\"2024-06-02T07:10:34.000000Z\"},\"old\":{\"code\":\"1100000\",\"updated_at\":\"2024-06-02T07:10:08.000000Z\"}}', NULL, '2024-06-02 04:10:34', '2024-06-02 04:10:34'),
(316, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100\",\"updated_at\":\"2024-06-02T07:10:45.000000Z\"},\"old\":{\"code\":\"10\",\"updated_at\":\"2024-06-02T07:10:34.000000Z\"}}', NULL, '2024-06-02 04:10:45', '2024-06-02 04:10:45'),
(317, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"10\",\"updated_at\":\"2024-06-02T07:11:25.000000Z\"},\"old\":{\"code\":\"100\",\"updated_at\":\"2024-06-02T07:10:45.000000Z\"}}', NULL, '2024-06-02 04:11:26', '2024-06-02 04:11:26'),
(318, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 19, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":19,\"name\":\"\\u0627\\u0644\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645\\u0627\\u062a\",\"code\":\"30\",\"status\":1,\"class_id\":2,\"parent_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:16:15.000000Z\",\"updated_at\":\"2024-06-02T07:16:15.000000Z\"}}', NULL, '2024-06-02 04:16:15', '2024-06-02 04:16:15'),
(319, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 20, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":20,\"name\":\"\\u0631\\u0627\\u0633 \\u0627\\u0644\\u0645\\u0627\\u0644\",\"code\":\"301\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:16:56.000000Z\",\"updated_at\":\"2024-06-02T07:16:56.000000Z\"}}', NULL, '2024-06-02 04:16:56', '2024-06-02 04:16:56'),
(320, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 86, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":86,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u062e\\u0627\\u0644\\u062f\",\"status\":1,\"code\":\"301001\",\"type_id\":20,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:19:56.000000Z\",\"updated_at\":\"2024-06-02T07:19:56.000000Z\"}}', NULL, '2024-06-02 04:19:56', '2024-06-02 04:19:56'),
(321, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 87, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":87,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0646\\u0648\\u0631  \\u0631\\u0627\\u0633 \\u0627\\u0644\\u0645\\u0627\\u0644\",\"status\":1,\"code\":\"301002\",\"type_id\":20,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:22:16.000000Z\",\"updated_at\":\"2024-06-02T07:22:16.000000Z\"}}', NULL, '2024-06-02 04:22:16', '2024-06-02 04:22:16'),
(322, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 21, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":21,\"name\":\"\\u062d\\u0633\\u0627\\u0628\\u0627\\u062a \\u0627\\u0644\\u0623\\u0631\\u0628\\u0627\\u062d \\u0627\\u0644\\u0645\\u062d\\u062a\\u062c\\u0632\\u0629\",\"code\":\"302\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:25:15.000000Z\",\"updated_at\":\"2024-06-02T07:25:15.000000Z\"}}', NULL, '2024-06-02 04:25:15', '2024-06-02 04:25:15'),
(323, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 88, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":88,\"name\":\"\\u0645\\u0643\\u0627\\u0633\\u0628 \\u0648 \\u062e\\u0633\\u0627\\u0626\\u0631 \\u0633\\u0646\\u0648\\u0627\\u062a \\u0633\\u0627\\u0628\\u0642\\u0647\",\"status\":1,\"code\":\"302001\",\"type_id\":21,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:26:29.000000Z\",\"updated_at\":\"2024-06-02T07:26:29.000000Z\"}}', NULL, '2024-06-02 04:26:29', '2024-06-02 04:26:29'),
(324, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 22, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":22,\"name\":\"\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0627\\u0621\",\"code\":\"303\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:29:09.000000Z\",\"updated_at\":\"2024-06-02T07:29:09.000000Z\"}}', NULL, '2024-06-02 04:29:09', '2024-06-02 04:29:09'),
(325, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 89, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":89,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u062e\\u0627\\u0644\\u062f - \\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0627\\u0621\",\"status\":0,\"code\":\"303001\",\"type_id\":22,\"deleted_at\":null,\"created_at\":\"2024-06-02T07:30:08.000000Z\",\"updated_at\":\"2024-06-02T07:30:08.000000Z\"}}', NULL, '2024-06-02 04:30:08', '2024-06-02 04:30:08'),
(326, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 89, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-02T07:30:18.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-02T07:30:08.000000Z\"}}', NULL, '2024-06-02 04:30:18', '2024-06-02 04:30:18'),
(327, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 23, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":23,\"name\":\"\\u0642\\u0633\\u0645 \\u0627\\u0644\\u0636\\u0631\\u0627\\u0626\\u0628\",\"code\":\"304\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T08:21:38.000000Z\",\"updated_at\":\"2024-06-02T08:21:38.000000Z\"}}', NULL, '2024-06-02 05:21:38', '2024-06-02 05:21:38'),
(328, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 90, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":90,\"name\":\"\\u0636\\u0631\\u064a\\u0628\\u0647 \\u0627\\u0644\\u062e\\u0635\\u0645 \\u0648\\u0627\\u0644\\u0627\\u0636\\u0627\\u0641\\u0647\",\"status\":1,\"code\":\"304001\",\"type_id\":23,\"deleted_at\":null,\"created_at\":\"2024-06-02T08:24:47.000000Z\",\"updated_at\":\"2024-06-02T08:24:47.000000Z\"}}', NULL, '2024-06-02 05:24:47', '2024-06-02 05:24:47'),
(329, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 91, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":91,\"name\":\"\\u0636\\u0631\\u0633\\u064a\\u0647 \\u0627\\u0644\\u0642\\u064a\\u0645\\u0647 \\u0627\\u0644\\u0645\\u0636\\u0627\\u0641\\u0629\",\"status\":1,\"code\":\"304002\",\"type_id\":23,\"deleted_at\":null,\"created_at\":\"2024-06-02T08:27:29.000000Z\",\"updated_at\":\"2024-06-02T08:27:29.000000Z\"}}', NULL, '2024-06-02 05:27:29', '2024-06-02 05:27:29'),
(330, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 92, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":92,\"name\":\"\\u0636\\u0631\\u064a\\u0628\\u0647 \\u0627\\u0644\\u062f\\u062e\\u0644\",\"status\":1,\"code\":\"304003\",\"type_id\":23,\"deleted_at\":null,\"created_at\":\"2024-06-02T08:45:34.000000Z\",\"updated_at\":\"2024-06-02T08:45:34.000000Z\"}}', NULL, '2024-06-02 05:45:34', '2024-06-02 05:45:34'),
(331, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-02T08:55:03.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-01T14:14:10.000000Z\"}}', NULL, '2024-06-02 05:55:03', '2024-06-02 05:55:03'),
(332, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":0,\"updated_at\":\"2024-06-02T08:55:21.000000Z\"},\"old\":{\"status\":1,\"updated_at\":\"2024-06-02T08:55:03.000000Z\"}}', NULL, '2024-06-02 05:55:21', '2024-06-02 05:55:21'),
(333, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000\",\"updated_at\":\"2024-06-02T09:01:26.000000Z\"},\"old\":{\"code\":\"10\",\"updated_at\":\"2024-06-02T07:11:25.000000Z\"}}', NULL, '2024-06-02 06:01:26', '2024-06-02 06:01:26'),
(334, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000001\",\"updated_at\":\"2024-06-02T09:01:40.000000Z\"},\"old\":{\"code\":\"101\",\"updated_at\":\"2024-06-01T13:42:46.000000Z\"}}', NULL, '2024-06-02 06:01:40', '2024-06-02 06:01:40'),
(335, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000002\",\"updated_at\":\"2024-06-02T09:02:24.000000Z\"},\"old\":{\"code\":\"102\",\"updated_at\":\"2024-06-01T13:42:58.000000Z\"}}', NULL, '2024-06-02 06:02:24', '2024-06-02 06:02:24'),
(336, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"1000002001\",\"updated_at\":\"2024-06-02T09:03:06.000000Z\"},\"old\":{\"code\":\"102001\",\"updated_at\":\"2024-06-01T13:46:07.000000Z\"}}', NULL, '2024-06-02 06:03:06', '2024-06-02 06:03:06'),
(337, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100\",\"updated_at\":\"2024-06-02T09:03:40.000000Z\"},\"old\":{\"code\":\"1000\",\"updated_at\":\"2024-06-02T09:01:26.000000Z\"}}', NULL, '2024-06-02 06:03:40', '2024-06-02 06:03:40'),
(338, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100001\",\"updated_at\":\"2024-06-02T09:03:55.000000Z\"},\"old\":{\"code\":\"1000001\",\"updated_at\":\"2024-06-02T09:01:40.000000Z\"}}', NULL, '2024-06-02 06:03:55', '2024-06-02 06:03:55'),
(339, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002\",\"updated_at\":\"2024-06-02T09:04:14.000000Z\"},\"old\":{\"code\":\"1000002\",\"updated_at\":\"2024-06-02T09:02:24.000000Z\"}}', NULL, '2024-06-02 06:04:14', '2024-06-02 06:04:14'),
(340, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002001\",\"updated_at\":\"2024-06-02T09:04:46.000000Z\"},\"old\":{\"code\":\"1000002001\",\"updated_at\":\"2024-06-02T09:03:06.000000Z\"}}', NULL, '2024-06-02 06:04:46', '2024-06-02 06:04:46'),
(341, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002002\",\"updated_at\":\"2024-06-02T09:04:58.000000Z\"},\"old\":{\"code\":\"102002\",\"updated_at\":\"2024-06-01T13:46:20.000000Z\"}}', NULL, '2024-06-02 06:04:58', '2024-06-02 06:04:58'),
(342, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002003\",\"updated_at\":\"2024-06-02T09:05:14.000000Z\"},\"old\":{\"code\":\"102003\",\"updated_at\":\"2024-06-01T13:46:27.000000Z\"}}', NULL, '2024-06-02 06:05:14', '2024-06-02 06:05:14'),
(343, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002004\",\"updated_at\":\"2024-06-02T09:05:40.000000Z\"},\"old\":{\"code\":\"102004\",\"updated_at\":\"2024-06-01T13:47:11.000000Z\"}}', NULL, '2024-06-02 06:05:40', '2024-06-02 06:05:40'),
(344, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002005\",\"updated_at\":\"2024-06-02T09:05:51.000000Z\"},\"old\":{\"code\":\"102005\",\"updated_at\":\"2024-06-01T13:47:18.000000Z\"}}', NULL, '2024-06-02 06:05:51', '2024-06-02 06:05:51'),
(345, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002006\",\"updated_at\":\"2024-06-02T09:06:04.000000Z\"},\"old\":{\"code\":\"102006\",\"updated_at\":\"2024-06-01T13:47:31.000000Z\"}}', NULL, '2024-06-02 06:06:04', '2024-06-02 06:06:04'),
(346, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002007\",\"updated_at\":\"2024-06-02T09:06:14.000000Z\"},\"old\":{\"code\":\"102007\",\"updated_at\":\"2024-06-01T13:47:38.000000Z\"}}', NULL, '2024-06-02 06:06:14', '2024-06-02 06:06:14'),
(347, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 8, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002008\",\"updated_at\":\"2024-06-02T09:06:26.000000Z\"},\"old\":{\"code\":\"102008\",\"updated_at\":\"2024-06-01T13:47:46.000000Z\"}}', NULL, '2024-06-02 06:06:26', '2024-06-02 06:06:26'),
(348, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100002009\",\"updated_at\":\"2024-06-02T09:06:38.000000Z\"},\"old\":{\"code\":\"102009\",\"updated_at\":\"2024-06-01T13:47:53.000000Z\"}}', NULL, '2024-06-02 06:06:39', '2024-06-02 06:06:39'),
(349, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100003\",\"updated_at\":\"2024-06-02T09:06:58.000000Z\"},\"old\":{\"code\":\"103\",\"updated_at\":\"2024-06-01T13:48:07.000000Z\"}}', NULL, '2024-06-02 06:06:58', '2024-06-02 06:06:58'),
(350, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100004\",\"updated_at\":\"2024-06-02T09:07:09.000000Z\"},\"old\":{\"code\":\"104\",\"updated_at\":\"2024-06-01T13:48:45.000000Z\"}}', NULL, '2024-06-02 06:07:09', '2024-06-02 06:07:09'),
(351, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100003001\",\"updated_at\":\"2024-06-02T09:07:29.000000Z\"},\"old\":{\"code\":\"103001\",\"updated_at\":\"2024-06-01T13:48:25.000000Z\"}}', NULL, '2024-06-02 06:07:29', '2024-06-02 06:07:29'),
(352, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"100004001\",\"updated_at\":\"2024-06-02T09:07:40.000000Z\"},\"old\":{\"code\":\"104001\",\"updated_at\":\"2024-06-01T13:49:02.000000Z\"}}', NULL, '2024-06-02 06:07:40', '2024-06-02 06:07:40'),
(353, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 6, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200\",\"updated_at\":\"2024-06-02T09:08:22.000000Z\"},\"old\":{\"code\":\"20\",\"updated_at\":\"2024-06-01T13:49:24.000000Z\"}}', NULL, '2024-06-02 06:08:22', '2024-06-02 06:08:22'),
(354, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200001\",\"updated_at\":\"2024-06-02T09:08:41.000000Z\"},\"old\":{\"code\":\"201\",\"updated_at\":\"2024-06-01T13:49:51.000000Z\"}}', NULL, '2024-06-02 06:08:41', '2024-06-02 06:08:41'),
(355, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200002\",\"updated_at\":\"2024-06-02T09:09:30.000000Z\"},\"old\":{\"code\":\"202\",\"updated_at\":\"2024-06-01T13:52:05.000000Z\"}}', NULL, '2024-06-02 06:09:30', '2024-06-02 06:09:30'),
(356, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200002001\",\"updated_at\":\"2024-06-02T09:09:53.000000Z\"},\"old\":{\"code\":\"202001\",\"updated_at\":\"2024-06-01T13:52:26.000000Z\"}}', NULL, '2024-06-02 06:09:53', '2024-06-02 06:09:53'),
(357, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200002002\",\"updated_at\":\"2024-06-02T09:10:04.000000Z\"},\"old\":{\"code\":\"202002\",\"updated_at\":\"2024-06-01T13:52:42.000000Z\"}}', NULL, '2024-06-02 06:10:04', '2024-06-02 06:10:04'),
(358, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200002003\",\"updated_at\":\"2024-06-02T09:10:14.000000Z\"},\"old\":{\"code\":\"202003\",\"updated_at\":\"2024-06-01T13:52:53.000000Z\"}}', NULL, '2024-06-02 06:10:14', '2024-06-02 06:10:14'),
(359, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200002004\",\"updated_at\":\"2024-06-02T09:10:25.000000Z\"},\"old\":{\"code\":\"202004\",\"updated_at\":\"2024-06-01T13:53:01.000000Z\"}}', NULL, '2024-06-02 06:10:25', '2024-06-02 06:10:25'),
(360, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200002005\",\"updated_at\":\"2024-06-02T09:10:37.000000Z\"},\"old\":{\"code\":\"202005\",\"updated_at\":\"2024-06-01T13:53:08.000000Z\"}}', NULL, '2024-06-02 06:10:37', '2024-06-02 06:10:37'),
(361, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 24, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200002006\",\"updated_at\":\"2024-06-02T09:10:47.000000Z\"},\"old\":{\"code\":\"202006\",\"updated_at\":\"2024-06-01T13:53:14.000000Z\"}}', NULL, '2024-06-02 06:10:47', '2024-06-02 06:10:47'),
(362, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200003\",\"updated_at\":\"2024-06-02T09:11:06.000000Z\"},\"old\":{\"code\":\"203\",\"updated_at\":\"2024-06-01T13:53:29.000000Z\"}}', NULL, '2024-06-02 06:11:06', '2024-06-02 06:11:06'),
(363, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 25, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200003001\",\"updated_at\":\"2024-06-02T09:11:32.000000Z\"},\"old\":{\"code\":\"203001\",\"updated_at\":\"2024-06-01T13:53:45.000000Z\"}}', NULL, '2024-06-02 06:11:32', '2024-06-02 06:11:32'),
(364, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 26, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200003002\",\"updated_at\":\"2024-06-02T09:11:47.000000Z\"},\"old\":{\"code\":\"203002\",\"updated_at\":\"2024-06-01T13:53:56.000000Z\"}}', NULL, '2024-06-02 06:11:47', '2024-06-02 06:11:47'),
(365, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 27, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200003003\",\"updated_at\":\"2024-06-02T09:11:58.000000Z\"},\"old\":{\"code\":\"203003\",\"updated_at\":\"2024-06-01T13:54:04.000000Z\"}}', NULL, '2024-06-02 06:11:58', '2024-06-02 06:11:58');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(366, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 28, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200003004\",\"updated_at\":\"2024-06-02T09:12:09.000000Z\"},\"old\":{\"code\":\"203004\",\"updated_at\":\"2024-06-01T13:54:11.000000Z\"}}', NULL, '2024-06-02 06:12:09', '2024-06-02 06:12:09'),
(367, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200004\",\"updated_at\":\"2024-06-02T09:12:39.000000Z\"},\"old\":{\"code\":\"204\",\"updated_at\":\"2024-06-01T13:54:41.000000Z\"}}', NULL, '2024-06-02 06:12:39', '2024-06-02 06:12:39'),
(368, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200004001\",\"updated_at\":\"2024-06-02T09:13:06.000000Z\"},\"old\":{\"code\":\"204001\",\"updated_at\":\"2024-06-01T13:55:08.000000Z\"}}', NULL, '2024-06-02 06:13:06', '2024-06-02 06:13:06'),
(369, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200004002\",\"updated_at\":\"2024-06-02T09:13:22.000000Z\"},\"old\":{\"code\":\"240002\",\"updated_at\":\"2024-06-01T12:10:49.000000Z\"}}', NULL, '2024-06-02 06:13:22', '2024-06-02 06:13:22'),
(370, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 34, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200004003\",\"updated_at\":\"2024-06-02T09:13:40.000000Z\"},\"old\":{\"code\":\"204003\",\"updated_at\":\"2024-06-01T13:55:29.000000Z\"}}', NULL, '2024-06-02 06:13:40', '2024-06-02 06:13:40'),
(371, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 35, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200004004\",\"updated_at\":\"2024-06-02T09:13:50.000000Z\"},\"old\":{\"code\":\"204004\",\"updated_at\":\"2024-06-01T13:55:37.000000Z\"}}', NULL, '2024-06-02 06:13:50', '2024-06-02 06:13:50'),
(372, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200004005\",\"updated_at\":\"2024-06-02T09:14:01.000000Z\"},\"old\":{\"code\":\"204005\",\"updated_at\":\"2024-06-01T13:55:47.000000Z\"}}', NULL, '2024-06-02 06:14:01', '2024-06-02 06:14:01'),
(373, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 12, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200005\",\"updated_at\":\"2024-06-02T09:14:54.000000Z\"},\"old\":{\"code\":\"205\",\"updated_at\":\"2024-06-01T13:56:09.000000Z\"}}', NULL, '2024-06-02 06:14:54', '2024-06-02 06:14:54'),
(374, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 13, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200006\",\"updated_at\":\"2024-06-02T09:15:04.000000Z\"},\"old\":{\"code\":\"206\",\"updated_at\":\"2024-06-01T13:56:20.000000Z\"}}', NULL, '2024-06-02 06:15:04', '2024-06-02 06:15:04'),
(375, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 14, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200007\",\"updated_at\":\"2024-06-02T09:15:11.000000Z\"},\"old\":{\"code\":\"207\",\"updated_at\":\"2024-06-01T13:56:29.000000Z\"}}', NULL, '2024-06-02 06:15:11', '2024-06-02 06:15:11'),
(376, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 29, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200007001\",\"updated_at\":\"2024-06-02T09:15:29.000000Z\"},\"old\":{\"code\":\"207001\",\"updated_at\":\"2024-06-01T13:56:57.000000Z\"}}', NULL, '2024-06-02 06:15:29', '2024-06-02 06:15:29'),
(377, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 30, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200007002\",\"updated_at\":\"2024-06-02T09:15:38.000000Z\"},\"old\":{\"code\":\"207002\",\"updated_at\":\"2024-06-01T13:57:04.000000Z\"}}', NULL, '2024-06-02 06:15:38', '2024-06-02 06:15:38'),
(378, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200007003\",\"updated_at\":\"2024-06-02T09:15:48.000000Z\"},\"old\":{\"code\":\"207003\",\"updated_at\":\"2024-06-01T13:57:11.000000Z\"}}', NULL, '2024-06-02 06:15:48', '2024-06-02 06:15:48'),
(379, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008\",\"updated_at\":\"2024-06-02T09:16:26.000000Z\"},\"old\":{\"code\":\"208\",\"updated_at\":\"2024-06-01T13:57:35.000000Z\"}}', NULL, '2024-06-02 06:16:26', '2024-06-02 06:16:26'),
(380, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 37, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008001\",\"updated_at\":\"2024-06-02T09:16:50.000000Z\"},\"old\":{\"code\":\"208001\",\"updated_at\":\"2024-06-01T13:57:57.000000Z\"}}', NULL, '2024-06-02 06:16:50', '2024-06-02 06:16:50'),
(381, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 38, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008002\",\"updated_at\":\"2024-06-02T09:17:05.000000Z\"},\"old\":{\"code\":\"208002\",\"updated_at\":\"2024-06-01T13:58:03.000000Z\"}}', NULL, '2024-06-02 06:17:05', '2024-06-02 06:17:05'),
(382, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 39, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008003\",\"updated_at\":\"2024-06-02T09:17:16.000000Z\"},\"old\":{\"code\":\"208003\",\"updated_at\":\"2024-06-01T13:58:11.000000Z\"}}', NULL, '2024-06-02 06:17:16', '2024-06-02 06:17:16'),
(383, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 40, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008004\",\"updated_at\":\"2024-06-02T09:17:26.000000Z\"},\"old\":{\"code\":\"208004\",\"updated_at\":\"2024-06-01T13:58:18.000000Z\"}}', NULL, '2024-06-02 06:17:26', '2024-06-02 06:17:26'),
(384, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 41, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008005\",\"updated_at\":\"2024-06-02T09:17:36.000000Z\"},\"old\":{\"code\":\"208005\",\"updated_at\":\"2024-06-01T13:58:27.000000Z\"}}', NULL, '2024-06-02 06:17:36', '2024-06-02 06:17:36'),
(385, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 42, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008006\",\"updated_at\":\"2024-06-02T09:17:46.000000Z\"},\"old\":{\"code\":\"208006\",\"updated_at\":\"2024-06-01T13:58:33.000000Z\"}}', NULL, '2024-06-02 06:17:46', '2024-06-02 06:17:46'),
(386, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 43, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008007\",\"updated_at\":\"2024-06-02T09:17:55.000000Z\"},\"old\":{\"code\":\"208007\",\"updated_at\":\"2024-06-01T13:58:39.000000Z\"}}', NULL, '2024-06-02 06:17:56', '2024-06-02 06:17:56'),
(387, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 44, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008008\",\"updated_at\":\"2024-06-02T09:18:08.000000Z\"},\"old\":{\"code\":\"208008\",\"updated_at\":\"2024-06-01T13:58:45.000000Z\"}}', NULL, '2024-06-02 06:18:08', '2024-06-02 06:18:08'),
(388, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008009\",\"updated_at\":\"2024-06-02T09:18:21.000000Z\"},\"old\":{\"code\":\"208009\",\"updated_at\":\"2024-06-01T13:58:52.000000Z\"}}', NULL, '2024-06-02 06:18:21', '2024-06-02 06:18:21'),
(389, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 46, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008010\",\"updated_at\":\"2024-06-02T09:18:33.000000Z\"},\"old\":{\"code\":\"208010\",\"updated_at\":\"2024-06-01T13:59:02.000000Z\"}}', NULL, '2024-06-02 06:18:33', '2024-06-02 06:18:33'),
(390, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 47, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008011\",\"updated_at\":\"2024-06-02T09:18:45.000000Z\"},\"old\":{\"code\":\"208011\",\"updated_at\":\"2024-06-01T13:59:10.000000Z\"}}', NULL, '2024-06-02 06:18:45', '2024-06-02 06:18:45'),
(391, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 48, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008012\",\"updated_at\":\"2024-06-02T09:18:54.000000Z\"},\"old\":{\"code\":\"208012\",\"updated_at\":\"2024-06-01T13:59:17.000000Z\"}}', NULL, '2024-06-02 06:18:54', '2024-06-02 06:18:54'),
(392, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 49, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008013\",\"updated_at\":\"2024-06-02T09:19:05.000000Z\"},\"old\":{\"code\":\"208013\",\"updated_at\":\"2024-06-01T13:59:25.000000Z\"}}', NULL, '2024-06-02 06:19:05', '2024-06-02 06:19:05'),
(393, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 50, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008014\",\"updated_at\":\"2024-06-02T09:19:21.000000Z\"},\"old\":{\"code\":\"208014\",\"updated_at\":\"2024-06-01T13:59:31.000000Z\"}}', NULL, '2024-06-02 06:19:21', '2024-06-02 06:19:21'),
(394, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 51, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008015\",\"updated_at\":\"2024-06-02T09:19:35.000000Z\"},\"old\":{\"code\":\"208015\",\"updated_at\":\"2024-06-01T13:59:37.000000Z\"}}', NULL, '2024-06-02 06:19:35', '2024-06-02 06:19:35'),
(395, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 52, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008016\",\"updated_at\":\"2024-06-02T09:19:45.000000Z\"},\"old\":{\"code\":\"208016\",\"updated_at\":\"2024-06-01T13:59:43.000000Z\"}}', NULL, '2024-06-02 06:19:45', '2024-06-02 06:19:45'),
(396, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 53, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008017\",\"updated_at\":\"2024-06-02T09:19:55.000000Z\"},\"old\":{\"code\":\"208017\",\"updated_at\":\"2024-06-01T13:59:48.000000Z\"}}', NULL, '2024-06-02 06:19:55', '2024-06-02 06:19:55'),
(397, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 54, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008018\",\"updated_at\":\"2024-06-02T09:20:06.000000Z\"},\"old\":{\"code\":\"208018\",\"updated_at\":\"2024-06-01T13:59:54.000000Z\"}}', NULL, '2024-06-02 06:20:06', '2024-06-02 06:20:06'),
(398, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 55, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008019\",\"updated_at\":\"2024-06-02T09:20:17.000000Z\"},\"old\":{\"code\":\"208019\",\"updated_at\":\"2024-06-01T13:59:59.000000Z\"}}', NULL, '2024-06-02 06:20:17', '2024-06-02 06:20:17'),
(399, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 56, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008020\",\"updated_at\":\"2024-06-02T09:20:26.000000Z\"},\"old\":{\"code\":\"208020\",\"updated_at\":\"2024-06-01T14:00:10.000000Z\"}}', NULL, '2024-06-02 06:20:26', '2024-06-02 06:20:26'),
(400, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 57, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008021\",\"updated_at\":\"2024-06-02T09:20:37.000000Z\"},\"old\":{\"code\":\"208021\",\"updated_at\":\"2024-06-01T14:00:15.000000Z\"}}', NULL, '2024-06-02 06:20:37', '2024-06-02 06:20:37'),
(401, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 58, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008022\",\"updated_at\":\"2024-06-02T09:20:46.000000Z\"},\"old\":{\"code\":\"208022\",\"updated_at\":\"2024-06-01T14:00:21.000000Z\"}}', NULL, '2024-06-02 06:20:46', '2024-06-02 06:20:46'),
(402, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 59, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008023\",\"updated_at\":\"2024-06-02T09:20:55.000000Z\"},\"old\":{\"code\":\"208023\",\"updated_at\":\"2024-06-01T14:00:26.000000Z\"}}', NULL, '2024-06-02 06:20:55', '2024-06-02 06:20:55'),
(403, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 60, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200008024\",\"updated_at\":\"2024-06-02T09:21:04.000000Z\"},\"old\":{\"code\":\"208024\",\"updated_at\":\"2024-06-01T14:00:31.000000Z\"}}', NULL, '2024-06-02 06:21:04', '2024-06-02 06:21:04'),
(404, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009\",\"updated_at\":\"2024-06-02T09:21:23.000000Z\"},\"old\":{\"code\":\"209\",\"updated_at\":\"2024-06-01T14:00:51.000000Z\"}}', NULL, '2024-06-02 06:21:23', '2024-06-02 06:21:23'),
(405, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 61, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009001\",\"updated_at\":\"2024-06-02T09:21:41.000000Z\"},\"old\":{\"code\":\"209001\",\"updated_at\":\"2024-06-01T14:01:33.000000Z\"}}', NULL, '2024-06-02 06:21:41', '2024-06-02 06:21:41'),
(406, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 62, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009002\",\"updated_at\":\"2024-06-02T09:21:51.000000Z\"},\"old\":{\"code\":\"209002\",\"updated_at\":\"2024-06-01T14:01:39.000000Z\"}}', NULL, '2024-06-02 06:21:51', '2024-06-02 06:21:51'),
(407, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 63, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009003\",\"updated_at\":\"2024-06-02T09:22:00.000000Z\"},\"old\":{\"code\":\"209003\",\"updated_at\":\"2024-06-01T14:01:44.000000Z\"}}', NULL, '2024-06-02 06:22:00', '2024-06-02 06:22:00'),
(408, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 64, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009004\",\"updated_at\":\"2024-06-02T09:22:10.000000Z\"},\"old\":{\"code\":\"209004\",\"updated_at\":\"2024-06-01T14:01:49.000000Z\"}}', NULL, '2024-06-02 06:22:11', '2024-06-02 06:22:11'),
(409, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 65, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009005\",\"updated_at\":\"2024-06-02T09:22:20.000000Z\"},\"old\":{\"code\":\"209005\",\"updated_at\":\"2024-06-01T14:02:02.000000Z\"}}', NULL, '2024-06-02 06:22:20', '2024-06-02 06:22:20'),
(410, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 66, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009006\",\"updated_at\":\"2024-06-02T09:22:30.000000Z\"},\"old\":{\"code\":\"209006\",\"updated_at\":\"2024-06-01T14:07:58.000000Z\"}}', NULL, '2024-06-02 06:22:30', '2024-06-02 06:22:30'),
(411, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 67, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009007\",\"updated_at\":\"2024-06-02T09:22:40.000000Z\"},\"old\":{\"code\":\"209007\",\"updated_at\":\"2024-06-01T14:08:04.000000Z\"}}', NULL, '2024-06-02 06:22:41', '2024-06-02 06:22:41'),
(412, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 68, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009008\",\"updated_at\":\"2024-06-02T09:22:52.000000Z\"},\"old\":{\"code\":\"209008\",\"updated_at\":\"2024-06-01T14:08:10.000000Z\"}}', NULL, '2024-06-02 06:22:52', '2024-06-02 06:22:52'),
(413, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 69, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009009\",\"updated_at\":\"2024-06-02T09:23:02.000000Z\"},\"old\":{\"code\":\"209009\",\"updated_at\":\"2024-06-01T14:08:16.000000Z\"}}', NULL, '2024-06-02 06:23:02', '2024-06-02 06:23:02'),
(414, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 70, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009010\",\"updated_at\":\"2024-06-02T09:23:12.000000Z\"},\"old\":{\"code\":\"209010\",\"updated_at\":\"2024-06-01T14:08:22.000000Z\"}}', NULL, '2024-06-02 06:23:12', '2024-06-02 06:23:12'),
(415, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 71, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009011\",\"updated_at\":\"2024-06-02T09:23:22.000000Z\"},\"old\":{\"code\":\"209011\",\"updated_at\":\"2024-06-01T14:08:28.000000Z\"}}', NULL, '2024-06-02 06:23:22', '2024-06-02 06:23:22'),
(416, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 72, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009012\",\"updated_at\":\"2024-06-02T09:23:32.000000Z\"},\"old\":{\"code\":\"209012\",\"updated_at\":\"2024-06-01T14:08:33.000000Z\"}}', NULL, '2024-06-02 06:23:33', '2024-06-02 06:23:33'),
(417, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 73, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009013\",\"updated_at\":\"2024-06-02T09:23:43.000000Z\"},\"old\":{\"code\":\"209013\",\"updated_at\":\"2024-06-01T14:08:41.000000Z\"}}', NULL, '2024-06-02 06:23:43', '2024-06-02 06:23:43'),
(418, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 74, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009014\",\"updated_at\":\"2024-06-02T09:23:55.000000Z\"},\"old\":{\"code\":\"209014\",\"updated_at\":\"2024-06-01T14:08:47.000000Z\"}}', NULL, '2024-06-02 06:23:55', '2024-06-02 06:23:55'),
(419, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 75, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009015\",\"updated_at\":\"2024-06-02T09:24:17.000000Z\"},\"old\":{\"code\":\"209015\",\"updated_at\":\"2024-06-01T14:08:52.000000Z\"}}', NULL, '2024-06-02 06:24:17', '2024-06-02 06:24:17'),
(420, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 76, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009016\",\"updated_at\":\"2024-06-02T09:24:27.000000Z\"},\"old\":{\"code\":\"209016\",\"updated_at\":\"2024-06-01T14:09:00.000000Z\"}}', NULL, '2024-06-02 06:24:27', '2024-06-02 06:24:27'),
(421, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 77, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009017\",\"updated_at\":\"2024-06-02T09:24:38.000000Z\"},\"old\":{\"code\":\"209017\",\"updated_at\":\"2024-06-01T14:09:05.000000Z\"}}', NULL, '2024-06-02 06:24:38', '2024-06-02 06:24:38'),
(422, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 78, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009018\",\"updated_at\":\"2024-06-02T09:24:48.000000Z\"},\"old\":{\"code\":\"209018\",\"updated_at\":\"2024-06-01T14:09:09.000000Z\"}}', NULL, '2024-06-02 06:24:48', '2024-06-02 06:24:48'),
(423, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 79, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009019\",\"updated_at\":\"2024-06-02T09:25:00.000000Z\"},\"old\":{\"code\":\"209019\",\"updated_at\":\"2024-06-01T14:09:14.000000Z\"}}', NULL, '2024-06-02 06:25:00', '2024-06-02 06:25:00'),
(424, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 80, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009020\",\"updated_at\":\"2024-06-02T09:25:11.000000Z\"},\"old\":{\"code\":\"290020\",\"updated_at\":\"2024-06-01T13:03:20.000000Z\"}}', NULL, '2024-06-02 06:25:11', '2024-06-02 06:25:11'),
(425, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 81, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009021\",\"updated_at\":\"2024-06-02T09:25:21.000000Z\"},\"old\":{\"code\":\"209021\",\"updated_at\":\"2024-06-01T14:09:24.000000Z\"}}', NULL, '2024-06-02 06:25:21', '2024-06-02 06:25:21'),
(426, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 82, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009022\",\"updated_at\":\"2024-06-02T09:25:38.000000Z\"},\"old\":{\"code\":\"209022\",\"updated_at\":\"2024-06-01T14:09:32.000000Z\"}}', NULL, '2024-06-02 06:25:38', '2024-06-02 06:25:38'),
(427, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 83, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009023\",\"updated_at\":\"2024-06-02T09:25:56.000000Z\"},\"old\":{\"code\":\"209023\",\"updated_at\":\"2024-06-01T14:09:40.000000Z\"}}', NULL, '2024-06-02 06:25:56', '2024-06-02 06:25:56'),
(428, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 84, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200009024\",\"updated_at\":\"2024-06-02T09:26:07.000000Z\"},\"old\":{\"code\":\"209024\",\"updated_at\":\"2024-06-01T14:09:45.000000Z\"}}', NULL, '2024-06-02 06:26:07', '2024-06-02 06:26:07'),
(429, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200010\",\"updated_at\":\"2024-06-02T09:26:30.000000Z\"},\"old\":{\"code\":\"2010\",\"updated_at\":\"2024-06-02T08:55:21.000000Z\"}}', NULL, '2024-06-02 06:26:30', '2024-06-02 06:26:30'),
(430, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"2000\",\"status\":1,\"updated_at\":\"2024-06-02T09:26:38.000000Z\"},\"old\":{\"code\":\"200010\",\"status\":0,\"updated_at\":\"2024-06-02T09:26:30.000000Z\"}}', NULL, '2024-06-02 06:26:38', '2024-06-02 06:26:38'),
(431, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"200010\",\"status\":0,\"updated_at\":\"2024-06-02T09:27:04.000000Z\"},\"old\":{\"code\":\"2000\",\"status\":1,\"updated_at\":\"2024-06-02T09:26:38.000000Z\"}}', NULL, '2024-06-02 06:27:04', '2024-06-02 06:27:04'),
(432, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 18, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-02T09:27:22.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-02T09:27:04.000000Z\"}}', NULL, '2024-06-02 06:27:22', '2024-06-02 06:27:22'),
(433, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 93, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":93,\"name\":\"\\u0641\\u064a\\u0632\\u0627 \\/ \\u0627\\u0633\\u0644\\u0627\\u0645\",\"status\":0,\"code\":\"20001001\",\"type_id\":18,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:30:13.000000Z\",\"updated_at\":\"2024-06-02T09:30:13.000000Z\"}}', NULL, '2024-06-02 06:30:13', '2024-06-02 06:30:13'),
(434, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 93, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"code\":\"200010001\",\"updated_at\":\"2024-06-02T09:31:19.000000Z\"},\"old\":{\"status\":0,\"code\":\"20001001\",\"updated_at\":\"2024-06-02T09:30:13.000000Z\"}}', NULL, '2024-06-02 06:31:19', '2024-06-02 06:31:19'),
(435, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 19, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300\",\"updated_at\":\"2024-06-02T09:32:32.000000Z\"},\"old\":{\"code\":\"30\",\"updated_at\":\"2024-06-02T07:16:15.000000Z\"}}', NULL, '2024-06-02 06:32:32', '2024-06-02 06:32:32'),
(436, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 20, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300001\",\"updated_at\":\"2024-06-02T09:32:46.000000Z\"},\"old\":{\"code\":\"301\",\"updated_at\":\"2024-06-02T07:16:56.000000Z\"}}', NULL, '2024-06-02 06:32:46', '2024-06-02 06:32:46'),
(437, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 86, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300001001\",\"updated_at\":\"2024-06-02T09:33:21.000000Z\"},\"old\":{\"code\":\"301001\",\"updated_at\":\"2024-06-02T07:19:56.000000Z\"}}', NULL, '2024-06-02 06:33:21', '2024-06-02 06:33:21'),
(438, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 87, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300001002\",\"updated_at\":\"2024-06-02T09:33:52.000000Z\"},\"old\":{\"code\":\"301002\",\"updated_at\":\"2024-06-02T07:22:16.000000Z\"}}', NULL, '2024-06-02 06:33:52', '2024-06-02 06:33:52'),
(439, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 21, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300002\",\"updated_at\":\"2024-06-02T09:34:16.000000Z\"},\"old\":{\"code\":\"302\",\"updated_at\":\"2024-06-02T07:25:15.000000Z\"}}', NULL, '2024-06-02 06:34:16', '2024-06-02 06:34:16'),
(440, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 88, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300002001\",\"updated_at\":\"2024-06-02T09:34:36.000000Z\"},\"old\":{\"code\":\"302001\",\"updated_at\":\"2024-06-02T07:26:29.000000Z\"}}', NULL, '2024-06-02 06:34:36', '2024-06-02 06:34:36'),
(441, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 22, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300003\",\"updated_at\":\"2024-06-02T09:35:09.000000Z\"},\"old\":{\"code\":\"303\",\"updated_at\":\"2024-06-02T07:29:09.000000Z\"}}', NULL, '2024-06-02 06:35:09', '2024-06-02 06:35:09'),
(442, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 89, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300003001\",\"updated_at\":\"2024-06-02T09:35:28.000000Z\"},\"old\":{\"code\":\"303001\",\"updated_at\":\"2024-06-02T07:30:18.000000Z\"}}', NULL, '2024-06-02 06:35:28', '2024-06-02 06:35:28'),
(443, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 23, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300004\",\"updated_at\":\"2024-06-02T09:35:48.000000Z\"},\"old\":{\"code\":\"304\",\"updated_at\":\"2024-06-02T08:21:38.000000Z\"}}', NULL, '2024-06-02 06:35:48', '2024-06-02 06:35:48'),
(444, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 90, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300004001\",\"updated_at\":\"2024-06-02T09:36:03.000000Z\"},\"old\":{\"code\":\"304001\",\"updated_at\":\"2024-06-02T08:24:47.000000Z\"}}', NULL, '2024-06-02 06:36:03', '2024-06-02 06:36:03'),
(445, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 91, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300004002\",\"updated_at\":\"2024-06-02T09:36:13.000000Z\"},\"old\":{\"code\":\"304002\",\"updated_at\":\"2024-06-02T08:27:29.000000Z\"}}', NULL, '2024-06-02 06:36:13', '2024-06-02 06:36:13'),
(446, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 92, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"300004003\",\"updated_at\":\"2024-06-02T09:36:23.000000Z\"},\"old\":{\"code\":\"304003\",\"updated_at\":\"2024-06-02T08:45:34.000000Z\"}}', NULL, '2024-06-02 06:36:23', '2024-06-02 06:36:23'),
(447, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 24, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":24,\"name\":\"\\u062f\\u0627\\u0626\\u0646\\u0649 \\u0627\\u0644\\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u062c\\u0648\\u064a\\u0647\",\"code\":\"300005\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:46:28.000000Z\",\"updated_at\":\"2024-06-02T09:46:28.000000Z\"}}', NULL, '2024-06-02 06:46:28', '2024-06-02 06:46:28'),
(448, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 94, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":94,\"name\":\"\\u0628\\u0649 \\u0627\\u0633 \\u0628\\u0649\",\"status\":1,\"code\":\"300005001\",\"type_id\":24,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:47:12.000000Z\",\"updated_at\":\"2024-06-02T09:47:12.000000Z\"}}', NULL, '2024-06-02 06:47:12', '2024-06-02 06:47:12'),
(449, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 95, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":95,\"name\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0647 \\u0644\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\",\"status\":1,\"code\":\"300005002\",\"type_id\":24,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:47:43.000000Z\",\"updated_at\":\"2024-06-02T09:47:43.000000Z\"}}', NULL, '2024-06-02 06:47:44', '2024-06-02 06:47:44'),
(450, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 96, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":96,\"name\":\"\\u0641\\u0644\\u0627\\u0649 \\u062f\\u0628\\u0649\",\"status\":1,\"code\":\"300005003\",\"type_id\":24,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:48:29.000000Z\",\"updated_at\":\"2024-06-02T09:48:29.000000Z\"}}', NULL, '2024-06-02 06:48:29', '2024-06-02 06:48:29'),
(451, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 97, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":97,\"name\":\"\\u0637\\u064a\\u0631\\u0627\\u0646 \\u0627\\u0644\\u062c\\u0632\\u064a\\u0631\\u0647\",\"status\":1,\"code\":\"300005004\",\"type_id\":24,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:50:44.000000Z\",\"updated_at\":\"2024-06-02T09:50:44.000000Z\"}}', NULL, '2024-06-02 06:50:44', '2024-06-02 06:50:44'),
(452, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 98, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":98,\"name\":\"\\u0646\\u0627\\u0633 \\u0644\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\",\"status\":1,\"code\":\"300005005\",\"type_id\":24,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:51:27.000000Z\",\"updated_at\":\"2024-06-02T09:51:27.000000Z\"}}', NULL, '2024-06-02 06:51:28', '2024-06-02 06:51:28'),
(453, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 25, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":25,\"name\":\"\\u0627\\u0644\\u0641\\u0646\\u0627\\u062f\\u0642\",\"code\":\"300006\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T09:53:23.000000Z\",\"updated_at\":\"2024-06-02T09:53:23.000000Z\"}}', NULL, '2024-06-02 06:53:23', '2024-06-02 06:53:23'),
(454, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 99, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":99,\"name\":\"\\u0639\\u0644\\u0649 \\u0628\\u0627\\u0628\\u0627\",\"status\":0,\"code\":\"300006001\",\"type_id\":25,\"deleted_at\":null,\"created_at\":\"2024-06-02T10:01:53.000000Z\",\"updated_at\":\"2024-06-02T10:01:53.000000Z\"}}', NULL, '2024-06-02 07:01:53', '2024-06-02 07:01:53'),
(455, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 99, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-02T10:02:02.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-02T10:01:53.000000Z\"}}', NULL, '2024-06-02 07:02:02', '2024-06-02 07:02:02'),
(456, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 100, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":100,\"name\":\"\\u0639\\u0644\\u0627\\u0621 \\u0627\\u0644\\u062f\\u064a\\u0646\",\"status\":1,\"code\":\"300006002\",\"type_id\":25,\"deleted_at\":null,\"created_at\":\"2024-06-02T10:03:30.000000Z\",\"updated_at\":\"2024-06-02T10:03:30.000000Z\"}}', NULL, '2024-06-02 07:03:30', '2024-06-02 07:03:30'),
(457, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 99, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-02T10:03:49.000000Z\"},\"old\":{\"updated_at\":\"2024-06-02T10:02:02.000000Z\"}}', NULL, '2024-06-02 07:03:49', '2024-06-02 07:03:49'),
(458, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 101, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":101,\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0627\\u0644\\u062c\\u0627\\u0641\\u0649\",\"status\":1,\"code\":\"300006003\",\"type_id\":25,\"deleted_at\":null,\"created_at\":\"2024-06-02T10:04:28.000000Z\",\"updated_at\":\"2024-06-02T10:04:28.000000Z\"}}', NULL, '2024-06-02 07:04:28', '2024-06-02 07:04:28'),
(459, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 99, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0639\\u0644\\u0649 \\u0628\\u0627\\u0628\\u0627\",\"updated_at\":\"2024-06-02T10:04:42.000000Z\"},\"old\":{\"name\":\"\\u0639\\u0644\\u0649 \\u0628\\u0627\\u0628\\u0627\",\"updated_at\":\"2024-06-02T10:03:49.000000Z\"}}', NULL, '2024-06-02 07:04:42', '2024-06-02 07:04:42'),
(460, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 100, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0639\\u0644\\u0627\\u0621 \\u0627\\u0644\\u062f\\u064a\\u0646\",\"updated_at\":\"2024-06-02T10:04:52.000000Z\"},\"old\":{\"name\":\"\\u0639\\u0644\\u0627\\u0621 \\u0627\\u0644\\u062f\\u064a\\u0646\",\"updated_at\":\"2024-06-02T10:03:30.000000Z\"}}', NULL, '2024-06-02 07:04:52', '2024-06-02 07:04:52'),
(461, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 102, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":102,\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0645\\u0627\\u0631\\u064a\\u0646\\u0627 \\u0634\\u0631\\u0645\",\"status\":1,\"code\":\"300006004\",\"type_id\":25,\"deleted_at\":null,\"created_at\":\"2024-06-02T10:05:25.000000Z\",\"updated_at\":\"2024-06-02T10:05:25.000000Z\"}}', NULL, '2024-06-02 07:05:25', '2024-06-02 07:05:25'),
(462, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 26, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":26,\"name\":\"\\u0645\\u0648\\u0631\\u062f \\u0627\\u0644\\u0646\\u0642\\u0644\",\"code\":\"300007\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T10:08:57.000000Z\",\"updated_at\":\"2024-06-02T10:08:57.000000Z\"}}', NULL, '2024-06-02 07:08:57', '2024-06-02 07:08:57'),
(463, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 85, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":85,\"name\":\"\\u0641\\u064a\\u0632\\u0627 \\u0627\\u0633\\u0644\\u0627\\u0645\",\"status\":0,\"code\":\"23001\",\"type_id\":17,\"deleted_at\":\"2024-06-02T11:58:09.000000Z\",\"created_at\":\"2024-06-01T13:35:40.000000Z\",\"updated_at\":\"2024-06-02T11:58:09.000000Z\"}}', NULL, '2024-06-02 08:58:09', '2024-06-02 08:58:09'),
(464, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":0,\"updated_at\":\"2024-06-02T12:51:41.000000Z\"},\"old\":{\"status\":1,\"updated_at\":\"2024-06-02T09:21:23.000000Z\"}}', NULL, '2024-06-02 09:51:41', '2024-06-02 09:51:41'),
(465, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 15, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0647\\u062f \\u0648\\u0633\\u0644\\u0641 \\u0627\\u0644\\u0645\\u0648\\u0638\\u0641\\u064a\\u0646\",\"updated_at\":\"2024-06-02T12:53:35.000000Z\"},\"old\":{\"name\":\"\\u0639\\u0647\\u062f \\u0627\\u0644\\u0645\\u0648\\u0638\\u0641\\u064a\\u0646\",\"updated_at\":\"2024-06-02T09:16:26.000000Z\"}}', NULL, '2024-06-02 09:53:35', '2024-06-02 09:53:35'),
(466, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 16, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-02T12:54:58.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-02T12:51:41.000000Z\"}}', NULL, '2024-06-02 09:54:58', '2024-06-02 09:54:58'),
(467, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 103, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":103,\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u064a\\u0645\\u0648\\u0632\\u064a\\u0646\",\"status\":1,\"code\":\"300007001\",\"type_id\":26,\"deleted_at\":null,\"created_at\":\"2024-06-02T12:59:44.000000Z\",\"updated_at\":\"2024-06-02T12:59:44.000000Z\"}}', NULL, '2024-06-02 09:59:44', '2024-06-02 09:59:44'),
(468, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 27, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":27,\"name\":\"\\u0645\\u0648\\u0631\\u062f\\u0648\\u0646 \\u0627\\u062e\\u0631\\u0648\\u0646\",\"code\":\"300008\",\"status\":1,\"class_id\":2,\"parent_id\":19,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:05:36.000000Z\",\"updated_at\":\"2024-06-02T13:05:36.000000Z\"}}', NULL, '2024-06-02 10:05:36', '2024-06-02 10:05:36'),
(469, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 104, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":104,\"name\":\"\\u0643\\u064a\\u0627\\u0646\",\"status\":1,\"code\":\"300008001\",\"type_id\":27,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:06:22.000000Z\",\"updated_at\":\"2024-06-02T13:06:22.000000Z\"}}', NULL, '2024-06-02 10:06:22', '2024-06-02 10:06:22'),
(470, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 105, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":105,\"name\":\"\\u0641\\u0631\\u0635\\u0647\",\"status\":1,\"code\":\"300008002\",\"type_id\":27,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:06:47.000000Z\",\"updated_at\":\"2024-06-02T13:06:47.000000Z\"}}', NULL, '2024-06-02 10:06:47', '2024-06-02 10:06:47'),
(471, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 106, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":106,\"name\":\"\\u0637\\u0645\\u0648\\u062d\",\"status\":1,\"code\":\"300008003\",\"type_id\":27,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:07:14.000000Z\",\"updated_at\":\"2024-06-02T13:07:14.000000Z\"}}', NULL, '2024-06-02 10:07:14', '2024-06-02 10:07:14'),
(472, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 28, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":28,\"name\":\"\\u0627\\u0644\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u0648\\u0645\\u064a\\u0647\",\"code\":\"400\",\"status\":1,\"class_id\":3,\"parent_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:12:15.000000Z\",\"updated_at\":\"2024-06-02T13:12:15.000000Z\"}}', NULL, '2024-06-02 10:12:15', '2024-06-02 10:12:15'),
(473, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 107, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":107,\"name\":\"\\u0627\\u0644\\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a\",\"status\":1,\"code\":\"400001\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:14:14.000000Z\",\"updated_at\":\"2024-06-02T13:14:14.000000Z\"}}', NULL, '2024-06-02 10:14:14', '2024-06-02 10:14:14'),
(474, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 107, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"40000001\",\"updated_at\":\"2024-06-02T13:14:38.000000Z\"},\"old\":{\"code\":\"400001\",\"updated_at\":\"2024-06-02T13:14:14.000000Z\"}}', NULL, '2024-06-02 10:14:38', '2024-06-02 10:14:38'),
(475, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 108, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":108,\"name\":\"\\u0627\\u0644\\u0645\\u0631\\u062a\\u0628\\u0627\\u062a\",\"status\":1,\"code\":\"40000002\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:15:17.000000Z\",\"updated_at\":\"2024-06-02T13:15:17.000000Z\"}}', NULL, '2024-06-02 10:15:17', '2024-06-02 10:15:17'),
(476, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 109, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":109,\"name\":\"\\u0627\\u0644\\u062a\\u0623\\u0645\\u064a\\u0646\\u0627\\u062a \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0647\",\"status\":1,\"code\":\"40000003\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:16:47.000000Z\",\"updated_at\":\"2024-06-02T13:16:47.000000Z\"}}', NULL, '2024-06-02 10:16:47', '2024-06-02 10:16:47'),
(477, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 110, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":110,\"name\":\"\\u0627\\u0644\\u0645\\u0643\\u0627\\u0641\\u0623\\u062a\",\"status\":1,\"code\":\"40000004\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:17:46.000000Z\",\"updated_at\":\"2024-06-02T13:17:46.000000Z\"}}', NULL, '2024-06-02 10:17:46', '2024-06-02 10:17:46'),
(478, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 111, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":111,\"name\":\"\\u0627\\u0644\\u0639\\u0645\\u0648\\u0644\\u0647\",\"status\":1,\"code\":\"40000005\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:19:29.000000Z\",\"updated_at\":\"2024-06-02T13:19:29.000000Z\"}}', NULL, '2024-06-02 10:19:29', '2024-06-02 10:19:29'),
(479, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 112, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":112,\"name\":\"\\u0628\\u0648\\u0641\\u064a\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"40000006\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:27:48.000000Z\",\"updated_at\":\"2024-06-02T13:27:48.000000Z\"}}', NULL, '2024-06-02 10:27:48', '2024-06-02 10:27:48'),
(480, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 113, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":113,\"name\":\"\\u0628\\u0648\\u0641\\u064a\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"40000007\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:28:45.000000Z\",\"updated_at\":\"2024-06-02T13:28:45.000000Z\"}}', NULL, '2024-06-02 10:28:45', '2024-06-02 10:28:45'),
(481, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 114, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":114,\"name\":\"\\u0645\\u064a\\u0627\\u0647\",\"status\":1,\"code\":\"40000008\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:30:06.000000Z\",\"updated_at\":\"2024-06-02T13:30:06.000000Z\"}}', NULL, '2024-06-02 10:30:06', '2024-06-02 10:30:06'),
(482, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 115, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":115,\"name\":\"\\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621\",\"status\":1,\"code\":\"40000009\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:30:35.000000Z\",\"updated_at\":\"2024-06-02T13:30:35.000000Z\"}}', NULL, '2024-06-02 10:30:35', '2024-06-02 10:30:35'),
(483, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 116, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":116,\"name\":\"\\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u062a\\u0644\\u064a\\u0641\\u0648\\u0646 \\u0627\\u0644\\u0627\\u0631\\u0636\\u0649\",\"status\":1,\"code\":\"40000010\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:31:06.000000Z\",\"updated_at\":\"2024-06-02T13:31:06.000000Z\"}}', NULL, '2024-06-02 10:31:06', '2024-06-02 10:31:06'),
(484, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 117, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":117,\"name\":\"\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0648\\u0628\\u0627\\u064a\\u0644\",\"status\":1,\"code\":\"40000011\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:31:49.000000Z\",\"updated_at\":\"2024-06-02T13:31:49.000000Z\"}}', NULL, '2024-06-02 10:31:49', '2024-06-02 10:31:49'),
(485, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 114, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0645\\u064a\\u0627\\u0647\",\"updated_at\":\"2024-06-02T13:32:14.000000Z\"},\"old\":{\"name\":\"\\u0645\\u064a\\u0627\\u0647\",\"updated_at\":\"2024-06-02T13:30:06.000000Z\"}}', NULL, '2024-06-02 10:32:14', '2024-06-02 10:32:14'),
(486, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 115, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621\",\"updated_at\":\"2024-06-02T13:32:38.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621\",\"updated_at\":\"2024-06-02T13:30:35.000000Z\"}}', NULL, '2024-06-02 10:32:38', '2024-06-02 10:32:38'),
(487, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 118, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":118,\"name\":\"\\u0627\\u0646\\u062a\\u0631\\u0646\\u062a WE\",\"status\":1,\"code\":\"4000012\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:34:30.000000Z\",\"updated_at\":\"2024-06-02T13:34:30.000000Z\"}}', NULL, '2024-06-02 10:34:30', '2024-06-02 10:34:30');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(488, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 119, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":119,\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0646\\u0638\\u0627\\u0641\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"4000013\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:35:51.000000Z\",\"updated_at\":\"2024-06-02T13:35:51.000000Z\"}}', NULL, '2024-06-02 10:35:51', '2024-06-02 10:35:51'),
(489, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 120, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":120,\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0646\\u0638\\u0627\\u0641\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"4000014\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:36:21.000000Z\",\"updated_at\":\"2024-06-02T13:36:21.000000Z\"}}', NULL, '2024-06-02 10:36:21', '2024-06-02 10:36:21'),
(490, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 121, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":121,\"name\":\"\\u0635\\u064a\\u0627\\u0646\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"4000015\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:39:03.000000Z\",\"updated_at\":\"2024-06-02T13:39:03.000000Z\"}}', NULL, '2024-06-02 10:39:03', '2024-06-02 10:39:03'),
(491, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 122, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":122,\"name\":\"\\u0635\\u064a\\u0627\\u0646\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"4000016\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:39:27.000000Z\",\"updated_at\":\"2024-06-02T13:39:27.000000Z\"}}', NULL, '2024-06-02 10:39:27', '2024-06-02 10:39:27'),
(492, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 123, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":123,\"name\":\"\\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0627\\u062a\",\"status\":1,\"code\":\"4000017\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:40:38.000000Z\",\"updated_at\":\"2024-06-02T13:40:38.000000Z\"}}', NULL, '2024-06-02 10:40:38', '2024-06-02 10:40:38'),
(493, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 124, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":124,\"name\":\"\\u0627\\u062f\\u0648\\u0627\\u062a \\u0645\\u0643\\u062a\\u0628\\u064a\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"4000018\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:41:28.000000Z\",\"updated_at\":\"2024-06-02T13:41:28.000000Z\"}}', NULL, '2024-06-02 10:41:28', '2024-06-02 10:41:28'),
(494, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 125, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":125,\"name\":\"\\u0627\\u062f\\u0648\\u0627\\u062a \\u0645\\u0643\\u062a\\u0628\\u064a\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"status\":1,\"code\":\"4000019\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:42:01.000000Z\",\"updated_at\":\"2024-06-02T13:42:01.000000Z\"}}', NULL, '2024-06-02 10:42:01', '2024-06-02 10:42:01'),
(495, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 126, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":126,\"name\":\"\\u0627\\u064a\\u0645\\u064a\\u0644\\u0627\\u062a\",\"status\":1,\"code\":\"4000020\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:42:43.000000Z\",\"updated_at\":\"2024-06-02T13:42:43.000000Z\"}}', NULL, '2024-06-02 10:42:43', '2024-06-02 10:42:43'),
(496, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 127, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":127,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0628\\u0646\\u0643\\u064a\\u0647\",\"status\":1,\"code\":\"4000021\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:43:07.000000Z\",\"updated_at\":\"2024-06-02T13:43:07.000000Z\"}}', NULL, '2024-06-02 10:43:07', '2024-06-02 10:43:07'),
(497, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 128, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":128,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0633\\u0641\\u0631 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"code\":\"4000022\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:43:55.000000Z\",\"updated_at\":\"2024-06-02T13:43:55.000000Z\"}}', NULL, '2024-06-02 10:43:55', '2024-06-02 10:43:55'),
(498, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 129, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":129,\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0633\\u0641\\u0631 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"status\":1,\"code\":\"4000023\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:44:34.000000Z\",\"updated_at\":\"2024-06-02T13:44:34.000000Z\"}}', NULL, '2024-06-02 10:44:34', '2024-06-02 10:44:34'),
(499, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 130, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":130,\"name\":\"\\u0627\\u0643\\u0631\\u0627\\u0645\\u064a\\u0627\\u062a\",\"status\":1,\"code\":\"4000024\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:46:49.000000Z\",\"updated_at\":\"2024-06-02T13:46:49.000000Z\"}}', NULL, '2024-06-02 10:46:49', '2024-06-02 10:46:49'),
(500, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 131, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":131,\"name\":\"\\u0631\\u0633\\u0648\\u0645\",\"status\":1,\"code\":\"4000025\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:47:52.000000Z\",\"updated_at\":\"2024-06-02T13:47:52.000000Z\"}}', NULL, '2024-06-02 10:47:52', '2024-06-02 10:47:52'),
(501, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 132, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":132,\"name\":\"\\u0627\\u062a\\u0639\\u0627\\u0628 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0633\\u0628 \\u0627\\u0644\\u0642\\u0627\\u0646\\u0648\\u0646\\u0649\",\"status\":1,\"code\":\"4000026\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:48:38.000000Z\",\"updated_at\":\"2024-06-02T13:48:38.000000Z\"}}', NULL, '2024-06-02 10:48:38', '2024-06-02 10:48:38'),
(502, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 133, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":133,\"name\":\"\\u0627\\u0644\\u0627\\u064a\\u062c\\u0627\\u0631\",\"status\":1,\"code\":\"4000027\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:49:05.000000Z\",\"updated_at\":\"2024-06-02T13:49:05.000000Z\"}}', NULL, '2024-06-02 10:49:05', '2024-06-02 10:49:05'),
(503, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 134, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":134,\"name\":\"\\u0627\\u062d\\u0628\\u0627\\u0631 \\u0637\\u0627\\u0628\\u0639\\u0627\\u062a\",\"status\":1,\"code\":\"4000028\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:49:54.000000Z\",\"updated_at\":\"2024-06-02T13:49:54.000000Z\"}}', NULL, '2024-06-02 10:49:54', '2024-06-02 10:49:54'),
(504, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 135, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":135,\"name\":\"\\u0627\\u0644\\u0633\\u0648\\u0644\\u0627\\u0631\",\"status\":1,\"code\":\"4000029\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:50:26.000000Z\",\"updated_at\":\"2024-06-02T13:50:26.000000Z\"}}', NULL, '2024-06-02 10:50:27', '2024-06-02 10:50:27'),
(505, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 136, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":136,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0627\\u0644\\u0627\\u0647\\u0644\\u0627\\u0643\",\"status\":1,\"code\":\"4000030\",\"type_id\":28,\"deleted_at\":null,\"created_at\":\"2024-06-02T13:51:32.000000Z\",\"updated_at\":\"2024-06-02T13:51:32.000000Z\"}}', NULL, '2024-06-02 10:51:32', '2024-06-02 10:51:32'),
(506, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 29, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":29,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\",\"code\":\"500\",\"status\":1,\"class_id\":3,\"parent_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-03T09:27:17.000000Z\",\"updated_at\":\"2024-06-03T09:27:17.000000Z\"}}', NULL, '2024-06-03 06:27:17', '2024-06-03 06:27:17'),
(507, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 30, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":30,\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"code\":\"500001\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T09:29:58.000000Z\",\"updated_at\":\"2024-06-03T09:29:58.000000Z\"}}', NULL, '2024-06-03 06:29:58', '2024-06-03 06:29:58'),
(508, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 137, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":137,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"code\":\"500001001\",\"type_id\":30,\"deleted_at\":null,\"created_at\":\"2024-06-03T09:31:40.000000Z\",\"updated_at\":\"2024-06-03T09:31:40.000000Z\"}}', NULL, '2024-06-03 06:31:41', '2024-06-03 06:31:41'),
(509, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 137, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"50000101\",\"updated_at\":\"2024-06-03T09:32:29.000000Z\"},\"old\":{\"code\":\"500001001\",\"updated_at\":\"2024-06-03T09:31:40.000000Z\"}}', NULL, '2024-06-03 06:32:29', '2024-06-03 06:32:29'),
(510, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 107, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000001\",\"updated_at\":\"2024-06-03T09:34:21.000000Z\"},\"old\":{\"code\":\"40000001\",\"updated_at\":\"2024-06-02T13:14:38.000000Z\"}}', NULL, '2024-06-03 06:34:21', '2024-06-03 06:34:21'),
(511, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 108, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000002\",\"updated_at\":\"2024-06-03T09:34:50.000000Z\"},\"old\":{\"code\":\"40000002\",\"updated_at\":\"2024-06-02T13:15:17.000000Z\"}}', NULL, '2024-06-03 06:34:50', '2024-06-03 06:34:50'),
(512, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 109, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000003\",\"updated_at\":\"2024-06-03T09:35:51.000000Z\"},\"old\":{\"code\":\"40000003\",\"updated_at\":\"2024-06-02T13:16:47.000000Z\"}}', NULL, '2024-06-03 06:35:51', '2024-06-03 06:35:51'),
(513, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 110, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000004\",\"updated_at\":\"2024-06-03T09:36:09.000000Z\"},\"old\":{\"code\":\"40000004\",\"updated_at\":\"2024-06-02T13:17:46.000000Z\"}}', NULL, '2024-06-03 06:36:09', '2024-06-03 06:36:09'),
(514, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 111, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000005\",\"updated_at\":\"2024-06-03T09:36:35.000000Z\"},\"old\":{\"code\":\"40000005\",\"updated_at\":\"2024-06-02T13:19:29.000000Z\"}}', NULL, '2024-06-03 06:36:35', '2024-06-03 06:36:35'),
(515, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 112, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000006\",\"updated_at\":\"2024-06-03T09:36:50.000000Z\"},\"old\":{\"code\":\"40000006\",\"updated_at\":\"2024-06-02T13:27:48.000000Z\"}}', NULL, '2024-06-03 06:36:50', '2024-06-03 06:36:50'),
(516, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 113, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000007\",\"updated_at\":\"2024-06-03T09:37:06.000000Z\"},\"old\":{\"code\":\"40000007\",\"updated_at\":\"2024-06-02T13:28:45.000000Z\"}}', NULL, '2024-06-03 06:37:06', '2024-06-03 06:37:06'),
(517, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 114, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000008\",\"updated_at\":\"2024-06-03T09:38:37.000000Z\"},\"old\":{\"code\":\"40000008\",\"updated_at\":\"2024-06-02T13:32:14.000000Z\"}}', NULL, '2024-06-03 06:38:37', '2024-06-03 06:38:37'),
(518, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 115, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000009\",\"updated_at\":\"2024-06-03T09:39:10.000000Z\"},\"old\":{\"code\":\"40000009\",\"updated_at\":\"2024-06-02T13:32:38.000000Z\"}}', NULL, '2024-06-03 06:39:10', '2024-06-03 06:39:10'),
(519, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 116, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000010\",\"updated_at\":\"2024-06-03T09:39:31.000000Z\"},\"old\":{\"code\":\"40000010\",\"updated_at\":\"2024-06-02T13:31:06.000000Z\"}}', NULL, '2024-06-03 06:39:31', '2024-06-03 06:39:31'),
(520, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 117, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000011\",\"updated_at\":\"2024-06-03T09:40:25.000000Z\"},\"old\":{\"code\":\"40000011\",\"updated_at\":\"2024-06-02T13:31:49.000000Z\"}}', NULL, '2024-06-03 06:40:25', '2024-06-03 06:40:25'),
(521, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 118, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"40000012\",\"updated_at\":\"2024-06-03T09:40:41.000000Z\"},\"old\":{\"code\":\"4000012\",\"updated_at\":\"2024-06-02T13:34:30.000000Z\"}}', NULL, '2024-06-03 06:40:41', '2024-06-03 06:40:41'),
(522, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 118, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000012\",\"updated_at\":\"2024-06-03T09:40:56.000000Z\"},\"old\":{\"code\":\"40000012\",\"updated_at\":\"2024-06-03T09:40:41.000000Z\"}}', NULL, '2024-06-03 06:40:56', '2024-06-03 06:40:56'),
(523, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 119, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"40000013\",\"updated_at\":\"2024-06-03T09:41:42.000000Z\"},\"old\":{\"code\":\"4000013\",\"updated_at\":\"2024-06-02T13:35:51.000000Z\"}}', NULL, '2024-06-03 06:41:42', '2024-06-03 06:41:42'),
(524, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 119, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000013\",\"updated_at\":\"2024-06-03T09:42:00.000000Z\"},\"old\":{\"code\":\"40000013\",\"updated_at\":\"2024-06-03T09:41:42.000000Z\"}}', NULL, '2024-06-03 06:42:00', '2024-06-03 06:42:00'),
(525, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 120, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000014\",\"updated_at\":\"2024-06-03T09:42:16.000000Z\"},\"old\":{\"code\":\"4000014\",\"updated_at\":\"2024-06-02T13:36:21.000000Z\"}}', NULL, '2024-06-03 06:42:16', '2024-06-03 06:42:16'),
(526, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 121, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000015\",\"updated_at\":\"2024-06-03T09:42:29.000000Z\"},\"old\":{\"code\":\"4000015\",\"updated_at\":\"2024-06-02T13:39:03.000000Z\"}}', NULL, '2024-06-03 06:42:29', '2024-06-03 06:42:29'),
(527, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 122, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000016\",\"updated_at\":\"2024-06-03T09:42:41.000000Z\"},\"old\":{\"code\":\"4000016\",\"updated_at\":\"2024-06-02T13:39:27.000000Z\"}}', NULL, '2024-06-03 06:42:41', '2024-06-03 06:42:41'),
(528, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 123, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000017\",\"updated_at\":\"2024-06-03T09:42:52.000000Z\"},\"old\":{\"code\":\"4000017\",\"updated_at\":\"2024-06-02T13:40:38.000000Z\"}}', NULL, '2024-06-03 06:42:52', '2024-06-03 06:42:52'),
(529, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 124, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"40000018\",\"updated_at\":\"2024-06-03T09:43:12.000000Z\"},\"old\":{\"code\":\"4000018\",\"updated_at\":\"2024-06-02T13:41:28.000000Z\"}}', NULL, '2024-06-03 06:43:12', '2024-06-03 06:43:12'),
(530, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 125, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000019\",\"updated_at\":\"2024-06-03T09:43:32.000000Z\"},\"old\":{\"code\":\"4000019\",\"updated_at\":\"2024-06-02T13:42:01.000000Z\"}}', NULL, '2024-06-03 06:43:32', '2024-06-03 06:43:32'),
(531, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 126, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000020\",\"updated_at\":\"2024-06-03T09:43:45.000000Z\"},\"old\":{\"code\":\"4000020\",\"updated_at\":\"2024-06-02T13:42:43.000000Z\"}}', NULL, '2024-06-03 06:43:45', '2024-06-03 06:43:45'),
(532, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 127, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000021\",\"updated_at\":\"2024-06-03T09:43:55.000000Z\"},\"old\":{\"code\":\"4000021\",\"updated_at\":\"2024-06-02T13:43:07.000000Z\"}}', NULL, '2024-06-03 06:43:55', '2024-06-03 06:43:55'),
(533, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 128, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000022\",\"updated_at\":\"2024-06-03T09:44:08.000000Z\"},\"old\":{\"code\":\"4000022\",\"updated_at\":\"2024-06-02T13:43:55.000000Z\"}}', NULL, '2024-06-03 06:44:08', '2024-06-03 06:44:08'),
(534, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 129, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000023\",\"updated_at\":\"2024-06-03T09:44:14.000000Z\"},\"old\":{\"code\":\"4000023\",\"updated_at\":\"2024-06-02T13:44:34.000000Z\"}}', NULL, '2024-06-03 06:44:14', '2024-06-03 06:44:14'),
(535, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 130, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000024\",\"updated_at\":\"2024-06-03T09:44:31.000000Z\"},\"old\":{\"code\":\"4000024\",\"updated_at\":\"2024-06-02T13:46:49.000000Z\"}}', NULL, '2024-06-03 06:44:31', '2024-06-03 06:44:31'),
(536, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 131, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000025\",\"updated_at\":\"2024-06-03T09:44:47.000000Z\"},\"old\":{\"code\":\"4000025\",\"updated_at\":\"2024-06-02T13:47:52.000000Z\"}}', NULL, '2024-06-03 06:44:47', '2024-06-03 06:44:47'),
(537, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 132, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000026\",\"updated_at\":\"2024-06-03T09:45:03.000000Z\"},\"old\":{\"code\":\"4000026\",\"updated_at\":\"2024-06-02T13:48:38.000000Z\"}}', NULL, '2024-06-03 06:45:03', '2024-06-03 06:45:03'),
(538, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 133, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000027\",\"updated_at\":\"2024-06-03T09:45:42.000000Z\"},\"old\":{\"code\":\"4000027\",\"updated_at\":\"2024-06-02T13:49:05.000000Z\"}}', NULL, '2024-06-03 06:45:42', '2024-06-03 06:45:42'),
(539, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 134, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000028\",\"updated_at\":\"2024-06-03T09:45:59.000000Z\"},\"old\":{\"code\":\"4000028\",\"updated_at\":\"2024-06-02T13:49:54.000000Z\"}}', NULL, '2024-06-03 06:45:59', '2024-06-03 06:45:59'),
(540, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 135, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000029\",\"updated_at\":\"2024-06-03T09:46:11.000000Z\"},\"old\":{\"code\":\"4000029\",\"updated_at\":\"2024-06-02T13:50:26.000000Z\"}}', NULL, '2024-06-03 06:46:11', '2024-06-03 06:46:11'),
(541, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 136, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"400000030\",\"updated_at\":\"2024-06-03T09:46:20.000000Z\"},\"old\":{\"code\":\"4000030\",\"updated_at\":\"2024-06-02T13:51:32.000000Z\"}}', NULL, '2024-06-03 06:46:20', '2024-06-03 06:46:20'),
(542, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 137, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"code\":\"500001001\",\"updated_at\":\"2024-06-03T09:46:42.000000Z\"},\"old\":{\"code\":\"50000101\",\"updated_at\":\"2024-06-03T09:32:29.000000Z\"}}', NULL, '2024-06-03 06:46:42', '2024-06-03 06:46:42'),
(543, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 138, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":138,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0641\\u064a\\u0632\\u0627 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"code\":\"500001002\",\"type_id\":30,\"deleted_at\":null,\"created_at\":\"2024-06-03T09:55:33.000000Z\",\"updated_at\":\"2024-06-03T09:55:33.000000Z\"}}', NULL, '2024-06-03 06:55:33', '2024-06-03 06:55:33'),
(544, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 138, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":0,\"updated_at\":\"2024-06-03T10:11:35.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0641\\u064a\\u0632\\u0627 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"updated_at\":\"2024-06-03T09:55:33.000000Z\"}}', NULL, '2024-06-03 07:11:35', '2024-06-03 07:11:35'),
(545, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 138, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-03T10:11:44.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-03T10:11:35.000000Z\"}}', NULL, '2024-06-03 07:11:44', '2024-06-03 07:11:44'),
(546, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 31, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":31,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"code\":\"500002\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:13:21.000000Z\",\"updated_at\":\"2024-06-03T10:13:21.000000Z\"}}', NULL, '2024-06-03 07:13:21', '2024-06-03 07:13:21'),
(547, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 31, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T10:13:43.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T10:13:21.000000Z\"}}', NULL, '2024-06-03 07:13:43', '2024-06-03 07:13:43'),
(548, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 139, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":139,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"status\":1,\"code\":\"500002001\",\"type_id\":31,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:14:36.000000Z\",\"updated_at\":\"2024-06-03T10:14:36.000000Z\"}}', NULL, '2024-06-03 07:14:36', '2024-06-03 07:14:36'),
(549, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 140, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":140,\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u0649\",\"status\":1,\"code\":\"500002002\",\"type_id\":31,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:15:56.000000Z\",\"updated_at\":\"2024-06-03T10:15:56.000000Z\"}}', NULL, '2024-06-03 07:15:57', '2024-06-03 07:15:57'),
(550, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 141, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":141,\"name\":\"\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"status\":1,\"code\":\"500002003\",\"type_id\":31,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:16:49.000000Z\",\"updated_at\":\"2024-06-03T10:16:49.000000Z\"}}', NULL, '2024-06-03 07:16:49', '2024-06-03 07:16:49'),
(551, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 142, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":142,\"name\":\"\\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\",\"status\":1,\"code\":\"500002004\",\"type_id\":31,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:17:56.000000Z\",\"updated_at\":\"2024-06-03T10:17:56.000000Z\"}}', NULL, '2024-06-03 07:17:56', '2024-06-03 07:17:56'),
(552, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 32, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":32,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"code\":\"500003\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:22:37.000000Z\",\"updated_at\":\"2024-06-03T10:22:37.000000Z\"}}', NULL, '2024-06-03 07:22:37', '2024-06-03 07:22:37'),
(553, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T10:23:00.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T10:22:37.000000Z\"}}', NULL, '2024-06-03 07:23:00', '2024-06-03 07:23:00'),
(554, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 143, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":143,\"name\":\"\\u062a\\u062f\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"code\":\"500003001\",\"type_id\":32,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:23:52.000000Z\",\"updated_at\":\"2024-06-03T10:23:52.000000Z\"}}', NULL, '2024-06-03 07:23:52', '2024-06-03 07:23:52'),
(555, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 33, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":33,\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"code\":\"500004\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:25:15.000000Z\",\"updated_at\":\"2024-06-03T10:25:15.000000Z\"}}', NULL, '2024-06-03 07:25:15', '2024-06-03 07:25:15'),
(556, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 33, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T10:25:57.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T10:25:15.000000Z\"}}', NULL, '2024-06-03 07:25:57', '2024-06-03 07:25:57'),
(557, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 144, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":144,\"name\":\"\\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"status\":1,\"code\":\"500004001\",\"type_id\":33,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:26:45.000000Z\",\"updated_at\":\"2024-06-03T10:26:45.000000Z\"}}', NULL, '2024-06-03 07:26:45', '2024-06-03 07:26:45'),
(558, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 34, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":34,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0646\\u0642\\u0644\",\"code\":\"500005\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:28:59.000000Z\",\"updated_at\":\"2024-06-03T10:28:59.000000Z\"}}', NULL, '2024-06-03 07:28:59', '2024-06-03 07:28:59'),
(559, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 145, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":145,\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644\",\"status\":1,\"code\":\"500005001\",\"type_id\":34,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:32:50.000000Z\",\"updated_at\":\"2024-06-03T10:32:50.000000Z\"}}', NULL, '2024-06-03 07:32:50', '2024-06-03 07:32:50'),
(560, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 35, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":35,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\",\"code\":\"600\",\"status\":1,\"class_id\":4,\"parent_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:46:00.000000Z\",\"updated_at\":\"2024-06-03T10:46:00.000000Z\"}}', NULL, '2024-06-03 07:46:00', '2024-06-03 07:46:00'),
(561, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 36, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":36,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"code\":\"600001\",\"status\":1,\"class_id\":4,\"parent_id\":35,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:47:09.000000Z\",\"updated_at\":\"2024-06-03T10:47:09.000000Z\"}}', NULL, '2024-06-03 07:47:09', '2024-06-03 07:47:09'),
(562, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 146, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":146,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0641\\u0646\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"code\":\"600001001\",\"type_id\":36,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:49:07.000000Z\",\"updated_at\":\"2024-06-03T10:49:07.000000Z\"}}', NULL, '2024-06-03 07:49:07', '2024-06-03 07:49:07'),
(563, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 147, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":147,\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649 \\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a\",\"status\":1,\"code\":\"600001002\",\"type_id\":36,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:50:09.000000Z\",\"updated_at\":\"2024-06-03T10:50:09.000000Z\"}}', NULL, '2024-06-03 07:50:09', '2024-06-03 07:50:09'),
(564, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 138, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649 \\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a\",\"updated_at\":\"2024-06-03T10:50:44.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T10:11:44.000000Z\"}}', NULL, '2024-06-03 07:50:44', '2024-06-03 07:50:44'),
(565, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 37, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":37,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"code\":\"600002\",\"status\":1,\"class_id\":4,\"parent_id\":35,\"deleted_at\":null,\"created_at\":\"2024-06-03T10:52:26.000000Z\",\"updated_at\":\"2024-06-03T10:52:26.000000Z\"}}', NULL, '2024-06-03 07:52:26', '2024-06-03 07:52:26'),
(566, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-03T10:52:59.000000Z\"},\"old\":{\"updated_at\":\"2024-06-03T10:47:09.000000Z\"}}', NULL, '2024-06-03 07:52:59', '2024-06-03 07:52:59'),
(567, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 36, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-03T10:53:40.000000Z\"},\"old\":{\"updated_at\":\"2024-06-03T10:52:59.000000Z\"}}', NULL, '2024-06-03 07:53:40', '2024-06-03 07:53:40'),
(568, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 148, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":148,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"status\":1,\"code\":\"600002001\",\"type_id\":37,\"deleted_at\":null,\"created_at\":\"2024-06-03T11:33:59.000000Z\",\"updated_at\":\"2024-06-03T11:33:59.000000Z\"}}', NULL, '2024-06-03 08:33:59', '2024-06-03 08:33:59'),
(569, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 144, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T11:34:48.000000Z\"},\"old\":{\"name\":\"\\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T10:26:45.000000Z\"}}', NULL, '2024-06-03 08:34:48', '2024-06-03 08:34:48'),
(570, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 143, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u062a\\u062f\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T11:35:04.000000Z\"},\"old\":{\"name\":\"\\u062a\\u062f\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T10:23:52.000000Z\"}}', NULL, '2024-06-03 08:35:04', '2024-06-03 08:35:04'),
(571, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 145, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644 - \\u0645\\u0635\\u0631\\u0648\\u0641\",\"updated_at\":\"2024-06-03T11:35:20.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644\",\"updated_at\":\"2024-06-03T10:32:50.000000Z\"}}', NULL, '2024-06-03 08:35:20', '2024-06-03 08:35:20'),
(572, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 140, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T11:35:51.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T10:15:56.000000Z\"}}', NULL, '2024-06-03 08:35:51', '2024-06-03 08:35:51'),
(573, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 141, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"updated_at\":\"2024-06-03T11:36:49.000000Z\"},\"old\":{\"name\":\"\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"updated_at\":\"2024-06-03T10:16:49.000000Z\"}}', NULL, '2024-06-03 08:36:49', '2024-06-03 08:36:49'),
(574, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 142, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\",\"updated_at\":\"2024-06-03T11:37:03.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\",\"updated_at\":\"2024-06-03T10:17:56.000000Z\"}}', NULL, '2024-06-03 08:37:03', '2024-06-03 08:37:03'),
(575, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 147, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T11:37:32.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649 \\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a\",\"updated_at\":\"2024-06-03T10:50:09.000000Z\"}}', NULL, '2024-06-03 08:37:32', '2024-06-03 08:37:32'),
(576, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 138, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a \\u062f\\u0627\\u062e\\u0644\\u064a\",\"updated_at\":\"2024-06-03T13:22:45.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649 \\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a\",\"updated_at\":\"2024-06-03T10:50:44.000000Z\"}}', NULL, '2024-06-03 10:22:46', '2024-06-03 10:22:46'),
(577, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 149, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":149,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u064a\",\"status\":1,\"code\":\"600002002\",\"type_id\":37,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:24:18.000000Z\",\"updated_at\":\"2024-06-03T13:24:18.000000Z\"}}', NULL, '2024-06-03 10:24:18', '2024-06-03 10:24:18'),
(578, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 150, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":150,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u062a\\u0627\\u0634\\u064a\\u0631\\u0627\\u062a\",\"status\":1,\"code\":\"600002003\",\"type_id\":37,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:25:28.000000Z\",\"updated_at\":\"2024-06-03T13:25:28.000000Z\"}}', NULL, '2024-06-03 10:25:28', '2024-06-03 10:25:28'),
(579, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 38, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":38,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u064a\",\"code\":\"600003\",\"status\":1,\"class_id\":4,\"parent_id\":35,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:27:51.000000Z\",\"updated_at\":\"2024-06-03T13:27:51.000000Z\"}}', NULL, '2024-06-03 10:27:51', '2024-06-03 10:27:51'),
(580, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 151, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":151,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u064a\",\"status\":1,\"code\":\"600003001\",\"type_id\":38,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:29:26.000000Z\",\"updated_at\":\"2024-06-03T13:29:26.000000Z\"}}', NULL, '2024-06-03 10:29:26', '2024-06-03 10:29:26'),
(581, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 39, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":39,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u064a\",\"code\":\"600004\",\"status\":1,\"class_id\":4,\"parent_id\":35,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:31:33.000000Z\",\"updated_at\":\"2024-06-03T13:31:33.000000Z\"}}', NULL, '2024-06-03 10:31:33', '2024-06-03 10:31:33'),
(582, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 152, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":152,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"status\":1,\"code\":\"600004001\",\"type_id\":39,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:32:40.000000Z\",\"updated_at\":\"2024-06-03T13:32:40.000000Z\"}}', NULL, '2024-06-03 10:32:40', '2024-06-03 10:32:40'),
(583, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 40, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":40,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u0631\\u0647\",\"code\":\"500006\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:36:20.000000Z\",\"updated_at\":\"2024-06-03T13:36:20.000000Z\"}}', NULL, '2024-06-03 10:36:20', '2024-06-03 10:36:20'),
(584, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 41, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":41,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u062d\\u062c\",\"code\":\"500007\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:37:09.000000Z\",\"updated_at\":\"2024-06-03T13:37:09.000000Z\"}}', NULL, '2024-06-03 10:37:09', '2024-06-03 10:37:09'),
(585, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 42, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":42,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0646\\u0642\\u0644\",\"code\":\"600005\",\"status\":1,\"class_id\":4,\"parent_id\":35,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:39:09.000000Z\",\"updated_at\":\"2024-06-03T13:39:09.000000Z\"}}', NULL, '2024-06-03 10:39:09', '2024-06-03 10:39:09'),
(586, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 153, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":153,\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644 - \\u0627\\u064a\\u0631\\u0627\\u062f\",\"status\":1,\"code\":\"600005001\",\"type_id\":42,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:40:32.000000Z\",\"updated_at\":\"2024-06-03T13:40:32.000000Z\"}}', NULL, '2024-06-03 10:40:32', '2024-06-03 10:40:32'),
(587, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 43, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":43,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u0631\\u0647\",\"code\":\"600006\",\"status\":1,\"class_id\":4,\"parent_id\":35,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:42:02.000000Z\",\"updated_at\":\"2024-06-03T13:42:02.000000Z\"}}', NULL, '2024-06-03 10:42:02', '2024-06-03 10:42:02'),
(588, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 44, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":44,\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u062d\\u062c\",\"code\":\"600007\",\"status\":1,\"class_id\":4,\"parent_id\":35,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:42:36.000000Z\",\"updated_at\":\"2024-06-03T13:42:36.000000Z\"}}', NULL, '2024-06-03 10:42:36', '2024-06-03 10:42:36'),
(589, 'chart_type', 'created on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 45, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":45,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u062e\\u0631\\u064a\",\"code\":\"500008\",\"status\":1,\"class_id\":3,\"parent_id\":29,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:43:53.000000Z\",\"updated_at\":\"2024-06-03T13:43:53.000000Z\"}}', NULL, '2024-06-03 10:43:53', '2024-06-03 10:43:53'),
(590, 'chart_type', 'updated on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 45, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-03T13:44:25.000000Z\"},\"old\":{\"updated_at\":\"2024-06-03T13:43:53.000000Z\"}}', NULL, '2024-06-03 10:44:25', '2024-06-03 10:44:25'),
(591, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 154, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":154,\"name\":\"\\u0641\\u0631\\u0648\\u0642 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0647\",\"status\":1,\"code\":\"500008001\",\"type_id\":45,\"deleted_at\":null,\"created_at\":\"2024-06-03T13:45:50.000000Z\",\"updated_at\":\"2024-06-03T13:45:50.000000Z\"}}', NULL, '2024-06-03 10:45:50', '2024-06-03 10:45:50'),
(592, 'chart_type', 'deleted on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 17, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":17,\"name\":\"\\u0641\\u064a\\u0632\\u0627\",\"code\":\"230\",\"status\":0,\"class_id\":1,\"parent_id\":6,\"deleted_at\":\"2024-06-03T15:03:51.000000Z\",\"created_at\":\"2024-06-01T13:16:51.000000Z\",\"updated_at\":\"2024-06-03T15:03:51.000000Z\"}}', NULL, '2024-06-03 12:03:51', '2024-06-03 12:03:51'),
(593, 'chart_type', 'deleted on chart_type', 'Modules\\Accounting\\ChartType\\App\\Models\\ChartType', 8, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":8,\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0648\\u0643\",\"code\":\"212\",\"status\":0,\"class_id\":1,\"parent_id\":7,\"deleted_at\":\"2024-06-04T07:52:51.000000Z\",\"created_at\":\"2024-06-01T09:52:54.000000Z\",\"updated_at\":\"2024-06-04T07:52:51.000000Z\"}}', NULL, '2024-06-04 04:52:51', '2024-06-04 04:52:51');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(594, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 155, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":155,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649\",\"status\":1,\"code\":\"200001001\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T07:54:15.000000Z\",\"updated_at\":\"2024-06-04T07:54:15.000000Z\"}}', NULL, '2024-06-04 04:54:15', '2024-06-04 04:54:15'),
(595, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 156, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":156,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0627\\u0631\",\"status\":1,\"code\":\"200001002\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T08:14:01.000000Z\",\"updated_at\":\"2024-06-04T08:14:01.000000Z\"}}', NULL, '2024-06-04 05:14:01', '2024-06-04 05:14:01'),
(596, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 157, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":157,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u064a\\u0648\\u0631\\u0648\",\"status\":1,\"code\":\"200001003\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T08:15:47.000000Z\",\"updated_at\":\"2024-06-04T08:15:47.000000Z\"}}', NULL, '2024-06-04 05:15:47', '2024-06-04 05:15:47'),
(597, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 158, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":158,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644\",\"status\":1,\"code\":\"200001004\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T08:17:29.000000Z\",\"updated_at\":\"2024-06-04T08:17:29.000000Z\"}}', NULL, '2024-06-04 05:17:29', '2024-06-04 05:17:29'),
(598, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 159, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":159,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062c\\u064a\\u062f\\u064a\\u0627\",\"status\":0,\"code\":\"200001005\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T08:18:36.000000Z\",\"updated_at\":\"2024-06-04T08:18:36.000000Z\"}}', NULL, '2024-06-04 05:18:37', '2024-06-04 05:18:37'),
(599, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 159, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-04T08:18:47.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-04T08:18:36.000000Z\"}}', NULL, '2024-06-04 05:18:47', '2024-06-04 05:18:47'),
(600, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 160, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":160,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"status\":1,\"code\":\"200001006\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T08:19:27.000000Z\",\"updated_at\":\"2024-06-04T08:19:27.000000Z\"}}', NULL, '2024-06-04 05:19:27', '2024-06-04 05:19:27'),
(601, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 12, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":12,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"211\",\"type_id\":7,\"deleted_at\":\"2024-06-04T08:22:26.000000Z\",\"created_at\":\"2024-06-01T09:46:51.000000Z\",\"updated_at\":\"2024-06-04T08:22:26.000000Z\"}}', NULL, '2024-06-04 05:22:26', '2024-06-04 05:22:26'),
(602, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 13, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":13,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0627\\u0631 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"212\",\"type_id\":7,\"deleted_at\":\"2024-06-04T08:22:32.000000Z\",\"created_at\":\"2024-06-01T09:47:25.000000Z\",\"updated_at\":\"2024-06-04T08:22:32.000000Z\"}}', NULL, '2024-06-04 05:22:32', '2024-06-04 05:22:32'),
(603, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 14, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":14,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u064a\\u0648\\u0631\\u0648 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"213\",\"type_id\":7,\"deleted_at\":\"2024-06-04T08:22:39.000000Z\",\"created_at\":\"2024-06-01T09:48:47.000000Z\",\"updated_at\":\"2024-06-04T08:22:39.000000Z\"}}', NULL, '2024-06-04 05:22:39', '2024-06-04 05:22:39'),
(604, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 15, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":15,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0627\\u0633\\u062a\\u0631\\u0644\\u064a\\u0646\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"214\",\"type_id\":7,\"deleted_at\":\"2024-06-04T08:22:46.000000Z\",\"created_at\":\"2024-06-01T09:49:35.000000Z\",\"updated_at\":\"2024-06-04T08:22:46.000000Z\"}}', NULL, '2024-06-04 05:22:46', '2024-06-04 05:22:46'),
(605, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 16, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":16,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0629\",\"status\":1,\"code\":\"215\",\"type_id\":7,\"deleted_at\":\"2024-06-04T08:22:52.000000Z\",\"created_at\":\"2024-06-01T09:50:22.000000Z\",\"updated_at\":\"2024-06-04T08:22:52.000000Z\"}}', NULL, '2024-06-04 05:22:52', '2024-06-04 05:22:52'),
(606, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 17, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":17,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"status\":1,\"code\":\"216\",\"type_id\":7,\"deleted_at\":\"2024-06-04T08:23:02.000000Z\",\"created_at\":\"2024-06-01T09:51:27.000000Z\",\"updated_at\":\"2024-06-04T08:23:02.000000Z\"}}', NULL, '2024-06-04 05:23:02', '2024-06-04 05:23:02'),
(607, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 18, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":18,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0629 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"status\":1,\"code\":\"217\",\"type_id\":7,\"deleted_at\":\"2024-06-04T08:23:08.000000Z\",\"created_at\":\"2024-06-01T09:52:02.000000Z\",\"updated_at\":\"2024-06-04T08:23:08.000000Z\"}}', NULL, '2024-06-04 05:23:08', '2024-06-04 05:23:08'),
(608, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 160, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"updated_at\":\"2024-06-04T08:24:01.000000Z\"},\"old\":{\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"updated_at\":\"2024-06-04T08:19:27.000000Z\"}}', NULL, '2024-06-04 05:24:01', '2024-06-04 05:24:01'),
(609, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 161, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":161,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647\",\"status\":1,\"code\":\"200001007\",\"type_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T08:25:07.000000Z\",\"updated_at\":\"2024-06-04T08:25:07.000000Z\"}}', NULL, '2024-06-04 05:25:07', '2024-06-04 05:25:07'),
(610, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 160, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-04T08:25:41.000000Z\"},\"old\":{\"updated_at\":\"2024-06-04T08:24:01.000000Z\"}}', NULL, '2024-06-04 05:25:41', '2024-06-04 05:25:41'),
(611, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 161, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-04T08:25:58.000000Z\"},\"old\":{\"updated_at\":\"2024-06-04T08:25:07.000000Z\"}}', NULL, '2024-06-04 05:25:58', '2024-06-04 05:25:58'),
(612, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u0633\\u0639\\u0648\\u062f\\u064a\\u0629\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:26:00.000000Z\",\"updated_at\":\"2024-06-04T09:26:00.000000Z\"}}', NULL, '2024-06-04 06:26:00', '2024-06-04 06:26:00'),
(613, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u062a\\u0631\\u0643\\u064a\\u0627\",\"status\":0,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:26:54.000000Z\",\"updated_at\":\"2024-06-04T09:26:54.000000Z\"}}', NULL, '2024-06-04 06:26:54', '2024-06-04 06:26:54'),
(614, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u0631\\u064a\\u0627\\u0636\",\"status\":1,\"country_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:28:24.000000Z\",\"updated_at\":\"2024-06-04T09:28:24.000000Z\"}}', NULL, '2024-06-04 06:28:24', '2024-06-04 06:28:24'),
(615, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u0641\\u0631\\u0646\\u0633\\u0627\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:29:03.000000Z\",\"updated_at\":\"2024-06-04T09:29:03.000000Z\"}}', NULL, '2024-06-04 06:29:03', '2024-06-04 06:29:03'),
(616, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u0627\\u064a\\u0637\\u0627\\u0644\\u064a\\u0627\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:37:22.000000Z\",\"updated_at\":\"2024-06-04T09:37:22.000000Z\"}}', NULL, '2024-06-04 06:37:22', '2024-06-04 06:37:22'),
(617, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"\\u0627\\u0644\\u064a\\u0648\\u0646\\u0627\\u0646\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:37:49.000000Z\",\"updated_at\":\"2024-06-04T09:37:49.000000Z\"}}', NULL, '2024-06-04 06:37:49', '2024-06-04 06:37:49'),
(618, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"\\u0633\\u0648\\u064a\\u0633\\u0631\\u0627\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:38:13.000000Z\",\"updated_at\":\"2024-06-04T09:38:13.000000Z\"}}', NULL, '2024-06-04 06:38:13', '2024-06-04 06:38:13'),
(619, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"name\":\"\\u0644\\u0628\\u0646\\u0627\\u0646\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:38:32.000000Z\",\"updated_at\":\"2024-06-04T09:38:32.000000Z\"}}', NULL, '2024-06-04 06:38:32', '2024-06-04 06:38:32'),
(620, 'country', 'updated on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-04T09:38:40.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-04T09:26:54.000000Z\"}}', NULL, '2024-06-04 06:38:40', '2024-06-04 06:38:40'),
(621, 'country', 'created on country', 'Modules\\MasterData\\Country\\App\\Models\\Country', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"name\":\"\\u0647\\u0648\\u0644\\u0646\\u062f\\u0627\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:39:05.000000Z\",\"updated_at\":\"2024-06-04T09:39:05.000000Z\"}}', NULL, '2024-06-04 06:39:05', '2024-06-04 06:39:05'),
(622, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0627\\u0646\\u0642\\u0631\\u0629\",\"status\":1,\"country_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:40:14.000000Z\",\"updated_at\":\"2024-06-04T09:40:14.000000Z\"}}', NULL, '2024-06-04 06:40:15', '2024-06-04 06:40:15'),
(623, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u0628\\u0627\\u0631\\u064a\\u0633\",\"status\":1,\"country_id\":4,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:41:13.000000Z\",\"updated_at\":\"2024-06-04T09:41:13.000000Z\"}}', NULL, '2024-06-04 06:41:13', '2024-06-04 06:41:13'),
(624, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u0631\\u0648\\u0645\\u0627\",\"status\":1,\"country_id\":5,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:42:04.000000Z\",\"updated_at\":\"2024-06-04T09:42:04.000000Z\"}}', NULL, '2024-06-04 06:42:04', '2024-06-04 06:42:04'),
(625, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"\\u0627\\u062b\\u064a\\u0646\\u0627\",\"status\":1,\"country_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:42:45.000000Z\",\"updated_at\":\"2024-06-04T09:42:45.000000Z\"}}', NULL, '2024-06-04 06:42:45', '2024-06-04 06:42:45'),
(626, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"\\u0628\\u064a\\u0631\\u0646\",\"status\":1,\"country_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:43:55.000000Z\",\"updated_at\":\"2024-06-04T09:43:55.000000Z\"}}', NULL, '2024-06-04 06:43:55', '2024-06-04 06:43:55'),
(627, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"name\":\"\\u0628\\u064a\\u0631\\u0648\\u062a\",\"status\":1,\"country_id\":8,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:44:39.000000Z\",\"updated_at\":\"2024-06-04T09:44:39.000000Z\"}}', NULL, '2024-06-04 06:44:39', '2024-06-04 06:44:39'),
(628, 'city', 'created on city', 'Modules\\MasterData\\City\\App\\Models\\City', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"name\":\"\\u0627\\u0645\\u0633\\u062a\\u0631\\u062f\\u0627\\u0645\",\"status\":1,\"country_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:45:26.000000Z\",\"updated_at\":\"2024-06-04T09:45:26.000000Z\"}}', NULL, '2024-06-04 06:45:26', '2024-06-04 06:45:26'),
(629, 'currency', 'created on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u062f\\u0648\\u0644\\u0627\\u0631\",\"symbol\":\"USD\",\"rate\":47.28,\"status\":1,\"base\":0,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:47:17.000000Z\",\"updated_at\":\"2024-06-04T09:47:17.000000Z\"}}', NULL, '2024-06-04 06:47:17', '2024-06-04 06:47:17'),
(630, 'currency', 'created on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u064a\\u0648\\u0631\\u0648\",\"symbol\":\"EUR\",\"rate\":51.44,\"status\":1,\"base\":0,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:47:51.000000Z\",\"updated_at\":\"2024-06-04T09:47:51.000000Z\"}}', NULL, '2024-06-04 06:47:51', '2024-06-04 06:47:51'),
(631, 'currency', 'created on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0627\\u0644\\u0631\\u064a\\u0627\\u0644\",\"symbol\":\"SAR\",\"rate\":12.61,\"status\":1,\"base\":0,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:48:33.000000Z\",\"updated_at\":\"2024-06-04T09:48:33.000000Z\"}}', NULL, '2024-06-04 06:48:33', '2024-06-04 06:48:33'),
(632, 'area', 'created on area', 'Modules\\MasterData\\Area\\App\\Models\\Area', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u0646\\u062e\\u064a\\u0644\",\"status\":1,\"city_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:50:23.000000Z\",\"updated_at\":\"2024-06-04T09:50:23.000000Z\"}}', NULL, '2024-06-04 06:50:23', '2024-06-04 06:50:23'),
(633, 'area', 'created on area', 'Modules\\MasterData\\Area\\App\\Models\\Area', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0645\\u0627\\u0645\\u0627\\u0643\",\"status\":1,\"city_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-04T09:52:09.000000Z\",\"updated_at\":\"2024-06-04T09:52:09.000000Z\"}}', NULL, '2024-06-04 06:52:09', '2024-06-04 06:52:09'),
(634, 'branch', 'created on branch', 'Modules\\MasterData\\Branch\\App\\Models\\Branch', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0637\\u064a\\u0631\\u0627\\u0646\",\"branch_code\":\"02\",\"status\":1,\"email\":\"AVIATION@KTRAVEL.COM\",\"mobile\":\"034848971\",\"user_name\":null,\"user_email\":null,\"user_mobile\":null,\"area_id\":1,\"branchable_id\":null,\"branchable_type\":null,\"deleted_at\":null,\"created_at\":\"2024-06-04T10:21:06.000000Z\",\"updated_at\":\"2024-06-04T10:21:06.000000Z\"}}', NULL, '2024-06-04 07:21:06', '2024-06-04 07:21:06'),
(635, 'supplier', 'created on supplier', 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u0643\\u064a\\u0627\\u0646\",\"status\":1,\"chart_account_id\":104,\"deleted_at\":null,\"created_at\":\"2024-06-04T10:33:36.000000Z\",\"updated_at\":\"2024-06-04T10:33:36.000000Z\"}}', NULL, '2024-06-04 07:33:36', '2024-06-04 07:33:36'),
(636, 'client', 'created on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u0645\\u062d\\u0645\\u062f\",\"mobile\":\"0215488485\",\"email\":\"Das@d.com\",\"type\":\"individual\",\"chart_account_id\":null,\"user_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-04T11:09:27.000000Z\",\"updated_at\":\"2024-06-04T11:09:27.000000Z\"}}', NULL, '2024-06-04 08:09:27', '2024-06-04 08:09:27'),
(637, 'client', 'updated on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"chart_account_id\":73},\"old\":{\"chart_account_id\":null}}', NULL, '2024-06-04 08:09:27', '2024-06-04 08:09:27'),
(638, 'user', 'created on user', 'App\\Models\\User', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0645\\u062d\\u0645\\u062f\",\"email\":\"Das@d.com\",\"email_verified_at\":null,\"password\":\"\",\"status\":0,\"remember_token\":null,\"created_at\":\"2024-06-04T11:09:38.000000Z\",\"updated_at\":\"2024-06-04T11:09:38.000000Z\",\"deleted_at\":null}}', NULL, '2024-06-04 08:09:38', '2024-06-04 08:09:38'),
(639, 'client', 'updated on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"user_id\":2,\"updated_at\":\"2024-06-04T11:09:38.000000Z\"},\"old\":{\"user_id\":null,\"updated_at\":\"2024-06-04T11:09:27.000000Z\"}}', NULL, '2024-06-04 08:09:38', '2024-06-04 08:09:38'),
(640, 'user', 'updated on user', 'App\\Models\\User', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"password\":\"$2y$12$gygbOSTe3D6NE\\/enyL\\/kZO2DtpGfUGbZKZVwWL2v2LQ\\/qxAvntxk.\",\"updated_at\":\"2024-06-04T11:10:06.000000Z\"},\"old\":{\"password\":\"\",\"updated_at\":\"2024-06-04T11:09:38.000000Z\"}}', NULL, '2024-06-04 08:10:06', '2024-06-04 08:10:06'),
(641, 'user', 'deleted on user', 'App\\Models\\User', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":2,\"name\":\"\\u0645\\u062d\\u0645\\u062f\",\"email\":\"Das@d.com\",\"email_verified_at\":null,\"password\":\"$2y$12$gygbOSTe3D6NE\\/enyL\\/kZO2DtpGfUGbZKZVwWL2v2LQ\\/qxAvntxk.\",\"status\":0,\"remember_token\":null,\"created_at\":\"2024-06-04T11:09:38.000000Z\",\"updated_at\":\"2024-06-04T11:10:16.000000Z\",\"deleted_at\":\"2024-06-04T11:10:16.000000Z\"}}', NULL, '2024-06-04 08:10:16', '2024-06-04 08:10:16'),
(642, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u0637\\u064a\\u0631\\u0627\\u0646\",\"status\":1,\"code\":\"001\",\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\",\"start_date\":\"2024-06-01T00:00:00.000000Z\",\"due_date\":\"2024-07-31T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-04T11:39:15.000000Z\",\"updated_at\":\"2024-06-04T11:39:15.000000Z\"}}', NULL, '2024-06-04 08:39:15', '2024-06-04 08:39:15'),
(643, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"status\":1,\"code\":\"002\",\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"start_date\":\"2024-06-01T00:00:00.000000Z\",\"due_date\":\"2024-07-31T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-04T11:45:46.000000Z\",\"updated_at\":\"2024-06-04T11:45:46.000000Z\"}}', NULL, '2024-06-04 08:45:46', '2024-06-04 08:45:46'),
(644, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"code\":\"003\",\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u0641\\u0646\\u0627\\u062f\\u0642 \\u0627\\u0644\\u062f\\u0627\\u062e\\u0644\\u0649\",\"start_date\":\"2024-06-01T00:00:00.000000Z\",\"due_date\":\"2024-07-31T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-04T11:47:50.000000Z\",\"updated_at\":\"2024-06-04T11:47:50.000000Z\"}}', NULL, '2024-06-04 08:47:50', '2024-06-04 08:47:50'),
(645, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\",\"status\":1,\"code\":\"004\",\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"start_date\":\"2024-06-01T00:00:00.000000Z\",\"due_date\":\"2024-07-31T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-04T11:48:39.000000Z\",\"updated_at\":\"2024-06-04T11:48:39.000000Z\"}}', NULL, '2024-06-04 08:48:39', '2024-06-04 08:48:39'),
(646, 'cost_center', 'updated on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u0641\\u0646\\u0627\\u062f\\u0642 \\u0627\\u0644\\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-04T11:48:53.000000Z\"},\"old\":{\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-04T11:48:39.000000Z\"}}', NULL, '2024-06-04 08:48:53', '2024-06-04 08:48:53'),
(647, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u062f\\u0627\\u062e\\u0644\\u0649\",\"status\":1,\"code\":\"005\",\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u062f\\u0627\\u062e\\u0644\\u0649\",\"start_date\":\"2024-06-01T00:00:00.000000Z\",\"due_date\":\"2024-07-31T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-04T11:50:02.000000Z\",\"updated_at\":\"2024-06-04T11:50:02.000000Z\"}}', NULL, '2024-06-04 08:50:02', '2024-06-04 08:50:02'),
(648, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"\\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u062e\\u0627\\u0631\\u062c\\u0649\",\"status\":1,\"code\":\"006\",\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u062e\\u0631\\u062c\\u0649\",\"start_date\":\"2024-06-01T00:00:00.000000Z\",\"due_date\":\"2024-07-31T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-04T11:50:39.000000Z\",\"updated_at\":\"2024-06-04T11:50:39.000000Z\"}}', NULL, '2024-06-04 08:50:39', '2024-06-04 08:50:39'),
(649, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"\\u0627\\u0644\\u0639\\u0645\\u0631\\u0629\",\"status\":1,\"code\":\"007\",\"description\":\"\\u0646\\u0634\\u0627\\u0637 \\u0627\\u0644\\u0639\\u0645\\u0631\\u0629\",\"start_date\":\"2024-06-01T00:00:00.000000Z\",\"due_date\":\"2024-07-31T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-04T11:51:12.000000Z\",\"updated_at\":\"2024-06-04T11:51:12.000000Z\"}}', NULL, '2024-06-04 08:51:12', '2024-06-04 08:51:12'),
(650, 'city', 'updated on city', 'Modules\\MasterData\\City\\App\\Models\\City', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u0627\\u0633\\u0643\\u0646\\u062f\\u0631\\u064a\\u0647\",\"updated_at\":\"2024-06-04T11:56:15.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0642\\u0627\\u0647\\u0631\\u0629\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-06-04 08:56:15', '2024-06-04 08:56:15'),
(651, 'area', 'updated on area', 'Modules\\MasterData\\Area\\App\\Models\\Area', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u062d\\u0637\\u0647 \\u0627\\u0644\\u0631\\u0645\\u0644\",\"updated_at\":\"2024-06-04T12:04:42.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631 \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u0629\",\"updated_at\":\"2024-05-30T15:00:31.000000Z\"}}', NULL, '2024-06-04 09:04:42', '2024-06-04 09:04:42'),
(652, 'client', 'created on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u0639\\u0645\\u0627\\u0646\\u0649 \\u0644\\u0644\\u0633\\u064a\\u0627\\u062d\\u0647\",\"mobile\":\"011112236547\",\"email\":\"KTRAVEL@GMAIL.COM\",\"type\":\"individual\",\"chart_account_id\":null,\"user_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-04T12:28:54.000000Z\",\"updated_at\":\"2024-06-04T12:28:54.000000Z\"}}', NULL, '2024-06-04 09:28:54', '2024-06-04 09:28:54'),
(653, 'client', 'updated on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"chart_account_id\":32},\"old\":{\"chart_account_id\":null}}', NULL, '2024-06-04 09:28:54', '2024-06-04 09:28:54'),
(654, 'currency', 'created on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649\",\"symbol\":\"4\",\"rate\":1,\"status\":1,\"base\":0,\"deleted_at\":null,\"created_at\":\"2024-06-04T12:36:40.000000Z\",\"updated_at\":\"2024-06-04T12:36:40.000000Z\"}}', NULL, '2024-06-04 09:36:40', '2024-06-04 09:36:40'),
(655, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"symbol\":\"EGP\",\"updated_at\":\"2024-06-04T12:36:56.000000Z\"},\"old\":{\"symbol\":\"4\",\"updated_at\":\"2024-06-04T12:36:40.000000Z\"}}', NULL, '2024-06-04 09:36:56', '2024-06-04 09:36:56'),
(656, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 32, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u0639\\u0627\\u0645\\u0647 .\",\"updated_at\":\"2024-06-04T13:05:16.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0646\\u0639\\u0645\\u0627\\u0646\\u0649 \\u0644\\u0644\\u0633\\u064a\\u0627\\u062d\\u0629\",\"updated_at\":\"2024-06-02T09:13:06.000000Z\"}}', NULL, '2024-06-04 10:05:16', '2024-06-04 10:05:16'),
(657, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 34, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":34,\"name\":\"\\u0627\\u0646 \\u062a\\u0631\\u0628\",\"status\":1,\"code\":\"200004003\",\"type_id\":11,\"deleted_at\":\"2024-06-04T13:05:41.000000Z\",\"created_at\":\"2024-06-01T11:22:43.000000Z\",\"updated_at\":\"2024-06-04T13:05:41.000000Z\"}}', NULL, '2024-06-04 10:05:41', '2024-06-04 10:05:41'),
(658, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 35, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":35,\"name\":\"\\u0645\\u064a\\u0627\\u0633\\u064a\\u0646\",\"status\":1,\"code\":\"200004004\",\"type_id\":11,\"deleted_at\":\"2024-06-04T13:05:50.000000Z\",\"created_at\":\"2024-06-01T11:24:22.000000Z\",\"updated_at\":\"2024-06-04T13:05:50.000000Z\"}}', NULL, '2024-06-04 10:05:50', '2024-06-04 10:05:50'),
(659, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 36, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":36,\"name\":\"\\u062a\\u0648\\u0644\\u064a\\u0646 \\u062a\\u0648\\u0631\\u0632\",\"status\":1,\"code\":\"200004005\",\"type_id\":11,\"deleted_at\":\"2024-06-04T13:05:59.000000Z\",\"created_at\":\"2024-06-01T11:26:20.000000Z\",\"updated_at\":\"2024-06-04T13:05:59.000000Z\"}}', NULL, '2024-06-04 10:05:59', '2024-06-04 10:05:59'),
(660, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 33, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":33,\"name\":\"\\u0646\\u064a\\u0648 \\u062d\\u0648\\u0631\\u0633\",\"status\":1,\"code\":\"200004002\",\"type_id\":11,\"deleted_at\":\"2024-06-04T13:07:12.000000Z\",\"created_at\":\"2024-06-01T11:22:16.000000Z\",\"updated_at\":\"2024-06-04T13:07:12.000000Z\"}}', NULL, '2024-06-04 10:07:12', '2024-06-04 10:07:12'),
(661, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 162, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":162,\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u062d\\u062c\",\"status\":1,\"code\":\"200005001\",\"type_id\":12,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:29:12.000000Z\",\"updated_at\":\"2024-06-04T13:29:12.000000Z\"}}', NULL, '2024-06-04 10:29:12', '2024-06-04 10:29:12'),
(662, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 163, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":163,\"name\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u0639\\u0645\\u0631\\u0629\",\"status\":1,\"code\":\"200006001\",\"type_id\":13,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:30:11.000000Z\",\"updated_at\":\"2024-06-04T13:30:11.000000Z\"}}', NULL, '2024-06-04 10:30:11', '2024-06-04 10:30:11'),
(663, 'client', 'created on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0627\\u0644\\u0646\\u0639\\u0645\\u0627\\u0646\\u0649 \\u0644\\u0644\\u0633\\u064a\\u0627\\u062d\\u0629\",\"mobile\":\"012345678944\",\"email\":\"KAVIATION@L.COM\",\"type\":\"individual\",\"chart_account_id\":null,\"user_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:43:34.000000Z\",\"updated_at\":\"2024-06-04T13:43:34.000000Z\"}}', NULL, '2024-06-04 10:43:34', '2024-06-04 10:43:34'),
(664, 'client', 'updated on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"chart_account_id\":32},\"old\":{\"chart_account_id\":null}}', NULL, '2024-06-04 10:43:34', '2024-06-04 10:43:34'),
(665, 'client', 'updated on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u0631\\u0636\\u0627 \\u062d\\u0633\\u0646\",\"mobile\":\"012456789412\",\"email\":\"MAYASINE@GMAIL.COM\",\"updated_at\":\"2024-06-04T13:45:28.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0639\\u0645\\u0627\\u0646\\u0649 \\u0644\\u0644\\u0633\\u064a\\u0627\\u062d\\u0647\",\"mobile\":\"011112236547\",\"email\":\"KTRAVEL@GMAIL.COM\",\"updated_at\":\"2024-06-04T12:28:54.000000Z\"}}', NULL, '2024-06-04 10:45:28', '2024-06-04 10:45:28'),
(666, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 94, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":94,\"name\":\"\\u0628\\u0649 \\u0627\\u0633 \\u0628\\u0649\",\"status\":1,\"code\":\"300005001\",\"type_id\":24,\"deleted_at\":\"2024-06-04T13:47:21.000000Z\",\"created_at\":\"2024-06-02T09:47:12.000000Z\",\"updated_at\":\"2024-06-04T13:47:21.000000Z\"}}', NULL, '2024-06-04 10:47:21', '2024-06-04 10:47:21'),
(667, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 95, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":95,\"name\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0647 \\u0644\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\",\"status\":1,\"code\":\"300005002\",\"type_id\":24,\"deleted_at\":\"2024-06-04T13:47:27.000000Z\",\"created_at\":\"2024-06-02T09:47:43.000000Z\",\"updated_at\":\"2024-06-04T13:47:27.000000Z\"}}', NULL, '2024-06-04 10:47:27', '2024-06-04 10:47:27'),
(668, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 96, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":96,\"name\":\"\\u0641\\u0644\\u0627\\u0649 \\u062f\\u0628\\u0649\",\"status\":1,\"code\":\"300005003\",\"type_id\":24,\"deleted_at\":\"2024-06-04T13:47:33.000000Z\",\"created_at\":\"2024-06-02T09:48:29.000000Z\",\"updated_at\":\"2024-06-04T13:47:33.000000Z\"}}', NULL, '2024-06-04 10:47:33', '2024-06-04 10:47:33'),
(669, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 97, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":97,\"name\":\"\\u0637\\u064a\\u0631\\u0627\\u0646 \\u0627\\u0644\\u062c\\u0632\\u064a\\u0631\\u0647\",\"status\":1,\"code\":\"300005004\",\"type_id\":24,\"deleted_at\":\"2024-06-04T13:47:49.000000Z\",\"created_at\":\"2024-06-02T09:50:44.000000Z\",\"updated_at\":\"2024-06-04T13:47:49.000000Z\"}}', NULL, '2024-06-04 10:47:49', '2024-06-04 10:47:49'),
(670, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 98, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":98,\"name\":\"\\u0646\\u0627\\u0633 \\u0644\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\",\"status\":1,\"code\":\"300005005\",\"type_id\":24,\"deleted_at\":\"2024-06-04T13:47:55.000000Z\",\"created_at\":\"2024-06-02T09:51:27.000000Z\",\"updated_at\":\"2024-06-04T13:47:55.000000Z\"}}', NULL, '2024-06-04 10:47:55', '2024-06-04 10:47:55'),
(671, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 164, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":164,\"name\":\"\\u062f\\u0627\\u0626\\u0646\\u0649 \\u0627\\u0644\\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u062c\\u0648\\u064a\\u0647\",\"status\":1,\"code\":\"300005001\",\"type_id\":24,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:48:32.000000Z\",\"updated_at\":\"2024-06-04T13:48:32.000000Z\"}}', NULL, '2024-06-04 10:48:32', '2024-06-04 10:48:32'),
(672, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 99, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":99,\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0639\\u0644\\u0649 \\u0628\\u0627\\u0628\\u0627\",\"status\":1,\"code\":\"300006001\",\"type_id\":25,\"deleted_at\":\"2024-06-04T13:49:01.000000Z\",\"created_at\":\"2024-06-02T10:01:53.000000Z\",\"updated_at\":\"2024-06-04T13:49:01.000000Z\"}}', NULL, '2024-06-04 10:49:01', '2024-06-04 10:49:01'),
(673, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 100, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":100,\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0639\\u0644\\u0627\\u0621 \\u0627\\u0644\\u062f\\u064a\\u0646\",\"status\":1,\"code\":\"300006002\",\"type_id\":25,\"deleted_at\":\"2024-06-04T13:49:07.000000Z\",\"created_at\":\"2024-06-02T10:03:30.000000Z\",\"updated_at\":\"2024-06-04T13:49:07.000000Z\"}}', NULL, '2024-06-04 10:49:07', '2024-06-04 10:49:07'),
(674, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 101, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":101,\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0627\\u0644\\u062c\\u0627\\u0641\\u0649\",\"status\":1,\"code\":\"300006003\",\"type_id\":25,\"deleted_at\":\"2024-06-04T13:49:13.000000Z\",\"created_at\":\"2024-06-02T10:04:28.000000Z\",\"updated_at\":\"2024-06-04T13:49:13.000000Z\"}}', NULL, '2024-06-04 10:49:13', '2024-06-04 10:49:13'),
(675, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 102, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":102,\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0645\\u0627\\u0631\\u064a\\u0646\\u0627 \\u0634\\u0631\\u0645\",\"status\":1,\"code\":\"300006004\",\"type_id\":25,\"deleted_at\":\"2024-06-04T13:49:20.000000Z\",\"created_at\":\"2024-06-02T10:05:25.000000Z\",\"updated_at\":\"2024-06-04T13:49:20.000000Z\"}}', NULL, '2024-06-04 10:49:21', '2024-06-04 10:49:21'),
(676, 'chart_account', 'created on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 165, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":165,\"name\":\"\\u0627\\u0644\\u0641\\u0646\\u0627\\u062f\\u0642\",\"status\":1,\"code\":\"300006001\",\"type_id\":25,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:50:02.000000Z\",\"updated_at\":\"2024-06-04T13:50:02.000000Z\"}}', NULL, '2024-06-04 10:50:02', '2024-06-04 10:50:02'),
(677, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 103, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u0646\\u0642\\u0644\",\"updated_at\":\"2024-06-04T13:50:53.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u064a\\u0645\\u0648\\u0632\\u064a\\u0646\",\"updated_at\":\"2024-06-02T12:59:44.000000Z\"}}', NULL, '2024-06-04 10:50:53', '2024-06-04 10:50:53'),
(678, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 106, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":106,\"name\":\"\\u0637\\u0645\\u0648\\u062d\",\"status\":1,\"code\":\"300008003\",\"type_id\":27,\"deleted_at\":\"2024-06-04T13:51:47.000000Z\",\"created_at\":\"2024-06-02T13:07:14.000000Z\",\"updated_at\":\"2024-06-04T13:51:47.000000Z\"}}', NULL, '2024-06-04 10:51:47', '2024-06-04 10:51:47'),
(679, 'chart_account', 'deleted on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 105, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":105,\"name\":\"\\u0641\\u0631\\u0635\\u0647\",\"status\":1,\"code\":\"300008002\",\"type_id\":27,\"deleted_at\":\"2024-06-04T13:51:53.000000Z\",\"created_at\":\"2024-06-02T13:06:47.000000Z\",\"updated_at\":\"2024-06-04T13:51:53.000000Z\"}}', NULL, '2024-06-04 10:51:53', '2024-06-04 10:51:53'),
(680, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 104, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0643\\u064a\\u0627\\u06461\",\"updated_at\":\"2024-06-04T13:52:22.000000Z\"},\"old\":{\"name\":\"\\u0643\\u064a\\u0627\\u0646\",\"updated_at\":\"2024-06-02T13:06:22.000000Z\"}}', NULL, '2024-06-04 10:52:22', '2024-06-04 10:52:22'),
(681, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 104, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0648\\u0631\\u062f\\u0648\\u0646 \\u0627\\u062e\\u0631\\u0648\\u0646\",\"updated_at\":\"2024-06-04T13:53:02.000000Z\"},\"old\":{\"name\":\"\\u0643\\u064a\\u0627\\u06461\",\"updated_at\":\"2024-06-04T13:52:22.000000Z\"}}', NULL, '2024-06-04 10:53:02', '2024-06-04 10:53:02'),
(682, 'supplier', 'created on supplier', 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0628\\u0649 \\u0627\\u0633 \\u0628\\u0649\",\"status\":0,\"chart_account_id\":164,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:53:56.000000Z\",\"updated_at\":\"2024-06-04T13:53:56.000000Z\"}}', NULL, '2024-06-04 10:53:56', '2024-06-04 10:53:56'),
(683, 'supplier', 'created on supplier', 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0641\\u0646\\u062f\\u0642 \\u0639\\u0644\\u0649 \\u0628\\u0627\\u0628\\u0627\",\"status\":0,\"chart_account_id\":165,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:54:36.000000Z\",\"updated_at\":\"2024-06-04T13:54:36.000000Z\"}}', NULL, '2024-06-04 10:54:36', '2024-06-04 10:54:36'),
(684, 'supplier', 'created on supplier', 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627\",\"status\":0,\"chart_account_id\":103,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:54:51.000000Z\",\"updated_at\":\"2024-06-04T13:54:51.000000Z\"}}', NULL, '2024-06-04 10:54:51', '2024-06-04 10:54:51'),
(685, 'supplier', 'created on supplier', 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u0643\\u064a\\u0627\\u0646\",\"status\":0,\"chart_account_id\":104,\"deleted_at\":null,\"created_at\":\"2024-06-04T13:55:02.000000Z\",\"updated_at\":\"2024-06-04T13:55:02.000000Z\"}}', NULL, '2024-06-04 10:55:02', '2024-06-04 10:55:02'),
(686, 'supplier', 'updated on supplier', 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0641\\u0631\\u0635\\u0647\",\"updated_at\":\"2024-06-04T13:55:45.000000Z\"},\"old\":{\"name\":\"\\u0643\\u064a\\u0627\\u0646\",\"updated_at\":\"2024-06-04T10:33:36.000000Z\"}}', NULL, '2024-06-04 10:55:45', '2024-06-04 10:55:45'),
(687, 'client', 'created on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u062e\\u0627\\u0644\\u062f \\u0627\\u0644\\u0628\\u062f\\u0631\\u0627\\u0648\\u0649\",\"mobile\":\"01100003026\",\"email\":\"KHALED@YAHOO.COM\",\"type\":\"individual\",\"chart_account_id\":null,\"user_id\":null,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:03:06.000000Z\",\"updated_at\":\"2024-06-04T14:03:06.000000Z\"}}', NULL, '2024-06-04 11:03:06', '2024-06-04 11:03:06'),
(688, 'client', 'updated on client', 'Modules\\MasterData\\Client\\App\\Models\\Client', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"chart_account_id\":32},\"old\":{\"chart_account_id\":null}}', NULL, '2024-06-04 11:03:06', '2024-06-04 11:03:06'),
(689, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649\",\"account_number\":null,\"status\":0,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:05:44.000000Z\",\"updated_at\":\"2024-06-04T14:05:44.000000Z\"}}', NULL, '2024-06-04 11:05:44', '2024-06-04 11:05:44'),
(690, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649.\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:13:40.000000Z\",\"updated_at\":\"2024-06-04T14:13:40.000000Z\"}}', NULL, '2024-06-04 11:13:40', '2024-06-04 11:13:40'),
(691, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649..\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:14:19.000000Z\",\"updated_at\":\"2024-06-04T14:14:19.000000Z\"}}', NULL, '2024-06-04 11:14:19', '2024-06-04 11:14:19'),
(692, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649....\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:16:13.000000Z\",\"updated_at\":\"2024-06-04T14:16:13.000000Z\"}}', NULL, '2024-06-04 11:16:13', '2024-06-04 11:16:13'),
(693, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649......\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:20:29.000000Z\",\"updated_at\":\"2024-06-04T14:20:29.000000Z\"}}', NULL, '2024-06-04 11:20:29', '2024-06-04 11:20:29'),
(694, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0641\\u0642\\u0637\",\"account_number\":null,\"status\":0,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:22:58.000000Z\",\"updated_at\":\"2024-06-04T14:22:58.000000Z\"}}', NULL, '2024-06-04 11:22:58', '2024-06-04 11:22:58'),
(695, 'payment_method', 'created on payment_method', 'Modules\\Accounting\\PaymentMethod\\App\\Models\\PaymentMethod', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649\",\"status\":1,\"payment_type\":\"cash\",\"deleted_at\":null,\"created_at\":\"2024-06-04T14:25:58.000000Z\",\"updated_at\":\"2024-06-04T14:25:58.000000Z\"}}', NULL, '2024-06-04 11:25:58', '2024-06-04 11:25:58'),
(696, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0641\\u0642\\u0637....\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":null,\"created_at\":\"2024-06-04T14:26:58.000000Z\",\"updated_at\":\"2024-06-04T14:26:58.000000Z\"}}', NULL, '2024-06-04 11:26:58', '2024-06-04 11:26:58'),
(697, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"base\":1,\"updated_at\":\"2024-06-04T19:03:56.000000Z\"},\"old\":{\"base\":0,\"updated_at\":\"2024-06-04T12:36:56.000000Z\"}}', NULL, '2024-06-04 16:03:56', '2024-06-04 16:03:56'),
(698, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"base\":0,\"updated_at\":\"2024-06-04T19:04:26.000000Z\"},\"old\":{\"base\":1,\"updated_at\":\"2024-06-04T19:03:56.000000Z\"}}', NULL, '2024-06-04 16:04:26', '2024-06-04 16:04:26');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(699, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"base\":1,\"updated_at\":\"2024-06-04T19:04:26.000000Z\"},\"old\":{\"base\":0,\"updated_at\":\"2024-06-04T09:47:51.000000Z\"}}', NULL, '2024-06-04 16:04:26', '2024-06-04 16:04:26'),
(700, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"base\":0,\"updated_at\":\"2024-06-04T19:04:37.000000Z\"},\"old\":{\"base\":1,\"updated_at\":\"2024-06-04T19:04:26.000000Z\"}}', NULL, '2024-06-04 16:04:37', '2024-06-04 16:04:37'),
(701, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"base\":1,\"updated_at\":\"2024-06-04T19:04:37.000000Z\"},\"old\":{\"base\":0,\"updated_at\":\"2024-06-04T19:04:26.000000Z\"}}', NULL, '2024-06-04 16:04:37', '2024-06-04 16:04:37'),
(702, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"base\":0,\"updated_at\":\"2024-06-04T19:04:41.000000Z\"},\"old\":{\"base\":1,\"updated_at\":\"2024-06-04T19:04:37.000000Z\"}}', NULL, '2024-06-04 16:04:41', '2024-06-04 16:04:41'),
(703, 'currency', 'updated on currency', 'Modules\\MasterData\\Currency\\App\\Models\\Currency', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"base\":1},\"old\":{\"base\":0}}', NULL, '2024-06-04 16:04:41', '2024-06-04 16:04:41'),
(704, 'activity', 'created on activity', 'Modules\\Accounting\\Activity\\App\\Models\\Activity', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u0627\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\",\"activity_code\":\"1\",\"status\":0,\"deleted_at\":null,\"created_at\":\"2024-06-05T07:51:25.000000Z\",\"updated_at\":\"2024-06-05T07:51:25.000000Z\"}}', NULL, '2024-06-05 04:51:25', '2024-06-05 04:51:25'),
(705, 'activity', 'updated on activity', 'Modules\\Accounting\\Activity\\App\\Models\\Activity', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-05T07:51:44.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-05T07:51:25.000000Z\"}}', NULL, '2024-06-05 04:51:44', '2024-06-05 04:51:44'),
(706, 'activity', 'created on activity', 'Modules\\Accounting\\Activity\\App\\Models\\Activity', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0627\\u0644\\u0633\\u064a\\u0627\\u062d\\u0629\",\"activity_code\":\"2\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T07:52:24.000000Z\",\"updated_at\":\"2024-06-05T07:52:24.000000Z\"}}', NULL, '2024-06-05 04:52:24', '2024-06-05 04:52:24'),
(707, 'activity', 'created on activity', 'Modules\\Accounting\\Activity\\App\\Models\\Activity', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0637\\u064a\\u0631\\u0627\\u0646 \\u0639\\u0645\\u0631\\u0629\",\"activity_code\":\"3\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T07:53:35.000000Z\",\"updated_at\":\"2024-06-05T07:53:35.000000Z\"}}', NULL, '2024-06-05 04:53:36', '2024-06-05 04:53:36'),
(708, 'activity', 'created on activity', 'Modules\\Accounting\\Activity\\App\\Models\\Activity', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"activity_code\":\"4\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T07:54:18.000000Z\",\"updated_at\":\"2024-06-05T07:54:18.000000Z\"}}', NULL, '2024-06-05 04:54:18', '2024-06-05 04:54:18'),
(709, 'activity', 'created on activity', 'Modules\\Accounting\\Activity\\App\\Models\\Activity', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0639\\u0645\\u0648\\u0645\\u064a\\u0647\",\"activity_code\":\"5\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T07:55:14.000000Z\",\"updated_at\":\"2024-06-05T07:55:14.000000Z\"}}', NULL, '2024-06-05 04:55:14', '2024-06-05 04:55:14'),
(710, 'safe', 'deleted on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 6, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":6,\"name\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0641\\u0642\\u0637\",\"account_number\":null,\"status\":0,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":\"2024-06-05T07:56:09.000000Z\",\"created_at\":\"2024-06-04T14:22:58.000000Z\",\"updated_at\":\"2024-06-05T07:56:09.000000Z\"}}', NULL, '2024-06-05 04:56:09', '2024-06-05 04:56:09'),
(711, 'safe', 'deleted on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 5, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":5,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649......\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":\"2024-06-05T07:56:17.000000Z\",\"created_at\":\"2024-06-04T14:20:29.000000Z\",\"updated_at\":\"2024-06-05T07:56:17.000000Z\"}}', NULL, '2024-06-05 04:56:17', '2024-06-05 04:56:17'),
(712, 'safe', 'deleted on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 4, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":4,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649....\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":\"2024-06-05T07:56:23.000000Z\",\"created_at\":\"2024-06-04T14:16:13.000000Z\",\"updated_at\":\"2024-06-05T07:56:23.000000Z\"}}', NULL, '2024-06-05 04:56:23', '2024-06-05 04:56:23'),
(713, 'safe', 'deleted on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 3, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":3,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649..\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":\"2024-06-05T07:56:28.000000Z\",\"created_at\":\"2024-06-04T14:14:19.000000Z\",\"updated_at\":\"2024-06-05T07:56:28.000000Z\"}}', NULL, '2024-06-05 04:56:28', '2024-06-05 04:56:28'),
(714, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":0,\"notes\":null,\"orderable_id\":3,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":null,\"branch_id\":1,\"safe_id\":7,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:09:24.000000Z\",\"updated_at\":\"2024-06-05T08:09:24.000000Z\",\"related_order_details_id\":null,\"excute\":0}}', NULL, '2024-06-05 05:09:24', '2024-06-05 05:09:24'),
(715, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"amount\":9500,\"rate\":1,\"tax_amount\":0,\"order_type\":1,\"notes\":\"\\u062a\\u0630\\u0643\\u0631\\u0629\",\"orderable_id\":5,\"orderable_type\":\"Modules\\\\MasterData\\\\Supplier\\\\App\\\\Models\\\\Supplier\",\"cost_center_id\":null,\"branch_id\":1,\"safe_id\":1,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:09:24.000000Z\",\"updated_at\":\"2024-06-05T08:09:24.000000Z\",\"related_order_details_id\":1,\"excute\":0}}', NULL, '2024-06-05 05:09:24', '2024-06-05 05:09:24'),
(716, 'order', 'updated on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"amount\":10000,\"excute\":0},\"old\":{\"amount\":0,\"excute\":null}}', NULL, '2024-06-05 05:09:25', '2024-06-05 05:09:25'),
(717, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":0,\"notes\":null,\"orderable_id\":1,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":3,\"branch_id\":1,\"safe_id\":7,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:13:08.000000Z\",\"updated_at\":\"2024-06-05T08:13:08.000000Z\",\"related_order_details_id\":null,\"excute\":0}}', NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08'),
(718, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"amount\":4000,\"rate\":1,\"tax_amount\":0,\"order_type\":1,\"notes\":\"\\u062a\\u0630\\u0643\\u0631\\u0629\",\"orderable_id\":3,\"orderable_type\":\"Modules\\\\MasterData\\\\Supplier\\\\App\\\\Models\\\\Supplier\",\"cost_center_id\":3,\"branch_id\":1,\"safe_id\":1,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:13:08.000000Z\",\"updated_at\":\"2024-06-05T08:13:08.000000Z\",\"related_order_details_id\":3,\"excute\":0}}', NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08'),
(719, 'order', 'updated on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"amount\":4500,\"excute\":0},\"old\":{\"amount\":0,\"excute\":null}}', NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08'),
(720, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":0,\"notes\":null,\"orderable_id\":2,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":7,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:34:02.000000Z\",\"updated_at\":\"2024-06-05T08:34:02.000000Z\",\"related_order_details_id\":null,\"excute\":0}}', NULL, '2024-06-05 05:34:02', '2024-06-05 05:34:02'),
(721, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"amount\":9500,\"rate\":1,\"tax_amount\":0,\"order_type\":1,\"notes\":\"\\u062a\\u0630\\u0643\\u0631\\u0629\",\"orderable_id\":5,\"orderable_type\":\"Modules\\\\MasterData\\\\Supplier\\\\App\\\\Models\\\\Supplier\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":1,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:34:02.000000Z\",\"updated_at\":\"2024-06-05T08:34:02.000000Z\",\"related_order_details_id\":5,\"excute\":0}}', NULL, '2024-06-05 05:34:02', '2024-06-05 05:34:02'),
(722, 'order', 'updated on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"amount\":10000,\"excute\":0},\"old\":{\"amount\":0,\"excute\":null}}', NULL, '2024-06-05 05:34:03', '2024-06-05 05:34:03'),
(723, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":0,\"notes\":null,\"orderable_id\":1,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":7,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:47:43.000000Z\",\"updated_at\":\"2024-06-05T08:47:43.000000Z\",\"related_order_details_id\":null,\"excute\":0}}', NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43'),
(724, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":1,\"notes\":\"\\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a\",\"orderable_id\":1,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":1,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:47:43.000000Z\",\"updated_at\":\"2024-06-05T08:47:43.000000Z\",\"related_order_details_id\":7,\"excute\":0}}', NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43'),
(725, 'order', 'updated on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"amount\":1000,\"excute\":0},\"old\":{\"amount\":0,\"excute\":null}}', NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43'),
(726, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":0,\"notes\":null,\"orderable_id\":1,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":7,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:48:09.000000Z\",\"updated_at\":\"2024-06-05T08:48:09.000000Z\",\"related_order_details_id\":null,\"excute\":0}}', NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09'),
(727, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":1,\"notes\":\"\\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a\",\"orderable_id\":1,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":1,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-05T08:48:09.000000Z\",\"updated_at\":\"2024-06-05T08:48:09.000000Z\",\"related_order_details_id\":9,\"excute\":0}}', NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09'),
(728, 'order', 'updated on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 9, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"amount\":1000,\"excute\":0},\"old\":{\"amount\":0,\"excute\":null}}', NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09'),
(729, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 7, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u062e\\u0632\\u0646\\u0647 \\u0627\\u0635\\u0648\\u0644 \\u062b\\u0627\\u0628\\u062a\\u0629\",\"updated_at\":\"2024-06-05T08:52:49.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u062e\\u0632\\u0646\\u0647\",\"updated_at\":\"2024-06-02T09:06:14.000000Z\"}}', NULL, '2024-06-05 05:52:49', '2024-06-05 05:52:49'),
(730, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 86, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u062e\\u0627\\u0644\\u062f \\u0631\\u0627\\u0633 \\u0627\\u0644\\u0645\\u0627\\u0644\",\"updated_at\":\"2024-06-05T08:55:17.000000Z\"},\"old\":{\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u062e\\u0627\\u0644\\u062f\",\"updated_at\":\"2024-06-02T09:33:21.000000Z\"}}', NULL, '2024-06-05 05:55:17', '2024-06-05 05:55:17'),
(731, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 137, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-05T08:56:51.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T09:46:42.000000Z\"}}', NULL, '2024-06-05 05:56:51', '2024-06-05 05:56:51'),
(732, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 138, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a \\u062f\\u0627\\u062e\\u0644\\u064a\",\"updated_at\":\"2024-06-05T08:57:13.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a \\u062f\\u0627\\u062e\\u0644\\u064a\",\"updated_at\":\"2024-06-03T13:22:45.000000Z\"}}', NULL, '2024-06-05 05:57:13', '2024-06-05 05:57:13'),
(733, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 139, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-05T08:57:26.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T10:14:36.000000Z\"}}', NULL, '2024-06-05 05:57:26', '2024-06-05 05:57:26'),
(734, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 140, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-05T08:57:39.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T11:35:51.000000Z\"}}', NULL, '2024-06-05 05:57:39', '2024-06-05 05:57:39'),
(735, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 141, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"updated_at\":\"2024-06-05T08:57:51.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"updated_at\":\"2024-06-03T11:36:49.000000Z\"}}', NULL, '2024-06-05 05:57:51', '2024-06-05 05:57:51'),
(736, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 142, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\",\"updated_at\":\"2024-06-05T08:58:04.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\",\"updated_at\":\"2024-06-03T11:37:03.000000Z\"}}', NULL, '2024-06-05 05:58:04', '2024-06-05 05:58:04'),
(737, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 143, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637 \\u062a\\u062f\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-05T08:58:19.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u062a\\u062f\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T11:35:04.000000Z\"}}', NULL, '2024-06-05 05:58:19', '2024-06-05 05:58:19'),
(738, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 144, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637 \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-05T08:58:37.000000Z\"},\"old\":{\"name\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T11:34:48.000000Z\"}}', NULL, '2024-06-05 05:58:37', '2024-06-05 05:58:37'),
(739, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 145, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644  - \\u0645\\u0635\\u0631\\u0648\\u0641 \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\",\"updated_at\":\"2024-06-05T08:59:01.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644 - \\u0645\\u0635\\u0631\\u0648\\u0641\",\"updated_at\":\"2024-06-03T11:35:20.000000Z\"}}', NULL, '2024-06-05 05:59:01', '2024-06-05 05:59:01'),
(740, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 146, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-05T08:59:36.000000Z\"},\"old\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0641\\u0646\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T10:49:07.000000Z\"}}', NULL, '2024-06-05 05:59:36', '2024-06-05 05:59:36'),
(741, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 147, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637  \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-05T08:59:49.000000Z\"},\"old\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649\",\"updated_at\":\"2024-06-03T11:37:32.000000Z\"}}', NULL, '2024-06-05 05:59:49', '2024-06-05 05:59:49'),
(742, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 148, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-05T09:00:02.000000Z\"},\"old\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T11:33:59.000000Z\"}}', NULL, '2024-06-05 06:00:02', '2024-06-05 06:00:02'),
(743, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 149, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u064a\",\"updated_at\":\"2024-06-05T09:00:20.000000Z\"},\"old\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u064a\",\"updated_at\":\"2024-06-03T13:24:18.000000Z\"}}', NULL, '2024-06-05 06:00:20', '2024-06-05 06:00:20'),
(744, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 150, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637  \\u062a\\u0627\\u0634\\u064a\\u0631\\u0627\\u062a\",\"updated_at\":\"2024-06-05T09:00:30.000000Z\"},\"old\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u062a\\u0627\\u0634\\u064a\\u0631\\u0627\\u062a\",\"updated_at\":\"2024-06-03T13:25:28.000000Z\"}}', NULL, '2024-06-05 06:00:30', '2024-06-05 06:00:30'),
(745, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 151, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637  \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u064a\",\"updated_at\":\"2024-06-05T09:00:44.000000Z\"},\"old\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u064a\",\"updated_at\":\"2024-06-03T13:29:26.000000Z\"}}', NULL, '2024-06-05 06:00:44', '2024-06-05 06:00:44'),
(746, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 152, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-05T09:00:58.000000Z\"},\"old\":{\"name\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\",\"updated_at\":\"2024-06-03T13:32:40.000000Z\"}}', NULL, '2024-06-05 06:00:58', '2024-06-05 06:00:58'),
(747, 'chart_account', 'updated on chart_account', 'Modules\\Accounting\\ChartAccount\\App\\Models\\ChartAccount', 153, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644 - \\u0627\\u064a\\u0631\\u0627\\u062f \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\",\"updated_at\":\"2024-06-05T09:01:10.000000Z\"},\"old\":{\"name\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644 - \\u0627\\u064a\\u0631\\u0627\\u062f\",\"updated_at\":\"2024-06-03T13:40:32.000000Z\"}}', NULL, '2024-06-05 06:01:10', '2024-06-05 06:01:10'),
(748, 'safe', 'deleted on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":2,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649.\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":4,\"chart_account_expense_id\":null,\"chart_account_origin_id\":155,\"deleted_at\":\"2024-06-05T09:02:14.000000Z\",\"created_at\":\"2024-06-04T14:13:40.000000Z\",\"updated_at\":\"2024-06-05T09:02:14.000000Z\"}}', NULL, '2024-06-05 06:02:14', '2024-06-05 06:02:14'),
(749, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0631\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":1,\"chart_account_expense_id\":null,\"chart_account_origin_id\":156,\"deleted_at\":null,\"created_at\":\"2024-06-05T09:02:43.000000Z\",\"updated_at\":\"2024-06-05T09:02:43.000000Z\"}}', NULL, '2024-06-05 06:02:43', '2024-06-05 06:02:43'),
(750, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u064a\\u0648\\u0631\\u0648\",\"account_number\":null,\"status\":1,\"branch_id\":1,\"currency_id\":2,\"chart_account_expense_id\":null,\"chart_account_origin_id\":157,\"deleted_at\":null,\"created_at\":\"2024-06-05T09:03:15.000000Z\",\"updated_at\":\"2024-06-05T09:03:15.000000Z\"}}', NULL, '2024-06-05 06:03:15', '2024-06-05 06:03:15'),
(751, 'safe', 'created on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"name\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644\",\"account_number\":null,\"status\":0,\"branch_id\":1,\"currency_id\":3,\"chart_account_expense_id\":null,\"chart_account_origin_id\":158,\"deleted_at\":null,\"created_at\":\"2024-06-05T09:03:42.000000Z\",\"updated_at\":\"2024-06-05T09:03:42.000000Z\"}}', NULL, '2024-06-05 06:03:42', '2024-06-05 06:03:42'),
(752, 'safe', 'updated on safe', 'Modules\\Accounting\\Safe\\App\\Models\\Safe', 10, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"status\":1,\"updated_at\":\"2024-06-05T09:03:49.000000Z\"},\"old\":{\"status\":0,\"updated_at\":\"2024-06-05T09:03:42.000000Z\"}}', NULL, '2024-06-05 06:03:49', '2024-06-05 06:03:49'),
(753, 'custodian', 'created on custodian', 'Modules\\Accounting\\Custodian\\App\\Models\\Custodian', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0639\\u064a\\u0633\\u0648\\u0649\",\"description\":\"\\u0645\\u0648\\u0638\\u0641\",\"account_id\":37,\"deleted_at\":null,\"created_at\":\"2024-06-05T09:04:53.000000Z\",\"updated_at\":\"2024-06-05T09:04:53.000000Z\"}}', NULL, '2024-06-05 06:04:53', '2024-06-05 06:04:53'),
(754, 'custodian', 'created on custodian', 'Modules\\Accounting\\Custodian\\App\\Models\\Custodian', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"\\u0647\\u0628\\u0647\",\"description\":\"\\u0645\\u0648\\u0638\\u0641\\u0647\",\"account_id\":38,\"deleted_at\":null,\"created_at\":\"2024-06-05T09:05:15.000000Z\",\"updated_at\":\"2024-06-05T09:05:15.000000Z\"}}', NULL, '2024-06-05 06:05:15', '2024-06-05 06:05:15'),
(755, 'custodian', 'created on custodian', 'Modules\\Accounting\\Custodian\\App\\Models\\Custodian', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"\\u0645\\u0631\\u0648\\u0627\\u0646\",\"description\":\"\\u0645\\u0648\\u0638\\u0641\",\"account_id\":39,\"deleted_at\":null,\"created_at\":\"2024-06-05T09:05:34.000000Z\",\"updated_at\":\"2024-06-05T09:05:34.000000Z\"}}', NULL, '2024-06-05 06:05:34', '2024-06-05 06:05:34'),
(756, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":11,\"amount\":0,\"rate\":1,\"tax_amount\":0,\"order_type\":0,\"notes\":null,\"orderable_id\":2,\"orderable_type\":\"Modules\\\\MasterData\\\\Client\\\\App\\\\Models\\\\Client\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":1,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-06T07:50:38.000000Z\",\"updated_at\":\"2024-06-06T07:50:38.000000Z\",\"related_order_details_id\":null,\"excute\":0}}', NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38'),
(757, 'order', 'created on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":12,\"amount\":24000,\"rate\":1,\"tax_amount\":0,\"order_type\":1,\"notes\":\"\\u062a\\u0630\\u0643\\u0631\\u0629 \\u0631\\u0642\\u0645 6912547832 \\u0644\\u0644\\u0639\\u0645\\u064a\\u0644 \\u0627\\u0644\\u0631\\u0636\\u0627 \\u062d\\u0633\\u0646 \\u0627\\u0644\\u0649 \\u062a\\u0631\\u0643\\u064a\\u0627\",\"orderable_id\":2,\"orderable_type\":\"Modules\\\\MasterData\\\\Supplier\\\\App\\\\Models\\\\Supplier\",\"cost_center_id\":1,\"branch_id\":1,\"safe_id\":1,\"tax_id\":null,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-06T07:50:38.000000Z\",\"updated_at\":\"2024-06-06T07:50:38.000000Z\",\"related_order_details_id\":11,\"excute\":0}}', NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38'),
(758, 'order', 'updated on order', 'Modules\\Accounting\\Order\\App\\Models\\Order', 11, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"amount\":25000,\"excute\":0},\"old\":{\"amount\":0,\"excute\":null}}', NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38'),
(759, 'fiscal_year', 'created on fiscal_year', 'Modules\\Accounting\\FiscalYear\\App\\Models\\FiscalYear', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"from\":\"2024-01-01T00:00:00.000000Z\",\"to\":\"2024-12-31T00:00:00.000000Z\",\"close\":0,\"deleted_at\":null,\"created_at\":\"2024-06-06T07:58:17.000000Z\",\"updated_at\":\"2024-06-06T07:58:17.000000Z\"}}', NULL, '2024-06-06 04:58:17', '2024-06-06 04:58:17'),
(760, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"room_double_price\":2,\"room_triple_price\":3,\"room_fourth_price\":4,\"baby_price\":0,\"child_price\":1,\"count\":10,\"close_days\":11,\"available\":1,\"program_id\":1,\"flight_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-06T11:32:43.000000Z\",\"updated_at\":\"2024-06-06T11:32:43.000000Z\"}}', NULL, '2024-06-06 08:32:43', '2024-06-06 08:32:43'),
(761, 'program_price', 'updated on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"room_double_price\":10,\"room_triple_price\":10,\"room_fourth_price\":10,\"baby_price\":10,\"child_price\":10,\"close_days\":10,\"updated_at\":\"2024-06-06T12:39:42.000000Z\"},\"old\":{\"room_double_price\":2,\"room_triple_price\":3,\"room_fourth_price\":4,\"baby_price\":0,\"child_price\":1,\"close_days\":11,\"updated_at\":\"2024-06-06T11:32:43.000000Z\"}}', NULL, '2024-06-06 09:39:42', '2024-06-06 09:39:42'),
(762, 'program_price', 'deleted on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":2,\"room_double_price\":10,\"room_triple_price\":10,\"room_fourth_price\":10,\"baby_price\":10,\"child_price\":10,\"count\":10,\"close_days\":10,\"available\":1,\"program_id\":1,\"flight_id\":1,\"deleted_at\":\"2024-06-06T12:43:22.000000Z\",\"created_at\":\"2024-06-06T11:32:43.000000Z\",\"updated_at\":\"2024-06-06T12:43:22.000000Z\"}}', NULL, '2024-06-06 09:43:22', '2024-06-06 09:43:22'),
(763, 'program_price', 'deleted on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":2,\"room_double_price\":10,\"room_triple_price\":10,\"room_fourth_price\":10,\"baby_price\":10,\"child_price\":10,\"count\":10,\"close_days\":10,\"available\":1,\"program_id\":1,\"flight_id\":1,\"deleted_at\":\"2024-06-06T13:49:50.000000Z\",\"created_at\":\"2024-06-06T11:32:43.000000Z\",\"updated_at\":\"2024-06-06T13:49:50.000000Z\"}}', NULL, '2024-06-06 10:49:50', '2024-06-06 10:49:50'),
(764, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room type\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-06T14:04:32.000000Z\",\"updated_at\":\"2024-06-06T14:04:32.000000Z\"}}', NULL, '2024-06-06 11:04:32', '2024-06-06 11:04:32'),
(765, 'program_booking', 'updated on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost\":1000,\"service_cost\":1000,\"total_cost\":2000,\"member_count\":2,\"room_type\":\"000\",\"updated_at\":\"2024-06-06T14:08:25.000000Z\"},\"old\":{\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room type\",\"updated_at\":\"2024-06-06T14:04:32.000000Z\"}}', NULL, '2024-06-06 11:08:25', '2024-06-06 11:08:25'),
(766, 'program_booking', 'deleted on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":1,\"cost\":1000,\"service_cost\":1000,\"total_cost\":2000,\"member_count\":2,\"room_type\":\"000\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":\"2024-06-06T14:09:06.000000Z\",\"created_at\":\"2024-06-06T14:04:32.000000Z\",\"updated_at\":\"2024-06-06T14:09:06.000000Z\"}}', NULL, '2024-06-06 11:09:06', '2024-06-06 11:09:06'),
(767, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room_type\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:14:54.000000Z\",\"updated_at\":\"2024-06-09T09:14:54.000000Z\"}}', NULL, '2024-06-09 06:14:54', '2024-06-09 06:14:54'),
(768, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room_type\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:17:38.000000Z\",\"updated_at\":\"2024-06-09T09:17:38.000000Z\"}}', NULL, '2024-06-09 06:17:38', '2024-06-09 06:17:38'),
(769, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room_type\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:18:45.000000Z\",\"updated_at\":\"2024-06-09T09:18:45.000000Z\"}}', NULL, '2024-06-09 06:18:45', '2024-06-09 06:18:45'),
(770, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:18:45.000000Z\",\"updated_at\":\"2024-06-09T09:18:45.000000Z\"}}', NULL, '2024-06-09 06:18:45', '2024-06-09 06:18:45'),
(771, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:18:45.000000Z\",\"updated_at\":\"2024-06-09T09:18:45.000000Z\"}}', NULL, '2024-06-09 06:18:45', '2024-06-09 06:18:45'),
(772, 'program_booking', 'updated on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room_type\",\"updated_at\":\"2024-06-09T09:22:29.000000Z\"},\"old\":{\"cost\":1000,\"service_cost\":1000,\"total_cost\":2000,\"member_count\":2,\"room_type\":\"000\",\"updated_at\":\"2024-06-06T14:09:06.000000Z\"}}', NULL, '2024-06-09 06:22:29', '2024-06-09 06:22:29'),
(773, 'program_booking', 'updated on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-09T09:22:44.000000Z\"},\"old\":{\"updated_at\":\"2024-06-09T09:22:29.000000Z\"}}', NULL, '2024-06-09 06:22:44', '2024-06-09 06:22:44'),
(774, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"program_booking_id\":1,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:22:44.000000Z\",\"updated_at\":\"2024-06-09T09:22:44.000000Z\"}}', NULL, '2024-06-09 06:22:44', '2024-06-09 06:22:44'),
(775, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"program_booking_id\":1,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:22:44.000000Z\",\"updated_at\":\"2024-06-09T09:22:44.000000Z\"}}', NULL, '2024-06-09 06:22:44', '2024-06-09 06:22:44'),
(776, 'program_booking', 'updated on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-09T09:23:12.000000Z\"},\"old\":{\"updated_at\":\"2024-06-09T09:18:45.000000Z\"}}', NULL, '2024-06-09 06:23:12', '2024-06-09 06:23:12'),
(777, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:23:12.000000Z\",\"updated_at\":\"2024-06-09T09:23:12.000000Z\"}}', NULL, '2024-06-09 06:23:12', '2024-06-09 06:23:12'),
(778, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:23:12.000000Z\",\"updated_at\":\"2024-06-09T09:23:12.000000Z\"}}', NULL, '2024-06-09 06:23:12', '2024-06-09 06:23:12'),
(779, 'program_booking', 'updated on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-09T09:27:35.000000Z\"},\"old\":{\"updated_at\":\"2024-06-09T09:23:12.000000Z\"}}', NULL, '2024-06-09 06:27:35', '2024-06-09 06:27:35'),
(780, 'program_booking', 'updated on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-09T09:28:04.000000Z\"},\"old\":{\"updated_at\":\"2024-06-09T09:27:35.000000Z\"}}', NULL, '2024-06-09 06:28:04', '2024-06-09 06:28:04'),
(781, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:28:04.000000Z\",\"updated_at\":\"2024-06-09T09:28:04.000000Z\"}}', NULL, '2024-06-09 06:28:04', '2024-06-09 06:28:04'),
(782, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T09:28:04.000000Z\",\"updated_at\":\"2024-06-09T09:28:04.000000Z\"}}', NULL, '2024-06-09 06:28:04', '2024-06-09 06:28:04'),
(783, 'program_booking', 'updated on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-09T11:25:59.000000Z\",\"reservation_payment\":100,\"client_id\":1},\"old\":{\"updated_at\":\"2024-06-09T09:28:04.000000Z\",\"reservation_payment\":0,\"client_id\":0}}', NULL, '2024-06-09 08:25:59', '2024-06-09 08:25:59'),
(784, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T11:25:59.000000Z\",\"updated_at\":\"2024-06-09T11:25:59.000000Z\"}}', NULL, '2024-06-09 08:25:59', '2024-06-09 08:25:59'),
(785, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"program_booking_id\":4,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T11:25:59.000000Z\",\"updated_at\":\"2024-06-09T11:25:59.000000Z\"}}', NULL, '2024-06-09 08:25:59', '2024-06-09 08:25:59'),
(786, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room_type\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T11:26:50.000000Z\",\"updated_at\":\"2024-06-09T11:26:50.000000Z\",\"reservation_payment\":100,\"client_id\":1}}', NULL, '2024-06-09 08:26:50', '2024-06-09 08:26:50'),
(787, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":11,\"program_booking_id\":5,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T11:26:50.000000Z\",\"updated_at\":\"2024-06-09T11:26:50.000000Z\"}}', NULL, '2024-06-09 08:26:50', '2024-06-09 08:26:50'),
(788, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":12,\"program_booking_id\":5,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T11:26:50.000000Z\",\"updated_at\":\"2024-06-09T11:26:50.000000Z\"}}', NULL, '2024-06-09 08:26:50', '2024-06-09 08:26:50'),
(789, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"baby_price\":0,\"child_price\":1,\"price\":2,\"count\":10,\"close_days\":11,\"available\":1,\"program_id\":1,\"room_type_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-09T12:01:48.000000Z\",\"updated_at\":\"2024-06-09T12:01:48.000000Z\"}}', NULL, '2024-06-09 09:01:48', '2024-06-09 09:01:48'),
(790, 'program_price', 'updated on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"baby_price\":10,\"child_price\":10,\"price\":10,\"close_days\":10,\"updated_at\":\"2024-06-09T12:02:39.000000Z\"},\"old\":{\"baby_price\":0,\"child_price\":1,\"price\":2,\"close_days\":11,\"updated_at\":\"2024-06-09T12:01:48.000000Z\"}}', NULL, '2024-06-09 09:02:39', '2024-06-09 09:02:39'),
(791, 'flight', 'created on flight', 'Modules\\Umrah\\Flights\\App\\Models\\Flight', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"code\":\"asa12\",\"flight_company_id\":1,\"travel_date\":\"02-05-2024\",\"travel_h_date\":\"12:00:00\",\"return_date\":\"02-05-2024\",\"return_h_date\":\"13:01:00\",\"numbers\":2,\"cost\":\"10.00\",\"confirmation_date\":\"10-01-2024\",\"travel_path_id\":1,\"return_path_id\":1,\"created_at\":\"2024-06-10T07:18:20.000000Z\",\"updated_at\":\"2024-06-10T07:18:20.000000Z\",\"flight_num\":\"a2\",\"pnr\":\"12\",\"Date_departure_d\":\"15-01-2024\",\"Date_arrival_d\":\"15-01-2024\",\"Date_departure_r\":\"15-01-2024\",\"Date_arrival_r\":\"15-01-2024\",\"program_count\":\"0\",\"program_booking_count\":\"0\",\"flight_count\":\"0\"}}', NULL, '2024-06-10 04:18:20', '2024-06-10 04:18:20'),
(792, 'flight', 'created on flight', 'Modules\\Umrah\\Flights\\App\\Models\\Flight', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"code\":\"asa12\",\"flight_company_id\":1,\"travel_date\":\"02-05-2024\",\"travel_h_date\":\"12:00:00\",\"return_date\":\"02-05-2024\",\"return_h_date\":\"13:01:00\",\"numbers\":2,\"cost\":\"10.00\",\"confirmation_date\":\"10-01-2024\",\"travel_path_id\":1,\"return_path_id\":1,\"created_at\":\"2024-06-10T07:19:36.000000Z\",\"updated_at\":\"2024-06-10T07:19:36.000000Z\",\"flight_num\":\"a2\",\"pnr\":\"12\",\"Date_departure_d\":\"15-01-2024\",\"Date_arrival_d\":\"15-01-2024\",\"Date_departure_r\":\"15-01-2024\",\"Date_arrival_r\":\"15-01-2024\",\"program_count\":\"0\",\"program_booking_count\":\"0\",\"flight_count\":\"0\"}}', NULL, '2024-06-10 04:19:37', '2024-06-10 04:19:37'),
(793, 'flight', 'created on flight', 'Modules\\Umrah\\Flights\\App\\Models\\Flight', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"code\":\"asa12\",\"flight_company_id\":1,\"travel_date\":\"02-05-2024\",\"travel_h_date\":\"12:00:00\",\"return_date\":\"02-05-2024\",\"return_h_date\":\"13:01:00\",\"numbers\":2,\"cost\":\"10.00\",\"confirmation_date\":\"10-01-2024\",\"travel_path_id\":1,\"return_path_id\":1,\"created_at\":\"2024-06-10T07:20:56.000000Z\",\"updated_at\":\"2024-06-10T07:20:56.000000Z\",\"flight_num\":\"a2\",\"pnr\":\"12\",\"Date_departure_d\":\"15-01-2024\",\"Date_arrival_d\":\"15-01-2024\",\"Date_departure_r\":\"15-01-2024\",\"Date_arrival_r\":\"15-01-2024\",\"program_count\":\"1\",\"program_booking_count\":\"2\",\"flight_count\":\"3\"}}', NULL, '2024-06-10 04:20:56', '2024-06-10 04:20:56'),
(794, 'flight', 'created on flight', 'Modules\\Umrah\\Flights\\App\\Models\\Flight', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"code\":\"asa12\",\"flight_company_id\":1,\"travel_date\":\"02-05-2024\",\"travel_h_date\":\"12:00:00\",\"return_date\":\"02-05-2024\",\"return_h_date\":\"13:01:00\",\"numbers\":2,\"cost\":\"10.00\",\"confirmation_date\":\"10-01-2024\",\"travel_path_id\":1,\"return_path_id\":1,\"created_at\":\"2024-06-10T07:21:14.000000Z\",\"updated_at\":\"2024-06-10T07:21:14.000000Z\",\"flight_num\":\"a2\",\"pnr\":\"12\",\"Date_departure_d\":\"15-01-2024\",\"Date_arrival_d\":\"15-01-2024\",\"Date_departure_r\":\"15-01-2024\",\"Date_arrival_r\":\"15-01-2024\",\"program_count\":\"0\",\"program_booking_count\":\"1\",\"flight_count\":\"2\"}}', NULL, '2024-06-10 04:21:14', '2024-06-10 04:21:14'),
(795, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-10T08:18:07.000000Z\",\"updated_at\":\"2024-06-10T08:18:07.000000Z\"}}', NULL, '2024-06-10 05:18:07', '2024-06-10 05:18:07');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(796, 'program_user', 'updated on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"user_id\":2,\"updated_at\":\"2024-06-10T08:21:27.000000Z\"},\"old\":{\"user_id\":1,\"updated_at\":\"2024-06-10T08:18:07.000000Z\"}}', NULL, '2024-06-10 05:21:27', '2024-06-10 05:21:27'),
(797, 'program_user', 'updated on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"user_id\":1,\"updated_at\":\"2024-06-10T08:25:36.000000Z\"},\"old\":{\"user_id\":2,\"updated_at\":\"2024-06-10T08:21:27.000000Z\"}}', NULL, '2024-06-10 05:25:36', '2024-06-10 05:25:36'),
(798, 'program_user', 'deleted on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":1,\"program_id\":1,\"user_id\":1,\"deleted_at\":\"2024-06-10T08:31:40.000000Z\",\"created_at\":\"2024-06-10T08:18:07.000000Z\",\"updated_at\":\"2024-06-10T08:31:40.000000Z\"}}', NULL, '2024-06-10 05:31:40', '2024-06-10 05:31:40'),
(799, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-11T10:29:46.000000Z\",\"updated_at\":\"2024-06-11T10:29:46.000000Z\",\"count\":1,\"available\":1,\"flight_id\":1,\"type\":0}}', NULL, '2024-06-11 07:29:46', '2024-06-11 07:29:46'),
(800, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"baby_price\":0,\"child_price\":1,\"price\":2,\"count\":10,\"close_days\":11,\"available\":1,\"program_id\":1,\"room_type_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-11T10:41:34.000000Z\",\"updated_at\":\"2024-06-11T10:41:34.000000Z\",\"bed_price\":3000}}', NULL, '2024-06-11 07:41:34', '2024-06-11 07:41:34'),
(801, 'room_type', 'created on room_type', 'Modules\\Umrah\\Lookups\\App\\Models\\RoomType', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"ar\",\"status\":1,\"deleted_at\":null,\"created_at\":\"2024-06-11T11:06:59.000000Z\",\"updated_at\":\"2024-06-11T11:06:59.000000Z\",\"bed_count\":10}}', NULL, '2024-06-11 08:06:59', '2024-06-11 08:06:59'),
(802, 'room_type', 'updated on room_type', 'Modules\\Umrah\\Lookups\\App\\Models\\RoomType', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"ar2\",\"updated_at\":\"2024-06-11T11:10:42.000000Z\"},\"old\":{\"name\":\"ar\",\"updated_at\":\"2024-06-11T11:06:59.000000Z\"}}', NULL, '2024-06-11 08:10:42', '2024-06-11 08:10:42'),
(803, 'room_type', 'deleted on room_type', 'Modules\\Umrah\\Lookups\\App\\Models\\RoomType', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":1,\"name\":\"\",\"status\":1,\"deleted_at\":\"2024-06-11T11:11:53.000000Z\",\"created_at\":null,\"updated_at\":\"2024-06-11T11:11:53.000000Z\",\"bed_count\":null}}', NULL, '2024-06-11 08:11:53', '2024-06-11 08:11:53'),
(804, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"cost\":100,\"service_cost\":900,\"total_cost\":1000,\"member_count\":1,\"room_type\":\"room\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-11T12:28:06.000000Z\",\"updated_at\":\"2024-06-11T12:28:06.000000Z\",\"reservation_payment\":100,\"client_id\":1,\"room_type_id\":1,\"client_category_id\":1,\"main_client_id\":1}}', NULL, '2024-06-11 09:28:06', '2024-06-11 09:28:06'),
(805, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":13,\"program_booking_id\":6,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-11T12:28:06.000000Z\",\"updated_at\":\"2024-06-11T12:28:06.000000Z\"}}', NULL, '2024-06-11 09:28:06', '2024-06-11 09:28:06'),
(806, 'program_booking_client', 'created on program_booking_client', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingClient', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":14,\"program_booking_id\":6,\"client_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-11T12:28:06.000000Z\",\"updated_at\":\"2024-06-11T12:28:06.000000Z\"}}', NULL, '2024-06-11 09:28:06', '2024-06-11 09:28:06'),
(807, 'passenger', 'created on passenger', 'Modules\\Umrah\\Passenger\\App\\Models\\Passenger', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"name\",\"gender\":1,\"birthdate\":127,\"passport_num\":127,\"deleted_at\":null,\"created_at\":\"2024-06-11T15:20:04.000000Z\",\"updated_at\":\"2024-06-11T15:20:04.000000Z\"}}', NULL, '2024-06-11 12:20:04', '2024-06-11 12:20:04'),
(808, 'passenger', 'created on passenger', 'Modules\\Umrah\\Passenger\\App\\Models\\Passenger', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"name\",\"gender\":1,\"birthdate\":\"2024-06-01\",\"passport_num\":\"1\",\"deleted_at\":null,\"created_at\":\"2024-06-11T15:21:44.000000Z\",\"updated_at\":\"2024-06-11T15:21:44.000000Z\"}}', NULL, '2024-06-11 12:21:44', '2024-06-11 12:21:44'),
(809, 'passenger', 'updated on passenger', 'Modules\\Umrah\\Passenger\\App\\Models\\Passenger', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"1\",\"gender\":0,\"birthdate\":\"1993-11-20\",\"updated_at\":\"2024-06-11T15:22:53.000000Z\"},\"old\":{\"name\":\"name\",\"gender\":1,\"birthdate\":\"2000-01-27\",\"updated_at\":\"2024-06-11T15:20:04.000000Z\"}}', NULL, '2024-06-11 12:22:53', '2024-06-11 12:22:53'),
(810, 'passenger', 'deleted on passenger', 'Modules\\Umrah\\Passenger\\App\\Models\\Passenger', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":1,\"name\":\"1\",\"gender\":0,\"birthdate\":\"1993-11-20\",\"passport_num\":\"1\",\"deleted_at\":\"2024-06-11T15:32:00.000000Z\",\"created_at\":\"2024-06-11T15:20:04.000000Z\",\"updated_at\":\"2024-06-11T15:32:00.000000Z\"}}', NULL, '2024-06-11 12:32:00', '2024-06-11 12:32:00'),
(811, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"cost\":50,\"service_cost\":900,\"total_cost\":1000,\"member_count\":10,\"room_type\":\"room\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-11T15:33:48.000000Z\",\"updated_at\":\"2024-06-11T15:33:48.000000Z\",\"reservation_payment\":50,\"client_id\":1,\"room_type_id\":1,\"client_category_id\":1,\"main_client_id\":1}}', NULL, '2024-06-11 12:33:48', '2024-06-11 12:33:48'),
(812, 'program_booking_passenger', 'created on program_booking_passenger', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingPassenger', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"program_booking_id\":7,\"passenger_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-11T15:33:48.000000Z\",\"updated_at\":\"2024-06-11T15:33:48.000000Z\"}}', NULL, '2024-06-11 12:33:48', '2024-06-11 12:33:48'),
(813, 'program_booking_passenger', 'created on program_booking_passenger', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingPassenger', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"program_booking_id\":7,\"passenger_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-11T15:33:48.000000Z\",\"updated_at\":\"2024-06-11T15:33:48.000000Z\"}}', NULL, '2024-06-11 12:33:48', '2024-06-11 12:33:48'),
(814, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-12T08:09:06.000000Z\",\"updated_at\":\"2024-06-12T08:09:06.000000Z\",\"count\":1,\"available\":1,\"flight_id\":1,\"type\":0}}', NULL, '2024-06-12 05:09:07', '2024-06-12 05:09:07'),
(815, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-12T08:09:21.000000Z\",\"updated_at\":\"2024-06-12T08:09:21.000000Z\",\"count\":1,\"available\":1,\"flight_id\":1,\"type\":0}}', NULL, '2024-06-12 05:09:21', '2024-06-12 05:09:21'),
(816, 'programs', 'updated on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-12T09:39:14.000000Z\",\"count\":1,\"flight_id\":1},\"old\":{\"updated_at\":null,\"count\":0,\"flight_id\":0}}', NULL, '2024-06-12 06:39:14', '2024-06-12 06:39:14'),
(817, 'programs', 'updated on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-12T09:39:43.000000Z\",\"count\":22},\"old\":{\"updated_at\":\"2024-06-12T09:39:14.000000Z\",\"count\":1}}', NULL, '2024-06-12 06:39:43', '2024-06-12 06:39:43'),
(818, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"cost\":50,\"service_cost\":900,\"total_cost\":1000,\"member_count\":10,\"room_type\":\"room\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T09:53:51.000000Z\",\"updated_at\":\"2024-06-12T09:53:51.000000Z\",\"reservation_payment\":50,\"client_id\":1,\"room_type_id\":1,\"client_category_id\":1,\"main_client_id\":1}}', NULL, '2024-06-12 06:53:51', '2024-06-12 06:53:51'),
(819, 'program_booking_passenger', 'created on program_booking_passenger', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingPassenger', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"program_booking_id\":8,\"passenger_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-12T09:53:51.000000Z\",\"updated_at\":\"2024-06-12T09:53:51.000000Z\"}}', NULL, '2024-06-12 06:53:51', '2024-06-12 06:53:51'),
(820, 'program_booking_passenger', 'created on program_booking_passenger', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingPassenger', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"program_booking_id\":8,\"passenger_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-12T09:53:51.000000Z\",\"updated_at\":\"2024-06-12T09:53:51.000000Z\"}}', NULL, '2024-06-12 06:53:51', '2024-06-12 06:53:51'),
(821, 'program_booking', 'created on program_booking', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBooking', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"cost\":50,\"service_cost\":900,\"total_cost\":1000,\"member_count\":10,\"room_type\":\"room\",\"program_date\":\"0000-00-00\",\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:00:02.000000Z\",\"updated_at\":\"2024-06-12T10:00:02.000000Z\",\"reservation_payment\":50,\"client_id\":1,\"room_type_id\":1,\"client_category_id\":1,\"main_client_id\":1}}', NULL, '2024-06-12 07:00:02', '2024-06-12 07:00:02'),
(822, 'program_booking_passenger', 'created on program_booking_passenger', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingPassenger', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"program_booking_id\":9,\"passenger_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:00:02.000000Z\",\"updated_at\":\"2024-06-12T10:00:02.000000Z\"}}', NULL, '2024-06-12 07:00:02', '2024-06-12 07:00:02'),
(823, 'program_booking_passenger', 'created on program_booking_passenger', 'Modules\\Umrah\\ProgramBooking\\App\\Models\\ProgramBookingPassenger', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"program_booking_id\":9,\"passenger_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:00:02.000000Z\",\"updated_at\":\"2024-06-12T10:00:02.000000Z\"}}', NULL, '2024-06-12 07:00:02', '2024-06-12 07:00:02'),
(824, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"baby_price\":0,\"child_price\":1,\"price\":2,\"count\":10,\"close_days\":11,\"available\":1,\"program_id\":1,\"room_type_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:22:23.000000Z\",\"updated_at\":\"2024-06-12T10:22:23.000000Z\",\"bed_price\":0}}', NULL, '2024-06-12 07:22:23', '2024-06-12 07:22:23'),
(825, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:26:34.000000Z\",\"updated_at\":\"2024-06-12T10:26:34.000000Z\"}}', NULL, '2024-06-12 07:26:34', '2024-06-12 07:26:34'),
(826, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:27:23.000000Z\",\"updated_at\":\"2024-06-12T10:27:23.000000Z\"}}', NULL, '2024-06-12 07:27:23', '2024-06-12 07:27:23'),
(827, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:28:23.000000Z\",\"updated_at\":\"2024-06-12T10:28:23.000000Z\"}}', NULL, '2024-06-12 07:28:23', '2024-06-12 07:28:23'),
(828, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T10:28:23.000000Z\",\"updated_at\":\"2024-06-12T10:28:23.000000Z\"}}', NULL, '2024-06-12 07:28:23', '2024-06-12 07:28:23'),
(829, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T13:01:40.000000Z\",\"updated_at\":\"2024-06-12T13:01:40.000000Z\"}}', NULL, '2024-06-12 10:01:40', '2024-06-12 10:01:40'),
(830, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-12T13:01:40.000000Z\",\"updated_at\":\"2024-06-12T13:01:40.000000Z\"}}', NULL, '2024-06-12 10:01:40', '2024-06-12 10:01:40'),
(831, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"program_id\":1,\"hotel_id\":1,\"num_of_days\":30,\"city_id\":1,\"created_at\":\"2024-06-12T13:04:17.000000Z\",\"updated_at\":\"2024-06-12T13:04:17.000000Z\",\"residence_type_id\":1,\"deleted_at\":null}}', NULL, '2024-06-12 10:04:17', '2024-06-12 10:04:17'),
(832, 'program_hotel', 'updated on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"program_id\":2,\"num_of_days\":22,\"city_id\":2,\"updated_at\":\"2024-06-12T13:08:01.000000Z\"},\"old\":{\"program_id\":1,\"num_of_days\":0,\"city_id\":1,\"updated_at\":null}}', NULL, '2024-06-12 10:08:01', '2024-06-12 10:08:01'),
(833, 'program_hotel', 'deleted on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 4, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":4,\"program_id\":2,\"hotel_id\":1,\"num_of_days\":22,\"city_id\":2,\"created_at\":null,\"updated_at\":\"2024-06-12T12:50:31.000000Z\",\"residence_type_id\":2,\"deleted_at\":\"2024-06-12T12:50:31.000000Z\"}}', NULL, '2024-06-12 09:50:31', '2024-06-12 09:50:31'),
(834, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"program_id\":1,\"hotel_id\":1,\"num_of_days\":30,\"city_id\":1,\"created_at\":\"2024-06-13T09:19:19.000000Z\",\"updated_at\":\"2024-06-13T09:19:19.000000Z\",\"residence_type_id\":1,\"deleted_at\":null}}', NULL, '2024-06-13 06:19:19', '2024-06-13 06:19:19'),
(835, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"program_id\":2,\"hotel_id\":1,\"num_of_days\":2,\"city_id\":2,\"created_at\":\"2024-06-13T09:19:19.000000Z\",\"updated_at\":\"2024-06-13T09:19:19.000000Z\",\"residence_type_id\":2,\"deleted_at\":null}}', NULL, '2024-06-13 06:19:19', '2024-06-13 06:19:19'),
(836, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"program_id\":1,\"hotel_id\":1,\"num_of_days\":30,\"city_id\":1,\"created_at\":\"2024-06-13T09:19:46.000000Z\",\"updated_at\":\"2024-06-13T09:19:46.000000Z\",\"residence_type_id\":1,\"deleted_at\":null}}', NULL, '2024-06-13 06:19:46', '2024-06-13 06:19:46'),
(837, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"program_id\":2,\"hotel_id\":1,\"num_of_days\":2,\"city_id\":2,\"created_at\":\"2024-06-13T09:19:46.000000Z\",\"updated_at\":\"2024-06-13T09:19:46.000000Z\",\"residence_type_id\":2,\"deleted_at\":null}}', NULL, '2024-06-13 06:19:46', '2024-06-13 06:19:46'),
(838, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-13T09:33:45.000000Z\",\"updated_at\":\"2024-06-13T09:33:45.000000Z\"}}', NULL, '2024-06-13 06:33:45', '2024-06-13 06:33:45'),
(839, 'programs', 'updated on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"updated_at\":\"2024-06-13T09:33:45.000000Z\",\"available\":0},\"old\":{\"updated_at\":\"2024-06-12T09:39:43.000000Z\",\"available\":1}}', NULL, '2024-06-13 06:33:45', '2024-06-13 06:33:45'),
(840, 'program_user', 'created on program_user', 'Modules\\Umrah\\ProgramUser\\App\\Models\\ProgramUser', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"program_id\":1,\"user_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-13T09:33:45.000000Z\",\"updated_at\":\"2024-06-13T09:33:45.000000Z\"}}', NULL, '2024-06-13 06:33:45', '2024-06-13 06:33:45'),
(841, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"program_id\":1,\"hotel_id\":1,\"num_of_days\":30,\"city_id\":1,\"created_at\":\"2024-06-13T09:50:50.000000Z\",\"updated_at\":\"2024-06-13T09:50:50.000000Z\",\"residence_type_id\":1,\"deleted_at\":null}}', NULL, '2024-06-13 06:50:50', '2024-06-13 06:50:50'),
(842, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":11,\"program_id\":1,\"hotel_id\":1,\"num_of_days\":2,\"city_id\":2,\"created_at\":\"2024-06-13T09:50:50.000000Z\",\"updated_at\":\"2024-06-13T09:50:50.000000Z\",\"residence_type_id\":2,\"deleted_at\":null}}', NULL, '2024-06-13 06:50:50', '2024-06-13 06:50:50'),
(843, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T09:58:07.000000Z\",\"updated_at\":\"2024-06-13T09:58:07.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 06:58:07', '2024-06-13 06:58:07'),
(844, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T09:58:26.000000Z\",\"updated_at\":\"2024-06-13T09:58:26.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 06:58:26', '2024-06-13 06:58:26'),
(845, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:02:40.000000Z\",\"updated_at\":\"2024-06-13T10:02:40.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:02:40', '2024-06-13 07:02:40'),
(846, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:05:47.000000Z\",\"updated_at\":\"2024-06-13T10:05:47.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:05:47', '2024-06-13 07:05:47'),
(847, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:05:58.000000Z\",\"updated_at\":\"2024-06-13T10:05:58.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:05:58', '2024-06-13 07:05:58'),
(848, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:06:57.000000Z\",\"updated_at\":\"2024-06-13T10:06:57.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:06:57', '2024-06-13 07:06:57'),
(849, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":11,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:08:30.000000Z\",\"updated_at\":\"2024-06-13T10:08:30.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:08:30', '2024-06-13 07:08:30'),
(850, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":12,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:09:23.000000Z\",\"updated_at\":\"2024-06-13T10:09:23.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:09:23', '2024-06-13 07:09:23'),
(851, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":13,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:09:50.000000Z\",\"updated_at\":\"2024-06-13T10:09:50.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:09:50', '2024-06-13 07:09:50'),
(852, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":14,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:10:08.000000Z\",\"updated_at\":\"2024-06-13T10:10:08.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:10:08', '2024-06-13 07:10:08'),
(853, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 15, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":15,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:10:31.000000Z\",\"updated_at\":\"2024-06-13T10:10:31.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:10:31', '2024-06-13 07:10:31'),
(854, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 16, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":16,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:10:49.000000Z\",\"updated_at\":\"2024-06-13T10:10:49.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:10:49', '2024-06-13 07:10:49'),
(855, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 17, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":17,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:11:03.000000Z\",\"updated_at\":\"2024-06-13T10:11:03.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:11:03', '2024-06-13 07:11:03'),
(856, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 18, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":18,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:11:28.000000Z\",\"updated_at\":\"2024-06-13T10:11:28.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:11:28', '2024-06-13 07:11:28'),
(857, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 19, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":19,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:12:56.000000Z\",\"updated_at\":\"2024-06-13T10:12:56.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:12:56', '2024-06-13 07:12:56'),
(858, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 20, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":20,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:13:19.000000Z\",\"updated_at\":\"2024-06-13T10:13:19.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:13:19', '2024-06-13 07:13:19'),
(859, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 21, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":21,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:13:41.000000Z\",\"updated_at\":\"2024-06-13T10:13:41.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:13:41', '2024-06-13 07:13:41'),
(860, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 22, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":22,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:13:52.000000Z\",\"updated_at\":\"2024-06-13T10:13:52.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:13:52', '2024-06-13 07:13:52'),
(861, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 23, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":23,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:14:48.000000Z\",\"updated_at\":\"2024-06-13T10:14:48.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:14:48', '2024-06-13 07:14:48'),
(862, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 24, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":24,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:15:01.000000Z\",\"updated_at\":\"2024-06-13T10:15:01.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:15:01', '2024-06-13 07:15:01'),
(863, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 25, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":25,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:16:07.000000Z\",\"updated_at\":\"2024-06-13T10:16:07.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:16:07', '2024-06-13 07:16:07'),
(864, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 26, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":26,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:16:29.000000Z\",\"updated_at\":\"2024-06-13T10:16:29.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:16:29', '2024-06-13 07:16:29'),
(865, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 27, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":27,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:16:56.000000Z\",\"updated_at\":\"2024-06-13T10:16:56.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:16:56', '2024-06-13 07:16:56'),
(866, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 28, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":28,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:17:20.000000Z\",\"updated_at\":\"2024-06-13T10:17:20.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:17:20', '2024-06-13 07:17:20'),
(867, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 29, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":29,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:17:49.000000Z\",\"updated_at\":\"2024-06-13T10:17:49.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:17:49', '2024-06-13 07:17:49'),
(868, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 30, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":30,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T10:18:42.000000Z\",\"updated_at\":\"2024-06-13T10:18:42.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 07:18:42', '2024-06-13 07:18:42'),
(869, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 31, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":31,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T12:30:05.000000Z\",\"updated_at\":\"2024-06-13T12:30:05.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 09:30:05', '2024-06-13 09:30:05'),
(870, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 32, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":32,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T13:01:01.000000Z\",\"updated_at\":\"2024-06-13T13:01:01.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 10:01:01', '2024-06-13 10:01:01'),
(871, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 33, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":33,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T13:01:08.000000Z\",\"updated_at\":\"2024-06-13T13:01:08.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 10:01:08', '2024-06-13 10:01:08'),
(872, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 34, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":34,\"title\":\"5\",\"description\":\"3aa\",\"level\":3,\"programe_type\":\"Hajj\",\"created_at\":\"2024-06-13T13:01:24.000000Z\",\"updated_at\":\"2024-06-13T13:01:24.000000Z\",\"count\":0,\"available\":1,\"flight_id\":0,\"type\":0}}', NULL, '2024-06-13 10:01:24', '2024-06-13 10:01:24'),
(873, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"baby_price\":0,\"child_price\":1,\"price\":0,\"count\":10,\"close_days\":11,\"available\":2,\"program_id\":1,\"room_type_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-13T14:46:19.000000Z\",\"updated_at\":\"2024-06-13T14:46:19.000000Z\",\"bed_price\":0}}', NULL, '2024-06-13 11:46:19', '2024-06-13 11:46:19'),
(874, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"baby_price\":100,\"child_price\":100,\"price\":0,\"count\":100,\"close_days\":11,\"available\":100,\"program_id\":1,\"room_type_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-13T14:48:03.000000Z\",\"updated_at\":\"2024-06-13T14:48:03.000000Z\",\"bed_price\":0}}', NULL, '2024-06-13 11:48:04', '2024-06-13 11:48:04'),
(875, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"baby_price\":100,\"child_price\":100,\"price\":0,\"count\":200,\"close_days\":11,\"available\":127,\"program_id\":1,\"room_type_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-13T14:48:04.000000Z\",\"updated_at\":\"2024-06-13T14:48:04.000000Z\",\"bed_price\":0}}', NULL, '2024-06-13 11:48:04', '2024-06-13 11:48:04'),
(876, 'season', 'created on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"ar\",\"from_date\":\"0000-00-00\",\"to_date\":\"0000-00-00\",\"deleted_at\":null,\"created_at\":\"2024-06-26T10:42:10.000000Z\",\"updated_at\":\"2024-06-26T10:42:10.000000Z\"}}', NULL, '2024-06-26 07:42:10', '2024-06-26 07:42:10'),
(877, 'season', 'created on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"ar\",\"from_date\":\"2022-11-11\",\"to_date\":\"2022-11-12\",\"deleted_at\":null,\"created_at\":\"2024-06-26T10:44:05.000000Z\",\"updated_at\":\"2024-06-26T10:44:05.000000Z\"}}', NULL, '2024-06-26 07:44:05', '2024-06-26 07:44:05'),
(878, 'season', 'updated on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"name2\",\"from_date\":\"0000-00-00\",\"to_date\":\"0000-00-00\",\"updated_at\":\"2024-06-26T12:17:52.000000Z\"},\"old\":{\"name\":\"ar\",\"from_date\":\"2022-11-11\",\"to_date\":\"2022-11-12\",\"updated_at\":\"2024-06-26T10:44:05.000000Z\"}}', NULL, '2024-06-26 09:17:52', '2024-06-26 09:17:52'),
(879, 'season', 'created on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"ar\",\"from_date\":\"1993-11-20\",\"to_date\":\"2024-06-26\",\"deleted_at\":null,\"created_at\":\"2024-06-26T13:06:23.000000Z\",\"updated_at\":\"2024-06-26T13:06:23.000000Z\"}}', NULL, '2024-06-26 10:06:23', '2024-06-26 10:06:23'),
(880, 'season', 'updated on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"name\",\"from_date\":\"2011-01-25\",\"to_date\":\"2024-06-30\",\"updated_at\":\"2024-06-26T13:08:16.000000Z\"},\"old\":{\"name\":\"ar\",\"from_date\":\"1993-11-20\",\"to_date\":\"2024-06-26\",\"updated_at\":\"2024-06-26T13:06:23.000000Z\"}}', NULL, '2024-06-26 10:08:16', '2024-06-26 10:08:16'),
(881, 'season', 'updated on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"name\",\"from_date\":\"2011-01-25\",\"to_date\":\"2024-06-30\",\"updated_at\":\"2024-06-26T13:08:57.000000Z\"},\"old\":{\"name\":\"ar\",\"from_date\":\"0000-00-00\",\"to_date\":\"0000-00-00\",\"updated_at\":\"2024-06-26T10:42:10.000000Z\"}}', NULL, '2024-06-26 10:08:57', '2024-06-26 10:08:57'),
(882, 'season', 'updated on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"name\",\"from_date\":\"2011-01-25\",\"to_date\":\"2024-06-30\",\"updated_at\":\"2024-06-26T13:09:03.000000Z\"},\"old\":{\"name\":\"name2\",\"from_date\":\"0000-00-00\",\"to_date\":\"0000-00-00\",\"updated_at\":\"2024-06-26T12:17:52.000000Z\"}}', NULL, '2024-06-26 10:09:03', '2024-06-26 10:09:03'),
(883, 'season', 'deleted on season', 'Modules\\Umrah\\Season\\App\\Models\\Season', 3, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":3,\"name\":\"name\",\"from_date\":\"2011-01-25\",\"to_date\":\"2024-06-30\",\"deleted_at\":\"2024-06-26T13:09:55.000000Z\",\"created_at\":\"2024-06-26T13:06:23.000000Z\",\"updated_at\":\"2024-06-26T13:09:55.000000Z\"}}', NULL, '2024-06-26 10:09:55', '2024-06-26 10:09:55'),
(884, 'personal_room_type', 'created on personal_room_type', 'Modules\\Umrah\\PersonalRoomType\\App\\Models\\PersonalRoomType', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"person_type\":\"1\",\"is_residence\":1,\"deleted_at\":null,\"created_at\":\"2024-06-26T13:13:34.000000Z\",\"updated_at\":\"2024-06-26T13:13:34.000000Z\"}}', NULL, '2024-06-26 10:13:34', '2024-06-26 10:13:34'),
(885, 'personal_room_type', 'created on personal_room_type', 'Modules\\Umrah\\PersonalRoomType\\App\\Models\\PersonalRoomType', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"person_type\":\"3\",\"is_residence\":0,\"deleted_at\":null,\"created_at\":\"2024-06-26T13:13:53.000000Z\",\"updated_at\":\"2024-06-26T13:13:53.000000Z\"}}', NULL, '2024-06-26 10:13:53', '2024-06-26 10:13:53'),
(886, 'personal_room_type', 'created on personal_room_type', 'Modules\\Umrah\\PersonalRoomType\\App\\Models\\PersonalRoomType', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"person_type\":\"2\",\"is_residence\":0,\"deleted_at\":null,\"created_at\":\"2024-06-26T13:13:59.000000Z\",\"updated_at\":\"2024-06-26T13:13:59.000000Z\"}}', NULL, '2024-06-26 10:13:59', '2024-06-26 10:13:59'),
(887, 'personal_room_type', 'updated on personal_room_type', 'Modules\\Umrah\\PersonalRoomType\\App\\Models\\PersonalRoomType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"person_type\":\"1\",\"is_residence\":1,\"updated_at\":\"2024-06-26T13:14:55.000000Z\"},\"old\":{\"person_type\":\"2\",\"is_residence\":0,\"updated_at\":\"2024-06-26T13:13:59.000000Z\"}}', NULL, '2024-06-26 10:14:55', '2024-06-26 10:14:55'),
(888, 'personal_room_type', 'updated on personal_room_type', 'Modules\\Umrah\\PersonalRoomType\\App\\Models\\PersonalRoomType', 3, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"person_type\":\"3\",\"updated_at\":\"2024-06-26T13:32:18.000000Z\"},\"old\":{\"person_type\":\"1\",\"updated_at\":\"2024-06-26T13:14:55.000000Z\"}}', NULL, '2024-06-26 10:32:18', '2024-06-26 10:32:18'),
(889, 'personal_room_type', 'deleted on personal_room_type', 'Modules\\Umrah\\PersonalRoomType\\App\\Models\\PersonalRoomType', 3, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":3,\"person_type\":\"3\",\"is_residence\":1,\"deleted_at\":\"2024-06-26T14:02:58.000000Z\",\"created_at\":\"2024-06-26T13:13:59.000000Z\",\"updated_at\":\"2024-06-26T14:02:58.000000Z\"}}', NULL, '2024-06-26 11:02:58', '2024-06-26 11:02:58'),
(890, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"Hajj\",\"code\":null,\"type\":\"Umrah\",\"notes\":null,\"season_id\":1,\"created_at\":\"2024-06-27T12:58:55.000000Z\",\"updated_at\":\"2024-06-27T12:58:55.000000Z\"}}', NULL, '2024-06-27 09:58:55', '2024-06-27 09:58:55'),
(891, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"Hajj1\",\"code\":null,\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"created_at\":\"2024-06-27T12:59:15.000000Z\",\"updated_at\":\"2024-06-27T12:59:15.000000Z\"}}', NULL, '2024-06-27 09:59:15', '2024-06-27 09:59:15'),
(892, 'programs', 'updated on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"name\":\"updated name\",\"notes\":\"updated notes\",\"season_id\":2,\"updated_at\":\"2024-06-27T13:00:41.000000Z\"},\"old\":{\"name\":\"Hajj\",\"notes\":null,\"season_id\":1,\"updated_at\":\"2024-06-27T12:58:55.000000Z\"}}', NULL, '2024-06-27 10:00:41', '2024-06-27 10:00:41'),
(893, 'programs', 'deleted on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 2, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":2,\"name\":\"Hajj1\",\"code\":null,\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"created_at\":\"2024-06-27T12:59:15.000000Z\",\"updated_at\":\"2024-06-27T12:59:15.000000Z\"}}', NULL, '2024-06-27 10:03:17', '2024-06-27 10:03:17'),
(894, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"Hajj1\",\"code\":1,\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"created_at\":\"2024-06-27T13:44:10.000000Z\",\"updated_at\":\"2024-06-27T13:44:10.000000Z\"}}', NULL, '2024-06-27 10:44:10', '2024-06-27 10:44:10'),
(895, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"Hajj1\",\"code\":2,\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"created_at\":\"2024-06-27T13:44:19.000000Z\",\"updated_at\":\"2024-06-27T13:44:19.000000Z\"}}', NULL, '2024-06-27 10:44:19', '2024-06-27 10:44:19'),
(896, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"Hajj1\",\"code\":\"1\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"created_at\":\"2024-06-27T13:45:51.000000Z\",\"updated_at\":\"2024-06-27T13:45:51.000000Z\"}}', NULL, '2024-06-27 10:45:51', '2024-06-27 10:45:51'),
(897, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"Hajj1\",\"code\":\"prog-2\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"created_at\":\"2024-06-27T13:46:35.000000Z\",\"updated_at\":\"2024-06-27T13:46:35.000000Z\"}}', NULL, '2024-06-27 10:46:35', '2024-06-27 10:46:35'),
(898, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"Hajj1\",\"code\":\"prog-3\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"created_at\":\"2024-06-27T13:46:40.000000Z\",\"updated_at\":\"2024-06-27T13:46:40.000000Z\"}}', NULL, '2024-06-27 10:46:40', '2024-06-27 10:46:40'),
(899, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"night_couts\":30,\"sort\":1,\"hotel_id\":1,\"residence_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-27T15:09:50.000000Z\",\"updated_at\":\"2024-06-27T15:09:50.000000Z\"}}', NULL, '2024-06-27 12:09:50', '2024-06-27 12:09:50'),
(900, 'program_hotel', 'created on program_hotel', 'Modules\\Umrah\\ProgramHotel\\App\\Models\\ProgramHotel', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"night_couts\":2,\"sort\":2,\"hotel_id\":1,\"residence_type_id\":2,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-27T15:09:50.000000Z\",\"updated_at\":\"2024-06-27T15:09:50.000000Z\"}}', NULL, '2024-06-27 12:09:50', '2024-06-27 12:09:50'),
(901, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"count\":30,\"room_type_id\":1,\"program_trip_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-27T17:06:03.000000Z\",\"updated_at\":\"2024-06-27T17:06:03.000000Z\"}}', NULL, '2024-06-27 14:06:03', '2024-06-27 14:06:03'),
(902, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"count\":2,\"room_type_id\":2,\"program_trip_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-27T17:06:03.000000Z\",\"updated_at\":\"2024-06-27T17:06:03.000000Z\"}}', NULL, '2024-06-27 14:06:03', '2024-06-27 14:06:03'),
(903, 'program_trip_room', 'updated on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 1, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"count\":22,\"room_type_id\":2,\"updated_at\":\"2024-06-27T17:06:47.000000Z\"},\"old\":{\"count\":30,\"room_type_id\":1,\"updated_at\":\"2024-06-27T17:06:03.000000Z\"}}', NULL, '2024-06-27 14:06:47', '2024-06-27 14:06:47'),
(904, 'program_trip_room', 'deleted on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 1, 'deleted', 'App\\Models\\User', 1, '{\"old\":{\"id\":1,\"count\":22,\"room_type_id\":2,\"program_trip_id\":1,\"deleted_at\":\"2024-06-27T17:08:12.000000Z\",\"created_at\":\"2024-06-27T17:06:03.000000Z\",\"updated_at\":\"2024-06-27T17:08:12.000000Z\"}}', NULL, '2024-06-27 14:08:12', '2024-06-27 14:08:12'),
(905, 'flightpath', 'created on flightpath', 'Modules\\Umrah\\Flights\\App\\Models\\Flightpath', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"from_city_id\":5,\"to_city_id\":3,\"created_at\":\"2024-06-29T07:32:04.000000Z\",\"updated_at\":\"2024-06-29T07:32:04.000000Z\"}}', NULL, '2024-06-29 04:32:04', '2024-06-29 04:32:04'),
(906, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"name\":\"el gameddddd\",\"status\":1,\"code\":\"sss\",\"description\":\"el gamed el fazee3\",\"start_date\":\"2024-04-02T00:00:00.000000Z\",\"due_date\":\"2024-08-02T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-29T08:40:00.000000Z\",\"updated_at\":\"2024-06-29T08:40:00.000000Z\"}}', NULL, '2024-06-29 05:40:00', '2024-06-29 05:40:00'),
(907, 'cost_center', 'created on cost_center', 'Modules\\Accounting\\CostCenter\\App\\Models\\CostCenter', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"name\":\"el gamedddddd\",\"status\":1,\"code\":\"sssd\",\"description\":\"el gamed el fazee3\",\"start_date\":\"2024-04-02T00:00:00.000000Z\",\"due_date\":\"2024-08-02T00:00:00.000000Z\",\"deleted_at\":null,\"created_at\":\"2024-06-29T08:40:43.000000Z\",\"updated_at\":\"2024-06-29T08:40:43.000000Z\"}}', NULL, '2024-06-29 05:40:43', '2024-06-29 05:40:43'),
(908, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"person_type\":\"person\",\"type\":\"all-program\",\"is_residence\":100,\"price\":100,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T13:33:52.000000Z\",\"updated_at\":\"2024-06-29T13:33:52.000000Z\"}}', NULL, '2024-06-29 10:33:52', '2024-06-29 10:33:52'),
(909, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"person_type\":\"person\",\"type\":\"all-program\",\"is_residence\":100,\"price\":100,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T13:56:59.000000Z\",\"updated_at\":\"2024-06-29T13:56:59.000000Z\"}}', NULL, '2024-06-29 10:56:59', '2024-06-29 10:56:59'),
(910, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"person_type\":\"person\",\"type\":\"without-visa\",\"is_residence\":100,\"price\":100,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T13:56:59.000000Z\",\"updated_at\":\"2024-06-29T13:56:59.000000Z\"}}', NULL, '2024-06-29 10:56:59', '2024-06-29 10:56:59'),
(911, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"person_type\":\"child\",\"type\":\"without-flight\",\"is_residence\":0,\"price\":200,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T13:56:59.000000Z\",\"updated_at\":\"2024-06-29T13:56:59.000000Z\"}}', NULL, '2024-06-29 10:56:59', '2024-06-29 10:56:59');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `event`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(912, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"person_type\":\"child\",\"type\":\"without-residential\",\"is_residence\":0,\"price\":200,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T13:56:59.000000Z\",\"updated_at\":\"2024-06-29T13:56:59.000000Z\"}}', NULL, '2024-06-29 10:56:59', '2024-06-29 10:56:59'),
(913, 'program_price', 'updated on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 5, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"person_type\":\"person\",\"type\":\"all-program\",\"price\":100,\"room_type_id\":2,\"updated_at\":\"2024-06-29T14:21:12.000000Z\"},\"old\":{\"person_type\":\"child\",\"type\":\"without-residential\",\"price\":200,\"room_type_id\":1,\"updated_at\":\"2024-06-29T13:56:59.000000Z\"}}', NULL, '2024-06-29 11:21:12', '2024-06-29 11:21:12'),
(914, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"person_type\":\"person\",\"all_program\":1,\"without_residence\":1,\"without_visa\":1,\"without_flight\":1,\"price\":100,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T15:31:58.000000Z\",\"updated_at\":\"2024-06-29T15:31:58.000000Z\"}}', NULL, '2024-06-29 12:31:58', '2024-06-29 12:31:58'),
(915, 'program_price', 'created on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"person_type\":\"child\",\"all_program\":0,\"without_residence\":0,\"without_visa\":0,\"without_flight\":0,\"price\":200,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T15:31:58.000000Z\",\"updated_at\":\"2024-06-29T15:31:58.000000Z\"}}', NULL, '2024-06-29 12:31:58', '2024-06-29 12:31:58'),
(916, 'program_price', 'updated on program_price', 'Modules\\Umrah\\ProgramPrice\\App\\Models\\ProgramPrice', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"person_type\":\"person\",\"all_program\":1,\"without_residence\":1,\"without_visa\":1,\"without_flight\":1,\"price\":100,\"room_type_id\":2,\"updated_at\":\"2024-06-29T15:32:34.000000Z\"},\"old\":{\"person_type\":\"child\",\"all_program\":0,\"without_residence\":0,\"without_visa\":0,\"without_flight\":0,\"price\":200,\"room_type_id\":1,\"updated_at\":\"2024-06-29T15:31:58.000000Z\"}}', NULL, '2024-06-29 12:32:34', '2024-06-29 12:32:34'),
(917, 'program_service', 'created on program_service', 'Modules\\Umrah\\ProgramService\\App\\Models\\ProgramService', 1, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"form_price\":2,\"person_price\":2,\"child_price\":2,\"baby_price\":2,\"service_id\":1,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T16:18:21.000000Z\",\"updated_at\":\"2024-06-29T16:18:21.000000Z\"}}', NULL, '2024-06-29 13:18:21', '2024-06-29 13:18:21'),
(918, 'program_service', 'created on program_service', 'Modules\\Umrah\\ProgramService\\App\\Models\\ProgramService', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"form_price\":2,\"person_price\":2,\"child_price\":2,\"baby_price\":2,\"service_id\":1,\"room_type_id\":2,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T16:18:21.000000Z\",\"updated_at\":\"2024-06-29T16:18:21.000000Z\"}}', NULL, '2024-06-29 13:18:21', '2024-06-29 13:18:21'),
(919, 'program_service', 'created on program_service', 'Modules\\Umrah\\ProgramService\\App\\Models\\ProgramService', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"form_price\":10,\"person_price\":10,\"child_price\":10,\"baby_price\":10,\"service_id\":1,\"room_type_id\":1,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T16:19:24.000000Z\",\"updated_at\":\"2024-06-29T16:19:24.000000Z\"}}', NULL, '2024-06-29 13:19:24', '2024-06-29 13:19:24'),
(920, 'program_service', 'created on program_service', 'Modules\\Umrah\\ProgramService\\App\\Models\\ProgramService', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"form_price\":20,\"person_price\":20,\"child_price\":20,\"baby_price\":20,\"service_id\":1,\"room_type_id\":2,\"program_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-29T16:19:24.000000Z\",\"updated_at\":\"2024-06-29T16:19:24.000000Z\"}}', NULL, '2024-06-29 13:19:24', '2024-06-29 13:19:24'),
(921, 'program_service', 'updated on program_service', 'Modules\\Umrah\\ProgramService\\App\\Models\\ProgramService', 4, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"form_price\":33,\"person_price\":33,\"child_price\":33,\"baby_price\":33,\"service_id\":2,\"updated_at\":\"2024-06-29T16:24:59.000000Z\"},\"old\":{\"form_price\":20,\"person_price\":20,\"child_price\":20,\"baby_price\":20,\"service_id\":1,\"updated_at\":\"2024-06-29T16:19:24.000000Z\"}}', NULL, '2024-06-29 13:24:59', '2024-06-29 13:24:59'),
(922, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"count\":1,\"room_type_id\":1,\"program_trip_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-30T09:47:57.000000Z\",\"updated_at\":\"2024-06-30T09:47:57.000000Z\"}}', NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(923, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"count\":12,\"room_type_id\":1,\"program_trip_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-30T09:47:57.000000Z\",\"updated_at\":\"2024-06-30T09:47:57.000000Z\"}}', NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(924, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"count\":2,\"room_type_id\":2,\"program_trip_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-30T09:47:57.000000Z\",\"updated_at\":\"2024-06-30T09:47:57.000000Z\"}}', NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(925, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"count\":22,\"room_type_id\":2,\"program_trip_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-30T09:47:57.000000Z\",\"updated_at\":\"2024-06-30T09:47:57.000000Z\"}}', NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(926, 'hotel_star', 'created on hotel_star', 'Modules\\Umrah\\Lookups\\App\\Models\\HotelStar', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"star\",\"stars\":8,\"deleted_at\":null,\"created_at\":\"2024-06-30T10:37:25.000000Z\",\"updated_at\":\"2024-06-30T10:37:25.000000Z\"}}', NULL, '2024-06-30 07:37:25', '2024-06-30 07:37:25'),
(927, 'hotel_star', 'updated on hotel_star', 'Modules\\Umrah\\Lookups\\App\\Models\\HotelStar', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"stars\":5,\"updated_at\":\"2024-06-30T10:41:50.000000Z\"},\"old\":{\"stars\":8,\"updated_at\":\"2024-06-30T10:37:25.000000Z\"}}', NULL, '2024-06-30 07:41:50', '2024-06-30 07:41:50'),
(928, 'hotel_star', 'updated on hotel_star', 'Modules\\Umrah\\Lookups\\App\\Models\\HotelStar', 2, 'updated', 'App\\Models\\User', 1, '{\"attributes\":{\"stars\":55,\"updated_at\":\"2024-06-30T10:42:19.000000Z\"},\"old\":{\"stars\":5,\"updated_at\":\"2024-06-30T10:41:50.000000Z\"}}', NULL, '2024-06-30 07:42:19', '2024-06-30 07:42:19'),
(929, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 2, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":2,\"name\":\"Hajj1\",\"code\":\"dsfdf-12\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:05:33.000000Z\",\"updated_at\":\"2024-06-30T11:05:33.000000Z\"}}', NULL, '2024-06-30 08:05:33', '2024-06-30 08:05:33'),
(930, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 3, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":3,\"name\":\"Hajj1\",\"code\":\"ABC-1\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:06:23.000000Z\",\"updated_at\":\"2024-06-30T11:06:23.000000Z\"}}', NULL, '2024-06-30 08:06:23', '2024-06-30 08:06:23'),
(931, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 4, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":4,\"name\":\"Hajj1\",\"code\":\"ABC-2\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:06:34.000000Z\",\"updated_at\":\"2024-06-30T11:06:34.000000Z\"}}', NULL, '2024-06-30 08:06:34', '2024-06-30 08:06:34'),
(932, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 5, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":5,\"name\":\"Hajj1\",\"code\":\"ABC-1\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:07:34.000000Z\",\"updated_at\":\"2024-06-30T11:07:34.000000Z\"}}', NULL, '2024-06-30 08:07:34', '2024-06-30 08:07:34'),
(933, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 6, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"Hajj1\",\"code\":\"ABC-00000002\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:10:04.000000Z\",\"updated_at\":\"2024-06-30T11:10:04.000000Z\"}}', NULL, '2024-06-30 08:10:04', '2024-06-30 08:10:04'),
(934, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"name\":\"Hajj1\",\"code\":\"ABC-00000001\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:10:24.000000Z\",\"updated_at\":\"2024-06-30T11:10:24.000000Z\"}}', NULL, '2024-06-30 08:10:24', '2024-06-30 08:10:24'),
(935, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"name\":\"Hajj1\",\"code\":\"ABC-00000002\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:11:00.000000Z\",\"updated_at\":\"2024-06-30T11:11:00.000000Z\"}}', NULL, '2024-06-30 08:11:00', '2024-06-30 08:11:00'),
(936, 'programs', 'created on programs', 'Modules\\Umrah\\Programs\\App\\Models\\Programs', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"name\":\"Hajj1\",\"code\":\"00000001\",\"type\":\"Umrah\",\"notes\":\"notes\",\"season_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T11:11:41.000000Z\",\"updated_at\":\"2024-06-30T11:11:41.000000Z\"}}', NULL, '2024-06-30 08:11:41', '2024-06-30 08:11:41'),
(937, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 7, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":7,\"count\":1,\"room_type_id\":1,\"program_trip_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:00:58.000000Z\",\"updated_at\":\"2024-06-30T12:00:58.000000Z\"}}', NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(938, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 8, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":8,\"count\":12,\"room_type_id\":1,\"program_trip_id\":1,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:00:58.000000Z\",\"updated_at\":\"2024-06-30T12:00:58.000000Z\"}}', NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(939, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 9, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":9,\"count\":2,\"room_type_id\":2,\"program_trip_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:00:58.000000Z\",\"updated_at\":\"2024-06-30T12:00:58.000000Z\"}}', NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(940, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 10, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":10,\"count\":22,\"room_type_id\":2,\"program_trip_id\":2,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:00:58.000000Z\",\"updated_at\":\"2024-06-30T12:00:58.000000Z\"}}', NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(941, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 11, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":11,\"count\":1,\"room_type_id\":1,\"program_trip_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:03:08.000000Z\",\"updated_at\":\"2024-06-30T12:03:08.000000Z\"}}', NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(942, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 12, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":12,\"count\":12,\"room_type_id\":1,\"program_trip_id\":3,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:03:08.000000Z\",\"updated_at\":\"2024-06-30T12:03:08.000000Z\"}}', NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(943, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 13, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":13,\"count\":2,\"room_type_id\":2,\"program_trip_id\":4,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:03:08.000000Z\",\"updated_at\":\"2024-06-30T12:03:08.000000Z\"}}', NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(944, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 14, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":14,\"count\":22,\"room_type_id\":2,\"program_trip_id\":4,\"deleted_at\":null,\"created_at\":\"2024-06-30T12:03:08.000000Z\",\"updated_at\":\"2024-06-30T12:03:08.000000Z\"}}', NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(945, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 15, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":15,\"count\":1,\"room_type_id\":1,\"program_trip_id\":5,\"deleted_at\":null,\"created_at\":\"2024-06-30T14:55:36.000000Z\",\"updated_at\":\"2024-06-30T14:55:36.000000Z\"}}', NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(946, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 16, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":16,\"count\":12,\"room_type_id\":1,\"program_trip_id\":5,\"deleted_at\":null,\"created_at\":\"2024-06-30T14:55:36.000000Z\",\"updated_at\":\"2024-06-30T14:55:36.000000Z\"}}', NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(947, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 17, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":17,\"count\":2,\"room_type_id\":2,\"program_trip_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-30T14:55:36.000000Z\",\"updated_at\":\"2024-06-30T14:55:36.000000Z\"}}', NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(948, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 18, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":18,\"count\":22,\"room_type_id\":2,\"program_trip_id\":6,\"deleted_at\":null,\"created_at\":\"2024-06-30T14:55:36.000000Z\",\"updated_at\":\"2024-06-30T14:55:36.000000Z\"}}', NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(949, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 19, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":19,\"count\":1,\"room_type_id\":1,\"program_trip_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:06:06.000000Z\",\"updated_at\":\"2024-06-30T15:06:06.000000Z\"}}', NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(950, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 20, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":20,\"count\":12,\"room_type_id\":1,\"program_trip_id\":7,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:06:06.000000Z\",\"updated_at\":\"2024-06-30T15:06:06.000000Z\"}}', NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(951, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 21, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":21,\"count\":2,\"room_type_id\":2,\"program_trip_id\":8,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:06:06.000000Z\",\"updated_at\":\"2024-06-30T15:06:06.000000Z\"}}', NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(952, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 22, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":22,\"count\":22,\"room_type_id\":2,\"program_trip_id\":8,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:06:06.000000Z\",\"updated_at\":\"2024-06-30T15:06:06.000000Z\"}}', NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(953, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 23, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":23,\"count\":1,\"room_type_id\":1,\"program_trip_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:19:57.000000Z\",\"updated_at\":\"2024-06-30T15:19:57.000000Z\"}}', NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57'),
(954, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 24, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":24,\"count\":12,\"room_type_id\":1,\"program_trip_id\":9,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:19:57.000000Z\",\"updated_at\":\"2024-06-30T15:19:57.000000Z\"}}', NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57'),
(955, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 25, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":25,\"count\":2,\"room_type_id\":2,\"program_trip_id\":10,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:19:57.000000Z\",\"updated_at\":\"2024-06-30T15:19:57.000000Z\"}}', NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57'),
(956, 'program_trip_room', 'created on program_trip_room', 'Modules\\Umrah\\ProgramTripRoom\\App\\Models\\ProgramTripRoom', 26, 'created', 'App\\Models\\User', 1, '{\"attributes\":{\"id\":26,\"count\":22,\"room_type_id\":2,\"program_trip_id\":10,\"deleted_at\":null,\"created_at\":\"2024-06-30T15:19:57.000000Z\",\"updated_at\":\"2024-06-30T15:19:57.000000Z\"}}', NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `additional_data`
--

CREATE TABLE `additional_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `additionalable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `additionalable_type` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `additional_data`
--

INSERT INTO `additional_data` (`id`, `additionalable_id`, `additionalable_type`, `key`, `value`, `is_default`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 1, 'Modules\\MasterData\\Client\\App\\Models\\Client', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 08:10:06', '2024-06-04 08:10:06'),
(6, 3, 'Modules\\MasterData\\Client\\App\\Models\\Client', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 10:43:34', '2024-06-04 10:43:34'),
(7, 2, 'Modules\\MasterData\\Client\\App\\Models\\Client', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 10:45:28', '2024-06-04 10:45:28'),
(8, 2, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 10:53:56', '2024-06-04 10:53:56'),
(9, 3, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 10:54:36', '2024-06-04 10:54:36'),
(10, 4, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 10:54:51', '2024-06-04 10:54:51'),
(11, 5, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 10:55:03', '2024-06-04 10:55:03'),
(12, 1, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 10:55:45', '2024-06-04 10:55:45'),
(13, 4, 'Modules\\MasterData\\Client\\App\\Models\\Client', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-04 11:03:06', '2024-06-04 11:03:06'),
(14, 1, 'Modules\\Accounting\\Custodian\\App\\Models\\Custodian', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-05 06:04:53', '2024-06-05 06:04:53'),
(15, 2, 'Modules\\Accounting\\Custodian\\App\\Models\\Custodian', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-05 06:05:15', '2024-06-05 06:05:15'),
(16, 3, 'Modules\\Accounting\\Custodian\\App\\Models\\Custodian', '{\"en\":null}', '{\"en\":null}', NULL, NULL, '2024-06-05 06:05:34', '2024-06-05 06:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `status`, `city_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"ELRAML STATION\",\"ar\":\"\\u0645\\u062d\\u0637\\u0647 \\u0627\\u0644\\u0631\\u0645\\u0644\"}', 1, 1, NULL, '2024-05-30 12:00:31', '2024-06-04 09:04:42'),
(2, '{\"en\":\"ELNAKHEL\",\"ar\":\"\\u0627\\u0644\\u0646\\u062e\\u064a\\u0644\"}', 1, 2, NULL, '2024-06-04 06:50:23', '2024-06-04 06:50:23'),
(3, '{\"en\":\"MAMAK\",\"ar\":\"\\u0645\\u0627\\u0645\\u0627\\u0643\"}', 1, 3, NULL, '2024-06-04 06:52:09', '2024-06-04 06:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_mobile` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `branchable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branchable_type` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `branch_code`, `status`, `email`, `mobile`, `user_name`, `user_email`, `user_mobile`, `area_id`, `branchable_id`, `branchable_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Main branch\",\"ar\":\"\\u0627\\u0644\\u0645\\u0631\\u0643\\u0632 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\"}', '01', 1, 'tsmv_admin@mv-is.com', '01111111111', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(2, '{\"en\":\"AVIATION\",\"ar\":\"\\u0637\\u064a\\u0631\\u0627\\u0646\"}', '02', 1, 'AVIATION@KTRAVEL.COM', '034848971', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-06-04 07:21:06', '2024-06-04 07:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `chart_accounts`
--

CREATE TABLE `chart_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `code` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_accounts`
--

INSERT INTO `chart_accounts` (`id`, `name`, `status`, `code`, `type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"CALCULATERS\",\"ar\":\"\\u0627\\u0644\\u0627\\u062a \\u062d\\u0627\\u0633\\u0628\\u0647\"}', 1, '100002001', 3, NULL, '2024-06-01 06:30:45', '2024-06-02 06:04:46'),
(2, '{\"en\":\"ELECTIC DEVICES\",\"ar\":\"\\u0627\\u0644\\u0627\\u062c\\u0647\\u0632\\u0629 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0626\\u064a\\u0647\"}', 1, '100002002', 3, NULL, '2024-06-01 06:31:29', '2024-06-02 06:04:58'),
(3, '{\"en\":\"PHOTO COPIES\",\"ar\":\"\\u0645\\u0627\\u0643\\u0628\\u0646\\u0627\\u062a \\u0627\\u0644\\u062a\\u0635\\u0648\\u064a\\u0631\"}', 1, '100002003', 3, NULL, '2024-06-01 06:32:12', '2024-06-02 06:05:14'),
(4, '{\"en\":\"COMPUTERS\",\"ar\":\"\\u0643\\u0645\\u0628\\u064a\\u0648\\u062a\\u0631\\u0627\\u062a\"}', 1, '100002004', 3, NULL, '2024-06-01 06:33:06', '2024-06-02 06:05:40'),
(5, '{\"en\":\"PHONES\",\"ar\":\"\\u062a\\u0644\\u064a\\u0641\\u0648\\u0646\\u0627\\u062a\"}', 1, '100002005', 3, NULL, '2024-06-01 06:33:36', '2024-06-02 06:05:51'),
(6, '{\"en\":\"WEBCAM\",\"ar\":\"\\u0643\\u0627\\u0645\\u064a\\u0631\\u0627\\u062a \\u0645\\u0631\\u0627\\u0642\\u0628\\u0647\"}', 1, '100002006', 3, NULL, '2024-06-01 06:34:10', '2024-06-02 06:06:04'),
(7, '{\"en\":\"SAFE\",\"ar\":\"\\u0627\\u0644\\u062e\\u0632\\u0646\\u0647 \\u0627\\u0635\\u0648\\u0644 \\u062b\\u0627\\u0628\\u062a\\u0629\"}', 1, '100002007', 3, NULL, '2024-06-01 06:34:42', '2024-06-05 05:52:49'),
(8, '{\"en\":\"NETWORK\",\"ar\":\"\\u0634\\u0628\\u0643\\u0647 \\u0627\\u0644\\u0646\\u062a\"}', 1, '100002008', 3, NULL, '2024-06-01 06:35:20', '2024-06-02 06:06:26'),
(9, '{\"en\":\"MONEY COUNTING MACHINE\",\"ar\":\"\\u0645\\u0627\\u0643\\u064a\\u0646\\u0647 \\u0639\\u062f \\u0627\\u0644\\u0646\\u0642\\u062f\\u064a\\u0647\"}', 1, '100002009', 3, NULL, '2024-06-01 06:35:58', '2024-06-02 06:06:38'),
(10, '{\"en\":\"PROGRAME COMPUTER\",\"ar\":\"\\u0628\\u0631\\u0627\\u0645\\u062c \\u0627\\u0644\\u0643\\u0645\\u0628\\u064a\\u0648\\u062a\\u0631\"}', 1, '100003001', 4, NULL, '2024-06-01 06:38:42', '2024-06-02 06:07:29'),
(11, '{\"en\":\"LICENS\",\"ar\":\"\\u0627\\u0644\\u0631\\u062e\\u0635\\u0647\"}', 1, '100004001', 5, NULL, '2024-06-01 06:40:34', '2024-06-02 06:07:40'),
(12, '{\"en\":\"EGP ( CASH-IN-HAND ) TOUR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629\"}', 1, '211', 7, '2024-06-04 05:22:26', '2024-06-01 06:46:51', '2024-06-04 05:22:26'),
(13, '{\"en\":\"USD ( CASH-IN-HAND ) TOUR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0627\\u0631 \\u0633\\u064a\\u0627\\u062d\\u0629\"}', 1, '212', 7, '2024-06-04 05:22:32', '2024-06-01 06:47:25', '2024-06-04 05:22:32'),
(14, '{\"en\":\"EUR ( CASH-IN-HAND ) TOUR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u064a\\u0648\\u0631\\u0648 \\u0633\\u064a\\u0627\\u062d\\u0629\"}', 1, '213', 7, '2024-06-04 05:22:39', '2024-06-01 06:48:47', '2024-06-04 05:22:39'),
(15, '{\"en\":\"GBP ( CASH-IN-HAND ) TOUR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0627\\u0633\\u062a\\u0631\\u0644\\u064a\\u0646\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629\"}', 1, '214', 7, '2024-06-04 05:22:46', '2024-06-01 06:49:35', '2024-06-04 05:22:46'),
(16, '{\"en\":\"SAR ( CASH-IN-HAND ) TOUR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0629\"}', 1, '215', 7, '2024-06-04 05:22:52', '2024-06-01 06:50:22', '2024-06-04 05:22:52'),
(17, '{\"en\":\"EGP ( CASH-IN-HAND ) -ISLAMIC\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0629 \\u062f\\u064a\\u0646\\u064a\\u0647\"}', 1, '216', 7, '2024-06-04 05:23:02', '2024-06-01 06:51:27', '2024-06-04 05:23:02'),
(18, '{\"en\":\"SAR ( CASH-IN-HAND ) -ISLAMIC\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0629 \\u062f\\u064a\\u0646\\u064a\\u0647\"}', 1, '217', 7, '2024-06-04 05:23:08', '2024-06-01 06:52:02', '2024-06-04 05:23:08'),
(19, '{\"en\":\"BANK CIB -EGP\",\"ar\":\"\\u0628\\u0646\\u0643 \\u0627\\u0644\\u062a\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0649 \\u0645\\u0635\\u0631\\u0649\"}', 1, '200002001', 9, NULL, '2024-06-01 07:04:58', '2024-06-02 06:09:53'),
(20, '{\"en\":\"BANK CIB -USD\",\"ar\":\"\\u0628\\u0646\\u0643 \\u0627\\u0644\\u062a\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0649 \\u062f\\u0648\\u0644\\u0627\\u0631\"}', 1, '200002002', 9, NULL, '2024-06-01 07:05:32', '2024-06-02 06:10:04'),
(21, '{\"en\":\"BANK CIB -SAR\",\"ar\":\"\\u0628\\u0646\\u0643 \\u0627\\u0644\\u062a\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u062f\\u0648\\u0644\\u0649 \\u0631\\u064a\\u0627\\u0644\"}', 1, '200002003', 9, NULL, '2024-06-01 07:06:09', '2024-06-02 06:10:14'),
(22, '{\"en\":\"EGYPT BANK EGP\",\"ar\":\"\\u0628\\u0646\\u0643 \\u0645\\u0635\\u0631 \\u0645\\u0635\\u0631\\u0649\"}', 1, '200002004', 9, NULL, '2024-06-01 07:07:02', '2024-06-02 06:10:25'),
(23, '{\"en\":\"EGYPT BANK USD\",\"ar\":\"\\u0628\\u0646\\u0643 \\u0645\\u0635\\u0631 \\u062f\\u0648\\u0644\\u0627\\u0631\"}', 1, '200002005', 9, NULL, '2024-06-01 07:07:25', '2024-06-02 06:10:37'),
(24, '{\"en\":\"EGYPT BANK SAR\",\"ar\":\"\\u0628\\u0646\\u0643 \\u0645\\u0635\\u0631 \\u0631\\u064a\\u0627\\u0644\"}', 1, '200002006', 9, NULL, '2024-06-01 07:07:49', '2024-06-02 06:10:47'),
(25, '{\"en\":\"CHEQUE UNDER COLLECTION - EGP\",\"ar\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 \\u0645\\u0635\\u0631\\u0649\"}', 1, '200003001', 10, NULL, '2024-06-01 07:33:29', '2024-06-02 06:11:32'),
(26, '{\"en\":\"CHEQUE UNDER COLLECTION - USD\",\"ar\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 - \\u062f\\u0648\\u0644\\u0627\\u0631\"}', 1, '200003002', 10, NULL, '2024-06-01 07:34:04', '2024-06-02 06:11:47'),
(27, '{\"en\":\"CHEQUE UNDER COLLECTION - EUR\",\"ar\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 - \\u064a\\u0648\\u0631\\u0648\"}', 1, '200003003', 10, NULL, '2024-06-01 07:34:33', '2024-06-02 06:11:58'),
(28, '{\"en\":\"CHEQUE UNDER COLLECTION - SAR\",\"ar\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644 - \\u0631\\u064a\\u0627\\u0644\"}', 1, '200003004', 10, NULL, '2024-06-01 07:35:09', '2024-06-02 06:12:09'),
(29, '{\"en\":\"VAT - DEDUCTION FROM RESOURCE\",\"ar\":\"\\u0636\\u0631\\u064a\\u0628\\u0647 \\u062e\\u0635\\u0645 \\u0648\\u062a\\u062d\\u0635\\u064a\\u0644\"}', 1, '200007001', 14, NULL, '2024-06-01 07:51:34', '2024-06-02 06:15:29'),
(30, '{\"en\":\"PREPAID EXPENSES\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0645\\u0642\\u062f\\u0645\"}', 1, '200007002', 14, NULL, '2024-06-01 07:52:23', '2024-06-02 06:15:38'),
(31, '{\"en\":\"ACCURED REVENUE\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0645\\u0633\\u062a\\u062d\\u0642\"}', 1, '200007003', 14, NULL, '2024-06-01 07:52:54', '2024-06-02 06:15:48'),
(32, '{\"en\":\".ALNOAMANY FOR TORISM\",\"ar\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u0639\\u0627\\u0645\\u0647 .\"}', 1, '200004001', 11, NULL, '2024-06-01 08:21:42', '2024-06-04 10:05:16'),
(33, '{\"en\":\"NEW HOURS\",\"ar\":\"\\u0646\\u064a\\u0648 \\u062d\\u0648\\u0631\\u0633\"}', 1, '200004002', 11, '2024-06-04 10:07:12', '2024-06-01 08:22:16', '2024-06-04 10:07:12'),
(34, '{\"en\":\"IN TRIP\",\"ar\":\"\\u0627\\u0646 \\u062a\\u0631\\u0628\"}', 1, '200004003', 11, '2024-06-04 10:05:41', '2024-06-01 08:22:43', '2024-06-04 10:05:41'),
(35, '{\"en\":\"MYASEEN\",\"ar\":\"\\u0645\\u064a\\u0627\\u0633\\u064a\\u0646\"}', 1, '200004004', 11, '2024-06-04 10:05:50', '2024-06-01 08:24:22', '2024-06-04 10:05:50'),
(36, '{\"en\":\"TULEEN TOURS\",\"ar\":\"\\u062a\\u0648\\u0644\\u064a\\u0646 \\u062a\\u0648\\u0631\\u0632\"}', 1, '200004005', 11, '2024-06-04 10:05:59', '2024-06-01 08:26:20', '2024-06-04 10:05:59'),
(37, '{\"en\":\"AHMED ESSAWY\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u0639\\u064a\\u0633\\u0648\\u0649\"}', 1, '200008001', 15, NULL, '2024-06-01 08:31:01', '2024-06-02 06:16:50'),
(38, '{\"en\":\"HEBA\",\"ar\":\"\\u0647\\u0628\\u0647\"}', 1, '200008002', 15, NULL, '2024-06-01 08:31:24', '2024-06-02 06:17:05'),
(39, '{\"en\":\"MARAWAN\",\"ar\":\"\\u0645\\u0631\\u0648\\u0627\\u0646\"}', 1, '200008003', 15, NULL, '2024-06-01 08:31:47', '2024-06-02 06:17:16'),
(40, '{\"en\":\"FATHY MOHAMED ALY\",\"ar\":\"\\u0641\\u062a\\u062d\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0639\\u0644\\u0649\"}', 1, '200008004', 15, NULL, '2024-06-01 08:32:13', '2024-06-02 06:17:26'),
(41, '{\"en\":\"SAID\",\"ar\":\"\\u0627\\u0644\\u0634\\u064a\\u062e \\u0633\\u0639\\u064a\\u062f\"}', 1, '200008005', 15, NULL, '2024-06-01 08:33:35', '2024-06-02 06:17:36'),
(42, '{\"en\":\"MERNA ZAGLOUL\",\"ar\":\"\\u0645\\u064a\\u0631\\u0646\\u0627 \\u0632\\u063a\\u0644\\u0648\\u0644\"}', 1, '200008006', 15, NULL, '2024-06-01 08:34:12', '2024-06-02 06:17:46'),
(43, '{\"en\":\"REEM\",\"ar\":\"\\u0631\\u064a\\u0645\"}', 1, '200008007', 15, NULL, '2024-06-01 08:34:37', '2024-06-02 06:17:55'),
(44, '{\"en\":\"MOHAMED ABD ELGELIL\",\"ar\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0628\\u062f \\u0627\\u0644\\u062c\\u0644\\u064a\\u0644\"}', 1, '200008008', 15, NULL, '2024-06-01 08:35:07', '2024-06-02 06:18:08'),
(45, '{\"en\":\"DOAA AYMAN\",\"ar\":\"\\u062f\\u0639\\u0627\\u0621 \\u0627\\u064a\\u0645\\u0646\"}', 1, '200008009', 15, NULL, '2024-06-01 08:35:36', '2024-06-02 06:18:21'),
(46, '{\"en\":\"KAREEM INSURANCE\",\"ar\":\"\\u0643\\u0631\\u064a\\u0645 \\u062a\\u0623\\u0645\\u064a\\u0646\\u0627\\u062a\"}', 1, '200008010', 15, NULL, '2024-06-01 08:38:30', '2024-06-02 06:18:33'),
(47, '{\"en\":\"AYA\",\"ar\":\"\\u0627\\u064a\\u0647\"}', 1, '200008011', 15, NULL, '2024-06-01 08:38:55', '2024-06-02 06:18:45'),
(48, '{\"en\":\"ESLAM YAKOOT\",\"ar\":\"\\u0627\\u0633\\u0644\\u0627\\u0645 \\u064a\\u0627\\u0642\\u0648\\u062a\"}', 1, '200008012', 15, NULL, '2024-06-01 09:27:21', '2024-06-02 06:18:54'),
(49, '{\"en\":\"AMR ELMOHAMDY\",\"ar\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0645\\u062d\\u0645\\u062f\\u0649\"}', 1, '200008013', 15, NULL, '2024-06-01 09:28:06', '2024-06-02 06:19:05'),
(50, '{\"en\":\"SHAABAN\",\"ar\":\"\\u0634\\u0639\\u0628\\u0627\\u0646\"}', 1, '200008014', 15, NULL, '2024-06-01 09:29:15', '2024-06-02 06:19:21'),
(51, '{\"en\":\"AHMED ASHRAF\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u0627\\u0634\\u0631\\u0641\"}', 1, '200008015', 15, NULL, '2024-06-01 09:29:44', '2024-06-02 06:19:35'),
(52, '{\"en\":\"AMR YOUSEF\",\"ar\":\"\\u0639\\u0645\\u0631\\u0648 \\u064a\\u0648\\u0633\\u0641\"}', 1, '200008016', 15, NULL, '2024-06-01 09:30:30', '2024-06-02 06:19:45'),
(53, '{\"en\":\"AHMED NOUR\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u0646\\u0648\\u0631\"}', 1, '200008017', 15, NULL, '2024-06-01 09:31:00', '2024-06-02 06:19:55'),
(54, '{\"en\":\"MOHAMED ATAYIA\",\"ar\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0637\\u064a\\u0647\"}', 1, '200008018', 15, NULL, '2024-06-01 09:31:57', '2024-06-02 06:20:06'),
(55, '{\"en\":\"AMR EL ZOUGHBY\",\"ar\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0632\\u063a\\u0628\\u064a\"}', 1, '200008019', 15, NULL, '2024-06-01 09:32:42', '2024-06-02 06:20:17'),
(56, '{\"en\":\"MENA HAFEZ\",\"ar\":\"\\u0645\\u0646\\u0647 \\u062d\\u0627\\u0641\\u0638\"}', 1, '200008020', 15, NULL, '2024-06-01 09:33:19', '2024-06-02 06:20:26'),
(57, '{\"en\":\"MENA ABD ALLAH\",\"ar\":\"\\u0645\\u0646\\u0647 \\u0639\\u0628\\u062f \\u0627\\u0644\\u0644\\u0647\"}', 1, '200008021', 15, NULL, '2024-06-01 09:33:55', '2024-06-02 06:20:37'),
(58, '{\"en\":\"ABDELRHMAN\",\"ar\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0631\\u062d\\u0645\\u0646\"}', 1, '200008022', 15, NULL, '2024-06-01 09:34:31', '2024-06-02 06:20:46'),
(59, '{\"en\":\"MOHANAD\",\"ar\":\"\\u0645\\u0647\\u0646\\u062f\"}', 1, '200008023', 15, NULL, '2024-06-01 09:35:00', '2024-06-02 06:20:55'),
(60, '{\"en\":\"MAI\",\"ar\":\"\\u0645\\u064a\"}', 1, '200008024', 15, NULL, '2024-06-01 09:35:21', '2024-06-02 06:21:04'),
(61, '{\"en\":\"AHMED ESSAWY LOANS\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u0639\\u064a\\u0633\\u0648\\u0649 \\u0633\\u0644\\u0641\"}', 1, '200009001', 16, NULL, '2024-06-01 09:41:51', '2024-06-02 06:21:41'),
(62, '{\"en\":\"HEBA LOANS\",\"ar\":\"\\u0647\\u0628\\u0647  \\u0633\\u0644\\u0641\"}', 1, '200009002', 16, NULL, '2024-06-01 09:43:53', '2024-06-02 06:21:51'),
(63, '{\"en\":\"MARAWAN LOANS\",\"ar\":\"\\u0645\\u0631\\u0648\\u0627\\u0646 \\u0633\\u0644\\u0641\"}', 1, '200009003', 16, NULL, '2024-06-01 09:45:39', '2024-06-02 06:22:00'),
(64, '{\"en\":\"FATHY MOHAMED ALY LOANS\",\"ar\":\"\\u0641\\u062a\\u062d\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0639\\u0644\\u0649\\t\\u0633\\u0644\\u0641\"}', 1, '200009004', 16, NULL, '2024-06-01 09:46:28', '2024-06-02 06:22:10'),
(65, '{\"en\":\"SAID LOANS\",\"ar\":\"\\u0627\\u0644\\u0634\\u064a\\u062e \\u0633\\u0639\\u064a\\u062f\\t\\u0633\\u0644\\u0641\"}', 1, '200009005', 16, NULL, '2024-06-01 09:48:12', '2024-06-02 06:22:20'),
(66, '{\"en\":\"MERNA ZAGLOUL LOANS\",\"ar\":\"\\u0645\\u064a\\u0631\\u0646\\u0627 \\u0632\\u063a\\u0644\\u0648\\u0644\\t\\u0633\\u0644\\u0641\"}', 1, '200009006', 16, NULL, '2024-06-01 09:49:19', '2024-06-02 06:22:30'),
(67, '{\"en\":\"REEM LOANS\",\"ar\":\"\\u0631\\u064a\\u0645\\t\\u0633\\u0644\\u0641\"}', 1, '200009007', 16, NULL, '2024-06-01 09:50:11', '2024-06-02 06:22:40'),
(68, '{\"en\":\"MOHAMED ABD ELGELIL LOANS\",\"ar\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0628\\u062f \\u0627\\u0644\\u062c\\u0644\\u064a\\u0644\\t\\u0633\\u0644\\u0641\"}', 1, '200009008', 16, NULL, '2024-06-01 09:51:11', '2024-06-02 06:22:52'),
(69, '{\"en\":\"DOAA AYMAN LOANS\",\"ar\":\"\\u062f\\u0639\\u0627\\u0621 \\u0627\\u064a\\u0645\\u0646\\t\\u0633\\u0644\\u0641\"}', 1, '200009009', 16, NULL, '2024-06-01 09:52:04', '2024-06-02 06:23:02'),
(70, '{\"en\":\"KAREEM INSURANCE LOANS\",\"ar\":\"\\u0643\\u0631\\u064a\\u0645 \\u062a\\u0623\\u0645\\u064a\\u0646\\u0627\\u062a \\u0633\\u0644\\u0641\"}', 1, '200009010', 16, NULL, '2024-06-01 09:52:48', '2024-06-02 06:23:12'),
(71, '{\"en\":\"AYA LOANS\",\"ar\":\"\\u0627\\u064a\\u0647\\t\\u0633\\u0644\\u0641\"}', 1, '200009011', 16, NULL, '2024-06-01 09:53:32', '2024-06-02 06:23:22'),
(72, '{\"en\":\"ESLAM YAKOOT LOANS\",\"ar\":\"\\u0627\\u0633\\u0644\\u0627\\u0645 \\u064a\\u0627\\u0642\\u0648\\u062a\\t\\u0633\\u0644\\u0641\"}', 1, '200009012', 16, NULL, '2024-06-01 09:54:05', '2024-06-02 06:23:32'),
(73, '{\"en\":\"AMR ELMOHAMDY LOANS\",\"ar\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0645\\u062d\\u0645\\u062f\\u0649\\t\\u0633\\u0644\\u0641\"}', 1, '200009013', 16, NULL, '2024-06-01 09:54:40', '2024-06-02 06:23:43'),
(74, '{\"en\":\"SHAABAN LOANS\",\"ar\":\"\\u0634\\u0639\\u0628\\u0627\\u0646\\t\\u0633\\u0644\\u0641\"}', 1, '200009014', 16, NULL, '2024-06-01 09:55:11', '2024-06-02 06:23:55'),
(75, '{\"en\":\"AHMED ASHRAF LOUNS\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u0627\\u0634\\u0631\\u0641\\t\\u0633\\u0644\\u0641\"}', 1, '200009015', 16, NULL, '2024-06-01 09:55:59', '2024-06-02 06:24:17'),
(76, '{\"en\":\"AMR YOUSEF LOANS\",\"ar\":\"\\u0639\\u0645\\u0631\\u0648 \\u064a\\u0648\\u0633\\u0641\\t\\u0633\\u0644\\u0641\"}', 1, '200009016', 16, NULL, '2024-06-01 09:56:41', '2024-06-02 06:24:27'),
(77, '{\"en\":\"AHMED NOUR LOANS\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u0646\\u0648\\u0631\\t\\u0633\\u0644\\u0641\"}', 1, '200009017', 16, NULL, '2024-06-01 09:57:15', '2024-06-02 06:24:38'),
(78, '{\"en\":\"MOHAMED ATAYIA LOANS\",\"ar\":\"\\u0645\\u062d\\u0645\\u062f \\u0639\\u0637\\u064a\\u0647\\t\\u0633\\u0644\\u0641\"}', 1, '200009018', 16, NULL, '2024-06-01 10:01:06', '2024-06-02 06:24:48'),
(79, '{\"en\":\"AMR EL ZOUGHBY LOANS\",\"ar\":\"\\u0639\\u0645\\u0631\\u0648 \\u0627\\u0644\\u0632\\u063a\\u0628\\u064a\\t\\u0633\\u0644\\u0641\"}', 1, '200009019', 16, NULL, '2024-06-01 10:01:37', '2024-06-02 06:25:00'),
(80, '{\"en\":\"MENA HAFEZ LOANS\",\"ar\":\"\\u0645\\u0646\\u0647 \\u062d\\u0627\\u0641\\u0638\\t\\u0633\\u0644\\u0641\"}', 1, '200009020', 16, NULL, '2024-06-01 10:02:58', '2024-06-02 06:25:11'),
(81, '{\"en\":\"MENA ABD ALLAH LOANS\",\"ar\":\"\\u0645\\u0646\\u0647 \\u0639\\u0628\\u062f \\u0627\\u0644\\u0644\\u0647\\t\\u0633\\u0644\\u0641\"}', 1, '200009021', 16, NULL, '2024-06-01 10:07:08', '2024-06-02 06:25:21'),
(82, '{\"en\":\"ABDELRHMAN LOANS\",\"ar\":\"\\u0639\\u0628\\u062f \\u0627\\u0644\\u0631\\u062d\\u0645\\u0646\\t\\u0633\\u0644\\u0641\"}', 1, '200009022', 16, NULL, '2024-06-01 10:08:00', '2024-06-02 06:25:38'),
(83, '{\"en\":\"MOHANAD LOANS\",\"ar\":\"\\u0645\\u0647\\u0646\\u062f\\t\\u0633\\u0644\\u0641\"}', 1, '200009023', 16, NULL, '2024-06-01 10:08:36', '2024-06-02 06:25:56'),
(84, '{\"en\":\"MAI LOANS\",\"ar\":\"\\u0645\\u064a\\t\\u0633\\u0644\\u0641\"}', 1, '200009024', 16, NULL, '2024-06-01 10:09:04', '2024-06-02 06:26:07'),
(85, '{\"en\":\"VISA ESLAM\",\"ar\":\"\\u0641\\u064a\\u0632\\u0627 \\u0627\\u0633\\u0644\\u0627\\u0645\"}', 0, '23001', 17, '2024-06-02 08:58:09', '2024-06-01 10:35:40', '2024-06-02 08:58:09'),
(86, '{\"en\":\"AHMED KHALED\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u062e\\u0627\\u0644\\u062f \\u0631\\u0627\\u0633 \\u0627\\u0644\\u0645\\u0627\\u0644\"}', 1, '300001001', 20, NULL, '2024-06-02 04:19:56', '2024-06-05 05:55:17'),
(87, '{\"en\":\"AHMED NOUR CAPITAL\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u0646\\u0648\\u0631  \\u0631\\u0627\\u0633 \\u0627\\u0644\\u0645\\u0627\\u0644\"}', 1, '300001002', 20, NULL, '2024-06-02 04:22:16', '2024-06-02 06:33:52'),
(88, '{\"en\":\"PROFIT AND LOSSES OF PREVIOUS YEARS\",\"ar\":\"\\u0645\\u0643\\u0627\\u0633\\u0628 \\u0648 \\u062e\\u0633\\u0627\\u0626\\u0631 \\u0633\\u0646\\u0648\\u0627\\u062a \\u0633\\u0627\\u0628\\u0642\\u0647\"}', 1, '300002001', 21, NULL, '2024-06-02 04:26:29', '2024-06-02 06:34:36'),
(89, '{\"en\":\"AHMED KHALED - PARTNERS CREDIT\",\"ar\":\"\\u0627\\u062d\\u0645\\u062f \\u062e\\u0627\\u0644\\u062f - \\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0627\\u0621\"}', 1, '300003001', 22, NULL, '2024-06-02 04:30:08', '2024-06-02 06:35:28'),
(90, '{\"en\":\"TAX DEPARTMENT AS TAX DEDUCTION AND THE ADDETION OF\",\"ar\":\"\\u0636\\u0631\\u064a\\u0628\\u0647 \\u0627\\u0644\\u062e\\u0635\\u0645 \\u0648\\u0627\\u0644\\u0627\\u0636\\u0627\\u0641\\u0647\"}', 1, '300004001', 23, NULL, '2024-06-02 05:24:47', '2024-06-02 06:36:03'),
(91, '{\"en\":\"VAT 14%\",\"ar\":\"\\u0636\\u0631\\u0633\\u064a\\u0647 \\u0627\\u0644\\u0642\\u064a\\u0645\\u0647 \\u0627\\u0644\\u0645\\u0636\\u0627\\u0641\\u0629\"}', 1, '300004002', 23, NULL, '2024-06-02 05:27:29', '2024-06-02 06:36:13'),
(92, '{\"en\":\"TAX DEPARTMENT AS EARNING TAX\",\"ar\":\"\\u0636\\u0631\\u064a\\u0628\\u0647 \\u0627\\u0644\\u062f\\u062e\\u0644\"}', 1, '300004003', 23, NULL, '2024-06-02 05:45:34', '2024-06-02 06:36:23'),
(93, '{\"en\":\"VISA ISLAM\",\"ar\":\"\\u0641\\u064a\\u0632\\u0627 \\/ \\u0627\\u0633\\u0644\\u0627\\u0645\"}', 1, '200010001', 18, NULL, '2024-06-02 06:30:13', '2024-06-02 06:31:19'),
(94, '{\"en\":\"BSP\",\"ar\":\"\\u0628\\u0649 \\u0627\\u0633 \\u0628\\u0649\"}', 1, '300005001', 24, '2024-06-04 10:47:21', '2024-06-02 06:47:12', '2024-06-04 10:47:21'),
(95, '{\"en\":\"AIR ARABIA\",\"ar\":\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0647 \\u0644\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\"}', 1, '300005002', 24, '2024-06-04 10:47:27', '2024-06-02 06:47:43', '2024-06-04 10:47:27'),
(96, '{\"en\":\"FLY DUBAI\",\"ar\":\"\\u0641\\u0644\\u0627\\u0649 \\u062f\\u0628\\u0649\"}', 1, '300005003', 24, '2024-06-04 10:47:33', '2024-06-02 06:48:29', '2024-06-04 10:47:33'),
(97, '{\"en\":\"JAZEERA AIRWAYS\",\"ar\":\"\\u0637\\u064a\\u0631\\u0627\\u0646 \\u0627\\u0644\\u062c\\u0632\\u064a\\u0631\\u0647\"}', 1, '300005004', 24, '2024-06-04 10:47:49', '2024-06-02 06:50:44', '2024-06-04 10:47:49'),
(98, '{\"en\":\"FLYNAS\",\"ar\":\"\\u0646\\u0627\\u0633 \\u0644\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\"}', 1, '300005005', 24, '2024-06-04 10:47:55', '2024-06-02 06:51:27', '2024-06-04 10:47:55'),
(99, '{\"en\":\"ALY BABA HOTEL\",\"ar\":\"\\u0641\\u0646\\u062f\\u0642 \\u0639\\u0644\\u0649 \\u0628\\u0627\\u0628\\u0627\"}', 1, '300006001', 25, '2024-06-04 10:49:01', '2024-06-02 07:01:53', '2024-06-04 10:49:01'),
(100, '{\"en\":\"ALADDIN HOTEL\",\"ar\":\"\\u0641\\u0646\\u062f\\u0642 \\u0639\\u0644\\u0627\\u0621 \\u0627\\u0644\\u062f\\u064a\\u0646\"}', 1, '300006002', 25, '2024-06-04 10:49:07', '2024-06-02 07:03:30', '2024-06-04 10:49:07'),
(101, '{\"en\":\"GAFY RESORT\",\"ar\":\"\\u0641\\u0646\\u062f\\u0642 \\u0627\\u0644\\u062c\\u0627\\u0641\\u0649\"}', 1, '300006003', 25, '2024-06-04 10:49:13', '2024-06-02 07:04:28', '2024-06-04 10:49:13'),
(102, '{\"en\":\"MARINA SHARM HOTEL\",\"ar\":\"\\u0641\\u0646\\u062f\\u0642 \\u0645\\u0627\\u0631\\u064a\\u0646\\u0627 \\u0634\\u0631\\u0645\"}', 1, '300006004', 25, '2024-06-04 10:49:20', '2024-06-02 07:05:25', '2024-06-04 10:49:20'),
(103, '{\"en\":\"LIMOSINE\",\"ar\":\"\\u0627\\u0644\\u0646\\u0642\\u0644\"}', 1, '300007001', 26, NULL, '2024-06-02 09:59:44', '2024-06-04 10:50:53'),
(104, '{\"en\":\"OTHER CREDITOR\",\"ar\":\"\\u0645\\u0648\\u0631\\u062f\\u0648\\u0646 \\u0627\\u062e\\u0631\\u0648\\u0646\"}', 1, '300008001', 27, NULL, '2024-06-02 10:06:22', '2024-06-04 10:53:02'),
(105, '{\"en\":\"FORSA\",\"ar\":\"\\u0641\\u0631\\u0635\\u0647\"}', 1, '300008002', 27, '2024-06-04 10:51:53', '2024-06-02 10:06:47', '2024-06-04 10:51:53'),
(106, '{\"en\":\"TOMOUH\",\"ar\":\"\\u0637\\u0645\\u0648\\u062d\"}', 1, '300008003', 27, '2024-06-04 10:51:47', '2024-06-02 10:07:14', '2024-06-04 10:51:47'),
(107, '{\"en\":\"TRANSPORTATION\",\"ar\":\"\\u0627\\u0644\\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a\"}', 1, '400000001', 28, NULL, '2024-06-02 10:14:14', '2024-06-03 06:34:21'),
(108, '{\"en\":\"SALARY\",\"ar\":\"\\u0627\\u0644\\u0645\\u0631\\u062a\\u0628\\u0627\\u062a\"}', 1, '400000002', 28, NULL, '2024-06-02 10:15:17', '2024-06-03 06:34:50'),
(109, '{\"en\":\"SOCIAL INSURANCE\",\"ar\":\"\\u0627\\u0644\\u062a\\u0623\\u0645\\u064a\\u0646\\u0627\\u062a \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639\\u064a\\u0647\"}', 1, '400000003', 28, NULL, '2024-06-02 10:16:47', '2024-06-03 06:35:51'),
(110, '{\"en\":\"BOUNES\",\"ar\":\"\\u0627\\u0644\\u0645\\u0643\\u0627\\u0641\\u0623\\u062a\"}', 1, '400000004', 28, NULL, '2024-06-02 10:17:46', '2024-06-03 06:36:09'),
(111, '{\"en\":\"COMMISSIONS\",\"ar\":\"\\u0627\\u0644\\u0639\\u0645\\u0648\\u0644\\u0647\"}', 1, '400000005', 28, NULL, '2024-06-02 10:19:29', '2024-06-03 06:36:35'),
(112, '{\"en\":\"BUFFET DOCUMENTS\",\"ar\":\"\\u0628\\u0648\\u0641\\u064a\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '400000006', 28, NULL, '2024-06-02 10:27:48', '2024-06-03 06:36:50'),
(113, '{\"en\":\"BUFFET UN DOCUMENT\",\"ar\":\"\\u0628\\u0648\\u0641\\u064a\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '400000007', 28, NULL, '2024-06-02 10:28:45', '2024-06-03 06:37:06'),
(114, '{\"en\":\"WATER\",\"ar\":\"\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0645\\u064a\\u0627\\u0647\"}', 1, '400000008', 28, NULL, '2024-06-02 10:30:06', '2024-06-03 06:38:37'),
(115, '{\"en\":\"ELECTRICITY\",\"ar\":\"\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621\"}', 1, '400000009', 28, NULL, '2024-06-02 10:30:35', '2024-06-03 06:39:10'),
(116, '{\"en\":\"LAND LINE\",\"ar\":\"\\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u062a\\u0644\\u064a\\u0641\\u0648\\u0646 \\u0627\\u0644\\u0627\\u0631\\u0636\\u0649\"}', 1, '400000010', 28, NULL, '2024-06-02 10:31:06', '2024-06-03 06:39:31'),
(117, '{\"en\":\"MOBILE\",\"ar\":\"\\u0641\\u0627\\u062a\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0645\\u0648\\u0628\\u0627\\u064a\\u0644\"}', 1, '400000011', 28, NULL, '2024-06-02 10:31:49', '2024-06-03 06:40:25'),
(118, '{\"en\":\"WE INTERNET\",\"ar\":\"\\u0627\\u0646\\u062a\\u0631\\u0646\\u062a WE\"}', 1, '400000012', 28, NULL, '2024-06-02 10:34:30', '2024-06-03 06:40:56'),
(119, '{\"en\":\"CLEANER DOCUMENT\",\"ar\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0646\\u0638\\u0627\\u0641\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '400000013', 28, NULL, '2024-06-02 10:35:51', '2024-06-03 06:42:00'),
(120, '{\"en\":\"CLEANER UN DOCUMENT\",\"ar\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0646\\u0638\\u0627\\u0641\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '400000014', 28, NULL, '2024-06-02 10:36:21', '2024-06-03 06:42:16'),
(121, '{\"en\":\"MAINTENANCE DOCUMENT\",\"ar\":\"\\u0635\\u064a\\u0627\\u0646\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '400000015', 28, NULL, '2024-06-02 10:39:03', '2024-06-03 06:42:29'),
(122, '{\"en\":\"MAINTENANCE UN DOCUMENT\",\"ar\":\"\\u0635\\u064a\\u0627\\u0646\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '400000016', 28, NULL, '2024-06-02 10:39:27', '2024-06-03 06:42:41'),
(123, '{\"en\":\"SUBSCRIPTION\",\"ar\":\"\\u0627\\u0634\\u062a\\u0631\\u0627\\u0643\\u0627\\u062a\"}', 1, '400000017', 28, NULL, '2024-06-02 10:40:38', '2024-06-03 06:42:52'),
(124, '{\"en\":\"STATIONERY DOCUMENT\",\"ar\":\"\\u0627\\u062f\\u0648\\u0627\\u062a \\u0645\\u0643\\u062a\\u0628\\u064a\\u0647 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '40000018', 28, NULL, '2024-06-02 10:41:28', '2024-06-03 06:43:12'),
(125, '{\"en\":\"STATIONERY UN DOCUMENT\",\"ar\":\"\\u0627\\u062f\\u0648\\u0627\\u062a \\u0645\\u0643\\u062a\\u0628\\u064a\\u0647 \\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"}', 1, '400000019', 28, NULL, '2024-06-02 10:42:01', '2024-06-03 06:43:32'),
(126, '{\"en\":\"MAIL\",\"ar\":\"\\u0627\\u064a\\u0645\\u064a\\u0644\\u0627\\u062a\"}', 1, '400000020', 28, NULL, '2024-06-02 10:42:43', '2024-06-03 06:43:45'),
(127, '{\"en\":\"BANK EXPENSES\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0628\\u0646\\u0643\\u064a\\u0647\"}', 1, '400000021', 28, NULL, '2024-06-02 10:43:07', '2024-06-03 06:43:55'),
(128, '{\"en\":\"INTERNAL TRAVEL ALLOWANCE\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0633\\u0641\\u0631 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', 1, '400000022', 28, NULL, '2024-06-02 10:43:55', '2024-06-03 06:44:08'),
(129, '{\"en\":\"EXTERNAL TRAVEL ALLOWANCE\",\"ar\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0633\\u0641\\u0631 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', 1, '400000023', 28, NULL, '2024-06-02 10:44:34', '2024-06-03 06:44:14'),
(130, '{\"en\":\"TIPS\",\"ar\":\"\\u0627\\u0643\\u0631\\u0627\\u0645\\u064a\\u0627\\u062a\"}', 1, '400000024', 28, NULL, '2024-06-02 10:46:49', '2024-06-03 06:44:31'),
(131, '{\"en\":\"FEES\",\"ar\":\"\\u0631\\u0633\\u0648\\u0645\"}', 1, '400000025', 28, NULL, '2024-06-02 10:47:52', '2024-06-03 06:44:47'),
(132, '{\"en\":\"CHARTER ACCOUNTANT FEES\",\"ar\":\"\\u0627\\u062a\\u0639\\u0627\\u0628 \\u0627\\u0644\\u0645\\u062d\\u0627\\u0633\\u0628 \\u0627\\u0644\\u0642\\u0627\\u0646\\u0648\\u0646\\u0649\"}', 1, '400000026', 28, NULL, '2024-06-02 10:48:38', '2024-06-03 06:45:03'),
(133, '{\"en\":\"RENT\",\"ar\":\"\\u0627\\u0644\\u0627\\u064a\\u062c\\u0627\\u0631\"}', 1, '400000027', 28, NULL, '2024-06-02 10:49:05', '2024-06-03 06:45:42'),
(134, '{\"en\":\"PRINTER TONER\",\"ar\":\"\\u0627\\u062d\\u0628\\u0627\\u0631 \\u0637\\u0627\\u0628\\u0639\\u0627\\u062a\"}', 1, '400000028', 28, NULL, '2024-06-02 10:49:54', '2024-06-03 06:45:59'),
(135, '{\"en\":\"GAS\",\"ar\":\"\\u0627\\u0644\\u0633\\u0648\\u0644\\u0627\\u0631\"}', 1, '400000029', 28, NULL, '2024-06-02 10:50:26', '2024-06-03 06:46:11'),
(136, '{\"en\":\"DEPRECIATION EXPENSE\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0627\\u0644\\u0627\\u0647\\u0644\\u0627\\u0643\"}', 1, '400000030', 28, NULL, '2024-06-02 10:51:32', '2024-06-03 06:46:20'),
(137, '{\"en\":\"HOTEL INCOMING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', 1, '500001001', 30, NULL, '2024-06-03 06:31:40', '2024-06-05 05:56:51'),
(138, '{\"en\":\"SIGHT SEEING - INCOMING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a \\u062f\\u0627\\u062e\\u0644\\u064a\"}', 1, '500001002', 30, NULL, '2024-06-03 06:55:33', '2024-06-05 05:57:13'),
(139, '{\"en\":\"HOTEL OUTGOING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', 1, '500002001', 31, NULL, '2024-06-03 07:14:36', '2024-06-05 05:57:26'),
(140, '{\"en\":\"SIGHT SEEING - OUTGOING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u0649\"}', 1, '500002002', 31, NULL, '2024-06-03 07:15:56', '2024-06-05 05:57:39'),
(141, '{\"en\":\"VISA OUTGOING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\"}', 1, '500002003', 31, NULL, '2024-06-03 07:16:49', '2024-06-05 05:57:51'),
(142, '{\"en\":\"TRANSPORTATION - OUTGOING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637  \\u0627\\u0646\\u062a\\u0642\\u0627\\u0644\\u0627\\u062a \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\"}', 1, '500002004', 31, NULL, '2024-06-03 07:17:56', '2024-06-05 05:58:04'),
(143, '{\"en\":\"TICKET - INCOMING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637 \\u062a\\u062f\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', 1, '500003001', 32, NULL, '2024-06-03 07:23:52', '2024-06-05 05:58:19'),
(144, '{\"en\":\"TICKET OUTGOING\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641 \\u0646\\u0634\\u0627\\u0637 \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', 1, '500004001', 33, NULL, '2024-06-03 07:26:45', '2024-06-05 05:58:37'),
(145, '{\"en\":\"ELBANNA TRANSFER\",\"ar\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644  - \\u0645\\u0635\\u0631\\u0648\\u0641 \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\"}', 1, '500005001', 34, NULL, '2024-06-03 07:32:50', '2024-06-05 05:59:01'),
(146, '{\"en\":\"INCOMING HOTEL INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', 1, '600001001', 36, NULL, '2024-06-03 07:49:07', '2024-06-05 05:59:36'),
(147, '{\"en\":\"SIGHT SEEING INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637  \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062f\\u0627\\u062e\\u0644\\u0649\"}', 1, '600001002', 36, NULL, '2024-06-03 07:50:09', '2024-06-05 05:59:49'),
(148, '{\"en\":\"OUTGOING TOURISM INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', 1, '600002001', 37, NULL, '2024-06-03 08:33:59', '2024-06-05 06:00:02'),
(149, '{\"en\":\"SIGHT SEEING\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u0645\\u0632\\u0627\\u0631\\u0627\\u062a - \\u062e\\u0627\\u0631\\u062c\\u064a\"}', 1, '600002002', 37, NULL, '2024-06-03 10:24:18', '2024-06-05 06:00:20'),
(150, '{\"en\":\"VISA\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637  \\u062a\\u0627\\u0634\\u064a\\u0631\\u0627\\u062a\"}', 1, '600002003', 37, NULL, '2024-06-03 10:25:28', '2024-06-05 06:00:30'),
(151, '{\"en\":\".TICKET - INCOMING\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637  \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u064a\"}', 1, '600003001', 38, NULL, '2024-06-03 10:29:26', '2024-06-05 06:00:44'),
(152, '{\"en\":\"INCOME TICKET OUTGOING\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f \\u0646\\u0634\\u0627\\u0637 \\u062a\\u0630\\u0627\\u0643\\u0631 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', 1, '600004001', 39, NULL, '2024-06-03 10:32:40', '2024-06-05 06:00:58'),
(153, '{\"en\":\"ELBANNA INCOME\",\"ar\":\"\\u0627\\u0644\\u0628\\u0646\\u0627 \\u0644\\u0644\\u0646\\u0642\\u0644 - \\u0627\\u064a\\u0631\\u0627\\u062f \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\"}', 1, '600005001', 42, NULL, '2024-06-03 10:40:32', '2024-06-05 06:01:10'),
(154, '{\"en\":\"DIFFERENCE IN CURRENCY\",\"ar\":\"\\u0641\\u0631\\u0648\\u0642 \\u0627\\u0644\\u0639\\u0645\\u0644\\u0647\"}', 1, '500008001', 45, NULL, '2024-06-03 10:45:50', '2024-06-03 10:45:50'),
(155, '{\"en\":\"CEGP\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649\"}', 1, '200001001', 7, NULL, '2024-06-04 04:54:15', '2024-06-04 04:54:15'),
(156, '{\"en\":\"CUSD\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0627\\u0631\"}', 1, '200001002', 7, NULL, '2024-06-04 05:14:01', '2024-06-04 05:14:01'),
(157, '{\"en\":\"CEUR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u064a\\u0648\\u0631\\u0648\"}', 1, '200001003', 7, NULL, '2024-06-04 05:15:47', '2024-06-04 05:15:47'),
(158, '{\"en\":\"CSAR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644\"}', 1, '200001004', 7, NULL, '2024-06-04 05:17:29', '2024-06-04 05:17:29'),
(159, '{\"en\":\"GEIDEA CASH\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062c\\u064a\\u062f\\u064a\\u0627\"}', 1, '200001005', 7, NULL, '2024-06-04 05:18:36', '2024-06-04 05:18:47'),
(160, '{\"en\":\"ISLAMIC CEGP\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647\"}', 1, '200001006', 7, NULL, '2024-06-04 05:19:27', '2024-06-04 05:25:41'),
(161, '{\"en\":\"ISLAMIS CSAR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647\"}', 1, '200001007', 7, NULL, '2024-06-04 05:25:07', '2024-06-04 05:25:58'),
(162, '{\"en\":\"HAAG TOURISM CUSTOMER\",\"ar\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u062d\\u062c\"}', 1, '200005001', 12, NULL, '2024-06-04 10:29:12', '2024-06-04 10:29:12'),
(163, '{\"en\":\"UMRA TOURISM CUSTOMER\",\"ar\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u0639\\u0645\\u0631\\u0629\"}', 1, '200006001', 13, NULL, '2024-06-04 10:30:11', '2024-06-04 10:30:11'),
(164, '{\"en\":\"AIRLINE CREDIT\",\"ar\":\"\\u062f\\u0627\\u0626\\u0646\\u0649 \\u0627\\u0644\\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u062c\\u0648\\u064a\\u0647\"}', 1, '300005001', 24, NULL, '2024-06-04 10:48:32', '2024-06-04 10:48:32'),
(165, '{\"en\":\"HOTELS\",\"ar\":\"\\u0627\\u0644\\u0641\\u0646\\u0627\\u062f\\u0642\"}', 1, '300006001', 25, NULL, '2024-06-04 10:50:02', '2024-06-04 10:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `chart_classes`
--

CREATE TABLE `chart_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` enum('debit','credit') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_classes`
--

INSERT INTO `chart_classes` (`id`, `name`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Assets\",\"ar\":\"\\u0623\\u0635\\u0648\\u0644\"}', 1, 'debit', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(2, '{\"en\":\"Liabilities\",\"ar\":\"\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645\\u0627\\u062a\"}', 1, 'credit', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(3, '{\"en\":\"Costs\",\"ar\":\"\\u0627\\u0644\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a\"}', 1, 'debit', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(4, '{\"en\":\"Income\",\"ar\":\"\\u0627\\u0644\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a\"}', 1, 'credit', NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `chart_types`
--

CREATE TABLE `chart_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_types`
--

INSERT INTO `chart_types` (`id`, `name`, `code`, `status`, `class_id`, `parent_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"FIXED ASSETS\",\"ar\":\"\\u0627\\u0644\\u0627\\u0635\\u0648\\u0644 \\u0627\\u0644\\u062b\\u0627\\u0628\\u062a\\u0647\"}', '100', 1, 1, NULL, NULL, '2024-06-01 06:20:52', '2024-06-02 06:03:40'),
(2, '{\"en\":\"FURNITURE AND OFFICE SUPPLIES\",\"ar\":\"\\u0627\\u0644\\u0623\\u062b\\u0627\\u062b \\u0648\\u0645\\u0633\\u062a\\u0644\\u0632\\u0645\\u0627\\u062a \\u0627\\u0644\\u0645\\u0643\\u0627\\u062a\\u0628\"}', '100001', 1, 1, 1, NULL, '2024-06-01 06:26:08', '2024-06-02 06:03:55'),
(3, '{\"en\":\"MACHINES\",\"ar\":\"\\u0622\\u0644\\u0627\\u062a\"}', '100002', 1, 1, 1, NULL, '2024-06-01 06:29:52', '2024-06-02 06:04:14'),
(4, '{\"en\":\"COMPUTER PROGRAMS\",\"ar\":\"\\u0628\\u0631\\u0627\\u0645\\u062c \\u0627\\u0644\\u0643\\u0645\\u0628\\u064a\\u0648\\u062a\\u0631\"}', '100003', 1, 1, 1, NULL, '2024-06-01 06:37:16', '2024-06-02 06:06:58'),
(5, '{\"en\":\"LICENS\",\"ar\":\"\\u0627\\u0644\\u0631\\u062e\\u0635\\u0647\"}', '100004', 1, 1, 1, NULL, '2024-06-01 06:39:58', '2024-06-02 06:07:09'),
(6, '{\"en\":\"CURRENT ASSETS\",\"ar\":\"\\u0627\\u0644\\u0627\\u0635\\u0648\\u0644 \\u0627\\u0644\\u0645\\u062a\\u062f\\u0627\\u0648\\u0644\\u0647\"}', '200', 1, 1, NULL, NULL, '2024-06-01 06:43:34', '2024-06-02 06:08:22'),
(7, '{\"en\":\"CASH-IN-HAND\",\"ar\":\"\\u0646\\u0642\\u062f\\u064a\\u0629\"}', '200001', 1, 1, 6, NULL, '2024-06-01 06:44:19', '2024-06-02 06:08:41'),
(8, '{\"en\":\"BANK ACCOUNT\",\"ar\":\"\\u0627\\u0644\\u0628\\u0646\\u0648\\u0643\"}', '212', 0, 1, 7, '2024-06-04 04:52:51', '2024-06-01 06:52:54', '2024-06-04 04:52:51'),
(9, '{\"en\":\"BANK\",\"ar\":\"\\u0628\\u0646\\u0648\\u0643\"}', '200002', 1, 1, 6, NULL, '2024-06-01 07:02:41', '2024-06-02 06:09:30'),
(10, '{\"en\":\"CHEQUE UNDER COLLECTION\",\"ar\":\"\\u0634\\u064a\\u0643\\u0627\\u062a \\u062a\\u062d\\u062a \\u0627\\u0644\\u062a\\u062d\\u0635\\u064a\\u0644\"}', '200003', 1, 1, 6, NULL, '2024-06-01 07:31:41', '2024-06-02 06:11:06'),
(11, '{\"en\":\"GEMERAL TOURISM CUSTOMER\",\"ar\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u0639\\u0627\\u0645\\u0647\"}', '200004', 1, 1, 6, NULL, '2024-06-01 07:36:59', '2024-06-02 06:12:39'),
(12, '{\"en\":\"HAAG TOURISM CUSTOMER\",\"ar\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 - \\u062d\\u062c\"}', '200005', 1, 1, 6, NULL, '2024-06-01 07:47:34', '2024-06-02 06:14:54'),
(13, '{\"en\":\"UMRA TOURISM CUSTOMER\",\"ar\":\"\\u0639\\u0645\\u0644\\u0627\\u0621 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u064a\\u0646\\u064a\\u0647 -\\u0639\\u0645\\u0631\\u0629\"}', '200006', 1, 1, 6, NULL, '2024-06-01 07:48:34', '2024-06-02 06:15:04'),
(14, '{\"en\":\"OTHER DEBIT ACCOUNTS\",\"ar\":\"\\u0627\\u0631\\u0635\\u062f\\u0647 \\u0645\\u062f\\u064a\\u0646\\u0647 \\u0627\\u062e\\u0631\\u0649\"}', '200007', 1, 1, 6, NULL, '2024-06-01 07:50:23', '2024-06-02 06:15:11'),
(15, '{\"en\":\"EMPLOYEE DEBIT AND LOANS\",\"ar\":\"\\u0639\\u0647\\u062f \\u0648\\u0633\\u0644\\u0641 \\u0627\\u0644\\u0645\\u0648\\u0638\\u0641\\u064a\\u0646\"}', '200008', 1, 1, 6, NULL, '2024-06-01 08:29:59', '2024-06-02 09:53:35'),
(16, '{\"en\":\"EMPLOYEE LOANS\",\"ar\":\"\\u0633\\u0644\\u0641 \\u0627\\u0644\\u0645\\u0648\\u0638\\u0641\\u064a\\u0646\"}', '200009', 1, 1, 6, NULL, '2024-06-01 09:36:10', '2024-06-02 09:54:58'),
(17, '{\"en\":\"VISA\",\"ar\":\"\\u0641\\u064a\\u0632\\u0627\"}', '230', 0, 1, 6, '2024-06-03 12:03:51', '2024-06-01 10:16:51', '2024-06-03 12:03:51'),
(18, '{\"en\":\"1visa\",\"ar\":\"\\u0641\\u064a\\u0632\\u0627 1\"}', '200010', 1, 1, 6, NULL, '2024-06-01 11:14:10', '2024-06-02 06:27:22'),
(19, '{\"en\":\"LIABILITIES\",\"ar\":\"\\u0627\\u0644\\u0627\\u0644\\u062a\\u0632\\u0627\\u0645\\u0627\\u062a\"}', '300', 1, 2, NULL, NULL, '2024-06-02 04:16:15', '2024-06-02 06:32:32'),
(20, '{\"en\":\"CAPITAL\",\"ar\":\"\\u0631\\u0627\\u0633 \\u0627\\u0644\\u0645\\u0627\\u0644\"}', '300001', 1, 2, 19, NULL, '2024-06-02 04:16:56', '2024-06-02 06:32:46'),
(21, '{\"en\":\"RETAIN EARNING ACCOUNTS\",\"ar\":\"\\u062d\\u0633\\u0627\\u0628\\u0627\\u062a \\u0627\\u0644\\u0623\\u0631\\u0628\\u0627\\u062d \\u0627\\u0644\\u0645\\u062d\\u062a\\u062c\\u0632\\u0629\"}', '300002', 1, 2, 19, NULL, '2024-06-02 04:25:15', '2024-06-02 06:34:16'),
(22, '{\"en\":\"PARTNERS CREDIT\",\"ar\":\"\\u062c\\u0627\\u0631\\u0649 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0627\\u0621\"}', '300003', 1, 2, 19, NULL, '2024-06-02 04:29:09', '2024-06-02 06:35:09'),
(23, '{\"en\":\"TAX DEPARTMENT\",\"ar\":\"\\u0642\\u0633\\u0645 \\u0627\\u0644\\u0636\\u0631\\u0627\\u0626\\u0628\"}', '300004', 1, 2, 19, NULL, '2024-06-02 05:21:38', '2024-06-02 06:35:48'),
(24, '{\"en\":\"AIR LINE CREDITOR\",\"ar\":\"\\u062f\\u0627\\u0626\\u0646\\u0649 \\u0627\\u0644\\u062e\\u0637\\u0648\\u0637 \\u0627\\u0644\\u062c\\u0648\\u064a\\u0647\"}', '300005', 1, 2, 19, NULL, '2024-06-02 06:46:28', '2024-06-02 06:46:28'),
(25, '{\"en\":\"CURRENT HOTELS ACCOUNTS\",\"ar\":\"\\u0627\\u0644\\u0641\\u0646\\u0627\\u062f\\u0642\"}', '300006', 1, 2, 19, NULL, '2024-06-02 06:53:23', '2024-06-02 06:53:23'),
(26, '{\"en\":\"TRANSPORTATION SUPPLIER\",\"ar\":\"\\u0645\\u0648\\u0631\\u062f \\u0627\\u0644\\u0646\\u0642\\u0644\"}', '300007', 1, 2, 19, NULL, '2024-06-02 07:08:57', '2024-06-02 07:08:57'),
(27, '{\"en\":\"OTHER SUPPLIER\",\"ar\":\"\\u0645\\u0648\\u0631\\u062f\\u0648\\u0646 \\u0627\\u062e\\u0631\\u0648\\u0646\"}', '300008', 1, 2, 19, NULL, '2024-06-02 10:05:36', '2024-06-02 10:05:36'),
(28, '{\"en\":\"GENERAL EXPENSES\",\"ar\":\"\\u0627\\u0644\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u0648\\u0645\\u064a\\u0647\"}', '400', 1, 3, NULL, NULL, '2024-06-02 10:12:15', '2024-06-02 10:12:15'),
(29, '{\"en\":\"TOURISM EXPENSES\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\"}', '500', 1, 3, NULL, NULL, '2024-06-03 06:27:17', '2024-06-03 06:27:17'),
(30, '{\"en\":\"INCOMING TORISM EXPENSES\",\"ar\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', '500001', 1, 3, 29, NULL, '2024-06-03 06:29:58', '2024-06-03 06:29:58'),
(31, '{\"en\":\"OUTGOING TOURISM EXPENSES\",\"ar\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', '500002', 1, 3, 29, NULL, '2024-06-03 07:13:21', '2024-06-03 07:13:43'),
(32, '{\"en\":\"AIR TICKET INCOMING\",\"ar\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', '500003', 1, 3, 29, NULL, '2024-06-03 07:22:37', '2024-06-03 07:23:00'),
(33, '{\"en\":\"AIR TICKET OUTGOING\",\"ar\":\"\\u0645\\u0635\\u0627\\u0631\\u064a\\u0641 \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', '500004', 1, 3, 29, NULL, '2024-06-03 07:25:15', '2024-06-03 07:25:57'),
(34, '{\"en\":\"LIMOUSINE\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0646\\u0642\\u0644\"}', '500005', 1, 3, 29, NULL, '2024-06-03 07:28:59', '2024-06-03 07:28:59'),
(35, '{\"en\":\"TORISME INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0646\\u0634\\u0627\\u0637\"}', '600', 1, 4, NULL, NULL, '2024-06-03 07:46:00', '2024-06-03 07:46:00'),
(36, '{\"en\":\"INCOME TOURISME INCOMING\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', '600001', 1, 4, 35, NULL, '2024-06-03 07:47:09', '2024-06-03 07:53:40'),
(37, '{\"en\":\"INCOME TOURISM OUTGOING\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0633\\u064a\\u0627\\u062d\\u0647 \\u062e\\u0627\\u0631\\u062c\\u0649\"}', '600002', 1, 4, 35, NULL, '2024-06-03 07:52:26', '2024-06-03 07:52:26'),
(38, '{\"en\":\"INCOME TICKET INCOMING\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062f\\u0627\\u062e\\u0644\\u064a\"}', '600003', 1, 4, 35, NULL, '2024-06-03 10:27:51', '2024-06-03 10:27:51'),
(39, '{\"en\":\"TICKT OUTGOING INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0637\\u064a\\u0631\\u0627\\u0646 \\u062e\\u0627\\u0631\\u062c\\u064a\"}', '600004', 1, 4, 35, NULL, '2024-06-03 10:31:33', '2024-06-03 10:31:33'),
(40, '{\"en\":\"AUMRA EXPENSE\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u0631\\u0647\"}', '500006', 1, 3, 29, NULL, '2024-06-03 10:36:20', '2024-06-03 10:36:20'),
(41, '{\"en\":\"HAAJ EXPENSE\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u0644\\u062d\\u062c\"}', '500007', 1, 3, 29, NULL, '2024-06-03 10:37:09', '2024-06-03 10:37:09'),
(42, '{\"en\":\"LIMOSINE INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0646\\u0642\\u0644\"}', '600005', 1, 4, 35, NULL, '2024-06-03 10:39:09', '2024-06-03 10:39:09'),
(43, '{\"en\":\"AUMRA INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u0631\\u0647\"}', '600006', 1, 4, 35, NULL, '2024-06-03 10:42:02', '2024-06-03 10:42:02'),
(44, '{\"en\":\"HAAG INCOME\",\"ar\":\"\\u0627\\u064a\\u0631\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u062d\\u062c\"}', '600007', 1, 4, 35, NULL, '2024-06-03 10:42:36', '2024-06-03 10:42:36'),
(45, '{\"en\":\"OTHER EXPENSE\",\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0627\\u062e\\u0631\\u064a\"}', '500008', 1, 3, 29, NULL, '2024-06-03 10:43:53', '2024-06-03 10:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `status`, `country_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"ALEX\",\"ar\":\"\\u0627\\u0644\\u0627\\u0633\\u0643\\u0646\\u062f\\u0631\\u064a\\u0647\"}', 1, 1, NULL, '2024-05-30 12:00:31', '2024-06-04 08:56:15'),
(2, '{\"en\":\"Riyadh\",\"ar\":\"\\u0627\\u0644\\u0631\\u064a\\u0627\\u0636\"}', 1, 2, NULL, '2024-06-04 06:28:24', '2024-06-04 06:28:24'),
(3, '{\"en\":\"Ankara\",\"ar\":\"\\u0627\\u0646\\u0642\\u0631\\u0629\"}', 1, 3, NULL, '2024-06-04 06:40:14', '2024-06-04 06:40:14'),
(4, '{\"en\":\"Paris\",\"ar\":\"\\u0628\\u0627\\u0631\\u064a\\u0633\"}', 1, 4, NULL, '2024-06-04 06:41:13', '2024-06-04 06:41:13'),
(5, '{\"en\":\"ROMA\",\"ar\":\"\\u0631\\u0648\\u0645\\u0627\"}', 1, 5, NULL, '2024-06-04 06:42:04', '2024-06-04 06:42:04'),
(6, '{\"en\":\"Athens\",\"ar\":\"\\u0627\\u062b\\u064a\\u0646\\u0627\"}', 1, 6, NULL, '2024-06-04 06:42:45', '2024-06-04 06:42:45'),
(7, '{\"en\":\"Bern\",\"ar\":\"\\u0628\\u064a\\u0631\\u0646\"}', 1, 7, NULL, '2024-06-04 06:43:55', '2024-06-04 06:43:55'),
(8, '{\"en\":\"Beirut\",\"ar\":\"\\u0628\\u064a\\u0631\\u0648\\u062a\"}', 1, 8, NULL, '2024-06-04 06:44:39', '2024-06-04 06:44:39'),
(9, '{\"en\":\"Amsterdam\",\"ar\":\"\\u0627\\u0645\\u0633\\u062a\\u0631\\u062f\\u0627\\u0645\"}', 1, 9, NULL, '2024-06-04 06:45:26', '2024-06-04 06:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `type` enum('individual','corporation','both') NOT NULL,
  `chart_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `mobile`, `email`, `type`, `chart_account_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'محمد', '0215488485', 'Das@d.com', 'individual', 73, 2, NULL, '2024-06-04 08:09:27', '2024-06-04 08:09:38'),
(2, 'الرضا حسن', '012456789412', 'MAYASINE@GMAIL.COM', 'individual', 32, NULL, NULL, '2024-06-04 09:28:54', '2024-06-04 10:45:28'),
(3, 'النعمانى للسياحة', '012345678944', 'KAVIATION@L.COM', 'individual', 32, NULL, NULL, '2024-06-04 10:43:34', '2024-06-04 10:43:34'),
(4, 'خالد البدراوى', '01100003026', 'KHALED@YAHOO.COM', 'individual', 32, NULL, NULL, '2024-06-04 11:03:06', '2024-06-04 11:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `client_categories`
--

CREATE TABLE `client_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_categories`
--

INSERT INTO `client_categories` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'client category', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cost_centers`
--

CREATE TABLE `cost_centers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `code` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cost_centers`
--

INSERT INTO `cost_centers` (`id`, `name`, `status`, `code`, `description`, `start_date`, `due_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"AIRLINE\",\"ar\":\"\\u0637\\u064a\\u0631\\u0627\\u0646\"}', 1, '001', 'نشاط الطيران', '2024-06-01', '2024-07-31', NULL, '2024-06-04 08:39:15', '2024-06-04 08:39:15'),
(2, '{\"en\":\"VISA\",\"ar\":\"\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\"}', 1, '002', 'نشاط التأشيرات', '2024-06-01', '2024-07-31', NULL, '2024-06-04 08:45:46', '2024-06-04 08:45:46'),
(3, '{\"en\":\"HOTEL INCOMING\",\"ar\":\"\\u0641\\u0646\\u0627\\u062f\\u0642 \\u062f\\u0627\\u062e\\u0644\\u0649\"}', 1, '003', 'نشاط الفنادق الداخلى', '2024-06-01', '2024-07-31', NULL, '2024-06-04 08:47:50', '2024-06-04 08:47:50'),
(4, '{\"en\":\"HOTEL OUTGOING\",\"ar\":\"\\u0641\\u0646\\u0627\\u062f\\u0642 \\u062e\\u0627\\u0631\\u062c\\u064a\\u0647\"}', 1, '004', 'نشاط الفنادق الخارجى', '2024-06-01', '2024-07-31', NULL, '2024-06-04 08:48:39', '2024-06-04 08:48:53'),
(5, '{\"en\":\"LIMOSINE INCOMING\",\"ar\":\"\\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u062f\\u0627\\u062e\\u0644\\u0649\"}', 1, '005', 'نشاط النقل الداخلى', '2024-06-01', '2024-07-31', NULL, '2024-06-04 08:50:02', '2024-06-04 08:50:02'),
(6, '{\"en\":\"LIMOSINE OUTGOING\",\"ar\":\"\\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u062e\\u0627\\u0631\\u062c\\u0649\"}', 1, '006', 'نشاط النقل الخرجى', '2024-06-01', '2024-07-31', NULL, '2024-06-04 08:50:39', '2024-06-04 08:50:39'),
(7, '{\"en\":\"AUMRA\",\"ar\":\"\\u0627\\u0644\\u0639\\u0645\\u0631\\u0629\"}', 1, '007', 'نشاط العمرة', '2024-06-01', '2024-07-31', NULL, '2024-06-04 08:51:12', '2024-06-04 08:51:12'),
(8, '{\"en\":\"el gamedddd\",\"ar\":\"el gameddddd\"}', 1, 'sss', 'el gamed el fazee3', '2024-04-02', '2024-08-02', NULL, '2024-06-29 05:40:00', '2024-06-29 05:40:00'),
(9, '{\"en\":\"el gameddddd\",\"ar\":\"el gamedddddd\"}', 1, 'sssd', 'el gamed el fazee3', '2024-04-02', '2024-08-02', NULL, '2024-06-29 05:40:43', '2024-06-29 05:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Egypt\",\"ar\":\"\\u0645\\u0635\\u0631\"}', 1, NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31'),
(2, '{\"en\":\"SAUDI ARABIA\",\"ar\":\"\\u0627\\u0644\\u0633\\u0639\\u0648\\u062f\\u064a\\u0629\"}', 1, NULL, '2024-06-04 06:26:00', '2024-06-04 06:26:00'),
(3, '{\"en\":\"TURKISH\",\"ar\":\"\\u062a\\u0631\\u0643\\u064a\\u0627\"}', 1, NULL, '2024-06-04 06:26:54', '2024-06-04 06:38:40'),
(4, '{\"en\":\"France\",\"ar\":\"\\u0641\\u0631\\u0646\\u0633\\u0627\"}', 1, NULL, '2024-06-04 06:29:03', '2024-06-04 06:29:03'),
(5, '{\"en\":\"Italy\",\"ar\":\"\\u0627\\u064a\\u0637\\u0627\\u0644\\u064a\\u0627\"}', 1, NULL, '2024-06-04 06:37:22', '2024-06-04 06:37:22'),
(6, '{\"en\":\"Greece\",\"ar\":\"\\u0627\\u0644\\u064a\\u0648\\u0646\\u0627\\u0646\"}', 1, NULL, '2024-06-04 06:37:49', '2024-06-04 06:37:49'),
(7, '{\"en\":\"Switzerland\",\"ar\":\"\\u0633\\u0648\\u064a\\u0633\\u0631\\u0627\"}', 1, NULL, '2024-06-04 06:38:13', '2024-06-04 06:38:13'),
(8, '{\"en\":\"Lebanon\",\"ar\":\"\\u0644\\u0628\\u0646\\u0627\\u0646\"}', 1, NULL, '2024-06-04 06:38:32', '2024-06-04 06:38:32'),
(9, '{\"en\":\"Holland\",\"ar\":\"\\u0647\\u0648\\u0644\\u0646\\u062f\\u0627\"}', 1, NULL, '2024-06-04 06:39:05', '2024-06-04 06:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `rate` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `base` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `rate`, `status`, `base`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"DOLLAR\",\"ar\":\"\\u062f\\u0648\\u0644\\u0627\\u0631\"}', 'USD', 47.28, 1, 0, NULL, '2024-06-04 06:47:17', '2024-06-04 06:47:17'),
(2, '{\"en\":\"EURO\",\"ar\":\"\\u064a\\u0648\\u0631\\u0648\"}', 'EUR', 51.44, 1, 0, NULL, '2024-06-04 06:47:51', '2024-06-04 16:04:37'),
(3, '{\"en\":\"REYIAL\",\"ar\":\"\\u0627\\u0644\\u0631\\u064a\\u0627\\u0644\"}', 'SAR', 12.61, 1, 0, NULL, '2024-06-04 06:48:33', '2024-06-04 06:48:33'),
(4, '{\"en\":\"EGYPTIAN POUND\",\"ar\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649\"}', 'EGP', 1, 1, 1, NULL, '2024-06-04 09:36:40', '2024-06-04 16:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `custodians`
--

CREATE TABLE `custodians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custodians`
--

INSERT INTO `custodians` (`id`, `name`, `description`, `account_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'احمد عيسوى', 'موظف', 37, NULL, '2024-06-05 06:04:53', '2024-06-05 06:04:53'),
(2, 'هبه', 'موظفه', 38, NULL, '2024-06-05 06:05:15', '2024-06-05 06:05:15'),
(3, 'مروان', 'موظف', 39, NULL, '2024-06-05 06:05:34', '2024-06-05 06:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `options` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `customable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customable_type` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `options`, `status`, `customable_id`, `customable_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"ar\":\"\\u0627\\u0644\\u0646\\u0627\\u0642\\u0644 \\u0627\\u0644\\u062c\\u0648\\u0649\",\"en\":\"AIR TICKETING\"}', 'dropdown', '[\"\\u0645\\u0635\\u0631 \\u0644\\u0644\\u0637\\u064a\\u0631\\u0627\\u0646\",\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0647\",\"\\u0646\\u0627\\u0633\"]', 1, 1, 'Modules\\Accounting\\Activity\\App\\Models\\Activity', NULL, '2024-06-05 04:51:25', '2024-06-05 05:39:48'),
(2, '{\"ar\":\"\\u0627\\u0644\\u0633\\u064a\\u0627\\u062d\\u0629\",\"en\":\"TOURISM\"}', 'text', NULL, 1, 2, 'Modules\\Accounting\\Activity\\App\\Models\\Activity', NULL, '2024-06-05 04:52:24', '2024-06-05 05:38:03'),
(3, '{\"ar\":\"\\u0646\\u0627\\u0642\\u0644 \\u062c\\u0648\\u0649\",\"en\":\"TICKET AIR\"}', 'dropdown', '[\"\\u0628\\u0649 \\u0627\\u0633 \\u0628\\u0649\",\"\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0647\"]', 1, 3, 'Modules\\Accounting\\Activity\\App\\Models\\Activity', NULL, '2024-06-05 04:53:36', '2024-06-05 05:37:40'),
(4, '{\"ar\":\"\\u062a\\u0623\\u0634\\u064a\\u0631\\u0627\\u062a\",\"en\":\"VISA\"}', 'text', NULL, 1, 4, 'Modules\\Accounting\\Activity\\App\\Models\\Activity', NULL, '2024-06-05 04:54:18', '2024-06-05 04:54:18'),
(5, '{\"ar\":\"\\u0645\\u0635\\u0631\\u0648\\u0641\\u0627\\u062a \\u0639\\u0645\\u0648\\u0645\\u064a\\u0647\",\"en\":\"GENERAL EXENSES\"}', 'dropdown', '[\"\\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\",\"\\u063a\\u064a\\u0631 \\u0645\\u0633\\u062a\\u0646\\u062f\\u0649\"]', 1, 5, 'Modules\\Accounting\\Activity\\App\\Models\\Activity', NULL, '2024-06-05 04:55:14', '2024-06-05 05:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_data`
--

CREATE TABLE `custom_field_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_data`
--

INSERT INTO `custom_field_data` (`id`, `value`, `status`, `model_id`, `model_name`, `custom_field_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'العربيه', 1, 1, 'Modules\\Accounting\\Order\\App\\Models\\OrderDetail', 1, NULL, '2024-06-05 05:09:24', '2024-06-05 05:09:24'),
(2, 'سياحه داخلى', 1, 3, 'Modules\\Accounting\\Order\\App\\Models\\OrderDetail', 2, NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08'),
(3, 'مصر للطيران', 1, 5, 'Modules\\Accounting\\Order\\App\\Models\\OrderDetail', 1, NULL, '2024-06-05 05:34:02', '2024-06-05 05:34:02'),
(4, 'العربيه', 1, 7, 'Modules\\Accounting\\Order\\App\\Models\\OrderDetail', 1, NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43'),
(5, 'العربيه', 1, 9, 'Modules\\Accounting\\Order\\App\\Models\\OrderDetail', 1, NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09'),
(6, 'مصر للطيران', 1, 11, 'Modules\\Accounting\\Order\\App\\Models\\OrderDetail', 1, NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Admin\",\"ar\":\"\\u0627\\u062f\\u0645\\u0646\"}', 1, NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branches_accessibility` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `department_id`, `branch_id`, `branches_accessibility`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `entities`
--

CREATE TABLE `entities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` enum('payment','receive') NOT NULL,
  `chart_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `fiscal_years`
--

CREATE TABLE `fiscal_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `close` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fiscal_years`
--

INSERT INTO `fiscal_years` (`id`, `from`, `to`, `close`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2024-01-01', '2024-12-31', 0, NULL, '2024-06-06 04:58:17', '2024-06-06 04:58:17');

-- --------------------------------------------------------

--
-- Table structure for table `flightpaths`
--

CREATE TABLE `flightpaths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_city_id` bigint(20) UNSIGNED NOT NULL,
  `to_city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flightpaths`
--

INSERT INTO `flightpaths` (`id`, `from_city_id`, `to_city_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 5, 3, '2024-06-29 04:32:04', '2024-06-29 04:32:04');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `flight_company_id` bigint(20) UNSIGNED NOT NULL,
  `travel_date` varchar(255) NOT NULL,
  `travel_h_date` time NOT NULL,
  `return_date` varchar(255) NOT NULL,
  `return_h_date` time NOT NULL,
  `numbers` int(11) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `confirmation_date` varchar(255) NOT NULL,
  `travel_path_id` bigint(20) UNSIGNED NOT NULL,
  `return_path_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flight_num` varchar(255) DEFAULT NULL,
  `pnr` varchar(255) DEFAULT NULL,
  `Date_departure_d` varchar(255) NOT NULL,
  `Date_arrival_d` varchar(255) NOT NULL,
  `Date_departure_r` varchar(255) NOT NULL,
  `Date_arrival_r` varchar(255) NOT NULL,
  `program_count` varchar(255) DEFAULT '0',
  `program_booking_count` varchar(255) DEFAULT '0',
  `flight_count` varchar(255) DEFAULT '0',
  `travel_travel_num` varchar(255) DEFAULT NULL COMMENT 'رقم الرحلة ذهاب',
  `return_travel_num` varchar(255) DEFAULT NULL COMMENT 'رقم الرحلة عودة',
  `reservation_date` varchar(255) DEFAULT NULL,
  `names_date` varchar(255) DEFAULT NULL,
  `ticket_date` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `flight_request_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `code`, `flight_company_id`, `travel_date`, `travel_h_date`, `return_date`, `return_h_date`, `numbers`, `cost`, `confirmation_date`, `travel_path_id`, `return_path_id`, `created_at`, `updated_at`, `flight_num`, `pnr`, `Date_departure_d`, `Date_arrival_d`, `Date_departure_r`, `Date_arrival_r`, `program_count`, `program_booking_count`, `flight_count`, `travel_travel_num`, `return_travel_num`, `reservation_date`, `names_date`, `ticket_date`, `status`, `flight_request_id`) VALUES
(1, 'code', 1, '1', '00:00:01', '1', '00:00:01', 1, 1.00, '1', 1, 1, NULL, NULL, '1', '1', '1', '1', '1', '1', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(3, 'asa12', 1, '02-05-2024', '12:00:00', '02-05-2024', '13:01:00', 2, 10.00, '10-01-2024', 1, 1, '2024-06-10 04:18:20', '2024-06-10 04:18:20', 'a2', '12', '15-01-2024', '15-01-2024', '15-01-2024', '15-01-2024', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(4, 'asa12', 1, '02-05-2024', '12:00:00', '02-05-2024', '13:01:00', 2, 10.00, '10-01-2024', 1, 1, '2024-06-10 04:19:36', '2024-06-10 04:19:36', 'a2', '12', '15-01-2024', '15-01-2024', '15-01-2024', '15-01-2024', '0', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(5, 'asa12', 1, '02-05-2024', '12:00:00', '02-05-2024', '13:01:00', 2, 10.00, '10-01-2024', 1, 1, '2024-06-10 04:20:56', '2024-06-10 04:20:56', 'a2', '12', '15-01-2024', '15-01-2024', '15-01-2024', '15-01-2024', '1', '2', '3', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(6, 'asa12', 1, '02-05-2024', '12:00:00', '02-05-2024', '13:01:00', 2, 10.00, '10-01-2024', 1, 1, '2024-06-10 04:21:14', '2024-06-10 04:21:14', 'a2', '12', '15-01-2024', '15-01-2024', '15-01-2024', '15-01-2024', '0', '1', '2', NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flight_accommodations`
--

CREATE TABLE `flight_accommodations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_id` bigint(20) UNSIGNED NOT NULL,
  `passenger_id` bigint(20) UNSIGNED NOT NULL,
  `program_booking_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_companies`
--

CREATE TABLE `flight_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_companies`
--

INSERT INTO `flight_companies` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'name', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flight_requests`
--

CREATE TABLE `flight_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `travel_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `travel_hegri_date` date DEFAULT NULL,
  `return_hegri_date` date DEFAULT NULL,
  `numbers` varchar(255) DEFAULT NULL,
  `available_numbers` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `travel_path_id` bigint(20) UNSIGNED DEFAULT NULL,
  `return_path_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_requests`
--

INSERT INTO `flight_requests` (`id`, `code`, `travel_date`, `return_date`, `travel_hegri_date`, `return_hegri_date`, `numbers`, `available_numbers`, `cost`, `confirmation_date`, `travel_path_id`, `return_path_id`, `created_at`, `updated_at`) VALUES
(1, '111', '2024-06-30', '2024-07-30', '2024-06-30', '2024-07-30', '100', '0', '1000', '2024-06-30', 1, 1, '2024-06-30 11:37:04', '2024-07-01 03:44:10'),
(2, '112', '2024-06-30', '2024-07-30', '2024-06-30', '2024-07-30', '100', '50', '1000', '2024-06-30', 1, 1, '2024-06-30 11:42:41', '2024-06-30 12:19:57'),
(3, '113', '2024-06-30', '2024-07-30', '2024-06-30', '2024-07-30', '100', '100', '1000', '2024-06-30', 1, 1, '2024-06-30 11:44:11', '2024-06-30 11:44:11'),
(4, '114', '2024-06-30', '2024-07-30', '2024-06-30', '2024-07-30', '100', '100', '1000', '2024-06-30', 1, 1, '2024-06-30 11:44:18', '2024-06-30 11:44:18'),
(5, '115', '2024-06-30', '2024-07-30', '2024-06-30', '2024-07-30', '100', '100', '1000', '2024-06-30', 1, 1, '2024-06-30 11:44:28', '2024-06-30 11:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `gl_journals`
--

CREATE TABLE `gl_journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT 0,
  `reference` varchar(255) DEFAULT NULL,
  `manual` int(11) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gl_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gl_transactions`
--

CREATE TABLE `gl_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT 0,
  `notes` text DEFAULT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_account_id` bigint(20) UNSIGNED NOT NULL,
  `gl_journal_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gl_types`
--

CREATE TABLE `gl_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `distance` varchar(255) DEFAULT '0',
  `facilities` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `hotel_star_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `title`, `description`, `city_id`, `distance`, `facilities`, `address`, `phone`, `hotel_star_id`, `created_at`, `updated_at`) VALUES
(1, 'title', 'desc', 1, '0100', NULL, 'address', '01016856433', 1, NULL, NULL),
(2, 'title', 'desc', 2, '0100', NULL, 'address', '01016856433', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_stars`
--

CREATE TABLE `hotel_stars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stars` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_stars`
--

INSERT INTO `hotel_stars` (`id`, `name`, `stars`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'name', 5, NULL, NULL, NULL),
(2, 'star', 55, NULL, '2024-06-30 07:37:25', '2024-06-30 07:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` enum('client','supplier','custodian','entity') NOT NULL,
  `invoicable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoicable_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `notes` text NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_24_131815_create_permission_tables', 1),
(6, '2024_01_24_142913_create_media_table', 1),
(7, '2024_01_30_151836_create_countries_table', 1),
(8, '2024_01_31_110409_cities', 1),
(9, '2024_01_31_122514_departments', 1),
(10, '2024_01_31_124404_add_deleted_at_to_users_table', 1),
(11, '2024_01_31_153358_areas', 1),
(12, '2024_02_01_094350_create_currencies_table', 1),
(13, '2024_02_01_133746_branches', 1),
(14, '2024_02_02_105225_employees', 1),
(15, '2024_02_04_082623_clients', 1),
(16, '2024_02_04_110230_additional_data', 1),
(17, '2024_02_04_140633_suppliers', 1),
(18, '2024_02_04_153936_create_activity_log_table', 1),
(19, '2024_02_05_130500_chart_classes', 1),
(20, '2024_02_06_141225_chart_types', 1),
(21, '2024_02_07_025115_chart_accounts', 1),
(22, '2024_02_07_094355_create_custom_fields_table', 1),
(23, '2024_02_07_094450_create_activities_table', 1),
(24, '2024_02_07_103718_cost_centers', 1),
(25, '2024_02_07_110230_setting', 1),
(26, '2024_02_08_085327_entities', 1),
(27, '2024_02_08_094350_create_custom_field_data_table', 1),
(28, '2024_02_08_094550_create_safes_table', 1),
(29, '2024_02_08_151344_payment_methods', 1),
(30, '2024_02_11_124900_taxes', 1),
(31, '2024_02_12_141225_gl_types', 1),
(32, '2024_02_15_094250_create_orders_table', 1),
(33, '2024_02_15_094350_create_order_details_table', 1),
(34, '2024_02_15_101646_custodians', 1),
(35, '2024_02_17_094250_create_gl_journals_table', 1),
(36, '2024_02_18_094250_create_gl_transactions_table', 1),
(37, '2024_02_18_123948_add_chart_account_id', 1),
(38, '2024_02_19_142800_invoices', 1),
(39, '2024_02_19_152701_invoice_items', 1),
(40, '2024_02_22_102413_receipts', 1),
(41, '2024_02_22_104210_order_receipt', 1),
(42, '2024_02_25_145810_change_cost_center_refeerence', 1),
(43, '2024_03_20_104311_fiscal_years', 1),
(44, '2024_03_23_104034_add_relatd_order', 1),
(45, '2024_04_15_112938_add_name', 1),
(46, '2024_04_18_092503_remove_from_gl_transaction', 1),
(47, '2024_04_18_092504_add_to_gl_transaction', 1),
(48, '2024_05_12_125631_facilities', 1),
(49, '2024_02_25_145810_change_cost_center_refeerence', 2),
(50, '2024_05_13_193650_flight_companies', 1),
(51, '2024_05_13_205307_create_flightpaths_table', 1),
(52, '2024_05_13_210051_create_flights_table', 1),
(53, '2024_05_14_193651_room_types', 1),
(54, '2024_05_16_121133_add_column_flight_num_to_flights', 1),
(55, '2024_05_16_182657_create_hotels_table', 1),
(56, '2024_05_16_202804_create_programs_table', 1),
(57, '2024_05_16_203324_create_programs_hotels_table', 1),
(59, '2024_05_19_125661_residence_types', 1),
(60, '2024_05_20_125671_client_categories', 1),
(64, '2024_06_06_100714_create_program_prices_table', 3),
(65, '2024_06_10_071017_add_program_count_and_program_booking_count_and_flight_count', 4),
(66, '2024_06_10_080852_create_program_users_table', 5),
(68, '2024_06_11_103414_add_bed_price_to_program_prices_table', 6),
(69, '2024_06_10_104449_create_services_table', 7),
(70, '2024_06_11_104457_add_bed_count_to_room_types_table', 7),
(71, '2024_06_11_150756_create_passengers_table', 8),
(72, '2024_06_10_123343_create_passengers_table', 9),
(74, '2024_06_12_124833_add_additional', 10),
(75, '2024_06_26_072530_create_seasons_table', 11),
(76, '2024_06_26_115729_create_personal_room_types_table', 12),
(77, '2024_06_19_153432_add_sort_to_programs_hotels_table', 13),
(78, '2024_06_27_081754_add_phone_program_hotels_table', 14),
(79, '2024_06_27_094556_add_phone_program_hotels_table', 15),
(80, '2024_06_11_062626_create_flight_requests_table', 16),
(81, '2024_06_12_112610_add_cloums_to_flights', 16),
(82, '2024_06_12_121034_change_code_columns_in_flight_requests_table', 16),
(83, '2024_06_13_095958_add_paths_id_to_flight_requests_table', 16),
(84, '2024_06_13_111008_create_flight_accommodations_table', 16),
(85, '2024_06_20_081519_add_available_number_to_flight_requests_table', 16),
(86, '2024_06_27_202804_create_programs_table', 17),
(87, '2024_06_26_105030_hotel_stars', 18),
(88, '2024_06_27_182657_create_hotels_table', 19),
(89, '2024_06_27_203324_create_programs_hotels_table', 20),
(90, '2024_06_27_202805_create_programs_table', 21),
(91, '2024_06_27_203317_create_program_trips_table', 21),
(92, '2024_06_27_223324_create_program_trips_rooms_table', 22),
(93, '2024_06_29_100714_create_program_prices_table', 23),
(94, '2024_06_29_110714_create_program_prices_table', 24),
(95, '2024_06_29_313324_create_program_services_table', 25),
(96, '2024_06_27_203327_create_program_trips_table', 26),
(97, '2024_06_11_262626_create_flight_requests_table', 27),
(98, '2024_06_11_026026_create_flight_requests_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `rate` double NOT NULL,
  `tax_amount` double NOT NULL,
  `order_type` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `orderable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `orderable_type` varchar(255) DEFAULT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `safe_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `related_order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `excute` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `amount`, `rate`, `tax_amount`, `order_type`, `notes`, `orderable_id`, `orderable_type`, `cost_center_id`, `branch_id`, `safe_id`, `tax_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`, `related_order_details_id`, `excute`) VALUES
(1, 10000, 1, 0, 0, NULL, 3, 'Modules\\MasterData\\Client\\App\\Models\\Client', NULL, 1, 7, NULL, 1, NULL, '2024-06-05 05:09:24', '2024-06-05 05:09:24', NULL, 0),
(2, 9500, 1, 0, 1, 'تذكرة', 5, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', NULL, 1, 1, NULL, 1, NULL, '2024-06-05 05:09:24', '2024-06-05 05:09:24', 1, 0),
(3, 4500, 1, 0, 0, NULL, 1, 'Modules\\MasterData\\Client\\App\\Models\\Client', 3, 1, 7, NULL, 1, NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08', NULL, 0),
(4, 4000, 1, 0, 1, 'تذكرة', 3, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 3, 1, 1, NULL, 1, NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08', 3, 0),
(5, 10000, 1, 0, 0, NULL, 2, 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 1, 7, NULL, 1, NULL, '2024-06-05 05:34:02', '2024-06-05 05:34:02', NULL, 0),
(6, 9500, 1, 0, 1, 'تذكرة', 5, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 1, 1, 1, NULL, 1, NULL, '2024-06-05 05:34:02', '2024-06-05 05:34:02', 5, 0),
(7, 1000, 1, 0, 0, NULL, 1, 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 1, 7, NULL, 1, NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43', NULL, 0),
(8, 0, 1, 0, 1, 'انتقالات', 1, 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 1, 1, NULL, 1, NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43', 7, 0),
(9, 1000, 1, 0, 0, NULL, 1, 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 1, 7, NULL, 1, NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09', NULL, 0),
(10, 0, 1, 0, 1, 'انتقالات', 1, 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 1, 1, NULL, 1, NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09', 9, 0),
(11, 25000, 1, 0, 0, NULL, 2, 'Modules\\MasterData\\Client\\App\\Models\\Client', 1, 1, 1, NULL, 1, NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38', NULL, 0),
(12, 24000, 1, 0, 1, 'تذكرة رقم 6912547832 للعميل الرضا حسن الى تركيا', 2, 'Modules\\MasterData\\Supplier\\App\\Models\\Supplier', 1, 1, 1, NULL, 1, NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38', 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `notes` text NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `activity_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `amount`, `notes`, `order_id`, `activity_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 10000, 'تذكرة', 1, 1, NULL, '2024-06-05 05:09:24', '2024-06-05 05:09:24'),
(2, 9500, 'تذكرة', 2, 1, NULL, '2024-06-05 05:09:24', '2024-06-05 05:09:24'),
(3, 4500, 'تذكرة', 3, 2, NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08'),
(4, 4000, 'تذكرة', 4, 2, NULL, '2024-06-05 05:13:08', '2024-06-05 05:13:08'),
(5, 10000, 'تذكرة', 5, 1, NULL, '2024-06-05 05:34:02', '2024-06-05 05:34:02'),
(6, 9500, 'تذكرة', 6, 1, NULL, '2024-06-05 05:34:02', '2024-06-05 05:34:02'),
(7, 1000, 'انتقالات', 7, 1, NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43'),
(8, 0, 'انتقالات', 8, 1, NULL, '2024-06-05 05:47:43', '2024-06-05 05:47:43'),
(9, 1000, 'انتقالات', 9, 1, NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09'),
(10, 0, 'انتقالات', 10, 1, NULL, '2024-06-05 05:48:09', '2024-06-05 05:48:09'),
(11, 25000, 'تذكرة رقم 6912547832 للعميل الرضا حسن الى تركيا', 11, 1, NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38'),
(12, 24000, 'تذكرة رقم 6912547832 للعميل الرضا حسن الى تركيا', 12, 1, NULL, '2024-06-06 04:50:38', '2024-06-06 04:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_receipt`
--

CREATE TABLE `order_receipt` (
  `receipt_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `passport_num` varchar(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`id`, `name`, `gender`, `birthdate`, `passport_num`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 0, '1993-11-20', '1', '2024-06-11 12:32:00', '2024-06-11 12:20:04', '2024-06-11 12:32:00'),
(2, 'name', 1, '2024-06-01', '1', NULL, '2024-06-11 12:21:44', '2024-06-11 12:21:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `payment_type` enum('cash','cheque') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `status`, `payment_type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"CEGP\",\"ar\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649\"}', 1, 'cash', NULL, '2024-06-04 11:25:58', '2024-06-04 11:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'read-facility', 'sanctum', '2024-05-30 12:18:36', '2024-05-30 12:18:36'),
(2, 'create-facility', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(3, 'show-facility', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(4, 'update-facility', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(5, 'delete-facility', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(6, 'read-flight_company', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(7, 'create-flight_company', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(8, 'show-flight_company', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(9, 'update-flight_company', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(10, 'delete-flight_company', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(11, 'read-flights', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(12, 'create-flights', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(13, 'show-flights', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(14, 'update-flights', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(15, 'delete-flights', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(16, 'read-flightpath', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(17, 'create-flightpath', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(18, 'show-flightpath', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(19, 'update-flightpath', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(20, 'delete-flightpath', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(21, 'read-hotels', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(22, 'create-hotels', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(23, 'show-hotels', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(24, 'update-hotels', 'sanctum', '2024-05-30 12:18:37', '2024-05-30 12:18:37'),
(25, 'delete-hotels', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(26, 'read-client_category', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(27, 'create-client_category', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(28, 'show-client_category', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(29, 'update-client_category', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(30, 'delete-client_category', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(31, 'read-programs', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(32, 'create-programs', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(33, 'show-programs', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(34, 'update-programs', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(35, 'delete-programs', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(36, 'read-programs_bookings', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(37, 'create-programs_bookings', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(38, 'show-programs_bookings', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(39, 'update-programs_bookings', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(40, 'delete-programs_bookings', 'sanctum', '2024-05-30 12:18:38', '2024-05-30 12:18:38'),
(41, 'read-activity_log', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(42, 'create-activity_log', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(43, 'show-activity_log', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(44, 'update-activity_log', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(45, 'delete-activity_log', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(46, 'read-area', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(47, 'create-area', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(48, 'show-area', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(49, 'update-area', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(50, 'delete-area', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(51, 'read-branch', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(52, 'create-branch', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(53, 'show-branch', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(54, 'update-branch', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(55, 'delete-branch', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(56, 'read-city', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(57, 'create-city', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(58, 'show-city', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(59, 'update-city', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(60, 'delete-city', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(61, 'read-client', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(62, 'create-client', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(63, 'show-client', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(64, 'update-client', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(65, 'delete-client', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(66, 'read-country', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(67, 'create-country', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(68, 'show-country', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(69, 'update-country', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(70, 'delete-country', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(71, 'read-currency', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(72, 'create-currency', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(73, 'show-currency', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(74, 'update-currency', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(75, 'delete-currency', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(76, 'read-department', 'sanctum', '2024-05-30 12:24:16', '2024-05-30 12:24:16'),
(77, 'create-department', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(78, 'show-department', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(79, 'update-department', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(80, 'delete-department', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(81, 'read-employee', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(82, 'create-employee', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(83, 'show-employee', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(84, 'update-employee', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(85, 'delete-employee', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(86, 'read-permission', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(87, 'create-permission', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(88, 'show-permission', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(89, 'update-permission', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(90, 'delete-permission', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(91, 'read-role', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(92, 'create-role', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(93, 'show-role', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(94, 'update-role', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(95, 'delete-role', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(96, 'read-setting', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(97, 'show-setting', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(98, 'update-setting', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(99, 'read-supplier', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(100, 'create-supplier', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(101, 'show-supplier', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(102, 'update-supplier', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(103, 'delete-supplier', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(104, 'read-user', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(105, 'create-user', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(106, 'show-user', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(107, 'update-user', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(108, 'delete-user', 'sanctum', '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(109, 'read-activity', 'sanctum', '2024-05-30 12:25:53', '2024-05-30 12:25:53'),
(110, 'create-activity', 'sanctum', '2024-05-30 12:25:53', '2024-05-30 12:25:53'),
(111, 'show-activity', 'sanctum', '2024-05-30 12:25:53', '2024-05-30 12:25:53'),
(112, 'update-activity', 'sanctum', '2024-05-30 12:25:53', '2024-05-30 12:25:53'),
(113, 'delete-activity', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(114, 'read-chart_account', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(115, 'create-chart_account', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(116, 'show-chart_account', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(117, 'update-chart_account', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(118, 'delete-chart_account', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(119, 'read-chart_class', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(120, 'create-chart_class', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(121, 'show-chart_class', 'sanctum', '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(122, 'update-chart_class', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(123, 'delete-chart_class', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(124, 'read-chart_type', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(125, 'create-chart_type', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(126, 'show-chart_type', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(127, 'update-chart_type', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(128, 'delete-chart_type', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(129, 'read-cost_center', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(130, 'create-cost_center', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(131, 'show-cost_center', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(132, 'update-cost_center', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(133, 'delete-cost_center', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(134, 'read-custodian', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(135, 'create-custodian', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(136, 'show-custodian', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(137, 'update-custodian', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(138, 'delete-custodian', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(139, 'read-entity', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(140, 'create-entity', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(141, 'show-entity', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(142, 'update-entity', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(143, 'delete-entity', 'sanctum', '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(144, 'read-fiscal_year', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(145, 'create-fiscal_year', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(146, 'show-fiscal_year', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(147, 'update-fiscal_year', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(148, 'delete-fiscal_year', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(149, 'read-gl_transaction', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(150, 'create-gl_transaction', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(151, 'show-gl_transaction', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(152, 'update-gl_transaction', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(153, 'delete-gl_transaction', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(154, 'read-gl_type', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(155, 'create-gl_type', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(156, 'show-gl_type', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(157, 'update-gl_type', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(158, 'delete-gl_type', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(159, 'read-invoice', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(160, 'create-invoice', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(161, 'show-invoice', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(162, 'update-invoice', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(163, 'delete-invoice', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(164, 'read-order', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(165, 'create-order', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(166, 'show-order', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(167, 'update-order', 'sanctum', '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(168, 'delete-order', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(169, 'read-payment_method', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(170, 'create-payment_method', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(171, 'show-payment_method', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(172, 'update-payment_method', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(173, 'delete-payment_method', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(174, 'read-receipt', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(175, 'create-receipt', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(176, 'show-receipt', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(177, 'update-receipt', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(178, 'delete-receipt', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(179, 'excute_related_order_create-order', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(180, 'related_order_create-order', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(181, 'read-safe', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(182, 'create-safe', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(183, 'show-safe', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(184, 'update-safe', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(185, 'delete-safe', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(186, 'read-tax', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(187, 'create-tax', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(188, 'show-tax', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(189, 'update-tax', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(190, 'delete-tax', 'sanctum', '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(191, 'read-program_price', 'sanctum', '2024-06-06 08:21:09', '2024-06-06 08:21:09'),
(192, 'create-program_price', 'sanctum', '2024-06-06 08:21:09', '2024-06-06 08:21:09'),
(193, 'show-program_price', 'sanctum', '2024-06-06 08:21:09', '2024-06-06 08:21:09'),
(194, 'update-program_price', 'sanctum', '2024-06-06 08:21:09', '2024-06-06 08:21:09'),
(195, 'delete-program_price', 'sanctum', '2024-06-06 08:21:09', '2024-06-06 08:21:09'),
(196, 'read-program_booking', 'sanctum', '2024-06-06 11:01:58', '2024-06-06 11:01:58'),
(197, 'create-program_booking', 'sanctum', '2024-06-06 11:01:58', '2024-06-06 11:01:58'),
(198, 'show-program_booking', 'sanctum', '2024-06-06 11:01:59', '2024-06-06 11:01:59'),
(199, 'update-program_booking', 'sanctum', '2024-06-06 11:01:59', '2024-06-06 11:01:59'),
(200, 'delete-program_booking', 'sanctum', '2024-06-06 11:01:59', '2024-06-06 11:01:59');

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'travelSanctumAuth', 'c9ae0a4599084557071b265b6e9186e9944b7832d847769e84b1e894ff15ec38', '[\"*\"]', '2024-06-05 14:56:08', NULL, '2024-05-30 12:30:11', '2024-06-05 14:56:08'),
(2, 'App\\Models\\User', 1, 'travelSanctumAuth', '5f35279736841ceda5d4fe7edd33fcf7f76505bd4e6e55915bdbd7c610de0813', '[\"*\"]', '2024-05-30 14:01:43', NULL, '2024-05-30 14:00:39', '2024-05-30 14:01:43'),
(3, 'App\\Models\\User', 1, 'travelSanctumAuth', 'ecb44f006f622c770fd844cbfdb844f6fbfc263b14e27540535f1a1cc95d1ebb', '[\"*\"]', '2024-06-05 09:12:57', NULL, '2024-06-01 06:12:22', '2024-06-05 09:12:57'),
(4, 'App\\Models\\User', 1, 'travelSanctumAuth', 'cfd1f1cc87ba659965130383181df23053ca3c3072ff75e20ec7c65e61a682e0', '[\"*\"]', '2024-06-01 06:16:37', NULL, '2024-06-01 06:16:31', '2024-06-01 06:16:37'),
(5, 'App\\Models\\User', 1, 'travelSanctumAuth', 'e5e3cfc0678f1808fbc04cb104c099db18a237b05c3cc29a9dc6c51bf517f71d', '[\"*\"]', '2024-06-01 11:02:06', NULL, '2024-06-01 06:17:17', '2024-06-01 11:02:06'),
(6, 'App\\Models\\User', 1, 'travelSanctumAuth', 'd4bf0b2383af5c7cb7db5fc7533552811ab88d1aa6c278242cd8d206b50417c3', '[\"*\"]', '2024-06-01 11:20:43', NULL, '2024-06-01 11:07:16', '2024-06-01 11:20:43'),
(7, 'App\\Models\\User', 1, 'travelSanctumAuth', '71718cb18af4807c4ee4091460c0866001bc194f12cf0f0c251beb09df07fa3b', '[\"*\"]', '2024-06-02 05:18:30', NULL, '2024-06-02 03:51:55', '2024-06-02 05:18:30'),
(8, 'App\\Models\\User', 1, 'travelSanctumAuth', '28ca42b354e0bc15b2f775c7472fe70f67429dc0708a7470ffda9f362e33fe73', '[\"*\"]', '2024-06-02 09:54:59', NULL, '2024-06-02 05:18:47', '2024-06-02 09:54:59'),
(9, 'App\\Models\\User', 1, 'travelSanctumAuth', 'ec4ec73cb00447eede330e164eaefd4fdbbc414b2e1fd6567e6c5174184f3560', '[\"*\"]', '2024-06-02 09:36:01', NULL, '2024-06-02 05:50:51', '2024-06-02 09:36:01'),
(10, 'App\\Models\\User', 1, 'travelSanctumAuth', '00b36c5a1944daffd20a3dc09b7950278ac6284179ef54de910c0c1df15dd0f3', '[\"*\"]', '2024-06-05 16:27:47', NULL, '2024-06-02 07:27:35', '2024-06-05 16:27:47'),
(11, 'App\\Models\\User', 1, 'travelSanctumAuth', 'd26f032401212bccd23915ca14a711e5dcee76e7da764d3b1f8dec126ef56be2', '[\"*\"]', '2024-06-02 10:52:42', NULL, '2024-06-02 09:55:53', '2024-06-02 10:52:42'),
(12, 'App\\Models\\User', 1, 'travelSanctumAuth', 'ffca7daabd205b938d81ab00e5ff97a82f0aed1a36c8788e2ccff0ae1750af6b', '[\"*\"]', '2024-06-03 09:07:37', NULL, '2024-06-03 06:08:51', '2024-06-03 09:07:37'),
(13, 'App\\Models\\User', 1, 'travelSanctumAuth', '073f5313e4e8b9726fd30da2606a183ba4f0ac4e4ee40b0df3195ec0936e85c3', '[\"*\"]', '2024-06-03 10:52:33', NULL, '2024-06-03 10:15:59', '2024-06-03 10:52:33'),
(14, 'App\\Models\\User', 1, 'travelSanctumAuth', '7221874d9dfcce785a09d5d95f670a8071dbe0015a147c873ed28d0f2455ae2d', '[\"*\"]', '2024-06-03 12:03:52', NULL, '2024-06-03 10:44:17', '2024-06-03 12:03:52'),
(15, 'App\\Models\\User', 1, 'travelSanctumAuth', '22ed3da42c9470ff1df0f777ee97e7777b6b4cd0aacda81a277c1e1011abc908', '[\"*\"]', '2024-06-03 11:57:42', NULL, '2024-06-03 11:53:07', '2024-06-03 11:57:42'),
(16, 'App\\Models\\User', 1, 'travelSanctumAuth', 'fe4a530812751cfc3f767583ef8d7c6c3f630f06fd25b6decf70637c9f6d3a12', '[\"*\"]', '2024-06-03 11:58:24', NULL, '2024-06-03 11:57:59', '2024-06-03 11:58:24'),
(17, 'App\\Models\\User', 1, 'travelSanctumAuth', 'dc992c3ddcc8392d14e4e0ce5b1bdb27e85e163663dd277dcc38e210db221c4a', '[\"*\"]', '2024-06-03 12:13:58', NULL, '2024-06-03 12:11:25', '2024-06-03 12:13:58'),
(18, 'App\\Models\\User', 1, 'travelSanctumAuth', '968085dfec44a9cd49c1cf2d5341d7e9a8197d04b9749d9a24e29cf4b239a2f8', '[\"*\"]', '2024-06-05 06:54:38', NULL, '2024-06-04 04:44:12', '2024-06-05 06:54:38'),
(19, 'App\\Models\\User', 1, 'travelSanctumAuth', 'e192f06dc38cc45b03a088daf7f2b5b1146f2d86fa72fdc665010b9f82812aaf', '[\"*\"]', '2024-06-04 06:51:35', NULL, '2024-06-04 04:48:28', '2024-06-04 06:51:35'),
(20, 'App\\Models\\User', 1, 'travelSanctumAuth', '51805b7b070070ff216372be1a5e22990ad10617af6a0597570414725a8c38a1', '[\"*\"]', '2024-06-04 11:37:29', NULL, '2024-06-04 08:08:40', '2024-06-04 11:37:29'),
(21, 'App\\Models\\User', 1, 'travelSanctumAuth', '8fcd89ad739e75f91e0cc05de8584feeca740122eb7bb8b90371902a7c980056', '[\"*\"]', '2024-06-04 11:36:02', NULL, '2024-06-04 11:34:58', '2024-06-04 11:36:02'),
(22, 'App\\Models\\User', 1, 'travelSanctumAuth', 'c80fff29e074c53289769268a57b8e1e904c5ea64080a0cec1096bd219dcb9fa', '[\"*\"]', '2024-06-05 12:03:23', NULL, '2024-06-05 05:20:57', '2024-06-05 12:03:23'),
(23, 'App\\Models\\User', 1, 'travelSanctumAuth', 'fbb3d5d28a7c5b9a4e5493d6c2e647f50e8d7c120ed0e32239d487cf67e6008d', '[\"*\"]', '2024-06-05 08:11:38', NULL, '2024-06-05 05:42:01', '2024-06-05 08:11:38'),
(24, 'App\\Models\\User', 1, 'travelSanctumAuth', '8771c42ccfc310bcc05314942f3f742a54bb1c2baf9db8459db88d12c0a6bd89', '[\"*\"]', '2024-06-05 18:00:21', NULL, '2024-06-05 17:10:47', '2024-06-05 18:00:21'),
(25, 'App\\Models\\User', 1, 'travelSanctumAuth', '1e1f9ac006542950d0594474e6721710f23ac08133e8b041999f9ac8467510d3', '[\"*\"]', '2024-06-06 05:17:53', NULL, '2024-06-06 04:43:03', '2024-06-06 05:17:53'),
(26, 'App\\Models\\User', 1, 'travelSanctumAuth', '25adbbe8a2def4da804f7fd9dd5acc2ec4ee87b876010f56ab8a14389bd0b15a', '[\"*\"]', '2024-06-06 05:17:41', NULL, '2024-06-06 04:47:50', '2024-06-06 05:17:41'),
(27, 'App\\Models\\User', 1, 'travelSanctumAuth', '4a10d1447faa2f02c7ac2b3d4955d7eaf0e16b8c74b192681377eb87e6c40bcb', '[\"*\"]', '2024-06-12 06:02:10', NULL, '2024-06-06 08:08:56', '2024-06-12 06:02:10'),
(28, 'App\\Models\\User', 1, 'travelSanctumAuth', '45dfdc3d0b52e1f751861c298cc92c5dcddd4400469bae226128150b51fb187d', '[\"*\"]', '2024-06-13 09:45:53', NULL, '2024-06-12 06:10:18', '2024-06-13 09:45:53'),
(29, 'App\\Models\\User', 1, 'travelSanctumAuth', '42f212bc4ba3dcc35bce97d03ade5bacccb3cba9e81a6a221194e946d00f3885', '[\"*\"]', '2024-07-01 03:44:09', NULL, '2024-06-13 09:46:31', '2024-07-01 03:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_room_types`
--

CREATE TABLE `personal_room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_type` enum('1','2','3') DEFAULT '1' COMMENT '["1" => "فرد", "2" => "طفل", "3" => "رضيع"]',
  `is_residence` tinyint(1) NOT NULL DEFAULT 1 COMMENT '["0" => "بدون سكن", "1" => "بسكن" ]',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_room_types`
--

INSERT INTO `personal_room_types` (`id`, `person_type`, `is_residence`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 1, NULL, '2024-06-26 10:13:34', '2024-06-26 10:13:34'),
(2, '3', 0, NULL, '2024-06-26 10:13:53', '2024-06-26 10:13:53'),
(3, '3', 1, '2024-06-26 11:02:58', '2024-06-26 10:13:59', '2024-06-26 11:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` enum('Hajj','Umrah') DEFAULT 'Umrah',
  `notes` text DEFAULT NULL,
  `season_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `code`, `type`, `notes`, `season_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'dsasdaasd', 'dsfdf-11', 'Umrah', NULL, 1, '2024-06-30 11:06:15', NULL, NULL),
(2, 'Hajj1', 'dsfdf-12', 'Umrah', 'notes', 1, '2024-06-30 11:06:18', '2024-06-30 08:05:33', '2024-06-30 08:05:33'),
(9, 'Hajj1', '00000001', 'Umrah', 'notes', 1, NULL, '2024-06-30 08:11:41', '2024-06-30 08:11:41');

-- --------------------------------------------------------

--
-- Table structure for table `programs_bookings`
--

CREATE TABLE `programs_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `travel_date` varchar(255) DEFAULT NULL,
  `open_rooms` int(11) DEFAULT NULL,
  `no_rooms` int(11) DEFAULT NULL,
  `reset_rooms` int(11) DEFAULT NULL,
  `reservation_type` int(11) DEFAULT NULL,
  `client_category` int(11) DEFAULT NULL,
  `main_client` int(11) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs_hotels`
--

CREATE TABLE `programs_hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
  `num_of_days` int(11) DEFAULT 0,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `residence_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs_hotels`
--

INSERT INTO `programs_hotels` (`id`, `program_id`, `hotel_id`, `num_of_days`, `city_id`, `created_at`, `updated_at`, `residence_type_id`, `deleted_at`, `sort`) VALUES
(8, 1, 1, 30, 1, '2024-06-13 06:19:46', '2024-06-13 06:19:46', 1, NULL, NULL),
(10, 1, 1, 30, 1, '2024-06-13 06:50:50', '2024-06-13 06:50:50', 1, NULL, NULL),
(11, 1, 1, 2, 2, '2024-06-13 06:50:50', '2024-06-13 06:50:50', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `program_bookings`
--

CREATE TABLE `program_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cost` double(15,2) DEFAULT 0.00 COMMENT 'تكلفة سعر الغرفة المختارة',
  `service_cost` double(15,2) DEFAULT 0.00 COMMENT 'إجمالي تكلفة الخدمات المختارة',
  `total_cost` double DEFAULT 0 COMMENT 'إجمالي تكلفة سعر الغرفة بالإضافة إلي تكلفة الخدمات المختارة',
  `member_count` int(11) DEFAULT 0 COMMENT 'عدد الأفراد',
  `room_type` varchar(255) DEFAULT NULL,
  `program_date` date DEFAULT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reservation_payment` double DEFAULT 0 COMMENT 'مبلغ دفعة الحجز',
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `room_type_id` bigint(20) UNSIGNED NOT NULL,
  `client_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `main_client_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_bookings`
--

INSERT INTO `program_bookings` (`id`, `cost`, `service_cost`, `total_cost`, `member_count`, `room_type`, `program_date`, `program_id`, `deleted_at`, `created_at`, `updated_at`, `reservation_payment`, `client_id`, `room_type_id`, `client_category_id`, `main_client_id`) VALUES
(1, 100.00, 900.00, 1000, 1, 'room_type', '0000-00-00', 1, NULL, '2024-06-06 11:04:32', '2024-06-09 06:22:44', 0, 0, 0, 0, 0),
(2, 100.00, 900.00, 1000, 1, 'room_type', '0000-00-00', 1, NULL, '2024-06-09 06:14:54', '2024-06-09 06:14:54', 0, 0, 0, 0, 0),
(3, 100.00, 900.00, 1000, 1, 'room_type', '0000-00-00', 1, NULL, '2024-06-09 06:17:38', '2024-06-09 06:17:38', 0, 0, 0, 0, 0),
(4, 100.00, 900.00, 1000, 1, 'room_type', '0000-00-00', 1, NULL, '2024-06-09 06:18:45', '2024-06-09 08:25:59', 100, 1, 0, 0, 0),
(5, 100.00, 900.00, 1000, 1, 'room_type', '0000-00-00', 1, NULL, '2024-06-09 08:26:50', '2024-06-09 08:26:50', 100, 1, 0, 0, 0),
(6, 100.00, 900.00, 1000, 1, 'room', '0000-00-00', 1, NULL, '2024-06-11 09:28:06', '2024-06-11 09:28:06', 100, 1, 1, 1, 1),
(7, 50.00, 900.00, 1000, 10, 'room', '0000-00-00', 1, NULL, '2024-06-11 12:33:48', '2024-06-11 12:33:48', 50, 1, 1, 1, 1),
(8, 50.00, 900.00, 1000, 10, 'room', '0000-00-00', 1, NULL, '2024-06-12 06:53:51', '2024-06-12 06:53:51', 50, 1, 1, 1, 1),
(9, 50.00, 900.00, 1000, 10, 'room', '0000-00-00', 1, NULL, '2024-06-12 07:00:02', '2024-06-12 07:00:02', 50, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_booking_passengers`
--

CREATE TABLE `program_booking_passengers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_booking_id` bigint(20) UNSIGNED NOT NULL,
  `passenger_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_booking_passengers`
--

INSERT INTO `program_booking_passengers` (`id`, `program_booking_id`, `passenger_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 2, NULL, '2024-06-11 12:33:48', '2024-06-11 12:33:48'),
(2, 7, 2, NULL, '2024-06-11 12:33:48', '2024-06-11 12:33:48'),
(3, 8, 2, NULL, '2024-06-12 06:53:51', '2024-06-12 06:53:51'),
(4, 8, 2, NULL, '2024-06-12 06:53:51', '2024-06-12 06:53:51'),
(5, 9, 2, NULL, '2024-06-12 07:00:02', '2024-06-12 07:00:02'),
(6, 9, 2, NULL, '2024-06-12 07:00:02', '2024-06-12 07:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `program_booking_services`
--

CREATE TABLE `program_booking_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_booking_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program_hotels`
--

CREATE TABLE `program_hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `night_couts` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `hotel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `residence_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `program_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_hotels`
--

INSERT INTO `program_hotels` (`id`, `night_couts`, `sort`, `hotel_id`, `residence_type_id`, `program_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 30, 1, 1, 1, 1, NULL, '2024-06-27 12:09:50', '2024-06-27 12:09:50'),
(2, 2, 2, 1, 2, 1, NULL, '2024-06-27 12:09:50', '2024-06-27 12:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `program_prices`
--

CREATE TABLE `program_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_type` enum('person','child','baby') DEFAULT 'person' COMMENT '["person" => "فرد", "child" => "طفل", "baby" => "رضيع"]',
  `all_program` tinyint(1) DEFAULT 1 COMMENT 'برنامج كامل',
  `without_residence` tinyint(1) DEFAULT 0 COMMENT 'بدون سكن',
  `without_visa` tinyint(1) DEFAULT 0 COMMENT 'بدون تأشيرة',
  `without_flight` tinyint(1) DEFAULT 0 COMMENT 'بدون طيران',
  `price` double(15,2) DEFAULT 0.00,
  `room_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_prices`
--

INSERT INTO `program_prices` (`id`, `person_type`, `all_program`, `without_residence`, `without_visa`, `without_flight`, `price`, `room_type_id`, `program_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'person', 1, 1, 1, 1, 100.00, 1, 1, NULL, '2024-06-29 12:31:58', '2024-06-29 12:31:58'),
(2, 'person', 1, 1, 1, 1, 100.00, 2, 1, NULL, '2024-06-29 12:31:58', '2024-06-29 12:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `program_services`
--

CREATE TABLE `program_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_price` double(15,2) DEFAULT 0.00,
  `person_price` double(15,2) DEFAULT 0.00,
  `child_price` double(15,2) DEFAULT 0.00,
  `baby_price` double(15,2) DEFAULT 0.00,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `room_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `program_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_services`
--

INSERT INTO `program_services` (`id`, `form_price`, `person_price`, `child_price`, `baby_price`, `service_id`, `room_type_id`, `program_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2.00, 2.00, 2.00, 2.00, 1, 1, 1, NULL, '2024-06-29 13:18:21', '2024-06-29 13:18:21'),
(2, 2.00, 2.00, 2.00, 2.00, 1, 2, 1, NULL, '2024-06-29 13:18:21', '2024-06-29 13:18:21'),
(3, 10.00, 10.00, 10.00, 10.00, 1, 1, 1, NULL, '2024-06-29 13:19:24', '2024-06-29 13:19:24'),
(4, 33.00, 33.00, 33.00, 33.00, 2, 2, 1, NULL, '2024-06-29 13:19:24', '2024-06-29 13:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `program_trips`
--

CREATE TABLE `program_trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trip_number` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `count` varchar(255) NOT NULL,
  `program_id` bigint(20) UNSIGNED DEFAULT NULL,
  `flight_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_trips`
--

INSERT INTO `program_trips` (`id`, `trip_number`, `notes`, `count`, `program_id`, `flight_request_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 'notes 1', '', 1, 1, NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(2, '2', 'notes 2', '', 1, 1, NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(3, '3', 'notes 1', '10', 1, 1, NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(4, '4', 'notes 2', '20', 1, 1, NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(5, '5', 'notes 1', '100', 1, 1, NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(6, '6', 'notes 2', '100', 1, 1, NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(7, '7', 'notes 1', '100', 1, 1, NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(8, '8', 'notes 2', '200', 1, 2, NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(9, '9', 'note45', '100', 1, 1, NULL, '2024-06-30 12:19:57', '2024-07-01 03:44:10'),
(10, '10', 'notes 2', '100', 1, 2, NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `program_trip_rooms`
--

CREATE TABLE `program_trip_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) DEFAULT NULL,
  `room_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `program_trip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_trip_rooms`
--

INSERT INTO `program_trip_rooms` (`id`, `count`, `room_type_id`, `program_trip_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 2, NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(4, 12, 1, 2, NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(5, 2, 2, 3, NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(6, 22, 2, 3, NULL, '2024-06-30 06:47:57', '2024-06-30 06:47:57'),
(7, 1, 1, 1, NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(8, 12, 1, 1, NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(9, 2, 2, 2, NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(10, 22, 2, 2, NULL, '2024-06-30 09:00:58', '2024-06-30 09:00:58'),
(11, 1, 1, 3, NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(12, 12, 1, 3, NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(13, 2, 2, 4, NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(14, 22, 2, 4, NULL, '2024-06-30 09:03:08', '2024-06-30 09:03:08'),
(15, 1, 1, 5, NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(16, 12, 1, 5, NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(17, 2, 2, 6, NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(18, 22, 2, 6, NULL, '2024-06-30 11:55:36', '2024-06-30 11:55:36'),
(19, 1, 1, 7, NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(20, 12, 1, 7, NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(21, 2, 2, 8, NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(22, 22, 2, 8, NULL, '2024-06-30 12:06:06', '2024-06-30 12:06:06'),
(23, 1, 1, 9, NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57'),
(24, 12, 1, 9, NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57'),
(25, 2, 2, 10, NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57'),
(26, 22, 2, 10, NULL, '2024-06-30 12:19:57', '2024-06-30 12:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `program_users`
--

CREATE TABLE `program_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_users`
--

INSERT INTO `program_users` (`id`, `program_id`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 1, 1, NULL, '2024-06-12 07:28:23', '2024-06-12 07:28:23'),
(5, 1, 1, NULL, '2024-06-12 07:28:23', '2024-06-12 07:28:23'),
(6, 1, 1, NULL, '2024-06-12 10:01:40', '2024-06-12 10:01:40'),
(7, 1, 1, NULL, '2024-06-12 10:01:40', '2024-06-12 10:01:40'),
(8, 1, 1, NULL, '2024-06-13 06:33:45', '2024-06-13 06:33:45'),
(9, 1, 1, NULL, '2024-06-13 06:33:45', '2024-06-13 06:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `rate` double NOT NULL,
  `receipt_type` tinyint(1) NOT NULL,
  `note` text DEFAULT NULL,
  `reference_num` text NOT NULL DEFAULT '1',
  `payment_type` enum('total','partial','multi') NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cost_center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `safe_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doc_num` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `residence_types`
--

CREATE TABLE `residence_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `residence_types`
--

INSERT INTO `residence_types` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'name', 1, NULL, NULL, NULL),
(2, 'name2', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Super Admin\",\"ar\":\"\\u0633\\u0648\\u0628\\u0631 \\u0627\\u062f\\u0645\\u0646\"}', 'sanctum', '2024-05-30 12:00:31', '2024-05-30 12:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bed_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`, `bed_count`) VALUES
(1, 'name', 1, NULL, NULL, '2024-06-11 08:11:53', NULL),
(2, '{\"en\":\"en2\",\"ar\":\"ar2\"}', 1, NULL, '2024-06-11 08:06:59', '2024-06-11 08:10:42', 10);

-- --------------------------------------------------------

--
-- Table structure for table `safes`
--

CREATE TABLE `safes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `chart_account_expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chart_account_origin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `safes`
--

INSERT INTO `safes` (`id`, `name`, `account_number`, `status`, `branch_id`, `currency_id`, `chart_account_expense_id`, `chart_account_origin_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"CEGP\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649\"}', NULL, 0, 1, 4, NULL, 155, NULL, '2024-06-04 11:05:44', '2024-06-04 11:05:44'),
(2, '{\"en\":\"CASH\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649.\"}', NULL, 1, 1, 4, NULL, 155, '2024-06-05 06:02:14', '2024-06-04 11:13:40', '2024-06-05 06:02:14'),
(3, '{\"en\":\".CASH\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649..\"}', NULL, 1, 1, 4, NULL, 155, '2024-06-05 04:56:28', '2024-06-04 11:14:19', '2024-06-05 04:56:28'),
(4, '{\"en\":\"CEGP...\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649....\"}', NULL, 1, 1, 4, NULL, 155, '2024-06-05 04:56:23', '2024-06-04 11:16:13', '2024-06-05 04:56:23'),
(5, '{\"en\":\"......CEGP\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0645\\u0635\\u0631\\u0649......\"}', NULL, 1, 1, 4, NULL, 155, '2024-06-05 04:56:17', '2024-06-04 11:20:29', '2024-06-05 04:56:17'),
(6, '{\"en\":\"CEGP ONLY\",\"ar\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0641\\u0642\\u0637\"}', NULL, 0, 1, 4, NULL, 155, '2024-06-05 04:56:09', '2024-06-04 11:22:58', '2024-06-05 04:56:09'),
(7, '{\"en\":\"CEGP ONLY......\",\"ar\":\"\\u062c\\u0646\\u064a\\u0647 \\u0645\\u0635\\u0631\\u0649 \\u0641\\u0642\\u0637....\"}', NULL, 1, 1, 4, NULL, 155, NULL, '2024-06-04 11:26:58', '2024-06-04 11:26:58'),
(8, '{\"en\":\"CUSD\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u062f\\u0648\\u0644\\u0631\"}', NULL, 1, 1, 1, NULL, 156, NULL, '2024-06-05 06:02:43', '2024-06-05 06:02:43'),
(9, '{\"en\":\"CEUR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u064a\\u0648\\u0631\\u0648\"}', NULL, 1, 1, 2, NULL, 157, NULL, '2024-06-05 06:03:15', '2024-06-05 06:03:15'),
(10, '{\"en\":\"CSAR\",\"ar\":\"\\u062e\\u0632\\u064a\\u0646\\u0647 \\u0631\\u064a\\u0627\\u0644\"}', NULL, 1, 1, 3, NULL, 158, NULL, '2024-06-05 06:03:42', '2024-06-05 06:03:49');

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE `seasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seasons`
--

INSERT INTO `seasons` (`id`, `name`, `from_date`, `to_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'name', '2011-01-25', '2024-06-30', NULL, '2024-06-26 07:42:10', '2024-06-26 10:08:57'),
(2, 'name', '2011-01-25', '2024-06-30', NULL, '2024-06-26 07:44:05', '2024-06-26 10:09:03'),
(3, 'name', '2011-01-25', '2024-06-30', '2024-06-26 10:09:55', '2024-06-26 10:06:23', '2024-06-26 10:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_type` enum('reservation','individual','room') NOT NULL DEFAULT 'reservation' COMMENT 'إستمارة\r\nفرد\r\nغرفة',
  `hotel_service` tinyint(1) DEFAULT 0 COMMENT 'خدمة فندقية أم أخري\r\n1=فندقية\r\n0=أخري'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`, `service_type`, `hotel_service`) VALUES
(1, 'service', 1, NULL, NULL, NULL, 'reservation', 0),
(2, 'service2', 1, NULL, NULL, NULL, 'reservation', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `index` int(11) NOT NULL DEFAULT 0,
  `options` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `type`, `title`, `index`, `options`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'base_currency_id', '4', 'dropdown', 'general_setting', 4, '@currencies', NULL, '2024-05-30 12:24:16', '2024-06-04 16:04:37'),
(2, 'app_name', NULL, 'text', 'general_setting', 1, NULL, NULL, '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(3, 'app_logo', NULL, 'file', 'general_setting', 2, NULL, NULL, '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(4, 'exp_date', '31-12-2024', 'date', 'general_setting', 3, NULL, NULL, '2024-05-30 12:24:17', '2024-05-30 12:24:17'),
(5, 'client_account_id', '32', 'dropdown', 'accounting_setting', 3, '@chart_accounts', NULL, '2024-05-30 12:25:54', '2024-06-04 10:06:53'),
(6, 'supplier_account_id', NULL, 'dropdown', 'accounting_setting', 4, '@chart_accounts', NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(7, 'entity_account_id', NULL, 'dropdown', 'accounting_setting', 5, '@chart_accounts', NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(8, 'sales_account_id', NULL, 'dropdown', 'accounting_setting', 6, '@chart_accounts', NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(9, 'profit_account_id', NULL, 'dropdown', 'accounting_setting', 7, '@chart_accounts', NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(10, 'currency_exchange_account_id', NULL, 'dropdown', 'accounting_setting', 8, '@chart_accounts', NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(11, 'print_header', NULL, 'file', 'accounting_setting', 9, NULL, NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(12, 'print_footer', NULL, 'file', 'accounting_setting', 10, NULL, NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(13, 'print_notes', NULL, 'text', 'accounting_setting', 11, NULL, NULL, '2024-05-30 12:25:54', '2024-05-30 12:25:54'),
(14, 'chart_type_tree_level_count', NULL, 'integer', 'accounting_setting', 1, NULL, NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(15, 'chart_type_tree_levels', NULL, 'json', 'accounting_setting', 2, NULL, NULL, '2024-05-30 12:25:55', '2024-05-30 12:25:55'),
(16, 'payment_receipt_gl_type_id', NULL, 'dropdown', 'accounting_setting', 12, '@gl_types', NULL, '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(17, 'receive_receipt_gl_type_id', NULL, 'dropdown', 'accounting_setting', 13, '@gl_types', NULL, '2024-05-30 12:25:56', '2024-05-30 12:25:56'),
(18, 'reference_components', '[{\"key\":\"receipt_type\",\"value\":{\"receive\":\"R\",\"pay\":\"P\"},\"type\":\"text\",\"index\":0},{\"key\":\"branch_code\",\"value\":true,\"type\":\"boolean\",\"index\":1},{\"key\":\"cost_center_code\",\"value\":true,\"type\":\"boolean\",\"index\":2},{\"key\":\"serial\",\"value\":1,\"type\":\"numeric\",\"index\":3}]', 'json', 'accounting_setting', 14, NULL, NULL, '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(19, 'use_tax', NULL, 'boolean', 'accounting_setting', 15, NULL, NULL, '2024-05-30 12:25:57', '2024-05-30 12:25:57'),
(24, 'program_code', 'ABC-', 'text', 'general_setting', 1, NULL, NULL, '2024-06-30 07:17:18', '2024-06-30 07:17:18'),
(25, 'max_stars', '5', 'integer', 'general_setting', 2, NULL, NULL, '2024-06-30 07:17:18', '2024-06-30 07:17:18');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `chart_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `status`, `chart_account_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'فرصه', 1, 104, NULL, '2024-06-04 07:33:36', '2024-06-04 10:55:45'),
(2, 'بى اس بى', 0, 164, NULL, '2024-06-04 10:53:56', '2024-06-04 10:53:56'),
(3, 'فندق على بابا', 0, 165, NULL, '2024-06-04 10:54:36', '2024-06-04 10:54:36'),
(4, 'البنا', 0, 103, NULL, '2024-06-04 10:54:51', '2024-06-04 10:54:51'),
(5, 'كيان', 0, 104, NULL, '2024-06-04 10:55:02', '2024-06-04 10:55:02');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` double(8,2) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `chart_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'tsmv_admin@mv-is.com', NULL, '$2y$12$yCpGil/qyPHTMYQmPna2j.VLq6Z73TGm5/ZqDiopE7bFr8tg0PwES', 1, NULL, '2024-05-30 12:00:31', '2024-05-30 12:00:31', NULL),
(2, 'محمد', 'Das@d.com', NULL, '$2y$12$gygbOSTe3D6NE/enyL/kZO2DtpGfUGbZKZVwWL2v2LQ/qxAvntxk.', 0, NULL, '2024-06-04 08:09:38', '2024-06-04 08:10:16', '2024-06-10 08:25:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_name_index` (`name`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `additional_data`
--
ALTER TABLE `additional_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_city_id_foreign` (`city_id`),
  ADD KEY `areas_name_index` (`name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_area_id_foreign` (`area_id`),
  ADD KEY `branches_name_email_mobile_index` (`name`,`email`,`mobile`);

--
-- Indexes for table `chart_accounts`
--
ALTER TABLE `chart_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_accounts_name_index` (`name`),
  ADD KEY `chart_accounts_type_id_foreign` (`type_id`);

--
-- Indexes for table `chart_classes`
--
ALTER TABLE `chart_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_classes_name_index` (`name`);

--
-- Indexes for table `chart_types`
--
ALTER TABLE `chart_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_types_name_index` (`name`),
  ADD KEY `chart_types_class_id_foreign` (`class_id`),
  ADD KEY `chart_types_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`),
  ADD KEY `cities_name_index` (`name`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_user_id_foreign` (`user_id`),
  ADD KEY `clients_chart_account_id_foreign` (`chart_account_id`);

--
-- Indexes for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_categories_name_index` (`name`);

--
-- Indexes for table `cost_centers`
--
ALTER TABLE `cost_centers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cost_centers_name_index` (`name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_name_index` (`name`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_name_index` (`name`);

--
-- Indexes for table `custodians`
--
ALTER TABLE `custodians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custodians_name_index` (`name`),
  ADD KEY `custodians_account_id_foreign` (`account_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_name_index` (`name`);

--
-- Indexes for table `custom_field_data`
--
ALTER TABLE `custom_field_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_data_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `custom_field_data_value_index` (`value`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_name_index` (`name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_branch_id_foreign` (`branch_id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `entities`
--
ALTER TABLE `entities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_name_index` (`name`),
  ADD KEY `entities_chart_account_id_foreign` (`chart_account_id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilities_name_index` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fiscal_years`
--
ALTER TABLE `fiscal_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flightpaths`
--
ALTER TABLE `flightpaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flightpaths_from_city_id_foreign` (`from_city_id`),
  ADD KEY `flightpaths_to_city_id_foreign` (`to_city_id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flights_flight_company_id_foreign` (`flight_company_id`),
  ADD KEY `flights_travel_path_id_foreign` (`travel_path_id`),
  ADD KEY `flights_return_path_id_foreign` (`return_path_id`),
  ADD KEY `flights_flight_request_id_foreign` (`flight_request_id`);

--
-- Indexes for table `flight_accommodations`
--
ALTER TABLE `flight_accommodations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_accommodations_flight_id_foreign` (`flight_id`),
  ADD KEY `flight_accommodations_passenger_id_foreign` (`passenger_id`),
  ADD KEY `flight_accommodations_program_booking_id_foreign` (`program_booking_id`);

--
-- Indexes for table `flight_companies`
--
ALTER TABLE `flight_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_companies_name_index` (`name`);

--
-- Indexes for table `flight_requests`
--
ALTER TABLE `flight_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_requests_travel_path_id_foreign` (`travel_path_id`),
  ADD KEY `flight_requests_return_path_id_foreign` (`return_path_id`);

--
-- Indexes for table `gl_journals`
--
ALTER TABLE `gl_journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gl_journals_currency_id_foreign` (`currency_id`),
  ADD KEY `gl_journals_gl_type_id_foreign` (`gl_type_id`),
  ADD KEY `gl_journals_user_id_foreign` (`user_id`);

--
-- Indexes for table `gl_transactions`
--
ALTER TABLE `gl_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gl_transactions_chart_account_id_foreign` (`chart_account_id`),
  ADD KEY `gl_transactions_gl_journal_id_foreign` (`gl_journal_id`),
  ADD KEY `gl_transactions_cost_center_id_foreign` (`cost_center_id`);

--
-- Indexes for table `gl_types`
--
ALTER TABLE `gl_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gl_types_name_index` (`name`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotels_city_id_foreign` (`city_id`),
  ADD KEY `hotels_hotel_star_id_foreign` (`hotel_star_id`);

--
-- Indexes for table `hotel_stars`
--
ALTER TABLE `hotel_stars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_branch_id_foreign` (`branch_id`),
  ADD KEY `invoices_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_branch_id_foreign` (`branch_id`),
  ADD KEY `orders_safe_id_foreign` (`safe_id`),
  ADD KEY `orders_tax_id_foreign` (`tax_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_related_order_details_id_foreign` (`related_order_details_id`),
  ADD KEY `orders_cost_center_id_foreign` (`cost_center_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_activity_id_foreign` (`activity_id`);

--
-- Indexes for table `order_receipt`
--
ALTER TABLE `order_receipt`
  ADD KEY `order_receipt_receipt_id_foreign` (`receipt_id`),
  ADD KEY `order_receipt_order_id_foreign` (`order_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_name_index` (`name`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `personal_room_types`
--
ALTER TABLE `personal_room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programs_season_id_foreign` (`season_id`);

--
-- Indexes for table `programs_bookings`
--
ALTER TABLE `programs_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programs_bookings_program_id_foreign` (`program_id`);

--
-- Indexes for table `programs_hotels`
--
ALTER TABLE `programs_hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programs_hotels_program_id_foreign` (`program_id`),
  ADD KEY `programs_hotels_hotel_id_foreign` (`hotel_id`),
  ADD KEY `programs_hotels_city_id_foreign` (`city_id`),
  ADD KEY `programs_hotels_residence_type_id_foreign` (`residence_type_id`);

--
-- Indexes for table `program_bookings`
--
ALTER TABLE `program_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_bookings_program_id_foreign` (`program_id`);

--
-- Indexes for table `program_booking_passengers`
--
ALTER TABLE `program_booking_passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_booking_passengers_program_booking_id_foreign` (`program_booking_id`),
  ADD KEY `program_booking_passengers_passenger_id_foreign` (`passenger_id`);

--
-- Indexes for table `program_booking_services`
--
ALTER TABLE `program_booking_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_booking_services_program_booking_id_foreign` (`program_booking_id`);

--
-- Indexes for table `program_hotels`
--
ALTER TABLE `program_hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_hotels_hotel_id_foreign` (`hotel_id`),
  ADD KEY `program_hotels_residence_type_id_foreign` (`residence_type_id`),
  ADD KEY `program_hotels_program_id_foreign` (`program_id`);

--
-- Indexes for table `program_prices`
--
ALTER TABLE `program_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_prices_room_type_id_foreign` (`room_type_id`),
  ADD KEY `program_prices_program_id_foreign` (`program_id`);

--
-- Indexes for table `program_services`
--
ALTER TABLE `program_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_services_service_id_foreign` (`service_id`),
  ADD KEY `program_services_room_type_id_foreign` (`room_type_id`),
  ADD KEY `program_services_program_id_foreign` (`program_id`);

--
-- Indexes for table `program_trips`
--
ALTER TABLE `program_trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_trips_program_id_foreign` (`program_id`),
  ADD KEY `program_trips_flight_request_id_foreign` (`flight_request_id`);

--
-- Indexes for table `program_trip_rooms`
--
ALTER TABLE `program_trip_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_trip_rooms_room_type_id_foreign` (`room_type_id`),
  ADD KEY `program_trip_rooms_program_trip_id_foreign` (`program_trip_id`);

--
-- Indexes for table `program_users`
--
ALTER TABLE `program_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_users_program_id_foreign` (`program_id`),
  ADD KEY `program_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipts_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `receipts_cost_center_id_foreign` (`cost_center_id`),
  ADD KEY `receipts_branch_id_foreign` (`branch_id`),
  ADD KEY `receipts_safe_id_foreign` (`safe_id`),
  ADD KEY `receipts_user_id_foreign` (`user_id`);

--
-- Indexes for table `residence_types`
--
ALTER TABLE `residence_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `residence_types_name_index` (`name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_types_name_index` (`name`);

--
-- Indexes for table `safes`
--
ALTER TABLE `safes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `safes_branch_id_foreign` (`branch_id`),
  ADD KEY `safes_currency_id_foreign` (`currency_id`),
  ADD KEY `safes_chart_account_expense_id_foreign` (`chart_account_expense_id`),
  ADD KEY `safes_chart_account_origin_id_foreign` (`chart_account_origin_id`),
  ADD KEY `account_number` (`name`);

--
-- Indexes for table `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_name_index` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_name_index` (`name`),
  ADD KEY `suppliers_chart_account_id_foreign` (`chart_account_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_name_index` (`name`),
  ADD KEY `taxes_chart_account_id_foreign` (`chart_account_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=957;

--
-- AUTO_INCREMENT for table `additional_data`
--
ALTER TABLE `additional_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chart_accounts`
--
ALTER TABLE `chart_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `chart_classes`
--
ALTER TABLE `chart_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chart_types`
--
ALTER TABLE `chart_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cost_centers`
--
ALTER TABLE `cost_centers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `custodians`
--
ALTER TABLE `custodians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `custom_field_data`
--
ALTER TABLE `custom_field_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entities`
--
ALTER TABLE `entities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fiscal_years`
--
ALTER TABLE `fiscal_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flightpaths`
--
ALTER TABLE `flightpaths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `flight_accommodations`
--
ALTER TABLE `flight_accommodations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_companies`
--
ALTER TABLE `flight_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight_requests`
--
ALTER TABLE `flight_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gl_journals`
--
ALTER TABLE `gl_journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gl_transactions`
--
ALTER TABLE `gl_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gl_types`
--
ALTER TABLE `gl_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotel_stars`
--
ALTER TABLE `hotel_stars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `personal_room_types`
--
ALTER TABLE `personal_room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `programs_bookings`
--
ALTER TABLE `programs_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs_hotels`
--
ALTER TABLE `programs_hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `program_bookings`
--
ALTER TABLE `program_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `program_booking_passengers`
--
ALTER TABLE `program_booking_passengers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `program_booking_services`
--
ALTER TABLE `program_booking_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_hotels`
--
ALTER TABLE `program_hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program_prices`
--
ALTER TABLE `program_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program_services`
--
ALTER TABLE `program_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `program_trips`
--
ALTER TABLE `program_trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `program_trip_rooms`
--
ALTER TABLE `program_trip_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `program_users`
--
ALTER TABLE `program_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `residence_types`
--
ALTER TABLE `residence_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `safes`
--
ALTER TABLE `safes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chart_accounts`
--
ALTER TABLE `chart_accounts`
  ADD CONSTRAINT `chart_accounts_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `chart_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chart_types`
--
ALTER TABLE `chart_types`
  ADD CONSTRAINT `chart_types_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `chart_classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chart_types_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `chart_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_chart_account_id_foreign` FOREIGN KEY (`chart_account_id`) REFERENCES `chart_accounts` (`id`),
  ADD CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custodians`
--
ALTER TABLE `custodians`
  ADD CONSTRAINT `custodians_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_field_data`
--
ALTER TABLE `custom_field_data`
  ADD CONSTRAINT `custom_field_data_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entities`
--
ALTER TABLE `entities`
  ADD CONSTRAINT `entities_chart_account_id_foreign` FOREIGN KEY (`chart_account_id`) REFERENCES `chart_accounts` (`id`);

--
-- Constraints for table `flightpaths`
--
ALTER TABLE `flightpaths`
  ADD CONSTRAINT `flightpaths_from_city_id_foreign` FOREIGN KEY (`from_city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `flightpaths_to_city_id_foreign` FOREIGN KEY (`to_city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_flight_company_id_foreign` FOREIGN KEY (`flight_company_id`) REFERENCES `flight_companies` (`id`),
  ADD CONSTRAINT `flights_flight_request_id_foreign` FOREIGN KEY (`flight_request_id`) REFERENCES `flight_requests` (`id`),
  ADD CONSTRAINT `flights_return_path_id_foreign` FOREIGN KEY (`return_path_id`) REFERENCES `flightpaths` (`id`),
  ADD CONSTRAINT `flights_travel_path_id_foreign` FOREIGN KEY (`travel_path_id`) REFERENCES `flightpaths` (`id`);

--
-- Constraints for table `flight_accommodations`
--
ALTER TABLE `flight_accommodations`
  ADD CONSTRAINT `flight_accommodations_flight_id_foreign` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`),
  ADD CONSTRAINT `flight_accommodations_passenger_id_foreign` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`),
  ADD CONSTRAINT `flight_accommodations_program_booking_id_foreign` FOREIGN KEY (`program_booking_id`) REFERENCES `program_bookings` (`id`);

--
-- Constraints for table `flight_requests`
--
ALTER TABLE `flight_requests`
  ADD CONSTRAINT `flight_requests_return_path_id_foreign` FOREIGN KEY (`return_path_id`) REFERENCES `flightpaths` (`id`),
  ADD CONSTRAINT `flight_requests_travel_path_id_foreign` FOREIGN KEY (`travel_path_id`) REFERENCES `flightpaths` (`id`);

--
-- Constraints for table `gl_journals`
--
ALTER TABLE `gl_journals`
  ADD CONSTRAINT `gl_journals_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `gl_journals_gl_type_id_foreign` FOREIGN KEY (`gl_type_id`) REFERENCES `gl_types` (`id`),
  ADD CONSTRAINT `gl_journals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `gl_transactions`
--
ALTER TABLE `gl_transactions`
  ADD CONSTRAINT `gl_transactions_chart_account_id_foreign` FOREIGN KEY (`chart_account_id`) REFERENCES `chart_accounts` (`id`),
  ADD CONSTRAINT `gl_transactions_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `gl_transactions_gl_journal_id_foreign` FOREIGN KEY (`gl_journal_id`) REFERENCES `gl_journals` (`id`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `hotels_hotel_star_id_foreign` FOREIGN KEY (`hotel_star_id`) REFERENCES `hotel_stars` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `invoices_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `orders_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `orders_related_order_details_id_foreign` FOREIGN KEY (`related_order_details_id`) REFERENCES `order_details` (`id`),
  ADD CONSTRAINT `orders_safe_id_foreign` FOREIGN KEY (`safe_id`) REFERENCES `safes` (`id`),
  ADD CONSTRAINT `orders_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_receipt`
--
ALTER TABLE `order_receipt`
  ADD CONSTRAINT `order_receipt_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_receipt_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `programs_season_id_foreign` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`);

--
-- Constraints for table `programs_bookings`
--
ALTER TABLE `programs_bookings`
  ADD CONSTRAINT `programs_bookings_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Constraints for table `programs_hotels`
--
ALTER TABLE `programs_hotels`
  ADD CONSTRAINT `programs_hotels_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `programs_hotels_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  ADD CONSTRAINT `programs_hotels_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `programs_hotels_residence_type_id_foreign` FOREIGN KEY (`residence_type_id`) REFERENCES `residence_types` (`id`);

--
-- Constraints for table `program_bookings`
--
ALTER TABLE `program_bookings`
  ADD CONSTRAINT `program_bookings_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Constraints for table `program_booking_passengers`
--
ALTER TABLE `program_booking_passengers`
  ADD CONSTRAINT `program_booking_passengers_passenger_id_foreign` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`),
  ADD CONSTRAINT `program_booking_passengers_program_booking_id_foreign` FOREIGN KEY (`program_booking_id`) REFERENCES `program_bookings` (`id`);

--
-- Constraints for table `program_booking_services`
--
ALTER TABLE `program_booking_services`
  ADD CONSTRAINT `program_booking_services_program_booking_id_foreign` FOREIGN KEY (`program_booking_id`) REFERENCES `program_bookings` (`id`);

--
-- Constraints for table `program_hotels`
--
ALTER TABLE `program_hotels`
  ADD CONSTRAINT `program_hotels_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  ADD CONSTRAINT `program_hotels_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `program_hotels_residence_type_id_foreign` FOREIGN KEY (`residence_type_id`) REFERENCES `residence_types` (`id`);

--
-- Constraints for table `program_prices`
--
ALTER TABLE `program_prices`
  ADD CONSTRAINT `program_prices_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `program_prices_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`);

--
-- Constraints for table `program_services`
--
ALTER TABLE `program_services`
  ADD CONSTRAINT `program_services_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `program_services_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`),
  ADD CONSTRAINT `program_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `program_trips`
--
ALTER TABLE `program_trips`
  ADD CONSTRAINT `program_trips_flight_request_id_foreign` FOREIGN KEY (`flight_request_id`) REFERENCES `flight_requests` (`id`),
  ADD CONSTRAINT `program_trips_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Constraints for table `program_trip_rooms`
--
ALTER TABLE `program_trip_rooms`
  ADD CONSTRAINT `program_trip_rooms_program_trip_id_foreign` FOREIGN KEY (`program_trip_id`) REFERENCES `program_trips` (`id`),
  ADD CONSTRAINT `program_trip_rooms_room_type_id_foreign` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`id`);

--
-- Constraints for table `program_users`
--
ALTER TABLE `program_users`
  ADD CONSTRAINT `program_users_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `program_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `receipts_cost_center_id_foreign` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  ADD CONSTRAINT `receipts_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `receipts_safe_id_foreign` FOREIGN KEY (`safe_id`) REFERENCES `safes` (`id`),
  ADD CONSTRAINT `receipts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `safes`
--
ALTER TABLE `safes`
  ADD CONSTRAINT `safes_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `safes_chart_account_expense_id_foreign` FOREIGN KEY (`chart_account_expense_id`) REFERENCES `chart_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `safes_chart_account_origin_id_foreign` FOREIGN KEY (`chart_account_origin_id`) REFERENCES `chart_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `safes_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_chart_account_id_foreign` FOREIGN KEY (`chart_account_id`) REFERENCES `chart_accounts` (`id`);

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_chart_account_id_foreign` FOREIGN KEY (`chart_account_id`) REFERENCES `chart_accounts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
