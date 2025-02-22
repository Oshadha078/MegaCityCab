<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admin Page - User Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    /* Global Styles */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #121212;
      color: #e0e0e0;
      margin: 0;
      padding: 0;
    }
    
    /* Top Navbar Styling */
    .navbar {
      background-color: #007bff;
    }
    .navbar-brand, .navbar-nav .nav-link {
      color: #fff !important;
      font-weight: 500;
    }
    
    /* Sidebar Styling */
    .sidebar {
      background-color: #343a40;
      color: #fff;
      min-height: 100vh;
      padding-top: 20px;
    }
    .sidebar h5 {
      margin-bottom: 1.5rem;
    }
    .sidebar a {
      color: #fff;
      padding: 10px 15px;
      display: block;
      text-decoration: none;
      transition: background-color 0.3s ease, padding-left 0.3s ease;
    }
    .sidebar a:hover {
      background-color: #495057;
      padding-left: 20px;
      text-decoration: none;
    }
    
    /* Main Content Container */
    .main-content {
      background-color: #1e1e1e;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0,0,0,0.5);
      margin-top: 20px;
      margin-bottom: 20px;
    }
    
    /* Form Styling */
    form#userForm {
      background-color: #1e1e1e;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
      margin-bottom: 30px;
    }
    .form-control,
    .form-select {
      background-color: #2c2c2c;
      border: 1px solid #444;
      color: #ffffff !important;
    }
    .form-control:focus,
    .form-select:focus {
      border-color: #007bff;
      box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
      background-color: #2c2c2c;
      color: #ffffff !important;
    }
    label {
      font-weight: 500;
    }
  </style>
</head>
<body>
  <div class="container">
    <form id="userForm">
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
        <button type="submit" class="btn btn-success">Submit</button>
      </div>
    </form>
  </div>
</body>
</html>
