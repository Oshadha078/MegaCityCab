<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Generate Bill</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  
  <style>
  /* Global Styles */
  body {
    background-color: #fff8e1; /* light yellow background */
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    transition: background-color 0.3s ease, color 0.3s ease;
  }
  
  /* Top Navbar Styles */
  .navbar {
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    background-color: #FFD700; /* taxi yellow */
  }
  .navbar-brand {
    font-weight: bold;
    font-size: 1.5rem;
    color: #333; /* dark text for contrast */
  }
  .navbar-nav .nav-link {
    font-size: 1.1rem;
    margin-right: 1rem;
    color: #333; /* dark text */
  }
  
  /* Sidebar Styles */
  #sidebar {
    background-color: #FFD700; /* taxi yellow */
    color: #333; /* dark text */
    min-height: 100vh;
    padding: 1.5rem 1rem;
    transition: background-color 0.3s ease;
  }
  #sidebar h5 {
    border-bottom: 1px solid #FFC107; /* slightly darker yellow for border */
    padding-bottom: 0.5rem;
    margin-bottom: 1rem;
  }
  #sidebar a {
    color: #333;
    text-decoration: none;
    display: block;
    padding: 0.5rem;
    border-radius: 4px;
    margin-bottom: 0.5rem;
    transition: background-color 0.3s ease, padding-left 0.3s ease;
  }
  #sidebar a:hover {
    background-color: #FFC107; /* hover effect */
    padding-left: 10px;
  }
  
  /* Container and Content Area */
  .content {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    margin-top: 20px;
    transition: background-color 0.3s ease, color 0.3s ease;
  }
  
  /* Table Styles */
  table {
    width: 100%;
    margin-top: 20px;
  }
  th, td {
    text-align: center;
  }
  
  /* Night Mode Overrides */
  .night-mode {
    background-color: #121212 !important;
    color: #e0e0e0 !important;
  }
  .night-mode .container, .night-mode .content {
    background-color: #1f1f1f !important;
    color: #e0e0e0 !important;
  }
  .night-mode table thead {
    background-color: #1c1c1c !important;
    color: #e0e0e0 !important;
  }
  
  /* Dark Mode Overrides */
  .dark-mode {
    background-color: #343a40 !important;
    color: #f8f9fa !important;
  }
  .dark-mode .container, .dark-mode .content {
    background-color: #3a3a3a !important;
    color: #f8f9fa !important;
  }
  .dark-mode table thead {
    background-color: #495057 !important;
    color: #f8f9fa !important;
  }
  
  /* Theme Selector Dropdown */
  #themeSelector {
    width: auto;
    margin-left: 1rem;
  }
  
  /* Responsive Adjustments */
  @media (max-width: 768px) {
    .d-flex {
      flex-direction: column;
    }
    #sidebar {
      min-height: auto;
    }
    .content {
      margin: 1rem;
    }
  }
</style>

</head>
<body onload="initializePage()">
  
  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Employee Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" 
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ms-auto">
          <a class="nav-link" href="employee_home.jsp">Home</a>
          <!-- Theme Selector Dropdown -->
          <select id="themeSelector" class="form-select form-select-sm">
            <option value="default">Default</option>
            <option value="dark">Dark Mode</option>
            <option value="night">Night Mode</option>
          </select>
          <!-- Logout Button -->
          <a class="nav-link" href="javascript:void(0)" onclick="logout()">Logout</a>
        </div>
      </div>
    </div>
  </nav>
  
  <!-- Main Layout with Sidebar and Content -->
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar Navigation -->
      <div class="col-md-2" id="sidebar">
        <h5>Menu</h5>
        <a href="employee_home.jsp">Dashboard</a>
        <a href="bill_make.jsp">Manage Bookings</a>
        <a href="#">Reports</a>
      </div>
      
      <!-- Content Area -->
      <div class="col-md-10">
        <div class="content">
          <h2 class="mb-3">Generate Bill</h2>
          <!-- Booking Table -->
          <h4>Available Bookings</h4>
          <table class="table table-bordered">
            <thead class="table-dark">
              <tr>
                <th>Booking ID</th>
                <th>Customer ID</th>
                <th>Vehicle</th>
                <th>Pickup</th>
                <th>Dropoff</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody id="bookingTableBody">
              <!-- Booking rows will be added dynamically -->
            </tbody>
          </table>
          
          <!-- Bill Form -->
          <h4 class="mt-4">Billing Details</h4>
          <form action="BillMakeServlet" method="post">
            <!-- Employee Information (Auto-filled) -->
            <div class="mb-3">
              <label class="form-label">Employee Name:</label>
              <input type="text" class="form-control" id="employeeName" name="employeeName" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label">Employee ID:</label>
              <input type="text" class="form-control" id="employeeID" name="employeeID" readonly>
            </div>
            
            <!-- Booking Information (Auto-filled) -->
            <div class="mb-3">
              <label class="form-label">Booking ID:</label>
              <input type="text" class="form-control" id="bookingID" name="bookingID" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label">Customer ID:</label>
              <input type="text" class="form-control" id="customerID" name="customerID" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label">Vehicle:</label>
              <input type="text" class="form-control" id="vehicle" name="vehicle" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label">Kilometers Driven:</label>
              <input type="number" class="form-control" id="kilometers" name="kilometers" required oninput="calculateTotal()">
            </div>
            <div class="mb-3">
              <label class="form-label">Rate per KM:</label>
              <input type="number" class="form-control" id="perKmRate" name="perKmRate" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label">Total Amount:</label>
              <input type="number" class="form-control" id="amount" name="amount" readonly>
            </div>
            
            <button type="submit" class="btn btn-success">Generate Bill</button>
          </form>
        </div><!-- content -->
      </div>
    </div>
  </div>
  
  <script>
    // Logout function
    function logout() {
      // Perform logout actions like clearing session or redirecting
      window.location.href = 'LogoutServlet'; // Redirect to logout servlet or any logout URL
    }

    // Theme selector event listener to handle three modes: Default, Dark, and Night
    document.addEventListener("DOMContentLoaded", function() {
      const themeSelector = document.getElementById("themeSelector");

      // Check the current theme from local storage and set the class accordingly
      const currentTheme = localStorage.getItem('theme') || 'default';
      if (currentTheme !== 'default') {
        document.body.classList.add(currentTheme + '-mode');
      }

      themeSelector.value = currentTheme;

      themeSelector.addEventListener("change", function() {
        // Remove any existing theme classes
        document.body.classList.remove("dark-mode", "night-mode");
        
        if (this.value === "dark") {
          document.body.classList.add("dark-mode");
        } else if (this.value === "night") {
          document.body.classList.add("night-mode");
        }

        // Store the selected theme in local storage
        localStorage.setItem('theme', this.value);
      });
    });
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
