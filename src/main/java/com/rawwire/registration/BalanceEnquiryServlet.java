package com.rawwire.registration;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.bankingsystem.dao.UserDAO;
import com.example.bankingsystem.model.User;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/balanceenq")
public class BalanceEnquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("pass");
        HttpSession session = request.getSession();
        String phoneNumber = (String) session.getAttribute("phno");
        RequestDispatcher dispatcher = null;

        if (phoneNumber == null) {
            throw new ServletException("Session expired or user not logged in");
        }

        UserDAO userDAO = new UserDAO();

        try {
            User user = userDAO.getUserByPhone(phoneNumber);

            if (user == null || !BCrypt.checkpw(password, user.getPassword())) {
                request.setAttribute("status", "invalid_credentials");
                dispatcher = request.getRequestDispatcher("/Errorjsp/invalidcredentials.jsp");
            } else {
                double balance = user.getCurrentBalance();
                request.setAttribute("balance", balance);
                dispatcher = request.getRequestDispatcher("balance.jsp");
            }

            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }
}
