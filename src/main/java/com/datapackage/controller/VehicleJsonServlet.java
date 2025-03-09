package com.datapackage.controller;

import com.datapackage.dao.VehicleDao;
import com.datapackage.model.Vehicle;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/VehicleJsonServlet")
public class VehicleJsonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the response type to JSON.
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        VehicleDao vehicleDao = new VehicleDao();
        try {
            List<Vehicle> vehicles = vehicleDao.getVehicles();
            String json = gson.toJson(vehicles);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Database error: " + e.getMessage() + "\"}");
        }
    }
}
