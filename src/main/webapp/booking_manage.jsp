<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Booking Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #fff3cd;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #ffcc00;
        }
        .navbar-brand, .nav-link {
            color: #000 !important;
            font-weight: bold;
        }
        .btn-primary, .btn-success {
            background-color: #ffcc00;
            border-color: #ffcc00;
            color: black;
            font-weight: bold;
        }
        .btn-primary:hover, .btn-success:hover {
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
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">Cab Booking</a>
            <button class="btn btn-danger ms-auto" onclick="logout()">Logout</button>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center">Vehicle Booking Management</h2>
        
        <div class="row mt-4">
            <div class="col-md-6">
                <h4>Available Vehicles</h4>
                <ul class="list-group" id="vehicle-list">
                    <li class="list-group-item">Car - Sedan <button class="btn btn-primary btn-sm float-end" onclick="bookVehicle('Car - Sedan')">Book</button></li>
                    <li class="list-group-item">SUV <button class="btn btn-primary btn-sm float-end" onclick="bookVehicle('SUV')">Book</button></li>
                    <li class="list-group-item">Bike <button class="btn btn-primary btn-sm float-end" onclick="bookVehicle('Bike')">Book</button></li>
                </ul>
            </div>

            <div class="col-md-6">
                <h4>Book a Vehicle</h4>
                <form id="booking-form">
                    <div class="mb-3">
                        <label for="vehicle" class="form-label">Vehicle</label>
                        <input type="text" id="vehicle" class="form-control" readonly required>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Date & Time</label>
                        <input type="datetime-local" id="date" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-success">Confirm Booking</button>
                </form>
            </div>
        </div>

        <h4 class="mt-4">My Bookings</h4>
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

    <footer class="mt-5" style="background-color: #343a40; color: #fff; padding: 20px 0;">
        <hr style="border-top: 1px solid #fff; margin-bottom: 10px;">
        <p style="margin: 0; text-align: center; font-size: 0.9rem;">&copy; 2023 MegaCityCab. All rights reserved.</p>
        <p style="margin: 5px 0; text-align: center; font-size: 0.9rem;">
            Email: info@megacitycab.com | Phone: +1-555-123-4567
        </p>
    </footer>

    <script>
        function bookVehicle(vehicleName) {
            document.getElementById('vehicle').value = vehicleName;
        }

        document.getElementById('booking-form').addEventListener('submit', function(event) {
            event.preventDefault();
            const vehicle = document.getElementById('vehicle').value;
            const date = document.getElementById('date').value;

            if (vehicle && date) {
                const formattedDate = new Date(date).toLocaleString();
                const tableBody = document.getElementById('booking-table').querySelector('tbody');
                const newRow = tableBody.insertRow();
                newRow.innerHTML = `
                    <td>${vehicle}</td>
                    <td>${formattedDate}</td>
                    <td><button class='btn btn-danger btn-sm' onclick='cancelBooking(this)'>Cancel</button></td>
                `;
                document.getElementById('booking-form').reset();
            } else {
                alert('Please select a vehicle and date.');
            }
        });

        function cancelBooking(button) {
            const row = button.closest('tr');
            if (confirm('Are you sure you want to cancel this booking?')) {
                row.remove();
            }
        }

        function logout() {
            alert('Logging out...');
            window.location.href = '/Login';
        }
    </script>
</body>
</html>