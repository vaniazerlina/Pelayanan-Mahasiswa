-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2023 pada 10.17
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `niu_admin` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`niu_admin`, `username`, `name`, `password`, `created_at`, `updated_at`) VALUES
('19920616201502162001', 'Admin 123', 'Nindy Malisha, SE', '$2b$10$dzS7bMats4G9qihKOuFsDudFn38nedIg4VbBNLOUCA2MTTai82xcu', '2023-12-08 13:54:10', '2023-12-17 08:48:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nip_dosen` varchar(20) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama_mahasiswa` varchar(30) NOT NULL,
  `departemen` varchar(30) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_izin_kp`
--

CREATE TABLE `pengajuan_izin_kp` (
  `no_surat_izin_kp` int(11) NOT NULL,
  `nim_mahasiswa1` varchar(10) NOT NULL,
  `nim_mahasiswa2` varchar(10) DEFAULT NULL,
  `nim_mahasiswa3` varchar(10) DEFAULT NULL,
  `nim_mahasiswa4` varchar(10) DEFAULT NULL,
  `nim_mahasiswa5` varchar(10) DEFAULT NULL,
  `instansi_tujuan` varchar(100) NOT NULL,
  `penerima_surat` varchar(100) NOT NULL,
  `tanggal_mulai_kp` date NOT NULL,
  `tanggal_selesai_kp` date NOT NULL,
  `departemen` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  `file_izin_kp` varchar(255) DEFAULT NULL,
  `niu_admin` varchar(20) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_izin_survey`
--

CREATE TABLE `pengajuan_izin_survey` (
  `no_surat_izin_survey` int(11) NOT NULL,
  `mata_kuliah` varchar(100) NOT NULL,
  `nim_mahasiswa1` varchar(10) NOT NULL,
  `nim_mahasiswa2` varchar(10) DEFAULT NULL,
  `nim_mahasiswa3` varchar(10) DEFAULT NULL,
  `nim_mahasiswa4` varchar(10) DEFAULT NULL,
  `nim_mahasiswa5` varchar(10) DEFAULT NULL,
  `nim_mahasiswa6` varchar(10) DEFAULT NULL,
  `nim_mahasiswa7` varchar(10) DEFAULT NULL,
  `nim_mahasiswa8` varchar(10) DEFAULT NULL,
  `penerima_tujuan` varchar(100) NOT NULL,
  `nip_dosen` varchar(20) NOT NULL,
  `niu_admin` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `file_izin_survey` varchar(255) DEFAULT NULL,
  `keterangan` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_tugas_kp`
--

CREATE TABLE `pengajuan_tugas_kp` (
  `no_surat_tugas_kp` int(11) NOT NULL,
  `no_surat_izin_kp` int(11) NOT NULL,
  `file_tugas_kp` varchar(255) DEFAULT NULL,
  `niu_admin` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`niu_admin`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip_dosen`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `pengajuan_izin_kp`
--
ALTER TABLE `pengajuan_izin_kp`
  ADD PRIMARY KEY (`no_surat_izin_kp`),
  ADD KEY `nim_mahasiswa1` (`nim_mahasiswa1`),
  ADD KEY `nim_mahasiswa2` (`nim_mahasiswa2`),
  ADD KEY `nim_mahasiswa3` (`nim_mahasiswa3`),
  ADD KEY `nim_mahasiswa4` (`nim_mahasiswa4`),
  ADD KEY `nim_mahasiswa5` (`nim_mahasiswa5`),
  ADD KEY `nip_admin` (`niu_admin`);

--
-- Indeks untuk tabel `pengajuan_izin_survey`
--
ALTER TABLE `pengajuan_izin_survey`
  ADD PRIMARY KEY (`no_surat_izin_survey`),
  ADD KEY `nim_mahasiswa1` (`nim_mahasiswa1`),
  ADD KEY `nim_mahasiswa2` (`nim_mahasiswa2`),
  ADD KEY `nim_mahasiswa3` (`nim_mahasiswa3`),
  ADD KEY `nim_mahasiswa4` (`nim_mahasiswa4`),
  ADD KEY `nim_mahasiswa5` (`nim_mahasiswa5`),
  ADD KEY `nim_mahasiswa6` (`nim_mahasiswa6`),
  ADD KEY `nim_mahasiswa7` (`nim_mahasiswa7`),
  ADD KEY `nim_mahasiswa8` (`nim_mahasiswa8`),
  ADD KEY `nip_admin` (`niu_admin`),
  ADD KEY `nip_dosen` (`nip_dosen`);

--
-- Indeks untuk tabel `pengajuan_tugas_kp`
--
ALTER TABLE `pengajuan_tugas_kp`
  ADD PRIMARY KEY (`no_surat_tugas_kp`),
  ADD KEY `no_surat_izin_kp` (`no_surat_izin_kp`),
  ADD KEY `nip_admin` (`niu_admin`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengajuan_izin_kp`
--
ALTER TABLE `pengajuan_izin_kp`
  MODIFY `no_surat_izin_kp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_izin_survey`
--
ALTER TABLE `pengajuan_izin_survey`
  MODIFY `no_surat_izin_survey` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengajuan_tugas_kp`
--
ALTER TABLE `pengajuan_tugas_kp`
  MODIFY `no_surat_tugas_kp` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengajuan_izin_kp`
--
ALTER TABLE `pengajuan_izin_kp`
  ADD CONSTRAINT `pengajuan_izin_kp_ibfk_1` FOREIGN KEY (`nim_mahasiswa1`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_kp_ibfk_2` FOREIGN KEY (`nim_mahasiswa2`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_kp_ibfk_3` FOREIGN KEY (`nim_mahasiswa3`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_kp_ibfk_4` FOREIGN KEY (`nim_mahasiswa4`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_kp_ibfk_5` FOREIGN KEY (`nim_mahasiswa5`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_kp_ibfk_6` FOREIGN KEY (`niu_admin`) REFERENCES `admin` (`nip_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuan_izin_survey`
--
ALTER TABLE `pengajuan_izin_survey`
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_1` FOREIGN KEY (`nim_mahasiswa1`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_10` FOREIGN KEY (`nip_dosen`) REFERENCES `dosen` (`nip_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_2` FOREIGN KEY (`nim_mahasiswa2`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_3` FOREIGN KEY (`nim_mahasiswa3`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_4` FOREIGN KEY (`nim_mahasiswa4`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_5` FOREIGN KEY (`nim_mahasiswa5`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_6` FOREIGN KEY (`nim_mahasiswa6`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_7` FOREIGN KEY (`nim_mahasiswa7`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_8` FOREIGN KEY (`nim_mahasiswa8`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_izin_survey_ibfk_9` FOREIGN KEY (`niu_admin`) REFERENCES `admin` (`nip_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuan_tugas_kp`
--
ALTER TABLE `pengajuan_tugas_kp`
  ADD CONSTRAINT `pengajuan_tugas_kp_ibfk_1` FOREIGN KEY (`no_surat_izin_kp`) REFERENCES `pengajuan_izin_kp` (`no_surat_izin_kp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengajuan_tugas_kp_ibfk_2` FOREIGN KEY (`niu_admin`) REFERENCES `admin` (`nip_admin`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
