<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Bill View</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="styles.css">
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>MegaCityCab Admin Dashboard</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #fae050;
      --primary-dark: #e0c040;
      --secondary-color: #333;
      --light-bg: #f8f9fa;
      --dark-bg: #212529;
      --success-color: #28a745;
      --warning-color: #ffc107;
      --danger-color: #dc3545;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      background-color: var(--light-bg);
      color: var(--secondary-color);
      overflow-x: hidden;
    }
    
    /* Navbar styling */
    .navbar {
      background-color: var(--primary-color) !important;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      padding: 12px 20px;
    }
    
    .navbar .navbar-brand {
      color: var(--secondary-color) !important;
      font-weight: 700;
      font-size: 1.4rem;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    
    .navbar .navbar-brand i {
      font-size: 1.5rem;
    }
    
    .navbar .nav-link {
      color: var(--secondary-color) !important;
      font-weight: 600;
      padding: 8px 15px;
      border-radius: 5px;
      transition: all 0.3s ease;
    }
    
    .navbar .nav-link:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
    }
    
    /* Sidebar styling */
    .sidebar {
      background-color: yellow;
      color: var(--secondary-color);
      min-height: 100vh;
      box-shadow: 2px 0 10px rgba(0,0,0,0.1);
      padding: 20px 0;
      position: sticky;
      top: 0;
    }
    
    .sidebar .logo-container {
      padding: 20px 15px;
      text-align: center;
      margin-bottom: 20px;
      border-bottom: 1px solid rgba(0,0,0,0.1);
    }
    
    .sidebar h5 {
      font-size: 1.2rem;
      margin: 25px 15px 15px;
      font-weight: 600;
      color: var(--secondary-color);
      position: relative;
      padding-bottom: 10px;
    }
    
    .sidebar h5::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 50px;
      height: 3px;
      background-color: var(--primary-color);
    }
    
    .sidebar .nav-link {
      color: var(--secondary-color);
      padding: 12px 20px;
      font-size: 0.95rem;
      display: flex;
      align-items: center;
      gap: 12px;
      border-radius: 8px;
      margin: 5px 10px;
      transition: all 0.3s ease;
      position: relative;
    }
    
    .sidebar .nav-link i {
      font-size: 1.1rem;
      min-width: 24px;
      text-align: center;
    }
    
    .sidebar .nav-link:hover, 
    .sidebar .nav-link.active {
      background-color: var(--primary-color);
      color: var(--secondary-color);
      transform: translateX(5px);
      font-weight: 600;
    }
    
    .sidebar .nav-link.active::before {
      content: '';
      position: absolute;
      left: -10px;
      top: 0;
      height: 100%;
      width: 4px;
      background-color: var(--primary-dark);
      border-radius: 0 4px 4px 0;
    }
    
    /* Main content area */
    .main-content {
      padding: 30px;
      transition: all 0.3s ease;
    }
    
    .content-header {
      margin-bottom: 30px;
    }
    
    .content-header h2 {
      font-weight: 700;
      color: var(--secondary-color);
      position: relative;
      display: inline-block;
      padding-bottom: 10px;
    }
    
    .content-header h2::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 80px;
      height: 4px;
      background-color: var(--primary-color);
      border-radius: 10px;
    }
    
    .dashboard-card {
      background-color: white;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.08);
      padding: 25px;
      height: 100%;
      transition: all 0.3s ease;
      border-left: 5px solid var(--primary-color);
    }
    
    .dashboard-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.12);
    }
    
    .dashboard-card .icon {
      font-size: 2.2rem;
      margin-bottom: 15px;
      background-color: rgba(250, 224, 80, 0.2);
      width: 60px;
      height: 60px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 12px;
      color: var(--primary-dark);
    }
    
    .dashboard-card h3 {
      font-size: 1.8rem;
      font-weight: 700;
      margin-bottom: 5px;
    }
    
    .dashboard-card p {
      color: #6c757d;
      font-size: 0.95rem;
      margin-bottom: 0;
    }
    
    /* Recent activity section */
    .recent-activity {
      background-color: white;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.08);
      padding: 25px;
      margin-top: 30px;
    }
    
    .recent-activity h4 {
      font-weight: 600;
      margin-bottom: 20px;
      color: var(--secondary-color);
    }
    
    .activity-item {
      padding: 15px;
      border-left: 3px solid var(--primary-color);
      background-color: rgba(250, 224, 80, 0.1);
      border-radius: 8px;
      margin-bottom: 15px;
    }
    
    .activity-item .time {
      font-size: 0.85rem;
      color: #6c757d;
    }
    
    /* Footer styling */
    footer {
      background-color: var(--secondary-color);
      color: white;
      padding: 30px 0;
      margin-top: 50px;
    }
    
    footer hr {
      border-top: 1px solid rgba(255,255,255,0.2);
      margin: 20px 0;
    }
    
    .footer-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 20px;
    }
    
    .footer-logo {
      font-weight: 700;
      font-size: 1.5rem;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    
    .footer-links a {
      color: white;
      margin-left: 15px;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    
    .footer-links a:hover {
      color: var(--primary-color);
    }
  </style>
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <i class="fas fa-taxi"></i> MegaCityCab Admin
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
          
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Login.jsp">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-lg-2 col-md-3 p-0 sidebar">
        <div class="logo-container text-center">
  <img src="https://png.pngtree.com/png-clipart/20230924/original/pngtree-car-location-vector-icon-on-white-background-background-travel-sign-vector-png-image_12750844.png" 
       alt="MegaCityCab Logo" 
       class="img-fluid logo" 
       style="max-width: 150px; height: auto;">
</div>

        <h5>MAIN MENU</h5>
        <nav class="nav flex-column">
          <a class="nav-link active" href="admin_home.jsp">
            <i class="fas fa-home"></i> Dashboard
          </a>
          <a class="nav-link" href="user_manage.jsp">
            <i class="fas fa-users"></i> Users
          </a>
          <a class="nav-link" href="manage_vehicles.jsp">
            <i class="fas fa-car"></i> Vehicles
          </a>
          <a class="nav-link" href="admin_bill_view.jsp">
            <i class="fas fa-file-invoice-dollar"></i> Bill Manage
          </a>
          <a class="nav-link" href="admin_complaints.jsp">
            <i class="fas fa-exclamation-circle"></i> Complaints
          </a>
       
        </nav>
      </div>

      <!-- Main Content -->
      <div class="col-lg-10 col-md-9 main-content">
        <div class="content-header">
          <h2>Welcome, Admin</h2>
          <p class="text-muted">Welcome to your Admin Dashboard!<br> Here you'll find all the tools you need to manage your system, oversee user activity, and monitor performance. Let's get started and make things happen!</p>
        </div>
        
       
       
      </div>
    </div>
  </div>

  <!-- Footer -->
 


	


  <!-- Bootstrap and dependency scripts -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0;">
    <hr style="border-top: 1px solid #fff;">
    <p class="text-center">&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p class="text-center">Email: info@megacitycab.com | Phone: +1-555-123-4567</p>
  </footer>
</body>
</html>
