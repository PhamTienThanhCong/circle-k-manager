-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 03, 2022 lúc 03:18 AM
-- Phiên bản máy phục vụ: 5.7.33
-- Phiên bản PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `circle-k-manager`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hành chính', 'Phòng hành chính', '2022-07-01 12:24:17', '2022-07-01 12:24:17', NULL),
(2, 'Quận Cầu giấy', 'Cửa hàng quận cầu giấy', '2022-07-01 12:25:53', '2022-07-01 12:25:53', NULL),
(3, 'Quận Hà Đông', 'Cửa hàng quận hà đông', '2022-07-01 12:29:57', '2022-07-01 12:29:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2022_01_12_070952_create_roles_table', 1),
(4, '2022_01_12_071050_create_departments_table', 1),
(5, '2022_01_12_071204_alter_users_table', 1),
(6, '2022_02_09_081604_create_jobs_table', 1),
(7, '2022_07_03_010904_schedule', 2),
(8, '2022_07_03_022753_create_schedules_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Manager', NULL, NULL, NULL),
(2, 'Employee', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `shift` tinyint(4) NOT NULL,
  `day_of_week` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `department_id`, `shift`, `day_of_week`) VALUES
(1, 17, 2, 2, 3),
(5, 4, 2, 1, 2),
(6, 16, 2, 2, 4),
(7, 19, 2, 3, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_day` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_first_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `fullname`, `avatar`, `phone`, `birth_day`, `start_date`, `department_id`, `role_id`, `is_admin`, `is_first_login`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin@gmail.com', NULL, '$2y$10$TobjaWKo5TG0g/zQAcepM.Tyn3Q2X/DNugjhUrRjOupvNphA8Bv4e', 'admin', 'default.png', '0987654321', '2001-01-11 00:00:00', '2021-01-11 00:00:00', 1, 1, 1, 0, 1, NULL, '2022-07-01 12:24:18', '2022-07-01 12:24:18', NULL),
(2, 'quanlyso1@gmail.com', NULL, '$2y$10$mq4sZwqReuhoAG6M.54Fq.0hXUeHKkUMDRHwtXmwikQPN/5CeO0B.', 'Nguyễn Hoài Anh', 'default.png', '0396396331', '2002-12-18 00:00:00', '2022-06-15 00:00:00', 2, 1, 0, 0, 1, NULL, '2022-07-01 12:27:55', '2022-07-01 12:27:55', NULL),
(3, 'quanlyso2@gmail.com', NULL, '$2y$10$Lun/MLbZNOmZtl9QTVO8I.SAle4e7tguUpbfKEU17H/kzYbIUODd6', 'Phạm Tiến Thành Công', 'default.png', '0396396332', '2000-07-26 00:00:00', '2022-06-06 00:00:00', 3, 1, 0, 1, 1, NULL, '2022-07-01 12:31:30', '2022-07-01 12:31:30', NULL),
(4, 'nhanvienso1@gmail.com', NULL, '$2y$10$wwV/5gLD2t5FPec0mGOpyO/K7Sokk7pNJALntZDYHHPJE.xI.k596', 'Nguyễn Thu An', 'default.png', '0396396333', '2002-07-04 00:00:00', '2022-06-05 00:00:00', 2, 2, 0, 0, 1, NULL, '2022-07-01 12:32:28', '2022-07-01 12:32:28', NULL),
(5, 'nhanvien0@gmail.com', NULL, '$2y$10$LS84jG1QEWmJChwOisch.uZCsASdgZQvub4nfUOLsVG7QcflTva6S', 'Nhân viên số: 0', 'default.png', '0987652320', '2001-01-10 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:26', '2022-07-01 19:58:26', NULL),
(6, 'nhanvien1@gmail.com', NULL, '$2y$10$wK7qMUrFvsKhVDOUdina8eh4qdpV.ZQKUUing186xJgJN.RQEFUFS', 'Nhân viên số: 1', 'default.png', '0987652321', '2001-01-11 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:26', '2022-07-01 19:58:26', NULL),
(7, 'nhanvien2@gmail.com', NULL, '$2y$10$00I0aewL8dDtyJ2lSorLbeAGvcYuhXk2Mc.t8f2WoiWLnc9S6TE9q', 'Nhân viên số: 2', 'default.png', '0987652322', '2001-01-12 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:26', '2022-07-01 19:58:26', NULL),
(8, 'nhanvien3@gmail.com', NULL, '$2y$10$0a6kIcvMEPb01D6hDYGE9ebejttnvf6hVdrazFsC2kzsa0vcNR0P.', 'Nhân viên số: 3', 'default.png', '0987652323', '2001-01-13 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:26', '2022-07-01 19:58:26', NULL),
(9, 'nhanvien4@gmail.com', NULL, '$2y$10$elG9AlfKTfODO7F/QUvrauKodCD6AMwsHPLlomAa8yRV2Ohems2.K', 'Nhân viên số: 4', 'default.png', '0987652324', '2001-01-14 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:26', '2022-07-01 19:58:26', NULL),
(10, 'nhanvien5@gmail.com', NULL, '$2y$10$Rc6kFn/gI3hH4q3G/cvzpOw2jKdyffzXCjAsJiSUrNVv9YVANC3Jy', 'Nhân viên số: 5', 'default.png', '0987652325', '2001-01-15 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:27', '2022-07-01 19:58:27', NULL),
(11, 'nhanvien6@gmail.com', NULL, '$2y$10$dw7NtLDP7NBO8/KPBgcSA.9HjeF7RjCNSpBciVkt0buXKlsojZznO', 'Nhân viên số: 6', 'default.png', '0987652326', '2001-01-16 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:27', '2022-07-01 19:58:27', NULL),
(12, 'nhanvien7@gmail.com', NULL, '$2y$10$L2qZT7NMo4pr9b3zyg7rc.6.cnZ3t7j2ujLo/hEYyEo2O.qWNeNpS', 'Nhân viên số: 7', 'default.png', '0987652327', '2001-01-17 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:27', '2022-07-01 19:58:27', NULL),
(13, 'nhanvien8@gmail.com', NULL, '$2y$10$Nl1lx.U0sLEqxDaQv3HATe5dmQkq63m9JTHt4HPNOvyHNp51NWdF2', 'Nhân viên số: 8', 'default.png', '0987652328', '2001-01-18 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:27', '2022-07-01 19:58:27', NULL),
(14, 'nhanvien9@gmail.com', NULL, '$2y$10$LVos0MRYu3rHtKqHzIPs7eXSET68rPJkCaSlBJShan9PyuibE1d9K', 'Nhân viên số: 9', 'default.png', '0987652329', '2001-01-19 00:00:00', '2021-01-11 00:00:00', 3, 2, 0, 1, 1, NULL, '2022-07-01 19:58:27', '2022-07-01 19:58:27', NULL),
(16, 'nhanvien10@gmail.com', NULL, '$2y$10$4.PyltqpcULaItaMK.xGLuysGURsU1C1vOlQZKJyJWz8ZgkcQnpuK', 'Nhân viên số: 10', 'default.png', '0987652310', '2001-01-10 00:00:00', '2021-01-11 00:00:00', 2, 2, 0, 1, 1, NULL, '2022-07-01 20:00:05', '2022-07-01 20:00:05', NULL),
(17, 'nhanvien11@gmail.com', NULL, '$2y$10$HXJgw3C8dVUXaak6jn4mK.E6fTr8Zj/X9mp3O5gw6LHaUEsi0Y3eC', 'Nhân viên số: 11', 'default.png', '0987652311', '2001-01-11 00:00:00', '2021-01-11 00:00:00', 2, 2, 0, 1, 1, NULL, '2022-07-01 20:00:05', '2022-07-01 20:00:05', NULL),
(18, 'nhanvien12@gmail.com', NULL, '$2y$10$i.vi.Ys9pjGzMfSiWhej7.SOwQMkVaUv5u8.oB6IIGX.XEhu/LZMa', 'Nhân viên số: 12', 'default.png', '0987652312', '2001-01-12 00:00:00', '2021-01-11 00:00:00', 2, 2, 0, 1, 1, NULL, '2022-07-01 20:00:05', '2022-07-01 20:00:05', NULL),
(19, 'nhanvien13@gmail.com', NULL, '$2y$10$0Yx7Q6fl4bRubtpQ3O.uguRg0z2y4UBcRlmzLhkEJwFRqQhqSUcJe', 'Nhân viên số: 13', 'default.png', '0987652313', '2001-01-13 00:00:00', '2021-01-11 00:00:00', 2, 2, 0, 1, 1, NULL, '2022-07-01 20:00:06', '2022-07-01 20:00:06', NULL),
(20, 'nhanvien14@gmail.com', NULL, '$2y$10$eVXgQSJ6DvwTRfQ8ULMYgu1kx6.FPxQPfZW0liTK80FEMkvPyMrya', 'Nhân viên số: 14', 'default.png', '0987652314', '2001-01-14 00:00:00', '2021-01-11 00:00:00', 2, 2, 0, 1, 1, NULL, '2022-07-01 20:00:06', '2022-07-01 20:00:06', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_user_id_foreign` (`user_id`),
  ADD KEY `schedules_department_id_foreign` (`department_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
