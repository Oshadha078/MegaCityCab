package com.datapackage.controller;

import com.datapackage.dao.AdminDao;
import com.datapackage.model.Customer;
import com.google.gson.Gson;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminServlet")
@MultipartConfig
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();
    private AdminDao adminDao;

    @Override
    public void init() throws ServletException {
        adminDao = new AdminDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            int rowsAffected = 0;
            if ("createCustomer".equals(action)) {
                Customer newCustomer = new Customer(
                        request.getParameter("nic"),
                        request.getParameter("name"),
                        request.getParameter("address"),
                        request.getParameter("contact"),
                        request.getParameter("usertype"),
                        request.getParameter("password")
                );
                rowsAffected = adminDao.createCustomer(newCustomer);
            } else if ("updateCustomer".equals(action)) {
                Customer updatedCustomer = new Customer(
                        request.getParameter("nic"),
                        request.getParameter("name"),
                        request.getParameter("address"),
                        request.getParameter("contact"),
                        request.getParameter("usertype")
                );
                rowsAffected = adminDao.updateCustomer(updatedCustomer);
            } else if ("deleteCustomer".equals(action)) {
                rowsAffected = adminDao.deleteCustomer(request.getParameter("nic"));
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\":\"Invalid action\"}");
                return;
            }
            response.getWriter().write("{\"status\":\"success\", \"rowsAffected\":" + rowsAffected + "}");
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Database error: " + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String nic = request.getParameter("nic");
        try {
            if (nic != null && !nic.isEmpty()) {
                Customer customer = adminDao.getCustomer(nic);
                if (customer != null) {
                    response.getWriter().write(gson.toJson(customer));
                } else {
                    response.getWriter().write("{\"error\":\"User not found\"}");
                }
            } else {
                List<Customer> customers = adminDao.getAllCustomers();
                response.getWriter().write(gson.toJson(customers));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\":\"Database error: " + e.getMessage() + "\"}");
        }
    }
}