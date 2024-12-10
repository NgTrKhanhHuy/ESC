<%--
  Created by IntelliJ IDEA.
  User: Khanh Huy Studios
  Date: 28/11/2024
  Time: 11:49 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
            <a class="nav-link active" href="home">
              <i class="fas fa-home"></i> Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="product">
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
        <form class="d-flex mx-auto search-bar" role="search" method="get" action="product">
          <input class="form-control me-2" type="text" name="search" value="${param.search}" placeholder="Search products..." aria-label="Search">
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
                <li><a class="dropdown-item" href="login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a class="dropdown-item" href="register"><i class="fas fa-user-plus"></i> Register</a></li>
              </c:if>
              <c:if test="${not empty sessionScope.user}">
                <li><a class="dropdown-item" href="user"><i class="fas fa-user-circle"></i>  ${sessionScope.user.username}</a></li>
                <li><a class="dropdown-item" href="#"><i class="fas fa-box"></i> Orders</a></li>
                <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
              </c:if>
            </ul>
          </li>

          <!-- Cart -->
          <li class="nav-item">
            <a class="nav-link" href="cart">
              <i class="fas fa-shopping-cart"></i> Cart <span class="badge bg-danger"><c:choose>
              <c:when test="${not empty sessionScope.totalItems}">
                ${sessionScope.totalItems}
              </c:when>
              <c:otherwise>
                0
              </c:otherwise>
            </c:choose></span>
            </a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="languageDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fas fa-language"></i> Language
            </a>
            <ul class="dropdown-menu" aria-labelledby="languageDropdown">
              <!-- Tiếng Việt -->
              <li>
                <a class="dropdown-item" href="language?lang=vi">
                  <img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Vietnam.svg" alt="Vietnam Flag" width="20" class="me-2"> Tiếng Việt
                </a>
              </li>
              <!-- Tiếng Anh -->
              <li>
                <a class="dropdown-item" href="language?lang=en">
                  <img src="https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg" alt="US Flag" width="20" class="me-2"> English
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

