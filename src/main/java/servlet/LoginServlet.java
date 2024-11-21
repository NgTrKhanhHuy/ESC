package servlet;

import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        userService = new UserService(new dao.UserDao((Connection) getServletContext().getAttribute("dbConnection")));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

//        userService.login(username, password).ifPresentOrElse(user -> {
//            HttpSession session = request.getSession();
//            session.setAttribute("user", user);
//            response.sendRedirect("home.jsp");
//        }, () -> {
//            request.setAttribute("error", "Invalid username or password");
//            try {
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            } catch (ServletException | IOException e) {
//                e.printStackTrace();
//            }
//        });
    }
}
