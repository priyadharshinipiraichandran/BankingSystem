package com.rawwire.registration;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.example.bankingsystem.dao.AdminDAO;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("adminid");
        String password = request.getParameter("adminpass");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        AdminDAO adminDAO = new AdminDAO();
        boolean isValidAdmin = adminDAO.validateAdmin(username, password);

        if (isValidAdmin) {
            session.setAttribute("adminid", username);
            dispatcher = request.getRequestDispatcher("account.jsp");
        } else {
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("/Error/adminloginfailed.jsp");
        }
        dispatcher.forward(request, response);
    }
}
