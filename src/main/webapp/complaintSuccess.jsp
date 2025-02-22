<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint Submitted</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fff3cd;
        }
        .container {
            text-align: center;
            background-color: #ffcc00;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #000;
            font-weight: bold;
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
    </style>
</head>
<body>
   <div class="container mt-5">
      <h2>Your complaint has been submitted successfully!</h2>
      <a href="cus_complaint.jsp" class="btn btn-primary mt-3">Submit Another Complaint</a>
   </div>
</body>
</html>