package com.datapackage.dao;

import com.datapackage.model.User;
import java.sql.*;

public class UserDao {
    private static final String LOGIN_QUERY = 
        "SELECT id, name, usertype FROM users WHERE LOWER(name) = LOWER(?) AND password = ? AND LOWER(usertype) = LOWER(?)";
    
    // Define the INSERT_QUERY variable
    private static final String INSERT_QUERY = 
        "INSERT INTO users(nic, name, address, contact, password, usertype) VALUES (?, ?, ?, ?, ?, ?)";
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mobitel#123";

    public User validateUser(String username, String password, String usertype) {
        User user = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = con.prepareStatement(LOGIN_QUERY)) {
                 
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, usertype);
                
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String role = rs.getString("usertype");
                    // Using the overloaded constructor for login
                    user = new User(id, name, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public int registerUser(User user) {
        int result = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = con.prepareStatement(INSERT_QUERY)) {
                 
                ps.setString(1, user.getNic());
                ps.setString(2, user.getName());
                ps.setString(3, user.getAddress());
                ps.setString(4, user.getContact());
                ps.setString(5, user.getPassword());
                ps.setString(6, user.getUsertype());
                
                result = ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
