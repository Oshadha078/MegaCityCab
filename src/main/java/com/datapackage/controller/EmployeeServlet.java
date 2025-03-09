package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/EmployeeHomeServlet")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Example query to get user details from the 'users' table
    private static final String GET_USER_DETAILS =
        "SELECT name, address, contact FROM users WHERE id = ?";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve userID from session or cookies
        HttpSession session = request.getSession(false);
        Integer userID = null;

        if (session != null && session.getAttribute("userID") != null) {
            userID = (Integer) session.getAttribute("userID");
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if ("userID".equals(c.getName())) {
                        userID = Integer.valueOf(c.getValue());
                        break;
                    }
                }
            }
        }

        // If userID is null, redirect to login.
        if (userID == null) {
            response.sendRedirect("Login.html");
            return;
        }

        // Query DB for user details
        String name = null, address = null, contact = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "Mobitel#123");
            
            PreparedStatement ps = con.prepareStatement(GET_USER_DETAILS);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                address = rs.getString("address");
                contact = rs.getString("contact");
            }

            rs.close();
            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error retrieving user details: " + e.getMessage() + "</h3>");
            return;
        }

        if (name == null)    name = "Unknown";
        if (address == null) address = "Not Available";
        if (contact == null) contact = "Not Available";

        Cookie addressCookie = new Cookie("address", address);
        Cookie contactCookie = new Cookie("contact", contact);
        addressCookie.setMaxAge(30 * 60);
        contactCookie.setMaxAge(30 * 60);
        response.addCookie(addressCookie);
        response.addCookie(contactCookie);

        Cookie nameCookie = new Cookie("name", name);
        nameCookie.setMaxAge(30 * 60);
        response.addCookie(nameCookie);

        // Redirect to EmployeeHome.html (JSP/HTML page)
        response.sendRedirect("EmployeeHome.html");
    }
}
