<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Bill View with Sidebar</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #e5e9ec;
      color: #e0e0e0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    a {
      color: #e0e0e0;
      text-decoration: none;
    }
    a:hover {
      color: #bb86fc;
    }
	    .navbar {
	  background-color: #fae050; /* Yellow background */
	}
	
	.navbar .navbar-brand, 
	.navbar .nav-link {
	  color: #000 !important; /* Black text color */
	  font-weight: bold;
	}
	
	.navbar .nav-link:hover {
	  color: #333 !important; /* Darker black on hover */
	}

    
    /* Updated Sidebar */
    .sidebar {
      background: linear-gradient(180deg, #343a40, #1e1e1e);
      color: #fae050;
      min-height: 100vh;
      padding-top: 20px;
      padding-left: 15px;
      transition: all 0.3s ease-in-out;
    }
    .sidebar h5 {
      text-align: center;
      margin-bottom: 1.5rem;
      font-weight: bold;
    }
    .sidebar a {
      display: flex;
      align-items: center;
      padding: 10px 15px;
      border-radius: 5px;
      font-size: 16px;
      font-weight: 500;
      transition: background 0.3s ease, padding-left 0.3s ease;
    }
    .sidebar a i {
      margin-right: 10px;
      font-size: 18px;
    }
    .sidebar a:hover {
      background-color: #495057;
      padding-left: 20px;
    }

    /* Main Content */
    .main-content {
      background-color: #1e1e1e;
      padding: 20px;
      border-radius: 8px;
      margin-top: 20px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
    }
    
    .table {
      background-color: #1e1e1e;
    }
    
    .btn-danger {
      background-color: #bb86fc;
      border: none;
      color: #121212;
      transition: background-color 0.3s, transform 0.2s;
    }
  </style>
  <script>
    // Adjust the URL according to your context path.
    const billsServletUrl = window.location.origin + '/Mega_city_cab_service/AdminBillJsonServlet';

    // Load bills via AJAX
    function loadBills() {
      fetch(billsServletUrl)
        .then(response => {
          if (!response.ok) {
            return response.text().then(text => { throw new Error(text); });
          }
          return response.json();
        })
        .then(data => {
          console.log("Bills data received:", data);
          const tableBody = document.getElementById('billTableBody');
          tableBody.innerHTML = "";
          if (data.length === 0) {
            tableBody.innerHTML = "<tr><td colspan='11' class='text-center'>No bills found</td></tr>";
          } else {
            data.forEach(bill => {
              tableBody.innerHTML += `
                <tr>
                  <td>${bill.id}</td>
                  <td>${bill.employeeName}</td>
                  <td>${bill.employeeId}</td>
                  <td>${bill.bookingId}</td>
                  <td>${bill.customerId}</td>
                  <td>${bill.vehicle}</td>
                  <td>${bill.kilometers}</td>
                  <td>${bill.perKmRate}</td>
                  <td>${bill.amount}</td>
                  <td>${bill.billDate}</td>
                  <td>
                    
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="deleteBill(${bill.id})">
                      Delete
                    </button>
                  </td>
                </tr>`;
            });
          }
        })
        .catch(error => {
          console.error('Error loading bills:', error);
          alert("Error loading bills: " + error.message);
        });
    }

    // Delete a bill via AJAX
    function deleteBill(billId) {
      if (confirm("Are you sure you want to delete this bill?")) {
        const deleteUrl = window.location.origin + '/Mega_city_cab_service/AdminBillDeleteServlet?id=' + billId;
        fetch(deleteUrl, { method: 'GET' })
          .then(response => {
            if (!response.ok) {
              return response.text().then(text => { throw new Error(text); });
            }
            return response.text();
          })
          .then(() => {
            loadBills();
            alert("Bill successfully deleted.");
          })
          .catch(error => {
            console.error('Error deleting bill:', error);
            alert("Error deleting bill: " + error.message);
          });
      }
    }


    // Toggle night mode theme
    function setTheme(theme) {
      document.body.classList.toggle("night-mode", theme === "night");
    }

    // Load bills when the page loads
    document.addEventListener("DOMContentLoaded", loadBills);
  </script>
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="adminhome.html">Bills Management - Admin Dashboard</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="themeDropdown" data-bs-toggle="dropdown">
            <i class="fas fa-adjust"></i> Theme
          </a>
        
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Login.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </li>
      </ul>
    </div>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-2 sidebar">
        <h5 class="text-center text-white">Menu</h5>
        <a href="admin_home.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="user_manage.jsp"><i class="fas fa-users"></i> Users</a>
        <a href="manage_vehicles.jsp"><i class="fas fa-car"></i> Vehicles</a>
        <a href="admin_bill_view.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Manage</a>
        <a href="admin_complaints.jsp"><i class="fas fa-exclamation-circle"></i> Complaints</a>
      </div>

      <!-- Main Content Area -->
      <div class="col-md-10 content">
        <h2><i class="fas fa-file-invoice"></i> All Bills</h2>
        <div class="table-responsive">
          <table class="table table-striped table-bordered">
            <thead class="thead-dark">
              <tr>
                <th>ID</th>
                <th>Employee Name</th>
                <th>Employee ID</th>
                <th>Booking ID</th>
                <th>Customer ID</th>
                <th>Vehicle</th>
                <th>Kilometers</th>
                <th>Per KM Rate</th>
                <th>Amount</th>
                <th>Bill Date</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody id="billTableBody">
              <!-- Bill rows will be dynamically inserted here -->
            </tbody>
          </table>
        </div>
        <p id="rowCount" class="text-muted"></p>
      </div>
    </div>
  </div>

  <!-- Update Bill Modal -->
  <div class="modal fade" id="updateBillModal" tabindex="-1" aria-labelledby="updateBillModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <form id="updateBillForm" onsubmit="updateBill(event)">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="updateBillModalLabel">Update Bill</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" id="updateBillId" name="id" />
            <div class="mb-3">
              <label for="updateEmployeeName" class="form-label">Employee Name</label>
              <input type="text" class="form-control" id="updateEmployeeName" name="employee_name" required />
            </div>
            <div class="mb-3">
              <label for="updateEmployeeId" class="form-label">Employee ID</label>
              <input type="number" class="form-control" id="updateEmployeeId" name="employee_id" required />
            </div>
            <div class="mb-3">
              <label for="updateBookingId" class="form-label">Booking ID</label>
              <input type="number" class="form-control" id="updateBookingId" name="booking_id" required />
            </div>
            <div class="mb-3">
              <label for="updateCustomerId" class="form-label">Customer ID</label>
              <input type="number" class="form-control" id="updateCustomerId" name="customer_id" required />
            </div>
            <div class="mb-3">
              <label for="updateVehicle" class="form-label">Vehicle</label>
              <input type="text" class="form-control" id="updateVehicle" name="vehicle" required />
            </div>
            <div class="mb-3">
              <label for="updateKilometers" class="form-label">Kilometers</label>
              <input type="number" step="0.01" class="form-control" id="updateKilometers" name="kilometers" required />
            </div>
            <div class="mb-3">
              <label for="updatePerKmRate" class="form-label">Per KM Rate</label>
              <input type="number" step="0.01" class="form-control" id="updatePerKmRate" name="per_km_rate" required />
            </div>
            <div class="mb-3">
              <label for="updateAmount" class="form-label">Amount</label>
              <input type="number" step="0.01" class="form-control" id="updateAmount" name="amount" required />
            </div>
            <div class="mb-3">
              <label for="updateBillDate" class="form-label">Bill Date</label>
              <input type="date" class="form-control" id="updateBillDate" name="bill_date" required />
            </div>
          </div>
          
        </div>
      </form>
    </div>
  </div>
  
  <!-- Bootstrap 5 JS Bundle -->
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