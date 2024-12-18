package servlet;

import dao.CartDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutControl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");




        if (user == null) {
            // Người dùng chưa đăng nhập, chuyển hướng về trang login
            response.sendRedirect("login.jsp");
            return;
        }
// Lấy giỏ hàng từ session
        Cart cart = (Cart) session.getAttribute("cart");  // Lấy Cart từ session
        if (cart == null || cart.isEmpty()) {
            // Giỏ hàng trống, chuyển hướng về trang giỏ hàng
            request.setAttribute("error", "Giỏ hàng của bạn đang trống.");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }

        // Lấy thông tin từ form thanh toán
//        String fullName = request.getParameter("fullName");
        String address = request.getParameter("shippingAddress");
        // Tính tổng giá trị đơn hàng từ giỏ hàng
        BigDecimal totalPrice = cart.getTotal(); // Tổng tiền từ Cart



        // Tạo đối tượng Order
        Order order = new Order();
        order.setUserId(user.getId());
        order.setTotalPrice(totalPrice);
        order.setShippingAddress(address);
        order.setStatus("PENDING");
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));

        // Truy vấn thông tin người dùng từ UserDao
        UserDao userDao = new UserDao();
        User userInfo = userDao.getUserById(user.getId()); // Truy vấn thông tin người dùng bằng userId

        // Lưu thông tin người dùng vào order (có thể làm điều này trong đối tượng Order hoặc trực tiếp trong JSP)
        order.setCustomer(userInfo);  // Giả sử bạn đã tạo một setter cho customer trong Order


        // Lưu thông tin đơn hàng và chi tiết đơn hàng vào cơ sở dữ liệu
        OrderDao orderDao = new OrderDao();
        int orderId = orderDao.addOrder(order);

        if (orderId > 0) {
            // Lưu OrderItem từ CartItem vào cơ sở dữ liệu
            List<OrderItem> orderItems = new ArrayList<>();
            for (CartItem cartItem : cart.getItems()) {
                Product product = cartItem.getProduct();
                BigDecimal productPrice = product.getPrice().subtract((product.getPrice().multiply(product.getDiscountPercentage().divide(BigDecimal.valueOf(100)))));
                OrderItem orderItem = new OrderItem(
                        0,  // orderItemId, sẽ được tự động tạo khi lưu vào DB
                        orderId,  // orderId
                        product.getProductId(),  // productId
                        cartItem.getQuantity(),  // quantity
                        productPrice);      // price
                orderItems.add(orderItem);
                System.out.println(productPrice);

                //cap nhat so luong trong san pham kho
                int newStock = product.getStock() + cartItem.getQuantity();
                product.setStock(newStock);
                // Cập nhật thông tin sản phẩm trong cơ sở dữ liệu
                ProductDao productDao = new ProductDao();
                productDao.updateProductStock(product.getProductId(), newStock);

                //neu ton kho = 0, xoa san pham khoi db
                if(newStock == 0) {
                    productDao.deleteProduct(product.getProductId());
                }

            }
            orderDao.addOrderItems(orderItems);



            // Xóa giỏ hàng khỏi session
            orderDao.clearCart(user.getId());
            session.removeAttribute("cart");
            // Lấy giỏ hàng của người dùng và lưu vào session
            CartDao cartDao = new CartDao();
//            Cart cart = cartDao.getCartByUserId(user.getId());
//            session.setAttribute("cart", cart);

            // Tính tổng số lượng sản phẩm trong giỏ và lưu vào session
            int totalItems = cartDao.getTotalItems(cart.getId());
            session.setAttribute("totalItems", totalItems);

            // Chuyển hướng về trang xác nhận đơn hàng
            request.setAttribute("message", "Đơn hàng của bạn đã được đặt thành công!");
            request.setAttribute("order", order);
            request.setAttribute("orderItems", cart);
            request.setAttribute("orderId", orderId);
            request.getRequestDispatcher("order-confirmation.jsp").forward(request, response);
        } else {
            // Xử lý lỗi nếu thêm đơn hàng thất bại
            request.setAttribute("error", "Đã xảy ra lỗi trong quá trình đặt hàng. Vui lòng thử lại.");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng về trang thanh toán
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
    }

    

