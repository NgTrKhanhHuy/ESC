<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password - Tech Shop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
</head>

<body>

<jsp:include page="includes/header.jsp" />

<section class="reset-password-page content">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow-lg p-4">
          <h2 class="text-center mb-4">Reset Your Password</h2>

          <!-- Hiển thị thông báo -->
          <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
          </c:if>
          <c:if test="${not empty message}">
            <p style="color: green;">${message}</p>
          </c:if>

          <form id="resetPasswordForm" action="reset-password" method="POST">
            <input type="hidden" name="token" value="${token}" />

            <div class="mb-3">
              <label for="password" class="form-label">New Password:</label>
              <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
              <label for="confirmPassword" class="form-label">Repeat Password:</label>
              <input type="password" class="form-control" id="confirmPassword" required>
              <p id="errorMessage" class="text-danger" style="display: none;">Passwords do not match.</p>
              <p id="successMessage" class="text-success" style="display: none;">Passwords match!</p>
            </div>

            <button type="submit" class="btn btn-primary w-100">Reset Password</button>
          </form>
          <p class="mt-3"><a href="login.jsp">Back to Login</a></p>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="includes/footer.jsp" />

<script>
  const passwordInput = document.getElementById('password');
  const confirmPasswordInput = document.getElementById('confirmPassword');
  const errorMessage = document.getElementById('errorMessage');
  const successMessage = document.getElementById('successMessage');
  const form = document.getElementById('resetPasswordForm');

  form.addEventListener('submit', function(event) {
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
</body>
</html>
