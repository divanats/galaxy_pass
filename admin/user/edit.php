<?php
require_once '../layout/_top.php';
require_once '../../helper/connection.php';

$user = $_GET['username'];
$query = mysqli_query($connection, "SELECT * FROM user WHERE username='$user'");
?>

<section class="section">
  <div class="section-header d-flex justify-content-between">
    <h1><i>Ubah Data User</i></h1>
    <a href="./index.php" class="btn btn-light">Kembali</a>
  </div>
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body">
          <!-- // Form -->
          <form action="./update.php" method="post">
            <?php
            while ($row = mysqli_fetch_array($query)) {
            ?>
              <input type="hidden" name="username" value="<?= $row['username'] ?>">
              <table cellpadding="8" class="w-100">
                <tr>
                  <td>Username</td>
                  <td><input class="form-control" type="text" name="username" size="20" required value="<?= $row['username'] ?>" disabled></td>
                </tr>
                
                <tr>
                  <td>Password</td>
                  <td><input class="form-control" type="text" name="password" size="20" required value="<?= $row['password'] ?>"></td>
                </tr>

                <tr>
                  <td>Nama</td>
                  <td><input class="form-control" type="text" name="nama" size="20" required value="<?= $row['nama'] ?>"></td>
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