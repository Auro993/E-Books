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
public class AddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            int userId = Integer.parseInt(request.getParameter("userId"));
            
            CartDAO cartDAO = new CartDAO(DBConnect.getConn());
            boolean success = cartDAO.addToCart(bookId, userId);
            
            HttpSession session = request.getSession();
            if(success) {
                session.setAttribute("successMsg", "Book added to cart successfully!");
            } else {
                session.setAttribute("errorMsg", "Something went wrong!");
            }
            response.sendRedirect("index.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
