<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admin Page - User Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
  <style>
    /* Global styles */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #717171;
      color: #e0e0e0;
      margin: 0;
      padding: 0;
    }

    /* Navbar Styles */
    .navbar {
      background-color: #fae050 !important; /* Yellow background */
    }
    .navbar .navbar-brand,
    .navbar .nav-link {
      color: #000 !important; /* Black text */
      font-weight: bold;
    }
    .navbar .nav-link:hover {
      color: #333 !important;
    }
    .navbar .nav-item .nav-link {
      font-size: 1rem;
      margin-right: 1rem;
    }

    /* Fixed Sidebar Styles */
    .sidebar {
      background-color: #fae050; /* Yellow background */
      color: #0a0a09;
      padding-top: 20px;
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      width: 240px; 
      overflow-y: auto;
    }
    .sidebar h5 {
      font-size: 1.4rem;
      margin-bottom: 1.5rem;
      font-weight: bold;
      text-transform: uppercase;
      letter-spacing: 1px;
      color: #0a0a09;
      text-align: center;
    }
    .sidebar a {
      color: #0a0a09;
      padding: 12px 20px;
      font-size: 1rem;
      text-decoration: none;
      display: block;
      border-radius: 8px;
      margin-bottom: 8px;
      transition: all 0.3s ease;
    }
    .sidebar a i {
      margin-right: 10px;
      color: #0a0a09;
    }
    .sidebar a:hover,
    .sidebar a.active {
      background-color: #e0c040;
      color: #000;
      font-weight: bold;
    }
    .sidebar a:hover i {
      color: #000;
    }

    /* Main content area (with left margin to clear fixed sidebar) */
    .main-content {
      background-color: #1c1c1c;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0,0,0,0.5);
      margin: 20px 20px 20px 260px; /* left margin equals sidebar width plus some gap */
    }

    /* Form styles */
    form#userForm {
      background-color: #1e1e1e;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
      margin-bottom: 30px;
    }
    .form-control, .form-select {
      background-color: #2c2c2c;
      border: 1px solid #444;
      color: #ffffff !important;
    }
    .form-control:focus, .form-select:focus {
      border-color: #007bff;
      box-shadow: 0 0 0 0.2rem rgba(0,123,255,0.25);
      background-color: #2c2c2c;
      color: #ffffff !important;
    }
    label {
      font-weight: 500;
    }

    /* Table and button styles */
    .table {
      background-color: transparent;
      color: #fff;
    }
    .table thead th {
      background-color: rgba(255,255,255,0.2);
    }
    .btn-danger {
      background-color: #bb86fc;
      border: none;
      transition: background-color 0.3s, transform 0.2s;
    }
    .btn-danger:hover {
      background-color: #d0aaff;
      transform: scale(1.05);
    }
  </style>
  <script>
    // Set servlet URL for user management.
    const servletUrl = 'AdminServlet';

    // Global variable to store users data.
    let usersData = [];

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

    // Render users based on the selected filter.
    function renderUsers() {
      const filterValue = document.getElementById("filterUserType").value;
      const tableBody = document.getElementById('usersTableBody');
      if (!Array.isArray(usersData)) return;
      let filteredUsers = usersData;
      if (filterValue !== "all") {
        filteredUsers = usersData.filter(user => user.usertype.toLowerCase() === filterValue);
      }
      if (filteredUsers.length === 0) {
        tableBody.innerHTML = `<tr><td colspan="6" class="text-center">No users found</td></tr>`;
      } else {
        let html = "";
        filteredUsers.forEach(user => {
          html += `
                <tr>
                  <td>${user.nic || "N/A"}</td>
                  <td>${user.name || "N/A"}</td>
                  <td>${user.address || "N/A"}</td>
                  <td>${user.contact || "N/A"}</td>
                  <td>${user.usertype || "N/A"}</td>
                  <td>
                    <button class="btn btn-warning btn-sm" onclick="editUser('${user.nic}', '${user.name}', '${user.address}', '${user.contact}', '${user.usertype}')">Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="deleteUser('${user.nic}')">Delete</button>
                  </td>
                </tr>`;
        });
        tableBody.innerHTML = html;
      }
    }

    // Load users from the servlet and populate the table.
    function loadUsers() {
      fetch(servletUrl)
        .then(response => {
          if (!response.ok) {
            return response.text().then(text => { throw new Error(text); });
          }
          return response.json();
        })
        .then(data => {
          console.log("Users data received:", data);
          const users = Array.isArray(data) ? data : [data];
          usersData = users;
          renderUsers();
        })
        .catch(error => {
          console.error("Error loading users:", error);
          showError("Error loading users: " + error.message);
        });
    }

    // Filter handler for user type dropdown.
    function applyUserFilter() {
      renderUsers();
    }

    // Add a new user.
    function addUser(event) {
      event.preventDefault();
      document.getElementById('action').value = "createCustomer";
      saveUser("User successfully added.");
    }

    // Update an existing user.
    function updateUser(event) {
      event.preventDefault();
      document.getElementById('action').value = "updateCustomer";
      saveUser("User successfully updated.");
    }

    // Send form data to the servlet.
    function saveUser(successMessage) {
      const formData = new FormData(document.getElementById('userForm'));
      fetch(servletUrl, { method: 'POST', body: formData })
        .then(response => {
          if (!response.ok) {
            return response.text().then(text => { throw new Error(text); });
          }
          return response.json();
        })
        .then(data => {
          if (data.status === "success") {
            document.getElementById('userForm').reset();
            document.getElementById('nic').readOnly = false;
            loadUsers();
            showSuccess(successMessage + " (Rows affected: " + data.rowsAffected + ")");
          } else if (data.error) {
            showError("Error: " + data.error);
          }
        })
        .catch(error => {
          console.error('Error saving user:', error);
          showError("Error saving user: " + error.message);
        });
    }

    // Pre-fill form fields for editing.
    function editUser(nic, name, address, contact, usertype) {
      document.getElementById('nic').value = nic;
      document.getElementById('name').value = name;
      document.getElementById('address').value = address;
      document.getElementById('contact').value = contact;
      document.getElementById('usertype').value = usertype;
      document.getElementById('nic').readOnly = true;
    }

    // Delete a user by NIC.
    function deleteUser(nic) {
      if (confirm("Are you sure you want to delete this user?")) {
        const formData = new FormData();
        formData.append('action', 'deleteCustomer');
        formData.append('nic', nic);
        fetch(servletUrl, { method: 'POST', body: formData })
          .then(response => {
            if (!response.ok) {
              return response.text().then(text => { throw new Error(text); });
            }
            return response.json();
          })
          .then(data => {
            if (data.status === "success") {
              loadUsers();
              showSuccess("User successfully deleted. (Rows affected: " + data.rowsAffected + ")");
            } else if (data.error) {
              showError("Error: " + data.error);
            }
          })
          .catch(error => {
            console.error('Error deleting user:', error);
            showError("Error deleting user: " + error.message);
          });
      }
    }

    // Load users once the page is loaded.
    document.addEventListener("DOMContentLoaded", loadUsers);
  </script>
</head>
<body>
  <!-- Top Navigation Bar -->
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="adminhome.html">Admin Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavbar" aria-controls="topNavbar" aria-expanded="false" aria-label="Toggle navigation">
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
      <div class="col-md-2 p-0">
        <div class="sidebar">
          <h5 class="text-center">Menu</h5>
          <a href="admin_home.jsp"><i class="fas fa-home"></i> Dashboard</a>
          <a href="user_manage.jsp"><i class="fas fa-users"></i> Users</a>
          <a href="manage_vehicles.jsp"><i class="fas fa-car"></i> Vehicles</a>
          <a href="admin_bill_view.jsp"><i class="fas fa-file-invoice-dollar"></i> Bill Manage</a>
          <a href="admin_complaints.jsp"><i class="fas fa-exclamation-circle"></i> Complaints</a>
        </div>
      </div>
      
      <!-- Main Content Area -->
      <div class="col-md-10" style="margin-left:240px;">
        <div class="main-content"><br>
          <h2 class="text-center" style="font-weight: bold;"><i class="fas fa-users"></i> User Management</h2>
          
          <!-- Alert Message -->
          <div id="alertMessage" style="display:none;"></div>
          
          <!-- User Form -->
          <div class="mb-4">
            <form id="userForm">
              <input type="hidden" id="action" name="action" value="createCustomer" />
              <div class="mb-3">
                <label for="nic" class="form-label">NIC</label>
                <input type="text" class="form-control" id="nic" name="nic" placeholder="NIC" required />
              </div>
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Name" required />
              </div>
              <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Address" required />
              </div>
              <div class="mb-3">
                <label for="contact" class="form-label">Contact</label>
                <input type="text" class="form-control" id="contact" name="contact" placeholder="Contact" required />
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required />
              </div>
              <div class="mb-3">
                <label for="usertype" class="form-label">User Type</label>
                <select class="form-select" id="usertype" name="usertype">
                  <option value="admin">Admin</option>
                  <option value="user" selected>User</option>
                  <option value="employee">Employee</option>
                </select>
              </div>
              <div class="mb-3">
                <button type="button" class="btn btn-success" onclick="addUser(event)">
                  <i class="fas fa-user-plus"></i> Add User
                </button>
                <button type="button" class="btn btn-primary" onclick="updateUser(event)">
                  <i class="fas fa-user-edit"></i> Update User
                </button>
                <button type="reset" class="btn btn-secondary">
                  <i class="fas fa-undo"></i> Reset
                </button>
              </div>
            </form>
          </div>
          
          <div class="mb-3">
            <label for="filterUserType" class="form-label"><strong>Filter by User Type:</strong></label>
            <select id="filterUserType" class="form-select w-auto" onchange="applyUserFilter()">
              <option value="all">All</option>
              <option value="admin">Admin</option>
              <option value="user">User</option>
              <option value="employee">Employee</option>
            </select>
          </div>
          
          <!-- Users Table -->
          <div>
            <h4>Users List</h4>
            <div class="table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>NIC</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>User Type</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody id="usersTableBody">
                  <!-- Dynamic rows will appear here -->
                </tbody>
              </table>
            </div>
          </div>
        </div><!-- main-content -->
      </div><!-- col-md-10 -->
    </div><!-- row -->
  </div><!-- container-fluid -->
  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
      Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
    </p>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
