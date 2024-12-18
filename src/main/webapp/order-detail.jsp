<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
<!-- Header -->
<jsp:include page="includes/header.jsp" />

<!-- Main Content -->
<section class="container mt-5">
    <h2 class="text-center">Order Details</h2>

    <!-- Thông tin đơn hàng -->
    <div class="row">
        <div class="col-md-6">
            <h4>Thông tin đơn hàng</h4>
            <p><strong>Order ID:</strong> ${order.orderId}</p>
            <p><strong>Status:</strong> ${order.status}</p>
            <p><strong>Total Price:</strong> <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0.00" /> VND</p>
            <p><strong>Shipping Address:</strong> ${order.shippingAddress}</p>
        </div>
        <div class="col-md-6">
            <h4>Thông tin người nhận</h4>
            <p><strong>Username:</strong> ${order.customer.username}</p>
            <p><strong>Email:</strong> ${order.customer.email}</p>
            <p><strong>Phone:</strong> ${order.customer.phone}</p>
        </div>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="mt-4">
        <h4>Danh sách sản phẩm</h4>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>#</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Tổng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${orderItems}">
                <tr>
                    <td>${item.product.productId}</td>
                    <td>${item.product.name}</td>
                    <td><fmt:formatNumber value="${item.price}" pattern="#,##0.00" /> VND</td>
                    <td>${item.quantity}</td>
                    <td><fmt:formatNumber value="${item.quantity * item.price}" pattern="#,##0.00" /> VND</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
