<%--
  Created by IntelliJ IDEA.
  User: Khanh Huy Studios
  Date: 27/11/2024
  Time: 10:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        .error {
            color: red;
            display: none;
        }
        .success {
            color: green;
            display: none;
        }
        .eye-icon {
            position: absolute;
            right: 28px;
            top: 49%;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
</head>

<body>

<!-- Header -->
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
                            <li><a class="dropdown-item" href="login.html"><i class="fas fa-sign-in-alt"></i> Login</a>
                            </li>
                            <li><a class="dropdown-item" href="register.html"><i class="fas fa-user-plus"></i> Register</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i> Profile</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-box"></i> Orders</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
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

<!-- Navigation Bar -->
<!--<nav class="navbar navbar-expand-lg navbar-light bg-light">-->
<!--    <div class="container">-->
<!--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"-->
<!--                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">-->
<!--            <span class="navbar-toggler-icon"></span>-->
<!--        </button>-->
<!--        <div class="collapse navbar-collapse" id="navbarNav">-->
<!--            <ul class="navbar-nav mx-auto">-->
<!--                <li class="nav-item">-->
<!--                    <a class="nav-link active" href="index.html">Home</a>-->
<!--                </li>-->
<!--                <li class="nav-item dropdown">-->
<!--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button">Products</a>-->
<!--                    <ul class="dropdown-menu">-->
<!--                        <li><a class="dropdown-item" href="#">Laptops</a></li>-->
<!--                        <li><a class="dropdown-item" href="#">Smartphones</a></li>-->
<!--                        <li><a class="dropdown-item" href="#">Accessories</a></li>-->
<!--                    </ul>-->
<!--                </li>-->
<!--                <li class="nav-item">-->
<!--                    <a class="nav-link" href="login.html">Login</a>-->
<!--                </li>-->
<!--                <li class="nav-item">-->
<!--                    <a class="nav-link" href="contact.html">Contact</a></li>-->
<!--            </ul>-->
<!--        </div>-->
<!--    </div>-->
<!--</nav>-->

<!-- Registration Form -->
<section class="register-page">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg p-4">
                    <h2 class="text-center mb-4">Register</h2>

                    <!-- Hiển thị thông báo lỗi nếu có -->
                    <c:if test="${not empty error}">
                        <p style="color: red;">${error}</p>
                    </c:if>
                    <form id="registerForm" action="register" method="POST">
                        <div class="mb-3">
                            <label for="registerName" class="form-label">Username</label>
                            <input type="text" class="form-control" id="registerName" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="registerEmail" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="registerEmail" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="registerPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="registerPassword" name="password" required>
                            <span class="eye-icon" id="togglePassword">
                                👁️
                             </span>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Repeat Password</label>
                            <input type="password" class="form-control" id="confirmPassword" required>

                            <p id="errorMessage" class="error">Mật khẩu không khớp.</p>
                            <p id="successMessage" class="success">Mật khẩu khớp!</p>
                        </div>
                        <div class="mb-3">
                            <label for="registerPhone" class="form-label">Phone</label>
                            <input type="number" class="form-control" id="registerPhone" name="phone" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>
                    <p class="mt-3">Already have an account? <a href="login.html">Login</a>.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-light mt-5 p-4 text-center">
    <p>&copy; 2024 Modern Tech Shop. All Rights Reserved.</p>
</footer>

<script>
    const passwordInput = document.getElementById('registerPassword');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const errorMessage = document.getElementById('errorMessage');
    const successMessage = document.getElementById('successMessage');
    const form = document.getElementById('registerForm');
    const togglePassword = document.getElementById('togglePassword');



    // Bật/tắt hiển thị mật khẩu
    togglePassword.addEventListener('click', function() {
        // Kiểm tra nếu mật khẩu đang ở chế độ 'password' (ẩn)
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';  // Hiển thị mật khẩu
        } else {
            passwordInput.type = 'password';  // Ẩn mật khẩu
        }
    });



    form.addEventListener('submit', function(event) {
        // event.preventDefault();

        if (passwordInput.value !== confirmPasswordInput.value) {
            errorMessage.style.display = 'block';
            successMessage.style.display = 'none';
            event.preventDefault();

        } else {
            errorMessage.style.display = 'none';
            successMessage.style.display = 'block';
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>
</body>

</html>

