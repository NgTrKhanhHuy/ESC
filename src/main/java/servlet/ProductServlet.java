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
        @WebServlet("/product")
        public class ProductServlet extends HttpServlet {
            private static final int PRODUCTS_PER_PAGE = 12; // Số lượng sản phẩm mỗi trang
            protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                // Lấy số trang từ request, nếu không có thì mặc định là trang 1
                int page = 1;
                try {
                    page = Integer.parseInt(request.getParameter("page"));
                } catch (NumberFormatException e) {
                    page = 1;
                }
                //lay category tu request
                String category = request.getParameter("category");
                // Lấy từ khóa tìm kiếm từ request (nếu có)
                String keyword = request.getParameter("search");

                // Tạo đối tượng ProductDao để truy vấn sản phẩm
                ProductDao productDao = new ProductDao();

                //neu category khong null, tim san pham theo category
                List<Product> products;
                int totalProducts;
                int totalPages;

                if(keyword != null && !keyword.isEmpty()) {
                    //neu co tim kiem ,lay san pham theo tu khoa
                    totalProducts = productDao.getTotalProductBySearch(keyword);
                    totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
                    products = productDao.searchProductPaging(keyword, PRODUCTS_PER_PAGE, page);
                    System.out.println("Keyword: " + keyword);
                }else

                if (category != null && !category.isEmpty()) {
                    totalProducts = productDao.getTotalProductByCategory(category);
                    totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
                    products = productDao.getProductByCategoryPaging(category, page, PRODUCTS_PER_PAGE);
                } else {
                    // Nếu không có category, hiển thị tất cả sản phẩm
                    totalProducts = productDao.getTotalProduct();
                    totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
                    products = productDao.getAllProductPaging(page, PRODUCTS_PER_PAGE);
                }






                // Đưa dữ liệu vào request để chuyển đến JSP

                request.setAttribute("prod", products);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("category", category);  // Truyền thông tin category vào JSP
                request.setAttribute("search", keyword); // Truyền từ khóa tìm kiếm vào JSP

                // Forward đến product.jsp để hiển thị
                request.getRequestDispatcher("product.jsp").forward(request, response);
            }
            protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
                    ServletException, IOException {
                // TODO Auto-generated method stub
                doGet(request, response);
            }

        }


