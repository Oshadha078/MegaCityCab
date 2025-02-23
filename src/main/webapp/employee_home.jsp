<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Employee Home</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

  <style>
    body {
      background-color: #fff3cd;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
      width: 250px;
      background-color: #ffcc00;
      min-height: 100vh;
      padding: 1.5rem 1rem;
    }
    #sidebar h5 {
      border-bottom: 1px solid black;
      padding-bottom: 0.5rem;
      margin-bottom: 1rem;
      color: black;
    }
    #sidebar a {
      color: black;
      font-weight: bold;
      text-decoration: none;
      display: block;
      padding: 0.5rem;
      border-radius: 4px;
      margin-bottom: 0.5rem;
      transition: background-color 0.3s ease;
    }
    #sidebar a:hover {
      background-color: #e6b800;
    }
    .content {
      margin: 2rem;
    }
    .card {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      margin-bottom: 1.5rem;
      border: none;
    }
    .btn-primary {
      background-color: #ffcc00;
      border: none;
      color: black;
      font-weight: bold;
    }
    .btn-primary:hover {
      background-color: #e6b800;
    }
    .dark-mode {
      background-color: #343a40 !important;
      color: #ffffff !important;
    }
    .dark-mode * {
      color: #ffffff !important;
    }
    .dark-mode .navbar {
      background-color: #495057 !important;
    }
    .dark-mode #sidebar {
      background-color: #495057 !important;
    }
    .dark-mode .card {
      background-color: #3a3a3a !important;
      color: #ffffff !important;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Employee Dashboard</a>
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
      <h5>Menu</h5>
      <a href="employee_home.jsp">Dashboard</a>
      <a href="bill_make.jsp">Manage Bookings</a>
      <a href="#">Reports</a>
      <a href="LogoutServlet">Exit</a>
    </div>

    <!-- Content Area -->
    <div class="content flex-grow-1">
      <div class="card p-3">
        <h4>User Information</h4>
        <p><strong>Name:</strong> <span id="userName">N/A</span></p>
        <p><strong>ID:</strong> <span id="userID">N/A</span></p>
      </div>
      <div class="card p-3">
        <h4>Pending Bookings</h4>
        <p>No bookings found.</p>
      </div>
      <a id="goToBillPage" href="bill_make.jsp" class="btn btn-primary">Generate Bill</a>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function() {
      const themeSelector = document.getElementById("themeSelector");
      themeSelector.addEventListener("change", function() {
        document.body.classList.remove("dark-mode");
        if (this.value === "dark") {
          document.body.classList.add("dark-mode");
        }
      });
    });
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
