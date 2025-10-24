<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Books - Home</title>
    <%@include file="all_component/allcss.jsp"%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="hero-section" style="background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('img/hero-bg.jpeg') no-repeat center center/cover;">
        <div class="container">
            <div class="row align-items-center min-vh-100">
                <div class="col-md-6 fade-in">
                    <h1 class="display-4 text-white fw-bold">Discover Your Next Favorite Book</h1>
                    <p class="lead text-white">Access thousands of e-books from various genres. Read anytime, anywhere on any device.</p>
                    <div class="mt-4">
                        <a href="register.jsp" class="btn btn-primary btn-lg me-3">Get Started</a>
                        <a href="#featured-books" class="btn btn-outline-light btn-lg">Explore Books</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Books Section -->
    <section id="featured-books" class="py-5 bg-light">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="fw-bold">Featured Books</h2>
                    <p class="text-muted">Discover our most popular e-books</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="card book-card h-100">
                        <img src="img/books/book1.jpeg" class="card-img-top" alt="Book 1" style="height: 300px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">The Great Adventure</h5>
                            <p class="card-text text-muted">John Smith</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">Fiction</span>
                                <span class="text-success fw-bold">$12.99</span>
                            </div>
                        </div>
                        <div class="card-footer bg-transparent">
                            <button class="btn btn-outline-primary w-100">Add to Library</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card book-card h-100">
                        <img src="img/books/book2.jpeg" class="card-img-top" alt="Book 2" style="height: 300px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Science Wonders</h5>
                            <p class="card-text text-muted">Dr. Emily Johnson</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-info">Science</span>
                                <span class="text-success fw-bold">$15.99</span>
                            </div>
                        </div>
                        <div class="card-footer bg-transparent">
                            <button class="btn btn-outline-primary w-100">Add to Library</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card book-card h-100">
                        <img src="img/books/book3.jpeg" class="card-img-top" alt="Book 3" style="height: 300px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Business Mastery</h5>
                            <p class="card-text text-muted">Michael Roberts</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-warning">Business</span>
                                <span class="text-success fw-bold">$18.99</span>
                            </div>
                        </div>
                        <div class="card-footer bg-transparent">
                            <button class="btn btn-outline-primary w-100">Add to Library</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card book-card h-100">
                        <img src="img/books/book4.jpeg" class="card-img-top" alt="Book 4" style="height: 300px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Romantic Journey</h5>
                            <p class="card-text text-muted">Sarah Wilson</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-danger">Romance</span>
                                <span class="text-success fw-bold">$10.99</span>
                            </div>
                        </div>
                        <div class="card-footer bg-transparent">
                            <button class="btn btn-outline-primary w-100">Add to Library</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section py-5" style="background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8)), url('img/features-bg.jpeg') no-repeat center center/cover;">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="text-white fw-bold">Why Choose E-Books?</h2>
                    <p class="text-light">Experience the future of reading with our digital platform</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 text-center text-white mb-4">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-book fa-3x text-primary"></i>
                        </div>
                        <h4>Wide Collection</h4>
                        <p class="text-light">Thousands of books across all genres and categories</p>
                    </div>
                </div>
                <div class="col-md-3 text-center text-white mb-4">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-mobile-alt fa-3x text-primary"></i>
                        </div>
                        <h4>Read Anywhere</h4>
                        <p class="text-light">Access your library on any device, anytime, anywhere</p>
                    </div>
                </div>
                <div class="col-md-3 text-center text-white mb-4">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-search fa-3x text-primary"></i>
                        </div>
                        <h4>Easy Search</h4>
                        <p class="text-light">Find your favorite books quickly with advanced search</p>
                    </div>
                </div>
                <div class="col-md-3 text-center text-white mb-4">
                    <div class="feature-item p-4">
                        <div class="feature-icon mb-3">
                            <i class="fas fa-download fa-3x text-primary"></i>
                        </div>
                        <h4>Instant Download</h4>
                        <p class="text-light">Get your books immediately after purchase</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section id="categories" class="categories-section py-5" style="background: url('img/pattern.jpeg') repeat;">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="fw-bold">Popular Categories</h2>
                    <p class="text-muted">Explore books from various categories</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="card category-card text-center h-100">
                        <div class="card-img-wrapper">
                            <img src="img/categories/fiction.jpeg" class="card-img-top" alt="Fiction" style="height: 200px; object-fit: cover;">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Fiction</h5>
                            <p class="card-text text-muted">Imaginative stories, novels, and creative writing</p>
                            <span class="badge bg-primary">1250+ Books</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card category-card text-center h-100">
                        <div class="card-img-wrapper">
                            <img src="img/categories/science.jpeg" class="card-img-top" alt="Science" style="height: 200px; object-fit: cover;">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Science</h5>
                            <p class="card-text text-muted">Scientific discoveries, research, and innovation</p>
                            <span class="badge bg-info">800+ Books</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card category-card text-center h-100">
                        <div class="card-img-wrapper">
                            <img src="img/categories/business.jpeg" class="card-img-top" alt="Business" style="height: 200px; object-fit: cover;">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Business</h5>
                            <p class="card-text text-muted">Entrepreneurship, management, and success</p>
                            <span class="badge bg-warning">650+ Books</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card category-card text-center h-100">
                        <div class="card-img-wrapper">
                            <img src="img/categories/romance.jpeg" class="card-img-top" alt="Romance" style="height: 200px; object-fit: cover;">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Romance</h5>
                            <p class="card-text text-muted">Love stories, relationships, and emotional journeys</p>
                            <span class="badge bg-danger">950+ Books</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Statistics Section -->
    <section class="stats-section py-5 bg-primary text-white">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 mb-4">
                    <div class="stat-item">
                        <h2 class="display-4 fw-bold">10,000+</h2>
                        <p class="lead">E-Books Available</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="stat-item">
                        <h2 class="display-4 fw-bold">50,000+</h2>
                        <p class="lead">Happy Readers</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="stat-item">
                        <h2 class="display-4 fw-bold">100+</h2>
                        <p class="lead">Categories</p>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="stat-item">
                        <h2 class="display-4 fw-bold">24/7</h2>
                        <p class="lead">Support Available</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="all_component/footer.jsp"%>
</body>
</html>