
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/26/2024
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Listing - Tech Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

<!-- Header -->
<jsp:include page="includes/header.jsp" />


<!-- Product List -->
<section class="container mt-5">
    <h2 class="text-center">All Products</h2>
    <div class="row">
        <c:forEach var="product" items="${prod}">

            <div class="col-md-3">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/img/${product.imagePath}"  alt="image"  loading="lazy">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">
                            <fmt:formatNumber value = "${product.price}" type="currency" currencySymbol="VND" pattern="#,##0.00"/>
                        </p>
                        <a href="product-detail.html" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
        </c:forEach>


        <!-- Add more products similarly -->
            <nav>
                <ul class="pagination">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item"><a class="page-link" href="?page=${currentPage - 1}">Trang trước</a></li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item"><a class="page-link" href="?page=${currentPage + 1}">Trang sau</a></li>
                    </c:if>
                </ul>
            </nav>

</section>

<!-- Footer -->
<jsp:include page="includes/footer.jsp" />


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>
</body>

</html>

