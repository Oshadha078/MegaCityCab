package com.datapackage.dao;

import com.datapackage.model.Bill;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found!", e);
        }
    }

    public List<Bill> getBills() throws SQLException {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT id, employee_name, employee_id, booking_id, customer_id, vehicle, kilometers, per_km_rate, amount, bill_date FROM bill";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setId(rs.getInt("id"));
                bill.setEmployeeName(rs.getString("employee_name"));
                bill.setEmployeeId(rs.getInt("employee_id"));
                bill.setBookingId(rs.getInt("booking_id"));
                bill.setCustomerId(rs.getInt("customer_id"));
                bill.setVehicle(rs.getString("vehicle"));
                bill.setKilometers(rs.getDouble("kilometers"));
                bill.setPerKmRate(rs.getDouble("per_km_rate"));
                bill.setAmount(rs.getDouble("amount"));
                bill.setBillDate(rs.getDate("bill_date"));
                bills.add(bill);
            }
        }
        return bills;
    }

    public int deleteBill(int id) throws SQLException {
        String sql = "DELETE FROM bill WHERE id = ?";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate();
        }
    }
    
    // New update method for bills.
    public int updateBill(Bill bill) throws SQLException {
        String sql = "UPDATE bill SET employee_name = ?, employee_id = ?, booking_id = ?, customer_id = ?, vehicle = ?, kilometers = ?, per_km_rate = ?, amount = ?, bill_date = ? WHERE id = ?";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, bill.getEmployeeName());
            ps.setInt(2, bill.getEmployeeId());
            ps.setInt(3, bill.getBookingId());
            ps.setInt(4, bill.getCustomerId());
            ps.setString(5, bill.getVehicle());
            ps.setDouble(6, bill.getKilometers());
            ps.setDouble(7, bill.getPerKmRate());
            ps.setDouble(8, bill.getAmount());
            ps.setDate(9, bill.getBillDate());
            ps.setInt(10, bill.getId());
            return ps.executeUpdate();
        }
    }
}
