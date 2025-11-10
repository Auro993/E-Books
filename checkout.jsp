<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.user.UserDetails, com.dao.CartDAO, com.dao.BookDAO, com.db.DBConnect, com.user.Book, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - E-Books</title>
    <%@include file="all_component/allcss.jsp"%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <%
        UserDetails user = (UserDetails) session.getAttribute("userobj");
        if (user == null) {
            session.setAttribute("Login-error", "Please login first...");
            response.sendRedirect("login.jsp");
            return;
        }
        
        Integer userId = (Integer) session.getAttribute("userId");
        CartDAO cartDao = new CartDAO(DBConnect.getConn());
        BookDAO bookDao = new BookDAO(DBConnect.getConn());
        
        List<Integer> cartBookIds = cartDao.getCartBooksByUserId(userId);
        List<Book> cartBooks = new ArrayList<>();
        double total = 0.0;
        
        for (int id : cartBookIds) {
            Book b = bookDao.getBookById(id);
            if (b != null) {
                cartBooks.add(b);
                total += b.getPrice();
            }
        }
        
        if (cartBooks.isEmpty()) {
            session.setAttribute("errorMsg", "Your cart is empty!");
            response.sendRedirect("cart.jsp");
            return;
        }
    %>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0"><i class="fas fa-credit-card me-2"></i>Checkout</h4>
                    </div>
                    <div class="card-body">
                        <!-- Order Summary -->
                        <div class="mb-4">
                            <h5><i class="fas fa-receipt me-2"></i>Order Summary</h5>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Book</th>
                                            <th>Title</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (Book book : cartBooks) { %>
                                        <tr>
                                            <td>
                                                <div class="book-placeholder d-flex align-items-center justify-content-center" 
                                                     style="width: 60px; height: 80px; background: linear-gradient(45deg, #007bff, #6610f2); color: white; border-radius: 5px;">
                                                    <i class="fas fa-book"></i>
                                                </div>
                                            </td>
                                            <td>
                                                <strong><%= book.getTitle() %></strong><br>
                                                <small class="text-muted"><%= book.getAuthor() %></small>
                                            </td>
                                            <td class="text-success fw-bold">$<%= book.getPrice() %></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                    <tfoot class="table-light">
                                        <tr>
                                            <td colspan="2" class="text-end"><strong>Total Amount:</strong></td>
                                            <td><strong class="text-success fs-5">$<%= String.format("%.2f", total) %></strong></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        
                        <!-- Payment Form -->
                        <div class="mb-4">
                            <h5><i class="fas fa-user me-2"></i>Customer Information</h5>
                            <form action="ProcessOrder" method="post">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Full Name</label>
                                        <input type="text" class="form-control" name="fullName" 
                                               value="<%= user.getName() %>" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" 
                                               value="<%= user.getEmail() %>" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone Number</label>
                                    <input type="tel" class="form-control" name="phone" 
                                           value="<%= user.getPhone() != null ? user.getPhone() : "" %>" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Shipping Address</label>
                                    <textarea class="form-control" name="address" rows="3" 
                                              placeholder="Enter your complete address" required></textarea>
                                </div>
                                
                                <h5 class="mt-4"><i class="fas fa-credit-card me-2"></i>Payment Information</h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Card Number</label>
                                        <input type="text" class="form-control" name="cardNumber" 
                                               placeholder="1234 5678 9012 3456" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">Expiry Date</label>
                                        <input type="text" class="form-control" name="expiryDate" 
                                               placeholder="MM/YY" required>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">CVV</label>
                                        <input type="text" class="form-control" name="cvv" 
                                               placeholder="123" required>
                                    </div>
                                </div>
                                
                                <div class="d-grid gap-2 mt-4">
                                    <button type="submit" class="btn btn-success btn-lg">
                                        <i class="fas fa-lock me-2"></i>Complete Order - $<%= String.format("%.2f", total) %>
                                    </button>
                                    <a href="cart.jsp" class="btn btn-outline-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Back to Cart
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="all_component/footer.jsp"%>
</body>
</html>