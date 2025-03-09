<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>User Help Manual - Booking Management</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  
  <style>
     body {
      font-family: 'Roboto', Arial, sans-serif;
      background-image: url('https://media.istockphoto.com/id/936346770/de/vektor/travel-concept-musterdesign-abstrakte-flugzeug-routen-reisen-und-tourismus-nahtlose.jpg?s=1024x1024&w=is&k=20&c=EAeALvegAwD19pV1hDCng92LJc8a2BN0BlOQ1-Pep-c=');
      background-size: cover;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
      transition: all 0.3s ease;
      color: #333;
      line-height: 1.6;
    }
    
    /* Top Navbar with yellow gradient */
    .navbar {
      background: linear-gradient(to right, #FFC107, #FFD54F, #FFECB3);
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      padding: 10px 20px;
    }
    
    .navbar-brand {
      font-weight: bold;
      font-size: 1.8rem;
      color: #5D4037 !important;
      text-transform: uppercase;
      letter-spacing: 1px;
    }
    
    .navbar-nav .nav-link {
      color: #5D4037 !important;
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
      background: #5D4037;
      left: 0;
      bottom: 0;
      transition: width 0.3s ease;
    }
    
    .navbar-nav .nav-link:hover::after {
      width: 100%;
    }
    
    /* Enhanced Sidebar with yellow theme */
    #sidebar {
      width: 250px;
      background: linear-gradient(135deg, #FFC107 0%, #FF8F00 100%);
      min-height: 100vh;
      color: #5D4037;
      padding: 2rem 1.5rem;
      box-shadow: 3px 0 10px rgba(0,0,0,0.1);
    }
    
    #sidebar .nav-link {
      color: #5D4037;
      margin-bottom: 0.8rem;
      text-decoration: none;
      display: block;
      padding: 0.8rem 1rem;
      border-radius: 8px;
      transition: all 0.3s ease;
      font-weight: 500;
    }
    
    #sidebar .nav-link:hover,
    #sidebar .nav-link.active {
      background-color: rgba(255,255,255,0.4);
      color: #5D4037;
      padding-left: 1.5rem;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    
    #sidebar .sidebar-heading {
      text-align: center;
      font-size: 1.4rem;
      margin-bottom: 2rem;
      border-bottom: 1px solid rgba(93,64,55,0.2);
      padding-bottom: 1rem;
      font-weight: 600;
      letter-spacing: 1px;
      color: #5D4037;
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
    }
    
    /* About Us Section */
    .about-section {
      padding: 20px;
    }
    
    .about-section h2 {
      color: #FF8F00;
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
      background: linear-gradient(to right, #FFC107, #FF8F00);
      bottom: 0;
      left: 0;
    }
    
    .about-section p {
      line-height: 1.8;
      margin-bottom: 1.2rem;
      font-size: 1.05rem;
      color: #444;
    }
    
    /* Custom Image Styling */
    .img-container {
      position: relative;
      overflow: hidden;
      border-radius: 15px;
      box-shadow: 0 15px 35px rgba(0,0,0,0.2);
      margin: 20px auto;
    }
    
    .img-custom {
      max-width: 100%;
      height: auto;
      transition: transform 0.5s ease;
      border-radius: 15px;
    }
    
    .img-container:hover .img-custom {
      transform: scale(1.05);
    }
    
    .img-overlay {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
      padding: 20px;
      color: white;
      border-bottom-left-radius: 15px;
      border-bottom-right-radius: 15px;
    }
    
    /* Features Section */
    .features-section {
      margin-top: 3rem;
    }
    
    .feature-card {
      background-color: #fff;
      border-radius: 10px;
      padding: 25px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      margin-bottom: 25px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      position: relative;
      overflow: hidden;
      border-top: 4px solid #FFC107;
    }
    
    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0,0,0,0.15);
    }
    
    .feature-icon {
      font-size: 2.5rem;
      color: #FFC107;
      margin-bottom: 15px;
    }
    
    .feature-title {
      font-weight: 600;
      margin-bottom: 10px;
      color: #FF8F00;
    }
    
    /* Footer with yellow theme */
    footer {
      background: linear-gradient(to right, #FFC107, #FFD54F, #FFECB3);
      color: #5D4037;
      padding: 30px 0;
      margin-top: 40px;
    }
    
    footer hr {
      border-top: 1px solid rgba(93,64,55,0.2);
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
      color: #5D4037;
      font-size: 1.5rem;
      margin: 0 10px;
      transition: all 0.3s ease;
      display: inline-block;
    }
    
    .social-icons a:hover {
      transform: translateY(-5px);
      color: #5D4037;
    }
    
    /* Help Box Styling with yellow theme */
    .help-box {
      border: 2px solid #FFD54F;
      border-radius: 10px;
      padding: 25px;
      background-color: #FFFDE7;
    }
    
    .help-box h4 {
      color: #FF8F00 !important;
      border-bottom: 2px solid #FFD54F;
      padding-bottom: 10px;
      margin-bottom: 20px;
    }
    
    .help-box .text-primary {
      color: #FF8F00 !important;
    }
    
    .help-box .text-success {
      color: #FF6F00 !important;
    }
    
    .help-box .text-muted {
      color: #5D4037 !important;
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
  <nav class="navbar navbar-expand-lg navbar-light fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Mega City Cab</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="LogoutServlet">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Sidebar and Main Content Layout -->
  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar">
      <div class="sidebar-heading">Menu</div>
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
      <div class="help-box mx-auto">
        <h4>User Help Manual</h4>
        <p class="text-muted"><strong>User Guide: Booking Management</strong></p>
        
        <p class="fw-bold text-primary">1. Create a New Booking</p>
        <p class="ml-3"><strong>Step 1:</strong> <span class="text-success">Auto-Generated Booking ID and Name</span></p>
        <p class="ml-4">A unique Booking ID is automatically generated for tracking. Enter your Name when prompted.</p>
        
        <p class="ml-3"><strong>Step 2:</strong> <span class="text-success">Enter Pickup Location</span></p>
        <p class="ml-4">Provide your Pickup Location where the vehicle will collect you.</p>
        
        <p class="ml-3"><strong>Step 3:</strong> <span class="text-success">Enter Drop-off Location</span></p>
        <p class="ml-4">Enter your destination in the Drop-off field.</p>
        
        <p class="ml-3"><strong>Step 4:</strong> <span class="text-success">Select Date</span></p>
        <p class="ml-4">Choose a date for your booking from the calendar.</p>
        
        <p class="ml-3"><strong>Step 5:</strong> <span class="text-success">Select Vehicle</span></p>
        <p class="ml-4">Pick the vehicle that suits your needs from the available options.</p>
        
        <p class="ml-3"><strong>Step 6:</strong> <span class="text-success">Confirm Booking</span></p>
        <p class="ml-4">Click "Book Now" to finalize your booking details.</p>
        
        <p class="fw-bold text-primary">2. View Bill Information</p>
        <p class="ml-3">Access detailed billing information after your booking is complete.</p>
        <ul class="ml-4">
          <li>Navigate to the booking summary page.</li>
          <li>Click on "Bill Information".</li>
          <li>Review the charges and breakdown.</li>
        </ul>
        
        <p class="fw-bold text-primary">3. Submit a Complaint</p>
        <p class="ml-3">If you face any issues, file a complaint by:</p>
        <ul class="ml-4">
          <li>Entering a Subject for the complaint.</li>
          <li>Providing a detailed Description of the issue.</li>
          <li>Clicking "Submit Complaint" to notify support.</li>
        </ul>
        
        <p class="fw-bold text-primary">4. View Responses to Complaints</p>
        <p class="ml-3">Check the Responses area to see replies from support regarding your complaints.</p>
        <ul class="ml-4">
          <li>Locate the Complaint Section on your booking summary page.</li>
          <li>Review the admin responses.</li>
          <li>Follow up if further information is required.</li>
        </ul>
      </div>
    </div>
  </div>
  
  <!-- Footer -->
  <footer>
    <hr>
    <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
  </footer>

  <!-- Bootstrap JS and Dependencies -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>