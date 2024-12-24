<%--
  Created by IntelliJ IDEA.
  User: Khanh Huy Studios
  Date: 28/11/2024
  Time: 10:35 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="admin_header.jsp" />
<div class="container mt-5">
<%--    <li class="nav-item dropdown">--%>
<%--        <a class="nav-link dropdown-toggle" href="#" id="manageDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--            Quản lý Sản phẩm--%>
<%--        </a>--%>
<%--        <ul class="dropdown-menu" aria-labelledby="manageDropdown">--%>
<%--            <!-- Quản lý sản phẩm (luôn hiển thị) -->--%>
<%--            <li><a class="dropdown-item" href="home">Quản lý Sản phẩm</a></li>--%>

<%--            <!-- Quản lý đơn hàng (hiển thị khi hover vào Quản lý) -->--%>
<%--            <li><a class="dropdown-item" href="order-list">Quản lý Đơn hàng</a></li>--%>
<%--        </ul>--%>
<%--    </li>--%>
<%--    <!-- Tìm kiếm -->--%>
<%--    <div class="mb-3">--%>
<%--        <input type="text" id="search" class="form-control" placeholder="Tìm kiếm sản phẩm...">--%>
<%--    </div>--%>
<%--    <li class="nav-item dropdown">--%>
<%--        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"--%>
<%--           data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--            <i class="fas fa-user"></i> Account--%>
<%--        </a>--%>
<%--        <ul class="dropdown-menu" aria-labelledby="userDropdown">--%>
<%--            <c:if test="${empty sessionScope.user}">--%>
<%--                <li><a class="dropdown-item" href="login"><i class="fas fa-sign-in-alt"></i> Login</a>--%>
<%--                </li>--%>
<%--                &lt;%&ndash;                                <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i>  ${sessionScope.user.username}</a></li>&ndash;%&gt;--%>

<%--            </c:if>--%>
<%--            <c:if test="${not empty sessionScope.user}">--%>
<%--                <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i>  ${sessionScope.user.username}</a></li>--%>
<%--                <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>--%>
<%--            </c:if>--%>



<%--        </ul>--%>
<%--    </li>--%>

    <!-- Bảng sản phẩm -->
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Tên sản phẩm</th>
            <th>Mô tả</th>
            <th>Giá</th>
            <th>Số lượng trong kho</th>
            <th>Danh mục</th>
            <th>Hình ảnh</th>
            <th>Ngày tạo</th>
            <th>Giảm giá (%)</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td>${product.stock}</td>
                <td>${product.category}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/img/${product.imagePath}" alt="image" width="100" loading="lazy">
                </td>
                <td>${product.createdAt}</td>
                <td>${product.discountPercentage}</td>
                <td>
                    <button class="btn btn-warning" onclick="editProduct(${product.productId}, '${product.name}', ${product.price} ,
                            '${product.description}', '${product.category}', ${product.discountPercentage},
                            ${product.stock}, '${product.imagePath}' )">Sửa</button>
<%--                <a href="updateProduct?productId=${product.productId}" class="btn btn-warning">Sửa</a>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Phân trang -->
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

    <!-- Nút Thêm -->
    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">Thêm sản phẩm</button>
    <c:if test="${not empty message}">
        <p style="color: red;">${message}</p>
    </c:if>
<%--    <form action="addProduct" method="POST" enctype="multipart/form-data">--%>
<%--        <input type="text" name="name" placeholder="Tên sản phẩm" required>--%>
<%--        <input type="text" name="description" placeholder="Mô tả sản phẩm" required>--%>
<%--        <input type="number" name="price" placeholder="Giá sản phẩm" required>--%>
<%--        <input type="number" name="stock" placeholder="Số lượng" required>--%>
<%--        <input type="text" name="category" placeholder="Loại sản phẩm" required>--%>
<%--        <input type="number" name="discountPercentage" placeholder="Giá sản phẩm" required>--%>
<%--        <input type="file" name="image" required> <!-- Trường file -->--%>
<%--        <button type="submit">Thêm sản phẩm</button>--%>
<%--    </form>--%>
<%--form cũ--%>
<%--    <form  action="http://localhost:8080/ESC_war_exploded/admin/addProduct" method="POST" enctype="multipart/form-data">--%>
<%--        <div class="mb-3">--%>
<%--            <label for="productName" class="form-label">Tên sản phẩm</label>--%>
<%--            <input type="text" class="form-control" id="productName" name="productName" required>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="productPrice" class="form-label">Giá</label>--%>
<%--            <input type="number" class="form-control" id="productPrice" name="productPrice" required>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="productDescription" class="form-label">Mô tả</label>--%>
<%--            <textarea class="form-control" id="productDescription" name="productDescription" required></textarea>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="productCategory" class="form-label">Danh mục</label>--%>
<%--                <input type="text" class="form-control" id="productCategory" name="productCategory" required>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="productImage" class="form-label">Ảnh sản phẩm</label>--%>
<%--            <input type="file" class="form-control" id="productImage" name="productImage" required>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="discountPercentage" class="form-label">Giảm giá (%)</label>--%>
<%--            <input type="number" step="0.01" class="form-control" id="discountPercentage" name="discountPercentage" required>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="stock" class="form-label">Số lượng</label>--%>
<%--            <input type="number" class="form-control" id="stock" name="stock" required>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary" >Lưu</button>--%>

<%--    </form>--%>

</div>

<!-- Modal Thêm Sản Phẩm -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Thêm Sản Phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="productName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Giá</label>
                        <input type="number" class="form-control" id="productPrice" name="price" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="productDescription" name="description" required></textarea>
                    </div>
<%--                    <div class="mb-3">--%>
<%--                        <label for="productCategory" class="form-label">Danh mục</label>--%>
<%--                        <input type="text" class="form-control" id="productCategory" name="category" required>--%>
<%--                    </div>--%>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Danh mục</label>
                        <select class="form-control" id="productCategory" name="category" required>
                            <option value="Laptop">Laptop</option>
                            <option value="Phone">Phone</option>
                            <option value="Tablet">Tablet</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Ảnh sản phẩm</label>
                        <input type="file" class="form-control" id="productImage" name="image" required>
                    </div>
                    <div class="mb-3">
                        <label for="discountPercentage" class="form-label">Giảm giá (%)</label>
                        <input type="number" step="0.01" class="form-control" id="discountPercentage" name="discountPercentage" required>
                    </div>
                    <div class="mb-3">
                        <label for="stock" class="form-label">Số lượng</label>
                        <input type="number" class="form-control" id="stock" name="stock" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="saveProduct()" >Lưu</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Sửa Sản Phẩm -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProductModalLabel">Sửa Sản Phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editProductForm" enctype="multipart/form-data">
                    <input type="hidden" id="editProductId" name="productId" > <!-- Ẩn id sản phẩm để gửi lên server -->

                    <div class="mb-3">
                        <label for="editProductName" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="editProductName" name="name">

                    </div>

                    <div class="mb-3">
                        <label for="editProductPrice" class="form-label">Giá</label>
                        <input type="number" class="form-control" id="editProductPrice" name="price">
                    </div>

                    <div class="mb-3">
                        <label for="editProductDescription" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="editProductDescription" name="description"></textarea>
                    </div>

<%--                    <div class="mb-3">--%>
<%--                        <label for="editProductCategory" class="form-label">Danh mục</label>--%>
<%--                        <input type="text" class="form-control" id="editProductCategory" name="category">--%>
<%--                    </div>--%>
                    <div class="mb-3">
                        <label for="editProductCategory" class="form-label">Danh mục</label>
                        <select class="form-control" id="editProductCategory" name="category" required>
                            <option value="Laptop">Laptop</option>
                            <option value="Phone">Phone</option>
                            <option value="Tablet">Tablet</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="editProductImage" class="form-label">Ảnh sản phẩm (để trống nếu không thay đổi)</label>
                        <input type="file" class="form-control" id="editProductImage" name="image">
                            <input type="hidden" id="editOldProductImage" name="oldImg ">
                    </div>

                    <div class="mb-3">
                        <label for="editDiscountPercentage" class="form-label">Giảm giá (%)</label>
                        <input type="number" class="form-control" id="editDiscountPercentage" name="discountPercentage" step="0.01">
                    </div>

                    <div class="mb-3">
                        <label for="editProductStock" class="form-label">Số lượng</label>
                        <input type="number" class="form-control" id="editProductStock" name="stock">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="updateProduct()">Cập nhật</button>
            </div>
        </div>
    </div>
</div>

  <jsp:include page="admin_footer.jsp" />


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    //  Hàm lưu sản phẩm mới (thêm sản phẩm)
    function saveProduct() {
        const form = document.getElementById('addProductForm');
        const formData = new FormData(form);

        // Gửi dữ liệu form qua AJAX
        fetch('addProduct', {
            method: 'POST',
            body: formData
        })
            .then(response => response.text())  // Đọc phản hồi từ server dưới dạng text
            .then(responseText => {
                alert(responseText); // Hiển thị thông báo từ server
                if (responseText.includes("Sản phẩm đã được thêm thành công")) {
                    window.location.reload(); // Reload trang sản phẩm nếu thành công
                }
            })
            .catch(error => {
                console.error('Lỗi:', error);
                alert('Có lỗi xảy ra');
            });
    }

   // Hàm mở modal sửa sản phẩm
    function editProduct(productId , name, price, description, category, discountPercentage, stock, imagePath) {
        // Điền thông tin sản phẩm vào form
        document.getElementById('editProductId').value = productId;
        document.getElementById('editProductName').value = name;
        document.getElementById('editProductPrice').value = price;
        document.getElementById('editProductDescription').value = description;
        document.getElementById('editProductCategory').value = category;
        document.getElementById('editDiscountPercentage').value = discountPercentage;
        document.getElementById('editProductStock').value = stock;
        document.getElementById('editOldProductImage').value = imagePath;

        // Nếu có ảnh sản phẩm, ta có thể hiển thị ảnh này cho người dùng
        // Nếu bạn muốn hiển thị ảnh, cần phải cập nhật phần này

        const modal = new bootstrap.Modal(document.getElementById('editProductModal'));
        modal.show();
    }

    // Hàm cập nhật sản phẩm
    function updateProduct() {
        const form = document.getElementById('editProductForm');
        const formData = new FormData(form);

        // Lấy id của sản phẩm cần cập nhật
        const productId = document.getElementById('editProductId').value;

        // Thêm id vào formData để server biết cần cập nhật sản phẩm nào
        formData.append('productId', productId);

        // Gửi dữ liệu form qua AJAX
        fetch('updateProduct', {
            method: 'POST',
            body: formData
        })
            .then(response => response.text())
            .then(responseText => {
                alert(responseText); // Hiển thị thông báo từ server
                if (responseText.includes("Sản phẩm đã được cập nhật thành công")) {
                    window.location.reload(); // Reload trang sản phẩm nếu thành công
                }
            })
            .catch(error => {
                console.error('Lỗi:', error);
                alert('Có lỗi xảy ra');
            });
    }

    // // Hàm mở modal Sửa và điền dữ liệu sản phẩm vào modal
    // function editProduct(id, name, price) {
    //     document.getElementById('editProductModalLabel').innerText = 'Sửa Sản Phẩm';
    //     document.getElementById('editProductName').value = name;
    //     document.getElementById('editProductPrice').value = price;
    //     const modal = new bootstrap.Modal(document.getElementById('editProductModal'));
    //     modal.show();
    // }
    //
    //
    //
    // // Hàm cập nhật sản phẩm (sửa sản phẩm)
    // function updateProduct() {
    //     const name = document.getElementById('editProductName').value;
    //     const price = document.getElementById('editProductPrice').value;
    //     console.log('Cập nhật sản phẩm:', name, price);
    //     // Logic cập nhật sản phẩm ở đây
    //     const modal = bootstrap.Modal.getInstance(document.getElementById('editProductModal'));
    //     modal.hide();
    // }

    // Tính năng tìm kiếm sản phẩm
    document.getElementById('search').addEventListener('input', function(event) {
        const searchText = event.target.value.toLowerCase();
        const rows = document.querySelectorAll('#product-table tr');
        rows.forEach(row => {
            const name = row.cells[1].textContent.toLowerCase();
            if (name.includes(searchText)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>

