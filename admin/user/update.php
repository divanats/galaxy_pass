<?php
session_start();
require_once '../../helper/connection.php';

$user = $_POST['username'];
$pass = $_POST['password'];
$nama = $_POST['nama'];

$query = mysqli_query($connection, "UPDATE user SET password = '$pass', nama = '$nama' WHERE username = '$user'");
if ($query) {
  $_SESSION['info'] = [
    'status' => 'success',
    'message' => 'Berhasil mengubah data'
  ];
  header('Location: ./index.php');
} else {
  $_SESSION['info'] = [
    'status' => 'failed',
    'message' => mysqli_error($connection)
  ];
  header('Location: ./index.php');
}
