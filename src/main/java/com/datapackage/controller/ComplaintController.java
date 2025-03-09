package com.datapackage.controller;

import com.datapackage.model.Complaint;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ComplaintController")
public class ComplaintController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details – update these as necessary
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    
    // SQL statement to insert a complaint record
    private static final String INSERT_COMPLAINT_SQL = 
        "INSERT INTO Complaints (user_id, user_name, subject, description, status) VALUES (?, ?, ?, ?, ?)";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String userID = request.getParameter("userID");
        String userName = request.getParameter("userName");
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        
        // Create a Complaint model object and set its values
        Complaint complaint = new Complaint();
        complaint.setUserId(userID);
        complaint.setUserName(userName);
        complaint.setSubject(subject);
        complaint.setDescription(description);
        complaint.setStatus("Pending");  // default status
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Load the MySQL JDBC driver
            Class.forName(JDBC_DRIVER);
            // Establish the database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            // Prepare the SQL statement
            pstmt = conn.prepareStatement(INSERT_COMPLAINT_SQL);
            pstmt.setString(1, complaint.getUserId());
            pstmt.setString(2, complaint.getUserName());
            pstmt.setString(3, complaint.getSubject());
            pstmt.setString(4, complaint.getDescription());
            pstmt.setString(5, complaint.getStatus());
            
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                // Redirect to a success page if insertion is successful
                response.sendRedirect("complaintSuccess.jsp");
            } else {
                response.getWriter().println("Error: Could not submit complaint.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred: " + e.getMessage());
        } finally {
            // Clean up database resources
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
}
