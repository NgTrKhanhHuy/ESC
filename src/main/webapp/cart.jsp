<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

<!-- Header -->
<jsp:include page="includes/header.jsp" />

<!-- Shopping Cart Section -->
<section class="container mt-5">
    <h2 class="text-center">Shopping Cart</h2>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>
    <!-- Nếu giỏ hàng không rỗng -->
    <c:if test="${not empty cart.items}">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Product</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Total</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${cart.items}">
                <c:set var="prod" value="${item}" />
                <tr>
                    <td>${prod.product.name}</td>
                    <td>
                        <!-- Cập nhật số lượng sản phẩm -->
                        <form action="update" method="post" style="display:inline;">
                            <input type="hidden" name="cartId" value="${cart.id}" />

                            <input type="hidden" name="productId" value="${prod.product.productId}" />
                            <input type="number" name="quantity" value="${prod.quantity}" class="form-control" min="1" />
                            <button type="submit" class="btn btn-warning btn-sm" >Update</button>
                        </form>
                    </td>
                    <td><fmt:formatNumber value="${prod.product.price}" type="currency" /></td>
                    <td><fmt:formatNumber value="${prod.total}" type="currency" /></td>
                    <td>
                        <!-- Xóa sản phẩm khỏi giỏ -->
                        <form action="cart?action=remove" method="post" style="display:inline;">
                            <input type="hidden" name="productId" value="${prod.product.productId}" />
                            <button type="submit" class="btn btn-danger">Remove</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <p><strong>Total: <fmt:formatNumber value="${cart.total}" type="currency" /></strong></p>

        <!-- Tiến hành thanh toán -->
        <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>

    </c:if>

    <!-- Nếu giỏ hàng rỗng -->
    <c:if test="${empty cart.items}">
        <p class="text-center">Your cart is empty.</p>
    </c:if>

</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>

</body>

</html>
