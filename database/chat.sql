-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 17 Agu 2020 pada 14.08
-- Versi server: 5.7.21
-- Versi PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(10) DEFAULT NULL,
  `id_sendTo` int(10) DEFAULT NULL,
  `messages` text,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`,`id_sendTo`),
  KEY `id_sendTo` (`id_sendTo`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `messages`
--

INSERT INTO `messages` (`id`, `id_users`, `id_sendTo`, `messages`, `read_at`, `created_at`, `updated_at`) VALUES
(210, 53, 52, 'Helo alif', '2020-08-04 15:04:15', '2020-08-04 14:45:32', '2020-08-04 14:45:32'),
(211, 52, 53, 'Oke im fine', '2020-08-04 15:11:04', '2020-08-04 15:05:41', '2020-08-04 15:05:41'),
(212, 53, 52, 'Nice ', '2020-08-04 15:27:23', '2020-08-04 15:11:09', '2020-08-04 15:11:09'),
(213, 53, 52, 'Oke', '2020-08-05 07:45:40', '2020-08-04 15:58:52', '2020-08-04 15:58:52'),
(214, 53, 52, 'Hey buddy', '2020-08-05 07:45:40', '2020-08-05 03:02:04', '2020-08-05 03:02:04'),
(215, 53, 52, 'Unread', '2020-08-05 07:45:40', '2020-08-05 05:57:16', '2020-08-05 05:57:16'),
(216, 53, 52, 'Hello', '2020-08-05 07:45:40', '2020-08-05 05:58:05', '2020-08-05 05:58:05'),
(217, 53, 52, 'Hallo', '2020-08-05 07:45:40', '2020-08-05 06:01:04', '2020-08-05 06:01:04'),
(218, 53, 52, 'Halo', '2020-08-05 07:45:40', '2020-08-05 06:02:09', '2020-08-05 06:02:09'),
(219, 53, 52, 'No error?', '2020-08-05 07:45:40', '2020-08-05 06:02:19', '2020-08-05 06:02:19'),
(220, 52, 53, 'No error', '2020-08-05 11:54:03', '2020-08-05 07:45:44', '2020-08-05 07:45:44'),
(221, 52, 53, 'Yes', '2020-08-05 11:54:03', '2020-08-05 07:45:51', '2020-08-05 07:45:51'),
(222, 52, 59, 'Halo meta ', '2020-08-05 08:13:09', '2020-08-05 07:58:37', '2020-08-05 07:58:37'),
(223, 66, 52, 'Hallo alifki', '2020-08-05 12:01:37', '2020-08-05 12:00:59', '2020-08-05 12:00:59'),
(224, 52, 66, 'Hallo', '2020-08-17 12:44:42', '2020-08-05 12:01:41', '2020-08-05 12:01:41'),
(225, 52, 66, 'Hello', '2020-08-17 12:44:42', '2020-08-05 12:49:54', '2020-08-05 12:49:54'),
(226, 52, 66, 'Hello', '2020-08-17 12:44:42', '2020-08-05 12:52:33', '2020-08-05 12:52:33'),
(227, 52, 59, 'Punya ku masih deket deket jadi blum ketahuan ', '2020-08-06 02:24:32', '2020-08-05 13:02:58', '2020-08-05 13:02:58'),
(228, 52, 59, 'Hey thee', '2020-08-06 02:24:32', '2020-08-05 13:04:22', '2020-08-05 13:04:22'),
(229, 52, 53, 'Hello', '2020-08-05 13:34:53', '2020-08-05 13:21:45', '2020-08-05 13:21:45'),
(230, 53, 52, 'hi', '2020-08-05 13:35:01', '2020-08-05 13:34:58', '2020-08-05 13:34:58'),
(231, 52, 53, 'Helo', '2020-08-05 13:35:05', '2020-08-05 13:35:05', '2020-08-05 13:35:05'),
(232, 53, 52, 'helll', '2020-08-05 13:35:16', '2020-08-05 13:35:16', '2020-08-05 13:35:16'),
(233, 52, 53, 'Really?', '2020-08-05 13:37:22', '2020-08-05 13:35:31', '2020-08-05 13:35:31'),
(234, 52, 66, 'Test msg', '2020-08-17 12:44:42', '2020-08-06 00:09:19', '2020-08-06 00:09:19'),
(235, 59, 52, 'nice to talk to you', '2020-08-06 02:25:18', '2020-08-06 02:24:49', '2020-08-06 02:24:49'),
(236, 52, 59, 'yess', '2020-08-06 02:25:23', '2020-08-06 02:25:23', '2020-08-06 02:25:23'),
(237, 52, 59, 'whats app', '2020-08-06 02:25:50', '2020-08-06 02:25:43', '2020-08-06 02:25:43'),
(238, 59, 52, 'oke nice', '2020-08-06 02:26:01', '2020-08-06 02:25:57', '2020-08-06 02:25:57'),
(239, 73, 52, 'hello', '2020-08-06 07:42:05', '2020-08-06 07:41:56', '2020-08-06 07:41:56'),
(240, 52, 73, 'Iya', '2020-08-06 07:42:11', '2020-08-06 07:42:11', '2020-08-06 07:42:11'),
(241, 73, 52, 'new', '2020-08-06 07:44:53', '2020-08-06 07:42:27', '2020-08-06 07:42:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_15_070159_create_messages_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `relations`
--

DROP TABLE IF EXISTS `relations`;
CREATE TABLE IF NOT EXISTS `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `id_friends` int(11) NOT NULL,
  `acc_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_users` (`id_users`,`id_friends`),
  KEY `id_friends` (`id_friends`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `relations`
--

INSERT INTO `relations` (`id`, `id_users`, `id_friends`, `acc_at`, `created_at`, `updated_at`) VALUES
(55, 52, 53, '2020-08-04 10:08:48', '2020-08-04 10:08:21', '2020-08-04 10:08:21'),
(56, 53, 59, '2020-08-04 10:09:44', '2020-08-04 10:09:17', '2020-08-04 10:09:17'),
(57, 59, 52, '2020-08-04 10:10:29', '2020-08-04 10:09:57', '2020-08-04 10:09:57'),
(61, 66, 52, '2020-08-05 11:56:43', '2020-08-05 11:43:39', '2020-08-05 11:43:39'),
(62, 66, 53, '2020-08-05 11:56:07', '2020-08-05 11:53:20', '2020-08-05 11:53:20'),
(64, 52, 54, '2020-08-05 14:29:33', '2020-08-05 14:28:46', '2020-08-05 14:28:46'),
(66, 52, 73, '2020-08-06 07:41:23', '2020-08-06 07:40:52', '2020-08-06 07:40:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile.jpg',
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Hii There I use Flarachat now!!',
  `loc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '{"lat":0,"long":0}',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `bio`, `loc`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(52, 'ALIFKHI MJ', 'alifki81@gmail.com', '5340324667911691_IMG_20200718_172801_026.jpg', 'Hii There I use Flarachat now!! buddy', '{\"lat\":-7.391406666666668,\"long\":109.88212}', NULL, '$2b$10$hOvUfeLE0ABpfDFFSUCy8.LBLBd5BLtQEojNAVAIegof27ya4.99q', NULL, '2020-07-27 12:46:39', '2020-08-17 12:49:17'),
(53, 'Flarista', 'flarista@gmail.com', '1944184348647344_1c869110-c62b-4b72-8bd9-58fc1c72139b.jpeg', 'Hi!! Im Model and Designers', '{\"lat\":-6.3277663,\"long\":106.7228517}', NULL, '$2b$10$4Uc8ws9VYZ37Lc7B2h3hDuRlHhvD5J4v8oRdgg8.vJx9U12jHiKKW', NULL, '2020-07-27 12:53:04', '2020-08-05 07:26:53'),
(54, 'Bot', 'bot@gmail.com', '4329931869455300_00002.jpg', 'Hii There I use Flarachat now!!', '{\"lat\":-7.3913850000000005,\"long\":109.88206333333333}', NULL, '$2b$10$aOT7OMSyv7ejjGxxymT8uuqmJkbcZkE6.HJiMmVsC96VzJmTmuZ7y', NULL, '2020-07-27 14:18:16', '2020-08-05 14:30:46'),
(58, 'John Doe', 'user2@gmail.com', '2693579023575855_images (12).jpeg', 'Hii There I use Flarachat now!!', '{\"lat\":-7.391565000000001,\"long\":109.882085}', NULL, '$2b$10$IgjGaqHDdG4WJbu56H7/P.Pkirl3YeaqWeiv6e/dLprZ4yFv29yau', NULL, '2020-07-29 06:46:20', '2020-07-29 06:46:20'),
(59, 'Meta Al araf', 'metaalaraf@gmail.com', '9944460439813374_FB_IMG_15956019535805955.jpg', 'Hii There I use Flarachat now!! yes Helo', '{\"lat\":33.985805,\"long\":-118.25411166666666}', NULL, '$2b$10$b34.oZgjTe3cqjvtuqoP4eRCARxjzRtTecqbINvUGcELqA.a7RGf2', NULL, '2020-07-29 19:09:03', '2020-08-06 06:29:48'),
(61, 'NewUser', 'anisa@gmail.com', 'profile.jpg', 'Hii There I use Flarachat now!!', '{\"lat\":-7.391455,\"long\":109.88210499999998}', NULL, '$2b$10$lS/MQzP9LBr/mHTRifvtZuxawY2Q1s8B.YpMWDkkOAr5ABSi/g6q.', NULL, '2020-07-30 02:09:18', '2020-07-30 02:09:18'),
(62, 'Test', 'test@gmail.com', '5278976044405799_IMG_20200713_200731_763.jpg', 'Hii There I use Flarachat now! hello', '{\"lat\":0,\"long\":0}', NULL, '$2b$10$s68tRQaagEM6IpyZJtKQCuzA6WLsZqcWZ6hwqbzbJwVOlSuqd82bq', NULL, '2020-07-30 03:32:08', '2020-07-30 03:32:08'),
(66, 'Sabrina', 'sabrina@gmail.com', '0475008152297972_crop_image.jpg', 'Hii There I use Flarachat now!!', '{\"lat\":-7.391468333333334,\"long\":109.88216333333334}', NULL, '$2b$10$Ukyfq9mvqf/HbqVAxEv9.OIhrsls1IokKuDixWiBBEBa3spJgNTly', NULL, '2020-08-05 11:35:48', '2020-08-17 12:45:58'),
(72, 'asem', 'asem@gmail.com', 'profile.jpg', 'Hii There I use Flarachat now!!', '{\"lat\":0,\"long\":0}', NULL, '$2b$10$ewquLnGeAc7E6DsS68MkiuxcHfFZaKKt67xFJzDmP.aqNM9BqRhEG', NULL, '2020-08-06 07:03:46', '2020-08-06 07:03:46'),
(73, 'newUser', 'new@gmail.com', 'profile.jpg', 'Hii There I use Flarachat now!!', '{\"lat\":33.985805,\"long\":-118.25411166666666}', NULL, '$2b$10$XOeGwt3eyF0yur8Rgr8yleIY/KH2Boc51pCcXU9xs6sa5zTXdaJri', NULL, '2020-08-06 07:38:37', '2020-08-06 07:52:24');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`id_sendTo`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_ibfk_2` FOREIGN KEY (`id_friends`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
