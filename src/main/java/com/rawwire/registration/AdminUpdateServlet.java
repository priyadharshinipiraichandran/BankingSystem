package com.rawwire.registration;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.bankingsystem.dao.AdminDAO;

@WebServlet("/adminupdate")
public class AdminUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accno = request.getParameter("accno");
        String newName = request.getParameter("newname");
        String newPhoneNo = request.getParameter("newphno");
        String newEmail = request.getParameter("newemail");
        String newDob = request.getParameter("newdob");
        String newAddress = request.getParameter("newaddress");
        String newPassword = request.getParameter("newpass");

        AdminDAO adminDAO = new AdminDAO();
        boolean isUpdated = adminDAO.updateUser(accno, newName, newPhoneNo, newEmail, newDob, newAddress, newPassword);

        String status = isUpdated ? "update_success" : "update_failed";
        request.setAttribute("status", status);
        RequestDispatcher dispatcher = request.getRequestDispatcher(isUpdated ? "/Successjsp/adminupdatesuccess.jsp" : "/Errorjsp/adminupdatefailed.jsp");
        dispatcher.forward(request, response);
    }
}
