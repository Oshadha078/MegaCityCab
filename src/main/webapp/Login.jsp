<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Login Page</title>
  
  <!-- Bootstrap CSS -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet"
  />

 <style>
    /* Full-screen blurred background image */
    body {
      background-image: url('https://img.freepik.com/free-vector/taxi-poster-with-realistic-yellow-public-service-car-with-reflection_1284-5444.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      position: relative;
    }
    
    body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.2); /* Light overlay */
      backdrop-filter: blur(10px); /* Blur effect */
      -webkit-backdrop-filter: blur(10px);
    }
    
    /* Container for the login form with transparency */
    .login-container {
      position: relative;
      width: 400px;
      background-color: rgba(255, 243, 163, 0.7); /* Light yellow with transparency */
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
      text-align: center;
      color: black;
      font-weight: bold;
    }

    .login-container h3 {
      text-align: center;
      margin-bottom: 1.5rem;
      font-weight: bold;
      color: black;
    }

    /* Input styles */
    .login-container .form-control {
      background-color: rgba(255, 255, 255, 0.9);
      border: 1px solid black;
      color: black;
    }

    .login-container .form-control:focus {
      background-color: rgba(255, 255, 255, 1);
      color: black;
      box-shadow: none;
      border: 1px solid black;
    }

    /* Button styles */
    .login-container .btn-primary {
      background-color: black;
      border: none;
      font-weight: bold;
      color: #ffcc00;
      transition: background-color 0.3s ease;
    }
    .login-container .btn-primary:hover {
      background-color: #333;
    }

    /* Link styles */
    .login-container a {
      text-decoration: none;
      font-weight: bold;
      color: black;
    }
    .login-container a:hover {
      color: #333;
    }
</style>

</head>
<body>
  <!-- Center the login form vertically and horizontally -->
  <div class="d-flex justify-content-center align-items-center vh-100">
    <div class="login-container">
      <h3>Login</h3>
      
      <div class="alert alert-danger d-none" id="errorMessage"></div>
      
      <form action="LoginServlet" method="post">
        <div class="mb-3">
          <label class="form-label">Username</label>
          <input type="text" class="form-control" name="username" required />
        </div>
        <div class="mb-3">
          <label class="form-label">Password</label>
          <input type="password" class="form-control" name="password" required />
        </div>
        <div class="mb-3">
          <label class="form-label">User Type</label>
          <select class="form-control" name="usertype" required>
            <option value="admin">Admin</option>
            <option value="user">User</option>
            <option value="employee">Employee</option>
          </select>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
      </form>

      <p class="text-center mt-3">
        <a href="signup.jsp">Create an account</a>
      </p>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const params = new URLSearchParams(window.location.search);
      if (params.get("error") === "invalid") {
        const errorMessage = document.getElementById("errorMessage");
        errorMessage.classList.remove("d-none");
        errorMessage.innerText = "Invalid username, password, or usertype.";
      }
    });
  </script>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
