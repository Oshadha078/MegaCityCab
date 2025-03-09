package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.datapackage.dao.VehiclepriceDAO;
import com.datapackage.model.Vehicleprice;
import com.google.gson.Gson;


@WebServlet("/LoadVehiclesServlet")
public class LoadVehiclesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private VehiclepriceDAO vehicleDAO;
    
    @Override
    public void init() {
        vehicleDAO = new VehiclepriceDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Vehicleprice> vehicles = vehicleDAO.getAllVehicles();
        String json = new Gson().toJson(vehicles);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(json);
        out.flush();
    }
}
