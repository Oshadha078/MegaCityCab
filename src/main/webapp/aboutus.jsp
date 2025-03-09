<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>About Us - Mega City Cab</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
  <link rel="stylesheet" href="cusnav.css" />
  <style>
    :root {
      --primary-yellow: #fae050;
      --primary-dark: #e0c040;
      --primary-darker: #c4a636;
      --secondary-color: #333;
      --text-color: #444;
      --light-bg: #fffdf5;
    }
    
    body {
      font-family: 'Roboto', Arial, sans-serif;
      background-image: url('https://media.istockphoto.com/id/936346770/de/vektor/travel-concept-musterdesign-abstrakte-flugzeug-routen-reisen-und-tourismus-nahtlose.jpg?s=1024x1024&w=is&k=20&c=EAeALvegAwD19pV1hDCng92LJc8a2BN0BlOQ1-Pep-c=');
      background-size: cover;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
      transition: all 0.3s ease;
      color: var(--text-color);
      line-height: 1.6;
    }
    
    /* Top Navbar with yellow gradient */
    .navbar {
      background: linear-gradient(to right, var(--primary-darker), var(--primary-yellow));
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      padding: 10px 20px;
    }
    
    .navbar-brand {
      font-weight: bold;
      font-size: 1.8rem;
      color: var(--secondary-color) !important;
      text-transform: uppercase;
      letter-spacing: 1px;
    }
    
    .navbar-nav .nav-link {
      color: var(--secondary-color) !important;
      font-size: 1.05rem;
      margin-right: 1.5rem;
      font-weight: 500;
      position: relative;
      padding: 8px 0;
      transition: all 0.3s ease;
    }
    
    .navbar-nav .nav-link::after {
      content: '';
      position: absolute;
      width: 0;
      height: 2px;
      background: var(--secondary-color);
      left: 0;
      bottom: 0;
      transition: width 0.3s ease;
    }
    
    .navbar-nav .nav-link:hover::after {
      width: 100%;
    }
    
    /* Enhanced Sidebar */
    #sidebar {
      width: 250px;
      background: linear-gradient(135deg, var(--primary-yellow) 0%, var(--primary-darker) 100%);
      min-height: 100vh;
      color: var(--secondary-color);
      padding: 2rem 1.5rem;
      box-shadow: 3px 0 10px rgba(0,0,0,0.1);
    }
    
    #sidebar .nav-link {
      color: var(--secondary-color);
      margin-bottom: 0.8rem;
      text-decoration: none;
      display: block;
      padding: 0.8rem 1rem;
      border-radius: 8px;
      transition: all 0.3s ease;
      font-weight: 500;
      opacity: 0.85;
    }
    
    #sidebar .nav-link:hover,
    #sidebar .nav-link.active {
      background-color: rgba(255,255,255,0.4);
      color: var(--secondary-color);
      padding-left: 1.5rem;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      opacity: 1;
      font-weight: 600;
    }
    
    #sidebar .sidebar-heading {
      text-align: center;
      font-size: 1.4rem;
      margin-bottom: 2rem;
      border-bottom: 1px solid rgba(0,0,0,0.2);
      padding-bottom: 1rem;
      font-weight: 600;
      letter-spacing: 1px;
      color: var(--secondary-color);
    }
    
    #sidebar .nav-link i {
      margin-right: 10px;
      width: 20px;
      text-align: center;
    }
    
    /* Main Content */
    .content {
      flex: 1;
      padding: 2.5rem;
      margin: 2rem;
      background-color: rgba(255, 255, 255, 0.95);
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.15);
      transition: all 0.3s ease;
      border-top: 5px solid var(--primary-yellow);
    }
    
    /* About Us Section */
    .about-section {
      padding: 20px;
    }
    
    .about-section h2 {
      color: var(--secondary-color);
      margin-bottom: 1.5rem;
      font-weight: 700;
      font-size: 2.5rem;
      position: relative;
      padding-bottom: 15px;
    }
    
    .about-section h2:after {
      content: '';
      position: absolute;
      width: 80px;
      height: 3px;
      background: linear-gradient(to right, var(--primary-darker), var(--primary-yellow));
      bottom: 0;
      left: 0;
    }
    
    .about-section p {
      line-height: 1.8;
      margin-bottom: 1.2rem;
      font-size: 1.05rem;
      color: var(--text-color);
    }
    
    /* Custom Image Styling */
    .img-container {
      position: relative;
      overflow: hidden;
      border-radius: 15px;
      box-shadow: 0 15px 35px rgba(0,0,0,0.2);
      margin: 20px auto;
      border: 5px solid var(--primary-yellow);
    }
    
    .img-custom {
      max-width: 100%;
      height: auto;
      transition: transform 0.5s ease;
      border-radius: 10px;
    }
    
    .img-container:hover .img-custom {
      transform: scale(1.05);
    }
    
    .img-overlay {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      background: linear-gradient(to top, rgba(224, 192, 64, 0.8), transparent);
      padding: 20px;
      color: var(--secondary-color);
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
      font-weight: 600;
    }
    
    /* Features Section */
    .features-section {
      margin-top: 3rem;
    }
    
    .feature-card {
      background-color: var(--light-bg);
      border-radius: 10px;
      padding: 25px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      margin-bottom: 25px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      position: relative;
      overflow: hidden;
      border-top: 4px solid var(--primary-yellow);
    }
    
    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0,0,0,0.15);
    }
    
    .feature-icon {
      font-size: 2.5rem;
      color: var(--primary-darker);
      margin-bottom: 15px;
    }
    
    .feature-title {
      font-weight: 600;
      margin-bottom: 10px;
      color: var(--secondary-color);
    }
    
    /* Footer */
    footer {
      background: linear-gradient(to right, var(--primary-darker), var(--primary-yellow));
      color: var(--secondary-color);
      padding: 30px 0;
      margin-top: 40px;
    }
    
    footer hr {
      border-top: 1px solid rgba(0,0,0,0.2);
      margin-bottom: 20px;
    }
    
    footer p {
      margin: 5px 0;
      text-align: center;
      font-size: 1rem;
      letter-spacing: 1px;
    }
    
    .social-icons {
      text-align: center;
      margin-top: 15px;
    }
    
    .social-icons a {
      color: var(--secondary-color);
      font-size: 1.5rem;
      margin: 0 10px;
      transition: all 0.3s ease;
      display: inline-block;
    }
    
    .social-icons a:hover {
      transform: translateY(-5px);
      color: rgba(0,0,0,0.7);
    }
    
    /* Section heading */
    .section-heading {
      color: var(--secondary-color);
      font-weight: 700;
      position: relative;
      padding-bottom: 10px;
      display: inline-block;
    }
    
    .section-heading:after {
      content: '';
      position: absolute;
      width: 60%;
      height: 3px;
      background: var(--primary-yellow);
      bottom: 0;
      left: 20%;
    }
    
    /* Responsive Adjustments */
    @media (max-width: 992px) {
      #sidebar {
        width: 220px;
      }
    }
    
    @media (max-width: 768px) {
      #sidebar {
        width: 100%;
        min-height: auto;
        position: relative;
        padding: 1rem;
      }
      
      .d-flex {
        flex-direction: column;
      }
      
      .content {
        margin: 1rem;
        padding: 1.5rem;
      }
      
      .about-section h2 {
        font-size: 2rem;
      }
      
      .img-custom {
        margin-top: 2rem;
      }
    }
  </style>
</head>
<body>
  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <i class="fas fa-taxi me-2"></i>Mega City Cab
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="LogoutServlet">
              <i class="fas fa-sign-out-alt me-2"></i>Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Sidebar + Main Content Layout -->
  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar">
      <div class="sidebar-heading">
        <i class="fas fa-taxi me-2"></i>Menu
      </div>
      <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="customer_home.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="cus_booking.jsp"><i class="fas fa-calendar-alt"></i> Manage Bookings</a></li>
        <li class="nav-item"><a class="nav-link" href="bill_info.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Information</a></li>
        <li class="nav-item"><a class="nav-link" href="cus_complaint.jsp"><i class="fas fa-exclamation-circle"></i> Complaint</a></li>
        <li class="nav-item"><a class="nav-link" href="aboutus.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
        <li class="nav-item"><a class="nav-link" href="helpandsupport.jsp"><i class="fas fa-exclamation-circle"></i> Help & Support</a></li>
        <li class="nav-item"><a class="nav-link" href="LogoutServlet"><i class="fas fa-door-open"></i> Exit</a></li>
      </ul>
    </div>
    
    <!-- Main Content -->
    <div class="content">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6 about-section">
            <h2>About Us</h2>
            <p>
              Mega City Cab is a leading transportation service dedicated to providing safe, reliable, and affordable taxi services throughout the city. Founded with a commitment to excellence, we have grown to become one of the most trusted names in urban mobility.
            </p>
            <p>
              Our mission is to connect people with their destinations in a timely, efficient, and secure manner. With a modern fleet of vehicles and a team of experienced drivers, we strive to offer a superior travel experience for every customer.
            </p>
            <p>
              At Mega City Cab, customer satisfaction is our top priority. We continuously innovate and invest in technology to ensure a seamless and convenient ride experience—from easy booking through our online platform to professional, courteous service on every trip.
            </p>
            <p>
              We believe in building lasting relationships with our customers by consistently delivering quality service. Whether you need a ride to work, a quick trip across town, or transportation to and from the airport, Mega City Cab is here to serve you.
            </p>
            <p>
              For further information, please contact our customer support team at <strong>info@megacitycab.com</strong> or call <strong>+1-555-123-4567</strong>.
            </p>
          </div>
          <div class="col-md-6">
            <div class="img-container">
              <img src="https://img.freepik.com/free-vector/app-taxi-service_24908-60897.jpg?t=st=1740470190~exp=1740473790~hmac=c13efe07d61b802a20d8008a5f7bd36a74a262b550447d6f6f831f2a5be6b3e8&w=900" class="img-fluid img-custom" alt="Mega City Cab">
              <div class="img-overlay">
                <h4>Reliable Transport Services</h4>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Features Section -->
        <div class="features-section">
          <div class="row">
            <div class="col-12">
              <h3 class="text-center mb-4 section-heading">Why Choose Us</h3>
            </div>
            
            <div class="col-md-4">
              <div class="feature-card">
                <div class="feature-icon">
                  <i class="fas fa-taxi"></i>
                </div>
                <h4 class="feature-title">Modern Fleet</h4>
                <p>Our vehicles are regularly maintained and equipped with modern amenities for your comfort.</p>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="feature-card">
                <div class="feature-icon">
                  <i class="fas fa-user-tie"></i>
                </div>
                <h4 class="feature-title">Professional Drivers</h4>
                <p>Our drivers are experienced, licensed professionals who prioritize your safety and comfort.</p>
              </div>
            </div>
            
            <div class="col-md-4">
              <div class="feature-card">
                <div class="feature-icon">
                  <i class="fas fa-mobile-alt"></i>
                </div>
                <h4 class="feature-title">Easy Booking</h4>
                <p>Book your ride easily through our website or mobile app for a hassle-free experience.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <div class="container">
      <hr>
      <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
      <p>Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
      
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-linkedin"></i></a>
      </div>
    </div>
  </footer>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>