<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
  <form class="form-inline mr-auto">
    <ul class="navbar-nav mr-3">
      <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
      <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
    </ul>
  </form>
  <ul class="navbar-nav navbar-right">
    <li class="d-flex align-items-center">
      <img alt="image" src="../../assets/berkas1/user1.png" class="rounded-circle mr-2">
      <div class="d-flex flex-column user-info">
        <span class="welcome-text">Welcome back,</span>
        <span class="username-text"><?= $_SESSION['login']['username'] ?></span>
      </div>
      <a href="../setting/index.php" class="btn btn-light ml-4">
        <i class="fa fa-cog"></i>
      </a>
    </li>
  </ul>
</nav>