<?php
session_start();
require_once '../../helper/connection.php';

$nama_ruangan = $_POST['nama_ruangan'];
$kapasitas = $_POST['kapasitas'];
$lokasi = $_POST['lokasi'];

// Handle file upload
if (isset($_FILES['gambar_ruangan']) && $_FILES['gambar_ruangan']['error'] === UPLOAD_ERR_OK) {
  $gambar_ruanganName = uniqid() . '-' . $_FILES['gambar_ruangan']['name'];
  $gambar_ruanganTempPath = $_FILES['gambar_ruangan']['tmp_name'];
  $uploadPath = '../../assets/berkas1/'; // Replace with your upload directory path

  if (move_uploaded_file($gambar_ruanganTempPath, $uploadPath . $gambar_ruanganName)) {
      // File uploaded successfully
      $query = "INSERT INTO ruangan (gambar_ruangan, nama_ruangan, kapasitas, lokasi) VALUES ('$gambar_ruanganName', '$nama_ruangan', '$kapasitas', '$lokasi')";
  } else {
      // File upload failed
      $_SESSION['info'] = [
          'status' => 'failed',
          'message' => 'Gagal mengunggah file gambar_ruangan.'
      ];
      header('Location: ./index.php');
      exit;
  }
} else {
  // No file uploaded or upload error
  $query = "INSERT INTO ruangan (gambar_ruangan, nama_ruangan, kapasitas, lokasi) VALUES ('$gambar_ruanganName', '$nama_ruangan', '$kapasitas', '$lokasi')";
}

// Execute the query
$result = mysqli_query($connection, $query);

if ($result) {
  $_SESSION['info'] = [
      'status' => 'success',
      'message' => 'Berhasil menambahkan data peminjaman'
  ];
  header('Location: ./index.php');
} else {
  $_SESSION['info'] = [
      'status' => 'failed',
      'message' => mysqli_error($connection)
  ];
  header('Location: ./index.php');
}