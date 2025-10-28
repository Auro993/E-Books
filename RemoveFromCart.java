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

@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");
            
            if(userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            CartDAO cartDAO = new CartDAO(DBConnect.getConn());
            boolean success = cartDAO.removeFromCart(bookId, userId);
            
            if(success) {
                session.setAttribute("successMsg", "Book removed from cart successfully!");
            } else {
                session.setAttribute("errorMsg", "Failed to remove book from cart!");
            }
            response.sendRedirect("cart.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMsg", "Something went wrong!");
            response.sendRedirect("cart.jsp");
        }
    }
}