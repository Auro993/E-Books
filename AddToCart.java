package com.servlet;

import com.dao.CartDAO;
import com.db.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");
            
            if(userId == null) {
                session.setAttribute("errorMsg", "Please login first!");
                response.sendRedirect("login.jsp");
                return;
            }
            
            CartDAO cartDAO = new CartDAO(DBConnect.getConn());
            boolean success = cartDAO.addToCart(bookId, userId);
            
            if(success) {
                session.setAttribute("successMsg", "Book added to cart successfully!");
            } else {
                session.setAttribute("errorMsg", "Failed to add book to cart!");
            }
            response.sendRedirect("home.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMsg", "Something went wrong: " + e.getMessage());
            response.sendRedirect("home.jsp");
        }
    }
}
