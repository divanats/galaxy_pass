<?php
session_start();
require_once '../../helper/connection.php';

$user = $_POST['username'];
$pass = $_POST['password'];
$nama = $_POST['nama'];

$query = mysqli_query($connection, "insert into user(username, password, nama) value('$user', '$pass', '$nama')");
if ($query) {
  $_SESSION['info'] = [
    'status' => 'success',
    'message' => 'Berhasil menambah data'
  ];
  header('Location: ./index.php');
                                            } else {
                                              $_SESSION['info'] = [
                                                'status' => 'failed',
                                                'message' => mysqli_error($connection)
                                              ];
                                              header('Location: ./index.php');
                                            }
