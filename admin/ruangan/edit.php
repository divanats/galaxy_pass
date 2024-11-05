<?php
require_once '../layout/_top.php';
require_once '../../helper/connection.php';

$id_r = $_GET['id_ruangan'];
$query = mysqli_query($connection, "SELECT * FROM ruangan WHERE id_ruangan='$id_r'");
?>

<section class="section">
  <div class="section-header d-flex justify-content-between">
    <h1><i>Ubah Data Ruangan</i></h1>
    <a href="./index.php" class="btn btn-light">Kembali</a>
  </div>
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <!-- // Form -->
          <form action="./update.php" method="post" enctype="multipart/form-data">
            <?php
            while ($row = mysqli_fetch_array($query)) {
            ?>
              <input type="hidden" name="id_ruangan" value="<?= $row['id_ruangan'] ?>">
              <table cellpadding="8" class="w-100">
                <tr>
                  <td>Id Ruangan</td>
                  <td><input class="form-control" type="number" name="id_ruangan" size="20" required value="<?= $row['id_ruangan'] ?>" disabled></td>
                </tr>
                <tr>
                  <td>Gambar Ruangan</td>
                  <td><input class="form-control" type="file" name="gambar_ruangan" size="20" required value="<?= $row['gambar_ruangan'] ?>"></td>
                </tr>
                <tr>
                  <td>Nama Ruangan</td>
                  <td><input class="form-control" type="text" name="nama_ruangan" size="20" required value="<?= $row['nama_ruangan'] ?>"></td>
                </tr>
                <tr>
                  <td>Kapasitas</td>
                  <td><input class="form-control" type="text" name="kapasitas" size="20" required value="<?= $row['kapasitas'] ?>"></td>
                  </td>
                </tr>
                <tr>
                  <td>Lokasi</td>
                  <td colspan="3"><textarea class="form-control" name="lokasi" id="alamat" required><?= $row['lokasi'] ?></textarea></td>
                </tr>
                <tr>
                  <td>
                    <input class="btn btn-primary d-inline" type="submit" name="proses" value="Ubah">
                    <a href="./index.php" class="btn btn-danger ml-1">Batal</a>
                  <td>
                </tr>
              </table>

            <?php } ?>
          </form>
        </div>
      </div>
    </div>
</section>

<?php
require_once '../layout/_bottom.php';
?>