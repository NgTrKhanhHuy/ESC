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
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);  // Lấy session, nếu có
        String path = httpRequest.getRequestURI();  // Lấy đường dẫn của request

        // Kiểm tra các đường dẫn không cho phép nếu không có session
        if (session == null) {
            // Nếu là trang yêu cầu đăng nhập mà không có session, lưu lại đường dẫn và chuyển đến trang login
            if (path.contains("/admin/") || path.contains("/cart") || path.contains("/checkout") || path.contains("/order")) {
                httpRequest.getSession().setAttribute("redirectAfterLogin", path);  // Lưu lại đường dẫn
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
                return;  // Dừng chuỗi xử lý, chuyển hướng về login
            }
        } else {
            // Nếu có session, kiểm tra quyền truy cập
            String role = (String) session.getAttribute("role");  // Giả sử role lưu trong session

            if (role == null || (!role.equals("admin") && path.contains("/admin/"))) {
                // Nếu không phải admin và cố gắng truy cập /admin, chuyển hướng đến trang lỗi hoặc trang khác
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/error.jsp");
                return;
            }
        }

        // Tiếp tục chuỗi lọc nếu không có vấn đề
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
