<?php
session_start();
require_once '../../helper/connection.php';

$id_r = $_POST['id_ruangan'];
$peminjam = $_POST['nama_pnjm'];
$instansi = $_POST['instansi'];
$tgl = $_POST['tanggal'];
$mulai = $_POST['jam_pinjam'];
$selesai = $_POST['jam_selesai'];
$keterangan = $_POST['keterangan'];

// Handle file upload
if (isset($_FILES['lampiran']) && $_FILES['lampiran']['error'] === UPLOAD_ERR_OK) {
  $lampiranName = uniqid() . '-' . $_FILES['lampiran']['name'];
  $lampiranTempPath = $_FILES['lampiran']['tmp_name'];
  $uploadPath = '../../assets/berkas2/'; // Replace with your upload directory path

  if (move_uploaded_file($lampiranTempPath, $uploadPath . $lampiranName)) {
      // File uploaded successfully
      $query = "INSERT INTO pinjam_ruang (id_ruangan, nama_pnjm, instansi, tanggal, jam_pinjam, jam_selesai, keterangan, lampiran) VALUES ('$id_r', '$peminjam', '$instansi', '$tgl', '$mulai', '$selesai', '$keterangan', '$lampiranName')";
  } else {
      // File upload failed
      $_SESSION['info'] = [
          'status' => 'failed',
          'message' => 'Gagal mengunggah file lampiran.'
      ];
      header('Location: ./index.php');
      exit;
  }
} else {
  // No file uploaded or upload error
  $query = "INSERT INTO pinjam_ruang (id_ruangan, nama_pmjn, instansi, tanggal, jam_pinjam, jam_selesai, keterangan) VALUES ('$id_r', '$peminjam', '$instansi', '$tgl', '$mulai', '$selesai', '$keterangan')";
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