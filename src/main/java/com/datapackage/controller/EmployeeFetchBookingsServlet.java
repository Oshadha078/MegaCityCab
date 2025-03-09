package com.datapackage.controller;

import com.datapackage.dao.BookingDao;
import com.datapackage.model.Booking;
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

@WebServlet("/EmployeeFetchBookingsServlet")
public class EmployeeFetchBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final BookingDao bookingDao = new BookingDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JSONArray jsonArray = new JSONArray();

        try {
            // Retrieve all bookings (for employee view).
            List<Booking> bookings = bookingDao.getBookings();
            for (Booking b : bookings) {
                JSONObject bookingJson = new JSONObject();
                bookingJson.put("bookingId", b.getBookingId());
                bookingJson.put("bookingDate", b.getBookingDate().toString());
                bookingJson.put("customerId", b.getCustomerId());
                bookingJson.put("vehicle", b.getVehicle());
                bookingJson.put("pickupLocation", b.getPickupLocation());
                bookingJson.put("dropoffLocation", b.getDropoffLocation());
                jsonArray.put(bookingJson);
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
