package com.rawwire.registration;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.bankingsystem.dao.AdminDAO;
import com.example.bankingsystem.model.Transaction;
import com.example.bankingsystem.model.User;

/**
 * Servlet implementation class AdminViewServlet
 */
@WebServlet("/adminview")
public class AdminViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO();  // Create an instance of AdminDAO

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accno = request.getParameter("viewno");

        try {
            User user = adminDAO.getUserDetails(accno);
            if (user != null) {
                request.setAttribute("user", user);

                List<Transaction> transactions = adminDAO.getUserTransactions(accno);
                request.setAttribute("transactions", transactions);

                request.getRequestDispatcher("viewadmin.jsp").forward(request, response);
            } else {
                request.setAttribute("status", "not_found");
                request.getRequestDispatcher("/Errorjsp/adminusernotfound").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }
}
