package servlet;

import dao.ProductDao;
import model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/productdetail")
public class ProductDetailControl extends HttpServlet {
    private ProductDao productDao;
    public void init() throws ServletException {
        productDao = new ProductDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                Product product = productDao.getProductByID(id);
                if (product != null) {
                    request.setAttribute("product", product);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("product-detail.jsp");
                    dispatcher.forward(request, response);
                    return;


            }
        } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //response.sendRedirect("product");
    }
}
