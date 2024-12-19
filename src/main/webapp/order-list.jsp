<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 12/13/2024
  Time: 5:25 PM
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
    <title>Order List - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

<!-- Header -->
<jsp:include page="includes/header.jsp" />
<section class="content">
<div class="container mt-5">
    <h2 class="text-center">Order List</h2>

    <!-- Hiển thị thông báo nếu không có đơn hàng -->
    <c:if test="${not empty message}">
        <div class="alert alert-info">
                ${message}
        </div>
    </c:if>

    <!-- Hiển thị các đơn hàng -->
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Order Code</th>
                <th>Total Price</th>
                <th>Delivery Address</th>
                <th>Status</th>
                <th>Order Date</th>
                <th>Action</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td><a href="order-detail?id=${order.orderId}">${order.orderId}</a> </td>
                    <td>${order.totalPrice} VND</td>
                    <td>${order.shippingAddress}</td>
                    <td>${order.status}</td>
                    <td>${order.orderDate}</td>
                    <td>
                        <c:if test="${order.status == 'PENDING'}">
                            <form action="order-list" method="POST">
                                <input type="hidden" name="orderId" value="${order.orderId}">
                                <input type="hidden" name="action" value="cancel">
                                <button type="submit" class="btn btn-danger">Order Cancel</button>
                            </form>
                        </c:if>
                        <c:if test="${order.status == 'CANCELLED'}">
                            <form action="order-list" method="POST">
                                <input type="hidden" name="orderId" value="${order.orderId}">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit" class="btn btn-danger">Order Delete</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
