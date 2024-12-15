<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="../home/styles.css">
    <link
    href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400;500;600;700;800&family=Poppins:wght@400;500&display=swap"
    rel="stylesheet">
    <script>
      function openModal() {
          document.getElementById('courseModal').style.display = 'flex';
      }
      function closeModal() {
          document.getElementById('courseModal').style.display = 'none';
      }
      // Close modal if clicked outside of the content
      window.addEventListener('click', function(event) {
          const modal = document.getElementById('courseModal');
          if (event.target === modal) {
              closeModal();
          }
      });
  </script>

</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
          <div class="container">
            <!-- Logo -->
            <a class="navbar-brand d-flex align-items-center logo" href="#">
              <img src="../home/images/logo1.png" alt="Logo" width="50" height="50" class="me-2">
              <span>E-Learning</span>
            </a>
    
            <!-- Toggler for mobile view -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
              <span class="navbar-toggler-icon"></span>
            </button>
    
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav ms-auto me-4">
                <li class="nav-item"><a class="nav-link text-light" href="../home/home.php">Home</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="../home/home.php#courses">Courses</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="../home/home.php#team">Team</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="#">My Learning</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="../home/home.php#About-us">About Us</a></li>
              </ul>
    
              <!-- Search bar -->
              <form class="d-flex me-4">
                <input class="form-control me-2" type="search" placeholder="Search courses..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
              </form>
    
              <!-- Cart -->
              <a href="#" class="me-3 cart">
                <img src="../home/images/cart_icon.png" alt="Cart" width="30" height="30">
              </a>
    
              <!-- Login and Signup buttons -->
              <a href="../registration/login.php" class="btn btn-light me-4">Login</a>
              <a href="../registration/signup.php" class="btn btn-warning">Sign Up</a>
            </div>
          </div>
        </nav>
      </header>
      <!-- Title Page -->
     <div class="section-subtitle">Available Courses</div>
     <h2 class="section-title">Featured Courses</h2>
     <section class="courses-container">
        <!-- Filter Section -->
        <aside class="filter-section">
          <h3>Filter by</h3>
          <div class="filter-group">
            <h4>Subject</h4>
            <label><input type="checkbox"> Business</label>
            <label><input type="checkbox"> Computer Science</label>
            <label><input type="checkbox"> Information Technology</label>
            <label><input type="checkbox"> Data Science</label>
          </div>
      
          <div class="filter-group">
            <h4>Language</h4>
            <label><input type="checkbox"> English</label>
            <label><input type="checkbox"> French</label>
            <label><input type="checkbox"> Arabic</label>
          </div>

          <div class="filter-group">
            <h4>Level</h4>
            <label><input type="checkbox"> Beginner</label>
            <label><input type="checkbox"> Intermediate</label>
            <label><input type="checkbox"> Advanced</label>
          </div>
        </aside>
      
        <!-- Course Cards Section -->
        
    <!-- Course Cards Section -->
    <div class="courses-list">

<?php

$conn = mysqli_connect("localhost", "root", "", "e_learning");
if (!$conn)
  echo mysqli_connect_error();

$sql = "SELECT c_name, c_price, c_no_of_lessons, c_image FROM course";

$result = mysqli_query($conn, $sql);
while ($row = $result->fetch_assoc()) {
  echo "
  <div class=\"course-card\">
    <figure class=\"card-banner img-holder\">
      <img src=\"../home/{$row['c_image']}\" alt=\"{$row['c_name']}\" class=\"img-cover\">
    </figure>

    <div class=\"abs-badge\">
      <ion-icon name=\"time-outline\"></ion-icon>
      <span class=\"span\">{$row['c_no_of_lessons']} weeks</span>
    </div>

    <div class=\"card-content\">
      <span class=\"badge\">Beginner</span>
      <h3><a href=\"#courseModal\" onclick=\"openModal()\" class=\"card-title\">{$row['c_name']}</a></h3>
      <div class=\"wrapper\">
        <div class=\"rating-wrapper\">";

  // Generate star icons dynamically based on rating
  $rating = 4; 
  for ($i = 0; $i < 5; $i++) {
    echo $i < $rating
      ? "<ion-icon name=\"star\"></ion-icon>"
      : "<ion-icon name=\"star-outline\"></ion-icon>";
  }

  echo "
        </div>
        <p class=\"rating-text\">(4/5 Rating)</p>
      </div>
      <data class=\"price\" value=\"{$row['c_price']}\">\${$row['c_price']}</data>
      <ul class=\"card-meta-list\">
        <li class=\"card-meta-item\">
          <ion-icon name=\"library-outline\"></ion-icon>
          <span class=\"span\">{$row['c_no_of_lessons']} Lessons</span>
        </li>
        <li class=\"card-meta-item\">
          <ion-icon name=\"people-outline\"></ion-icon>
          <span class=\"span\">20 Students</span>
        </li>
      </ul>
    </div>
  </div>";
}


?>

          <div id="courseModal" class="modal">
            <div class="modal-content">
                <div class="course-title">Build Responsive Real-World Websites with HTML and CSS</div>
                <ul class="card-meta-list">
                  <li class="card-meta-item">
                    <ion-icon name="library-outline"></ion-icon>
                    <span class="span">58 Lessons</span>
                  </li>
                  <li class="card-meta-item">
                    <ion-icon name="people-outline"></ion-icon>
                    <span class="span">20 Students</span>
                  </li>
                  <li class="card-meta-item">
                    <ion-icon name="time-outline"></ion-icon>
                    <span class="span">3 Weeks</span>
                  </li>
                </ul>
                <p class="course-description">
                    Learn the basics of web development, including HTML, CSS, and JavaScript, in this beginner-friendly course. This course is designed to provide you with a solid foundation to start building your own websites.
                </p>
        
                <div class="price-and-btn">
                  <div class="course-price">$49.99</div>
                  <button class="add-to-cart-btn">Add to Cart</button>
              </div>
            </div>
        </div>
        
  </div>
      
          
           
  <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</body>
</html>


