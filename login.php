<?php
require_once 'helper/connection.php';

session_start();
if (isset($_POST['submit'])) {

  $username = $_POST['username'];
  $password = $_POST['password'];

  //$sql = "SELECT * FROM login WHERE username='$username' and password='$password' LIMIT 1";

  $sql = "SELECT * FROM tb_user WHERE username='$username'";

  $result = mysqli_query($connection, $sql);
  $row = mysqli_fetch_assoc($result);
  var_dump($row);

  $sqlAdmin = "SELECT * FROM tb_admin WHERE username='$username' LIMIT 1";

  $resultAdmin = mysqli_query($connection, $sqlAdmin);
  $adminRow = mysqli_fetch_assoc($resultAdmin);

  if ((mysqli_num_rows($result) === 1) && ($password==$row['password'])) {
    $_SESSION['login'] = $row;
    header('Location: user/index.php');
    exit;

  } else if ((mysqli_num_rows($resultAdmin) === 1) && ($password==$adminRow['password'])) {
    $_SESSION['login'] = $adminRow;
    header('Location: admin/index.php');
    exit;

  } else {
    $error = true;
  }

}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Login &mdash; Moto Expert</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="assets/modules/bootstrap-social/bootstrap-social.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/components.css">
</head>

<body style="background-color: #1E5DBC; background-image: url('assets/images/grid-image.png'); background-repeat: repeat; background-size: 50px 50px;">
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              <h3>WELCOME BACK!</h3>
            </div>

            <div class="card card-primary">
              <div class="card-header">
                <h3>Login</h3>
              </div>

              <div class="card-body">
                <form method="POST" action="" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" type="text" placeholder="Username" class="form-control" name="username" tabindex="1" required autofocus>
                    <div class="invalid-feedback">
                      Mohon isi username
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="d-block">
                      <label for="password" class="control-label">Password</label>
                    </div>
                    <div class="input-group">
                      <input id="password" type="password" placeholder="Sandi" class="form-control" name="password" tabindex="2" required>
                      <div class="input-group-append">
                        <span class="input-group-text" onclick="togglePassword()">
                          <i class="fas fa-eye" id="toggleEye"></i>
                        </span>
                      </div>
                    </div>
                    <div class="invalid-feedback">
                      Mohon isi kata sandi
                    </div>
                  </div>

                  <div class="form-group">
                    <button name="submit" type="submit" class="btn btn-primary btn-lg btn-block" tabindex="3">
                      Login
                    </button>
                  </div>

                  <!-- Link to Register Page -->
                  <div class="text-center mt-3">
                    <p>Belum punya akun? <a href="regist.php">Register now</a></p>
                  </div>
                </form>

                <?php
                  if(isset($error)) {
                      echo "<p class='alert alert-danger mt-4'> password/user salah </p>";
                  }
                ?>
              </div>
            </div>
            <div class="simple-footer">
              Moto Expert by Group 3 UIN Walisongo
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6Hjty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="assets/js/stisla.js"></script>

  <!-- Template JS File -->
  <script src="assets/js/scripts.js"></script>
  <script src="assets/js/custom.js"></script>

  <!-- JS Function to Toggle Password Visibility -->
  <script>
    function togglePassword() {
      var passwordField = document.getElementById("password");
      var toggleIcon = document.getElementById("toggleEye");
      if (passwordField.type === "password") {
        passwordField.type = "text";
        toggleIcon.classList.remove("fa-eye");
        toggleIcon.classList.add("fa-eye-slash");
      } else {
        passwordField.type = "password";
        toggleIcon.classList.remove("fa-eye-slash");
        toggleIcon.classList.add("fa-eye");
      }
    }
  </script>

</body>

</html>