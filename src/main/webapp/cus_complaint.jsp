<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>File a Complaint</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://plus.unsplash.com/premium_photo-1728723282563-92a1c71c5669?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTN8fGNhYiUyMHNlcnZpY2V8ZW58MHx8MHx8fDA%3D');
      background-size: cover;
      background-position: center;
      margin: 0;
      padding: 0;
    }
    .navbar {
      background-color: #FFD700;
    }
    
	.navbar .navbar-brand, 
	.navbar .nav-link {
	  color: #000 !important; /* Black text color */
	  font-weight: bold;
	}
	
	.navbar .nav-link:hover {
	  color: #333 !important; /* Darker black on hover */
	}
    .navbar-brand {
      font-weight: bold;
    }
    
    #sidebar {
      min-width: 200px;
      background-color: #fae050;
      min-height: 100vh;
      padding-top: 1rem;
    }
    #sidebar .nav-link {
      color: #000;
      font-weight: bold;
    }
    #sidebar .nav-link:hover, .nav-link.active {
      background-color:  #FFD700;
    }
    .content {
      flex: 1;
      padding: 2rem;
    }
    .complaint-container {
      background: #fff;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    }
    .btn-primary {
      background-color: #ffcc00;
      border: none;
      color: black;
      font-weight: bold;
    }
    .btn-primary:hover {
      background-color: #e6b800;
    }
    .background-box {
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#"><i class="fas fa-user-circle"></i> Customer Dashboard</a>
      
    </div>
  </nav>

  <!-- Layout -->
  <div class="d-flex">
    <!-- Sidebar -->
    <div id="sidebar">
      <div class="sidebar-heading text-center">Menu</div>
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

    <!-- Main Content -->
    <div class="content">
      <h2 class="text-primary mb-4">File a Complaint</h2>

      <div class="complaint-container">
        <form id="complaintForm" action="ComplaintController" method="post">
          <input type="hidden" name="userID" id="userID" value="">
          <input type="hidden" name="userName" id="userName" value="">
          
          <div class="form-group">
            <label for="subject">Subject:</label>
            <input type="text" class="form-control" name="subject" id="subject" placeholder="Enter complaint subject" required>
          </div>

          <div class="form-group">
            <label for="description">Complaint Details:</label>
            <textarea class="form-control" name="description" id="description" rows="5" placeholder="Describe your issue" required></textarea>
          </div>

          <button type="submit" class="btn btn-primary">Submit Complaint</button>
        </form>
      </div>

      <div id="adminReplySection" class="background-box">
        <h4 class="text-success">Admin Replies</h4>
        <div class="table-responsive">
          <table class="table table-bordered" id="adminRepliesTable">
            <thead>
              <tr>
                <th>Complaint ID</th>
                <th>Subject</th>
                <th>Admin Reply</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <!-- Populated dynamically -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px; text-align: center;">
    <p>&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p>Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
  </footer>

  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

  <script>
    function getCookie(name) {
      const cookies = document.cookie.split(';');
      for (let cookie of cookies) {
        cookie = cookie.trim();
        if (cookie.startsWith(name + '=')) {
          return decodeURIComponent(cookie.substring(name.length + 1));
        }
      }
      return '';
    }

    document.addEventListener("DOMContentLoaded", function () {
      const userID = getCookie("userID") || "N/A";
      const userName = getCookie("name") || "Guest";

      document.getElementById("userID").value = userID;
      document.getElementById("userName").value = userName;
      loadUserAdminReplies(userID);
    });

    function loadUserAdminReplies(userID) {
      if (!userID || userID === "N/A") return;

      fetch('GetUserComplaintsServlet?userID=' + encodeURIComponent(userID))

        .then(response => response.json())
        .then(data => {
          const tbody = document.querySelector("#adminRepliesTable tbody");
          tbody.innerHTML = data.length ? data.map(function(complaint) {
        	  return '<tr>' +
        	    '<td>' + complaint.complaint_id + '</td>' +
        	    '<td>' + complaint.subject + '</td>' +
        	    '<td>' + (complaint.admin_reply || 'No reply yet') + '</td>' +
        	    '<td>' + complaint.status + '</td>' +
        	  '</tr>';
        	}).join('') :
        	'<tr><td colspan="4" class="text-center">No admin replies available</td></tr>';

        })
        .catch(err => console.error("Error loading admin replies:", err));
    }
  </script>
</body>
</html>