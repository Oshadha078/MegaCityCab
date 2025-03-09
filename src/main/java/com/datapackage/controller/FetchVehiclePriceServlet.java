package com.datapackage.controller;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.datapackage.dao.VehiclepriceDAO;
import com.datapackage.model.Vehicleprice;
import java.io.IOException;
import java.io.PrintWriter;

@jakarta.servlet.annotation.WebServlet("/FetchVehiclePriceServlet")
public class FetchVehiclePriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehiclepriceDAO vehicleDAO;
    
    @Override
    public void init() {
        vehicleDAO = new VehiclepriceDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Use the "name" parameter to look up the vehicle by name.
        String vehicleName = request.getParameter("name");
        double price = 0;
        
        if (vehicleName != null && !vehicleName.trim().isEmpty()) {
            vehicleName = vehicleName.trim();
            // Make sure your DAO has a method to fetch by name
            Vehicleprice vehicle = vehicleDAO.getVehicleByName(vehicleName);
            if (vehicle != null) {
                price = vehicle.getPrice();
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid vehicle name");
            return;
        }
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(price));
        out.flush();
    }
}
