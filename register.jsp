<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Books - Register</title>
    <%@include file="all_component/allcss.jsp"%>
</head>
<body style="background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('img/auth-bg.jpeg') no-repeat center center/cover; min-height: 100vh; background-attachment: fixed;">
    <%@include file="all_component/navbar.jsp"%>
    
    <div class="container mt-5 pt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg border-0">
                    <div class="card-header bg-success text-white text-center py-4">
                        <h4 class="mb-0"><i class="fas fa-user-plus me-2"></i>Create Your Account</h4>
                        <p class="mb-0 mt-2">Join thousands of readers today</p>
                    </div>
                    <div class="card-body p-5">
                        
                        <%
                            String regMsg = (String) session.getAttribute("reg-success");
                            if (regMsg != null) {
                        %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i><%= regMsg %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        <%
                                session.removeAttribute("reg-success");
                            }
                        %>
                        
                        <%
                            String failedMsg = (String) session.getAttribute("reg-failed");
                            if (failedMsg != null) {
                        %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i><%= failedMsg %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        <%
                                session.removeAttribute("reg-failed");
                            }
                        %>

                        <form action="UserServlet" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label fw-semibold">Full Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="fas fa-user text-success"></i></span>
                                        <input type="text" class="form-control border-start-0" id="name" name="name" 
                                               placeholder="Enter your full name" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-4">
                                    <label for="email" class="form-label fw-semibold">Email Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="fas fa-envelope text-success"></i></span>
                                        <input type="email" class="form-control border-start-0" id="email" name="email" 
                                               placeholder="Enter your email" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="password" class="form-label fw-semibold">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="fas fa-lock text-success"></i></span>
                                        <input type="password" class="form-control border-start-0" id="password" name="password" 
                                               placeholder="Create password" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-4">
                                    <label for="phone" class="form-label fw-semibold">Phone Number</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="fas fa-phone text-success"></i></span>
                                        <input type="tel" class="form-control border-start-0" id="phone" name="phone" 
                                               placeholder="Enter your phone">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="terms" required>
                                    <label class="form-check-label" for="terms">
                                        I agree to the <a href="#" class="text-success text-decoration-none">Terms and Conditions</a>
                                    </label>
                                </div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success btn-lg py-3">
                                    <i class="fas fa-user-plus me-2"></i>Create Account
                                </button>
                            </div>
                        </form>
                        
                        <div class="text-center mt-4">
                            <p class="mb-0">Already have an account? 
                                <a href="login.jsp" class="text-success text-decoration-none fw-semibold">Login here</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="all_component/footer.jsp"%>
</body>
</html>