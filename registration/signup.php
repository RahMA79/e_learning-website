<?php
if($_SERVER['REQUEST_METHOD'] === 'POST'){
    session_start();
    $name = ($_POST['name']);
    $email = strtolower($_POST['email']);
    $password = $_POST['password'];

    $conn = mysqli_connect("localhost", "root", "", "e_learning");
    if (!$conn)
        echo mysqli_connect_error();

    mysqli_query($conn, "INSERT INTO `student`(`s_name`, `s_email`, `s_password`) VALUES ('$name','$email','$password')");
    
    $sql = "SELECT s_name FROM student WHERE s_email = '$email' AND s_password = '$password'";  //Same code used in login.php
    $login = mysqli_query($conn, $sql);
    $_SESSION['is_logged_in'] = true;
    $row = mysqli_fetch_assoc($login);
    $_SESSION['username'] = $row['s_name'];
    header('location: ../home/home.php');                          
    exit();

}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="../home/styles.css">
</head>

<body>
  <header>
    <nav class="navbar navbar-expand-lg bg-primary shadow">
      <div class="container">
        <a class="navbar-brand d-flex align-items-center logo" href="#">
          <img src="../home/images/logo1.png" alt="Logo" width="50" height="50" class="me-2">
          <span>E-Learning</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto me-4">
            <li class="nav-item"><a class="nav-link text-light" href="../home/home.php">Home</a></li>
            <li class="nav-item"><a class="nav-link text-light" href="../home/home.php#courses">Courses</a></li>
            <li class="nav-item"><a class="nav-link text-light" href="#">Team</a></li>
            <li class="nav-item"><a class="nav-link text-light" href="#">My Learning</a></li>
            <li class="nav-item"><a class="nav-link text-light" href="#">About Us</a></li>
          </ul>
          <form class="d-flex me-4">
            <input class="form-control me-2" type="search" placeholder="Search courses..." aria-label="Search">
            <button class="btn btn-outline-light" type="submit">Search</button>
          </form>
          <a href="../cart/cart.html" class="me-3 cart">
            <img src="../home/images/cart_icon.png" alt="Cart" width="30" height="30">
          </a>
          <a href="login.php" class="btn btn-light me-4">Login</a>
          <a href="#" class="btn btn-warning">Sign Up</a>
        </div>
      </div>
    </nav>
  </header>
  <div class="container register">
    <div class="row">
    <div class="col-md-7">
        <img src="images/login.jpg" alt="" class="img-fluid">
      </div>
      <div class="col-md-4">
        <form action="" method="post">
          <h1>Sign up for learning</h1>
          <div>
            <input id="name" type="text" name="name" placeholder="Full name" required>
          </div>
          <div>
            <input id="email" type="email" name="email" placeholder="Email" required>
          </div>
          <div id="signupPassword">
            <input id="password" type="password" name="password" placeholder="Password" required>
          </div>
          <div class="checkbox">
            <input id="terms" type="checkbox" name="terms" value="terms" required>
            <label for="terms">I Accept all terms and privacy policy.</label>
          </div>
          <button type="submit">Sign up</button>
          <div class="divider">or signup with</div>
          <h6 style="text-align: center;">
            Already have an account? <a href="login.php">Log in</a>
          </h6>
        </form>
      </div>
    </div>
  </div>
  <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>