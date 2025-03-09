package com.datapackage.dao;

import com.datapackage.model.Vehicleprice;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehiclepriceDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/megacitycab"; 
    private String jdbcUsername = "root"; 
    private String jdbcPassword = "root";  
    
    private static final String SELECT_ALL_VEHICLES = 
            "SELECT id, vehicle_no, price, vehicle_name FROM vehicles";
    private static final String SELECT_VEHICLE_BY_ID =
            "SELECT id, vehicle_no, price, vehicle_name FROM vehicles WHERE id = ?";
    // New query to select a vehicle by its name.
    private static final String SELECT_VEHICLE_BY_NAME =
            "SELECT id, vehicle_no, price, vehicle_name FROM vehicles WHERE vehicle_name = ?";

    public VehiclepriceDAO() { }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Vehicleprice> getAllVehicles() {
        List<Vehicleprice> vehicles = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_VEHICLES)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String vehicleNo = rs.getString("vehicle_no");
                double price = rs.getDouble("price");
                String vehicleName = rs.getString("vehicle_name");
                vehicles.add(new Vehicleprice(id, vehicleNo, price, vehicleName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicles;
    }
        
    // Method to fetch a vehicle by its ID.
    public Vehicleprice getVehicleById(int id) {
        Vehicleprice vehicle = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_VEHICLE_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String vehicleNo = rs.getString("vehicle_no");
                double price = rs.getDouble("price");
                String vehicleName = rs.getString("vehicle_name");
                vehicle = new Vehicleprice(id, vehicleNo, price, vehicleName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicle;
    }
    
    // New method to fetch a vehicle by its name.
    public Vehicleprice getVehicleByName(String name) {
        Vehicleprice vehicle = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_VEHICLE_BY_NAME)) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String vehicleNo = rs.getString("vehicle_no");
                double price = rs.getDouble("price");
                String vehicleName = rs.getString("vehicle_name");
                vehicle = new Vehicleprice(id, vehicleNo, price, vehicleName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicle;
    }
}
