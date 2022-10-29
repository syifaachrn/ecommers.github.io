<!-- CSS LOGIN -->
<link rel="stylesheet" href="assets/css/styleLogin.css">
<title><?= $data['title']; ?></title>
<main class="form-signin w-100 m-auto">
  <form action="<?= $base_url?>c_login/Send" method="POST">
    <img class="mb-4 rounded-circle " src="assets/img/login.jpeg " alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <?php
      if(isset($_GET['pesan'])){
        if($_GET['pesan']=="belum_login"){
          echo "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
           Anda Harus Login terlebih dahulu
          <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
        </div>";
        }else if($_GET['pesan']=="gagal"){
          echo "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
           Email dan Password Anda Salah!
          <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
        </div>";
        }else if($_GET['pesan']=="logout"){
          echo "<div class='alert alert-success alert-dismissible fade show' role='alert'>
           Anda behasil Logout
          <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
        </div>";
        }
      }
    ?>

    <div class="form-floating">
      <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password"  name ="password" class="form-control" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
  </form>
</main>