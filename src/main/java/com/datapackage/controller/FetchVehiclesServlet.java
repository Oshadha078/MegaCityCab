package com.datapackage.controller;

import com.datapackage.dao.VehicleDao;
import com.datapackage.model.Vehicle;
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

@WebServlet("/FetchVehiclesServlet")
public class FetchVehiclesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final VehicleDao vehicleDao = new VehicleDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JSONArray jsonArray = new JSONArray();

        try {
            List<Vehicle> vehicles = vehicleDao.getVehicles();
            for (Vehicle v : vehicles) {
                JSONObject vehicleJson = new JSONObject();
                vehicleJson.put("id", v.getId());
                vehicleJson.put("vehicleNo", v.getVehicleNo());
                vehicleJson.put("vehicleName", v.getVehicleName());
                vehicleJson.put("price", v.getPrice());
                jsonArray.put(vehicleJson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
            return;
        }

        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());
        out.flush();
    }
}
