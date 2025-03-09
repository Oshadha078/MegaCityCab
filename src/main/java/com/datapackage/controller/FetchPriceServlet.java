package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/FetchPriceServlet")
public class FetchPriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String idParam = request.getParameter("id");
            System.out.println("DEBUG: Received id parameter: " + idParam);
            
            if (idParam == null || idParam.trim().isEmpty()) {
                out.print("0");
                return;
            }
            
            int vehicleId = Integer.parseInt(idParam);
            System.out.println("DEBUG: Parsed vehicleId: " + vehicleId);
            
            // Load JDBC driver (optional for JDBC 4+)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = con.prepareStatement("SELECT price FROM vehicles WHERE id = ?")) {
                
                ps.setInt(1, vehicleId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        double price = rs.getDouble("price");
                        System.out.println("DEBUG: Retrieved price from DB: " + price);
                        // Apply a 3% discount if the price is greater than 500
                        if (price > 500) {
                            price = price * 0.97;
                            System.out.println("DEBUG: Price after 3% discount: " + price);
                        }
                        out.print(String.format("%.2f", price));
                    } else {
                        System.out.println("DEBUG: No record found for vehicle id: " + vehicleId);
                        out.print("10");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("10");
        }
    }
}
