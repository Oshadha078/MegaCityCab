package com.datapackage.controller;

import com.datapackage.dao.VehicleDao;
import com.datapackage.model.Vehicle;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ManageVehicleServlet")
@MultipartConfig
public class ManageVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();
    private final VehicleDao vehicleDao = new VehicleDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        try {
            int rowsAffected = 0;
            if ("createVehicle".equals(action)) {
                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleNo(request.getParameter("vehicle_no"));
                vehicle.setVehicleName(request.getParameter("vehicle_name"));
                vehicle.setPrice(Double.parseDouble(request.getParameter("price")));
                rowsAffected = vehicleDao.createVehicle(vehicle);
            } else if ("updateVehicle".equals(action)) {
                Vehicle vehicle = new Vehicle();
                vehicle.setId(Integer.parseInt(request.getParameter("id")));
                vehicle.setVehicleNo(request.getParameter("vehicle_no"));
                vehicle.setVehicleName(request.getParameter("vehicle_name"));
                vehicle.setPrice(Double.parseDouble(request.getParameter("price")));
                rowsAffected = vehicleDao.updateVehicle(vehicle);
            } else if ("deleteVehicle".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                rowsAffected = vehicleDao.deleteVehicle(id);
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
        try {
            List<Vehicle> vehicles = vehicleDao.getVehicles();
            response.getWriter().write(gson.toJson(vehicles));
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\":\"Database error: " + e.getMessage() + "\"}");
        }
    }
}
