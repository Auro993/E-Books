package com.servlet;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            System.out.println("Login attempt - Email: " + email);
            
            UserDAO dao = new UserDAO(DBConnect.getConn());
            UserDetails userDetails = dao.loginUser(email, password);
            
            HttpSession session = request.getSession();
            
            if (userDetails != null) {
                session.setAttribute("userobj", userDetails);
                System.out.println("Login successful - Setting user in session: " + userDetails.getEmail());
                response.sendRedirect("home.jsp");
            } else {
                session.setAttribute("login-failed", "Invalid Email or Password");
                System.out.println("Login failed for: " + email);
                response.sendRedirect("login.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in LoginServlet: " + e.getMessage());
            HttpSession session = request.getSession();
            session.setAttribute("login-failed", "Server error. Please try again.");
            response.sendRedirect("login.jsp");
        } finally {
            out.close();
        }
    }
}