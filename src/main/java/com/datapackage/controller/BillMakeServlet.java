package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/BillMakeServlet")
public class BillMakeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // Retrieve form parameters
        String employeeName = request.getParameter("employeeName");
        String employeeID   = request.getParameter("employeeID");
        String bookingID    = request.getParameter("bookingID");
        String customerID   = request.getParameter("customerID");
        String vehicle      = request.getParameter("vehicle");
        String kilometers   = request.getParameter("kilometers");
        String perKmRate    = request.getParameter("perKmRate");
        String amount       = request.getParameter("amount");

        // SQL for inserting the bill
        String insertSql = "INSERT INTO bill (employee_name, employee_id, booking_id, customer_id, vehicle, kilometers, per_km_rate, amount, bill_date) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        // SQL for deleting the booking record after successful bill generation
        String deleteSql = "DELETE FROM carbooking WHERE id = ?";
        
        Connection con = null;
        PreparedStatement insertPs = null;
        PreparedStatement deletePs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            // Start transaction
            con.setAutoCommit(false);
            
            insertPs = con.prepareStatement(insertSql);
            insertPs.setString(1, employeeName);
            insertPs.setString(2, employeeID);
            insertPs.setInt(3, Integer.parseInt(bookingID));
            insertPs.setInt(4, Integer.parseInt(customerID));
            insertPs.setString(5, vehicle);
            insertPs.setDouble(6, Double.parseDouble(kilometers));
            insertPs.setDouble(7, Double.parseDouble(perKmRate));
            insertPs.setDouble(8, Double.parseDouble(amount));
            
            int insertRow = insertPs.executeUpdate();
            
           
            if (insertRow > 0) {
                deletePs = con.prepareStatement(deleteSql);
                deletePs.setInt(1, Integer.parseInt(bookingID));
                int deleteRow = deletePs.executeUpdate();
                System.out.println("DEBUG: Deleted " + deleteRow + " record(s) from carbooking.");
            }
            
            // Commit the transaction
            con.commit();
            
            // Get current timestamp for receipt
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String timestamp = now.format(formatter);
            
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html lang='en'>");
                out.println("<head>");
                out.println("  <meta charset='UTF-8'>");
                out.println("  <meta name='viewport' content='width=device-width, initial-scale=1'>");
                out.println("  <title>Bill Status - Mega City Cab</title>");
                out.println("  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
                out.println("  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css'>");
                out.println("  <style>");
                out.println("    body {");
                out.println("      font-family: 'Roboto', Arial, sans-serif;");
                out.println("      background-color: #f8f9fa;");
                out.println("      padding-top: 50px;");
                out.println("    }");
                out.println("    .status-card {");
                out.println("      max-width: 650px;");
                out.println("      margin: 0 auto;");
                out.println("      background: #fff;");
                out.println("      border-radius: 15px;");
                out.println("      box-shadow: 0 10px 30px rgba(0,0,0,0.1);");
                out.println("      overflow: hidden;");
                out.println("    }");
                out.println("    .card-header {");
                out.println("      background: linear-gradient(to right, #FFC107, #FFD54F, #FFECB3);");
                out.println("      color: #5D4037;");
                out.println("      padding: 20px;");
                out.println("      text-align: center;");
                out.println("      border-bottom: 1px solid #eee;");
                out.println("    }");
                out.println("    .card-header h2 {");
                out.println("      margin: 0;");
                out.println("      font-weight: 700;");
                out.println("    }");
                out.println("    .card-body {");
                out.println("      padding: 30px;");
                out.println("    }");
                out.println("    .status-icon {");
                out.println("      font-size: 60px;");
                out.println("      margin-bottom: 20px;");
                out.println("    }");
                out.println("    .success-icon {");
                out.println("      color: #28a745;");
                out.println("    }");
                out.println("    .error-icon {");
                out.println("      color: #dc3545;");
                out.println("    }");
                out.println("    .receipt-details {");
                out.println("      background-color: #f9f9f9;");
                out.println("      border-radius: 10px;");
                out.println("      padding: 20px;");
                out.println("      margin: 20px 0;");
                out.println("      border-left: 4px solid #FFC107;");
                out.println("    }");
                out.println("    .receipt-row {");
                out.println("      display: flex;");
                out.println("      justify-content: space-between;");
                out.println("      margin-bottom: 10px;");
                out.println("      padding-bottom: 10px;");
                out.println("      border-bottom: 1px dashed #ddd;");
                out.println("    }");
                out.println("    .receipt-row:last-child {");
                out.println("      border-bottom: none;");
                out.println("    }");
                out.println("    .action-buttons {");
                out.println("      display: flex;");
                out.println("      justify-content: center;");
                out.println("      gap: 15px;");
                out.println("      margin-top: 25px;");
                out.println("    }");
                out.println("    .btn-custom {");
                out.println("      padding: 10px 20px;");
                out.println("      border-radius: 30px;");
                out.println("      font-weight: 500;");
                out.println("      text-transform: uppercase;");
                out.println("      letter-spacing: 1px;");
                out.println("      transition: all 0.3s;");
                out.println("    }");
                out.println("    .btn-custom:hover {");
                out.println("      transform: translateY(-3px);");
                out.println("      box-shadow: 0 5px 15px rgba(0,0,0,0.1);");
                out.println("    }");
                out.println("    .btn-primary {");
                out.println("      background-color: #FFC107;");
                out.println("      border-color: #FFC107;");
                out.println("      color: #5D4037;");
                out.println("    }");
                out.println("    .btn-secondary {");
                out.println("      background-color: #f8f9fa;");
                out.println("      border-color: #ddd;");
                out.println("      color: #5D4037;");
                out.println("    }");
                out.println("    .footer {");
                out.println("      text-align: center;");
                out.println("      margin-top: 30px;");
                out.println("      color: #888;");
                out.println("      font-size: 0.9rem;");
                out.println("    }");
                out.println("    .confirmation-number {");
                out.println("      font-family: monospace;");
                out.println("      background: #f0f0f0;");
                out.println("      padding: 5px 10px;");
                out.println("      border-radius: 4px;");
                out.println("      letter-spacing: 1px;");
                out.println("    }");
                out.println("    .animation-container {");
                out.println("      height: 100px;");
                out.println("      display: flex;");
                out.println("      justify-content: center;");
                out.println("      align-items: center;");
                out.println("      overflow: hidden;");
                out.println("    }");
                out.println("    .check-animation {");
                out.println("      animation: scaleUp 0.5s ease-in-out;");
                out.println("    }");
                out.println("    @keyframes scaleUp {");
                out.println("      0% { transform: scale(0); opacity: 0; }");
                out.println("      60% { transform: scale(1.2); }");
                out.println("      100% { transform: scale(1); opacity: 1; }");
                out.println("    }");
                out.println("    .timestamp {");
                out.println("      font-size: 0.8rem;");
                out.println("      color: #888;");
                out.println("      text-align: right;");
                out.println("      margin-top: 15px;");
                out.println("    }");
                out.println("  </style>");
                out.println("</head>");
                out.println("<body>");
                out.println("  <div class='container'>");
                out.println("    <div class='status-card'>");
                out.println("      <div class='card-header'>");
                out.println("        <h2><i class='fas fa-taxi me-2'></i>Mega City Cab</h2>");
                out.println("      </div>");
                out.println("      <div class='card-body text-center'>");
                
                if (insertRow > 0) {
                    out.println("        <div class='animation-container'>");
                    out.println("          <i class='fas fa-check-circle status-icon success-icon check-animation'></i>");
                    out.println("        </div>");
                    out.println("        <h3 class='mb-4 text-success'>Bill Generated Successfully</h3>");
                    out.println("        <p>Your bill has been generated and the booking has been closed.</p>");
                   
                    
                    // Receipt details
                    out.println("        <div class='receipt-details'>");
                    out.println("          <h5 class='mb-3 text-center'>Receipt Details</h5>");
                    out.println("          <div class='receipt-row'>");
                    out.println("            <span>Booking ID:</span>");
                    out.println("            <span>#" + bookingID + "</span>");
                    out.println("          </div>");
                    out.println("          <div class='receipt-row'>");
                    out.println("            <span>Vehicle:</span>");
                    out.println("            <span>" + vehicle + "</span>");
                    out.println("          </div>");
                    out.println("          <div class='receipt-row'>");
                    out.println("            <span>Distance:</span>");
                    out.println("            <span>" + kilometers + " km</span>");
                    out.println("          </div>");
                    out.println("          <div class='receipt-row'>");
                    out.println("            <span>Rate:</span>");
                    out.println("            <span>$" + perKmRate + "/km</span>");
                    out.println("          </div>");
                    out.println("          <div class='receipt-row fw-bold'>");
                    out.println("            <span>Total Amount:</span>");
                    out.println("            <span>$" + amount + "</span>");
                    out.println("          </div>");
                    out.println("          <div class='timestamp'>");
                    out.println("            Generated on: " + timestamp);
                    out.println("          </div>");
                    out.println("        </div>");
                } else {
                    out.println("        <i class='fas fa-times-circle status-icon error-icon'></i>");
                    out.println("        <h3 class='mb-4 text-danger'>Failed to Generate Bill</h3>");
                    out.println("        <p>There was an error while processing your bill. Please try again or contact support.</p>");
                }
                
                out.println("        <div class='action-buttons'>");
                out.println("          <a href='bill_make.jsp' class='btn btn-primary btn-custom'><i class='fas fa-arrow-left me-2'></i>Back to Billing</a>");
                out.println("          <a href='employee_home.jsp' class='btn btn-secondary btn-custom'><i class='fas fa-home me-2'></i>Dashboard</a>");
                out.println("        </div>");
                out.println("      </div>");
                out.println("    </div>");
                out.println("    <div class='footer'>");
                out.println("      <p>&copy; 2025 Mega City Cab. All rights reserved.</p>");
                out.println("    </div>");
                out.println("  </div>");
                out.println("  <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js'></script>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                out.println("<html lang='en'>");
                out.println("<head>");
                out.println("  <meta charset='UTF-8'>");
                out.println("  <meta name='viewport' content='width=device-width, initial-scale=1'>");
                out.println("  <title>Error - Mega City Cab</title>");
                out.println("  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
                out.println("  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css'>");
                out.println("  <style>");
                out.println("    body {");
                out.println("      font-family: 'Roboto', Arial, sans-serif;");
                out.println("      background-color: #f8f9fa;");
                out.println("      padding-top: 50px;");
                out.println("    }");
                out.println("    .error-card {");
                out.println("      max-width: 500px;");
                out.println("      margin: 0 auto;");
                out.println("      background: #fff;");
                out.println("      border-radius: 15px;");
                out.println("      box-shadow: 0 10px 30px rgba(0,0,0,0.1);");
                out.println("      overflow: hidden;");
                out.println("      text-align: center;");
                out.println("      padding: 30px;");
                out.println("    }");
                out.println("    .error-icon {");
                out.println("      font-size: 70px;");
                out.println("      color: #dc3545;");
                out.println("      margin-bottom: 20px;");
                out.println("    }");
                out.println("    .btn-primary {");
                out.println("      background-color: #FFC107;");
                out.println("      border-color: #FFC107;");
                out.println("      color: #5D4037;");
                out.println("      border-radius: 30px;");
                out.println("      padding: 10px 25px;");
                out.println("      font-weight: 500;");
                out.println("      margin-top: 20px;");
                out.println("    }");
                out.println("  </style>");
                out.println("</head>");
                out.println("<body>");
                out.println("  <div class='container'>");
                out.println("    <div class='error-card'>");
                out.println("      <i class='fas fa-exclamation-triangle error-icon'></i>");
                out.println("      <h3 class='text-danger mb-3'>System Error</h3>");
                out.println("      <p>We encountered a problem while processing your request. The system administrator has been notified.</p>");
                out.println("      <p class='text-muted small'>Error Details: " + e.getMessage() + "</p>");
                out.println("      <a href='bill_make.jsp' class='btn btn-primary'><i class='fas fa-arrow-left me-2'></i>Return to Billing Page</a>");
                out.println("    </div>");
                out.println("  </div>");
                out.println("</body>");
                out.println("</html>");
            }
        } finally {
            try {
                if (insertPs != null) insertPs.close();
                if (deletePs != null) deletePs.close();
                if (con != null) con.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}