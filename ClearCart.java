package com.servlet;

import com.dao.CartDAO;
import com.db.DBConnect;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ClearCart")
public class ClearCart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            CartDAO dao = new CartDAO(DBConnect.getConn());
            boolean success = dao.clearCart(userId);

            if (success) {
                session.setAttribute("successMsg", "Cart cleared successfully!");
                // Update cart count in session
                session.setAttribute("cartCount", 0);
            } else {
                session.setAttribute("errorMsg", "Failed to clear cart!");
            }
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Error: " + e.getMessage());
            response.sendRedirect("cart.jsp");
        }
    }
}