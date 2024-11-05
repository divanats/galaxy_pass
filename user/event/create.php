<?php
require_once '../layout/_top.php';
require_once '../../helper/connection.php';

// Ambil event yang dipilih sebelumnya jika ada
$selected_event = isset($_POST['id_event']) ? $_POST['id_event'] : '';

// Query untuk mengambil semua event dari tabel jadwal_event
$query_event = "SELECT id_event, nama_event FROM jadwal_event";
$result_event = mysqli_query($connection, $query_event);

// Jika event dipilih, ambil tanggal event berdasarkan id_event
$tanggal = '';
if (!empty($selected_event)) {
    $query_tanggal = "SELECT tanggal FROM jadwal_event WHERE id_event = '$selected_event'";
    $result_tanggal = mysqli_query($connection, $query_tanggal);
    if ($tanggal = mysqli_fetch_assoc($result_tanggal)) {
        $tanggal = $tanggal['tanggal'];
    }
}

?>

<section class="section">
  <div class="section-header d-flex justify-content-between">
    <h1><i>Pesan Tiket Event</i></h1>
    <a href="./index.php" class="btn btn-light">Kembali</a>
  </div>
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <!-- Form -->
          <form action="./create.php" method="POST">
            <table cellpadding="8" class="w-100">

              <tr>
                <td>Event</td>
                <td>
                  <select class="form-control" name="id_event" id="id_event" required onchange="this.form.submit()">
                    <option value="">Pilih Event</option>
                    <?php
                    // Tampilkan pilihan event dari query
                    while ($event = mysqli_fetch_assoc($result_event)) {
                      $selected = ($selected_event == $event['id_event']) ? 'selected' : '';
                      echo "<option value='{$event['id_event']}' $selected>{$event['nama_event']}</option>";
                    }
                    ?>
                  </select>
                </td>
              </tr>

              <tr>
                <td>Tanggal Event</td>
                <td>
                  <input class="form-control" type="text" name="tanggal" value="<?= htmlspecialchars($tanggal) ?>" readonly>
                </td>
              </tr>

              <tr>
                <td>Nama Pemesan</td>
                <td><input class="form-control" type="text" name="nama" size="20" required></td>
              </tr>

              <tr>
                <td>Jumlah Orang</td>
                <td><input class="form-control" type="number" name="jumlah_orang" size="20" required></td>
              </tr>

              <tr>
                <td>
                  <input class="btn btn-primary" type="submit" name="proses" value="Pesan">
                  <input class="btn btn-danger" type="reset" name="batal" value="Bersihkan">
                </td>
              </tr>

            </table>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<?php
require_once '../layout/_bottom.php';
?>
