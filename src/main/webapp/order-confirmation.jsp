<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 12/12/2024
  Time: 5:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirm - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<!-- Header -->
<jsp:include page="includes/header.jsp" />

<!-- Main Content -->
<section class="container mt-5">
    <h2 class="text-center">Order Confirm</h2>

    <!-- Hiển thị thông tin đơn hàng -->
    <div class="row">
        <div class="col-md-6">
            <h4>Thông tin đơn hàng</h4>
            <p><strong>Order ID:</strong> ${orderId}</p>
            <p><strong>Status:</strong> ${order.status}</p>
            <p><strong>TotalPrice:</strong> <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="VND" minFractionDigits="0" maxFractionDigits="0"/>
<%--                ${order.totalPrice}--%>
            </p>
        </div>

        <div class="col-md-6">
            <h4>Thông tin người nhận</h4>
            <p><strong>Username:</strong> ${order.customer.username}</p>
            <p><strong>Email:</strong> ${order.customer.email}</p>
            <p><strong>Phone:</strong> ${order.customer.phone}</p>
            <p><strong>Address:</strong> ${order.shippingAddress}</p>

<%--            <p><strong>Thành phố:</strong> ${order.customerCity}</p>--%>
<%--            <p><strong>Mã bưu điện:</strong> ${order.customerPostalCode}</p>--%>
        </div>
    </div>

    <div class="text-center mt-4">
        <!-- Nút để xem chi tiết đơn hàng -->
        <a href="order-detail?id=${orderId}" class="btn btn-primary">Xem Chi Tiết Đơn Hàng</a>
    </div>
</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>
</body>

</html>

