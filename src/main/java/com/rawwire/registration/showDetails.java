package com.rawwire.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.example.bankingsystem.dao.UserDAO;
import com.example.bankingsystem.model.User;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/showdetail")
public class showDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("thpass");

        HttpSession session = request.getSession();
        String phoneNumber = (String) session.getAttribute("phno");

        if (phoneNumber == null) {
            request.setAttribute("status", "session_expired");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByPhone(phoneNumber);

        if (user == null) {
            request.setAttribute("status", "account_not_found");
            request.getRequestDispatcher("/Errorjsp/invalidcredentials.jsp").forward(request, response);
            return;
        }

        // Validate the user-provided password with the stored hashed password using BCrypt
        if (BCrypt.checkpw(password, user.getPassword())) {
            request.setAttribute("accountno", user.getAccountNo());
            request.setAttribute("fullname", user.getFullName());
            request.setAttribute("phno", user.getPhoneno());
            request.setAttribute("email", user.getEmail());
            request.setAttribute("dob", user.getDob());
            request.setAttribute("address", user.getAddress());
            request.setAttribute("proof", user.getProof());
            request.setAttribute("current_balance", user.getCurrentBalance());
            request.setAttribute("acc_type", user.getAccountType());
            request.getRequestDispatcher("showdetails.jsp").forward(request, response);
        } else {
            request.setAttribute("status", "invalid_credentials");
            request.getRequestDispatcher("/Errorjsp/invalidcredentials.jsp").forward(request, response);
        }
    }
}
