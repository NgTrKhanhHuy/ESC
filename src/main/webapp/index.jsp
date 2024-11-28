<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>

<body>

<!-- Header -->
<!-- <header class="bg-dark text-light">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-4">
                <a href="index.html" class="navbar-brand text-white">Tech Shop</a>
            </div>
            <div class="col-md-4">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search for products">
                    <button class="btn btn-primary" type="submit">Search</button>
                </form>
            </div>
            <div class="col-md-4 text-end">
                <a href="cart.html" class="text-white">Cart <span class="badge bg-light text-dark">2</span></a>
            </div>
        </div>
    </div>
</header> -->

<!-- Navigation Bar -->
<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.html">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="products.html" id="navbarDropdown" role="button">Products</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Laptops</a></li>
                        <li><a class="dropdown-item" href="#">Smartphones</a></li>
                        <li><a class="dropdown-item" href="#">Accessories</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.html">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav> -->


<!-- <header class="bg-dark text-light">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-4">
                <a href="index.html" class="navbar-brand text-white">Tech Shop</a>
            </div>
            <div class="col-md-4">
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search for products">
                    <button class="btn btn-primary" type="submit">Search</button>
                </form>
            </div>
            <div class="col-md-4 text-end">
                <a href="#" id="loginBtn" class="text-white">Login</a> |
                <a href="#" id="registerBtn" class="text-white">Register</a>
            </div>
        </div>
    </div>
</header> -->

<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button">Products</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Laptops</a></li>
                        <li><a class="dropdown-item" href="#">Smartphones</a></li>
                        <li><a class="dropdown-item" href="#">Accessories</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.html">About</a>
                </li>
            </ul>
        </div>
    </div>
</nav> -->
<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <i class="fas fa-store"></i> MyShop
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-home"></i> Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-box"></i> Products
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-shopping-cart"></i> Cart
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user"></i> User
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i> Profile</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-box"></i> Orders</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav> -->
<header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container-fluid">
            <!-- Logo -->
            <a class="navbar-brand" href="#">
                <i class="fas fa-store"></i> MyShop
            </a>
            <!-- Toggle button for mobile view -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Navbar items -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="fas fa-home"></i> Home

                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-box"></i> Products
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-tags"></i> Categories
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-info-circle"></i> About
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-address-book"></i> Contact
                        </a>
                    </li>
                </ul>
                <!-- Search form -->
                <form class="d-flex mx-auto search-bar" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search products..." aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <!-- Right side (user and cart) -->
                <ul class="navbar-nav ms-auto">
                    <!-- User dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user"></i> Account
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="userDropdown">
                            <c:if test="${empty sessionScope.user}">
                                <li><a class="dropdown-item" href="login"><i class="fas fa-sign-in-alt"></i> Login</a>
                                </li>
                                <li><a class="dropdown-item" href="register"><i class="fas fa-user-plus"></i> Register</a>
                                </li>
<%--                                <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i>  ${sessionScope.user.username}</a></li>--%>

                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                            <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i>  ${sessionScope.user.username}</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-box"></i> Orders</a></li>
                            <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                            </c:if>



                        </ul>
                    </li>

                    <!-- Cart -->
                    <li class="nav-item">
                        <a class="nav-link" href="cart.html">
                            <i class="fas fa-shopping-cart"></i> Cart <span class="badge bg-danger">3</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>


<!-- Sidebar for login and register -->
<div id="loginSidebar" class="sidebar">
    <div class="sidebar-content">
        <h2>Login</h2>
        <form>
            <div class="mb-3">
                <label for="loginEmail" class="form-label">Email address</label>
                <input type="email" class="form-control" id="loginEmail" required>
            </div>
            <div class="mb-3">
                <label for="loginPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="loginPassword" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <button class="btn btn-danger closeSidebar" id="closeLoginSidebar">Close</button>
    </div>
</div>

<div id="registerSidebar" class="sidebar">
    <div class="sidebar-content">
        <h2>Register</h2>
        <form>
            <div class="mb-3">
                <label for="registerName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="registerName" required>
            </div>
            <div class="mb-3">
                <label for="registerEmail" class="form-label">Email address</label>
                <input type="email" class="form-control" id="registerEmail" required>
            </div>
            <div class="mb-3">
                <label for="registerPassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="registerPassword" required>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
        <button class="btn btn-danger closeSidebar" id="closeRegisterSidebar">Close</button>
    </div>
</div>

<!-- Hero Slider -->
<div id="heroSlider" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/banner1.webp" class="d-block w-100" alt="Banner 1">
        </div>
        <div class="carousel-item">
            <img src="banner2.jpg" class="d-block w-100" alt="Banner 2">
        </div>
        <div class="carousel-item">
            <img src="banner3.jpg" class="d-block w-100" alt="Banner 3">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#heroSlider" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroSlider" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Product Section -->
<section class="container mt-5">
    <h2 class="text-center">All Products</h2>
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <img src="img/product1.webp" class="card-img-top" alt="Product 1">
                <div class="card-body">
                    <h5 class="card-title">Product 1</h5>
                    <p class="card-text">$499.99</p>
                    <a href="product-detail.html" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="img/product1.webp" class="card-img-top" alt="Product 2">
                <div class="card-body">
                    <h5 class="card-title">Product 2</h5>
                    <p class="card-text">$799.99</p>
                    <a href="product-detail.html" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <!-- Add more products similarly -->
    </div>
</section>
<!-- Footer -->
<footer class="bg-dark text-light mt-5 p-4 text-center">
    <p>&copy; 2024 Modern Tech Shop. All Rights Reserved.</p>
</footer>
<!-- Thêm tệp JavaScript trong trang index.html -->
<script src="app.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist"/>
