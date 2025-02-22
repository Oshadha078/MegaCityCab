<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>File a Complaint</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  
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
    .logout-btn {
      background-color: #ff5733;
      border: none;
      color: white;
      padding: 8px 15px;
      border-radius: 5px;
      font-weight: bold;
    }
    .logout-btn:hover {
      background-color: #e64a19;
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
    .complaint-container {
      background: #fff;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
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
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Customer Dashboard</a>
      
      <div class="d-flex">
        <form action="logout.html" method="post">
          <button type="submit" class="logout-btn">Logout</button>
        </form>
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
        <li class="nav-item"><a class="nav-link" href="Bill_info.jsp">Bill Information</a></li>
        <li class="nav-item"><a class="nav-link active" href="cus_complaint.jsp">Complaint</a></li>
      </ul>
    </div>
    
    <!-- Main Content -->
    <div class="content">
      <h2 class="text-dark mb-4">File a Complaint</h2>
      
      <div class="complaint-container">
        <form id="complaintForm" action="ComplaintServlet" method="post">
          <div class="mb-3">
            <label for="subject" class="form-label">Subject:</label>
            <input type="text" class="form-control" id="subject" name="subject" required>
          </div>
          <div class="mb-3">
            <label for="description" class="form-label">Complaint Details:</label>
            <textarea class="form-control" id="description" name="description" rows="5" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Submit Complaint</button>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
