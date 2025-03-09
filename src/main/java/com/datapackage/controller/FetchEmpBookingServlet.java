package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.datapackage.model.Booking;

@WebServlet("/FetchEmpBooking")
public class FetchEmpBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT id, customer_id, vehicle, pickup_location, dropoff_location FROM carbooking";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("id")); // Correct setter for bookingId
                booking.setCustomerId(rs.getInt("customer_id")); // Matches getCustomerId/setCustomerId
                booking.setVehicle(rs.getString("vehicle"));
                booking.setPickupLocation(rs.getString("pickup_location")); // Correct setter for pickupLocation
                booking.setDropoffLocation(rs.getString("dropoff_location")); // Correct setter for dropoffLocation
                bookings.add(booking);
            }
            rs.close();
            ps.close();
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        String json = new Gson().toJson(bookings);
        out.print(json);
        out.flush();
    }
}
