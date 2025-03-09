package com.datapackage.controller;

import com.datapackage.dao.ComplaintDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/AdminReplyServlet")
public class AdminReplyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // Retrieve parameters from the request
        String complaintIdStr = request.getParameter("complaint_id");
        String adminReply = request.getParameter("admin_reply");

        if (complaintIdStr == null || complaintIdStr.trim().isEmpty() || adminReply == null || adminReply.trim().isEmpty()) {
            out.println("<h3>Error: Missing required parameters.</h3>");
            return;
        }
        
        int complaintId;
        try {
            complaintId = Integer.parseInt(complaintIdStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h3>Error: Invalid complaint ID.</h3>");
            return;
        }
        
        ComplaintDao dao = new ComplaintDao();
        try {
            int rowsUpdated = dao.updateComplaintReply(complaintId, adminReply);
            if (rowsUpdated > 0) {
                out.println("<script>alert('Reply submitted successfully!'); window.location='admin_complaints.jsp';</script>");
            } else {
                out.println("<h3>Error: Complaint not found or already replied.</h3>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
