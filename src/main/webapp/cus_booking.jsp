<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Customer Booking</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  <!-- FontAwesome for Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

  <style> 
  body {
    font-family: Arial, sans-serif;
    background-color: #e5e9ec;
    background-size: cover;
    background-position: center center;
    margin: 0;
    padding: 0;
  }

  /* Navbar Styles */
  /* Navbar Styles */
	.navbar {
	  background-color: #FFD700 !important; /* Gold background */
	}
	
	.navbar-brand {
	  font-weight: bold;
	  color: #000 !important; /* Black text */
	}
	
	.navbar .nav-link {
	  color: #000 !important; /* Black text */
	  font-weight: bold;
	}
	
	.navbar .nav-link:hover {
	  color: #333 !important; /* Darker shade on hover */
	}

  /* Sidebar Styles */
	 #sidebar {
	  width: 240px;
	  background-color: #fae050; /* Yellow sidebar */
	  color: #000; /* Black text for the sidebar */
	  min-height: 100vh;
	  padding: 20px;
	}
	
	#sidebar .nav-link {
	  color: #000; /* Black text color */
	  font-weight: bold;
	  margin-bottom: 10px;
	  text-decoration: none;
	}
	
	#sidebar .nav-link:hover {
	  background-color: #FFD700; /* Slightly darker yellow on hover */
	  color: #000; /* Maintain black text color on hover */
	}


  /* Content & Cards */
  .content {
    flex: 1;
    margin: 20px;
  }

  .card {
    background: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
  }

  /* Responsive Adjustments */
  @media (max-width: 768px) {
    #sidebar { width: 100%; }
    .content { margin: 10px; }
  }
</style>

</head>


<body onload="initializePage();">
  <!-- Upper Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
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

  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar">
      <div class="sidebar-heading text-center mt-3">Menu</div>
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

    <!-- Main Content Area -->
    <div class="content">
      <!-- Booking Form Card -->
      <div class="card mb-4">
        <h4>Make a Booking</h4>
        <form action="CusBookingServlet" method="post">
          <div class="mb-3">
            <label for="customerName" class="form-label">Name:</label>
            <input type="text" class="form-control" id="customerName" name="customerName" readonly>
          </div>
          <div class="mb-3">
            <label for="customerID" class="form-label">Customer ID:</label>
            <input type="text" class="form-control" id="customerID" name="customerID" readonly>
          </div>
          <div class="mb-3">
            <label for="pickupLocation" class="form-label">Pickup Location:</label>
            <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" placeholder="Enter pickup location" required>
          </div>
          <div class="mb-3">
            <label for="vehicle" class="form-label">Select Vehicle:</label>
            <select class="form-control" id="vehicle" name="vehicle" required>
              <option value="">-- Select Vehicle --</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="dropoffLocation" class="form-label">Dropoff Location:</label>
            <input type="text" class="form-control" id="dropoffLocation" name="dropoffLocation" placeholder="Enter dropoff location" required>
          </div>
          <div class="mb-3">
            <label for="bookingDate" class="form-label">Booking Date:</label>
            <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
          </div>
          <button type="submit" class="btn btn-primary">Submit Booking</button>
        </form>
      </div>
      
      <!-- Bookings List Card -->
      <div class="card mb-4">
        <h4>My Bookings</h4>
        <table class="table table-bordered">
          <thead class="table-dark">
            <tr>
              <th>Booking ID</th>
              <th>Pickup Location</th>
              <th>Dropoff Location</th>
              <th>Vehicle</th>
              <th>Booking Date</th>
              
            </tr>
          </thead>
          <tbody id="bookingTableBody">
           
          </tbody>
        </table>
      </div>
    </div>
  </div>

 <script>
 function loadVehicles() {
	  // Use relative URL if the servlet is in the same context.
	  const url = "FetchVehiclesServlet"; 
	 
	  fetch(url)
	    .then(response => {
	      if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
	      return response.json();
	    })
	    .then(data => {
	      const vehicleSelect = document.getElementById("vehicle");
	      vehicleSelect.innerHTML = "<option value=''>-- Select Vehicle --</option>";
	      data.forEach(vehicle => {
	        const option = document.createElement("option");
	        option.value = vehicle.id;
	        option.textContent = `\${vehicle.vehicleName} (\${vehicle.vehicleNo}) - Rs: \${vehicle.price}`;
	        vehicleSelect.appendChild(option);
	      });
	    })
	    .catch(error => {
	      console.error('Error loading vehicles:', error);
	      alert("Error loading vehicles: " + error.message);
	    });
	}

  function getCookie(name) {
    const cookieArr = document.cookie.split(";");
    for (let cookie of cookieArr) {
      cookie = cookie.trim();
      if (cookie.indexOf(name + "=") === 0) {
        return decodeURIComponent(cookie.substring(name.length + 1));
      }
    }
    return "";
  }

  function loadUserData() {
    const userName = getCookie("name") || "Guest";
    const userID = getCookie("userID") || "N/A";
    document.getElementById("customerName").value = userName;
    document.getElementById("customerID").value = userID;
  }

  function loadBookings() {
    const customerId = getCookie("userID");
    if (!customerId) {
      alert("User not logged in.");
      return;
    }

    const url = window.location.origin + '/Mega_city_cab_service/FetchBookingsServlet?customerId=' + customerId;
    fetch(url)
      .then(response => {
        if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
        return response.json();
      })
      .then(data => {
        const html = data.length
          ? data.map(booking => `
              <tr>
                <td>\${booking.bookingId}</td>
                <td>\${booking.pickupLocation}</td>
                <td>\${booking.dropoffLocation}</td>
                <td>\${booking.vehicle}</td>
                <td>\${booking.bookingDate}</td>
               
              </tr>`).join('')
          : "<tr><td colspan='6'>No bookings available.</td></tr>";
        document.getElementById("bookingTableBody").innerHTML = html;
      })
      .catch(error => {
        console.error("Error loading bookings:", error);
        document.getElementById("bookingTableBody").innerHTML =
          "<tr><td colspan='6'>Error loading bookings.</td></tr>";
      });
  }

  function deleteBooking(bookingId) {
    bookingId = parseInt(bookingId);
    console.log("Deleting Booking ID:", bookingId);

    if (isNaN(bookingId)) {
      alert("Invalid Booking ID. Please refresh the page and try again.");
      return;
    }

    const params = new URLSearchParams();
    params.append("bookingId", bookingId);

    fetch(window.location.origin + '/MegaCityCabAssignment/DeleteBookingServlet', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: params.toString()
    })
    .then(response => response.text().then(text => text ? JSON.parse(text) : {}))
    .then(data => {
      if (data.success) {
        alert(data.message);
        loadBookings();
      } else {
        alert("Error: " + data.message);
      }
    })
    .catch(error => {
      console.error("Delete booking error:", error);
      alert("Failed to delete booking. Check console for details.");
    });
  }

  // Define the initializePage function to call all needed functions.
  function initializePage() {
    loadUserData();
    loadVehicles();
    loadBookings();
  }
  </script>

<footer class="mt-4 text-center text-white" style="background-color: #343a40; padding: 15px;">
  <p>&copy; 2023 MegaCityCab | Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
