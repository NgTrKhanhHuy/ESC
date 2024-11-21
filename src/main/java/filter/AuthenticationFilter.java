package filter;

import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")

public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String uri = request.getRequestURI();

//        User user = (User) session.getAttribute("user");
//        if (user != null) {
//            if (uri.contains("/admin/") && !user.getRole().equals("ADMIN")) {
//                response.sendRedirect("accessDenied.jsp");
//                return;
//            }
//        }
        if (session != null) {
            // Giả sử thông tin role được lưu trong session
            String userRole = (String) session.getAttribute("role");  // Lấy role từ session (hoặc nơi bạn lưu trữ)

            // Kiểm tra role của người dùng
            if (userRole != null && userRole.equals("ADMIN")) {
                // Nếu người dùng có role ADMIN, cho phép tiếp tục truy cập tài nguyên
                chain.doFilter(request, response);
            } else {
                // Nếu không có quyền truy cập, chuyển hướng đến trang lỗi hoặc trang đăng nhập
                response.sendRedirect(request.getContextPath() + "/access-denied");
            }
        } else {
            // Nếu không có session, chuyển hướng về trang đăng nhập
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
