package com.rawwire.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import com.example.bankingsystem.dao.TransactionDAO;
import com.example.bankingsystem.model.Transaction;

@WebServlet("/withdraw")
public class UserTransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String senderPhNo = (String) session.getAttribute("phno");
        String recAccName = request.getParameter("recaccname");
        String recAccNo = request.getParameter("recaccno");
        String pass = request.getParameter("pass");
        String amountStr = request.getParameter("amount");

        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem?useSSL=false", "root", "rajpandi007");

            // Check sender's credentials and phone number
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE phno = ?");
            pst.setString(1, senderPhNo);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String storedHash = rs.getString("password");

                // Verify the password using BCrypt
                if (BCrypt.checkpw(pass, storedHash)) {
                    String senderAccNo = rs.getString("accountno");

                    // Check recipient's account number and name
                    pst = con.prepareStatement("SELECT * FROM users WHERE fullname = ? AND accountno = ?");
                    pst.setString(1, recAccName);
                    pst.setString(2, recAccNo);

                    ResultSet rs2 = pst.executeQuery();

                    if (rs2.next()) {
                        double amount = Double.parseDouble(amountStr);

                        // Check for negative amount
                        if (amount <= 0) {
                            request.setAttribute("status", "negative_amount");
                            dispatcher = request.getRequestDispatcher("/Errorjsp/negativeamount.jsp");
                        } else {
                            double senderBalance = rs.getDouble("current_balance");
                            double recipientBalance = rs2.getDouble("current_balance");

                            if (senderBalance >= amount) {
                                // Deduct amount from sender's balance and add to recipient's balance
                                senderBalance -= amount;
                                recipientBalance += amount;

                                // Update sender's balance
                                pst = con.prepareStatement("UPDATE users SET current_balance = ? WHERE accountno = ?");
                                pst.setDouble(1, senderBalance);
                                pst.setString(2, senderAccNo);
                                pst.executeUpdate();

                                // Update recipient's balance
                                pst = con.prepareStatement("UPDATE users SET current_balance = ? WHERE accountno = ?");
                                pst.setDouble(1, recipientBalance);
                                pst.setString(2, recAccNo);
                                pst.executeUpdate();

                                // Record the transaction
                                Transaction transaction = new Transaction();
                                transaction.setSenderAccNo(senderAccNo);
                                transaction.setReceiverAccNo(recAccNo);
                                transaction.setAmountTransferred(amount);
                                transaction.setDate(java.sql.Date.valueOf(java.time.LocalDate.now()));
                                transaction.setTime(java.sql.Time.valueOf(java.time.LocalTime.now()));

                                TransactionDAO transactionDAO = new TransactionDAO();
                                transactionDAO.addTransaction(transaction);

                                request.setAttribute("status", "success");
                                dispatcher = request.getRequestDispatcher("/Successjsp/transactionsuccess.jsp");
                            } else {
                                request.setAttribute("status", "insufficient_funds");
                                dispatcher = request.getRequestDispatcher("/Errorjsp/insuffientamount.jsp");
                            }
                        }
                    } else {
                        request.setAttribute("status", "invalid_recipient");
                        dispatcher = request.getRequestDispatcher("/Errorjsp/invalidreciever.jsp");
                    }
                } else {
                    request.setAttribute("status", "invalid_sender");
                    dispatcher = request.getRequestDispatcher("/Errorjsp/invalidsender.jsp");
                }
            } else {
                request.setAttribute("status", "invalid_sender");
                dispatcher = request.getRequestDispatcher("Errorjsp/invalidsender.jsp");
            }

            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }
}
