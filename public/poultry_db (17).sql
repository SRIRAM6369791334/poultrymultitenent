-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2026 at 12:06 PM
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
-- Database: `poultry_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `record_id` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `module`, `record_id`, `timestamp`) VALUES
(1, 1, 'Login', 'Auth', 1, '2026-08-08 13:17:18'),
(2, 1, 'Login', 'Auth', 1, '2026-08-10 03:56:57'),
(3, 1, 'Login', 'Auth', 1, '2026-08-10 06:21:27'),
(4, 1, 'Login', 'Auth', 1, '2026-08-10 06:50:44'),
(5, 1, 'Login', 'Auth', 1, '2026-08-10 11:10:27'),
(6, 1, 'Login', 'Auth', 1, '2026-08-11 04:10:38'),
(7, 1, 'Login', 'Auth', 1, '2026-08-11 11:17:14'),
(8, 1, 'Login', 'Auth', 1, '2026-08-12 03:54:42'),
(9, 1, 'Login', 'Auth', 1, '2026-08-12 04:03:23'),
(10, 1, 'Logout', 'Auth', 1, '2026-08-12 04:58:52'),
(11, 1, 'Login', 'Auth', 1, '2026-08-12 05:00:17'),
(12, 1, 'Login', 'Auth', 1, '2026-08-12 12:10:21'),
(13, 1, 'Login', 'Auth', 1, '2026-08-13 05:44:31'),
(14, 1, 'Login', 'Auth', 1, '2026-08-14 06:57:55'),
(15, 1, 'Login', 'Auth', 1, '2026-08-14 09:47:06'),
(16, 1, 'Login', 'Auth', 1, '2026-08-14 10:13:58'),
(17, 1, 'Login', 'Auth', 1, '2026-08-17 13:28:28'),
(18, 1, 'Login', 'Auth', 1, '2026-08-18 06:35:18'),
(19, 1, 'Login', 'Auth', 1, '2026-08-18 14:34:10'),
(20, 1, 'Login', 'Auth', 1, '2026-08-19 06:11:51'),
(21, 1, 'Login', 'Auth', 1, '2026-08-19 06:13:21'),
(22, 1, 'Login', 'Auth', 1, '2026-08-19 08:05:01'),
(23, 1, 'Login', 'Auth', 1, '2026-08-19 08:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_code` varchar(255) NOT NULL,
  `placement_date` date NOT NULL,
  `initial_count` int(11) NOT NULL,
  `current_count` int(11) NOT NULL,
  `breed` varchar(255) DEFAULT NULL,
  `avg_placement_weight` decimal(8,3) DEFAULT NULL,
  `status` enum('Active','Closed') NOT NULL DEFAULT 'Active',
  `closed_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bird_batches`
--

CREATE TABLE `bird_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_name` varchar(255) NOT NULL,
  `date_received` date NOT NULL,
  `initial_count` int(11) NOT NULL,
  `current_count` int(11) NOT NULL,
  `avg_weight` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capital_transactions`
--

CREATE TABLE `capital_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('Investment','Transfer to Cash','Transfer to Bank','Transfer from Cash','Transfer from Bank','Withdrawal','Vendor Advance Outflow') NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_mode` varchar(255) NOT NULL DEFAULT 'Cash',
  `bank_transfer_type` varchar(255) DEFAULT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `capital_transactions`
--

INSERT INTO `capital_transactions` (`id`, `type`, `date`, `amount`, `payment_mode`, `bank_transfer_type`, `person_name`, `reference_number`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Investment', '2026-08-19', 50000.00, 'Cash', NULL, 'demo', NULL, NULL, 1, '2026-08-19 06:36:18', '2026-08-19 06:36:18'),
(2, 'Investment', '2026-08-19', 50000.00, 'Bank Transfer', 'UPI', 'demo', NULL, NULL, 1, '2026-08-19 06:36:18', '2026-08-19 06:36:18'),
(3, 'Transfer to Cash', '2026-08-19', 50000.00, 'Cash', NULL, 'demo', NULL, NULL, 1, '2026-08-19 06:36:47', '2026-08-19 06:36:47'),
(4, 'Transfer to Bank', '2026-08-19', 50000.00, 'Bank Transfer', 'UPI', 'demo', NULL, NULL, 1, '2026-08-19 06:37:18', '2026-08-19 06:37:18'),
(5, 'Transfer from Cash', '2026-08-19', 100000.00, 'Cash', NULL, NULL, NULL, NULL, 1, '2026-08-19 06:40:45', '2026-08-19 06:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `cash_bank_ledgers`
--

CREATE TABLE `cash_bank_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ledger_date` date NOT NULL,
  `opening_cash_balance` decimal(12,2) NOT NULL,
  `opening_bank_balance` decimal(12,2) NOT NULL,
  `cash_income` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bank_income` decimal(12,2) NOT NULL DEFAULT 0.00,
  `cash_expense` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bank_expense` decimal(12,2) NOT NULL DEFAULT 0.00,
  `closing_cash_balance` decimal(12,2) NOT NULL,
  `closing_bank_balance` decimal(12,2) NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `approved_amount` decimal(12,2) DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_bank_ledgers`
--

INSERT INTO `cash_bank_ledgers` (`id`, `ledger_date`, `opening_cash_balance`, `opening_bank_balance`, `cash_income`, `bank_income`, `cash_expense`, `bank_expense`, `closing_cash_balance`, `closing_bank_balance`, `is_approved`, `approved_amount`, `approved_by`, `approved_at`, `created_at`, `updated_at`) VALUES
(1, '2026-08-11', 155000.00, 140300.00, 0.00, 0.00, 0.00, 0.00, 155000.00, 140300.00, 0, NULL, NULL, NULL, '2026-08-11 09:40:49', '2026-08-19 10:02:09'),
(2, '2026-08-12', 155000.00, 140300.00, 0.00, 0.00, 0.00, 0.00, 155000.00, 140300.00, 0, NULL, NULL, NULL, '2026-08-12 04:11:36', '2026-08-19 10:02:09'),
(3, '2026-08-10', 0.00, 0.00, 155000.00, 140300.00, 0.00, 0.00, 155000.00, 140300.00, 0, NULL, NULL, NULL, '2026-08-12 04:14:47', '2026-08-19 10:02:09'),
(4, '2026-08-14', 155000.00, 140300.00, 0.00, 0.00, 0.00, 0.00, 155000.00, 140300.00, 0, NULL, NULL, NULL, '2026-08-14 07:16:54', '2026-08-19 10:02:09'),
(5, '2026-08-17', 155000.00, 140300.00, 0.00, 0.00, 0.00, 0.00, 155000.00, 140300.00, 0, NULL, NULL, NULL, '2026-08-17 06:59:54', '2026-08-19 10:02:09'),
(6, '2026-08-18', 155000.00, 140300.00, 0.00, 0.00, 0.00, 0.00, 155000.00, 140300.00, 0, NULL, NULL, NULL, '2026-08-18 06:35:23', '2026-08-19 10:02:09'),
(7, '2026-08-19', 155000.00, 140300.00, 50000.00, 50000.00, 100000.00, 0.00, 105000.00, 190300.00, 0, NULL, NULL, NULL, '2026-08-19 06:12:59', '2026-08-19 10:02:09');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gst_number` varchar(20) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `route_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('Retail','Wholesale') NOT NULL DEFAULT 'Retail',
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `gst_number`, `route`, `route_id`, `type`, `balance`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mathina chicken', '99444011145', 'panruti', NULL, 'panruti', NULL, 'Retail', 0.00, '2026-07-18 06:46:45', '2026-08-05 01:10:35', '2026-08-05 01:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `cod_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bank_transfer_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(12,2) GENERATED ALWAYS AS (`cod_amount` + `bank_transfer_amount`) STORED,
  `payment_mode` enum('Cash','UPI','NEFT','Cheque','Bank Transfer') NOT NULL,
  `payment_type` enum('Full','Part','Advance','Regular','Adjustment','Opening') NOT NULL,
  `balance_after` decimal(12,2) NOT NULL DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_bills`
--

CREATE TABLE `daily_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dealer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `gst_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `gst_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(255) NOT NULL DEFAULT 'cash',
  `bank_method` enum('UPI','Cheque','NEFT') DEFAULT NULL,
  `previous_outstanding` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payments_during_day` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` enum('COD','Pending','Bank','Paid') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_bill_items`
--

CREATE TABLE `daily_bill_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `daily_bill_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity_kg` decimal(10,2) NOT NULL,
  `rate_per_kg` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `day_load_batches`
--

CREATE TABLE `day_load_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billing_date` date NOT NULL,
  `status` enum('Open','Invoiced','Locked') NOT NULL DEFAULT 'Open',
  `total_boxes` int(11) NOT NULL DEFAULT 0,
  `total_box_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_empty_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_bird_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_farm_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_dealer_income` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_vendor_cost` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_dealer_collected` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_vendor_paid` decimal(14,2) NOT NULL DEFAULT 0.00,
  `total_loss_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_weight_loss_approved` tinyint(1) NOT NULL DEFAULT 0,
  `weight_loss_approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `weight_loss_approved_at` timestamp NULL DEFAULT NULL,
  `weight_loss_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `day_load_batches`
--

INSERT INTO `day_load_batches` (`id`, `billing_date`, `status`, `total_boxes`, `total_box_weight`, `total_empty_weight`, `total_bird_weight`, `total_farm_weight`, `total_weight`, `total_dealer_income`, `total_vendor_cost`, `total_dealer_collected`, `total_vendor_paid`, `total_loss_weight`, `is_weight_loss_approved`, `weight_loss_approved_by`, `weight_loss_approved_at`, `weight_loss_amount`, `invoice_id`, `created_at`, `updated_at`) VALUES
(2, '2026-08-11', 'Open', 58, 2224.20, 671.20, 1553.00, 0.00, 1553.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, 0.00, NULL, '2026-08-12 05:08:05', '2026-08-12 05:24:51'),
(3, '2026-08-10', 'Open', 83, 3262.10, 956.90, 2305.20, 2341.90, 2305.20, 0.00, 0.00, 0.00, 0.00, 36.70, 1, NULL, NULL, 3780.10, NULL, '2026-08-19 09:57:53', '2026-08-19 09:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `day_load_entries`
--

CREATE TABLE `day_load_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `dealer_id` bigint(20) UNSIGNED NOT NULL,
  `weekly_bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `daily_bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paper_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `billing_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `customer_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `no_of_boxes` int(11) NOT NULL,
  `box_weight` decimal(10,2) NOT NULL,
  `empty_weight` decimal(10,2) NOT NULL,
  `bird_weight` decimal(10,2) NOT NULL,
  `farm_weight` decimal(10,2) DEFAULT NULL,
  `total_weight` decimal(10,2) DEFAULT NULL,
  `loss_weight` decimal(10,2) DEFAULT NULL,
  `status` enum('Active','Adjusted','Split','Cancelled') NOT NULL DEFAULT 'Active',
  `parent_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `remarks` varchar(255) DEFAULT NULL,
  `dealer_collected` decimal(12,2) NOT NULL DEFAULT 0.00,
  `vendor_paid` decimal(12,2) NOT NULL DEFAULT 0.00,
  `dealer_payment_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `vendor_payment_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `day_load_entries`
--

INSERT INTO `day_load_entries` (`id`, `batch_id`, `vendor_id`, `dealer_id`, `weekly_bill_id`, `daily_bill_id`, `paper_rate`, `billing_rate`, `customer_rate`, `amount`, `no_of_boxes`, `box_weight`, `empty_weight`, `bird_weight`, `farm_weight`, `total_weight`, `loss_weight`, `status`, `parent_entry_id`, `version`, `remarks`, `dealer_collected`, `vendor_paid`, `dealer_payment_status`, `vendor_payment_status`, `created_at`, `updated_at`) VALUES
(19, 2, 7, 1, NULL, NULL, 114.00, 0.00, 111.00, 3185.70, 1, 40.10, 11.40, 28.70, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:08:05', '2026-08-12 05:08:05'),
(20, 2, 7, 31, NULL, NULL, 114.00, 0.00, 109.00, 18813.40, 7, 252.90, 80.30, 172.60, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:09:01', '2026-08-18 15:36:51'),
(21, 2, 7, 4, NULL, NULL, 114.00, 0.00, 111.00, 2952.60, 1, 38.00, 11.40, 26.60, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:10:39', '2026-08-12 05:10:39'),
(22, 2, 7, 7, NULL, NULL, 114.00, 0.00, 109.00, 5929.60, 2, 78.00, 23.60, 54.40, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:12:12', '2026-08-12 05:12:12'),
(23, 2, 7, 30, NULL, NULL, 114.00, 0.00, 114.00, 3340.20, 1, 40.70, 11.40, 29.30, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:15:50', '2026-08-12 05:15:50'),
(24, 2, 7, 9, NULL, NULL, 114.00, 0.00, 111.00, 2963.70, 1, 38.10, 11.40, 26.70, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:16:45', '2026-08-12 05:17:47'),
(25, 2, 7, 11, NULL, NULL, 114.00, 0.00, 112.00, 8881.60, 3, 113.40, 34.10, 79.30, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:17:17', '2026-08-12 05:17:17'),
(26, 2, 7, 20, NULL, NULL, 114.00, 0.00, 109.00, 71634.80, 24, 938.00, 280.80, 657.20, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:18:34', '2026-08-12 05:18:34'),
(27, 2, 7, 2, NULL, NULL, 114.00, 0.00, 114.00, 5893.80, 2, 74.40, 22.70, 51.70, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:19:21', '2026-08-12 05:19:21'),
(28, 2, 7, 10, NULL, NULL, 114.00, 0.00, 111.00, 5760.90, 2, 74.60, 22.70, 51.90, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:20:01', '2026-08-12 05:20:01'),
(29, 2, 7, 12, NULL, NULL, 114.00, 0.00, 109.00, 11793.80, 4, 154.10, 45.90, 108.20, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:21:14', '2026-08-12 05:21:14'),
(30, 2, 7, 17, NULL, NULL, 114.00, 0.00, 111.00, 17449.20, 6, 226.30, 69.10, 157.20, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:22:24', '2026-08-12 05:22:24'),
(31, 2, 7, 13, NULL, NULL, 114.00, 0.00, 112.00, 3057.60, 1, 38.80, 11.50, 27.30, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:22:56', '2026-08-12 05:22:56'),
(32, 2, 7, 16, NULL, NULL, 114.00, 0.00, 114.00, 5677.20, 2, 73.40, 23.60, 49.80, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:23:49', '2026-08-12 05:23:49'),
(33, 2, 7, 19, NULL, NULL, 114.00, 0.00, 114.00, 3659.40, 1, 43.40, 11.30, 32.10, NULL, NULL, NULL, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-12 05:24:51', '2026-08-12 05:24:51'),
(35, 3, 3, 4, NULL, NULL, 139.00, 103.00, 136.00, 22834.40, 6, 236.00, 68.10, 167.90, 170.57, 167.90, 2.67, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(36, 3, 3, 6, NULL, NULL, 139.00, 103.00, 136.00, 3672.00, 1, 38.40, 11.40, 27.00, 27.43, 27.00, 0.43, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(37, 3, 3, 12, NULL, NULL, 139.00, 103.00, 136.00, 77152.80, 20, 796.50, 229.20, 567.30, 576.33, 567.30, 9.03, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(38, 3, 3, 30, NULL, NULL, 139.00, 103.00, 136.00, 7588.80, 2, 78.60, 22.80, 55.80, 56.69, 55.80, 0.89, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(39, 3, 3, 19, NULL, NULL, 139.00, 103.00, 136.00, 3604.00, 1, 38.30, 11.80, 26.50, 26.92, 26.50, 0.42, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(40, 3, 3, 9, NULL, NULL, 139.00, 103.00, 136.00, 3699.20, 1, 38.60, 11.40, 27.20, 27.63, 27.20, 0.43, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(41, 3, 3, 16, NULL, NULL, 139.00, 103.00, 136.00, 7153.60, 2, 76.20, 23.60, 52.60, 53.44, 52.60, 0.84, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(42, 3, 3, 31, NULL, NULL, 139.00, 103.00, 136.00, 23337.60, 6, 240.50, 68.90, 171.60, 174.33, 171.60, 2.73, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(43, 3, 3, 10, NULL, NULL, 139.00, 103.00, 136.00, 7915.20, 2, 80.90, 22.70, 58.20, 59.13, 58.20, 0.93, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(44, 3, 3, 21, NULL, NULL, 139.00, 103.00, 136.00, 3576.80, 1, 37.70, 11.40, 26.30, 26.72, 26.30, 0.42, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(45, 3, 3, 8, NULL, NULL, 139.00, 103.00, 136.00, 18713.60, 5, 195.00, 57.40, 137.60, 139.79, 137.60, 2.19, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(46, 3, 3, 1, NULL, NULL, 139.00, 103.00, 136.00, 3617.60, 1, 38.00, 11.40, 26.60, 27.02, 26.60, 0.42, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(47, 3, 3, 17, NULL, NULL, 139.00, 103.00, 136.00, 26057.60, 7, 272.70, 81.10, 191.60, 194.65, 191.60, 3.05, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(48, 3, 3, 18, NULL, NULL, 139.00, 103.00, 136.00, 3712.80, 1, 38.40, 11.10, 27.30, 27.73, 27.30, 0.43, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(49, 3, 3, 20, NULL, NULL, 139.00, 103.00, 136.00, 82334.40, 22, 862.80, 257.40, 605.40, 615.05, 605.40, 9.65, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(50, 3, 3, 7, NULL, NULL, 139.00, 103.00, 136.00, 11179.20, 3, 116.80, 34.60, 82.20, 83.51, 82.20, 1.31, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(51, 3, 3, 13, NULL, NULL, 139.00, 103.00, 136.00, 3794.40, 1, 39.10, 11.20, 27.90, 28.34, 27.90, 0.44, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53'),
(52, 3, 3, 29, NULL, NULL, 139.00, 103.00, 136.00, 3563.20, 1, 37.60, 11.40, 26.20, 26.62, 26.20, 0.42, 'Active', NULL, 1, NULL, 0.00, 0.00, 'Pending', 'Pending', '2026-08-19 09:57:53', '2026-08-19 09:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `day_load_invoices`
--

CREATE TABLE `day_load_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `total_boxes` int(11) NOT NULL DEFAULT 0,
  `total_box_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_empty_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_bird_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_farm_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_loss_weight` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(12,2) NOT NULL DEFAULT 0.00,
  `balance_due` decimal(12,2) GENERATED ALWAYS AS (`total_amount` - `amount_paid`) STORED,
  `payment_status` enum('Pending','Partial','Paid') NOT NULL DEFAULT 'Pending',
  `status` enum('Draft','Final') NOT NULL DEFAULT 'Draft',
  `version` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firm_name` varchar(255) NOT NULL,
  `gst_number` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `route_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pending_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `firm_name`, `gst_number`, `location`, `contact_person`, `phone`, `route`, `route_id`, `pending_amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mathina chicken', NULL, 'panruti', '9944011145', '9944401145', 'panruti', NULL, 26873.00, '2026-07-18 06:49:05', '2026-08-10 08:45:28', NULL),
(2, 'kaithan chicken', NULL, 'karayambuthur', '9944011145', '9944011141', 'panruti', NULL, 101972.00, '2026-07-18 06:52:16', '2026-08-10 08:42:31', NULL),
(3, 'NSK sakathi', NULL, 'panruti', '9944011145', '9944011142', 'panruti', NULL, 157600.00, '2026-07-18 06:55:24', '2026-08-10 08:49:03', NULL),
(4, 'basheer chicken', NULL, 'pattampakkam', '9944011145', '9944011143', 'pattampakkam', NULL, 475907.00, '2026-07-18 06:57:04', '2026-08-10 06:38:01', NULL),
(5, 'kalima  chicken', NULL, 'pattampakkam', '9944011145', '9944011144', 'pattampakkam', NULL, 770.00, '2026-07-18 07:00:04', '2026-08-18 15:19:24', '2026-08-18 15:19:24'),
(6, 'boys chicken', NULL, 'pattampakkam', '9944011145', '9944011145', 'pattampakkam', NULL, 749049.00, '2026-07-18 07:02:13', '2026-08-10 06:38:35', NULL),
(7, 'R R chicken', NULL, 'pattampakkam', '9944011145', '9944011146', 'pattampakkam', NULL, 140319.00, '2026-07-18 07:03:24', '2026-08-10 08:50:35', NULL),
(8, 'M N chicken', NULL, 'pattampakkam', 'owner', '9944011147', 'pattampakkam', NULL, 112793.00, '2026-07-18 07:05:05', '2026-08-10 08:45:00', NULL),
(9, 'haji chicken', NULL, 'nellikuppam', 'haji (owner)', '9843978188', 'nellikuppam', NULL, 331740.00, '2026-07-18 07:06:49', '2026-08-10 08:41:14', NULL),
(10, 'kuthus chicken', NULL, 'nellikuppam', 'kuthus (owner)', '9944011148', 'nellikuppam', NULL, 252400.00, '2026-07-18 07:07:50', '2026-08-10 08:44:21', NULL),
(11, 'ghouse chicken', NULL, 'nellikuppam', 'ghouse (owner)', '9944011149', 'nellikuppam', NULL, 1481477.00, '2026-07-18 07:09:16', '2026-08-10 08:40:47', NULL),
(12, 'durai broilers kpm', NULL, 'nellikuppam', 'durai kpm(owner)', '9944011100', 'nellikuppam', NULL, 590231.00, '2026-07-18 07:10:57', '2026-08-10 06:40:23', NULL),
(13, 'sun chicken', NULL, 'vellagate', 'sathish', '9944011101', 'nellikuppam', NULL, 973283.00, '2026-07-18 07:13:12', '2026-08-10 08:54:51', NULL),
(14, 'kavin chicken', NULL, 'vellagate', 'kavin', '9944401110', 'nellikuppam', NULL, 347820.00, '2026-07-18 07:14:09', '2026-08-10 08:43:49', NULL),
(15, 'zyan chicken', NULL, 'kondru', 'ajmal (owner)', '7010441328', 'kondur', NULL, 621420.00, '2026-07-18 07:15:54', '2026-08-10 08:55:31', NULL),
(16, 'hotel harun', NULL, 'cuddalore', 'naina', '9944401113', 'cuddalore', NULL, 1085062.00, '2026-07-18 07:19:15', '2026-08-10 08:41:54', NULL),
(17, 'MSR CUDDALORE', NULL, 'cuddalore', 'NASAR', '9384920211', 'cuddalore', NULL, 549000.00, '2026-07-18 07:21:10', '2026-08-12 04:11:02', NULL),
(18, 'MSR NOOR', NULL, 'cuddalore', 'NASAR', '9944401119', 'cuddalore', NULL, 34756.00, '2026-07-18 07:22:00', '2026-08-10 08:47:26', NULL),
(19, 'FAKUR CHICKEN', NULL, 'cuddalore', 'FAKUR', '9944401112', 'cuddalore', NULL, 96385.00, '2026-07-18 07:22:52', '2026-08-10 06:37:11', NULL),
(20, 'MSR OWN SHOP', NULL, 'nellikuppam', 'HASSAN ALI', '9944401140', 'nellikuppam', NULL, 0.00, '2026-07-18 07:23:52', '2026-08-12 04:14:47', NULL),
(21, 'LAKSHMI CHICKEN', NULL, 'pattampakkam', 'LAKKSHMI', '9444011177', 'pattampakkam', NULL, 27423.00, '2026-07-18 07:24:42', '2026-08-12 04:09:24', NULL),
(22, 'SRK', NULL, 'panruti', 'SRK', '9944011190', 'panruti', NULL, 14600.00, '2026-07-18 07:25:28', '2026-08-10 08:53:33', NULL),
(23, 'SARAVAN', NULL, 'nellikuppam', 'ILLAGO', '9944411167', 'NELLIKUPPAM', NULL, 35700.00, '2026-07-18 07:26:26', '2026-08-10 08:51:17', NULL),
(24, 'MSR VPM', NULL, 'VPM', 'MSR', '9444011154', 'VPM', NULL, 10500.00, '2026-07-18 07:27:06', '2026-08-10 08:48:32', NULL),
(25, 'aluva chicken', NULL, 'cuddalore', 'aludeen', '6383952296', 'cuddalore', NULL, 22700.00, '2026-07-22 03:06:07', '2026-08-10 06:35:59', NULL),
(27, 'new kalima', NULL, 'pondy', 'kalima', '9345342112', 'pondy', NULL, 28165.00, '2026-08-10 08:57:29', '2026-08-12 04:33:18', NULL),
(28, 'A2A', NULL, 'cuddalore', 'jaffer bai', '9345774212', 'cuddalore', NULL, 15500.00, '2026-08-10 08:58:36', '2026-08-10 08:58:36', NULL),
(29, 'thiruvathi', NULL, 'panruti', 'thiru', '9345772821', 'panruti', NULL, 39780.00, '2026-08-12 04:31:06', '2026-08-12 04:31:06', NULL),
(30, 'fajan', NULL, 'nellikuppam', 'fajan', '9940111777', 'nellikuppam', NULL, 45519.00, '2026-08-12 04:44:49', '2026-08-12 04:44:49', NULL),
(31, 'kalima chicken', NULL, 'mpm', 'azar', '9345773421', 'mpm', NULL, 110.00, '2026-08-18 15:20:34', '2026-08-19 06:18:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dealer_payments`
--

CREATE TABLE `dealer_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dealer_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `day_load_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_group_id` varchar(36) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cash_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bank_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(12,2) GENERATED ALWAYS AS (`cash_amount` + `bank_amount`) STORED,
  `pending_balance_after` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(50) NOT NULL DEFAULT 'Cash',
  `bank_transfer_type` enum('UPI','Bank Transfer','NEFT','RTGS','IMPS','Cheque','Other') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealer_payments`
--

INSERT INTO `dealer_payments` (`id`, `dealer_id`, `invoice_id`, `day_load_entry_id`, `payment_group_id`, `date`, `amount`, `discount_amount`, `cash_amount`, `bank_amount`, `pending_balance_after`, `payment_mode`, `bank_transfer_type`, `notes`, `reference_number`, `created_at`, `updated_at`) VALUES
(1, 20, NULL, NULL, 'bc21c1a3-3ff6-4f34-961f-243b240f46c3', '2026-08-10', 295300.00, 0.00, 155000.00, 140300.00, 0.00, 'UPI', 'UPI', 'Allocated to base pending balance', NULL, '2026-08-12 04:14:47', '2026-08-12 04:14:47');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_purchases`
--

CREATE TABLE `dealer_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dealer_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `gst_percentage` decimal(5,2) NOT NULL DEFAULT 18.00,
  `gst_amount` decimal(12,2) NOT NULL,
  `net_amount` decimal(12,2) NOT NULL,
  `weekly_bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_purchase_items`
--

CREATE TABLE `dealer_purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dealer_purchase_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity_kg` decimal(10,2) NOT NULL,
  `rate_per_kg` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emis`
--

CREATE TABLE `emis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emi_type` varchar(255) NOT NULL DEFAULT 'Bank Loan',
  `entity_id` bigint(20) UNSIGNED DEFAULT NULL,
  `loan_name` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(12,2) DEFAULT 0.00,
  `due_date` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Upcoming',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emis`
--

INSERT INTO `emis` (`id`, `emi_type`, `entity_id`, `loan_name`, `bank_name`, `amount`, `paid_amount`, `due_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bank Loan', NULL, 'JANA BANK DUE', NULL, 149550.00, 0.00, '2026-09-04', 'Upcoming', '2026-08-12 04:21:11', '2026-08-12 04:21:11'),
(2, 'Bank Loan', NULL, 'VECHILE LOAN FOR MAHIDRA', NULL, 48291.00, 0.00, '2026-08-15', 'Upcoming', '2026-08-12 04:24:17', '2026-08-12 04:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `entry_adjustment_logs`
--

CREATE TABLE `entry_adjustment_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entry_id` bigint(20) UNSIGNED NOT NULL,
  `action_type` enum('Create','Edit','Split','Cancel') NOT NULL,
  `old_values` longtext DEFAULT NULL,
  `new_values` longtext DEFAULT NULL,
  `resulting_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `adjusted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entry_adjustment_logs`
--

INSERT INTO `entry_adjustment_logs` (`id`, `entry_id`, `action_type`, `old_values`, `new_values`, `resulting_entry_id`, `reason`, `adjusted_by`, `created_at`) VALUES
(19, 19, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"1\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"111.00\",\"no_of_boxes\":1,\"box_weight\":\"40.10\",\"empty_weight\":\"11.40\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"28.70\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"3185.70\",\"updated_at\":\"2026-08-12T05:08:05.000000Z\",\"created_at\":\"2026-08-12T05:08:05.000000Z\",\"id\":19}', NULL, 'Entry created', 1, '2026-08-12 05:08:05'),
(20, 20, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"5\",\"paper_rate\":\"139.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"135.00\",\"no_of_boxes\":7,\"box_weight\":\"252.90\",\"empty_weight\":\"80.30\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"172.60\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"23301.00\",\"updated_at\":\"2026-08-12T05:09:01.000000Z\",\"created_at\":\"2026-08-12T05:09:01.000000Z\",\"id\":20}', NULL, 'Entry created', 1, '2026-08-12 05:09:01'),
(21, 20, 'Edit', '{\"id\":20,\"batch_id\":2,\"vendor_id\":7,\"dealer_id\":5,\"weekly_bill_id\":null,\"daily_bill_id\":null,\"paper_rate\":\"139.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"135.00\",\"amount\":\"23301.00\",\"no_of_boxes\":7,\"box_weight\":\"252.90\",\"empty_weight\":\"80.30\",\"bird_weight\":\"172.60\",\"farm_weight\":null,\"total_weight\":null,\"loss_weight\":null,\"status\":\"Active\",\"parent_entry_id\":null,\"version\":1,\"remarks\":null,\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"created_at\":\"2026-08-12T05:09:01.000000Z\",\"updated_at\":\"2026-08-12T05:09:01.000000Z\",\"batch\":{\"id\":2,\"billing_date\":\"2026-08-10T18:30:00.000000Z\",\"status\":\"Open\",\"total_boxes\":\"8.00\",\"total_box_weight\":\"293.00\",\"total_empty_weight\":\"91.70\",\"total_bird_weight\":\"201.30\",\"total_farm_weight\":\"0.00\",\"total_weight\":\"201.30\",\"total_dealer_income\":\"0.00\",\"total_vendor_cost\":\"0.00\",\"total_dealer_collected\":\"0.00\",\"total_vendor_paid\":\"0.00\",\"total_loss_weight\":\"0.00\",\"is_weight_loss_approved\":false,\"weight_loss_approved_by\":null,\"weight_loss_approved_at\":null,\"weight_loss_amount\":\"0.00\",\"invoice_id\":null,\"created_at\":\"2026-08-12T05:08:05.000000Z\",\"updated_at\":\"2026-08-12T05:09:01.000000Z\"}}', '{\"id\":20,\"batch_id\":2,\"vendor_id\":7,\"dealer_id\":5,\"weekly_bill_id\":null,\"daily_bill_id\":null,\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"109.00\",\"amount\":\"18813.40\",\"no_of_boxes\":7,\"box_weight\":\"252.90\",\"empty_weight\":\"80.30\",\"bird_weight\":\"172.60\",\"farm_weight\":null,\"total_weight\":null,\"loss_weight\":null,\"status\":\"Active\",\"parent_entry_id\":null,\"version\":1,\"remarks\":null,\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"created_at\":\"2026-08-12T05:09:01.000000Z\",\"updated_at\":\"2026-08-12T05:09:57.000000Z\"}', NULL, 'no', 1, '2026-08-12 05:09:57'),
(22, 21, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"4\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"111.00\",\"no_of_boxes\":1,\"box_weight\":\"38.00\",\"empty_weight\":\"11.40\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"26.60\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"2952.60\",\"updated_at\":\"2026-08-12T05:10:39.000000Z\",\"created_at\":\"2026-08-12T05:10:39.000000Z\",\"id\":21}', NULL, 'Entry created', 1, '2026-08-12 05:10:39'),
(23, 22, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"7\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"109.00\",\"no_of_boxes\":2,\"box_weight\":\"78.00\",\"empty_weight\":\"23.60\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"54.40\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"5929.60\",\"updated_at\":\"2026-08-12T05:12:12.000000Z\",\"created_at\":\"2026-08-12T05:12:12.000000Z\",\"id\":22}', NULL, 'Entry created', 1, '2026-08-12 05:12:12'),
(24, 23, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"30\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"114.00\",\"no_of_boxes\":1,\"box_weight\":\"40.70\",\"empty_weight\":\"11.40\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"29.30\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"3340.20\",\"updated_at\":\"2026-08-12T05:15:50.000000Z\",\"created_at\":\"2026-08-12T05:15:50.000000Z\",\"id\":23}', NULL, 'Entry created', 1, '2026-08-12 05:15:50'),
(25, 24, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"9\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"114.00\",\"no_of_boxes\":1,\"box_weight\":\"38.10\",\"empty_weight\":\"11.40\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"26.70\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"3043.80\",\"updated_at\":\"2026-08-12T05:16:45.000000Z\",\"created_at\":\"2026-08-12T05:16:45.000000Z\",\"id\":24}', NULL, 'Entry created', 1, '2026-08-12 05:16:45'),
(26, 25, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"11\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"112.00\",\"no_of_boxes\":3,\"box_weight\":\"113.40\",\"empty_weight\":\"34.10\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"79.30\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"8881.60\",\"updated_at\":\"2026-08-12T05:17:17.000000Z\",\"created_at\":\"2026-08-12T05:17:17.000000Z\",\"id\":25}', NULL, 'Entry created', 1, '2026-08-12 05:17:17'),
(27, 24, 'Edit', '{\"id\":24,\"batch_id\":2,\"vendor_id\":7,\"dealer_id\":9,\"weekly_bill_id\":null,\"daily_bill_id\":null,\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"114.00\",\"amount\":\"3043.80\",\"no_of_boxes\":1,\"box_weight\":\"38.10\",\"empty_weight\":\"11.40\",\"bird_weight\":\"26.70\",\"farm_weight\":null,\"total_weight\":null,\"loss_weight\":null,\"status\":\"Active\",\"parent_entry_id\":null,\"version\":1,\"remarks\":null,\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"created_at\":\"2026-08-12T05:16:45.000000Z\",\"updated_at\":\"2026-08-12T05:16:45.000000Z\",\"batch\":{\"id\":2,\"billing_date\":\"2026-08-10T18:30:00.000000Z\",\"status\":\"Open\",\"total_boxes\":\"16.00\",\"total_box_weight\":\"601.20\",\"total_empty_weight\":\"183.60\",\"total_bird_weight\":\"417.60\",\"total_farm_weight\":\"0.00\",\"total_weight\":\"417.60\",\"total_dealer_income\":\"0.00\",\"total_vendor_cost\":\"0.00\",\"total_dealer_collected\":\"0.00\",\"total_vendor_paid\":\"0.00\",\"total_loss_weight\":\"0.00\",\"is_weight_loss_approved\":false,\"weight_loss_approved_by\":null,\"weight_loss_approved_at\":null,\"weight_loss_amount\":\"0.00\",\"invoice_id\":null,\"created_at\":\"2026-08-12T05:08:05.000000Z\",\"updated_at\":\"2026-08-12T05:17:17.000000Z\"}}', '{\"id\":24,\"batch_id\":2,\"vendor_id\":7,\"dealer_id\":9,\"weekly_bill_id\":null,\"daily_bill_id\":null,\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"111.00\",\"amount\":\"2963.70\",\"no_of_boxes\":1,\"box_weight\":\"38.10\",\"empty_weight\":\"11.40\",\"bird_weight\":\"26.70\",\"farm_weight\":null,\"total_weight\":null,\"loss_weight\":null,\"status\":\"Active\",\"parent_entry_id\":null,\"version\":1,\"remarks\":null,\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"created_at\":\"2026-08-12T05:16:45.000000Z\",\"updated_at\":\"2026-08-12T05:17:47.000000Z\"}', NULL, 'no', 1, '2026-08-12 05:17:47'),
(28, 26, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"20\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"109.00\",\"no_of_boxes\":24,\"box_weight\":\"938.00\",\"empty_weight\":\"280.80\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"657.20\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"71634.80\",\"updated_at\":\"2026-08-12T05:18:34.000000Z\",\"created_at\":\"2026-08-12T05:18:34.000000Z\",\"id\":26}', NULL, 'Entry created', 1, '2026-08-12 05:18:34'),
(29, 27, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"2\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"114.00\",\"no_of_boxes\":2,\"box_weight\":\"74.40\",\"empty_weight\":\"22.70\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"51.70\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"5893.80\",\"updated_at\":\"2026-08-12T05:19:21.000000Z\",\"created_at\":\"2026-08-12T05:19:21.000000Z\",\"id\":27}', NULL, 'Entry created', 1, '2026-08-12 05:19:21'),
(30, 28, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"10\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"111.00\",\"no_of_boxes\":2,\"box_weight\":\"74.60\",\"empty_weight\":\"22.70\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"51.90\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"5760.90\",\"updated_at\":\"2026-08-12T05:20:01.000000Z\",\"created_at\":\"2026-08-12T05:20:01.000000Z\",\"id\":28}', NULL, 'Entry created', 1, '2026-08-12 05:20:01'),
(31, 29, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"12\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"109.00\",\"no_of_boxes\":4,\"box_weight\":\"154.10\",\"empty_weight\":\"45.90\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"108.20\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"11793.80\",\"updated_at\":\"2026-08-12T05:21:14.000000Z\",\"created_at\":\"2026-08-12T05:21:14.000000Z\",\"id\":29}', NULL, 'Entry created', 1, '2026-08-12 05:21:14'),
(32, 30, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"17\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"111.00\",\"no_of_boxes\":6,\"box_weight\":\"226.30\",\"empty_weight\":\"69.10\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"157.20\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"17449.20\",\"updated_at\":\"2026-08-12T05:22:24.000000Z\",\"created_at\":\"2026-08-12T05:22:24.000000Z\",\"id\":30}', NULL, 'Entry created', 1, '2026-08-12 05:22:24'),
(33, 31, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"13\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"112.00\",\"no_of_boxes\":1,\"box_weight\":\"38.80\",\"empty_weight\":\"11.50\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"27.30\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"3057.60\",\"updated_at\":\"2026-08-12T05:22:56.000000Z\",\"created_at\":\"2026-08-12T05:22:56.000000Z\",\"id\":31}', NULL, 'Entry created', 1, '2026-08-12 05:22:56'),
(34, 32, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"16\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"114.00\",\"no_of_boxes\":2,\"box_weight\":\"73.40\",\"empty_weight\":\"23.60\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"49.80\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"5677.20\",\"updated_at\":\"2026-08-12T05:23:49.000000Z\",\"created_at\":\"2026-08-12T05:23:49.000000Z\",\"id\":32}', NULL, 'Entry created', 1, '2026-08-12 05:23:49'),
(35, 33, 'Create', NULL, '{\"batch_id\":2,\"vendor_id\":\"7\",\"dealer_id\":\"19\",\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"114.00\",\"no_of_boxes\":1,\"box_weight\":\"43.40\",\"empty_weight\":\"11.30\",\"farm_weight\":null,\"remarks\":null,\"bird_weight\":\"32.10\",\"loss_weight\":null,\"total_weight\":null,\"amount\":\"3659.40\",\"updated_at\":\"2026-08-12T05:24:51.000000Z\",\"created_at\":\"2026-08-12T05:24:51.000000Z\",\"id\":33}', NULL, 'Entry created', 1, '2026-08-12 05:24:51'),
(37, 20, 'Edit', '{\"id\":20,\"batch_id\":2,\"vendor_id\":7,\"dealer_id\":5,\"weekly_bill_id\":null,\"daily_bill_id\":null,\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"109.00\",\"amount\":\"18813.40\",\"no_of_boxes\":7,\"box_weight\":\"252.90\",\"empty_weight\":\"80.30\",\"bird_weight\":\"172.60\",\"farm_weight\":null,\"total_weight\":null,\"loss_weight\":null,\"status\":\"Active\",\"parent_entry_id\":null,\"version\":1,\"remarks\":null,\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"created_at\":\"2026-08-12T05:09:01.000000Z\",\"updated_at\":\"2026-08-12T05:09:57.000000Z\",\"batch\":{\"id\":2,\"billing_date\":\"2026-08-10T18:30:00.000000Z\",\"status\":\"Open\",\"total_boxes\":\"58.00\",\"total_box_weight\":\"2224.20\",\"total_empty_weight\":\"671.20\",\"total_bird_weight\":\"1553.00\",\"total_farm_weight\":\"0.00\",\"total_weight\":\"1553.00\",\"total_dealer_income\":\"0.00\",\"total_vendor_cost\":\"0.00\",\"total_dealer_collected\":\"0.00\",\"total_vendor_paid\":\"0.00\",\"total_loss_weight\":\"0.00\",\"is_weight_loss_approved\":false,\"weight_loss_approved_by\":null,\"weight_loss_approved_at\":null,\"weight_loss_amount\":\"0.00\",\"invoice_id\":null,\"created_at\":\"2026-08-12T05:08:05.000000Z\",\"updated_at\":\"2026-08-12T05:24:51.000000Z\"}}', '{\"id\":20,\"batch_id\":2,\"vendor_id\":7,\"dealer_id\":31,\"weekly_bill_id\":null,\"daily_bill_id\":null,\"paper_rate\":\"114.00\",\"billing_rate\":\"0.00\",\"customer_rate\":\"109.00\",\"amount\":\"18813.40\",\"no_of_boxes\":7,\"box_weight\":\"252.90\",\"empty_weight\":\"80.30\",\"bird_weight\":\"172.60\",\"farm_weight\":null,\"total_weight\":null,\"loss_weight\":null,\"status\":\"Active\",\"parent_entry_id\":null,\"version\":1,\"remarks\":null,\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"created_at\":\"2026-08-12T05:09:01.000000Z\",\"updated_at\":\"2026-08-18T15:36:51.000000Z\"}', NULL, 'no', 1, '2026-08-18 15:36:51'),
(111, 35, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":4,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"22834.40\",\"no_of_boxes\":6,\"box_weight\":\"236.00\",\"empty_weight\":\"68.10\",\"farm_weight\":\"170.57\",\"total_weight\":\"167.90\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"167.90\",\"loss_weight\":\"2.67\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":35}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(112, 36, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":6,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3672.00\",\"no_of_boxes\":1,\"box_weight\":\"38.40\",\"empty_weight\":\"11.40\",\"farm_weight\":\"27.43\",\"total_weight\":\"27.00\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"27.00\",\"loss_weight\":\"0.43\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":36}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(113, 37, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":12,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"77152.80\",\"no_of_boxes\":20,\"box_weight\":\"796.50\",\"empty_weight\":\"229.20\",\"farm_weight\":\"576.33\",\"total_weight\":\"567.30\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"567.30\",\"loss_weight\":\"9.03\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":37}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(114, 38, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":30,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"7588.80\",\"no_of_boxes\":2,\"box_weight\":\"78.60\",\"empty_weight\":\"22.80\",\"farm_weight\":\"56.69\",\"total_weight\":\"55.80\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"55.80\",\"loss_weight\":\"0.89\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":38}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(115, 39, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":19,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3604.00\",\"no_of_boxes\":1,\"box_weight\":\"38.30\",\"empty_weight\":\"11.80\",\"farm_weight\":\"26.92\",\"total_weight\":\"26.50\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"26.50\",\"loss_weight\":\"0.42\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":39}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(116, 40, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":9,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3699.20\",\"no_of_boxes\":1,\"box_weight\":\"38.60\",\"empty_weight\":\"11.40\",\"farm_weight\":\"27.63\",\"total_weight\":\"27.20\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"27.20\",\"loss_weight\":\"0.43\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":40}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(117, 41, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":16,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"7153.60\",\"no_of_boxes\":2,\"box_weight\":\"76.20\",\"empty_weight\":\"23.60\",\"farm_weight\":\"53.44\",\"total_weight\":\"52.60\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"52.60\",\"loss_weight\":\"0.84\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":41}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(118, 42, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":31,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"23337.60\",\"no_of_boxes\":6,\"box_weight\":\"240.50\",\"empty_weight\":\"68.90\",\"farm_weight\":\"174.33\",\"total_weight\":\"171.60\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"171.60\",\"loss_weight\":\"2.73\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":42}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(119, 43, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":10,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"7915.20\",\"no_of_boxes\":2,\"box_weight\":\"80.90\",\"empty_weight\":\"22.70\",\"farm_weight\":\"59.13\",\"total_weight\":\"58.20\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"58.20\",\"loss_weight\":\"0.93\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":43}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(120, 44, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":21,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3576.80\",\"no_of_boxes\":1,\"box_weight\":\"37.70\",\"empty_weight\":\"11.40\",\"farm_weight\":\"26.72\",\"total_weight\":\"26.30\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"26.30\",\"loss_weight\":\"0.42\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":44}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(121, 45, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":8,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"18713.60\",\"no_of_boxes\":5,\"box_weight\":\"195.00\",\"empty_weight\":\"57.40\",\"farm_weight\":\"139.79\",\"total_weight\":\"137.60\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"137.60\",\"loss_weight\":\"2.19\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":45}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(122, 46, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":1,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3617.60\",\"no_of_boxes\":1,\"box_weight\":\"38.00\",\"empty_weight\":\"11.40\",\"farm_weight\":\"27.02\",\"total_weight\":\"26.60\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"26.60\",\"loss_weight\":\"0.42\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":46}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(123, 47, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":17,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"26057.60\",\"no_of_boxes\":7,\"box_weight\":\"272.70\",\"empty_weight\":\"81.10\",\"farm_weight\":\"194.65\",\"total_weight\":\"191.60\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"191.60\",\"loss_weight\":\"3.05\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":47}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(124, 48, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":18,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3712.80\",\"no_of_boxes\":1,\"box_weight\":\"38.40\",\"empty_weight\":\"11.10\",\"farm_weight\":\"27.73\",\"total_weight\":\"27.30\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"27.30\",\"loss_weight\":\"0.43\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":48}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(125, 49, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":20,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"82334.40\",\"no_of_boxes\":22,\"box_weight\":\"862.80\",\"empty_weight\":\"257.40\",\"farm_weight\":\"615.05\",\"total_weight\":\"605.40\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"605.40\",\"loss_weight\":\"9.65\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":49}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(126, 50, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":7,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"11179.20\",\"no_of_boxes\":3,\"box_weight\":\"116.80\",\"empty_weight\":\"34.60\",\"farm_weight\":\"83.51\",\"total_weight\":\"82.20\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"82.20\",\"loss_weight\":\"1.31\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":50}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(127, 51, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":13,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3794.40\",\"no_of_boxes\":1,\"box_weight\":\"39.10\",\"empty_weight\":\"11.20\",\"farm_weight\":\"28.34\",\"total_weight\":\"27.90\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"27.90\",\"loss_weight\":\"0.44\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":51}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53'),
(128, 52, 'Create', NULL, '{\"batch_id\":3,\"vendor_id\":3,\"dealer_id\":29,\"paper_rate\":\"139.00\",\"billing_rate\":\"103.00\",\"customer_rate\":\"136.00\",\"amount\":\"3563.20\",\"no_of_boxes\":1,\"box_weight\":\"37.60\",\"empty_weight\":\"11.40\",\"farm_weight\":\"26.62\",\"total_weight\":\"26.20\",\"status\":\"Active\",\"dealer_collected\":\"0.00\",\"vendor_paid\":\"0.00\",\"dealer_payment_status\":\"Pending\",\"vendor_payment_status\":\"Pending\",\"version\":1,\"bird_weight\":\"26.20\",\"loss_weight\":\"0.42\",\"updated_at\":\"2026-08-19T09:57:53.000000Z\",\"created_at\":\"2026-08-19T09:57:53.000000Z\",\"id\":52}', NULL, 'Initial Day-Load Seed for 10.08.2026', 1, '2026-08-19 09:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `category` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Bank Transfer') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '#6B7280',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Fuel', '#94fc56', '2026-07-07 07:33:35', '2026-07-07 07:33:35'),
(2, 'Salary', '#b083a4', '2026-07-07 07:33:35', '2026-07-07 07:33:35'),
(3, 'Transport', '#f5f0c4', '2026-07-07 07:33:35', '2026-07-07 07:33:35'),
(4, 'Utility', '#94df2a', '2026-07-07 07:33:35', '2026-07-07 07:33:35'),
(5, 'Misc', '#74248c', '2026-07-07 07:33:35', '2026-07-07 07:33:35'),
(6, 'Rent', '#7f4118', '2026-07-07 07:36:13', '2026-07-07 07:36:13'),
(7, 'Electricity', '#656e43', '2026-07-07 07:36:13', '2026-07-07 07:36:13'),
(8, 'Labour', '#f98a29', '2026-07-07 07:36:13', '2026-07-07 07:36:13'),
(9, 'Feed', '#a80425', '2026-07-07 07:36:13', '2026-07-07 07:36:13'),
(10, 'Medicine', '#4ff278', '2026-07-07 07:36:13', '2026-07-07 07:36:13');

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
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` enum('Feed','Chick','Medicine','Vaccine','Equipment','Other') NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `base_unit` varchar(255) NOT NULL DEFAULT 'kg',
  `conversion_rate` decimal(10,2) NOT NULL DEFAULT 1.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '2026_08_14_172857_create_capital_transactions_table', 1),
(2, '2026_08_14_172911_create_vendor_advances_table', 2),
(3, '2026_08_14_172919_create_vendor_advance_adjustments_table', 3);

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
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('043d1a64-bf8c-49a1-8653-4a3096aef481', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260819-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/4\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-19 06:14:58', '2026-08-19 06:14:58'),
('0cd78771-7d6b-4f2e-b80c-a5d2029ed962', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer A2A was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/28\",\"icon\":\"storefront\",\"color\":\"blue\"}', '2026-08-12 04:24:28', '2026-08-10 08:58:36', '2026-08-12 04:24:28'),
('0d70abcf-dfa8-4dc9-8320-277911f97315', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Vendor Added\",\"message\":\"Vendor SUPER FEEDING FARM was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/vendors\\/7\",\"icon\":\"local_shipping\",\"color\":\"amber\"}', '2026-08-12 04:24:28', '2026-08-12 04:19:11', '2026-08-12 04:24:28'),
('2fac1556-52e8-448b-85ba-430eda842e77', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer fajan was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/30\",\"icon\":\"storefront\",\"color\":\"blue\"}', NULL, '2026-08-12 04:44:49', '2026-08-12 04:44:49'),
('3602fbbc-df98-4a58-97a6-f5750f610b61', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Vendor Added\",\"message\":\"Vendor VHL was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/vendors\\/6\",\"icon\":\"local_shipping\",\"color\":\"amber\"}', NULL, '2026-08-12 04:17:20', '2026-08-12 04:17:20'),
('379b8b27-adb4-4e4b-a253-dceebf4d27c0', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer thiruvathi was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/29\",\"icon\":\"storefront\",\"color\":\"blue\"}', NULL, '2026-08-12 04:31:06', '2026-08-12 04:31:06'),
('4e15feaa-0ea4-4620-87d2-7887a2b75853', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Vendor Added\",\"message\":\"Vendor SUPER FEEDING FARM was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/vendors\\/7\",\"icon\":\"local_shipping\",\"color\":\"amber\"}', NULL, '2026-08-12 04:19:11', '2026-08-12 04:19:11'),
('5029bdb1-39d2-41ea-88f0-0db1a4759d19', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260819-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/6\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-19 06:18:10', '2026-08-19 06:18:10'),
('5435355f-3394-4f69-b2e3-96a8c7738db1', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer thiruvathi was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/29\",\"icon\":\"storefront\",\"color\":\"blue\"}', '2026-08-12 05:25:17', '2026-08-12 04:31:06', '2026-08-12 05:25:17'),
('59974246-2140-481f-ba82-0b1c969f2d29', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer new kalima was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/27\",\"icon\":\"storefront\",\"color\":\"blue\"}', NULL, '2026-08-10 08:57:29', '2026-08-10 08:57:29'),
('6856b2df-a6d8-4c8e-8d24-995c8b2a8930', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer new kalima was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/27\",\"icon\":\"storefront\",\"color\":\"blue\"}', '2026-08-12 04:24:28', '2026-08-10 08:57:29', '2026-08-12 04:24:28'),
('6ee5eb7b-0ef9-4117-ae61-617fd3b7c802', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260819-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/6\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-19 06:18:10', '2026-08-19 06:18:10'),
('74a3ac89-af43-403e-ae4b-3a4b0c5534fa', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260818-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/1\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-18 15:23:51', '2026-08-18 15:23:51'),
('78f9a381-807a-463e-8f2e-a68b03f655f6', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260819-0002 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/5\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-19 06:15:06', '2026-08-19 06:15:06'),
('894a7455-2958-4643-ab8e-1892fa845fc7', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260818-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/2\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-18 15:39:25', '2026-08-18 15:39:25'),
('8d435728-d52c-43c8-8273-b54aa940a265', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260819-0002 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/5\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-19 06:15:06', '2026-08-19 06:15:06'),
('a31712bc-301c-42db-adcc-5aa4b9ede525', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260818-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/2\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-18 15:39:25', '2026-08-18 15:39:25'),
('c7e71dd8-db73-4173-8d4c-a971f2fa799a', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260818-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/3\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-18 15:44:09', '2026-08-18 15:44:09'),
('ce060376-e475-4ac9-aa33-899f56c83f5e', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer fajan was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/30\",\"icon\":\"storefront\",\"color\":\"blue\"}', '2026-08-12 05:25:17', '2026-08-12 04:44:49', '2026-08-12 05:25:17'),
('e04aa530-8248-4624-b988-d348d3ee12e2', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer kalima chicken was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/31\",\"icon\":\"storefront\",\"color\":\"blue\"}', NULL, '2026-08-18 15:20:34', '2026-08-18 15:20:34'),
('eded1d84-7e69-4d2f-939f-945a933c97aa', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260818-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/1\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-18 15:23:51', '2026-08-18 15:23:51'),
('f1786246-581f-45cc-a3e8-87905d9050c5', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Vendor Added\",\"message\":\"Vendor VHL was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/vendors\\/6\",\"icon\":\"local_shipping\",\"color\":\"amber\"}', '2026-08-12 04:24:28', '2026-08-12 04:17:20', '2026-08-12 04:24:28'),
('f6199922-5f4a-49ce-bb69-df6d60b331b7', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260818-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/3\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-18 15:44:09', '2026-08-18 15:44:09'),
('f7ca2aef-dc33-49ba-8c2f-45dd371bddda', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 1, '{\"title\":\"New Daily Invoice\",\"message\":\"Daily invoice INV-D-20260819-0001 was generated.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/billing\\/daily\\/4\\/invoice\",\"icon\":\"receipt\",\"color\":\"violet\"}', NULL, '2026-08-19 06:14:58', '2026-08-19 06:14:58'),
('fd1c2d24-a968-4f99-9d71-1deddb5d4ed3', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer kalima chicken was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/31\",\"icon\":\"storefront\",\"color\":\"blue\"}', NULL, '2026-08-18 15:20:34', '2026-08-18 15:20:34'),
('ff515b26-db84-4dc9-b07f-c998f762e3bd', 'App\\Notifications\\ActivityNotification', 'App\\Models\\User', 2, '{\"title\":\"New Dealer Added\",\"message\":\"Dealer A2A was registered.\",\"url\":\"https:\\/\\/halatech.saitechnosolutions.in\\/masters\\/dealers\\/28\",\"icon\":\"storefront\",\"color\":\"blue\"}', NULL, '2026-08-10 08:58:36', '2026-08-10 08:58:36');

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
-- Table structure for table `payment_adjustment_logs`
--

CREATE TABLE `payment_adjustment_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `action_type` varchar(255) NOT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `reason` varchar(255) DEFAULT NULL,
  `adjusted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'view customers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 1),
(2, 'create customers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 1),
(3, 'edit customers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 1),
(4, 'delete customers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 1),
(5, 'view customer bills', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 1),
(6, 'view customer payments', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 1),
(7, 'view customer emis', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 1),
(8, 'view dealers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 2),
(9, 'create dealers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 2),
(10, 'edit dealers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 2),
(11, 'delete dealers', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 2),
(12, 'view dealer purchases', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 2),
(13, 'view dealer ledger', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 2),
(14, 'view vendors', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 3),
(15, 'create vendors', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 3),
(16, 'edit vendors', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 3),
(17, 'delete vendors', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 3),
(18, 'view vendor purchases', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 3),
(19, 'view bills', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 4),
(20, 'create bills', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 4),
(21, 'edit bills', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 4),
(22, 'delete bills', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 4),
(23, 'view purchases', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 5),
(24, 'create purchases', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 5),
(25, 'edit purchases', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 5),
(26, 'delete purchases', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 5),
(27, 'view payments', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 6),
(28, 'create payments', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 6),
(29, 'edit payments', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 6),
(30, 'delete payments', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 6),
(31, 'view expenses', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 7),
(32, 'create expenses', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 7),
(33, 'edit expenses', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 7),
(34, 'delete expenses', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 7),
(35, 'view emis', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 8),
(36, 'create emis', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 8),
(37, 'edit emis', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 8),
(38, 'delete emis', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 8),
(39, 'view reports', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 9),
(40, 'view profit dashboard', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 9),
(41, 'view users', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(42, 'create users', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(43, 'edit users', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(44, 'delete users', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(45, 'view roles', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(46, 'create roles', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(47, 'edit roles', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(48, 'delete roles', 'web', '2026-08-07 23:00:43', '2026-08-07 23:00:43', 10),
(49, 'view permissions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(50, 'create permissions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(51, 'edit permissions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(52, 'delete permissions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(53, 'manage users', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(54, 'manage roles', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(55, 'manage permissions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(56, 'view activity logs', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 10),
(57, 'view stock', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(58, 'create stock', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(59, 'edit stock', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(60, 'delete stock', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(61, 'view batches', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(62, 'create batches', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(63, 'edit batches', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(64, 'delete batches', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(65, 'view warehouses', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(66, 'create warehouses', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(67, 'edit warehouses', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(68, 'delete warehouses', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(69, 'view items', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(70, 'create items', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(71, 'edit items', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(72, 'delete items', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(73, 'view consumptions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(74, 'create consumptions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(75, 'delete consumptions', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(76, 'view mortalities', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(77, 'create mortalities', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(78, 'delete mortalities', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(79, 'view analytics', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 11),
(80, 'view routes', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(81, 'create routes', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(82, 'edit routes', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(83, 'delete routes', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(84, 'mark delivery status', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(85, 'view vehicles', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(86, 'create vehicles', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(87, 'edit vehicles', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(88, 'delete vehicles', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(89, 'view drivers', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(90, 'create drivers', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(91, 'edit drivers', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12),
(92, 'delete drivers', 'web', '2026-08-07 23:00:44', '2026-08-07 23:00:44', 12);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Customers', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(2, 'Dealers', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(3, 'Vendors', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(4, 'Bills', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(5, 'Purchases', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(6, 'Payments', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(7, 'Expenses', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(8, 'EMIs', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(9, 'Reports & Dashboards', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(10, 'User Management', '2026-08-07 23:00:43', '2026-08-07 23:00:43'),
(11, 'Inventory & Stock', '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(12, 'Routes & Delivery', '2026-08-07 23:00:44', '2026-08-07 23:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poultry_consumptions`
--

CREATE TABLE `poultry_consumptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poultry_mortalities`
--

CREATE TABLE `poultry_mortalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `gst_percentage` decimal(5,2) NOT NULL DEFAULT 18.00,
  `gst_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(12,2) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit` varchar(255) NOT NULL DEFAULT 'kg',
  `rate` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `is_system`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', NULL, 0, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(2, 'accountant', 'web', NULL, 0, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(3, 'delivery_staff', 'web', NULL, 0, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(4, 'data_entry', 'web', NULL, 0, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(5, 'manager', 'web', NULL, 0, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(6, 'sales', 'web', NULL, 0, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(7, 'store_keeper', 'web', NULL, 0, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44');

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
(1, 2),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 5),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(8, 2),
(8, 4),
(8, 5),
(8, 6),
(9, 1),
(9, 4),
(9, 5),
(9, 6),
(10, 1),
(10, 4),
(10, 5),
(10, 6),
(11, 1),
(11, 5),
(12, 1),
(13, 1),
(14, 1),
(14, 2),
(14, 4),
(14, 5),
(15, 1),
(15, 4),
(15, 5),
(16, 1),
(16, 4),
(16, 5),
(17, 1),
(17, 5),
(18, 1),
(19, 1),
(19, 2),
(19, 3),
(19, 5),
(19, 6),
(20, 1),
(20, 2),
(20, 5),
(20, 6),
(21, 1),
(21, 2),
(21, 5),
(21, 6),
(22, 1),
(22, 5),
(23, 1),
(23, 4),
(23, 5),
(24, 1),
(24, 4),
(24, 5),
(25, 1),
(25, 4),
(25, 5),
(26, 1),
(26, 5),
(27, 1),
(27, 2),
(27, 5),
(27, 6),
(28, 1),
(28, 2),
(28, 5),
(28, 6),
(29, 1),
(29, 2),
(29, 5),
(29, 6),
(30, 1),
(30, 5),
(31, 1),
(31, 2),
(31, 5),
(32, 1),
(32, 2),
(32, 5),
(33, 1),
(33, 2),
(33, 5),
(34, 1),
(34, 5),
(35, 1),
(35, 5),
(36, 1),
(36, 5),
(37, 1),
(37, 5),
(38, 1),
(38, 5),
(39, 1),
(39, 2),
(39, 5),
(40, 1),
(40, 2),
(40, 5),
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
(57, 2),
(57, 4),
(57, 5),
(57, 7),
(58, 1),
(58, 4),
(58, 5),
(58, 7),
(59, 1),
(59, 4),
(59, 5),
(59, 7),
(60, 1),
(60, 5),
(61, 1),
(61, 4),
(61, 5),
(61, 7),
(62, 1),
(62, 4),
(62, 5),
(62, 7),
(63, 1),
(63, 4),
(63, 5),
(63, 7),
(64, 1),
(64, 5),
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
(80, 3),
(80, 5),
(80, 6),
(80, 7),
(81, 1),
(81, 5),
(82, 1),
(82, 5),
(83, 1),
(83, 5),
(84, 1),
(84, 3),
(84, 5),
(84, 6),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `route_name` varchar(255) NOT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_items`
--

CREATE TABLE `stock_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'Feed',
  `unit` varchar(255) NOT NULL DEFAULT 'kg',
  `current_stock` decimal(10,3) NOT NULL DEFAULT 0.000,
  `reorder_level` decimal(10,3) NOT NULL DEFAULT 0.000,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_ledgers`
--

CREATE TABLE `stock_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `type` enum('IN','OUT') NOT NULL,
  `source_type` varchar(255) NOT NULL,
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(255) NOT NULL,
  `transaction_date` date NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transactions`
--

CREATE TABLE `stock_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `txn_type` enum('IN','OUT','ADJUST') DEFAULT NULL,
  `type` enum('purchase_in','sale_out','adjustment') NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` decimal(10,3) NOT NULL,
  `unit` varchar(255) NOT NULL DEFAULT 'kg',
  `rate` decimal(10,2) DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `date` date NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
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
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin', 'admin@poultry.com', NULL, '$2y$12$R2whQ8fxkfQGj9g1uLg4C.Np/zZ8c215YowXB.1v76miwAlb68f.m', 1, NULL, '2026-08-07 23:00:44', '2026-08-07 23:00:44'),
(2, 'sriram', 'sriram D', 'sriram@gmail.com', NULL, '$2y$12$ZD6H3t7JmSSNsfTBkFXRYeQUcb.od/RdzIhNpWxIM6EeBQkCRzOvG', 1, NULL, '2026-08-08 00:57:04', '2026-08-08 00:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vehicle_number` varchar(255) NOT NULL,
  `vehicle_type` varchar(255) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firm_name` varchar(255) NOT NULL,
  `is_shop` tinyint(1) NOT NULL DEFAULT 0,
  `gst_number` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `pending_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `firm_name`, `is_shop`, `gst_number`, `location`, `contact_person`, `phone`, `route`, `notes`, `pending_amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mani foods private limted', 0, NULL, 'plani', '9944011145', '9944011345', 'villupuram suronding', 'nothing', 0.00, '2026-07-20 01:13:08', '2026-07-20 01:13:08', NULL),
(2, 'royal agro farm private limited', 0, NULL, 'coimbatore', '9944011100', '99444011109', 'villupuram suronding', 'no', 0.00, '2026-07-20 01:16:30', '2026-07-20 01:16:30', NULL),
(3, 'swami feeds private limited', 0, NULL, 'coimbatore', 'jayaram (zonal)', '99444011111', 'villupuram suronding', 'no', 0.00, '2026-07-20 01:18:12', '2026-07-20 01:18:12', NULL),
(4, 'skm', 0, NULL, 'coimbatore', 'Shakeen Msr', '99444011145', 'villupuram suronding', 'no', 0.00, '2026-07-22 03:25:23', '2026-07-22 03:25:23', NULL),
(6, 'VHL', 0, NULL, 'cuddalore', 'MANAGER', '9944011100', 'cuddalore', 'NO', 0.00, '2026-08-12 04:17:19', '2026-08-12 04:17:19', NULL),
(7, 'SUPER FEEDING FARM', 0, NULL, 'panruti', 'MANAGER', '9944011190', 'villupuram suronding', 'NO', 207000.00, '2026-08-12 04:19:11', '2026-08-12 04:19:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_advances`
--

CREATE TABLE `vendor_advances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `cash_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bank_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `investment_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `adjusted_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(255) NOT NULL DEFAULT 'Cash',
  `bank_transfer_type` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Partially Adjusted','Fully Adjusted') NOT NULL DEFAULT 'Pending',
  `reference_number` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_advance_adjustments`
--

CREATE TABLE `vendor_advance_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_advance_id` bigint(20) UNSIGNED NOT NULL,
  `day_load_entry_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_payments`
--

CREATE TABLE `vendor_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `day_load_entry_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `cash_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bank_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(12,2) GENERATED ALWAYS AS (`cash_amount` + `bank_amount`) STORED,
  `pending_balance_after` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(50) NOT NULL DEFAULT 'Cash',
  `bank_transfer_type` enum('UPI','Bank Transfer','NEFT','RTGS','IMPS','Cheque','Other') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weekly_bills`
--

CREATE TABLE `weekly_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `dealer_id` bigint(20) UNSIGNED NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `gst_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `gst_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(255) NOT NULL DEFAULT 'cash',
  `bank_method` enum('UPI','Cheque','NEFT') DEFAULT NULL,
  `status` enum('COD','Pending','Bank','Paid') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `monday_payment_amount` decimal(12,2) DEFAULT NULL,
  `monday_payment_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `friday_payment_amount` decimal(12,2) DEFAULT NULL,
  `friday_payment_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `previous_outstanding` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payments_during_week` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weekly_bill_items`
--

CREATE TABLE `weekly_bill_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `weekly_bill_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `quantity_kg` decimal(10,2) NOT NULL,
  `rate_per_kg` decimal(10,2) NOT NULL,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `batches_batch_code_unique` (`batch_code`),
  ADD KEY `idx_batches_status` (`status`);

--
-- Indexes for table `bird_batches`
--
ALTER TABLE `bird_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `capital_transactions`
--
ALTER TABLE `capital_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capital_transactions_created_by_foreign` (`created_by`),
  ADD KEY `capital_transactions_date_index` (`date`),
  ADD KEY `capital_transactions_type_index` (`type`);

--
-- Indexes for table `cash_bank_ledgers`
--
ALTER TABLE `cash_bank_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cash_bank_ledgers_ledger_date_unique` (`ledger_date`),
  ADD KEY `cash_bank_ledgers_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_name_index` (`name`),
  ADD KEY `customers_route_index` (`route`),
  ADD KEY `customers_type_index` (`type`),
  ADD KEY `customers_route_id_foreign` (`route_id`),
  ADD KEY `idx_customers_balance` (`balance`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_payments_customer_id_index` (`customer_id`),
  ADD KEY `customer_payments_date_index` (`date`),
  ADD KEY `customer_payments_date_customer_id_index` (`date`,`customer_id`);

--
-- Indexes for table `daily_bills`
--
ALTER TABLE `daily_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daily_bills_invoice_no_unique` (`invoice_no`),
  ADD KEY `daily_bills_customer_id_foreign` (`customer_id`),
  ADD KEY `daily_bills_date_index` (`date`),
  ADD KEY `daily_bills_status_index` (`status`),
  ADD KEY `daily_bills_date_customer_id_index` (`date`,`customer_id`),
  ADD KEY `daily_bills_dealer_id_foreign` (`dealer_id`);

--
-- Indexes for table `daily_bill_items`
--
ALTER TABLE `daily_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_bill_items_daily_bill_id_foreign` (`daily_bill_id`),
  ADD KEY `daily_bill_items_item_name_index` (`item_name`);

--
-- Indexes for table `day_load_batches`
--
ALTER TABLE `day_load_batches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `day_load_batches_billing_date_unique` (`billing_date`),
  ADD KEY `day_load_batches_invoice_id_foreign` (`invoice_id`),
  ADD KEY `day_load_batches_weight_loss_approved_by_foreign` (`weight_loss_approved_by`);

--
-- Indexes for table `day_load_entries`
--
ALTER TABLE `day_load_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `day_load_entries_batch_id_foreign` (`batch_id`),
  ADD KEY `day_load_entries_vendor_id_foreign` (`vendor_id`),
  ADD KEY `day_load_entries_dealer_id_foreign` (`dealer_id`),
  ADD KEY `day_load_entries_parent_entry_id_foreign` (`parent_entry_id`),
  ADD KEY `day_load_entries_weekly_bill_id_foreign` (`weekly_bill_id`),
  ADD KEY `day_load_entries_daily_bill_id_foreign` (`daily_bill_id`);

--
-- Indexes for table `day_load_invoices`
--
ALTER TABLE `day_load_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `day_load_invoices_invoice_no_unique` (`invoice_no`),
  ADD KEY `day_load_invoices_batch_id_foreign` (`batch_id`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealers_firm_name_index` (`firm_name`),
  ADD KEY `dealers_route_id_foreign` (`route_id`),
  ADD KEY `idx_dealers_pending_amount` (`pending_amount`);

--
-- Indexes for table `dealer_payments`
--
ALTER TABLE `dealer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_payments_dealer_id_index` (`dealer_id`),
  ADD KEY `dealer_payments_date_index` (`date`),
  ADD KEY `dealer_payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `dealer_payments_day_load_entry_id_foreign` (`day_load_entry_id`),
  ADD KEY `dealer_payments_payment_group_id_index` (`payment_group_id`);

--
-- Indexes for table `dealer_purchases`
--
ALTER TABLE `dealer_purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dealer_purchases_invoice_no_unique` (`invoice_no`),
  ADD KEY `dealer_purchases_dealer_id_foreign` (`dealer_id`),
  ADD KEY `dealer_purchases_weekly_bill_id_foreign` (`weekly_bill_id`);

--
-- Indexes for table `dealer_purchase_items`
--
ALTER TABLE `dealer_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dealer_purchase_items_dealer_purchase_id_foreign` (`dealer_purchase_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emis`
--
ALTER TABLE `emis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emis_due_date_index` (`due_date`),
  ADD KEY `emis_status_index` (`status`);

--
-- Indexes for table `entry_adjustment_logs`
--
ALTER TABLE `entry_adjustment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_adjustment_logs_entry_id_foreign` (`entry_id`),
  ADD KEY `entry_adjustment_logs_resulting_entry_id_foreign` (`resulting_entry_id`),
  ADD KEY `entry_adjustment_logs_adjusted_by_foreign` (`adjusted_by`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_date_index` (`date`),
  ADD KEY `expenses_category_index` (`category`),
  ADD KEY `expenses_category_id_foreign` (`category_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_code_unique` (`code`),
  ADD KEY `items_name_index` (`name`),
  ADD KEY `items_type_index` (`type`),
  ADD KEY `items_category_index` (`category`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_adjustment_logs`
--
ALTER TABLE `payment_adjustment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_adjustment_logs_adjusted_by_foreign` (`adjusted_by`),
  ADD KEY `payment_adjustment_logs_payment_id_index` (`payment_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `permissions_permission_group_id_foreign` (`permission_group_id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `poultry_consumptions`
--
ALTER TABLE `poultry_consumptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poultry_consumptions_batch_id_foreign` (`batch_id`),
  ADD KEY `poultry_consumptions_item_id_foreign` (`item_id`),
  ADD KEY `poultry_consumptions_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `poultry_consumptions_created_by_foreign` (`created_by`),
  ADD KEY `poultry_consumptions_date_batch_id_index` (`date`,`batch_id`);

--
-- Indexes for table `poultry_mortalities`
--
ALTER TABLE `poultry_mortalities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poultry_mortalities_batch_id_foreign` (`batch_id`),
  ADD KEY `poultry_mortalities_created_by_foreign` (`created_by`),
  ADD KEY `poultry_mortalities_date_batch_id_index` (`date`,`batch_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_date_index` (`date`),
  ADD KEY `purchases_vendor_name_index` (`vendor_name`),
  ADD KEY `purchases_vendor_id_foreign` (`vendor_id`),
  ADD KEY `purchases_date_vendor_id_index` (`date`,`vendor_id`),
  ADD KEY `purchases_invoice_no_index` (`invoice_no`),
  ADD KEY `purchases_payment_mode_index` (`payment_mode`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_items_item_name_index` (`item_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `roles_created_by_foreign` (`created_by`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `routes_vehicle_id_foreign` (`vehicle_id`),
  ADD KEY `routes_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock_items`
--
ALTER TABLE `stock_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stock_summary_item_name_unique` (`item_name`);

--
-- Indexes for table `stock_ledgers`
--
ALTER TABLE `stock_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_ledgers_batch_id_foreign` (`batch_id`),
  ADD KEY `stock_ledgers_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_ledgers_source_type_source_id_index` (`source_type`,`source_id`),
  ADD KEY `idx_ledgers_item_type_qty` (`item_id`,`type`,`quantity`),
  ADD KEY `idx_ledgers_txn_date` (`transaction_date`),
  ADD KEY `idx_ledgers_created_at` (`created_at`);

--
-- Indexes for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_movements_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicles_vehicle_number_unique` (`vehicle_number`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendors_firm_name_index` (`firm_name`);

--
-- Indexes for table `vendor_advances`
--
ALTER TABLE `vendor_advances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_advances_created_by_foreign` (`created_by`),
  ADD KEY `vendor_advances_vendor_id_index` (`vendor_id`),
  ADD KEY `vendor_advances_date_index` (`date`),
  ADD KEY `vendor_advances_status_index` (`status`);

--
-- Indexes for table `vendor_advance_adjustments`
--
ALTER TABLE `vendor_advance_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_advance_adjustments_vendor_advance_id_index` (`vendor_advance_id`),
  ADD KEY `vendor_advance_adjustments_day_load_entry_id_index` (`day_load_entry_id`),
  ADD KEY `vendor_advance_adjustments_date_index` (`date`);

--
-- Indexes for table `vendor_payments`
--
ALTER TABLE `vendor_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_payments_vendor_id_index` (`vendor_id`),
  ADD KEY `vendor_payments_date_index` (`date`),
  ADD KEY `vendor_payments_day_load_entry_id_foreign` (`day_load_entry_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weekly_bills`
--
ALTER TABLE `weekly_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weekly_bills_invoice_no_unique` (`invoice_no`),
  ADD KEY `weekly_bills_status_index` (`status`),
  ADD KEY `weekly_bills_period_start_index` (`period_start`),
  ADD KEY `weekly_bills_period_start_customer_id_index` (`period_start`,`dealer_id`),
  ADD KEY `idx_weekly_bills_period_customer` (`period_end`,`dealer_id`),
  ADD KEY `weekly_bills_dealer_id_foreign` (`dealer_id`);

--
-- Indexes for table `weekly_bill_items`
--
ALTER TABLE `weekly_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weekly_bill_items_weekly_bill_id_foreign` (`weekly_bill_id`),
  ADD KEY `weekly_bill_items_item_name_index` (`item_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bird_batches`
--
ALTER TABLE `bird_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capital_transactions`
--
ALTER TABLE `capital_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cash_bank_ledgers`
--
ALTER TABLE `cash_bank_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_bills`
--
ALTER TABLE `daily_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `daily_bill_items`
--
ALTER TABLE `daily_bill_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `day_load_batches`
--
ALTER TABLE `day_load_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `day_load_entries`
--
ALTER TABLE `day_load_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `day_load_invoices`
--
ALTER TABLE `day_load_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `dealer_payments`
--
ALTER TABLE `dealer_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dealer_purchases`
--
ALTER TABLE `dealer_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer_purchase_items`
--
ALTER TABLE `dealer_purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emis`
--
ALTER TABLE `emis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `entry_adjustment_logs`
--
ALTER TABLE `entry_adjustment_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_adjustment_logs`
--
ALTER TABLE `payment_adjustment_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poultry_consumptions`
--
ALTER TABLE `poultry_consumptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poultry_mortalities`
--
ALTER TABLE `poultry_mortalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_items`
--
ALTER TABLE `stock_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_ledgers`
--
ALTER TABLE `stock_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendor_advances`
--
ALTER TABLE `vendor_advances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_advance_adjustments`
--
ALTER TABLE `vendor_advance_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_payments`
--
ALTER TABLE `vendor_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weekly_bills`
--
ALTER TABLE `weekly_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weekly_bill_items`
--
ALTER TABLE `weekly_bill_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `capital_transactions`
--
ALTER TABLE `capital_transactions`
  ADD CONSTRAINT `capital_transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cash_bank_ledgers`
--
ALTER TABLE `cash_bank_ledgers`
  ADD CONSTRAINT `cash_bank_ledgers_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD CONSTRAINT `customer_payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_bills`
--
ALTER TABLE `daily_bills`
  ADD CONSTRAINT `daily_bills_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_bills_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_bill_items`
--
ALTER TABLE `daily_bill_items`
  ADD CONSTRAINT `daily_bill_items_daily_bill_id_foreign` FOREIGN KEY (`daily_bill_id`) REFERENCES `daily_bills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `day_load_batches`
--
ALTER TABLE `day_load_batches`
  ADD CONSTRAINT `day_load_batches_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `day_load_invoices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `day_load_batches_weight_loss_approved_by_foreign` FOREIGN KEY (`weight_loss_approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `day_load_entries`
--
ALTER TABLE `day_load_entries`
  ADD CONSTRAINT `day_load_entries_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `day_load_batches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `day_load_entries_daily_bill_id_foreign` FOREIGN KEY (`daily_bill_id`) REFERENCES `daily_bills` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `day_load_entries_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`),
  ADD CONSTRAINT `day_load_entries_parent_entry_id_foreign` FOREIGN KEY (`parent_entry_id`) REFERENCES `day_load_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `day_load_entries_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`),
  ADD CONSTRAINT `day_load_entries_weekly_bill_id_foreign` FOREIGN KEY (`weekly_bill_id`) REFERENCES `weekly_bills` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `day_load_invoices`
--
ALTER TABLE `day_load_invoices`
  ADD CONSTRAINT `day_load_invoices_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `day_load_batches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dealers`
--
ALTER TABLE `dealers`
  ADD CONSTRAINT `dealers_route_id_foreign` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dealer_payments`
--
ALTER TABLE `dealer_payments`
  ADD CONSTRAINT `dealer_payments_day_load_entry_id_foreign` FOREIGN KEY (`day_load_entry_id`) REFERENCES `day_load_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dealer_payments_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dealer_payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `day_load_invoices` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dealer_purchases`
--
ALTER TABLE `dealer_purchases`
  ADD CONSTRAINT `dealer_purchases_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dealer_purchases_weekly_bill_id_foreign` FOREIGN KEY (`weekly_bill_id`) REFERENCES `weekly_bills` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dealer_purchase_items`
--
ALTER TABLE `dealer_purchase_items`
  ADD CONSTRAINT `dealer_purchase_items_dealer_purchase_id_foreign` FOREIGN KEY (`dealer_purchase_id`) REFERENCES `dealer_purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entry_adjustment_logs`
--
ALTER TABLE `entry_adjustment_logs`
  ADD CONSTRAINT `entry_adjustment_logs_adjusted_by_foreign` FOREIGN KEY (`adjusted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entry_adjustment_logs_entry_id_foreign` FOREIGN KEY (`entry_id`) REFERENCES `day_load_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entry_adjustment_logs_resulting_entry_id_foreign` FOREIGN KEY (`resulting_entry_id`) REFERENCES `day_load_entries` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`) ON DELETE SET NULL;

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
-- Constraints for table `payment_adjustment_logs`
--
ALTER TABLE `payment_adjustment_logs`
  ADD CONSTRAINT `payment_adjustment_logs_adjusted_by_foreign` FOREIGN KEY (`adjusted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payment_adjustment_logs_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `dealer_payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_permission_group_id_foreign` FOREIGN KEY (`permission_group_id`) REFERENCES `permission_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `poultry_consumptions`
--
ALTER TABLE `poultry_consumptions`
  ADD CONSTRAINT `poultry_consumptions_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poultry_consumptions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `poultry_consumptions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poultry_consumptions_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poultry_mortalities`
--
ALTER TABLE `poultry_mortalities`
  ADD CONSTRAINT `poultry_mortalities_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poultry_mortalities_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `routes_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stock_ledgers`
--
ALTER TABLE `stock_ledgers`
  ADD CONSTRAINT `stock_ledgers_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`),
  ADD CONSTRAINT `stock_ledgers_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `stock_ledgers_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `stock_transactions`
--
ALTER TABLE `stock_transactions`
  ADD CONSTRAINT `stock_movements_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vendor_advances`
--
ALTER TABLE `vendor_advances`
  ADD CONSTRAINT `vendor_advances_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vendor_advances_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_advance_adjustments`
--
ALTER TABLE `vendor_advance_adjustments`
  ADD CONSTRAINT `vendor_advance_adjustments_day_load_entry_id_foreign` FOREIGN KEY (`day_load_entry_id`) REFERENCES `day_load_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_advance_adjustments_vendor_advance_id_foreign` FOREIGN KEY (`vendor_advance_id`) REFERENCES `vendor_advances` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_payments`
--
ALTER TABLE `vendor_payments`
  ADD CONSTRAINT `vendor_payments_day_load_entry_id_foreign` FOREIGN KEY (`day_load_entry_id`) REFERENCES `day_load_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vendor_payments_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weekly_bills`
--
ALTER TABLE `weekly_bills`
  ADD CONSTRAINT `weekly_bills_dealer_id_foreign` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weekly_bill_items`
--
ALTER TABLE `weekly_bill_items`
  ADD CONSTRAINT `weekly_bill_items_weekly_bill_id_foreign` FOREIGN KEY (`weekly_bill_id`) REFERENCES `weekly_bills` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
