-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Nov 2024 pada 07.51
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
  `status` enum('aktif','libur') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `tgl_bayar` date NOT NULL,
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
  `tgl_bayar` date NOT NULL,
  `bukti_bayar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemesanan_event`
--

CREATE TABLE `tb_pemesanan_event` (
  `id_pemesanan` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(150) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `no_hp` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jam_mulai` time(6) NOT NULL,
  `jam_selesai` time(6) NOT NULL,
  `jmlh_orang` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemesanan_show`
--

CREATE TABLE `tb_pemesanan_show` (
  `id_pemesanan` int(11) NOT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `id_jadwal_khusus` int(11) DEFAULT NULL,
  `nama_show` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `no_hp` int(11) NOT NULL,
  `nama_instansi` varchar(150) DEFAULT NULL,
  `tgl` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `jmlh_anak` int(11) DEFAULT NULL,
  `jmlh_dewasa` int(11) DEFAULT NULL,
  `total_awal` int(11) NOT NULL,
  `id_voucher` int(11) NOT NULL,
  `nilai_potongan` decimal(6,2) NOT NULL,
  `total_akhir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `nilai_potongan` decimal(6,2) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id_harga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal_khusus`
--
ALTER TABLE `tb_jadwal_khusus`
  MODIFY `id_jadwal_khusus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal_show`
--
ALTER TABLE `tb_jadwal_show`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_pemesanan_show`
--
ALTER TABLE `tb_pemesanan_show`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_voucher`
--
ALTER TABLE `tb_voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jadwal_khusus`
--
ALTER TABLE `tb_jadwal_khusus`
  ADD CONSTRAINT `tb_jadwal_khusus_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal_show` (`id_jadwal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jadwal_khusus_ibfk_2` FOREIGN KEY (`id_jadwal_khusus`) REFERENCES `tb_pemesanan_show` (`id_jadwal_khusus`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `tb_pemesanan_event_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tb_user` (`username`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pemesanan_show`
--
ALTER TABLE `tb_pemesanan_show`
  ADD CONSTRAINT `tb_pemesanan_show_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tb_user` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_show_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal_show` (`id_jadwal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesanan_show_ibfk_3` FOREIGN KEY (`id_voucher`) REFERENCES `tb_voucher` (`id_voucher`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
