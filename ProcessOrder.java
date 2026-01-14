package com.servlet;

import com.dao.CartDAO;
import com.db.DBConnect;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ProcessOrder")
public class ProcessOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            Integer userId = (Integer) session.getAttribute("userId");
            
            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Get form data
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            
            // Clear the cart after successful order
            CartDAO cartDao = new CartDAO(DBConnect.getConn());
            cartDao.clearCart(userId);
            
            // Update cart count in session
            session.setAttribute("cartCount", 0);
            session.setAttribute("successMsg", "Order placed successfully! Your e-books will be delivered to your email.");
            
            // Redirect to success page
            response.sendRedirect("order-success.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Error processing order: " + e.getMessage());
            response.sendRedirect("checkout.jsp");
        }
    }
}
