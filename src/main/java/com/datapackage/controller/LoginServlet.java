package com.datapackage.controller;

import com.datapackage.dao.UserDao;
import com.datapackage.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String usertype = request.getParameter("usertype") != null ? request.getParameter("usertype").trim() : "";
        
        if (username.isEmpty() || password.isEmpty() || usertype.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/interfaces/Login.jsp?error=emptyfields");
            return;
        }
        
        User user = userDao.validateUser(username, password, usertype);
        if (user != null) {
            // Set session attributes
            HttpSession session = request.getSession();
            session.setAttribute("userID", user.getId());
            session.setAttribute("name", user.getName());
            session.setAttribute("usertype", user.getUsertype());
            
            // Create cookies for user info
            Cookie userIDCookie = new Cookie("userID", String.valueOf(user.getId()));
            Cookie nameCookie = new Cookie("name", user.getName());
            Cookie userTypeCookie = new Cookie("usertype", user.getUsertype());
            
            // Set cookie expiration to 30 minutes
            userIDCookie.setMaxAge(30 * 60);
            nameCookie.setMaxAge(30 * 60);
            userTypeCookie.setMaxAge(30 * 60);
            
            response.addCookie(userIDCookie);
            response.addCookie(nameCookie);
            response.addCookie(userTypeCookie);
            
            // Redirect based on user type
            redirectToDashboard(request, response, user.getUsertype());
        } else {
        	request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }
    
    private void redirectToDashboard(HttpServletRequest request, HttpServletResponse response, String usertype) throws IOException {
        String contextPath = request.getContextPath();
        switch (usertype.toLowerCase()) {
            case "admin":
                response.sendRedirect(contextPath + "/admin_home.jsp");
                break;
            case "employee":
                response.sendRedirect(contextPath + "/employee_home.jsp");
                break;
            default:
                response.sendRedirect(contextPath + "/customer_home.jsp");
                break;
        }
    }
}
