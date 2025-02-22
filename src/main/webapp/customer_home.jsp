<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Home</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #fff3cd;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    .navbar {
      background-color: #ffcc00;
      border-bottom: 3px solid black;
    }
    .navbar-brand, .nav-link {
      color: #000 !important;
      font-weight: bold;
    }
    .d-flex .btn {
      background-color: black;
      color: white;
      font-weight: bold;
    }
    #sidebar {
      min-width: 250px;
      max-width: 300px;
      background-color: #ffcc00;
      min-height: 100vh;
      padding: 1rem;
    }
    #sidebar .nav-link {
      color: #000;
      font-weight: bold;
    }
    #sidebar .nav-link:hover {
      background-color: #e6b800;
    }
    .content {
      margin: 2rem;
    }
    .help-box {
      background: #fff;
      padding: 15px;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    }
    .dark-mode {
      background-color: #343a40 !important;
      color: #ffffff !important;
    }
    .dark-mode .navbar {
      background-color: #495057 !important;
    }
    .dark-mode #sidebar {
      background-color: #495057 !important;
    }
    .dark-mode .content,
    .dark-mode .help-box {
      background-color: #3a3a3a !important;
      color: #ffffff !important;
    }
    .dark-mode * {
      color: #ffffff !important;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Customer Dashboard</a>
      <div class="d-flex">
        <a class="btn btn-outline-dark mr-2" href="LogoutServlet">Logout</a>
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
      <div class="sidebar-heading text-center">Menu</div>
      <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="cus_booking.jsp">Manage Bookings</a></li>
        <li class="nav-item"><a class="nav-link" href="bill_info.jsp">Bill Information</a></li>
        <li class="nav-item"><a class="nav-link" href="cus_complaint.jsp">Complaint</a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="content">
      <h2 class="text-dark">Welcome, <span id="usernameDisplay"></span>!</h2>
      <hr />

      <div class="mb-3">
        <strong>User ID:</strong> <span id="userIDDisplay">N/A</span>
      </div>
      <div class="mb-3">
        <strong>Address:</strong> <span id="addressDisplay">Not Available</span>
      </div>
      <div class="mb-3">
        <strong>Contact No:</strong> <span id="contactDisplay">Not Available</span>
      </div>

      <div class="help-box">
        <h4 class="text-dark">User Help Manual</h4>
        <p class="text-muted">
          Welcome to your home page. Here you can manage bookings, check bill information, and navigate easily.
        </p>
      </div>
    </div>
  </div>

  <script>
    function getCookie(name) {
      let cookies = document.cookie.split(";");
      for (let i = 0; i < cookies.length; i++) {
        let cookie = cookies[i].trim();
        if (cookie.startsWith(name + "=")) {
          return decodeURIComponent(cookie.substring(name.length + 1));
        }
      }
      return "";
    }

    document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("userIDDisplay").textContent = getCookie("userID") || "N/A";
      document.getElementById("usernameDisplay").textContent = getCookie("name") || "Guest";
      document.getElementById("addressDisplay").textContent = getCookie("address") || "Not Available";
      document.getElementById("contactDisplay").textContent = getCookie("contact") || "Not Available";

      const themeSelector = document.getElementById("themeSelector");
      themeSelector.addEventListener("change", function() {
        document.body.classList.remove("dark-mode");
        if (this.value === "dark") {
          document.body.classList.add("dark-mode");
        }
      });
    });
  </script>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>