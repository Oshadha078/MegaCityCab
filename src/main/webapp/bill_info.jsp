<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>My Bill Information</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

  <style>
  /* Global Styles */
  body {
    font-family: Arial, sans-serif;
    background-color: #fff8e1; /* light yellow background */
    margin: 0;
    padding: 0;
    transition: background-color 0.3s ease, color 0.3s ease;
  }
  /* Upper Navbar Styles */
  .navbar-brand {
    font-weight: bold;
  }
  .navbar-nav .nav-link {
    font-size: 1rem;
    margin-right: 1rem;
    color: #333; /* dark text for contrast */
  }
  /* Side Navbar Styles */
  #sidebar {
    min-width: 200px;
    max-width: 250px;
    background-color: #FFD700; /* bright yellow */
    min-height: 100vh;
    transition: background-color 0.3s ease, color 0.3s ease;
  }
  #sidebar .nav-link {
    color: #333; /* dark text */
    padding: 0.75rem 1rem;
  }
  #sidebar .nav-link:hover {
    background-color: #FFB300; /* amber hover effect */
  }
  #sidebar .sidebar-heading {
    color: #333;
    padding: 1rem;
    font-size: 1.2rem;
    text-align: center;
    border-bottom: 1px solid #FFB300;
  }
  /* Main Content Area */
  .content {
    margin: 2rem;
    transition: background-color 0.3s ease, color 0.3s ease;
  }
  .container-content {
    margin-top: 40px;
  }
  .table thead {
    background-color: #FFD700; /* use yellow for table header */
    color: #333; /* dark text for readability */
    transition: background-color 0.3s ease;
  }
  /* Theme Selector Dropdown */
  #themeSelector {
    width: auto;
    margin-left: 1rem;
  }
  /* Dark Mode Overrides */
  .dark-mode {
    background-color: #333 !important;
    color: #fff !important;
  }
  .dark-mode .navbar {
    background-color: #FFB300 !important; /* amber navbar in dark mode */
  }
  .dark-mode #sidebar {
    background-color: #FFB300 !important;
  }
  .dark-mode .content,
  .dark-mode .table thead {
    background-color: #444 !important;
    color: #fff !important;
  }
  /* Night Mode Overrides */
  .night-mode {
    background-color: #1c1c1c !important;
    color: #e0e0e0 !important;
  }
  .night-mode .navbar {
    background-color: #FFB300 !important;
  }
  .night-mode #sidebar {
    background-color: #FFB300 !important;
  }
  .night-mode .content,
  .night-mode .table thead {
    background-color: #2c2c2c !important;
    color: #e0e0e0 !important;
  }
  /* Responsive adjustments */
  @media (max-width: 768px) {
    .d-flex {
      flex-direction: column;
    }
    #sidebar {
      max-width: 100%;
      min-height: auto;
    }
    .content {
      margin: 1rem;
    }
  }
</style>

</head>
<body onload="initializePage();">
  
  <!-- Upper Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Customer Dashboard</a>
      <div class="d-flex align-items-center">
        <a class="nav-link text-white" href="#">Home</a>
        <!-- Theme Selector Dropdown -->
        <select id="themeSelector" class="form-select form-select-sm">
          <option value="default">Default</option>
          <option value="dark">Dark Mode</option>
          <option value="night">Night Mode</option>
        </select>
        <a class="btn btn-outline-light ms-3" href="LogoutServlet">Logout</a>
      </div>
    </div>
  </nav>
  
  <!-- Layout: Side Navbar + Main Content -->
  <div class="d-flex">
    <!-- Side Navbar -->
    <div id="sidebar">
      <div class="sidebar-heading">Menu</div>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a class="nav-link" href="#">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cus_booking.jsp">Manage Bookings</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bill_info.jsp">Bill Information</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="LogoutServlet">Exit</a>
        </li>
      </ul>
    </div>
    
    <!-- Main Content -->
    <div class="content container-content">
      <h2 class="text-center mb-4">My Bill Information</h2>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Bill ID</th>
            <th>Employee Name</th>
            <th>Amount</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody id="bill-table-body">
          <!-- Bill data will be inserted here dynamically -->
        </tbody>
      </table>
    </div>
  </div>
  
  <script>
    // Utility function to retrieve a cookie value by name.
    function getCookie(name) {
      const cookies = document.cookie.split(";");
      for (let cookie of cookies) {
        let [key, value] = cookie.trim().split("=");
        if (key === name) {
          return decodeURIComponent(value);
        }
      }
      return "";
    }
    
    // Function to fetch and display bills for the logged-in user.
    function loadUserBills() {
      // Assuming the logged-in customer id is stored in a cookie named "userID"
      const customerID = getCookie("userID");
      if (!customerID) {
        alert("User not logged in or userID cookie not found.");
        return;
      }
      
      // Adjust the URL below to match your servlet mapping and context path if necessary.
      fetch(`http://localhost:8082/MegaCityCab/FetchCustomerBillsServlet?customerID=${customerID}`)
        .then(response => {
          if (!response.ok) {
            throw new Error("Network response was not ok: " + response.statusText);
          }
          return response.json();
        })
        .then(bills => {
          const tableBody = document.getElementById("bill-table-body");
          tableBody.innerHTML = "";
          if (bills.length === 0) {
            tableBody.innerHTML = `<tr><td colspan="4" class="text-center">No bills found.</td></tr>`;
            return;
          }
          bills.forEach(bill => {
            // The JSON keys will match those defined by your server-side serialization.
           const row = `
				  <tr>
				    <td>\${bill.id}</td>
				    <td>\${bill.employee_name}</td>
				    <td>$\${parseFloat(bill.amount).toFixed(2)}</td>
				    <td>\${bill.bill_date}</td>
				  </tr>
				`;
            tableBody.innerHTML += row;
          });
        })
        .catch(error => {
          console.error("Error fetching bills:", error);
          document.getElementById("bill-table-body").innerHTML = `<tr><td colspan="4" class="text-center text-danger">Error loading bill data.</td></tr>`;
        });
    }
    
    // Initialize the page: load bills and set up the theme selector.
    function initializePage() {
      loadUserBills();
    }
    
    // Theme selector event listener for three modes.
    document.addEventListener("DOMContentLoaded", function() {
      // Initialize page content.
      initializePage();
      
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
    
    // Also ensure the page is initialized on window load.
    window.onload = initializePage;
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
