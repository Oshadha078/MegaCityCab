package com.datapackage.controller;

import com.datapackage.dao.UserDao;
import com.datapackage.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;
    
    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Retrieve form data
        String nic = request.getParameter("nic");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");
        String usertype = request.getParameter("usertype");
        
        // Validate usertype; default to "user" if invalid
        if (usertype == null || usertype.trim().isEmpty() ||
            !(usertype.equalsIgnoreCase("admin") || usertype.equalsIgnoreCase("user") || usertype.equalsIgnoreCase("employee"))) {
            usertype = "user";
        }
        
        // Create a new User object and set its properties
        User user = new User();
        user.setNic(nic);
        user.setName(name);
        user.setAddress(address);
        user.setContact(contact);
        user.setPassword(password);
        user.setUsertype(usertype);
        
        // Insert the user into the database
        int count = userDao.registerUser(user);
        if (count > 0) {
            response.sendRedirect("signup.jsp?success=true");
        } else {
            response.sendRedirect("signup.jsp?error=insert");
        }
        
        out.close();
    }
}
