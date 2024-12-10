package servlet;

import model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import dao.CartDao;
import model.User;
@WebServlet("/update")
public class UpdateCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CartDao cartDao = new CartDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin sản phẩm và số lượng từ request
        // Lấy thông tin từ form
        int cartId = Integer.parseInt(request.getParameter("cartId"));         //ID cua cart
        int productId = Integer.parseInt(request.getParameter("productId"));  // ID sản phẩm
        int newQuantity = Integer.parseInt(request.getParameter("quantity")); // Số lượng mới

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // Lấy thông tin người dùng từ session
        if (user != null) {
            // Nếu người dùng đã đăng nhập, thực hiện cập nhật giỏ hàng
            boolean success = cartDao.updateCartItemQuantity(cartId, productId, newQuantity);
            if (success) {
                // Cập nhật lại giỏ hàng và số lượng sản phẩm trong giỏ hàng
                Cart cart = cartDao.getCartByUserId(user.getId());
                session.setAttribute("cart", cart);
                int totalItems = cartDao.getTotalItems(cart.getId());
                session.setAttribute("totalItems", totalItems);
                // Nếu cập nhật thành công, chuyển hướng về trang giỏ hàng
                response.sendRedirect("cart"); // Giả sử giỏ hàng có URL là /cart
            } else {
                // Nếu có lỗi trong quá trình cập nhật
                request.setAttribute("error", "Không thể cập nhật số lượng sản phẩm.");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }
        } else {
            // Nếu người dùng chưa đăng nhập, yêu cầu đăng nhập
            response.sendRedirect("login"); // Redirect đến trang đăng nhập
        }
    }
}
