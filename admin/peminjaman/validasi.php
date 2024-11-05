<?php
session_start(); // Pastikan session_start() dipanggil di awal
require_once '../../helper/connection.php';

if (isset($_GET['id_pinjam']) && isset($_GET['status'])) {
    $id_pinjam = $_GET['id_pinjam'];
    $status = $_GET['status'];

    // Validasi status yang diperbolehkan
    $allowed_status = ['disetujui', 'ditolak', 'dikembalikan']; // tambahkan 'dikembalikan' ke dalam allowed_status

    if (in_array($status, $allowed_status)) {
        // Update status peminjaman berdasarkan id_pinjam
        $query = "UPDATE pinjam_ruang SET status = '$status' WHERE id_pinjam = '$id_pinjam'";
        $result = mysqli_query($connection, $query);

        if ($result) {
            $_SESSION['info'] = [
                'status' => 'success',
                'message' => 'Status berhasil diperbarui'
            ];
        } else {
            $_SESSION['info'] = [
                'status' => 'failed',
                'message' => 'Gagal memperbarui status: ' . mysqli_error($connection)
            ];
        }
    } else {
        $_SESSION['info'] = [
            'status' => 'failed',
            'message' => 'Status tidak valid'
        ];
    }

    header('Location: ./index.php');
} else {
    $_SESSION['info'] = [
        'status' => 'failed',
        'message' => 'ID atau status tidak valid'
    ];
    header('Location: ./index.php');
}