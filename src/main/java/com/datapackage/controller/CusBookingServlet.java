package com.datapackage.controller;
import com.datapackage.dao.BookingDao;
import com.datapackage.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/CusBookingServlet")
public class CusBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public CusBookingServlet() {
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        // Retrieve parameters from the booking form.
        String customerName = request.getParameter("customerName"); 
        String customerIDStr = request.getParameter("customerID");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");
        String bookingDateStr = request.getParameter("bookingDate");
        String selectedVehicle = request.getParameter("vehicle");
        
        // Convert customer ID.
        int customerID = 0;
        try {
            customerID = Integer.parseInt(customerIDStr);
        } catch (NumberFormatException e) {
            customerID = 0;
        }
        
        // Convert booking date.
        Date bookingDate = null;
        try {
            bookingDate = Date.valueOf(bookingDateStr);
        } catch (IllegalArgumentException e) {
            // Handle invalid date
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid booking date format.");
            return;
        }
        
        // Create a Booking object.
        Booking booking = new Booking(bookingDate, customerID, selectedVehicle, pickupLocation, dropoffLocation);
        
        // Generate booking reference (simple example)
        String bookingReference = "MCC-" + System.currentTimeMillis() % 10000;
        
        // Use BookingDao to create the booking.
        BookingDao dao = new BookingDao();
        int rowsAffected = 0;
        try {
            rowsAffected = dao.createBooking(booking);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Format date for display
        String formattedDate = "";
        try {
            LocalDate date = LocalDate.parse(bookingDateStr);
            formattedDate = date.format(DateTimeFormatter.ofPattern("EEEE, MMMM d, yyyy"));
        } catch (Exception e) {
            formattedDate = bookingDateStr;
        }
        
        // Respond to the client with a nicely styled page
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("  <meta charset='UTF-8'>");
        out.println("  <meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("  <title>" + (rowsAffected > 0 ? "Booking Confirmation" : "Booking Failed") + " - MegaCityCab</title>");
        out.println("  <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("  <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css' rel='stylesheet'>");
        out.println("  <link href='https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap' rel='stylesheet'>");
        out.println("  <style>");
        out.println("    :root {");
        out.println("      --primary-color: #ffcc00;");
        out.println("      --secondary-color: #212529;");
        out.println("      --accent-color: #ff9900;");
        out.println("    }");
        out.println("    body {");
        out.println("      font-family: 'Poppins', sans-serif;");
        out.println("      background-color: #f8f9fa;");
        out.println("      min-height: 100vh;");
        out.println("      display: flex;");
        out.println("      flex-direction: column;");
        out.println("    }");
        out.println("    .confirmation-container {");
        out.println("      max-width: 700px;");
        out.println("      margin: 2rem auto;");
        out.println("      background-color: #fff;");
        out.println("      border-radius: 16px;");
        out.println("      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);");
        out.println("      overflow: hidden;");
        out.println("    }");
        out.println("    .confirmation-header {");
        out.println("      background-color: " + (rowsAffected > 0 ? "var(--primary-color)" : "#dc3545") + ";");
        out.println("      color: " + (rowsAffected > 0 ? "var(--secondary-color)" : "#fff") + ";");
        out.println("      padding: 2rem;");
        out.println("      text-align: center;");
        out.println("      position: relative;");
        out.println("    }");
        out.println("    .confirmation-header h2 {");
        out.println("      font-weight: 700;");
        out.println("      margin-bottom: 0.5rem;");
        out.println("    }");
        out.println("    .confirmation-header .icon {");
        out.println("      font-size: 4rem;");
        out.println("      margin-bottom: 1rem;");
        out.println("    }");
        out.println("    .confirmation-body {");
        out.println("      padding: 2rem;");
        out.println("    }");
        out.println("    .booking-details {");
        out.println("      border-left: 4px solid var(--primary-color);");
        out.println("      padding-left: 1rem;");
        out.println("      margin: 1.5rem 0;");
        out.println("    }");
        out.println("    .detail-item {");
        out.println("      display: flex;");
        out.println("      margin-bottom: 1rem;");
        out.println("      align-items: flex-start;");
        out.println("    }");
        out.println("    .detail-icon {");
        out.println("      color: var(--primary-color);");
        out.println("      font-size: 1.3rem;");
        out.println("      margin-right: 1rem;");
        out.println("      min-width: 24px;");
        out.println("    }");
        out.println("    .detail-label {");
        out.println("      font-weight: 600;");
        out.println("      width: 130px;");
        out.println("    }");
        out.println("    .detail-value {");
        out.println("      flex-grow: 1;");
        out.println("    }");
        out.println("    .booking-reference {");
        out.println("      font-size: 1.2rem;");
        out.println("      font-weight: 700;");
        out.println("      letter-spacing: 1px;");
        out.println("      color: var(--accent-color);");
        out.println("      margin-top: 1rem;");
        out.println("      padding: 0.5rem;");
        out.println("      text-align: center;");
        out.println("      border: 2px dashed var(--primary-color);");
        out.println("      border-radius: 8px;");
        out.println("      background-color: rgba(255, 204, 0, 0.1);");
        out.println("    }");
        out.println("    .btn-taxi {");
        out.println("      background-color: var(--primary-color);");
        out.println("      color: var(--secondary-color);");
        out.println("      font-weight: 600;");
        out.println("      padding: 0.75rem 1.5rem;");
        out.println("      border-radius: 8px;");
        out.println("      border: none;");
        out.println("      transition: all 0.3s;");
        out.println("      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);");
        out.println("    }");
        out.println("    .btn-taxi:hover {");
        out.println("      background-color: var(--accent-color);");
        out.println("      color: white;");
        out.println("      transform: translateY(-2px);");
        out.println("      box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);");
        out.println("    }");
        out.println("    .action-buttons {");
        out.println("      display: flex;");
        out.println("      justify-content: center;");
        out.println("      gap: 1rem;");
        out.println("      margin-top: 2rem;");
        out.println("    }");
        out.println("    footer {");
        out.println("      background-color: var(--secondary-color);");
        out.println("      color: white;");
        out.println("      padding: 1.5rem 0;");
        out.println("      text-align: center;");
        out.println("      margin-top: auto;");
        out.println("    }");
        out.println("    @media (max-width: 576px) {");
        out.println("      .confirmation-container {");
        out.println("        margin: 1rem;");
        out.println("      }");
        out.println("      .detail-item {");
        out.println("        flex-direction: column;");
        out.println("      }");
        out.println("      .detail-label {");
        out.println("        width: 100%;");
        out.println("        margin-bottom: 0.25rem;");
        out.println("      }");
        out.println("      .action-buttons {");
        out.println("        flex-direction: column;");
        out.println("      }");
        out.println("      .btn {");
        out.println("        width: 100%;");
        out.println("        margin-bottom: 0.5rem;");
        out.println("      }");
        out.println("    }");
        out.println("  </style>");
        out.println("</head>");
        out.println("<body>");
        out.println("  <div class='container'>");
        out.println("    <div class='confirmation-container'>");
        
        if (rowsAffected > 0) {
            // Success message
            out.println("      <div class='confirmation-header'>");
            out.println("        <div class='icon'><i class='bi bi-check-circle'></i></div>");
            out.println("        <h2>Booking Confirmed!</h2>");
            out.println("        <p>Your ride has been successfully booked</p>");
            out.println("      </div>");
            out.println("      <div class='confirmation-body'>");
            out.println("        <div class='alert alert-success' role='alert'>");
           
            out.println("        </div>");
           

            out.println("          <div class='detail-item'>");
            out.println("            <div class='detail-icon'><i class='bi bi-person-fill'></i></div>");
            out.println("            <div class='detail-label'>Customer:</div>");
            out.println("            <div class='detail-value'>" + customerName + " (ID: " + customerIDStr + ")</div>");
            out.println("          </div>");
            
            // Vehicle info
            out.println("          <div class='detail-item'>");
            out.println("            <div class='detail-icon'><i class='bi bi-car-front-fill'></i></div>");
            out.println("            <div class='detail-label'>Vehicle:</div>");
            out.println("            <div class='detail-value'>" + selectedVehicle + "</div>");
            out.println("          </div>");
            
            // Date info
            out.println("          <div class='detail-item'>");
            out.println("            <div class='detail-icon'><i class='bi bi-calendar-event'></i></div>");
            out.println("            <div class='detail-label'>Date:</div>");
            out.println("            <div class='detail-value'>" + formattedDate + "</div>");
            out.println("          </div>");
            
            // Pickup info
            out.println("          <div class='detail-item'>");
            out.println("            <div class='detail-icon'><i class='bi bi-geo-alt-fill'></i></div>");
            out.println("            <div class='detail-label'>Pickup:</div>");
            out.println("            <div class='detail-value'>" + pickupLocation + "</div>");
            out.println("          </div>");
            
            // Dropoff info
            out.println("          <div class='detail-item'>");
            out.println("            <div class='detail-icon'><i class='bi bi-pin-map-fill'></i></div>");
            out.println("            <div class='detail-label'>Dropoff:</div>");
            out.println("            <div class='detail-value'>" + dropoffLocation + "</div>");
            out.println("          </div>");
            
            out.println("        </div>"); // end of booking-details
            
            out.println("        <div class='action-buttons'>");
            out.println("          <a href='cus_booking.jsp' class='btn btn-taxi'><i class='bi bi-plus-circle me-2'></i>Book Another Ride</a>");
            out.println("          <a href='customer_home.jsp' class='btn btn-outline-secondary'><i class='bi bi-house me-2'></i>Back to Dashboard</a>");
            out.println("        </div>");
            
        } else {
            // Failure message
            out.println("      <div class='confirmation-header'>");
            out.println("        <div class='icon'><i class='bi bi-x-circle'></i></div>");
            out.println("        <h2>Booking Failed</h2>");
            out.println("        <p>There was an error processing your booking</p>");
            out.println("      </div>");
            out.println("      <div class='confirmation-body'>");
            out.println("        <div class='alert alert-danger' role='alert'>");
            out.println("          <i class='bi bi-exclamation-triangle-fill me-2'></i> We encountered a problem while processing your booking. Please try again or contact our support team if the problem persists.");
            out.println("        </div>");
            out.println("        <div class='action-buttons'>");
            out.println("          <a href='cus_booking.jsp' class='btn btn-taxi'><i class='bi bi-arrow-repeat me-2'></i>Try Again</a>");
            out.println("          <a href='contact.jsp' class='btn btn-outline-secondary'><i class='bi bi-headset me-2'></i>Contact Support</a>");
            out.println("        </div>");
        }
        
        out.println("      </div>"); // end of confirmation-body
        out.println("    </div>"); // end of confirmation-container
        out.println("  </div>"); // end of container
        
        // Footer
        out.println("  <footer>");
        out.println("    <div class='container'>");
        out.println("      <p class='mb-1'>&copy; 2023 MegaCityCab. All rights reserved.</p>");
        out.println("      <p class='small text-muted'>Email: support@megacitycab.com | Phone: +1-555-123-4567</p>");
        out.println("    </div>");
        out.println("  </footer>");
        
        out.println("  <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js'></script>");
        out.println("</body>");
        out.println("</html>");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }
}