package com.example.bankingsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.example.bankingsystem.model.User;
import com.example.bankingsystem.util.DBUtil;
import java.sql.SQLException;

public class UserDAO {

    // Method to get a user by phone number
	public User getUserByPhone(String phoneno) {
        User user = null;
        try (Connection con = DBUtil.getConnection()) {
            String query = "SELECT * FROM users WHERE phno = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, phoneno);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setPhoneno(rs.getString("phno"));
                user.setPassword(rs.getString("password"));
                user.setAccountNo(rs.getString("accountno"));
                user.setFullName(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setDob(rs.getString("dob"));
                user.setAddress(rs.getString("address"));
                user.setProof(rs.getString("proof"));
                user.setCurrentBalance(rs.getFloat("current_balance"));
                user.setAccountType(rs.getString("acc_type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Method to update user password
	public boolean updateUserPassword(String phoneno, String hashedPassword) {
	    boolean isUpdated = false;
	    try (Connection con = DBUtil.getConnection()) {
	        String query = "UPDATE users SET password = ? WHERE phno = ?";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setString(1, hashedPassword);
	        pst.setString(2, phoneno);

	        int rowCount = pst.executeUpdate();
	        isUpdated = rowCount > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return isUpdated;
	}

    // Method to get account number by phone number
    public String getAccountNoByPhone(String phoneno) {
        String accountNo = null;
        try (Connection con = DBUtil.getConnection()) {
            String query = "SELECT accountno FROM users WHERE phno = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, phoneno);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                accountNo = rs.getString("accountno");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountNo;
    }
    
    // Method to get the balance for a user by phone number
    public double getBalance(String phoneno) {
        double balance = 0;
        try (Connection con = DBUtil.getConnection()) {
            String query = "SELECT current_balance FROM users WHERE phno = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, phoneno);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                balance = rs.getDouble("current_balance");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return balance;
    }
    
    public boolean isUserExists(String contact, String proof, String email) {
        boolean exists = false;
        try (Connection con = DBUtil.getConnection()) {
            String query = "SELECT * FROM users WHERE phno = ? OR proof = ? OR email = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, contact);
            pst.setString(2, proof);
            pst.setString(3, email);
            ResultSet rs = pst.executeQuery();

            exists = rs.next();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }
    public boolean registerUser(User user) {
        boolean isRegistered = false;
        try (Connection con = DBUtil.getConnection()) {
            String query = "INSERT INTO users(accountno, fullname, phno, email, dob, address, proof, password, current_balance, acc_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getAccountNo());
            pst.setString(2, user.getFullName());
            pst.setString(3, user.getPhoneno());
            pst.setString(4, user.getEmail());
            pst.setString(5, user.getDob());
            pst.setString(6, user.getAddress());
            pst.setString(7, user.getProof());
            pst.setString(8, user.getPassword());
            pst.setFloat(9, user.getCurrentBalance());
            pst.setString(10, user.getAccountType());

            int rowCount = pst.executeUpdate();
            isRegistered = rowCount > 0;
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegistered;
    }
}
