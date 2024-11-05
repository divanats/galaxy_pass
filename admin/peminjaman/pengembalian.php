<?php
require_once '../layout/_top.php';
require_once '../../helper/connection.php';

$query = "SELECT p.*, r.nama_ruangan 
          FROM pinjam_ruang p
          INNER JOIN ruangan r ON p.id_ruangan = r.id_ruangan
          WHERE p.status = 'disetujui'";

$result = mysqli_query($connection, $query);

if (!$result) {
    die("Query error: " . mysqli_error($connection));
}
?>

<section class="section">
  <div class="section-header d-flex justify-content-between">
    <h1><i>Data Peminjaman</i></h1>
  </div>
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-hover table-striped w-100" id="table-1">
              <thead class="table-primary">
                <tr>
                  <th>Id Peminjaman</th>
                  <th>Ruangan</th>
                  <th>Peminjam</th>
                  <th>Instansi</th>
                  <th>Tanggal</th>
                  <th>Jam Mulai</th>
                  <th>Jam Selesai</th>
                  <th>Keterangan</th>
                  <th>Lampiran</th>
                  <th>Status</th>
                  <th style="width: 150px">Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php while ($data = mysqli_fetch_array($result)) : ?>
                  <tr>
                    <td><?= $data['id_pinjam'] ?></td>
                    <td><?= $data['nama_ruangan'] ?></td>
                    <td><?= $data['nama_pnjm'] ?></td>
                    <td><?= $data['instansi'] ?></td>
                    <td><?= $data['tanggal'] ?></td>
                    <td><?= $data['jam_pinjam'] ?></td>
                    <td><?= $data['jam_selesai'] ?></td>
                    <td><?= $data['keterangan'] ?></td>
                    <td>
                      <?php if (!empty($data['lampiran'])) : ?>
                        <a href="<?= $data['lampiran'] ?>" target="_blank">Lihat Lampiran</a>
                      <?php else : ?>
                        Tidak ada lampiran
                      <?php endif; ?>
                    </td>
                    <td>Dipinjam</td> <!-- Ubah status 'disetujui' menjadi 'disimpan' -->
                    <td>
                      <a class="btn btn-sm btn-danger mb-md-0 mb-1" href="delete.php?id_pinjam=<?= $data['id_pinjam'] ?>">
                        <i class="fas fa-trash fa-fw"></i> HAPUS
                      </a>
                      <?php if ($data['status'] == 'disetujui') : ?>
                        <a class="btn btn-sm btn-success" href="validasi.php?id_pinjam=<?= $data['id_pinjam'] ?>&status=dikembalikan">
                          <i class="fa fa-undo"></i> KEMBALIKAN
                        </a>
                      <?php endif; ?>
                    </td>
                  </tr>
                <?php endwhile; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<?php require_once '../layout/_bottom.php'; ?>
<!-- Page Specific JS File -->
<?php if (isset($_SESSION['info'])) : ?>
  <script>
    <?php if ($_SESSION['info']['status'] == 'success') : ?>
      iziToast.success({
        title: 'Sukses',
        message: `<?= $_SESSION['info']['message'] ?>`,
        position: 'topCenter',
        timeout: 5000
      });
    <?php else : ?>
      iziToast.error({
        title: 'Gagal',
        message: `<?= $_SESSION['info']['message'] ?>`,
        timeout: 5000,
        position: 'topCenter'
      });
    <?php endif; ?>
  </script>
  <?php
  unset($_SESSION['info']);
  $_SESSION['info'] = null;
  ?>
<?php endif; ?>

<script src="../assets/js/page/modules-datatables.js"></script>
