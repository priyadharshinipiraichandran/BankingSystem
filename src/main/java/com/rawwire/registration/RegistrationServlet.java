package com.rawwire.registration;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mindrot.jbcrypt.BCrypt;
import com.example.bankingsystem.model.User;
import com.example.bankingsystem.dao.UserDAO;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(RegistrationServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDateTime currentDateTime = LocalDateTime.now();

        int year = currentDateTime.getYear();
        int month = currentDateTime.getMonthValue();
        int dayOfMonth = currentDateTime.getDayOfMonth();
        int hour = currentDateTime.getHour();
        int minute = currentDateTime.getMinute();
        int second = currentDateTime.getSecond();

        String reversedYear = new StringBuilder(String.valueOf(year)).reverse().toString();
        String reversedMonth = new StringBuilder(String.valueOf(month)).reverse().toString();
        String reversedDayOfMonth = new StringBuilder(String.valueOf(dayOfMonth)).reverse().toString();
        String reversedHour = new StringBuilder(String.valueOf(hour)).reverse().toString();
        String reversedMinute = new StringBuilder(String.valueOf(minute)).reverse().toString();
        String reversedSecond = new StringBuilder(String.valueOf(second)).reverse().toString();

        String combinedPasswordString = reversedYear + reversedMonth + reversedDayOfMonth + reversedHour + reversedMinute + reversedSecond;

        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String acctype = request.getParameter("acctype");
        String password = request.getParameter("pass");
        String proof = request.getParameter("proof");
        float current_balance = 1000.00f;

        RequestDispatcher dispatcher = null;
        UserDAO userDAO = new UserDAO();

        try {
            // Check if the phone number, proof, or email already exists
            if (userDAO.isUserExists(contact, proof, email)) {
                request.setAttribute("status", "exists");
            } else {
                // Hash the password
                String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

                User user = new User();
                user.setAccountNo(combinedPasswordString);
                user.setFullName(name);
                user.setPhoneno(contact);
                user.setEmail(email);
                user.setDob(dob);
                user.setAddress(address);
                user.setProof(proof);
                user.setPassword(hashedPassword);
                user.setCurrentBalance(current_balance);
                user.setAccountType(acctype);

                boolean isRegistered = userDAO.registerUser(user);

                if (isRegistered) {
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("status", "failed");
                }
            }

            dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Registration error", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }
}
