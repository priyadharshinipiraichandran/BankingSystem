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

@WebServlet("/updatepassuser")
public class UserUpdatePassServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPassword = request.getParameter("userpass");
        String newPassword = request.getParameter("newpass");
        String reNewPassword = request.getParameter("renewpass");
        HttpSession session = request.getSession();
        String phoneNumber = (String) session.getAttribute("phno");
        RequestDispatcher dispatcher = null;

        // Redirect to login if phoneNumber is not in session
        if (phoneNumber == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Password validation regex
        String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";

        if (!newPassword.equals(reNewPassword)) {
            request.setAttribute("status", "passwords_do_not_match");
            dispatcher = request.getRequestDispatcher("/Errorjsp/passwordsDoNotMatch.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (!newPassword.matches(passwordPattern)) {
            request.setAttribute("status", "password_invalid_format");
            dispatcher = request.getRequestDispatcher("/Errorjsp/passwordInvalidFormat.jsp");
            dispatcher.forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAO();

        try {
            User user = userDAO.getUserByPhone(phoneNumber);

            if (user == null) {
                request.setAttribute("status", "user_not_found");
                dispatcher = request.getRequestDispatcher("/Errorjsp/usernotfound.jsp");
            } else {
                if (!BCrypt.checkpw(currentPassword, user.getPassword())) {
                    request.setAttribute("status", "invalid_current_password");
                    dispatcher = request.getRequestDispatcher("/Errorjsp/invalidcredentials.jsp");
                } else {
                    // Hash the new password
                    String hashedNewPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                    boolean isUpdated = userDAO.updateUserPassword(phoneNumber, hashedNewPassword);

                    if (isUpdated) {
                        request.setAttribute("status", "password_changed");
                        dispatcher = request.getRequestDispatcher("/Successjsp/updatepasssuccess.jsp");
                    } else {
                        request.setAttribute("status", "password_change_failed");
                        dispatcher = request.getRequestDispatcher("/Errorjsp/tryagain.jsp");
                    }
                }
            }

            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }
}
