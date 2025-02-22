<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Booking</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #fff3cd;
      margin: 0;
      padding: 0;
    }
    .navbar {
      background-color: #ffcc00;
      border-bottom: 3px solid black;
    }
    .navbar-brand, .nav-link {
      color: #000 !important;
      font-weight: bold;
    }
    #sidebar {
      min-width: 250px;
      max-width: 300px;
      background-color: #ffcc00;
      min-height: 100vh;
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
    .card {
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      margin-bottom: 1.5rem;
      padding: 20px;
      background: #fff;
    }
    .btn-primary {
      background-color: #ffcc00;
      border-color: #ffcc00;
      color: black;
      font-weight: bold;
    }
    .btn-primary:hover {
      background-color: #e6b800;
    }
    .table thead {
      background-color: #ffcc00;
      color: black;
      font-weight: bold;
    }
    .btn-logout {
      background-color: #dc3545;
      border-color: #dc3545;
      color: white;
      font-weight: bold;
    }
    .btn-logout:hover {
      background-color: #c82333;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Customer Dashboard</a>
      <button class="btn btn-logout ms-auto" type="button" onclick="logout()">Logout</button>
    </div>
  </nav>
  
  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar" class="p-3">
      <div class="sidebar-heading text-center">Menu</div>
      <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="#">Dashboard</a></li>
        <li class="nav-item"><a class="nav-link" href="cus_booking.jsp">Manage Bookings</a></li>
        <li class="nav-item"><a class="nav-link" href="bill_info.jsp">Bill Information</a></li>
      </ul>
    </div>
    
    <!-- Main Content -->
    <div class="content">
      <div class="card">
        <h4>Make a Booking</h4>
        <form action="CusBookingServlet" method="post">
          <div class="mb-3">
            <label for="pickupLocation" class="form-label">Pickup Location:</label>
            <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" required>
          </div>
          <div class="mb-3">
            <label for="dropoffLocation" class="form-label">Dropoff Location:</label>
            <input type="text" class="form-control" id="dropoffLocation" name="dropoffLocation" required>
          </div>
          <button type="submit" class="btn btn-primary">Submit Booking</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap Bundle JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function logout() {
      // Here you can define the logout logic, for example, redirecting to a logout endpoint or clearing session data.
      window.location.href = 'logout.html';  // Replace with your actual logout URL
    }
  </script>
</body>
</html>
