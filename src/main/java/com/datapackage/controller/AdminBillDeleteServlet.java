package com.datapackage.controller;

import com.datapackage.dao.BillDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AdminBillDeleteServlet")
public class AdminBillDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("AdminBillJsonServlet");
            return;
        }
        int billId;
        try {
            billId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("AdminBillJsonServlet");
            return;
        }
        
        BillDao billDao = new BillDao();
        try {
            billDao.deleteBill(billId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Redirect to the JSON servlet so the AJAX call can reload data.
        response.sendRedirect("AdminBillJsonServlet");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
