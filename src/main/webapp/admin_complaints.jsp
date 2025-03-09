<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Complaints Management - Admin Dashboard</title>
  
  <!-- Bootstrap & FontAwesome -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  
  <style>
    :root {
      --primary-color: #007bff;
      --secondary-color: #f8f9fa;
      --bg-color: #f1f3f5;
      --text-color: #343a40;
      --navbar-bg: #343a40;
      --sidebar-bg: #212529;
      --sidebar-text: #adb5bd;
      --content-bg: #ffffff;
      --border-color: #dee2e6;
    }
    
    .night-mode {
      --bg-color: #121212;
      --text-color: #ffffff;
      --navbar-bg: #343a40;
      --sidebar-bg: #1c1c1c;
      --sidebar-text: #ffffff;
      --content-bg: #1e1e1e;
      --border-color: #3e3e3e;
    }

    body {
      background-color: #e5e9ec;
      color: var(--text-color);
      font-family: 'Arial', sans-serif;
    }
    
		    .navbar {
		  background-color: #fae050 !important; /* Yellow background */
		}
		
		.navbar .navbar-brand,
		.navbar .nav-link {
		  color: #000 !important; /* Black text color */
		  font-weight: bold;
		}
		
		.navbar .nav-link:hover {
		  color: #333 !important; /* Darker black on hover */
		}


		    .sidebar {
		  background-color: #fae050; /* Yellow background */
		  color: #000; /* Black text */
		  min-height: 100vh;
		  padding-top: 20px;
		}
		
		.sidebar h5 {
		  font-size: 1.4rem;
		  margin-bottom: 1.5rem;
		  font-weight: bold;
		  text-transform: uppercase;
		  letter-spacing: 1px;
		  color: #0a0a09; /* Black heading text */
		}
		
		.sidebar a {
		  color: #000; /* Black link text */
		  display: block;
		  padding: 12px 16px;
		  font-size: 1rem;
		  text-decoration: none;
		  border-radius: 8px;
		  transition: all 0.3s ease;
		}
		
		.sidebar a i {
		  margin-right: 10px;
		  color: #000; /* Black icon color */
		}
		
		.sidebar a:hover {
		  background-color: #f1c40f; /* Darker yellow on hover */
		  color: #000; /* Keep black text on hover */
		  padding-left: 20px; /* Slide effect */
		  font-weight: bold;
		}
		
		.sidebar a:hover i {
		  color: #000; /* Black icon on hover */
		}


    .content {
      background-color: var(--content-bg);
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>

  <!-- Navigation Bar -->
  <!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg">
  <a class="navbar-brand" href="adminhome.jsp">
    <i class="fas fa-tools"></i> Complaints Management - Admin Dashboard
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="themeDropdown" data-toggle="dropdown">
          <i class="fas fa-adjust"></i> Theme
        </a>
        <div class="dropdown-menu dropdown-menu-right">
          <a class="dropdown-item" href="#" onclick="setTheme('light')">Light</a>
          <a class="dropdown-item" href="#" onclick="setTheme('night')">Night</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Login.jsp">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </li>
    </ul>
  </div>
</nav>


  <!-- Page Content -->
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-2 sidebar">
        <h5 class="text-center text">Menu</h5>
        <a href="admin_home.jsp"><i class="fas fa-home"></i> Dashboard</a>
        <a href="user_manage.jsp"><i class="fas fa-users"></i> Users</a>
        <a href="manage_vehicles.jsp"><i class="fas fa-car"></i> Vehicles</a>
        <a href="admin_bill_view.jsp"><i class="fas fa-file-invoice-dollar"></i> Billing</a>
        <a href="admin_complaints.jsp"><i class="fas fa-exclamation-circle"></i> Complaints</a>
      </div>

      <!-- Main Content -->
      <div class="col-md-10 content">
        <h2><i class="fas fa-exclamation-triangle"></i> Complaints List</h2>

        <!-- Filter Dropdown -->
        <div class="mb-3">
          <label for="filterStatus"><strong>Filter by Status:</strong></label>
          <select id="filterStatus" class="custom-select w-auto" onchange="applyFilter()">
            <option value="all">All</option>
            <option value="Pending">Pending</option>
            <option value="Resolved">Resolved</option>
          </select>
        </div>

        <!-- Complaints Table -->
        <div class="table-responsive">
          <table class="table table-striped table-bordered">
            <thead class="thead-dark">
              <tr>
                <th>ID</th>
                <th>User ID</th>
                <th>Name</th>
                <th>Subject</th>
                <th>Description</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody id="complaintsTable"></tbody>
          </table>
        </div>
        <p id="rowCount" class="text-muted"></p>
      </div>
    </div>
  </div>

  <!-- JavaScript -->
  <script>
    let complaintsData = [];

    function renderComplaints() {
      const filterValue = document.getElementById("filterStatus").value;
      const tbody = document.querySelector("#complaintsTable");
      tbody.innerHTML = "";
      let filteredData = complaintsData;

      if (filterValue !== "all") {
        filteredData = complaintsData.filter(c => c.status === filterValue);
      }

      filteredData.forEach(c => {
        const tr = document.createElement("tr");
        tr.innerHTML = `
          <td>${c.complaintId}</td>
          <td>${c.userId}</td>
          <td>${c.userName}</td>
          <td>${c.subject}</td>
          <td>${c.description}</td>
          <td>${c.status}</td>
          <td>
            <a href="admin__reply.jsp?complaint_id=${c.complaintId}&user_id=${c.userId}&user_name=${encodeURIComponent(c.userName)}&subject=${encodeURIComponent(c.subject)}&description=${encodeURIComponent(c.description)}&status=${encodeURIComponent(c.status)}"
              class="btn btn-primary btn-sm">
              <i class="fas fa-reply"></i> Reply
            </a>
          </td>
        `;
        tbody.appendChild(tr);
      });

      document.getElementById("rowCount").textContent = "Total Complaints: " + filteredData.length;
    }

    function loadComplaints() {
      fetch("GetComplaintsServlet")
        .then(response => response.json())
        .then(data => {
          complaintsData = data;
          renderComplaints();
        })
        .catch(error => console.error("Error loading complaints:", error));
    }

    function applyFilter() {
      renderComplaints();
    }

    function setTheme(theme) {
      document.body.classList.toggle("night-mode", theme === "night");
    }

    document.addEventListener("DOMContentLoaded", loadComplaints);
  </script>

  <!-- Footer -->
  <footer class="mt-5 bg-dark text-white text-center p-3">
    &copy; 2025 MegaCityCab. All rights reserved.
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
