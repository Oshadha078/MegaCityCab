<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Booking Service</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #fff3cd;
        }
        .navbar {
            background-color: #ffcc00;
        }
        .navbar-brand, .nav-link {
            color: #000 !important;
            font-weight: bold;
        }
        .vehicle-card {
            transition: transform 0.2s;
            background-color: #fff;
            border: 2px solid #ffcc00;
        }
        .vehicle-card:hover {
            transform: scale(1.05);
        }
        .btn-primary {
            background-color: #ffcc00;
            border-color: #ffcc00;
            color: black;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #e6b800;
            border-color: #e6b800;
        }
        .btn-success {
            background-color: #ffcc00;
            border-color: #ffcc00;
            color: black;
            font-weight: bold;
        }
        .btn-success:hover {
            background-color: #e6b800;
            border-color: #e6b800;
        }
        .btn-danger {
            background-color: #cc0000;
            border-color: #cc0000;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">Cab Booking</a>
            <!-- Logout Button -->
            <button class="btn btn-danger ms-auto" onclick="logout()">Logout</button>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center text-dark">Book Your Ride</h2>
        
        <div class="row mt-4">
            <!-- Available Vehicles -->
            <div class="col-md-6">
                <h4 class="text-dark">Available Vehicles</h4>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card vehicle-card">
                            <div class="card-body text-center">
                                <h5 class="card-title">Sedan</h5>
                                <button class="btn btn-primary btn-sm" onclick="bookVehicle('Sedan')">Book</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card vehicle-card">
                            <div class="card-body text-center">
                                <h5 class="card-title">SUV</h5>
                                <button class="btn btn-primary btn-sm" onclick="bookVehicle('SUV')">Book</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card vehicle-card">
                            <div class="card-body text-center">
                                <h5 class="card-title">Bike</h5>
                                <button class="btn btn-primary btn-sm" onclick="bookVehicle('Bike')">Book</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Booking Form -->
            <div class="col-md-6">
                <h4 class="text-dark">Book a Ride</h4>
                <form id="booking-form">
                    <div class="mb-3">
                        <label for="vehicle" class="form-label">Vehicle</label>
                        <input type="text" id="vehicle" class="form-control" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Date & Time</label>
                        <input type="datetime-local" id="date" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-success">Confirm Booking</button>
                </form>
            </div>
        </div>
        
        <!-- User Bookings -->
        <h4 class="mt-4 text-dark">My Bookings</h4>
        <table class="table table-bordered" id="booking-table">
            <thead>
                <tr>
                    <th>Vehicle</th>
                    <th>Date & Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    
    <script>
        function bookVehicle(vehicleName) {
            document.getElementById('vehicle').value = vehicleName;
        }

        document.getElementById('booking-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const vehicle = document.getElementById('vehicle').value;
            const date = document.getElementById('date').value;
            if (vehicle && date) {
                const table = document.getElementById('booking-table').getElementsByTagName('tbody')[0];
                const row = table.insertRow();
                row.innerHTML = `<td>${vehicle}</td><td>${date}</td><td><button class='btn btn-danger btn-sm' onclick='cancelBooking(this)'>Cancel</button></td>`;
                document.getElementById('booking-form').reset();
            }
        });
        
        function cancelBooking(button) {
            const row = button.closest('tr');
            row.remove();
        }

        function logout() {
            // Logic for logging out (redirecting, clearing session, etc.)
            alert('Logging out...');
            window.location.href = '/login'; // Example of redirection
        }
    </script>
</body>
</html>
