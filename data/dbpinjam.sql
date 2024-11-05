-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2024 at 02:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpinjam`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `nama`) VALUES
('admin', '123123', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam_ruang`
--

CREATE TABLE `pinjam_ruang` (
  `id_pinjam` int(10) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `nama_pnjm` varchar(200) NOT NULL,
  `instansi` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_pinjam` time(6) NOT NULL,
  `jam_selesai` time(6) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `lampiran` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pinjam_ruang`
--

INSERT INTO `pinjam_ruang` (`id_pinjam`, `id_ruangan`, `nama_pnjm`, `instansi`, `tanggal`, `jam_pinjam`, `jam_selesai`, `keterangan`, `lampiran`, `status`) VALUES
(3, 1003, 'Adika Kaka Saputra', 'HMJ Teknologi Informasi', '2024-06-19', '08:00:00.000000', '14:00:00.000000', 'Acara Talk Show bersama Farhan', '', 'dikembalikan'),
(4, 1006, 'Agung', 'HMJ Teknologi Informasi', '2024-06-21', '06:00:00.000000', '20:00:00.000000', 'Puncak Acara Swicth Fest prodi teknologi Informasi Tahun 2024', '', 'ditolak'),
(5, 1005, 'asdadsa', 'dfsdvsd', '2024-06-20', '04:30:00.000000', '20:31:00.000000', 'sdds', '667316af06bd8-audit1.jpg', 'ditolak'),
(6, 1004, 'Fiashinta Dewi', 'HMJ Teknologi Infromasi', '2024-06-21', '08:00:00.000000', '13:00:00.000000', 'Rapat ', '66732824aa3ed-استغاثة_copy.pdf', 'dikembalikan'),
(7, 1008, 'Iklil', 'Dosen TI', '2024-07-08', '08:49:00.000000', '14:49:00.000000', 'Seminar', '6673365b292e5-34. DIVANA TARICHA SALMALINA_UAS TAT.pdf', 'dikembalikan'),
(8, 1003, 'Dina Rahma Prasilda', 'GDSC UIN Walisongo Semarang', '2024-06-24', '06:00:00.000000', '14:00:00.000000', 'Pengangkatan dan Peresmian Ketua GDSC UIN Walisngo Semarang yang baru', '6673a75a8220c-1861-4642-1-PB.pdf', 'ditolak'),
(9, 1004, 'asdsa', 'asdadas', '2024-06-18', '12:18:00.000000', '16:18:00.000000', 'dasda', '6673adb63c5ba-CV DIVANA TARICHA SALMALINA (TI).pdf', 'dikembalikan'),
(10, 1004, 'Dian', 'Dosen TI', '2024-06-21', '13:29:00.000000', '16:29:00.000000', 'Seminar', '6673cc720512a-GAMBAR ERD dan LRS SISTEM INFORMASI PEMBELIAN TIKET BIOSKOP ONLINE KEL. 9.pdf', 'dikembalikan'),
(11, 1004, 'Dian', 'Dosen TI', '2024-06-18', '13:00:00.000000', '16:00:00.000000', 'Seminar', '6673d11377df7-1861-4642-1-PB.pdf', 'dikembalikan'),
(12, 1004, 'Alvina', 'Dosen TI', '2024-06-26', '08:07:00.000000', '13:07:00.000000', 'Seminar', '6673d54d5dbf8-cover.pdf', 'disetujui'),
(13, 1012, 'Talita Salsabila', 'GDSC UIN Walisongo Semarang', '2024-07-17', '08:00:00.000000', '13:00:00.000000', 'Seminar GDSC', '6673ebdca32ed-kwitansi RS.pdf', 'disetujui'),
(14, 1001, 'Talita Salsabila', 'GDSC UIN Walisongo Semarang', '2024-06-27', '16:40:00.000000', '18:40:00.000000', 'Seminar GDSC', '6673f917c79ba-planet.jpg', 'ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `gambar_ruangan` varchar(200) NOT NULL,
  `nama_ruangan` varchar(200) NOT NULL,
  `kapasitas` varchar(200) NOT NULL,
  `lokasi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `gambar_ruangan`, `nama_ruangan`, `kapasitas`, `lokasi`) VALUES
(1001, '667342ac7be06-audit1.jpg', 'Auditorium 1', '500 orang', 'Kampus I UIN Walisongo Semarang'),
(1002, '667342b7027ee-audit2.png', 'Auditorium 2', '1000 orang', 'Kampus III UIN Walisongo Semarang'),
(1003, '667342c2855ef-fst.jpeg', 'Theater ISDB FST', '100 orang', 'Gedung ISDB Fakultas Sains dan Teknologi'),
(1004, '667342cf4ec99-fsh.jpeg', 'Teater ISDB FSH', '100 orang', 'Gedung ISDB Fakultas Syariah dan Hukum'),
(1005, '667342d9d31cb-soshum.jpeg', 'Teater ISDB SOSHUM', '100 orang', 'Gedung ISDB SOSHUM'),
(1006, '667342e62114b-gsg.jpeg', 'Gedung Serba Guna', '1000 orang', 'Kampus III UIN Walisongo Semarang'),
(1007, '667342ef645ac-rektorat.jpg', 'Teater Rektorat', '200 orang', 'Gedung Rektorat UIN Walisongo semarang'),
(1008, '66734303c0703-planet.jpg', 'Teater Planetarium', '200 orang', 'Gedung Planetarium Kampus III UIN Walisongo Semarang'),
(1012, '6673430e5baa5-perpus.jpeg', 'Theater Perpustakaan', '100 Orang', 'Kampus III UIN Walisongo Semarang');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`) VALUES
('2208096013', '2208096013', 'Talita Salsabila'),
('2208096015', '2208096015', 'Alvina Avidatu'),
('2208096017', '2208096017', 'Adika Kaka'),
('2208096034', '2208096034', 'Divana Taricha Salmalina'),
('2208096037', '2208096037', 'Talitha Rahayu '),
('2208096038', '2208096038', 'Adinda Noor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pinjam_ruang`
--
ALTER TABLE `pinjam_ruang`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_ruangan` (`id_ruangan`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pinjam_ruang`
--
ALTER TABLE `pinjam_ruang`
  MODIFY `id_pinjam` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1013;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
