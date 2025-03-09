package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.datapackage.model.Bill; // Updated import

@WebServlet("/FetchBillsJsonServlet")
public class FetchBillsJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        List<Bill> bills = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            // Retrieve customerID from request parameters.
            String customerIDParam = request.getParameter("customerID");
            System.out.println("FetchBillsJsonServlet: Received customerID parameter: " + customerIDParam);
            if (customerIDParam == null || customerIDParam.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Missing customerID parameter.\"}");
                return;
            }
            
            int customerID = Integer.parseInt(customerIDParam);
            
            // Load the JDBC driver and establish connection.
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Query bills only for the given customer ID.
            String sql = "SELECT id, employee_name, employee_id, booking_id, customer_id, vehicle, kilometers, per_km_rate, amount, bill_date FROM bill WHERE customer_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, customerID);
            rs = ps.executeQuery();
            
            // Build list of bills for the logged-in user.
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setEmployeeName(rs.getString("employee_name"));
                bill.setEmployeeId(rs.getInt("employee_id"));
                bill.setBookingId(rs.getInt("booking_id"));
                bill.setCustomerId(rs.getInt("customer_id"));
                bill.setVehicle(rs.getString("vehicle"));
                bill.setKilometers(rs.getDouble("kilometers"));
                bill.setPerKmRate(rs.getDouble("per_km_rate"));
                bill.setAmount(rs.getDouble("amount"));
                bill.setBillDate(rs.getDate("bill_date")); // Adjust format if necessary

                bills.add(bill);
            }
            
            // Convert list to JSON and output it.
            Gson gson = new Gson();
            String json = gson.toJson(bills);
            out.print(json);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Unable to fetch bills.\"}");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception ex) { ex.printStackTrace(); }
            try { if(ps != null) ps.close(); } catch(Exception ex) { ex.printStackTrace(); }
            try { if(con != null) con.close(); } catch(Exception ex) { ex.printStackTrace(); }
        }
    }
}
