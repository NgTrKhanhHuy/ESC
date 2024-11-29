package adminServlet;

import adminDao.ProductDao;
import model.Product;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
@WebServlet("/admin/addProduct")

@MultipartConfig(
        location = "D:/LT_FE/ESC/tmp", // Thư mục tạm lưu trữ file, có thể thay đổi
        maxFileSize = 10485760, // 10MB, dung lượng tối đa cho file tải lên
        maxRequestSize = 20971520, // 20MB, dung lượng tối đa cho toàn bộ request
        fileSizeThreshold = 2097152 // 2MB, dung lượng tối thiểu để chuyển file vào bộ nhớ
)
public class AddProductControl extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Đảm bảo rằng request là multipart (chứa tệp ảnh)
        if (!ServletFileUpload.isMultipartContent(request)) {
            response.getWriter().write("Form must be multipart/form-data");
            return;
        }

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String category = request.getParameter("category");
        BigDecimal discountPercentage = new BigDecimal(request.getParameter("discountPercentage"));

        Part filePart = request.getPart("image"); // Lấy ảnh từ form
        String fileName = filePart.getSubmittedFileName();
        String imagePath = "img/" + fileName;

        // Lưu file ảnh vào thư mục
        String uploadPath = "D:/LT_FE/ESC/src/main/webapp/" + imagePath;
        try (InputStream inputStream = filePart.getInputStream();
             OutputStream outputStream = new FileOutputStream(uploadPath)) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        // Tạo đối tượng Product
//        Product product = new Product(name, description, price, stock, category, discountPercentage);
//
//        // Gọi DAO để lưu sản phẩm vào database
//        ProductDao productDao = new ProductDao();
//        boolean result = productDao.addProduct(product, imagePart);  // Gọi addProduct của ProductDao
//
//

        // Tạo đối tượng Product
        Product product = new Product();
        product.setName(name);
        System.out.println(product.getName());

        product.setDescription(description);
        System.out.println(product.getDescription());

        product.setPrice(price);
        System.out.println(product.getPrice());

        product.setStock(stock);
        System.out.println(product.getStock());

        product.setCategory(category);
        System.out.println(product.getCategory());

        product.setDiscountPercentage(discountPercentage);
        System.out.println(product.getDiscountPercentage());

        product.setImagePath(fileName);

        ProductDao dao = new ProductDao();

        // Giả sử bạn đã có một Part đối tượng hình ảnh từ frontend, đây chỉ là một ví dụ
       // String imagePath = "product1.jpg"; // Bạn có thể chỉ cần truyền tên ảnh mà không cần sử dụng Part
        // Thêm sản phẩm vào cơ sở dữ liệu
//        try {
//            if (dao.addProduct(product)) {
//                response.sendRedirect(request.getContextPath() + "/admin/home");
//            } else {
//                request.setAttribute("message", "Failed to add product.");
//                request.getRequestDispatcher("/admin/product.jsp").forward(request, response);
//            }
//        } catch (SQLException e) {
//            throw new ServletException("Error adding product", e);
//        }
        try {
            boolean isAdded = dao.addProduct(product);  // Giả sử bạn đã có phương thức này trong ProductDao
            if (isAdded) {
                response.getWriter().write("Sản phẩm đã được thêm thành công");
            } else {
                response.getWriter().write("Thêm sản phẩm thất bại");
            }
        } catch (SQLException e) {
            response.getWriter().write("Có lỗi xảy ra: " + e.getMessage());
            throw new ServletException("Error adding product", e);
        }
    }//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // Lấy dữ liệu từ form
//        String name = request.getParameter("name");
//        String description = request.getParameter("description");
//        BigDecimal price = new BigDecimal(request.getParameter("price"));
//        int stock = Integer.parseInt(request.getParameter("stock"));
//        String category = request.getParameter("category");
//        BigDecimal discountPercentage = new BigDecimal(request.getParameter("discountPercentage"));
//
//        // Lấy ảnh từ form
//        Part imagePart = request.getPart("image"); // "image" là name của input file trong form
//
//        // Tạo đối tượng Product và lưu vào database
//        Product product = new Product(name, description, price, stock, category, discountPercentage);
//        ProductDao productDao = new ProductDao();
//        boolean result = productDao.addProduct(product, imagePart);
//
//        if (result) {
//            response.getWriter().write("Sản phẩm đã được thêm thành công!");
//        } else {
//            response.getWriter().write("Có lỗi khi thêm sản phẩm!");
//        }
    }

