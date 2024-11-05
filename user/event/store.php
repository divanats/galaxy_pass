<?php
session_start();
require_once '../../helper/connection.php';

// Ambil data dari form
$id_event = $_POST['id_event']; // Pastikan nama input di form sesuai
$nama = $_POST['nama']; // Nama pemesan
$tanggal = $_POST['tanggal_pesan']; // Tanggal pemesanan (diisi otomatis)
$jumlah_orang = $_POST['jumlah_pesan']; // Jumlah orang

// Ambil username dari sesi login
if (isset($_SESSION['login'])) {
    $username = $_SESSION['login'];
} else {
    // Jika user tidak login, arahkan kembali ke halaman login
    header("Location: ../auth/login.php");
    exit;
}

// Simpan data ke dalam tabel pemesanan_event
$query = "INSERT INTO pemesanan_event (nama, tanggal_pesan, jumlah_pesan, id_event, username) 
          VALUES ('$nama', '$tanggal', '$jumlah_orang', '$id_event', '$username')";

// Eksekusi query
$result = mysqli_query($connection, $query);

if ($result) {
    // Jika berhasil, simpan pesan sukses di sesi
    $_SESSION['info'] = [
        'status' => 'success',
        'message' => 'Pemesanan berhasil disimpan!'
    ];
    header("Location: ./index.php");
} else {
    // Jika gagal, simpan pesan error di sesi
    $_SESSION['info'] = [
        'status' => 'failed',
        'message' => mysqli_error($connection)
    ];
    header("Location: ./index.php");
}
?>
