package servlet;

import dao.OrderDao;
import model.Order;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/order-confirmation")
public class OrderConfirmationControl extends HttpServlet {
    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng về trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        // Truy vấn tất cả các đơn hàng của người dùng từ cơ sở dữ liệu
        OrderDao orderDao = new OrderDao();
        List<Order> orders = orderDao.getOrderByUserId(user.getId());

        if (orders.isEmpty()) {
            // Nếu không có đơn hàng, bạn có thể thêm một thông báo hoặc xử lý phù hợp
            request.setAttribute("message", "Bạn chưa có đơn hàng nào.");
        }


        // Gửi danh sách đơn hàng đến JSP
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("order-confirmation.jsp").forward(request, response);
    }
}
