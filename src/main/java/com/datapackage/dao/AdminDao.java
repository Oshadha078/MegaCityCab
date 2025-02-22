package com.datapackage.dao;

import com.datapackage.model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {
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
    
    public int createCustomer(Customer customer) throws SQLException {
        String sql = "INSERT INTO users (nic, name, address, contact, password, usertype) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customer.getNic());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getAddress());
            ps.setString(4, customer.getContact());
            ps.setString(5, customer.getPassword());
            ps.setString(6, customer.getUsertype());
            return ps.executeUpdate();
        }
    }
    
    public int updateCustomer(Customer customer) throws SQLException {
        String sql = "UPDATE users SET name=?, address=?, contact=?, usertype=? WHERE nic=?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setString(3, customer.getContact());
            ps.setString(4, customer.getUsertype());
            ps.setString(5, customer.getNic());
            return ps.executeUpdate();
        }
    }
    
    public int deleteCustomer(String nic) throws SQLException {
        String sql = "DELETE FROM users WHERE nic=?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nic);
            return ps.executeUpdate();
        }
    }
    
    public Customer getCustomer(String nic) throws SQLException {
        String sql = "SELECT nic, name, address, contact, usertype FROM users WHERE nic=?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nic);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(
                        rs.getString("nic"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("contact"),
                        rs.getString("usertype")
                    );
                }
            }
        }
        return null;
    }
    
    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT nic, name, address, contact, usertype FROM users";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                customers.add(new Customer(
                    rs.getString("nic"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("contact"),
                    rs.getString("usertype")
                ));
            }
        }
        return customers;
    }
}
