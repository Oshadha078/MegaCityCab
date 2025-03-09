<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Complaint Submitted - MegaCityCab</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <style>
    body {
      background: #e5e9ec;
      font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }
    .complaint-container {
      margin: 100px auto 40px;
      padding: 40px;
      background: #fae050;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      text-align: center;
    }
    .complaint-container h2 {
      font-size: 2.2rem;
      font-weight: bold;
      color: #000;
      margin-bottom: 20px;
    }
    .complaint-container p {
      font-size: 1.2rem;
      color: #333;
    }
    .btn-primary {
      background-color: #000;
      border-color: #000;
      color: #ffcc00;
      font-weight: bold;
    }
    .btn-primary:hover {
      background-color: #333;
      border-color: #333;
    }
    footer {
      background-color: #343a40;
      color: #fff;
      padding: 20px 0;
      margin-top: 60px;
    }
    footer hr {
      border-top: 1px solid #fff;
      margin-bottom: 10px;
    }
    footer p {
      margin: 0;
      text-align: center;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>
  <div class="container complaint-container">
    <h2>
      <i class="fas fa-check-circle text-success"></i> Your complaint has been submitted successfully!
    </h2>
    <p>Thank you for your feedback. Our team will review your complaint and get back to you shortly.</p>
    <a href="cus_complaint.jsp" class="btn btn-primary mt-3"><i class="fas fa-edit"></i> Submit Another Complaint</a>
  </div>

  <footer>
    <div class="container">
      <hr>
      <p> 2023 MegaCityCab. All rights reserved.</p>
      <p>Email: info@megacitycab.com, support@megacitycab.com | Phone: +1-555-123-4567, +1-555-765-4321</p>
    </div>
  </footer>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
