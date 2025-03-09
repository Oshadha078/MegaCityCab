<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>My Bill Information</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  
  <style>
    /* Allow scrolling if there is overflow */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    /* Background image styles */
    body::before {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('data:image/jpeg;base64,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');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      filter: blur(8px);
      z-index: -1;
    }
    body::after {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.3); 
      z-index: -1;
    }
    /* Navbar styling */
    .navbar {
      background-color: #FFD700; 
    }
    .navbar .navbar-brand, 
    .navbar .nav-link {
      color: #000 !important; 
      font-weight: bold;
    }
    .navbar .nav-link:hover {
      color: #333 !important; 
    }
    .navbar-nav .nav-link { 
      font-size: 1rem; 
      margin-right: 1rem; 
    }
    /* Flex container for sidebar and content */
    .page-container {
      display: flex;
    }
    /* Sidebar styling */
    #sidebar {
      min-width: 250px;
      max-width: 250px;
      background-color: #fae050;
      min-height: 100vh;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    #sidebar .nav-link { 
      color: #0a0a09; 
      padding: 0.75rem 1rem; 
    }
    #sidebar .nav-link:hover { 
      background-color: #FFD700; 
    }
    #sidebar .sidebar-heading {
      color: #0a0a09;
      padding: 1rem;
      font-size: 1.2rem;
      text-align: center;
      border-bottom: 1px solid #495057;
    }
    /* Main content styling */
    .content {
      flex: 1;
      margin: 2rem;
    }
    .container-content { margin-top: 40px; }
    .background-box {
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }
    /* Bill display styles */
    .bill-container {
      width: 100%;
      padding: 30px;
      border: 1px solid #ddd;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      background-color: white;
      margin-bottom: 20px;
    }
    .bill-header {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }
    .company-info {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
    }
    .company-info h1 {
      margin: 10px 0 5px;
      color: #333;
      font-size: 24pt;
    }
    .tagline {
      font-size: 10pt;
      color: #666;
      margin-top: 0;
    }
    .logo {
      width: 80px;
      height: auto;
    }
    .bill-details {
      text-align: right;
    }
    .bill-details h2 {
      color: #333;
      margin-bottom: 10px;
    }
    .bill-info-table {
      border-collapse: collapse;
    }
    .bill-info-table td {
      padding: 3px 0;
    }
    .bill-info-table td:first-child {
      padding-right: 10px;
    }
    .divider {
      border: none;
      border-top: 2px solid #333;
      margin: 15px 0;
    }
    .bill-body {
      margin-bottom: 30px;
    }
    .customer-details {
      width: 100%;
      margin-bottom: 30px;
    }
    .customer-details .label {
      font-weight: bold;
      width: 150px;
      vertical-align: top;
      padding: 5px 0;
    }
    .customer-details .value {
      padding: 5px 0;
    }
    .charges-table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 30px;
    }
    .charges-table th, .charges-table td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    .charges-table th {
      background-color: #f2f2f2;
      font-weight: bold;
    }
    .amount {
      text-align: right;
    }
    .total-row {
      border-top: 2px solid #333;
      background-color: #f9f9f9;
    }
    .bill-footer {
      text-align: center;
      margin-top: 50px;
      font-size: 10pt;
      color: #666;
      border-top: 1px solid #ddd;
      padding-top: 15px;
    }
    .bill-footer p {
      margin: 5px 0;
    }
  </style>
</head>
<body>
  <!-- Top Navbar (Fixed at the top) -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Customer Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" 
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Flex Container for Sidebar and Main Content -->
  <div class="page-container">
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
    <div class="content container-content">
      <div class="background-box">
        <h2 class="text-center mb-4">My Bill Information</h2>
        <!-- Loading Indicator -->
        <div id="loading-message" class="text-center mb-3">Loading bills...</div>
        <!-- Bill Cards Container -->
        <div class="row" id="bill-list">
          <!-- Bill cards will be inserted here dynamically -->
        </div>
      </div>
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
      const customerID = getCookie("userID");
      if (!customerID) {
        alert("User not logged in or userID cookie not found.");
        return;
      }
      
      fetch(`FetchBillsJsonServlet?customerID=${customerID}`)
        .then(response => {
          if (!response.ok) {
            throw new Error("Network response was not ok: " + response.statusText);
          }
          return response.json();
        })
        .then(bills => {
          // Hide the loading indicator
          document.getElementById("loading-message").style.display = "none";
          
          const billList = document.getElementById("bill-list");
          billList.innerHTML = "";
          if (bills.length === 0) {
            billList.innerHTML = `<div class="col-12 text-center">No bills found.</div>`;
            return;
          }
          bills.forEach(bill => {
            // Wrap each bill card in a column for responsive layout
            const card = `
              <div class="col-md-6 mb-4">
                <div class="bill-container">
                  <div class="bill-header d-flex justify-content-between">
                    <div class="company-info">
                      <img src="https://png.pngtree.com/png-clipart/20230924/original/pngtree-car-location-vector-icon-on-white-background-background-travel-sign-vector-png-image_12750844.png" alt="Mega City Cab Logo" class="logo">
                      <h1>MEGA CITY CAB</h1>
                      <p class="tagline">Your Reliable Transport Partner</p>
                    </div>
                    <div class="bill-details">
                      <h2>RECEIPT</h2>
                      <table class="bill-info-table">
                        <tr>
                          <td><strong>Bill ID:</strong></td>
                          <td>${bill.id}</td>
                        </tr>
                        <tr>
                          <td><strong>Date:</strong></td>
                          <td>${bill.billDate}</td>
                        </tr>
                      </table>
                    </div>
                  </div>
                  <hr class="divider">
                  <div class="bill-body">
                    <table class="customer-details">
                      <tr>
                        <td class="label">Employee Name:</td>
                        <td class="value">${bill.employeeName}</td>
                      </tr>
                      <tr>
                        <td class="label">Service Type:</td>
                        <td class="value">Transportation</td>
                      </tr>
                  
                    </table>
                    <table class="charges-table">
                      <thead>
                        <tr>
                          <th>Description</th>
                          <th>Amount</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Transportation Service</td>
                          <td class="amount">$${parseFloat(bill.amount).toFixed(2)}</td>
                        </tr>
                        <tr class="total-row">
                          <td><strong>TOTAL</strong></td>
                          <td class="amount"><strong>$${parseFloat(bill.amount).toFixed(2)}</strong></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="bill-footer">
                    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
                    <p>Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
                    <p>Thank you for choosing Mega City Cab!</p>
                  </div>
                </div>
              </div>
            `;
            billList.innerHTML += card;
          });
        })
        .catch(error => {
          console.error("Error fetching bills:", error);
          document.getElementById("bill-list").innerHTML = `<div class="col-12 text-center text-danger">Error loading bill data.</div>`;
        });
    }
    
    // Initialize page after DOM content is fully loaded
    window.addEventListener("DOMContentLoaded", loadUserBills);
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">
      &copy; 2023 MegaCityCab. All rights reserved.
    </p>
    <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
      Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
    </p>
  </footer>
  
</body>
</html>
