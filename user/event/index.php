<?php
require_once '../layout/_top.php';
require_once '../../helper/connection.php';

$query = "SELECT * FROM jadwal_event";
$result = mysqli_query($connection, $query);

if (!$result) {
    die("Query error: " . mysqli_error($connection));
}
?>

<section class="section">
  <div class="section-header d-flex justify-content-between">
    <h1>Jadwal Event</h1>
  </div>
  <div class="row">
    <?php while ($data = mysqli_fetch_array($result)) : ?>
      <div class="col-md-4">
        <div class="card event-card shadow-lg mb-4">
          <img src="../assets/berkas1/fsh.jpeg<?= $data['gambar_event'] ?>" class="card-img-top" alt="<?= $data['nama_event'] ?>">
          <div class="card-body">
            <h5 class="card-title"><?= $data['nama_event'] ?></h5>
            <p class="card-text">
              <strong>Jam:</strong> <?= substr($data['jam'], 0, 5) ?><br>
              <strong>Harga:</strong> Rp<?= number_format($data['harga'], 0, ',', '.') ?><br>
              <strong>Kapasitas:</strong> <?= $data['kapasitas'] ?> orang
            </p>
            <a href="#" class="btn btn-primary btn-sm">Detail</a>
            <a href="#" class="save-icon">
              <i class="fas fa-bookmark"></i>
            </a>
          </div>
        </div>
      </div>
    <?php endwhile; ?>
  </div>
</section>

<?php
require_once '../layout/_bottom.php';
?>

<!-- Page Specific JS File -->
<script src="../assets/js/page/modules-datatables.js"></script>

<!-- Link to external CSS -->
<link rel="stylesheet" href="../assets/css/style.css">