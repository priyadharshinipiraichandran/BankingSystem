package com.example.bankingsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.bankingsystem.model.Transaction;
import com.example.bankingsystem.util.DBUtil;

public class TransactionDAO {

    // Method to add a transaction
    public boolean addTransaction(Transaction transaction) {
        boolean isAdded = false;
        String query = "INSERT INTO user_transaction (sender_acc, reciever_acc, amount_transferred, date_, time_) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {

            pst.setString(1, transaction.getSenderAccNo());
            pst.setString(2, transaction.getReceiverAccNo());
            pst.setDouble(3, transaction.getAmountTransferred());
            pst.setDate(4, transaction.getDate());
            pst.setTime(5, transaction.getTime());

            int rowCount = pst.executeUpdate();
            isAdded = rowCount > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isAdded;
    }
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