-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 08, 2021 at 03:01 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmyshow`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `type`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Fantasy'),
(5, 'Horror'),
(6, 'Mystery'),
(7, 'Romance'),
(8, 'Thriller'),
(9, 'Western'),
(10, 'Animation'),
(11, 'Sci-fi\r\n'),
(12, 'Adventure'),
(13, 'Crime');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(9, '2021_06_30_093121_create_movies_table', 3),
(10, '2021_07_01_051728_add_column_inmoviestable', 4),
(11, '2021_07_01_055506_create_categories_table', 5),
(12, '2021_07_01_061031_add_foriegnkey_to_movies_table', 6),
(13, '2021_07_05_094341_create_movie_tickets_table', 7),
(14, '2021_07_05_095506_add_foreign_to_movie_bookings_table', 8),
(15, '2021_07_06_061836_movie_categories', 9),
(16, '2021_07_06_072008_drop_column_from_movies_table', 10),
(17, '2021_07_06_093017_update_column_in_movie_categories_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `casts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `runtime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_year` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lang` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `overview`, `image`, `casts`, `runtime`, `release_year`, `created_at`, `updated_at`, `lang`, `screen`) VALUES
(5, 'Tom & Jerry', 'When Jerry moves into New York`s finest hotel, the event manager Kayla teams up with Tom to evict the mouse, resulting in one of the most elaborate cat-and-mouse games ever!', 'tom-and-jerry-et00300988-17-05-2021-11-36-56.jpg', 'Pallavi Sharda', '01:41', '2021-02-19', '2021-07-01 02:20:54', '2021-07-06 23:33:21', 'eng,hin,tam,tel', '2d,imax2d,mx4d'),
(6, 'Godzilla vs. Kong', 'Kong is on a journey to find his true home but gets in the way of an enraged Godzilla. The epic clash between them is only the beginning of the mystery that lies within the core of the Earth. NOTE: Available in 4K format on Firestick and Apple TV.', 'godzilla-vs-kong-et00122511-16-06-2021-12-47-29.jpg', 'Alexander Skarsgård,Millie Bobby Brown,Lance Reddick', '01:53', '2021-03-24', '2021-07-01 04:50:42', '2021-07-06 22:50:47', 'eng,hin,tam,tel', '2d,imax2d,mx4d'),
(7, 'Zack Snyder`s Justice League', 'Determined to ensure Superman`s ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince to recruit a team of metahumans to protect the world.', 'zack-snyder-s-justice-league-et00047164-10-04-2021-03-22-49.jpg', 'Henry Cavill,Ben Affleck,Gal Gadot,Jason Momoa', '04:01', '2021-03-18', '2021-07-01 04:55:57', '2021-07-06 22:58:22', 'eng', '2d'),
(8, 'Mumbai Saga', 'Amartya Rao, a bold and ruthless gangster, dreams of ruling the city of dreams, Bombay. Meanwhile, Inspector Vijay Savarkar is after Rao, tracking his every move. Will Savarkar be able to stop Rao from accomplishing his goal?', 'mumbai-saga-et00105043-16-03-2021-02-46-48.jpg', 'John Abraham,Suniel Shetty,Emraan Hashmi,Kajal Aggarwal', '02:08', '2021-03-19', '2021-07-01 05:02:37', '2021-07-06 23:01:31', 'hin', '2d'),
(9, 'Jumanji: The Next Level', 'In Jumanji: The Next Level, the gang is back but the game has changed. As they return to Jumanji to rescue one of their own, they discover that nothing is as they expect.', 'jumanji-the-next-level-et00077156-22-10-2020-06-15-23.jpg', 'Dwayne Johnson,Karen Gillan,Jack Black,Kevin Hart', '02:02', '2019-12-13', '2021-07-01 05:10:49', '2021-07-06 23:02:59', 'eng,hin,tam,tel', '2d,3d,4d,imax2d,mx4d');

-- --------------------------------------------------------

--
-- Table structure for table `movie_categories`
--

CREATE TABLE `movie_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fkmovie_id` bigint(20) UNSIGNED NOT NULL,
  `fkcat_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_categories`
--

INSERT INTO `movie_categories` (`id`, `fkmovie_id`, `fkcat_id`) VALUES
(10, 6, 1),
(11, 6, 8),
(12, 6, 11),
(13, 7, 1),
(14, 7, 4),
(15, 7, 12),
(16, 8, 1),
(17, 8, 3),
(18, 8, 13),
(19, 9, 1),
(20, 9, 2),
(21, 9, 4),
(22, 9, 12),
(23, 5, 1),
(24, 5, 2),
(25, 5, 3),
(26, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `movie_tickets`
--

CREATE TABLE `movie_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fkmovie_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fkuser_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_tickets`
--

INSERT INTO `movie_tickets` (`id`, `fkmovie_id`, `qty`, `date`, `no`, `created_at`, `updated_at`, `fkuser_id`) VALUES
(1, 6, '2', '2021-07-05', 'B2', '2021-07-05 06:51:00', '2021-07-05 06:51:00', 2),
(2, 7, '2', '2021-07-11', 'A3,B3', '2021-07-05 06:59:31', '2021-07-05 06:59:31', 4),
(3, 6, '1', '2021-07-20', 'C4', '2021-07-08 01:06:29', '2021-07-08 01:06:29', 2),
(6, 6, '2', '2021-07-10', 'B2,C4,C4,B5,C5', '2021-07-08 01:40:12', '2021-07-08 01:40:12', 4),
(7, 7, '5', '2021-07-17', 'A3,B3,C3,B3,D3,E3,A3', '2021-07-08 01:49:59', '2021-07-08 01:49:59', 55),
(8, 5, '4', '2021-07-28', ',C9,D9,E9,B9', '2021-07-08 04:32:20', '2021-07-08 04:32:20', 53);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('07ba659c2207ec6a6f9e83b461dfc2adde9f11fd6586d5ba100cc96518ccb323a2b5ddbc6e17ad26', 1, 3, 'Api token', '[]', 0, '2021-07-08 04:59:47', '2021-07-08 04:59:47', '2022-07-08 10:29:47'),
('12f5d618f52b9f5dfce6c3e7f625ea659cef0fa2a91925f5f9fb4357e24d2e6ef1a616a0ab5e9470', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:40:05', '2021-06-30 03:40:05', '2022-06-30 09:10:05'),
('17afebed5de296caf37ca9df6d6a8dfe162816e711acb72889a13ca946b1214befacf76ab760978a', 2, 3, 'Api token', '[]', 0, '2021-07-02 01:56:35', '2021-07-02 01:56:35', '2022-07-02 07:26:35'),
('17be9b4727657fccfcb597b62609ab56c0fb06e08e1e82ac4221f3288624b403ff0a1737c079f68c', 53, 3, 'Api token', '[]', 0, '2021-07-08 04:31:59', '2021-07-08 04:31:59', '2022-07-08 10:01:59'),
('17eadd817ecb2a6d05972e7ea62d353b3af1e634f8c328f4c9342076e4f3f9353e9ded4f3a1cb9ae', 2, 3, 'Api token', '[]', 0, '2021-07-05 22:24:12', '2021-07-05 22:24:12', '2022-07-06 03:54:12'),
('1c73791e25113bc343f9575c55ef3b049b5a33fe722ff84d6ce8c9f741127ad8f2aa66f40e8c442e', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:57:18', '2021-06-30 03:57:18', '2022-06-30 09:27:18'),
('1e62c045fbd32bdafc75e0067eb2a27dd01ba7577654f49a11b01cc815f871a5c4a7ee8f369eaee8', 2, 3, 'Api token', '[]', 0, '2021-07-02 01:13:10', '2021-07-02 01:13:10', '2022-07-02 06:43:10'),
('1f06af9a0d63aa6194ffcb4d9ca1a93ff6f7b6da381b98b8817b41b70c88b859fc2ab7eb928df877', 1, 3, 'Api token', '[]', 0, '2021-06-30 06:16:15', '2021-06-30 06:16:15', '2022-06-30 11:46:15'),
('208442cb03d8a9e1e2006f219db694c330d31fb9bc6efc4b034e502a90d9776590222c8af6314de8', 2, 3, 'Api token', '[]', 0, '2021-07-07 05:04:43', '2021-07-07 05:04:43', '2022-07-07 10:34:43'),
('22e36ff3a6f1f207640ebc38f28448b11b39fa24f66de502ec4e846227cc4ace6dc784e33201ec2e', 1, 3, 'Api token', '[]', 0, '2021-07-06 22:48:52', '2021-07-06 22:48:52', '2022-07-07 04:18:52'),
('2441607f5df6b434add264b1ec0f2241897790fed6cde3172f1f5e1aaa3d1714130d39b9a5d1cd90', 1, 3, 'Api token', '[]', 0, '2021-06-30 22:17:18', '2021-06-30 22:17:18', '2022-07-01 03:47:18'),
('26be6f2765ffcf0cf71e6b88d33c9a2f7961a220216154d41a910df5ae63b6f64fdf48f8988513f8', 2, 3, 'Api token', '[]', 0, '2021-07-08 06:28:49', '2021-07-08 06:28:49', '2022-07-08 11:58:49'),
('27bdff859992f986d52c883c0e88da0d82f2ac9db3b63ba84fec40d504caf73fdb88d6144b768aa9', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:54:34', '2021-06-29 23:54:34', '2022-06-30 05:24:34'),
('2abeae3f366ce8114479292627a23682a8c72d53fe1a59c7675350ebf9ed65d405eae42ed836048c', 1, 3, 'Api token', '[]', 0, '2021-06-30 07:39:44', '2021-06-30 07:39:44', '2022-06-30 13:09:44'),
('2b5ecfe77ce054ea4629136f5c1dcf72bf25455e8b390e1f650db89f6d0f824ed3a2096fbc080ea2', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:57:18', '2021-06-30 03:57:18', '2022-06-30 09:27:18'),
('2c3dd336dc7fe68cf2de285dc689e9fd2f4ef921483ff7becf612b25ef0757deffe98dfe499e37dc', 2, 3, 'Api token', '[]', 0, '2021-07-07 22:08:39', '2021-07-07 22:08:39', '2022-07-08 03:38:39'),
('2f5aa656fdf1cbfcb14e6286f1ac29fe5a20a90dd67837937453088fda136e7317fa1d839b05077d', 51, 3, 'Api token', '[]', 0, '2021-07-08 01:42:09', '2021-07-08 01:42:09', '2022-07-08 07:12:09'),
('354f68cfa27fc387c9cbc1ffc27cd8c9623e6255d4be0d5ad8582595c6b0d93f694d7ed73d0035f9', 1, 3, 'Api token', '[]', 0, '2021-07-06 00:46:18', '2021-07-06 00:46:18', '2022-07-06 06:16:18'),
('360d951b37835ad678c1197de07285dfe5e46f652b802f7b1e49ba911042325317936dbf9cc92251', 2, 3, 'Api token', '[]', 0, '2021-07-05 06:08:04', '2021-07-05 06:08:04', '2022-07-05 11:38:04'),
('3f4e003caa5bc26ff89decb01c6a8abd6d51ce2543b22006df76fa3fc9cd4e8afc4c81840701d32f', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:48:38', '2021-06-29 23:48:38', '2022-06-30 05:18:38'),
('424c9b2189dd84b3dfc5a0973aefe937def7bf19ae5ce858bb53e5226fa61f77433c281b7946a377', 1, 3, 'Api token', '[]', 0, '2021-07-04 23:41:45', '2021-07-04 23:41:45', '2022-07-05 05:11:45'),
('44f8a25000585fe85ddff1d82bccc5ddd70dde44ae0389c105666c89884fbf4c61a7b75930bf1b64', 2, 3, 'Api token', '[]', 0, '2021-07-05 06:40:53', '2021-07-05 06:40:53', '2022-07-05 12:10:53'),
('460b85abf4069a02989835ea4b44a0fb95b4bf32d08eebb0debb0d13535d7d8e0703251ecb4c7625', 1, 3, 'Api token', '[]', 0, '2021-07-01 22:18:07', '2021-07-01 22:18:07', '2022-07-02 03:48:07'),
('4c3eabfebd07161abdcfe83370440ba71f8f129605f82955e33fc664fbdc9e8e7f5e6392e2581b8b', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:39:39', '2021-06-30 03:39:39', '2022-06-30 09:09:39'),
('4d66f1655405cb76bbca435ffb9cb84bd9d51c2a674231b77675232161a451768d75eb87c9ecf6b4', 1, 3, 'Api token', '[]', 0, '2021-06-30 04:17:43', '2021-06-30 04:17:43', '2022-06-30 09:47:43'),
('50b1fe620588792a0680da439f6dafc30b6f4ab3ea1baf621c586ace1e4d2bc9c26057d97a6f2909', 2, 3, 'Api token', '[]', 0, '2021-07-05 22:34:10', '2021-07-05 22:34:10', '2022-07-06 04:04:10'),
('52cf27b902a0f68a0682adc77ae1affcbedb6f9bef1773d4e5c122cec380932d6ec9094d8a014be8', 1, 3, 'Api token', '[]', 0, '2021-07-06 23:43:42', '2021-07-06 23:43:42', '2022-07-07 05:13:42'),
('558a7b979c2ca87f395d7e38a4bfd57199a81578bef45bc3e98e0ac9550de15585f28c5be1a167e8', 1, 3, 'Api token', '[]', 0, '2021-07-06 03:43:48', '2021-07-06 03:43:48', '2022-07-06 09:13:48'),
('55d426f791e3c91b33f9f759ab7e8e8fbcbc5eb20df3615ef6d5510ae3de520fdfc888673772b928', 2, 3, 'Api token', '[]', 0, '2021-07-01 22:33:02', '2021-07-01 22:33:02', '2022-07-02 04:03:02'),
('5ec96d9869c23e9aeba628d9b2c4e813dab4b829cce8eb967ed62cb652a8ad809263325b22efe12f', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:55:09', '2021-06-29 23:55:09', '2022-06-30 05:25:09'),
('5efa71afd1fec677c26e874be02cdc2120cb7246494f5c42f4d04bbd27986d6cecc7193d2d60b804', 2, 3, 'Api token', '[]', 0, '2021-07-01 23:09:37', '2021-07-01 23:09:37', '2022-07-02 04:39:37'),
('60773460c536225264726851bc53ef09be0cd3d6830683c52c3e4efa7c8661ced5b217680b174885', 2, 3, 'Api token', '[]', 0, '2021-07-07 00:36:34', '2021-07-07 00:36:34', '2022-07-07 06:06:34'),
('662a244f04261ee64132bc308ba04ff700e4654649804c901ee6e5bef7f251f2d4f6762178bd455d', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:55:59', '2021-06-30 03:55:59', '2022-06-30 09:25:59'),
('67bd0ece4b58ab9e057e9371f171bee48540516c38f8fe31494dc50c9f69e45132f30799a06ab6d0', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:46:38', '2021-06-30 03:46:38', '2022-06-30 09:16:38'),
('68f71d285f0bb5c473e63863e9f4c8f26c0f871ee3c4bbed7c6ac32e8942354ebb64e6a83062dd72', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:18:48', '2021-06-29 23:18:48', '2022-06-30 04:48:48'),
('6bb1b45b8290e667e2be3e52e0bbf9029e53a6e8f36714577e221774fed847a8f7fdbd774added62', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:59:58', '2021-06-30 03:59:58', '2022-06-30 09:29:58'),
('6d1f60a960da632d7940e50a3737e9b237320227012e7ede7abd38cb922f641d33b259a78b54a02e', 2, 3, 'Api token', '[]', 0, '2021-07-07 02:20:29', '2021-07-07 02:20:29', '2022-07-07 07:50:29'),
('6e280619e17d13b96c4113933eb643e06d130c3ec87f65ab859b5b237828fd0f77ee649fc00d58ef', 2, 3, 'Api token', '[]', 0, '2021-07-05 06:40:57', '2021-07-05 06:40:57', '2022-07-05 12:10:57'),
('6f276e099e4fc73d7dc7072a85e3e8a60ecfadb8213d4fd153f432ca0cbf81a864b907755bbeae5b', 2, 3, 'Api token', '[]', 0, '2021-07-08 01:50:13', '2021-07-08 01:50:13', '2022-07-08 07:20:13'),
('6f5b9735642fc68036908846ca615b10ac1e9dd88fa004147e323eda74028d0900198a4b4406d392', 1, 3, 'Api token', '[]', 0, '2021-07-01 22:16:52', '2021-07-01 22:16:52', '2022-07-02 03:46:52'),
('6f7841a0d23ee349cd33a0f031cfa8f27106aa1f07f71c5de51ccfa50630b25c2f0f6784e5c02578', 1, 3, 'Api token', '[]', 0, '2021-07-06 23:41:56', '2021-07-06 23:41:56', '2022-07-07 05:11:56'),
('733dec180193e8e39178cf8a2ba8f74627bfee0c1e1c5c7c59f00904cb3b6c843d470cffdf717375', 2, 3, 'Api token', '[]', 0, '2021-07-04 22:22:19', '2021-07-04 22:22:19', '2022-07-05 03:52:19'),
('769268ce32ebdb8a4e56b3cbfc3e8be5940f8223ee222164af78a3c5c3afa0a02ed15b9a3ded59c8', 4, 3, 'Api token', '[]', 0, '2021-07-08 04:32:38', '2021-07-08 04:32:38', '2022-07-08 10:02:38'),
('7791fece2a010f444843f0549ec6fccb3530340b3e2d9d94aa39a0a80cf894f923b7fced5da696a1', 2, 3, 'Api token', '[]', 0, '2021-07-05 06:46:09', '2021-07-05 06:46:09', '2022-07-05 12:16:09'),
('7ab8022f5eedd6a85a5b839e53addea48f0cf96390bf955f87487d3522a4e0bb2c07b1d0a5849464', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:47:13', '2021-06-29 23:47:13', '2022-06-30 05:17:13'),
('84a79fa18edd454a42b2ba5d5c94d4dc38d96fa09b2676657dff9307cc43cdbdaffba2a63d96ae24', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:22:25', '2021-06-29 23:22:25', '2022-06-30 04:52:25'),
('8b801bc48bd2a02350f902523449f381108f008a65aed8597a768f68e6a7ae4c3a49ad3fe40f5dd3', 55, 3, 'Api token', '[]', 0, '2021-07-08 01:48:24', '2021-07-08 01:48:24', '2022-07-08 07:18:24'),
('8d81c613b58a8fe665c8cda4f336e49fcd0aee14488e75a9b89284ede1318acb2278d272fd58e926', 2, 3, 'Api token', '[]', 0, '2021-07-05 06:50:39', '2021-07-05 06:50:39', '2022-07-05 12:20:39'),
('9180573d1c38bfacc4bc72cf88bd1eb750598c72748bb2b03d6f61a49aeedc2716bbabb506b6dac7', 2, 3, 'Api token', '[]', 0, '2021-07-02 01:53:53', '2021-07-02 01:53:53', '2022-07-02 07:23:53'),
('92d460c212ae509763d564e202acae42b0ba295ea882ff54f14875b3af5ca6001d9a1e16ac11557d', 2, 3, 'Api token', '[]', 0, '2021-07-07 07:21:12', '2021-07-07 07:21:12', '2022-07-07 12:51:12'),
('963a9021a3ba567d6c53e55c07aadb23bf3e36b68bd1543ed054abadbe21df2657f3814c5f715a23', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:57:03', '2021-06-29 23:57:03', '2022-06-30 05:27:03'),
('9b7b4fedbc55ff8e7efd07d13f5d4c33fd9b985fb404ffc4d3eceaf92478f1c5d9b5227dbf78bc07', 4, 3, 'Api token', '[]', 0, '2021-07-08 06:59:16', '2021-07-08 06:59:16', '2022-07-08 12:29:16'),
('9cc25d63e1de071c86b0a89d65dbcb3ffd2396c7556a3001e14b23f951cd109cad48ef42268634b9', 55, 3, 'Api token', '[]', 0, '2021-07-08 01:48:50', '2021-07-08 01:48:50', '2022-07-08 07:18:50'),
('a1b4a071e4ed131b03e124a9d7a654c118ff240c550ec568a8cc43f9efe4e9bfa3651f7df9ede4a0', 1, 3, 'Api token', '[]', 0, '2021-06-30 02:27:39', '2021-06-30 02:27:39', '2022-06-30 07:57:39'),
('a7a91e692c6627c2f35f5b30d284c2577fb72c68c7ed1fb92e4153651751059b4db3e5be1f83c5e2', 2, 3, 'Api token', '[]', 0, '2021-07-05 06:46:41', '2021-07-05 06:46:41', '2022-07-05 12:16:41'),
('a99d54a9aac93ec1fdbae3177b03daa605c701b6e08e37adfadb4f9e91b45eb7ac09c7e2d2730ecd', 2, 3, 'Api token', '[]', 0, '2021-07-05 06:37:31', '2021-07-05 06:37:31', '2022-07-05 12:07:31'),
('ad4c8efea035b62ea7518a4f0862999144a803d959d049686371b43a2946cb5a239322646a7f7f30', 1, 3, 'Api token', '[]', 0, '2021-07-07 01:49:00', '2021-07-07 01:49:00', '2022-07-07 07:19:00'),
('af1266cb390a5eb3b34e00ec7b608c59ca93e0e0d20683309ffa552efbcd40934cdbba2203fdca8f', 1, 3, 'Api token', '[]', 0, '2021-07-06 22:25:00', '2021-07-06 22:25:00', '2022-07-07 03:55:00'),
('b37e41046e10d9a31b6608c54fc906f382f470e6c49402e5a98a150295f6c010ffa9093f64c58e80', 1, 3, 'Api token', '[]', 0, '2021-07-05 06:36:48', '2021-07-05 06:36:48', '2022-07-05 12:06:48'),
('bd210b7109fc24defac87f5e750600dab40d356c74eee76e352931ea946ea09c5c1ceec0cff6032a', 2, 3, 'Api token', '[]', 0, '2021-07-08 05:00:40', '2021-07-08 05:00:40', '2022-07-08 10:30:40'),
('bdbb9ea8f8460368b2aa276ae890ae95bcd1d0a9b85df2d9df76b62f14949c39dacf883f5924d464', 4, 3, 'Api token', '[]', 0, '2021-07-05 06:59:14', '2021-07-05 06:59:14', '2022-07-05 12:29:14'),
('bfca4c3115df9e6f41b487cdc73bd53d0db10e802bc1f47a3f3302cc33274dfe3c8951d65db076fc', 1, 3, 'Api token', '[]', 0, '2021-07-01 22:07:15', '2021-07-01 22:07:15', '2022-07-02 03:37:15'),
('d2cd4230d130e01b5b162f10fec3438c0e16adc34132cf0ebf794064f653bb6ab91653b99543ba00', 2, 3, 'Api token', '[]', 0, '2021-07-01 22:40:43', '2021-07-01 22:40:43', '2022-07-02 04:10:43'),
('d912f2fb6b1911e490432f41ee4c66dc7c8c9d42443ce520c6149688e1ee5f48dfa1318c15a74258', 53, 3, 'Api token', '[]', 0, '2021-07-08 01:47:25', '2021-07-08 01:47:25', '2022-07-08 07:17:25'),
('dcaf57976c3ff3bcc4bade44bee2d744e553dc38f33f82fcf356156c70bd9ec7c1dd792472e664dd', 2, 3, 'Api token', '[]', 0, '2021-07-04 23:51:30', '2021-07-04 23:51:30', '2022-07-05 05:21:30'),
('e4f834e5b74a86c736a289a061f16c23f1c0697a110c30217b193c679639c90275c75e7f620aaed1', 2, 3, 'Api token', '[]', 0, '2021-07-01 23:09:04', '2021-07-01 23:09:04', '2022-07-02 04:39:04'),
('e676fa90cedb9aa03772ba2ce4ba1ac504ebc7aee5794121044f44c70026667e32d81732fe8de064', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:20:45', '2021-06-29 23:20:45', '2022-06-30 04:50:45'),
('e944de30d982137c14e7bccc10ac15c08cb9e9749db77fdc4bf6f33c5a6a9fd128b4a5ab4ca69a88', 2, 3, 'Api token', '[]', 0, '2021-07-05 07:02:19', '2021-07-05 07:02:19', '2022-07-05 12:32:19'),
('ea2a50af53adea1a43af806bd06d523692906ba59a4713d618a195ad1a06db76b39cec64314a5f0a', 4, 3, 'Api token', '[]', 0, '2021-07-08 01:39:53', '2021-07-08 01:39:53', '2022-07-08 07:09:53'),
('eeca88ae394badb9aadec2dcfa32d8aeda535861e1e41fea9927a5ff0002fea205b064d923280ebe', 1, 1, 'Api token', '[]', 0, '2021-06-29 23:16:37', '2021-06-29 23:16:37', '2022-06-30 04:46:37'),
('f26e4fbfc67b252271894b6a4dafda37e70ff4bffdff60e356a9515d13a6bd693819ec1909d261fe', 1, 3, 'Api token', '[]', 0, '2021-07-02 01:41:03', '2021-07-02 01:41:03', '2022-07-02 07:11:03'),
('f2ef53a3d5dda7cdbecca248b6d1c8db0be89319e68e4259a48761c1e6dcde656dfbb5d47224625c', 1, 3, 'Api token', '[]', 0, '2021-07-06 07:31:33', '2021-07-06 07:31:33', '2022-07-06 13:01:33'),
('f6eb118664305e72f1978c9cc817ced4e681e1b5f3cdf1a7ac458cdc72e7750243de7a97569dbcc3', 2, 3, 'Api token', '[]', 0, '2021-07-01 22:30:58', '2021-07-01 22:30:58', '2022-07-02 04:00:58'),
('fd708f2554cb8a31abf43b5c023fb60f7bfc248c1a62c308eb8809d27dd9630c2d0468a5208e3658', 1, 3, 'Api token', '[]', 0, '2021-06-30 03:54:35', '2021-06-30 03:54:35', '2022-06-30 09:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'oq2PgHvi18wey24MPE9za9qekpYmzLMrj8sS1z4X', NULL, 'http://localhost', 1, 0, 0, '2021-06-29 23:04:24', '2021-06-29 23:04:24'),
(2, NULL, 'Laravel Password Grant Client', 'HJ0RSOMhbhGhJVx4jHcryhwBpvQ2ftGZ5bSsrCjl', 'users', 'http://localhost', 0, 1, 0, '2021-06-29 23:04:25', '2021-06-29 23:04:25'),
(3, NULL, 'Laravel Personal Access Client', 'MxAPyEuNtvDTDT5g050CwPmanq5SEftIke57IMVH', NULL, 'http://localhost', 1, 0, 0, '2021-06-30 02:27:11', '2021-06-30 02:27:11'),
(4, NULL, 'Laravel Password Grant Client', 'ZMVd4GkN0r7HgwOrsdQfymdge9E2IhJpHTJIe4UO', 'users', 'http://localhost', 0, 1, 0, '2021-06-30 02:27:11', '2021-06-30 02:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-06-29 23:04:25', '2021-06-29 23:04:25'),
(2, 3, '2021-06-30 02:27:11', '2021-06-30 02:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', NULL, '$2y$10$itF0q7kRaxgo8VwV//KHReQhBSaFqBpvf2E.wXK7iKW1gXz2otEe.', NULL, NULL, NULL),
(2, 'Milind Solanki', 'millsolanki6199@gmail.com', NULL, '$2y$10$1kSC1eAserQknVp1ZQAWsedxs2YA8qxH03XzjOXCZ09Bk8V3zdxsq', NULL, '2021-06-29 01:00:50', '2021-06-29 01:00:50'),
(4, 'Poojan Shah', 'poojans99@gmail.com', NULL, '$2y$10$nRO6YdP8A4kQpMFlajfSqeAA3.DSZCKtHBRHRszt9RnVEgl5yyx4G', NULL, '2021-06-29 01:02:57', '2021-06-29 01:02:57'),
(51, 'Pratham Modi', 'pratham99@gmail.com', NULL, '$2y$10$jAE/gQiZGtaNMiJyQu4RbOx/znRdNmvR/ocCZ4T/zFpuZs8Js0DNW', NULL, '2021-07-08 01:42:09', '2021-07-08 01:42:09'),
(53, 'Tanvi Patel', 'tanvi99@gmail.com', NULL, '$2y$10$9C7h8bFVBG.pTOU19v0a4u96NDAEuHNDIcDgfjKAKYy4Y/TE4i.2G', NULL, '2021-07-08 01:47:25', '2021-07-08 01:47:25'),
(55, 'Parvez Memon', 'parvez95@gmail.com', NULL, '$2y$10$GQqy86oCCVB7aFGkhByHe.vAIZ5.tIfXCsYo2sdoei7NK3TwkeWfu', NULL, '2021-07-08 01:48:24', '2021-07-08 01:48:24');

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
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_categories`
--
ALTER TABLE `movie_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_categories_fkmovie_id_foreign` (`fkmovie_id`),
  ADD KEY `movie_categories_fkcat_id_foreign` (`fkcat_id`);

--
-- Indexes for table `movie_tickets`
--
ALTER TABLE `movie_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_tickets_fkmovie_id_foreign` (`fkmovie_id`),
  ADD KEY `movie_tickets_fkuser_id_foreign` (`fkuser_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `movie_categories`
--
ALTER TABLE `movie_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `movie_tickets`
--
ALTER TABLE `movie_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_categories`
--
ALTER TABLE `movie_categories`
  ADD CONSTRAINT `movie_categories_fkcat_id_foreign` FOREIGN KEY (`fkcat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_categories_fkmovie_id_foreign` FOREIGN KEY (`fkmovie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_tickets`
--
ALTER TABLE `movie_tickets`
  ADD CONSTRAINT `movie_tickets_fkmovie_id_foreign` FOREIGN KEY (`fkmovie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `movie_tickets_fkuser_id_foreign` FOREIGN KEY (`fkuser_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
