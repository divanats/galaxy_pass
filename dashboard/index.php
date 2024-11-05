<?php
require_once '../layout/_top.php';
require_once '../helper/connection.php';

$ruangan = mysqli_query($connection, "SELECT COUNT(*) FROM ruangan");
$user = mysqli_query($connection, "SELECT COUNT(*) FROM user");
$peminjaman = mysqli_query($connection, "SELECT COUNT(*) FROM pinjam_ruang");


$total_ruangan = mysqli_fetch_array($ruangan)[0];
$total_user = mysqli_fetch_array($user)[0];
$total_peminjaman = mysqli_fetch_array($peminjaman)[0];
?>

<section class="section">
  <div class="section-header">
    <h1><i>Dashboard</i></h1>
  </div>
  <!-- <div class="column">
    <div class="row">
    <img src="../assets/img/Group 4.png" alt="Group 4">
  </div> -->
<!-- </div> -->
  <div class="column">
    <div class="row">
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-info">
            <i class="far fa-building"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Ruangan</h4>
            </div>
            <div class="card-body">
              <?= $total_ruangan ?>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-info">
            <i class="far fa-user"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total User</h4>
            </div>
            <div class="card-body">
              <?= $total_user ?>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-info">
            <i class="fas fa-chart-line"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Peminjaman</h4>
            </div>
            <div class="card-body">
              <?= $total_peminjaman ?>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    <div class="row">
  <div class="col-sm-6 mb-3 mb-sm-40">
    <div class="card">
    <img src="../assets/img/elemen1.png" class="card-img-top" alt="elemen1"  style= "width: 250px; height: 200px;">
      <div class="card-body">
        <h5 class="card-title">Tatacara Peminjaman Ruangan</h5>
        <p class="card-text">Berikut adalah tatacara dalam peminjaman ruangan di Room Ku</p>
        <a href="#tatacara" class="btn btn-info">Baca di sini</a>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
    <img src="../assets/img/elemen1.png" class="card-img-top" alt="elemen1" style="width: 250px; height: 200px;">
      <div class="card-body">
        <h5 class="card-title">Syarat Peminjaman Ruangan</h5>
        <p class="card-text">Berikut adalah syarat dalam peminjaman ruangan di Room Ku</p>
        <a href="#syarat" class="btn btn-info">Baca di sini</a>
      </div>
    </div>
  </div>
</div>
</section>

<section id="tatacara">
  <div class="content">
  <div class="card">
  <div class="card-body">
    <h3>Tatacara Peminjaman Ruangan</h3>
     <hr> 
     <p>1. Kunjungi website Room Ku.
        Klik "Login" dan masukkan alamat email dan kata sandi Anda.</p>
      <p>2. Cari Ruangan
        Navigasi ke menu "Peminjaman Ruangan".
        Gunakan kotak pencarian atau filter untuk menemukan ruangan sesuai kebutuhan Anda.</p>
      <p>3. Pilih Ruangan
      Klik pada ruangan yang ingin Anda pinjam untuk melihat detailnya.
        Periksa kalender ketersediaan ruangan.</p>
        <p>4. Isi Formulir Pemesanan
        Klik "Pesan Ruangan".
        Isi formulir dengan data pemesan, tanggal, waktu, dan tujuan penggunaan, dan lampiran surat peminjaman.</p>
        <p>5. Kirim Pemesanan
        Periksa kembali informasi pemesanan.
        Klik "Kirim Pemesanan" untuk mengirim permintaan.</p>
        <p>6. Tunggu Konfirmasi
        Tunggu status pengajuan.
        Cek status pemesanan di "Riwayat Pemesanan" setelah login.
        Gunakan Ruangan</p>
        <p>7. Bawa ID dan bukti pemesanan saat akan menggunakan ruangan sesuai jadwal.</p>
        <p>8. Pembatalan Pemesanan
        Navigasi ke Riwayat Pemesanan</p>

        <p>9. Dari dashboard, pilih "Riwayat Pemesanan".
        Batalkan Pemesanan, Klik "Batalkan" di sebelah pemesanan yang ingin dibatalkan dan konfirmasi pembatalan.</p>
  </div>
  </div>
  </div>
</section>
<section id="syarat">
  <div class="content">
  <div class="card">
  <div class="card-body">
    <h3>Syarat Peminjaman</h3>
    <hr>
    <p>1. Semua civitas akademika UIN Walisngo Semarang</p>
    <p>2. Melampirkan surat resmi perizinan peminjaman ruangan </p>
    <p>3. Mengisi data dengan benar</p>
    <p>4. Tidak merusak fasilitas ruangan</p>
    <p>5. jika didapati kerusakan maka akan dikenakan sanksi</p>
  </div>
  </div>
  </div>
  </section>


<?php
require_once '../layout/_bottom.php';
?>