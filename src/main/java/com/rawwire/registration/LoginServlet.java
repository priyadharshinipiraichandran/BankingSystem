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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phoneno = request.getParameter("phno");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByPhone(phoneno);

        if (user != null) {
            System.out.println("User found: " + user.getPhoneno());
            System.out.println("Stored Password Hash: " + user.getPassword());
            System.out.println("Password Input: " + password);

            // Validate the user-provided password with the stored hashed password using BCrypt
            if (BCrypt.checkpw(password, user.getPassword())) {
                System.out.println("Password match");
                session.setAttribute("phno", phoneno);
                dispatcher = request.getRequestDispatcher("index.jsp");
            } else {
                System.out.println("Invalid credentials");
                request.setAttribute("status", "invalid_credentials");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
        } else {
            System.out.println("Account not found for phone number: " + phoneno);
            request.setAttribute("status", "account_not_found");
            dispatcher = request.getRequestDispatcher("login.jsp");
        }
        dispatcher.forward(request, response);
    }
}
