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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            
            System.out.println("Registration attempt - Name: " + name + ", Email: " + email);
            
            UserDetails user = new UserDetails(name, email, password, phone);
            
            UserDAO dao = new UserDAO(DBConnect.getConn());
            HttpSession session = request.getSession();
            
            // Check if email already exists
            if (dao.checkEmailExists(email)) {
                session.setAttribute("reg-failed", "Email already exists. Please use a different email.");
                System.out.println("Registration failed - Email already exists: " + email);
                response.sendRedirect("register.jsp");
                return;
            }
            
            boolean success = dao.addUser(user);
            
            if (success) {
                session.setAttribute("reg-success", "Registration Successful. Please login.");
                System.out.println("Registration successful for: " + email);
                response.sendRedirect("register.jsp");
            } else {
                session.setAttribute("reg-failed", "Something went wrong. Please try again.");
                System.out.println("Registration failed for: " + email);
                response.sendRedirect("register.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in UserServlet: " + e.getMessage());
            HttpSession session = request.getSession();
            session.setAttribute("reg-failed", "Server error. Please try again.");
            response.sendRedirect("register.jsp");
        } finally {
            out.close();
        }
    }
}