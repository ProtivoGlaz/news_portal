package com.example.web.impl;

import com.example.beans.User;
import com.example.service.ServiceException;
import com.example.service.ServiceProvider;
import com.example.service.UserSecurity;
import com.example.web.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class DoAuth implements Command {

    private final UserSecurity security = ServiceProvider.getInstance().getUserSecurity();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String login = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user;
            if ((user = security.signIn(login, password)) == null) {
                response.sendRedirect("Controller?command=page_auth&authError=true");
                return;
            }

            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);

            response.sendRedirect("Controller?command=page_user_home");
        } catch (ServiceException e) {
            response.sendRedirect("error.jsp");
        }
    }

}
