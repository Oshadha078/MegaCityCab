<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>MegaCityCab - Login</title>

  <!-- Bootstrap CSS and Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary-color: #ffcc00;
      --secondary-color: #212529;
      --accent-color: #ff9900;
    }
    
    body {
      background-image: url('https://img.freepik.com/free-vector/taxi-poster-with-realistic-yellow-public-service-car-with-reflection_1284-5444.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      backdrop-filter: blur(5px);
      -webkit-backdrop-filter: blur(5px);
      z-index: 0;
    }

    .main-content {
      flex: 1;
      position: relative;
      z-index: 1;
      padding: 2rem 0;
    }

    .brand-logo {
      font-size: 3rem;
      font-weight: 700;
      color: var(--primary-color);
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
      margin-bottom: 0;
    }

    .brand-tagline {
      color: white;
      font-size: 1.2rem;
      margin-bottom: 2rem;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
    }

    .login-container {
      background: rgba(255, 255, 255, 0.9);
      border-radius: 16px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      padding: 2.5rem;
      max-width: 450px;
      width: 100%;
      margin: 0 auto;
      transition: transform 0.3s ease;
    }

    .login-container:hover {
      transform: translateY(-5px);
    }

    .login-header {
      margin-bottom: 1.5rem;
      text-align: center;
    }

    .login-header h3 {
      color: var(--secondary-color);
      font-weight: 600;
      margin-bottom: 0.5rem;
    }

    .form-label {
      font-weight: 500;
      color: var(--secondary-color);
    }

    .form-control {
      padding: 0.75rem 1rem;
      font-size: 1rem;
      border: 1px solid #ced4da;
      border-radius: 8px;
      transition: all 0.3s;
    }

    .form-control:focus {
      border-color: var(--accent-color);
      box-shadow: 0 0 0 0.25rem rgba(255, 204, 0, 0.25);
    }

    .input-group-text {
      background-color: var(--primary-color);
      color: var(--secondary-color);
      border: 1px solid var(--primary-color);
    }

    .btn-taxi {
      background-color: var(--primary-color);
      color: var(--secondary-color);
      font-weight: 600;
      padding: 0.75rem 1.5rem;
      border-radius: 8px;
      border: none;
      transition: all 0.3s;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-taxi:hover {
      background-color: var(--accent-color);
      color: white;
      transform: translateY(-2px);
      box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
    }

    .signup-link {
      margin-top: 1.5rem;
      text-align: center;
    }

    .signup-link a {
      color: var(--accent-color);
      font-weight: 500;
      text-decoration: none;
      transition: color 0.3s;
    }

    .signup-link a:hover {
      color: var(--secondary-color);
      text-decoration: underline;
    }

    .alert {
      border-radius: 8px;
      padding: 1rem;
      font-weight: 500;
    }

    footer {
      background-color: var(--secondary-color);
      color: white;
      padding: 1.5rem 0;
      text-align: center;
      position: relative;
      z-index: 1;
      margin-top: auto;
    }

    .social-icons {
      font-size: 1.5rem;
      margin: 1rem 0;
    }

    .social-icons a {
      color: var(--primary-color);
      margin: 0 0.5rem;
      transition: color 0.3s;
    }

    .social-icons a:hover {
      color: var(--accent-color);
    }

    .footer-links a {
      color: #adb5bd;
      margin: 0 0.5rem;
      text-decoration: none;
      transition: color 0.3s;
    }

    .footer-links a:hover {
      color: var(--primary-color);
    }

    @media (max-width: 576px) {
      .login-container {
        padding: 1.5rem;
        margin: 0 1rem;
      }
      
      .brand-logo {
        font-size: 2.5rem;
      }
    }
  </style>
</head>
<body>
  <div class="overlay"></div>
  
  <div class="main-content d-flex justify-content-center align-items-center">
    <div class="container">
      <div class="row justify-content-center mb-4">
        <div class="col-12 text-center">
          <h1 class="brand-logo">MegaCityCab</h1>
          <p class="brand-tagline">Your ride, your way, anytime</p>
        </div>
      </div>
      
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
          <div class="login-container">
            <div class="login-header">
              <h3>Welcome Back</h3>
              <p class="text-muted">Sign in to your account</p>
            </div>
            
            <div class="alert alert-danger d-none" id="errorMessage" role="alert"></div>
            
            <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
              <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                  <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required />
                </div>
              </div>
              
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required />
                  <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                    <i class="bi bi-eye"></i>
                  </button>
                </div>
              </div>
              
              <div class="mb-4">
                <label for="usertype" class="form-label">Login As</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-person-badge"></i></span>
                  <select class="form-select" id="usertype" name="usertype" required>
                    <option value="" selected disabled>Select user type</option>
                    <option value="user">Passenger</option>
                    <option value="employee">Driver</option>
                    <option value="admin">Administrator</option>
                  </select>
                </div>
              </div>
              
              <div class="d-flex justify-content-between align-items-center mb-3">
            
                
              </div>
              
              <button type="submit" class="btn btn-taxi w-100">
                <i class="bi bi-box-arrow-in-right me-2"></i>Sign In
              </button>
              
              <div class="signup-link">
                Don't have an account? <a href="signup.jsp">Sign Up Now</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="social-icons">
            <a href="#"><i class="bi bi-facebook"></i></a>
            <a href="#"><i class="bi bi-twitter"></i></a>
            <a href="#"><i class="bi bi-instagram"></i></a>
            <a href="#"><i class="bi bi-linkedin"></i></a>
          </div>
          <div class="footer-links mb-3">
            <a href="#">About Us</a>
            <a href="#">Services</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
            <a href="#">Contact Us</a>
          </div>
          <p class="mb-1">&copy; 2023 MegaCityCab. All rights reserved.</p>
          <p class="small text-muted">
            Email: info@megacitycab.com | Phone: +1-555-123-4567
          </p>
        </div>
      </div>
    </div>
  </footer>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      // Handle error message
      const params = new URLSearchParams(window.location.search);
      if (params.get("error") === "invalid") {
        const errorMessage = document.getElementById("errorMessage");
        errorMessage.classList.remove("d-none");
        errorMessage.innerHTML = '<i class="bi bi-exclamation-triangle-fill me-2"></i>Invalid username, password, or user type. Please try again.';
      }
      
      // Toggle password visibility
      const togglePassword = document.getElementById("togglePassword");
      const passwordInput = document.getElementById("password");
      
      togglePassword.addEventListener("click", function () {
        const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
        passwordInput.setAttribute("type", type);
        
        // Toggle eye icon
        this.querySelector('i').classList.toggle('bi-eye');
        this.querySelector('i').classList.toggle('bi-eye-slash');
      });
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>