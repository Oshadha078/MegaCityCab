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

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

  <style>
    /* Global Styles */
    /* Base Styles with Enhanced Typography and Colors */
body {
  background-color: #f8f9fa;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  margin: 0;
  padding: 0;
  transition: background-color 0.3s ease, color 0.3s ease;
  line-height: 1.6;
  color: #343a40;
}

/* Top Navbar Styles - Enhanced with Gradient */
.navbar {
  box-shadow: 0 3px 10px rgba(0,0,0,0.15);
  background: linear-gradient(to right, #343a40, #495057) !important;
  border-bottom: 1px solid rgba(255,255,255,0.1);
  padding: 0.8rem 1.5rem;
}

.navbar-brand {
  font-weight: 700;
  font-size: 1.6rem;
  letter-spacing: 0.5px;
  color: #fff !important;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
}

.navbar-nav .nav-link {
  font-size: 1.1rem;
  margin-right: 1.2rem;
  padding: 0.5rem 0.8rem;
  border-radius: 4px;
  transition: all 0.3s ease;
  position: relative;
}

.navbar-nav .nav-link:after {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  bottom: 0;
  left: 50%;
  background-color: #007bff;
  transition: all 0.3s ease;
  transform: translateX(-50%);
}

.navbar-nav .nav-link:hover:after {
  width: 80%;
}

.navbar-nav .nav-link:hover {
  color: #fff !important;
  transform: translateY(-2px);
}

/* Sidebar Styles - Enhanced with Depth and Animation */
#sidebar {
  width: 250px;
  background: linear-gradient(135deg, #343a40, #2c3136);
  min-height: 100vh;
  color: #fff;
  padding: 2rem 1.5rem;
  transition: all 0.3s ease;
  box-shadow: 3px 0 10px rgba(0,0,0,0.1);
  z-index: 100;
  position: relative;
}

#sidebar h5 {
  border-bottom: 2px solid #007bff;
  padding-bottom: 0.8rem;
  margin-bottom: 1.5rem;
  font-weight: 600;
  font-size: 1.2rem;
  letter-spacing: 1px;
  text-transform: uppercase;
  color: #f8f9fa;
}

#sidebar a {
  color: #e9ecef;
  text-decoration: none;
  display: block;
  padding: 0.7rem 1rem;
  border-radius: 6px;
  margin-bottom: 0.7rem;
  transition: all 0.3s ease;
  font-weight: 500;
  border-left: 3px solid transparent;
  display: flex;
  align-items: center;
}

#sidebar a i {
  margin-right: 10px;
  font-size: 1.1rem;
  transition: transform 0.3s ease;
}

#sidebar a:hover {
  background-color: rgba(255,255,255,0.1);
  border-left: 3px solid #007bff;
  padding-left: 1.3rem;
  color: #fff;
}

#sidebar a:hover i {
  transform: translateX(3px);
  color: #007bff;
}

#sidebar a.active {
  background-color: rgba(0,123,255,0.2);
  border-left: 3px solid #007bff;
  color: #fff;
}

/* Content Area - Enhanced Spacing and Organization */
.content {
  margin: 2.5rem;
  transition: all 0.3s ease;
  animation: fadeIn 0.5s ease-in-out;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Card Styles - Enhanced with Gradients and Hover Effects */
.card {
  border-radius: 12px;
  box-shadow: 0 6px 16px rgba(0,0,0,0.08);
  margin-bottom: 2rem;
  border: none;
  transition: all 0.3s ease;
  overflow: hidden;
  background: #fff;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 20px rgba(0,0,0,0.12);
}

.card-header {
  background: linear-gradient(to right, #f8f9fa, #e9ecef);
  border-bottom: none;
  padding: 1.2rem 1.5rem;
}

.card h4 {
  position: relative;
  padding-bottom: 0.8rem;
  margin-bottom: 1.2rem;
  font-weight: 600;
  color: #343a40;
}

.card h4:after {
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  width: 50px;
  height: 3px;
  background: linear-gradient(to right, #007bff, #00c6ff);
  border-radius: 10px;
}

.card-body {
  padding: 1.5rem;
}

.card p {
  font-size: 1.1rem;
  color: #495057;
  line-height: 1.7;
}

/* Generate Bill Button - Enhanced with Gradient and Animation */
#goToBillPage {
  font-size: 1.1rem;
  padding: 0.75rem 1.8rem;
  margin-top: 1.2rem;
  border-radius: 50px;
  background: linear-gradient(to right, #007bff, #0056b3);
  border: none;
  color: white;
  font-weight: 600;
  letter-spacing: 0.5px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(0,123,255,0.3);
  position: relative;
  overflow: hidden;
}

#goToBillPage:hover {
  transform: translateY(-3px) scale(1.02);
  box-shadow: 0 6px 15px rgba(0,123,255,0.4);
}

#goToBillPage:active {
  transform: translateY(1px);
}

#goToBillPage:before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(to right, transparent, rgba(255,255,255,0.2), transparent);
  transition: left 0.7s ease;
}

#goToBillPage:hover:before {
  left: 100%;
}

/* Theme Selector - Enhanced with Custom Styling */
#themeSelector {
  width: auto;
  margin-left: 1rem;
  padding: 0.5rem;
  border-radius: 4px;
  background-color: #f8f9fa;
  border: 1px solid #ced4da;
  color: #495057;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

#themeSelector:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
}

/* Dashboard Stats Cards - New Feature */
.stats-card {
  border-radius: 12px;
  padding: 1.5rem;
  margin-bottom: 1.5rem;
  box-shadow: 0 5px 15px rgba(0,0,0,0.07);
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
  border-left: 4px solid;
}

.stats-card.primary {
  background: linear-gradient(135deg, #f5f7fa, #e4e7ea);
  border-left-color: #007bff;
}

.stats-card.success {
  background: linear-gradient(135deg, #f6fbf6, #e6f3e6);
  border-left-color: #28a745;
}

.stats-card.warning {
  background: linear-gradient(135deg, #fffaf3, #fff5e6);
  border-left-color: #ffc107;
}

.stats-card.danger {
  background: linear-gradient(135deg, #fff5f5, #ffe6e6);
  border-left-color: #dc3545;
}

.stats-card h3 {
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 0.3rem;
}

.stats-card p {
  margin-bottom: 0;
  color: #6c757d;
  font-weight: 500;
}

.stats-card i {
  position: absolute;
  right: 20px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 2.5rem;
  opacity: 0.2;
}

/* Responsive adjustments - Enhanced for Better Mobile Experience */
@media (max-width: 992px) {
  .content {
    margin: 1.5rem;
  }
  
  #sidebar {
    width: 220px;
  }
}

@media (max-width: 768px) {
  #sidebar {
    width: 100%;
    min-height: auto;
    padding: 1.2rem;
  }
  
  .d-flex {
    flex-direction: column;
  }
  
  .content {
    margin: 1rem;
  }
  
  .navbar-brand {
    font-size: 1.4rem;
  }
  
  .card {
    margin-bottom: 1.2rem;
  }
  
  #goToBillPage {
    width: 100%;
  }
}

/* Dark Mode Overrides - Enhanced with Better Contrast and Gradients */
.dark-mode {
  background-color: #252830 !important;
  color: #e9ecef !important;
}

.dark-mode .navbar {
  background: linear-gradient(to right, #2c3136, #3a3f48) !important;
}

.dark-mode #sidebar {
  background: linear-gradient(135deg, #2c3136, #212529);
}

.dark-mode .card {
  background-color: #2c3136 !important;
  color: #e9ecef !important;
  box-shadow: 0 6px 16px rgba(0,0,0,0.15);
}

.dark-mode .card-header {
  background: linear-gradient(to right, #343a40, #2c3136);
}

.dark-mode .card h4 {
  color: #e9ecef;
}

.dark-mode .card p {
  color: #ced4da;
}

.dark-mode .stats-card.primary {
  background: linear-gradient(135deg, #2c3136, #2a2f36);
}

.dark-mode .stats-card.success {
  background: linear-gradient(135deg, #2c3136, #2a2f36);
}

.dark-mode .stats-card.warning {
  background: linear-gradient(135deg, #2c3136, #2a2f36);
}

.dark-mode .stats-card.danger {
  background: linear-gradient(135deg, #2c3136, #2a2f36);
}

.dark-mode .stats-card p {
  color: #adb5bd;
}

/* Night Mode Overrides - Enhanced with Deep Dark Blues and Better Visibility */
.night-mode {
  background-color: #0a0a0a !important;
  color: #d0d0d0 !important;
}

.night-mode .navbar {
  background: linear-gradient(to right, #121212, #1a1a1a) !important;
}

.night-mode #sidebar {
  background: linear-gradient(135deg, #121212, #0f0f0f);
}

.night-mode .card {
  background-color: #151515 !important;
  color: #d0d0d0 !important;
  box-shadow: 0 6px 16px rgba(0,0,0,0.2);
}

.night-mode .card-header {
  background: linear-gradient(to right, #1a1a1a, #151515);
}

.night-mode .card h4:after {
  background: linear-gradient(to right, #007bff, #00438a);
}

.night-mode .stats-card {
  background: #151515 !important;
}

.night-mode .stats-card p {
  color: #aaaaaa;
}

/* Tables - New Enhanced Styling */
.table {
  border-collapse: separate;
  border-spacing: 0;
  border-radius: 8px;
  overflow: hidden;
  margin-bottom: 2rem;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

.table thead th {
  background-color: #f8f9fa;
  border-bottom: 2px solid #dee2e6;
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.85rem;
  letter-spacing: 0.5px;
  padding: 1rem;
  vertical-align: middle;
}

.table tbody tr {
  transition: all 0.2s ease;
}

.table tbody tr:hover {
  background-color: rgba(0,123,255,0.03);
}

.table td {
  padding: 1rem;
  vertical-align: middle;
  border-top: 1px solid #dee2e6;
}

.table .btn {
  padding: 0.4rem 0.75rem;
  font-size: 0.85rem;
}

.dark-mode .table thead th {
  background-color: #343a40;
  border-bottom: 2px solid #495057;
  color: #e9ecef;
}

.dark-mode .table td {
  border-top: 1px solid #495057;
}

.dark-mode .table tbody tr:hover {
  background-color: rgba(255,255,255,0.03);
}

.night-mode .table thead th {
  background-color: #1a1a1a;
  border-bottom: 2px solid #333;
  color: #d0d0d0;
}

.night-mode .table td {
  border-top: 1px solid #333;
}

.night-mode .table tbody tr:hover {
  background-color: rgba(255,255,255,0.02);
}

/* Custom Scrollbar */
::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 10px;
}

::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}

.dark-mode ::-webkit-scrollbar-track {
  background: #343a40;
}

.dark-mode ::-webkit-scrollbar-thumb {
  background: #5a6268;
}

.night-mode ::-webkit-scrollbar-track {
  background: #1a1a1a;
}

.night-mode ::-webkit-scrollbar-thumb {
  background: #444;
}
  </style>
</head>
<body onload="loadUserData(); loadBookings();">

  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <i class="fas fa-user-tie"></i> Employee Dashboard
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" 
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav ms-auto">
          <a class="nav-link" href="EmployeeHome.jsp">
            <i class="fas fa-home"></i> Home
          </a>
          <!-- Theme Selector Dropdown -->
          <select id="themeSelector" class="form-select form-select-sm">
            <option value="default">Default</option>
            <option value="dark">Dark Mode</option>
            <option value="night">Night Mode</option>
          </select>
        </div>
      </div>
    </div>
  </nav>

  <!-- Main Content with Sidebar -->
  <div class="d-flex">
    <!-- Sidebar Navigation -->
    <div id="sidebar">
      <h5>Menu</h5>
      <a href="employee_home.jsp">
        <i class="fas fa-tachometer-alt"></i> Dashboard
      </a>
      <a href="bill_make.jsp">
        <i class="fas fa-calendar-check"></i> Manage Bookings
      </a>
      <a href="LogoutServlet">
        <i class="fas fa-sign-out-alt"></i> Exit
      </a>
    </div>

    <!-- Content Area -->
    <div class="content flex-grow-1">
      <!-- User Information Card -->
      <div class="card p-3">
        <h4>
          <i class="fas fa-info-circle"></i> User Information
        </h4>
        <p>
          <strong><i class="fas fa-user"></i> Name:</strong> 
          <span id="userName">N/A</span>
        </p>
        <p>
          <strong><i class="fas fa-id-card"></i> ID:</strong> 
          <span id="userID">N/A</span>
        </p>
      </div>

      <!-- Bookings Card -->
      <div class="card p-3">
        <h4>
          <i class="fas fa-clock"></i> Bookings
        </h4>
        <!-- Display total count of bookings -->
        <p id="bookingCount" class="mb-2">Total Bookings: 0</p>
        <!-- Table for dynamically loaded bookings -->
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Booking ID</th>
                <th>Date</th>
                <th>Vehicle</th>
                <th>Pickup</th>
                <th>Dropoff</th>
              </tr>
            </thead>
            <tbody id="bookingTableBody">
              <tr>
                <td colspan="5">No bookings found.</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Generate Bill Button -->
      <a id="goToBillPage" href="BillMake.jsp?name=N/A&id=N/A" class="btn btn-primary">
        <i class="fas fa-file-invoice"></i> Generate Bill
      </a>
    </div>
  </div>

  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">
      &copy; 2023 MegaCityCab. All rights reserved.
    </p>
    <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
      Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
    </p>
  </footer>
  
  <script>
    function getCookie(name) {
      const cookieArr = document.cookie.split(';');
      for (let cookie of cookieArr) {
        cookie = cookie.trim();
        if (cookie.startsWith(name + "=")) {
          return decodeURIComponent(cookie.substring(name.length + 1));
        }
      }
      return "";
    }

    function loadUserData() {
      const userName = getCookie("name") || "Guest";
      const userID = getCookie("userID") || "N/A";

      document.getElementById("userName").textContent = userName;
      document.getElementById("userID").textContent = userID;

      sessionStorage.setItem("employeeName", userName);
      sessionStorage.setItem("employeeID", userID);

      document.getElementById("goToBillPage").href = "BillMake.jsp?name=" + encodeURIComponent(userName) + "&id=" + encodeURIComponent(userID);
    }

    function loadBookings() {
      // Adjust the URL if your context path is different.
      fetch("EmployeeFetchBookingsServlet")
        .then(response => response.json())
        .then(bookings => {
          console.log("Fetched bookings:", bookings); 
          document.getElementById("bookingCount").textContent = "Total Bookings: " + (bookings ? bookings.length : 0);
          
          const tableBody = document.getElementById("bookingTableBody");
          if (!bookings || bookings.length === 0) {
            tableBody.innerHTML = `<tr><td colspan="5">No bookings found.</td></tr>`;
          } else {
            let html = "";
            bookings.forEach(b => {
              console.log("Booking data:", b); 
              html += "<tr>";
              html += "<td>" + (b.bookingId || "N/A") + "</td>";
              html += "<td>" + (b.bookingDate || "N/A") + "</td>";
              html += "<td>" + (b.vehicle || "N/A") + "</td>";
              html += "<td>" + (b.pickupLocation || "N/A") + "</td>";
              html += "<td>" + (b.dropoffLocation || "N/A") + "</td>";
              html += "</tr>";
            });
            tableBody.innerHTML = html;
          }
        })
        .catch(error => {
          console.error("Error fetching bookings:", error);
          document.getElementById("bookingTableBody").innerHTML = `<tr><td colspan="5">Error loading bookings.</td></tr>`;
        });
    }

    document.addEventListener("DOMContentLoaded", function() {
      loadUserData();
      loadBookings();

      const themeSelector = document.getElementById("themeSelector");
      themeSelector.addEventListener("change", function() {
        document.body.classList.remove("dark-mode", "night-mode");
        if (this.value === "dark") {
          document.body.classList.add("dark-mode");
        } else if (this.value === "night") {
          document.body.classList.add("night-mode");
        }
      });
    });
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
