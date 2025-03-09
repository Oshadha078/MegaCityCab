package com.datapackage.controller;

import com.datapackage.dao.ComplaintDao;
import com.datapackage.model.Complaint;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/GetUserComplaintsServlet")
public class GetUserComplaintsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ComplaintDao complaintDao = new ComplaintDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String userID = request.getParameter("userID");
        JSONArray jsonArray = new JSONArray();

        try {
            List<Complaint> complaints = complaintDao.getComplaintsByUserId(userID);
            for (Complaint c : complaints) {
                JSONObject json = new JSONObject();
                json.put("complaint_id", c.getComplaintId());
                json.put("subject", c.getSubject());
                json.put("admin_reply", c.getAdminReply());
                json.put("status", c.getStatus());
                json.put("date_filed", c.getDateFiled().toString());
                jsonArray.put(json);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
            return;
        }
        
        try (PrintWriter out = response.getWriter()) {
            out.print(jsonArray.toString());
        }
    }
}
