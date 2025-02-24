<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Reply</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      padding: 2rem;
    }
    .container {
      max-width: 800px;
      margin: auto;
      background: #fff;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
  <div class="container">
    <h2 id="complaintTitle" class="mb-4"></h2>
    
    <div id="complaintDetails" class="card mb-3">
      <div class="card-body">
        <p><strong>User ID:</strong> <span id="userId"></span></p>
        <p><strong>User Name:</strong> <span id="userName"></span></p>
        <p><strong>Subject:</strong> <span id="subject"></span></p>
        <p><strong>Description:</strong> <span id="description"></span></p>
        <p><strong>Status:</strong> <span id="status"></span></p>
      </div>
    </div>

    <!-- Admin Reply Form -->
    <form id="replyForm">
      <input type="hidden" name="complaint_id" id="complaint_id">
      <div class="form-group">
        <label for="admin_reply">Admin Reply:</label>
        <textarea class="form-control" name="admin_reply" id="admin_reply" rows="5" required></textarea>
      </div>
      <button type="submit" class="btn btn-primary">Submit Reply</button>
      <a href="admin_complaints.html" class="btn btn-secondary">Back to Complaints</a>
    </form>
  </div>

  <script>
    /**
     * Returns the value of the URL parameter specified by 'param'.
     * Logs all URL parameters for debugging purposes.
     */
    function getQueryParam(param) {
      const urlParams = new URLSearchParams(window.location.search);
      console.log('URL Parameters:', Object.fromEntries(urlParams.entries()));
      return urlParams.get(param);
    }

    /**
     * Populates the complaint details on the page.
     * If no complaint_id is found, displays an error message.
     */
    function populateComplaintDetails() {
      const complaintId = getQueryParam("complaint_id");
      if (complaintId) {
        document.getElementById("complaintTitle").textContent = "Admin Reply for Complaint #" + complaintId;
        document.getElementById("complaint_id").value = complaintId;
        document.getElementById("userId").textContent = getQueryParam("user_id") || "N/A";
        document.getElementById("userName").textContent = getQueryParam("user_name") || "N/A";
        document.getElementById("subject").textContent = getQueryParam("subject") || "N/A";
        document.getElementById("description").textContent = getQueryParam("description") || "N/A";
        document.getElementById("status").textContent = getQueryParam("status") || "N/A";
      } else {
        document.body.innerHTML = "<h3 class='text-center text-danger'>Error: No complaint selected.</h3>";
      }
    }

    /**
     * Handles the reply form submission.
     * Submits the admin reply via a POST request to the AdminReplyServlet.
     */
    document.getElementById("replyForm").addEventListener("submit", function(event) {
      event.preventDefault(); // Prevent default form submission

      const complaintId = document.getElementById("complaint_id").value;
      const adminReply = document.getElementById("admin_reply").value;

      fetch("AdminReplyServlet", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `complaint_id=\${complaintId}&admin_reply=\${encodeURIComponent(adminReply)}`

      })
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.text();
      })
      .then(data => {
        alert("Reply submitted successfully!");
        window.location.href = "admin_complaints.html"; // Redirect back to complaints list
      })
      .catch(error => {
        console.error("Error submitting reply:", error);
        alert("Error submitting reply. Please try again.");
      });
    });

    document.addEventListener("DOMContentLoaded", populateComplaintDetails);
  </script>
</body>
</html>
