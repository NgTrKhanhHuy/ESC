package servlet;

import adminDao.ProductDao;
import dao.CartDao;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/Addtocart")
public class AddToCartServlet extends HttpServlet {
    private CartDao cartDao = new CartDao();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user"); // Lấy thông tin người dùng từ session
        if (user != null) {
            // Nếu người dùng đã đăng nhập, thêm sản phẩm vào giỏ hàng
            boolean success = cartDao.addToCart(user.getId(), productId, quantity);
            if (success) {
                Cart cart = cartDao.getCartByUserId(user.getId());
                session.setAttribute("cart", cart);
                int totalItems = cartDao.getTotalItems(cart.getId());
                session.setAttribute("totalItems", totalItems);
                // Sau khi thêm sản phẩm, chuyển hướng về giỏ hàng
                response.sendRedirect("cart");
            } else {
                // Nếu có lỗi trong quá trình thêm sản phẩm
                request.setAttribute("error", "Failed to add product to cart.");
                request.getRequestDispatcher("product-detail.jsp").forward(request, response);
            }
        } else {
            // Nếu người dùng chưa đăng nhập, yêu cầu đăng nhập
            response.sendRedirect("login");
        }
    }
}
