<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Manage Vehicles</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #FFF8E1;
      color: #333;
      margin: 0;
      padding: 0;
    }
    .navbar {
      background-color: #FFD700;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .navbar-brand, .navbar-nav .nav-link {
      color: #333 !important;
      font-weight: 500;
    }
    .sidebar {
      background-color: #FFD700;
      color: #333;
      min-height: 100vh;
      padding-top: 20px;
    }
    .sidebar a {
      color: #333;
      padding: 10px 15px;
      display: block;
      text-decoration: none;
      transition: background-color 0.3s ease, padding-left 0.3s ease;
    }
    .sidebar a:hover {
      background-color: #FFC107;
      padding-left: 20px;
      text-decoration: none;
    }
    .main-content {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      margin: 20px 0;
    }
    h2, h4 {
      border-bottom: 2px solid #FFC107;
      padding-bottom: 10px;
      margin-bottom: 30px;
      font-weight: bold;
    }
    #alertMessage {
      display: none;
      margin-top: 20px;
    }
    .form-control {
      background-color: #ffffff;
      border: 1px solid #ccc;
      color: #333;
    }
    .form-control:focus {
      border-color: #FFC107;
      box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.25);
      background-color: #ffffff;
    }
    table.table {
      background-color: #ffffff;
      border-collapse: separate;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
    table.table thead {
      background-color: #FFD700;
    }
    table.table tbody tr:hover {
      background-color: #f1f1f1;
    }
    .btn {
      transition: background-color 0.3s ease, transform 0.2s ease;
    }
    .btn:hover {
      transform: scale(1.02);
    }
    footer {
      background-color: #343a40;
      color: #fff;
      padding: 20px 0;
      text-align: center;
      margin-top: 20px;
    }
  </style>
 <script>
  const servletUrl = window.location.origin + '/Mega_city_cab_service/ManageVehicleServlet';

  function showSuccess(message) {
    const alertDiv = document.getElementById('alertMessage');
    alertDiv.className = 'alert alert-success';
    alertDiv.innerText = message;
    alertDiv.style.display = 'block';
    setTimeout(() => { alertDiv.style.display = 'none'; }, 3000);
  }

  function showError(message) {
    const alertDiv = document.getElementById('alertMessage');
    alertDiv.className = 'alert alert-danger';
    alertDiv.innerText = message;
    alertDiv.style.display = 'block';
    setTimeout(() => { alertDiv.style.display = 'none'; }, 5000);
  }

  function loadVehicles() {
    fetch(servletUrl + '?action=listVehicles')
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
      })
      .then(data => {
        console.log("Vehicles data:", data);
        const tableBody = document.getElementById('vehiclesTableBody');
        tableBody.innerHTML = "";
        if (!Array.isArray(data) || data.length === 0) {
          tableBody.innerHTML = "<tr><td colspan='5' class='text-center'>No vehicles found</td></tr>";
        } else {
          data.forEach(vehicle => {
            // Log each vehicle to debug property names
            console.log("Vehicle:", vehicle);
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

  function addVehicle(event) {
    event.preventDefault();
    document.getElementById('action').value = "createVehicle";
    saveVehicle("Vehicle successfully added.");
  }

  function updateVehicle(event) {
      event.preventDefault();
      document.getElementById('action').value = "updateVehicle";
      saveVehicle("Vehicle successfully updated.");
    }


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

  function editVehicle(id, vehicle_no, vehicle_name, price) {
    // Set the values for editing
    document.getElementById('vehicleId').value = id;
    document.getElementById('vehicle_no').value = vehicle_no;
    document.getElementById('vehicle_name').value = vehicle_name;
    document.getElementById('price').value = price;
  }

  function deleteVehicle(id) {
    // Check explicitly for null or undefined (0 is a valid ID)
    if (id == null) {
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

  function resetForm() {
    document.getElementById('vehicleForm').reset();
    document.getElementById('vehicleId').value = "";
  }

  document.addEventListener("DOMContentLoaded", loadVehicles);
</script>

</head>
<body>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-car"></i> Admin Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="topNavbar">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2 sidebar">
        <h5 class="text-center">Menu</h5>
        <a href="admin_home.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="user_manage.jsp"><i class="fas fa-users"></i> Users</a>
        <a href="manage_vehicles.jsp"><i class="fas fa-car"></i> Vehicles</a>
        <a href="admin_bill_view.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Manage</a>
        <a href="admin_complaints.jsp"><i class="fas fa-exclamation-circle"></i> Complaints</a>
      </div>

      <div class="col-md-10">
        <div class="main-content">
          <h2 class="text-center"><i class="fas fa-car"></i> Vehicle Management</h2>
          <div id="alertMessage"></div>
          
          <form id="vehicleForm">
            <input type="hidden" id="action" name="action" value="createVehicle">
            <input type="hidden" id="vehicleId" name="id" value="">
            <div class="mb-3">
              <label for="vehicle_no" class="form-label">Vehicle Number</label>
              <input type="text" class="form-control" id="vehicle_no" name="vehicle_no" required>
            </div>
            <div class="mb-3">
              <label for="vehicle_name" class="form-label">Vehicle Name</label>
              <input type="text" class="form-control" id="vehicle_name" name="vehicle_name" required>
            </div>
            <div class="mb-3">
              <label for="price" class="form-label">Price</label>
              <input type="number" class="form-control" id="price" name="price" step="0.01" required>
            </div>
            <div class="mb-3">
              <button type="button" class="btn btn-success" onclick="addVehicle(event)"><i class="fas fa-plus-circle"></i> Add Vehicle</button>
              <button type="button" class="btn btn-primary" onclick="updateVehicle(event)"><i class="fas fa-edit"></i> Update Vehicle</button>
              <button type="reset" class="btn btn-secondary" onclick="resetForm()"><i class="fas fa-undo"></i> Reset</button>
            </div>
          </form>

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
            <tbody id="vehiclesTableBody"></tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <hr style="border-top: 1px solid #fff;">
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p>Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
