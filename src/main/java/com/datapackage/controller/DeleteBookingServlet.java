package com.datapackage.controller;

import com.datapackage.dao.BookingDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final BookingDao bookingDao = new BookingDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String bookingIdParam = request.getParameter("bookingId");
            System.out.println("Received Booking ID: " + bookingIdParam);

            if (bookingIdParam == null || bookingIdParam.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"success\": false, \"message\": \"Missing booking ID.\"}");
                return;
            }

            // Validate that the booking ID is numeric
            if (!bookingIdParam.matches("\\d+")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"success\": false, \"message\": \"Invalid booking ID format.\"}");
                return;
            }

            int bookingId = Integer.parseInt(bookingIdParam);
            boolean isDeleted = bookingDao.deleteBooking(bookingId);

            if (isDeleted) {
                out.print("{\"success\": true, \"message\": \"Booking deleted successfully.\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"success\": false, \"message\": \"Booking not found.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"success\": false, \"message\": \"Server error while deleting booking.\"}");
        } finally {
            out.flush();
            out.close();
        }
    }
}
