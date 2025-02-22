package com.datapackage.controller;

import com.datapackage.dao.BillDao;
import com.datapackage.model.Bill;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminBillJsonServlet")
public class AdminBillJsonServlet extends HttpServlet { 
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set response to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        BillDao billDao = new BillDao();
        try {
            List<Bill> bills = billDao.getBills();
            String json = gson.toJson(bills);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Database error: " + e.getMessage() + "\"}");
        }
    }
}
