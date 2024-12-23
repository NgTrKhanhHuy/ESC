package adminServlet;

import adminDao.OrderDao;
import adminDao.UserDao;
import model.Role;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
@WebServlet("/admin/dashboard")
public class DashboardControl  extends HttpServlet {
    private UserDao userDao = new UserDao();
    private OrderDao orderDao = new OrderDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra xem người dùng có phải là Admin hay không
        User admin = (User) request.getSession().getAttribute("user");
        if (admin == null || admin.getRole() != Role.ADMIN) {
            response.sendRedirect("login.jsp?error=You are not authorized to access this page");
            return;
        }
            // Truy xuất thông tin thống kê từ cơ sở dữ liệu
            int userCount = userDao.getUserCount(); // Lấy số lượng người dùng
            BigDecimal totalRevenue = orderDao.getTotalRevenue(); // Lấy tổng doanh thu
            int completedOrders = orderDao.getCompletedOrdersCount(); // Lấy số lượng đơn hàng đã hoàn thành
            int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
            BigDecimal[] monthlyRevenue = orderDao.getMonthlyRevenue(currentYear);
            double[] monthlyRevenueDoubles = new double[monthlyRevenue.length];
            for (int i = 0; i < monthlyRevenue.length; i++) {
                monthlyRevenueDoubles[i] = monthlyRevenue[i].doubleValue();
            }

            // Đưa dữ liệu vào request để hiển thị trong Dashboard
            request.setAttribute("userCount", userCount);
            request.setAttribute("totalRevenue", totalRevenue); // Đưa doanh thu vào request
            request.setAttribute("completedOrders", completedOrders); // Đưa số lượng đơn hàng vào request
            request.setAttribute("monthlyRevenue", monthlyRevenueDoubles);

            // Chuyển tiếp tới trang dashboard.jsp
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

    }
}
