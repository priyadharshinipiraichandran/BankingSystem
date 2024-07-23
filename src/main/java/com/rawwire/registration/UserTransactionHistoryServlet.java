package com.rawwire.registration;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import com.example.bankingsystem.dao.TransactionDAO;
import com.example.bankingsystem.dao.UserDAO;
import com.example.bankingsystem.model.Transaction;
import com.example.bankingsystem.model.User;


@WebServlet("/transhist")
public class UserTransactionHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String phoneno = (String) session.getAttribute("phno");
        String password = request.getParameter("thpass");

        UserDAO userDAO = new UserDAO();
        TransactionDAO transactionDAO = new TransactionDAO();
        RequestDispatcher dispatcher = null;

        System.out.println("Session phone number: " + phoneno);
        System.out.println("Provided password: " + password);

        if (phoneno == null) {
            // Session does not have phone number, redirect to login
            System.out.println("Phone number not found in session. Redirecting to login.");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Retrieve user information
            User user = userDAO.getUserByPhone(phoneno);

            if (user == null) {
                // User not found
                System.out.println("User not found for phone number: " + phoneno);
                request.setAttribute("status", "user_not_found");
                dispatcher = request.getRequestDispatcher("/Error/usernotfound.jsp");
            } else if (BCrypt.checkpw(password, user.getPassword())) {
                // Retrieve account number and transactions
                String accountNo = userDAO.getAccountNoByPhone(phoneno);
                System.out.println("Account number: " + accountNo);

                if (accountNo != null) {
                    List<Transaction> transactions = transactionDAO.getUserTransactions(accountNo);
                    System.out.println("Transactions found: " + transactions.size());
                    request.setAttribute("transactions", transactions);
                    dispatcher = request.getRequestDispatcher("transactionhistory.jsp");
                } else {
                    System.out.println("Account number not found for phone number: " + phoneno);
                    request.setAttribute("status", "not_found");
                    dispatcher = request.getRequestDispatcher("/Errorjsp/invalidcredentials.jsp");
                }
            } else {
                // Password is incorrect
                System.out.println("Invalid credentials for phone number: " + phoneno);
                request.setAttribute("status", "invalid_credentials");
                dispatcher = request.getRequestDispatcher("/Errorjsp/invalidcredentials.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQLException occurred: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
            return;
        }

        dispatcher.forward(request, response);
    }
}
