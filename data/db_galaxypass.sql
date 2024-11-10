-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Nov 2024 pada 10.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_galaxypass3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`username`, `password`, `nama`) VALUES
('admin', '123', 'Admin 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_harga`
--

CREATE TABLE `tb_harga` (
  `id_harga` int(11) NOT NULL,
  `harga_anak` int(11) NOT NULL,
  `harga_dewasa` int(11) NOT NULL,
  `hari` set('Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_harga`
--

INSERT INTO `tb_harga` (`id_harga`, `harga_anak`, `harga_dewasa`, `hari`) VALUES
(1, 25000, 35000, 'Selasa,Rabu,Kamis,Jumat'),
(2, 40000, 50000, 'Sabtu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal_khusus`
--

CREATE TABLE `tb_jadwal_khusus` (
  `id_jadwal_khusus` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `harga_khusus_anak` int(11) DEFAULT NULL,
  `harga_khusus_dewasa` int(11) DEFAULT NULL,
  `status` enum('aktif','libur') NOT NULL DEFAULT 'aktif',
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_jadwal_khusus`
--

INSERT INTO `tb_jadwal_khusus` (`id_jadwal_khusus`, `id_jadwal`, `tgl_mulai`, `tgl_selesai`, `jam_mulai`, `jam_selesai`, `harga_khusus_anak`, `harga_khusus_dewasa`, `status`, `keterangan`) VALUES
(1, 1, '2024-11-11', '2024-11-14', NULL, NULL, NULL, NULL, 'libur', NULL),
(2, 6, '2024-11-23', '2024-11-23', '15:00:00', '16:00:00', 50000, 60000, 'aktif', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal_show`
--

CREATE TABLE `tb_jadwal_show` (
  `id_jadwal` int(11) NOT NULL,
  `nama_show` varchar(25) NOT NULL,
  `jam_mulai` time(6) NOT NULL,
  `jam_selesai` time(6) NOT NULL,
  `pengulangan` enum('mingguan') NOT NULL,
  `hari_khusus` set('Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `status` enum('aktif','libur') NOT NULL DEFAULT 'aktif',
  `kapasitas` int(11) NOT NULL,
  `id_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_jadwal_show`
--

INSERT INTO `tb_jadwal_show` (`id_jadwal`, `nama_show`, `jam_mulai`, `jam_selesai`, `pengulangan`, `hari_khusus`, `status`, `kapasitas`, `id_harga`) VALUES
(1, 'Sesi 1', '09:00:00.000000', '10:00:00.000000', 'mingguan', 'Selasa,Rabu,Kamis', 'aktif', 200, 1),
(2, 'Sesi 2', '11:00:00.000000', '12:00:00.000000', 'mingguan', 'Selasa,Rabu,Kamis', 'aktif', 200, 1),
(3, 'Sesi 3', '14:00:00.000000', '13:00:00.000000', 'mingguan', 'Selasa,Rabu,Kamis', 'aktif', 200, 1),
(4, 'Sesi 1', '14:00:00.000000', '15:00:00.000000', 'mingguan', 'Jumat', 'aktif', 200, 1),
(5, 'Sesi 1', '11:00:00.000000', '12:00:00.000000', 'mingguan', 'Sabtu', 'aktif', 200, 2),
(6, 'Sesi 2', '14:00:00.000000', '15:00:00.000000', 'mingguan', 'Sabtu', 'aktif', 200, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran_event`
--

CREATE TABLE `tb_pembayaran_event` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `metode_bayar` enum('cash','transfer') NOT NULL,
  `status_bayar` enum('belum bayar','sudah bayar') NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `bukti_bayar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pembayaran_show`
--

CREATE TABLE `tb_pembayaran_show` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pemesanan` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `metode_bayar` enum('cash','transfer') NOT NULL,
  `status_bayar` enum('belum bayar','sudah bayar') NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `bukti_bayar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemesanan_event`
--

CREATE TABLE `tb_pemesanan_event` (
  `id_pemesanan` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(150) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `nama_user` varchar(150) NOT NULL,
  `no_hp` int(11) NOT NULL,
  `tgl` date DEFAULT NULL,
  `jam_mulai` time(6) DEFAULT NULL,
  `jam_selesai` time(6) DEFAULT NULL,
  `jmlh_orang` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pemesanan_event`
--

INSERT INTO `tb_pemesanan_event` (`id_pemesanan`, `id_event`, `nama_event`, `username`, `nama_user`, `no_hp`, `tgl`, `jam_mulai`, `jam_selesai`, `jmlh_orang`, `total_harga`) VALUES
(1, 1, 'Rukyatul Hilal', 'salma', 'Salma', 812345678, '2024-11-18', '17:00:00.000000', NULL, 4, 140000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemesanan_show`
--

CREATE TABLE `tb_pemesanan_show` (
  `id_pemesanan` int(11) NOT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `id_jadwal_khusus` int(11) DEFAULT NULL,
  `nama_show` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `nama_user` varchar(150) NOT NULL,
  `no_hp` int(11) NOT NULL,
  `nama_instansi` varchar(150) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `jmlh_anak` int(11) DEFAULT NULL,
  `jmlh_dewasa` int(11) DEFAULT NULL,
  `total_awal` int(11) DEFAULT NULL,
  `id_voucher` int(11) DEFAULT NULL,
  `nilai_potongan` decimal(6,2) DEFAULT NULL,
  `total_akhir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pemesanan_show`
--

INSERT INTO `tb_pemesanan_show` (`id_pemesanan`, `id_jadwal`, `id_jadwal_khusus`, `nama_show`, `username`, `nama_user`, `no_hp`, `nama_instansi`, `tgl`, `jam_mulai`, `jam_selesai`, `jmlh_anak`, `jmlh_dewasa`, `total_awal`, `id_voucher`, `nilai_potongan`, `total_akhir`) VALUES
(1, 1, NULL, NULL, NULL, 'Salma', 812345678, 'MA Mu\'allimat', '2024-11-25', '09:00:00', '10:00:00', 150, 10, NULL, NULL, NULL, NULL),
(2, NULL, 2, 'Sesi 2', 'salma', 'Salma', 87654321, NULL, '2024-11-23', '15:00:00', '16:00:00', NULL, 2, 120000, NULL, NULL, 120000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`username`, `password`, `nama`, `email`, `no_hp`) VALUES
('salma', '123', 'Salma', 'sunny@gmail.com', '0812345678910');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_voucher`
--

CREATE TABLE `tb_voucher` (
  `id_voucher` int(11) NOT NULL,
  `kode_voucher` varchar(10) NOT NULL,
  `tipe_potongan` enum('persen','nominal') NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `kuota` int(11) DEFAULT NULL,
  `minimal_pembelian` int(11) DEFAULT NULL,
  `nilai_potongan` decimal(8,2) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_voucher`
--

INSERT INTO `tb_voucher` (`id_voucher`, `kode_voucher`, `tipe_potongan`, `tgl_mulai`, `tgl_selesai`, `kuota`, `minimal_pembelian`, `nilai_potongan`, `keterangan`) VALUES
(1, 'MERDEKA17', 'nominal', '2024-11-10 23:59:59', '2024-11-20 23:59:59', 100, 5, 17000.00, 'Promo Kemerdekaan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tb_harga`
--
ALTER TABLE `tb_harga`
  ADD PRIMARY KEY (`id_harga`);

--
-- Indeks untuk tabel `tb_jadwal_khusus`
--
ALTER TABLE `tb_jadwal_khusus`
  ADD PRIMARY KEY (`id_jadwal_khusus`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Indeks untuk tabel `tb_jadwal_show`
--
ALTER TABLE `tb_jadwal_show`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_harga` (`id_harga`);

--
-- Indeks untuk tabel `tb_pembayaran_event`
--
ALTER TABLE `tb_pembayaran_event`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indeks untuk tabel `tb_pembayaran_show`
--
ALTER TABLE `tb_pembayaran_show`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indeks untuk tabel `tb_pemesanan_event`
--
ALTER TABLE `tb_pemesanan_event`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `username` (`username`);

--
-- Indeks untuk tabel `tb_pemesanan_show`
--
ALTER TABLE `tb_pemesanan_show`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `username` (`username`),
  ADD KEY `id_voucher` (`id_voucher`),
  ADD KEY `id_jadwal_khusus` (`id_jadwal_khusus`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tb_voucher`
--
ALTER TABLE `tb_voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_harga`
--
ALTER TABLE `tb_harga`
  MODIFY `id_harga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal_khusus`
--
ALTER TABLE `tb_jadwal_khusus`
  MODIFY `id_jadwal_khusus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal_show`
--
ALTER TABLE `tb_jadwal_show`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_pembayaran_event`
--
ALTER TABLE `tb_pembayaran_event`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pembayaran_show`
--
ALTER TABLE `tb_pembayaran_show`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pemesanan_event`
--
ALTER TABLE `tb_pemesanan_event`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_pemesanan_show`
--
ALTER TABLE `tb_pemesanan_show`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_voucher`
--
ALTER TABLE `tb_voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jadwal_khusus`
--
ALTER TABLE `tb_jadwal_khusus`
  ADD CONSTRAINT `tb_jadwal_khusus_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal_show` (`id_jadwal`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jadwal_show`
--
ALTER TABLE `tb_jadwal_show`
  ADD CONSTRAINT `tb_jadwal_show_ibfk_1` FOREIGN KEY (`id_harga`) REFERENCES `tb_harga` (`id_harga`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran_event`
--
ALTER TABLE `tb_pembayaran_event`
  ADD CONSTRAINT `tb_pembayaran_event_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `tb_pemesanan_event` (`id_pemesanan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pembayaran_show`
--
ALTER TABLE `tb_pembayaran_show`
  ADD CONSTRAINT `tb_pembayaran_show_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `tb_pemesanan_show` (`id_pemesanan`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pemesanan_event`
--
ALTER TABLE `tb_pemesanan_event`
  ADD CONSTRAINT `tb_pemesanan_event_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tb_user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_event_ibfk_2` FOREIGN KEY (`id_event`) REFERENCES `tb_jadwal_event` (`id_event`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pemesanan_show`
--
ALTER TABLE `tb_pemesanan_show`
  ADD CONSTRAINT `tb_pemesanan_show_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tb_user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_show_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal_show` (`id_jadwal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_show_ibfk_3` FOREIGN KEY (`id_voucher`) REFERENCES `tb_voucher` (`id_voucher`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_show_ibfk_4` FOREIGN KEY (`id_jadwal_khusus`) REFERENCES `tb_jadwal_khusus` (`id_jadwal_khusus`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
