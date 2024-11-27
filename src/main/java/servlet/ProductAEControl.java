package servlet;

public class ProductAEControl {
//    @WebServlet("/ProductServlet")
//    public class ProductServlet extends HttpServlet {
//        private static final long serialVersionUID = 1L;
//        private ProductDAO productDAO;
//
//        public void init() {
//            productDAO = new ProductDAO();
//        }
//
//        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            String action = request.getParameter("action");
//
//            if ("add".equals(action)) {
//                addProduct(request, response);
//            } else if ("edit".equals(action)) {
//                editProduct(request, response);
//            }
//        }
//
//        private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            String name = request.getParameter("name");
//            String description = request.getParameter("description");
//            double price = Double.parseDouble(request.getParameter("price"));
//
//            // Xử lý ảnh
//            Part imagePart = request.getPart("image");
//            String imagePath = saveImage(imagePart);
//
//            Product product = new Product(name, description, price, imagePath);
//            productDAO.addProduct(product);
//
//            response.sendRedirect("admin/products"); // Chuyển hướng về trang quản lý sản phẩm
//        }
//
//        private String saveImage(Part imagePart) throws IOException {
//            String imageFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
//            String uploadDir = getServletContext().getRealPath("") + File.separator + "images";
//            File uploadDirPath = new File(uploadDir);
//            if (!uploadDirPath.exists()) {
//                uploadDirPath.mkdir();
//            }
//            String imagePath = uploadDir + File.separator + imageFileName;
//            imagePart.write(imagePath);
//            return imagePath;
//        }
//    }

}
