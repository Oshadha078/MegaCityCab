<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Registration Form</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    /* Full-screen background image */
    body {
      background-image: url('https://img.freepik.com/free-vector/taxi-poster-with-realistic-yellow-public-service-car-with-reflection_1284-5444.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      color: black;
    }

    /* Center the registration form container */
    .d-flex-center {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* Glassmorphism container for the form */
    .registration-container {
      width: 500px;
      background-color: rgba(255, 243, 163, 0.75);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      color: black;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .registration-container h2 {
      text-align: center;
      margin-bottom: 1rem;
      color: black;
    }

    .registration-container .form-control {
      background-color: rgba(255, 255, 255, 0.9);
      border: 1px solid black;
      color: black;
    }

    .registration-container .form-control:focus {
      background-color: rgba(255, 255, 255, 1);
      color: black;
      box-shadow: none;
      border: 1px solid black;
    }

    .registration-container .btn-success {
      background-color: rgba(255, 243, 163, 0.75);
      border: 1px solid rgba(255, 255, 255, 0.2);
      color: black;
    }

    .registration-container .btn-success:hover {
      background-color: rgba(255, 243, 163, 1);
      border: 1px solid black;
    }

    #passwordAlert {
      padding: 0.5rem;
      margin-top: 0.5rem;
      color: black;
    }
  </style>

  <script>
    $(document).ready(function() {
      $("#password, #confirm_password").on("keyup", function() {
        const password = $("#password").val();
        const confirmPassword = $("#confirm_password").val();

        if (password !== confirmPassword) {
          $("#passwordAlert").removeClass("d-none").text("Passwords do not match!");
        } else {
          $("#passwordAlert").addClass("d-none");
        }
      });

      $("form").on("submit", function(event) {
        if ($("#password").val() !== $("#confirm_password").val()) {
          event.preventDefault();
          $("#passwordAlert").removeClass("d-none").text("Passwords do not match!");
        }
      });

      const urlParams = new URLSearchParams(window.location.search);

      if (urlParams.has("success") && urlParams.get("success") === "true") {
        $('#successModal').modal('show');
      }

      if (urlParams.has("error")) {
        const errorMessages = {
          driver: "Database driver not found!",
          insert: "Failed to insert record. Please try again.",
          sql: "Database error occurred.",
          unknown: "An unknown error occurred."
        };
        $("#errorMessage").text(errorMessages[urlParams.get("error")] || "An error occurred during registration.");
        $('#errorModal').modal('show');
      }
    });
  </script>
</head>
<body>
  <div class="d-flex-center">
    <div class="registration-container">
      <h2>Registration Form</h2>
      <form class="form p-3" action="RegisterServlet" method="post">
        <div class="form-group">
          <label>NIC:</label>
          <input type="text" name="nic" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Name:</label>
          <input type="text" name="name" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Address:</label>
          <input type="text" name="address" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Contact:</label>
          <input type="text" name="contact" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Password:</label>
          <input type="password" id="password" name="password" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Re-enter Password:</label>
          <input type="password" id="confirm_password" class="form-control" required />
          <div id="passwordAlert" class="alert alert-danger d-none"></div>
        </div>
        <div class="text-center">
          <input type="submit" value="Register" class="btn btn-success" />
          <button type="button" onclick="window.location.href='Login.jsp'" class="btn btn-light">Login</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Success Modal -->
  <div class="modal fade" id="successModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title">Registration Successful</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">You have been successfully registered!</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Error Modal -->
  <div class="modal fade" id="errorModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title">Registration Failed</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p id="errorMessage">An error occurred during registration.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>

  <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0; margin-top: 20px;">
    <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
    <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
    <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
      Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321
    </p>
  </footer>
</body>
</html>
