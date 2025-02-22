<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Manage Vehicles</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
  /* Ensure input, textarea, and select text is dark for readability */
  .form-control {
    background-color: #ffffff;
    border: 1px solid #ccc;
    color: #333; /* Dark text for contrast */
  }

  .form-control::placeholder {
    color: #999; /* Light placeholder text */
  }

  .form-control:focus {
    border-color: #FFC107; /* Amber accent */
    box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.25);
    background-color: #ffffff;
    color: #333;
  }
  
  /* Global Styles */
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #FFF8E1; /* Light yellow background */
    color: #333; /* Dark text for contrast */
    margin: 0;
    padding: 0;
  }
  
  /* Top Navbar Styling */
  .navbar {
    background-color: #FFD700; /* Taxi yellow */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }
  .navbar-brand, .navbar-nav .nav-link {
    color: #333 !important;
    font-weight: 500;
  }
  
  /* Sidebar Styling */
  .sidebar {
    background-color: #FFD700; /* Taxi yellow */
    color: #333;
    min-height: 100vh;
    padding-top: 20px;
  }
  .sidebar h5 {
    margin-bottom: 1.5rem;
  }
  .sidebar a {
    color: #333;
    padding: 10px 15px;
    display: block;
    text-decoration: none;
    transition: background-color 0.3s ease, padding-left 0.3s ease;
  }
  .sidebar a:hover {
    background-color: #FFC107; /* Amber hover effect */
    padding-left: 20px;
    text-decoration: none;
  }
  
  /* Main Content Styling */
  .main-content {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    margin-top: 20px;
    margin-bottom: 20px;
  }
  
  /* Headings and Alerts */
  h2.text-center, h4 {
    border-bottom: 2px solid #FFC107; /* Amber border */
    padding-bottom: 10px;
    margin-bottom: 30px;
  }
  #alertMessage {
    margin-top: 20px;
  }
  
  /* Form Styling */
  form#vehicleForm {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    margin-bottom: 30px;
  }
  /* (Re)define .form-control for form elements */
  .form-control {
    background-color: #ffffff;
    border: 1px solid #ccc;
    color: #333;
  }
  .form-control:focus {
    border-color: #FFC107;
    box-shadow: 0 0 0 0.2rem rgba(255,193,7,0.25);
    background-color: #ffffff;
  }
  label {
    font-weight: 500;
  }
  
  /* Table Styling */
  table.table {
    background-color: #ffffff;
    border-collapse: separate;
    border-spacing: 0;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
  }
  table.table thead {
    background-color: #FFD700;
  }
  table.table th, table.table td {
    border: 1px solid #ccc;
    vertical-align: middle;
    text-align: center;
  }
  table.table tbody tr:hover {
    background-color: #f1f1f1;
  }
  
  /* Button Enhancements */
  .btn {
    transition: background-color 0.3s ease, transform 0.2s ease;
  }
  .btn:hover {
    transform: scale(1.02);
  }
  
  /* Responsive Adjustments */
  @media (max-width: 768px) {
    .sidebar {
      min-height: auto;
      padding: 15px;
    }
    form#vehicleForm {
      padding: 15px;
    }
    .main-content {
      margin-top: 10px;
    }
  }
</style>

  
  <script>
    // Adjust the context path as needed.
    const servletUrl = window.location.origin + '/MegaCityCab/ManageVehicleServlet';

    // Display a success message.
    function showSuccess(message) {
      const alertDiv = document.getElementById('alertMessage');
      alertDiv.className = 'alert alert-success';
      alertDiv.innerText = message;
      alertDiv.style.display = 'block';
      setTimeout(() => { alertDiv.style.display = 'none'; }, 3000);
    }

    // Display an error message.
    function showError(message) {
      const alertDiv = document.getElementById('alertMessage');
      alertDiv.className = 'alert alert-danger';
      alertDiv.innerText = message;
      alertDiv.style.display = 'block';
      setTimeout(() => { alertDiv.style.display = 'none'; }, 5000);
    }

    // Load vehicles from the servlet.
    function loadVehicles() {
      fetch(servletUrl + '?action=listVehicles')
        .then(response => response.json())
        .then(data => {
          const tableBody = document.getElementById('vehiclesTableBody');
          tableBody.innerHTML = "";
          if (data.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='5' class='text-center'>No vehicles found</td></tr>";
          } else {
            data.forEach(vehicle => {
              tableBody.innerHTML += `
                <tr>
                  <td>${vehicle.id}</td>
                  <td>${vehicle.vehicleNo}</td>
                  <td>${vehicle.vehicleName}</td>
                  <td>${vehicle.price}</td>
                  <td>
                    <button class="btn btn-warning btn-sm" onclick='editVehicle(${vehicle.id}, ${JSON.stringify(vehicle.vehicleNo)}, ${JSON.stringify(vehicle.vehicleName)}, ${vehicle.price})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteVehicle(${vehicle.id})">Delete</button>
                  </td>
                </tr>
              `;
            });
          }
        })
        .catch(error => {
          console.error('Error loading vehicles:', error);
          showError("Error loading vehicles: " + error.message);
        });
    }

    // Add a new vehicle.
    function addVehicle(event) {
      event.preventDefault();
      document.getElementById('action').value = "createVehicle";
      saveVehicle("Vehicle successfully added.");
    }

    // Update an existing vehicle.
    function updateVehicle(event) {
      event.preventDefault();
      document.getElementById('action').value = "updateVehicle";
      saveVehicle("Vehicle successfully updated.");
    }

    // Save vehicle data (used for both create and update).
    function saveVehicle(successMessage) {
      const formData = new FormData(document.getElementById('vehicleForm'));
      fetch(servletUrl, {
        method: 'POST',
        body: formData
      })
      .then(response => {
        if (!response.ok) {
          return response.text().then(text => { throw new Error(text); });
        }
        return response.json();
      })
      .then(data => {
        if (data.status === "success") {
          document.getElementById('vehicleForm').reset();
          loadVehicles();
          showSuccess(successMessage + " (Rows affected: " + data.rowsAffected + ")");
        } else if (data.error) {
          showError("Error: " + data.error);
        }
      })
      .catch(error => {
        console.error('Error saving vehicle:', error);
        showError("Error saving vehicle: " + error.message);
      });
    }

    // Pre-fill form fields for editing.
    function editVehicle(id, vehicle_no, vehicle_name, price) {
      document.getElementById('vehicleId').value = id;
      document.getElementById('vehicle_no').value = vehicle_no;
      document.getElementById('vehicle_name').value = vehicle_name;
      document.getElementById('price').value = price;
    }

    // Delete a vehicle.
    function deleteVehicle(id) {
      if (!id) {
        showError("Error: Vehicle ID is undefined!");
        return;
      }
      if (confirm("Are you sure you want to delete this vehicle?")) {
        const formData = new FormData();
        formData.append('action', 'deleteVehicle');
        formData.append('id', id);

        fetch(servletUrl, {
          method: 'POST',
          body: formData
        })
        .then(response => response.json())
        .then(data => {
          if (data.status === "success") {
            loadVehicles();
            showSuccess("Vehicle successfully deleted.");
          } else if (data.error) {
            showError("Error: " + data.error);
          }
        })
        .catch(error => {
          console.error('Error deleting vehicle:', error);
          showError("Error deleting vehicle: " + error.message);
        });
      }
    }

    // Reset form and clear hidden fields.
    function resetForm() {
      document.getElementById('vehicleForm').reset();
      document.getElementById('vehicleId').value = "";
    }

    // Load vehicles when the page loads.
    document.addEventListener("DOMContentLoaded", loadVehicles);
  </script>
</head>
<body>
  <!-- Top Navigation Bar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Admin Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavbar" 
              aria-controls="topNavbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="topNavbar">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="Login.jsp">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <div class="container-fluid">
    <div class="row">
      <!-- Side Navigation Bar -->
      <div class="col-md-2 sidebar">
        <h5 class="text-center">Menu</h5>
        <a href="#">Dashboard</a>
        <a href="user_manage.jsp">Users</a>
        <a href="manage_vehicles.jsp">Vehicles</a>
        <a href="admin_bill_view.jsp">Bill Manage</a>
        <a href="#">Support</a>
      </div>
      
      <!-- Main Content Area -->
      <div class="col-md-10">
        <div class="main-content">
          <h2 class="text-center">Vehicle Management</h2>
          <!-- Alert Message -->
          <div id="alertMessage" style="display:none;"></div>
          
          <hr>
          <!-- Vehicle Form -->
          <form id="vehicleForm">
            <!-- Hidden fields -->
            <input type="hidden" id="action" name="action" value="createVehicle">
            <input type="hidden" id="vehicleId" name="id" value="">
            
            <div class="mb-3">
              <label for="vehicle_no" class="form-label">Vehicle Number</label>
              <input type="text" class="form-control" id="vehicle_no" name="vehicle_no" placeholder="Enter vehicle number" required>
            </div>
            <div class="mb-3">
              <label for="vehicle_name" class="form-label">Vehicle Name</label>
              <input type="text" class="form-control" id="vehicle_name" name="vehicle_name" placeholder="Enter vehicle name" required>
            </div>
            <div class="mb-3">
              <label for="price" class="form-label">Price</label>
              <input type="number" step="0.01" class="form-control" id="price" name="price" placeholder="Enter price" required>
            </div>
            <div class="mb-3">
              <button type="button" class="btn btn-success" onclick="addVehicle(event)">Add Vehicle</button>
              <button type="button" class="btn btn-primary" onclick="updateVehicle(event)">Update Vehicle</button>
              <button type="reset" class="btn btn-secondary" onclick="resetForm()">Reset</button>
            </div>
          </form>
          
          <hr>
          <!-- Vehicles Table -->
          <h4>Vehicles List</h4>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>ID</th>
                <th>Vehicle Number</th>
                <th>Vehicle Name</th>
                <th>Price</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody id="vehiclesTableBody">
              <!-- Vehicle rows will be loaded here dynamically -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
