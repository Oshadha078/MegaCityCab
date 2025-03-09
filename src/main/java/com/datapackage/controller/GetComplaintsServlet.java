package com.datapackage.controller;

import com.datapackage.dao.ComplaintDao;
import com.datapackage.model.Complaint;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/GetComplaintsServlet")
public class GetComplaintsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the response content to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        ComplaintDao dao = new ComplaintDao();
        try {
            List<Complaint> complaints = dao.getComplaints();
            String json = gson.toJson(complaints);
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
