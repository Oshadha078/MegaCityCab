package com.datapackage.dao;

import com.datapackage.model.Vehicle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehicleDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found!", e);
        }
    }

    public int createVehicle(Vehicle vehicle) throws SQLException {
        String sql = "INSERT INTO vehicles (vehicle_no, price, vehicle_name) VALUES (?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, vehicle.getVehicleNo());
            ps.setDouble(2, vehicle.getPrice());
            ps.setString(3, vehicle.getVehicleName());
            return ps.executeUpdate();
        }
    }

    public int updateVehicle(Vehicle vehicle) throws SQLException {
        String sql = "UPDATE vehicles SET price=?, vehicle_name=? WHERE vehicle_no=?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, vehicle.getPrice());
            ps.setString(2, vehicle.getVehicleName());
            ps.setString(3, vehicle.getVehicleNo());
            return ps.executeUpdate();
        }
    }

    public int deleteVehicle(int id) throws SQLException {
        String sql = "DELETE FROM vehicles WHERE id=?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate();
        }
    }

    public List<Vehicle> getVehicles() throws SQLException {
        List<Vehicle> vehicles = new ArrayList<>();
        String sql = "SELECT id, vehicle_no, price, vehicle_name FROM vehicles";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Vehicle vehicle = new Vehicle(
                    rs.getInt("id"),
                    rs.getString("vehicle_no"),
                    rs.getString("vehicle_name"),
                    rs.getDouble("price")
                );
                vehicles.add(vehicle);
            }
        }
        return vehicles;
    }
}
