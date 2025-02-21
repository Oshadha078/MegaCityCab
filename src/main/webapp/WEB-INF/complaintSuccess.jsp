<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Complaints List - Admin Dashboard</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    :root {
      --primary-color: #007bff; /* Blue */
      --secondary-color: #f8f9fa; /* Light gray */
      --bg-color: #f1f3f5; /* Subtle background */
      --text-color: #343a40; /* Dark text for contrast */
      --navbar-bg: #343a40; /* Dark navbar */
      --sidebar-bg: #212529; /* Dark sidebar */
      --sidebar-text: #adb5bd; /* Light sidebar text */
      --content-bg: #ffffff; /* Clean white for content */
      --border-color: #dee2e6; /* Light border */
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
      background-color: var(--bg-color);
      color: var(--text-color);
      font-family: 'Arial', sans-serif;
    }
    .navbar {
      background-color: var(--navbar-bg);
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .navbar-brand, .navbar-nav .nav-link {
      color: #ffffff !important;
    }
    .night-mode .navbar-brand, .night-mode .navbar-nav .nav-link {
      color: #ffffff !important;
    }
    .sidebar {
      background-color: var(--sidebar-bg);
      color: var(--sidebar-text);
      min-height: 100vh;
      padding-top: 20px;
      font-size: 1rem;
    }
    .sidebar a {
      color: var(--sidebar-text);
      display: block;
      padding: 12px 16px;
      text-decoration: none;
      transition: all 0.3s ease;
    }
    .sidebar a:hover {
      background-color: var(--primary-color);
      color: #fff;
      padding-left: 20px;
    }
    .content {
      background-color: var(--content-bg);
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
    .table {
      background-color: var(--content-bg);
      color: var(--text-color);
    }
    .night-mode .table {
      color: #ffffff;
    }
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
      color: #fff;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
    .dropdown-menu {
      background-color: var(--content-bg);
      border: 1px solid var(--border-color);
    }
    .dropdown-item:hover {
      background-color: var(--primary-color);
      color: #fff;
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Admin Dashboard</a>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="themeDropdown" role="button" data-toggle="dropdown">Theme</a>
        <div class="dropdown-menu dropdown-menu-right">
          <a class="dropdown-item" href="#" onclick="setTheme('light')">Light</a>
          <a class="dropdown-item" href="#" onclick="setTheme('night')">Night</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Login.html">Logout</a>
      </li>
    </ul>
  </nav>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2 sidebar">
        <h5 class="text-center text-light">Menu</h5>
        <a href="adminhome.html">Dashboard</a>
        <a href="usersmanage.html">Users</a>
        <a href="managevehicles.html">Vehicles</a>
        <a href="adminBillView.html">Billing</a>
        <a href="admin_complaints.html">Complaints</a>
      </div>
      <div class="col-md-10 content">
        <h2 class="mb-4">Complaints List</h2>
        <table class="table table-bordered table-hover">
          <thead>
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
          <tbody></tbody>
        </table>
      </div>
    </div>
  </div>
  <script>
    function setTheme(theme) {
      document.body.classList.remove("night-mode");
      if (theme === "night") {
        document.body.classList.add("night-mode");
      }
    }
  </script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
