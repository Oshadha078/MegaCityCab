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
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

  <style>
    body {
      background-color: #e5e9ec;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    .navbar {
      background-color: #FFD700;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .navbar .navbar-brand, 
	.navbar .nav-link {
	  color: #000 !important; /* Black text color */
	  font-weight: bold;
	}
	
	.navbar .nav-link:hover {
	  color: #333 !important; /* Darker black on hover */
	}
    
    .navbar-brand { font-weight: bold; font-size: 1.5rem; }
    .navbar-nav .nav-link { font-size: 1.1rem; margin-right: 1rem; }

    #sidebar {
      background-color: #fae050;
      color: #0a0a09;
      min-height: 100vh;
      padding: 1.5rem 1rem;
    }
    #sidebar a {
      color: #0a0a09;
      text-decoration: none;
      display: block;
      padding: 0.5rem;
      border-radius: 4px;
      margin-bottom: 0.5rem;
    }
    #sidebar a:hover { background-color: #FFD700; }

    .content {
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      margin-top: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table { width: 100%; margin-top: 20px; }
    th, td { text-align: center; }

    footer {
      background-color: #343a40;
      color: #fff;
      padding: 10px 0;
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body onload="initializePage()">
  
  <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-user-tie"></i> Employee Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ms-auto">
          <a class="nav-link" href="EmployeeHome.jsp"><i class="fas fa-home"></i> Home</a>
        </div>
      </div>
    </div>
  </nav>
  
  <!-- Main Layout -->
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-2 p-0" id="sidebar">
        <h5><i class="fas fa-bars"></i> Menu</h5>
        <a href="employee_home.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="bill_make.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Exit</a>
      </div>
      
      <!-- Content Area -->
      <div class="col-md-10">
        <div class="content">
          <h2 class="mb-3"><i class="fas fa-file-invoice-dollar"></i> Generate Bill</h2>
          
          <!-- Booking Table Section -->
          <h4><i class="fas fa-calendar-alt"></i> Available Bookings</h4>
          <p id="bookingCount" class="mb-2"></p>
          <table class="table table-bordered">
            <thead class="table-dark">
              <tr>
                <th>Booking ID</th>
                <th>Booking Date</th>
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
          
          <!-- Billing Details Form -->
          <h4 class="mt-4"><i class="fas fa-info-circle"></i> Billing Details</h4>
          <form action="BillMakeServlet" method="post">
            <!-- Employee Information -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-user"></i> Employee Name:</label>
              <input type="text" class="form-control" id="employeeName" name="employeeName" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-id-badge"></i> Employee ID:</label>
              <input type="text" class="form-control" id="employeeID" name="employeeID" readonly>
            </div>
            <!-- Booking Information -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-hashtag"></i> Booking ID:</label>
              <input type="text" class="form-control" id="bookingID" name="bookingID" readonly>
            </div>
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-user-tag"></i> Customer ID:</label>
              <input type="text" class="form-control" id="customerID" name="customerID" readonly>
            </div>
            <!-- Vehicle Name (read‑only) -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-car"></i> Vehicle:</label>
              <input type="text" class="form-control" id="vehicle" name="vehicle" readonly>
            </div>
            <!-- Kilometers Driven -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-road"></i> Kilometers Driven:</label>
              <input type="number" class="form-control" id="kilometers" name="kilometers" required oninput="calculateTotal()">
            </div>
            <!-- Rate per KM (fetched and/or editable) -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-dollar-sign"></i> Rate per KM:</label>
              <input type="number" class="form-control" id="perKmRate" name="perKmRate">
            </div>
            <!-- Optional: Dropdown to select an alternate vehicle (if needed) -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-car"></i> Select Alternate Vehicle:</label>
              <select class="form-select" id="vehicleDropdown" name="vehicleId">
                <option value="">Select Vehicle</option>
                <!-- Options will be added dynamically -->
              </select>
            </div>
            <!-- Total Amount -->
            <div class="mb-3">
              <label class="form-label"><i class="fas fa-calculator"></i> Total Amount:</label>
              <input type="number" class="form-control" id="amount" name="amount" readonly>
            </div>
            
            <button type="submit" class="btn btn-success">
              <i class="fas fa-file-invoice"></i> Generate Bill
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p>Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321</p>
  </footer>
  
<script>
    // Utility: Get a query parameter from URL
    function getQueryParam(name) {
      const urlParams = new URLSearchParams(window.location.search);
      return urlParams.get(name) || "";
    }
    
    // Load employee data and bookings
    function loadEmployeeData() {
      document.getElementById("employeeName").value = sessionStorage.getItem("employeeName") || getQueryParam("name");
      document.getElementById("employeeID").value = sessionStorage.getItem("employeeID") || getQueryParam("id");
      loadBookings();
    }
    
    // Fetch bookings – assumed structure: bookingId, bookingDate, vehicle, vehicleId, pickupLocation, dropoffLocation, etc.
    function loadBookings() {
      fetch("EmployeeFetchBookingsServlet")
        .then(response => response.json())
        .then(bookings => {
          console.log("Fetched bookings:", bookings);
          document.getElementById("bookingCount").textContent = "Total Bookings: " + (bookings ? bookings.length : 0);
          const tableBody = document.getElementById("bookingTableBody");
          if (!bookings || bookings.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='7'>No bookings found.</td></tr>";
          } else {
            let html = "";
            bookings.forEach(b => {
              html += "<tr>";
              html += "<td>" + (b.bookingId || "N/A") + "</td>";
              html += "<td>" + (b.bookingDate || "N/A") + "</td>";
              html += "<td>" + (b.vehicle || "N/A") + "</td>";
              html += "<td>" + (b.pickupLocation || "N/A") + "</td>";
              html += "<td>" + (b.dropoffLocation || "N/A") + "</td>";
              html += "<td><button class='btn btn-primary btn-sm' onclick='selectBooking(" 
                    + b.bookingId + ", " + b.customerId + ", " + b.vehicleId + ", \"" + b.vehicle + "\")'>Select</button></td>";
              html += "</tr>";
            });
            tableBody.innerHTML = html;
          }
        })
        .catch(error => {
          console.error("Error fetching bookings:", error);
          document.getElementById("bookingTableBody").innerHTML = "<tr><td colspan='7'>Error loading bookings.</td></tr>";
        });
    }
    
    // When a booking is selected, auto-fill the form and fetch the vehicle’s price.
  function selectBooking(bookingID, customerID, vehicleId, vehicleName) {
  // Display the booking and vehicle information using the name
  document.getElementById("bookingID").value = bookingID;
  document.getElementById("customerID").value = customerID;
  document.getElementById("vehicle").value = vehicleName;
  // Fetch the vehicle's rate using its name
  fetchVehiclePriceByName(vehicleName);
}

    
  function fetchVehiclePriceByName(vehicleName) {
	  // Build the URL using the vehicle name. Use encodeURIComponent to handle spaces or special characters.
	  fetch("FetchVehiclePriceServlet?name=" + encodeURIComponent(vehicleName))
	    .then(response => {
	      if (!response.ok) {
	        throw new Error("Server responded with " + response.status);
	      }
	      return response.text();
	    })
	    .then(price => {
	      if (!price) {
	        console.error("Received null price");
	        return;
	      }
	      const trimmedPrice = price.trim();
	      const numericPrice = parseFloat(trimmedPrice);
	      if (isNaN(numericPrice)) {
	        alert("Invalid price received.");
	        document.getElementById("perKmRate").value = "";
	      } else {
	        document.getElementById("perKmRate").value = numericPrice;
	      }
	      calculateTotal();
	    })
	    .catch(error => {
	      console.error("Error fetching price:", error);
	      document.getElementById("perKmRate").value = "";
	      calculateTotal();
	    });
	}

    
    // Load vehicles for the dropdown (if the user wants to override the fetched rate).
    function loadVehicles() {
      fetch("LoadVehiclesServlet")
        .then(response => response.json())
        .then(vehicles => {
          const dropdown = document.getElementById("vehicleDropdown");
          dropdown.innerHTML = "<option value=''>Select Vehicle</option>";
          vehicles.forEach(vehicle => {
            const option = document.createElement("option");
            option.value = vehicle.id;
            option.text = vehicle.vehicleName + " - $" + vehicle.price;
            option.setAttribute("data-price", vehicle.price);
            dropdown.appendChild(option);
          });
        })
        .catch(error => console.error("Error loading vehicles:", error));
    }
    
    // When a vehicle is selected from the dropdown, update the rate and (optionally) the vehicle name.
    document.getElementById("vehicleDropdown").addEventListener("change", function() {
      const selectedOption = this.options[this.selectedIndex];
      const price = selectedOption.getAttribute("data-price") || 0;
      document.getElementById("perKmRate").value = price;
      // Optionally update the vehicle name based on the dropdown selection:
      const vehicleName = selectedOption.text.split(" - $")[0];
      document.getElementById("vehicle").value = vehicleName;
      calculateTotal();
    });
    
 
    function calculateTotal() {
      const km = parseFloat(document.getElementById("kilometers").value) || 0;
      const rate = parseFloat(document.getElementById("perKmRate").value) || 0;
      document.getElementById("amount").value = (km * rate).toFixed(2);
    }
    
    // Entry point for loading data.
    function initializePage() {
      loadEmployeeData();
      loadVehicles();
    }
  </script>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>