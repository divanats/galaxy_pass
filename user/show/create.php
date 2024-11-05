<?php
require_once '../layout/_top.php';
require_once '../../helper/connection.php';

// Inisialisasi variabel id_ruangan
$id_ruangan = '';

// Periksa apakah ada parameter id_ruangan dari URL
if (isset($_GET['id_ruangan'])) {
    $id_ruangan = $_GET['id_ruangan'];
}

?>

<section class="section">
  <div class="section-header d-flex justify-content-between">
    <h1><i>Ajukan Peminjaman</i></h1>
    <a href="./index.php" class="btn btn-light">Kembali</a>
  </div>
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <!-- // Form -->
          <form action="./store.php" method="POST" enctype="multipart/form-data">
            <table cellpadding="8" class="w-100">

              <tr>
                <td>Id Ruangan</td>
                <td><input class="form-control" type="text" name="id_ruangan" size="20" value="<?= htmlspecialchars($id_ruangan) ?>" required></td>
              </tr>

              <tr>
                <td>Peminjam</td>
                <td><input class="form-control" type="text" name="nama_pnjm" size="20" required></td>
              </tr>
              
              <tr>
                <td>Instansi</td>
                <td><input class="form-control" type="text" name="instansi" size="20" required></td>
              </tr>

              <tr>
                <td>Tanggal</td>
                <td><input class="form-control" type="date" name="tanggal" size="20" required></td>
              </tr>

              <tr>
                <td>Jam Mulai</td>
                <td><input class="form-control" type="time" name="jam_pinjam" size="20" required></td>
              </tr>

              <tr>
                <td>Jam Selesai</td>
                <td><input class="form-control" type="time" name="jam_selesai" size="20" required></td>
              </tr>

              <tr>
                <td>Keterangan</td>
                <td><input class="form-control" type="text" name="keterangan" size="20" required></td>
              </tr>

              <tr>
                <td>Lampiran</td>
                <td><input class="form-control" type="file" name="lampiran" size="20" required></td>
              </tr>

              <tr>
                <td>
                  <input class="btn btn-primary" type="submit" name="proses" value="Simpan">
                  <input class="btn btn-danger" type="reset" name="batal" value="Bersihkan"></td>
              </tr>

            </table>
          </form>
        </div>
      </div>
    </div>
</section>

<?php
require_once '../layout/_bottom.php';
?>