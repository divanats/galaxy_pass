<?php
require_once '../layout/_top.php';
require_once '../../helper/connection.php';

// Pastikan id_ruangan tersedia
if (isset($_GET['id_ruangan'])) {
    $id_ruangan = $_GET['id_ruangan'];

    // Query untuk mengambil data ruangan berdasarkan id_ruangan
    $query = "SELECT * FROM ruangan WHERE id_ruangan = '$id_ruangan'";
    $result = mysqli_query($connection, $query);

    if (!$result) {
        die("Query error: " . mysqli_error($connection));
    }

    // Fetch data dari hasil query
    $data = mysqli_fetch_array($result);
} else {
    die('Parameter id_ruangan tidak ditemukan');
}
?>

<section class="section">
  <div class="section-header">
    <h1><i>Detail Ruangan</i></h1>
  </div>jhasjadhADHkashkAshxKUA
  <div class="row">
    <div class="col-md-6">
      <div class="card mb-4">
        <img src="../../assets/berkas1/<?php echo $data['gambar_ruangan']; ?>" class="card-img-top" alt="Gambar Ruangan">
        <div class="card-body">
          <h5 class="card-title"><?= $data['nama_ruangan'] ?></h5>
          <p class="card-text">
            <strong>ID Ruangan:</strong> <?= $data['id_ruangan'] ?><br>
            <strong>Kapasitas:</strong> <?= $data['kapasitas'] ?><br>
            <strong>Lokasi:</strong> <?= $data['lokasi'] ?>
          </p>
          <a href="./index.php" class="btn btn-light">Kembali</a>
        </div>
      </div>
    </div>
  </div>
</section>

<?php
require_once '../layout/_bottom.php';
?>
<!-- Page Specific JS File -->
<?php
if (isset($_SESSION['info'])) :
  if ($_SESSION['info']['status'] == 'success') {
?>
    <script>
      iziToast.success({
        title: 'Sukses',
        message: `<?= $_SESSION['info']['message'] ?>`,
        position: 'topCenter',
        timeout: 5000
      });
    </script>
  <?php
  } else {
  ?>
    <script>
      iziToast.error({
        title: 'Gagal',
        message: `<?= $_SESSION['info']['message'] ?>`,
        timeout: 5000,
        position: 'topCenter'
      });
    </script>
<?php
  }

  unset($_SESSION['info']);
  $_SESSION['info'] = null;
endif;
?>
<script src="../assets/js/page/modules-datatables.js"></script>
