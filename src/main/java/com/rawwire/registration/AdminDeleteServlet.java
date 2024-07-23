package com.rawwire.registration;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.bankingsystem.dao.AdminDAO;

@WebServlet("/admindelete")
public class AdminDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accno");
        RequestDispatcher dispatcher = null;

        AdminDAO adminDAO = new AdminDAO();
        boolean isDeleted = adminDAO.deleteUser(accountNo);

        if (isDeleted) {
            // User successfully deleted
            request.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("/Successjsp/admindeletesuccess.jsp");
        } else {
            // User not found
            request.setAttribute("status", "not_found");
            dispatcher = request.getRequestDispatcher("/Errorjsp/adminusernotfound.jsp");
        }

        dispatcher.forward(request, response);
    }
}
