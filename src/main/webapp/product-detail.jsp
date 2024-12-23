<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<!-- Header -->
<jsp:include page="includes/header.jsp"/>

<!-- Product Detail Section -->
<section class="content">
<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <img src="${product.imagePath}" class="img-fluid" alt="${product.name}">
        </div>
        <div class="col-md-6">
            <h2>${product.name}</h2>
            <p class="text-muted"><fmt:formatNumber value="${product.price-(product.price * (product.discountPercentage/100))}" type="currency" currencySymbol="VND" minFractionDigits="0" maxFractionDigits="0"/></p>
            <p><fmt:message key="p_detail.content" /></p>
            <p><strong><fmt:message key="p_detail.specification" /></strong></p>
            <ul>
                <li>${product.description}</li>
            </ul>

            <!-- Form to add product to cart -->
            <form action="Addtocart" method="post">
                <input type="hidden" name="productId" value="${product.productId}"/>
                <div class="mb-3">
                    <label for="quantity" class="form-label"><fmt:message key="p_detail.quantity" /></label>
                    <input type="number" name="quantity" id="quantity" class="form-control" value="1" min="1" style="width: 150px"/>
                </div>
                <button type="submit" class="btn btn-primary"><fmt:message key="p_detail.add_to_cart" /></button>
            </form>
        </div>
    </div>
</div>
</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>
</body>

</html>
