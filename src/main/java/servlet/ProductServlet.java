package servlet;

import dao.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    private static final int PRODUCTS_PER_PAGE = 12; // Số lượng sản phẩm mỗi trang
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Lấy số trang từ request, nếu không có thì mặc định là trang 1
        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }

        // Tạo đối tượng ProductDao để truy vấn sản phẩm
        ProductDao productDao = new ProductDao();

        // Lấy tổng số sản phẩm
        int totalProducts = productDao.getTotalProduct();

        // Tính số trang tổng
        int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);

        // Nếu trang yêu cầu lớn hơn số trang tổng, chuyển về trang cuối
        if (page > totalPages) {
            page = totalPages;
        }

        // Lấy danh sách sản phẩm của trang hiện tại

        List<Product> products = productDao.getAllProductPaging(page, PRODUCTS_PER_PAGE);

        // Đưa dữ liệu vào request để chuyển đến JSP

        request.setAttribute("prod", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Forward đến product.jsp để hiển thị
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}


