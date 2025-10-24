<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="fas fa-book-reader me-2"></i>E-Books
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp#featured-books">Featured Books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp#categories">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp#features">Features</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <%
                    if (session.getAttribute("userobj") == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        <i class="fas fa-sign-in-alt me-1"></i> Login
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">
                        <i class="fas fa-user-plus me-1"></i> Register
                    </a>
                </li>
                <%
                    } else {
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle me-1"></i> Welcome User
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i> My Profile</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-bookmark me-2"></i> My Library</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-shopping-cart me-2"></i> My Cart</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="logout.jsp"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                    </ul>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>