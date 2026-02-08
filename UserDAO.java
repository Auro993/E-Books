package com.dao;

import com.db.DBConnect;
import com.user.UserDetails;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }
    
    public boolean addUser(UserDetails user) {
        boolean success = false;
        try {
            String query = "INSERT INTO users(name, email, password, phone) VALUES(?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            
            // Hash password using BCrypt
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
            ps.setString(3, hashedPassword);
            ps.setString(4, user.getPhone());
            
            int rowsAffected = ps.executeUpdate();
            success = rowsAffected > 0;
            
            System.out.println("User registration attempted: " + (success ? "SUCCESS" : "FAILED"));
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in addUser: " + e.getMessage());
        }
        return success;
    }
    
    public UserDetails loginUser(String email, String password) {
        UserDetails user = null;
        try {
            String query = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new UserDetails();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                String storedHashedPassword = rs.getString("password");
                user.setPhone(rs.getString("phone"));
                
                // Verify password using BCrypt
                if (BCrypt.checkpw(password, storedHashedPassword)) {
                    System.out.println("Login successful for user: " + email);
                } else {
                    System.out.println("Password mismatch for user: " + email);
                    user = null; // Password doesn't match
                }
            } else {
                System.out.println("User not found: " + email);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in loginUser: " + e.getMessage());
        }
        return user;
    }
    
    public boolean checkEmailExists(String email) {
        boolean exists = false;
        try {
            String query = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
            
            System.out.println("Email exists check for " + email + ": " + exists);
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in checkEmailExists: " + e.getMessage());
        }
        return exists;
    }
    
    public UserDetails getUserById(int userId) {
        UserDetails user = null;
        try {
            String query = "SELECT * FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new UserDetails();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in getUserById: " + e.getMessage());
        }
        return user;
    }
}
