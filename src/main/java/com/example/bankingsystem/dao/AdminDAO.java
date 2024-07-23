package com.example.bankingsystem.dao;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.example.bankingsystem.util.DBUtil;
import java.util.ArrayList;
import java.util.List;
import com.example.bankingsystem.model.Transaction;
import com.example.bankingsystem.model.User;

public class AdminDAO {

	public boolean validateAdmin(String username, String password) {
        boolean isValid = false;

        String query = "SELECT * FROM admin WHERE admin_id = ? AND admin_pass = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            pst.setString(1, username);
            pst.setString(2, password);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    isValid = true;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isValid;
    }
    public boolean updateUser(String accountNo, String fullName, String phoneNo, String email, String dob, String address, String password) {
        StringBuilder query = new StringBuilder("UPDATE users SET ");
        boolean firstField = true;

        if (fullName != null && !fullName.isEmpty()) {
            query.append("fullname = ?");
            firstField = false;
        }
        if (phoneNo != null && !phoneNo.isEmpty()) {
            if (!firstField) query.append(", ");
            query.append("phno = ?");
            firstField = false;
        }
        if (email != null && !email.isEmpty()) {
            if (!firstField) query.append(", ");
            query.append("email = ?");
            firstField = false;
        }
        if (dob != null && !dob.isEmpty()) {
            if (!firstField) query.append(", ");
            query.append("dob = ?");
            firstField = false;
        }
        if (address != null && !address.isEmpty()) {
            if (!firstField) query.append(", ");
            query.append("address = ?");
            firstField = false;
        }
        if (password != null && !password.isEmpty()) {
            if (!firstField) query.append(", ");
            query.append("password = ?");
        }

        query.append(" WHERE accountno = ?");

        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(query.toString())) {

            int paramIndex = 1;
            if (fullName != null && !fullName.isEmpty()) {
                pst.setString(paramIndex++, fullName);
            }
            if (phoneNo != null && !phoneNo.isEmpty()) {
                pst.setString(paramIndex++, phoneNo);
            }
            if (email != null && !email.isEmpty()) {
                pst.setString(paramIndex++, email);
            }
            if (dob != null && !dob.isEmpty()) {
                pst.setString(paramIndex++, dob);
            }
            if (address != null && !address.isEmpty()) {
                pst.setString(paramIndex++, address);
            }
            if (password != null && !password.isEmpty()) {
                pst.setString(paramIndex++, password);
            }
            pst.setString(paramIndex, accountNo);

            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    public boolean deleteUser(String accountNo) {
        String sql = "DELETE FROM users WHERE accountno = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, accountNo);
            int rowCount = pst.executeUpdate();
            return rowCount > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public User getUserDetails(String accountNo) throws SQLException {
        String sql = "SELECT * FROM users WHERE accountno = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, accountNo);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setAccountNo(rs.getString("accountno"));
                user.setFullName(rs.getString("fullname"));
                user.setPhoneno(rs.getString("phno"));
                user.setEmail(rs.getString("email"));
                user.setDob(rs.getString("dob"));
                user.setAddress(rs.getString("address"));
                user.setCurrentBalance(rs.getFloat("current_balance"));
                user.setAccountType(rs.getString("acc_type"));
                user.setProof(rs.getString("proof"));
                return user;
            }
        }
        return null;
    }

    // Fetch transactions for a given account number
    public List<Transaction> getUserTransactions(String accountNo) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM user_transaction WHERE sender_acc = ? OR reciever_acc = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setString(1, accountNo);
            pst.setString(2, accountNo);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setSenderAccNo(rs.getString("sender_acc"));
                transaction.setReceiverAccNo(rs.getString("reciever_acc"));
                transaction.setAmountTransferred(rs.getDouble("amount_transferred"));
                transaction.setDate(rs.getDate("date_"));
                transaction.setTime(rs.getTime("time_"));
                transactions.add(transaction);
            }
        }
        return transactions;
    }
}
