<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Detail - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

<!-- Header -->
<jsp:include page="includes/header.jsp"/>

<!-- Product Detail Section -->
<section class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <img src="${product.imagePath}" class="img-fluid" alt="${product.name}">
        </div>
        <div class="col-md-6">
            <h2>${product.name}</h2>
            <p class="text-muted">${product.price}</p>
            <p>This is a high-quality product with great features that will enhance your tech experience.</p>
            <p><strong>Specifications:</strong></p>
            <ul>
                <li>${product.description}</li>
            </ul>

            <!-- Form to add product to cart -->
            <form action="Addtocart" method="post">
                <input type="hidden" name="productId" value="${product.productId}"/>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" name="quantity" id="quantity" class="form-control" value="1" min="1"/>
                </div>
                <button type="submit" class="btn btn-primary">Add to Cart</button>
            </form>
        </div>
    </div>
</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>
</body>

</html>
