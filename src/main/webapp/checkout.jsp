<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CheckOut - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<!-- Header -->
<jsp:include page="includes/header.jsp" />

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="home">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="product" id="navbarDropdown" role="button">Products</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Laptops</a></li>
                        <li><a class="dropdown-item" href="#">Smartphones</a></li>
                        <li><a class="dropdown-item" href="#">Accessories</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Checkout Section -->
<section class="container mt-5">
    <h2 class="text-center">Checkout</h2>
    <form action="checkout" method="post">
        <div class="row">
            <div class="col-md-6">
                <h4>Billing Details</h4>
<%--                <div class="mb-3">--%>
<%--                    <label for="fullName" class="form-label">Full Name</label>--%>
<%--                    <input type="text" class="form-control" id="fullName" name="fullName" required>--%>
<%--                </div>--%>
<%--                <div class="mb-3">--%>
<%--                    <label for="email" class="form-label">Email</label>--%>
<%--                    <input type="email" class="form-control" id="email" name="email" required>--%>
<%--                </div>--%>
                <div class="mb-3">
                    <label for="address" class="form-label">Shipping Address</label>
                    <input type="text" class="form-control" id="address" name="shippingAddress" required>
                </div>
<%--                <div class="mb-3">--%>
<%--&lt;%&ndash;                    <label for="city" class="form-label">City</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input type="text" class="form-control" id="city" name="city" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="mb-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <label for="postalCode" class="form-label">Postal Code</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input type="text" class="form-control" id="postalCode" name="postalCode" required>&ndash;%&gt;--%>
<%--                </div>--%>

                <!-- Hidden input for user ID -->
                <input type="hidden" name="userId" value="${sessionScope.user.id}" />

                <!-- Hidden input for order status -->
                <input type="hidden" name="status" value="Pending" />

                <!-- Hidden input for order date (current timestamp) -->
                <input type="hidden" name="orderDate" value="<%= new java.sql.Timestamp(System.currentTimeMillis()) %>" />
            </div>

            <div class="col-md-6">
                <h4>Order Summary</h4>
                <ul class="list-group mb-3">
                    <c:forEach var="item" items="${cart.items}">
                        <c:set var="prod" value="${item}" />
                        <li class="list-group-item d-flex justify-content-between">
                            <span>${prod.product.name}</span>
<%--                            <strong>${prod.product.price-(prod.product.price * (prod.product.discountPercentage/100))}</strong>--%>
                            <strong><fmt:formatNumber value="${prod.product.price-(prod.product.price * (prod.product.discountPercentage/100))}" type="currency" currencySymbol="VND" minFractionDigits="0" maxFractionDigits="0"/></strong>

                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Quantity</span>
                            <strong>${prod.quantity}</strong>
                        </li>
                    </c:forEach>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (VND)</span>
                        <strong>
                            <fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="VND" minFractionDigits="0" maxFractionDigits="0" />
                        </strong>
                    </li>
                </ul>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Place Order</button>
            </div>
        </div>
    </form>
</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>
</body>

</html>
