package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/about")
public class AboutControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException , ServletException {
        RequestDispatcher rd = request.getRequestDispatcher("about.jsp");
        rd.forward(request, response);
    }
}
