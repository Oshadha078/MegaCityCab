<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Employee Home - Mega City Cab</title>

  <!-- Bootstrap & Font Awesome -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .navbar {
      background-color: #fae050;
      padding: 1rem;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
      font-size: 1.5rem;
    }

    .btn-logout {
      background-color: #dc3545;
      color: white;
      font-weight: bold;
    }

	#sidebar {
	  width: 220px;
	  background-color: #fae050; /* Yellow background */
	  min-height: 100vh;
	  padding: 1.5rem 1rem;
	  color: #000; /* Black text color */
	}
	
	#sidebar a {
	  color: #000; /* Black text color for links */
	  text-decoration: none;
	  display: block;
	  padding: 0.5rem;
	  border-radius: 4px;
	  margin-bottom: 0.5rem;
	  transition: background-color 0.3s ease, padding-left 0.3s ease;
	}
	
	#sidebar a:hover {
	  background-color: #f2d027; /* Slightly darker yellow on hover */
	  color: #f5e107; /* Maintain black text color on hover */
	}


    #sidebar a:hover {
      background-color: #f5e107s;
      padding-left: 10px;
    }

    .content {
      flex: 1;
      padding: 2rem;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .card {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      border: none;
      margin-bottom: 1.5rem;
      background-color: #fff;
    }

    .btn-primary {
      background-color: #007bff;
      border: none;
      font-weight: bold;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    #goToBillPage {
      font-size: 1.1rem;
      padding: 0.75rem 1.5rem;
      border-radius: 5px;
      margin-top: 1rem;
      transition: transform 0.2s ease;
    }

    #goToBillPage:hover {
      transform: scale(1.05);
    }

    .dark-mode {
      background-color: #343a40 !important;
      color: #f8f9fa !important;
    }

    .dark-mode #sidebar {
      background-color: #495057 !important;
    }

    .dark-mode .card {
      background-color: #3a3a3a !important;
      color: #f8f9fa !important;
    }
  </style>
</head>

<body onload="loadUserData(); loadBookings();">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-user-tie"></i> Employee Dashboard</a>
      <div class="d-flex">
        <a href="LogoutServlet" class="btn btn-logout me-2"><i class="fas fa-sign-out-alt"></i> Logout</a>
        <select id="themeSelector" class="form-select form-select-sm">
          <option value="default">Default</option>
          <option value="dark">Dark Mode</option>
        </select>
      </div>
    </div>
  </nav>

  <!-- Sidebar and Content -->
  <div class="d-flex">
    <div id="sidebar">
      <h5>Menu</h5>
      <a href="employee_home.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
      <a href="bill_make.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
      <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Exit</a>
    </div>

    <div class="content">
      <div class="card p-3">
        <h4><i class="fas fa-info-circle"></i> User Information</h4>
        <p><strong><i class="fas fa-user"></i> Name:</strong> <span id="userName">N/A</span></p>
        <p><strong><i class="fas fa-id-card"></i> ID:</strong> <span id="userID">N/A</span></p>
      </div>

      <div class="card p-3">
        <h4><i class="fas fa-clock"></i> Pending Bookings</h4>
        <p id="bookingCount">Total Bookings: 0</p>
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
              <tr><td colspan="5">No bookings found.</td></tr>
            </tbody>
          </table>
        </div>
      </div>

      <a id="goToBillPage" href="bill_make.jsp?name=N/A&id=N/A" class="btn btn-primary">
        <i class="fas fa-file-invoice"></i> Generate Bill
      </a>
    </div>
  </div>

  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px; text-align: center;">
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p>Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
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

      document.getElementById("goToBillPage").href = "bill_make.jsp?name=" + encodeURIComponent(userName) + "&id=" + encodeURIComponent(userID);
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>