package com.datapackage.dao;

import com.datapackage.model.Bill;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";

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
}
