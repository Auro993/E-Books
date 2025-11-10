<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.user.UserDetails" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success - E-Books</title>
    <%@include file="all_component/allcss.jsp"%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <%
        UserDetails user = (UserDetails) session.getAttribute("userobj");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow text-center">
                    <div class="card-body py-5">
                        <div class="text-success mb-4">
                            <i class="fas fa-check-circle fa-5x"></i>
                        </div>
                        <h2 class="text-success">Order Successful!</h2>
                        <p class="lead">Thank you for your purchase, <%= user.getName() %>!</p>
                        <p>Your order has been confirmed and your e-books will be delivered to your email shortly.</p>
                        
                        <div class="mt-4">
                            <a href="home.jsp" class="btn btn-primary me-2">
                                <i class="fas fa-home me-2"></i>Back to Home
                            </a>
                            <a href="cart.jsp" class="btn btn-outline-primary">
                                <i class="fas fa-shopping-cart me-2"></i>View Cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="all_component/footer.jsp"%>
</body>
</html>