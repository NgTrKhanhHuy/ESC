package servlet;

import dao.ProductDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/HomeControl")
public class HomeControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");



        //b1:Lay data trong Dao
        ProductDao productDao = new ProductDao();



        //b1
        List<Product> listProduct = productDao.getAllProduct();
//        List<Product> listProduct = productDao.getAllproductPaging(1,6);

        request.setAttribute("listProduct", listProduct);

//        request.setAttribute("listProduct", listproduct);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
