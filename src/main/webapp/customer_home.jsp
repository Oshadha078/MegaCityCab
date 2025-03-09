<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Home - Mega City Cab</title>
  
  <!-- Bootstrap & Font Awesome -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4xGi1v2KLSf4imMMjXvSWmsAMeC80r8ozAQ&s==');
      background-size: cover;
      background-position: center;
      margin: 0;
      padding: 0;
    }

    .navbar {
      background-color:#fae050;
      padding: 1rem;
    }
   
	
	.navbar .navbar-brand, 
	.navbar .nav-link {
	  color: #000 !important; /* Black text color */
	  font-weight: bold;
	}
	
	.navbar .nav-link:hover {
	  color: #333 !important; /* Darker black on hover */
	}

    .navbar-brand {
      font-weight: bold;
      color: #fff !important;
    }

    .btn-logout {
      background-color: #dc3545;
      color: #fff;
      font-weight: bold;
    }

	    #sidebar {
	  min-width: 200px;
	  max-width: 250px;
	  background-color: #fae050; /* Yellow background */
	  min-height: 100vh;
	}
	
	#sidebar .nav-link {
	  color: #000; /* Black text color */
	  font-weight: bold;
	}
	
	#sidebar .nav-link:hover, .nav-link.active {
	  background-color: #e0c040; /* Slightly darker yellow for hover */
	  color: #000; /* Maintain black text color on hover and active */
	}


    .content {
      flex: 1;
      padding: 2rem;
    }

    .background-box, .help-box {
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .dark-mode {
      background-color: #343a40 !important;
      color: #f8f9fa !important;
    }

    .dark-mode #sidebar {
      background-color: #495057 !important;
    }

    .dark-mode .content, .dark-mode .background-box, .dark-mode .help-box {
      background-color: #3a3a3a !important;
      color: #f8f9fa !important;
    }

    #themeSelector {
      margin-left: 1rem;
      padding: 0.3rem;
      border-radius: 0.2rem;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-user-circle"></i> Customer Dashboard</a>
      <div class="d-flex">
        <a href="LogoutServlet" class="btn btn-logout mr-2"><i class="fas fa-sign-out-alt"></i> Logout</a>
        <select id="themeSelector" class="custom-select">
          <option value="default">Default</option>
          <option value="dark">Dark Mode</option>
        </select>
      </div>
    </div>
  </nav>

  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar">
      <div class="sidebar-heading text-center mt-3">Menu</div>
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
      <div class="background-box">
        <h2 class="text-primary">Welcome, <span id="usernameDisplay">Guest</span>!</h2>
        <hr>
        <p><strong>User ID:</strong> <span id="userIDDisplay">N/A</span></p>
       
      </div>

      <div class="help-box">
        <h4 class="text-success">User Help Manual</h4>
        <p>Navigate the system effortlessly with this guide:</p>
        <ul>
          <li><strong>Manage Bookings:</strong> Schedule, view, or cancel bookings with ease.</li>
          <li><strong>View Bill Information:</strong> Access detailed invoices and billing history.</li>
          <li><strong>Submit Complaints:</strong> Report any issues and track admin responses.</li>
          <li><strong>Explore About Us:</strong> Learn more about Mega City Cab services.</li>
        </ul>
      </div>
    </div>
  </div>

  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px; text-align: center;">
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p>Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
  </footer>

  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

  <script>
    function getCookie(name) {
      const cookies = document.cookie.split(";");
      for (const cookie of cookies) {
        const [key, value] = cookie.trim().split("=");
        if (key === name) return decodeURIComponent(value);
      }
      return "";
    }

    document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("userIDDisplay").textContent = getCookie("userID") || "N/A";
      document.getElementById("usernameDisplay").textContent = getCookie("name") || "Guest";
      document.getElementById("addressDisplay").textContent = getCookie("address") || "Not Available";
      document.getElementById("contactDisplay").textContent = getCookie("contact") || "Not Available";

      document.getElementById("themeSelector").addEventListener("change", function() {
        document.body.classList.toggle("dark-mode", this.value === "dark");
      });
    });
  </script>
</body>
</html>
