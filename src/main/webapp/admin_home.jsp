<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Bill View with Sidebar</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Global Styles */
    body {
      background-color: #121212;
      color: #e0e0e0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    a {
      color: #e0e0e0;
    }
    a:hover {
      color: #bb86fc;
    }
    
    /* Navigation Bar */
    .navbar {
      background-color: #070708;
    }
    .navbar-brand, .navbar-nav .nav-link {
      color: #fff;
    }
    
    /* Sidebar styling */
    .sidebar {
      background-color: #343a40;
      color: #fff;
      min-height: 100vh;
      padding-top: 20px;
    }
    .sidebar a {
      color: #fff;
      padding: 10px 15px;
      display: block;
      text-decoration: none;
    }
    .sidebar a:hover {
      background-color: #495057;
      text-decoration: none;
    }
    
    /* Main Content Container */
    .main-content {
      background-color: #1e1e1e;
      padding: 20px;
      border-radius: 8px;
      margin-top: 20px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
    }
    
    /* Table Styles */
    .table {
      background-color: #1e1e1e;
    }
    .table thead th {
      background-color: #212121;
      border-bottom: 2px solid #bb86fc;
    }
    .table tbody tr {
      transition: background-color 0.3s;
    }
    .table tbody tr:hover {
      background-color: #2c2c2c;
    }
    .table-bordered, .table-bordered td, .table-bordered th {
      border: 1px solid #333;
    }
    
    /* Button Styles */
    .btn-danger {
      background-color: #bb86fc;
      border: none;
      color: #121212;
      transition: background-color 0.3s, transform 0.2s;
    }
    .btn-danger:hover {
      background-color: #d0aaff;
      transform: scale(1.05);
    }
    .btn-danger:active {
      transform: scale(0.98);
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
      .sidebar {
        min-height: auto;
        padding: 10px;
      }
      .main-content {
        margin-top: 10px;
      }
    }
  </style>
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand navbar-dark">
    <a class="navbar-brand" href="#">Admin Dashboard</a>
    <ul class="navbar-nav ms-auto">
      <li class="nav-item">
        <a class="nav-link" href="Login.html">Logout</a>
      </li>
    </ul>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-2 sidebar">
        <h5 class="text-center">Menu</h5>
        <a href="#">Dashboard</a>
        <a href="user_manage.jsp">Users</a>
        <a href="manage_vehicles.jsp">Vehicles</a>
        <a href="admin_bill_view.jsp">Bill Manage</a>
        <a href="#">Support</a>
      </div>
      <!-- Main Content -->
      <div class="col-md-10">
        <div class="main-content">
          <h2 class="mb-4">All Bills</h2>
          <table class="table table-bordered" id="billTable">
            <thead>
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
              <!-- Bill rows will be injected here dynamically -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <script>
    // Function to load all bills by calling the JSON endpoint
    function loadBills() {
      fetch('FetchBillsJsonServlet')
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok: ' + response.statusText);
          }
          return response.json();
        })
        .then(bills => {
          const tbody = document.getElementById('billTableBody');
          tbody.innerHTML = "";
          if (bills.length === 0) {
            tbody.innerHTML = `<tr><td colspan="11" class="text-center">No bills found.</td></tr>`;
            return;
          }
          bills.forEach(bill => {
            const row = document.createElement('tr');
            row.innerHTML = `
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
                <button class="btn btn-danger btn-sm" onclick="deleteBill(${bill.id})">
                  Delete
                </button>
              </td>
            `;
            tbody.appendChild(row);
          });
        })
        .catch(error => {
          console.error('Error fetching bills:', error);
          document.getElementById('billTableBody').innerHTML = `<tr><td colspan="11" class="text-center text-danger">Error loading bill data.</td></tr>`;
        });
    }

    // Function to delete a bill by ID and reload the table upon success
    function deleteBill(billId) {
      if (confirm("Are you sure you want to delete this bill?")) {
        fetch('AdminBillDeleteServlet?id=' + billId, { method: 'GET' })
          .then(response => {
            if (response.ok) {
              loadBills();
            } else {
              alert('Failed to delete bill.');
            }
          })
          .catch(error => console.error('Error deleting bill:', error));
      }
    }

    // Load bills when the page loads
    document.addEventListener('DOMContentLoaded', loadBills);
  </script>

  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
