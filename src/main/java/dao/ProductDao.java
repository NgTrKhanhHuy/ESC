package dao;

import database.DBConnection;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<Product>();
        String query = "select * from product";
        try {
            conn = new DBConnection().getConnection(); //mo ket noi database
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product temp = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBigDecimal(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getBigDecimal(9)
                );
                list.add(temp);
            }

        } catch (Exception e) {

        }
        return list;
    }


    public int getTotalProduct() {
        String query = "select count(*) from product";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }
    public int getTotalPages(int pageSize) {
        int totalProduct = getTotalProduct();
        return (int) Math.ceil((double) totalProduct / pageSize);
    }

    public List<Product> getAllProductPaging(int page, int total) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * \n" +
                "FROM product\n" +
                "ORDER BY product_id\n" +
                "LIMIT ? OFFSET ?\n";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, total); // Tính offset
            ps.setInt(2, (page - 1) * total); // Lấy số sản phẩm mỗi trang
            rs = ps.executeQuery();

            while (rs.next()) {
                Product temp = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBigDecimal(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getBigDecimal(9)
                );
                list.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    public List<Product> searchProductPaging(String keyword, int total, int page) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE name LIKE ? ORDER BY product_id LIMIT ? OFFSET ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%"); // Tìm kiếm theo tên sản phẩm
            ps.setInt(2, total);  // Số sản phẩm mỗi trang
            ps.setInt(3, (page - 1) * total);  // Tính offset
            rs = ps.executeQuery();

            while (rs.next()) {
                Product temp = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBigDecimal(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getBigDecimal(9)
                );
                list.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    // Lấy tổng số sản phẩm dựa trên từ khóa tìm kiếm
    public int getTotalProductBySearch(String keyword) {
        String query = "SELECT count(*) FROM product WHERE name LIKE ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int getTotalPagesBySearch(String keyword, int productsPerPage) {
        int totalProducts = getTotalProductBySearch(keyword);
        return (int) Math.ceil((double) totalProducts / productsPerPage);  // Tính số trang tổng
    }
    public Product getProductByID(int id) {
        String query = "SELECT * FROM product WHERE product_id = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet  rs = ps.executeQuery();
            if(rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBigDecimal(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getBigDecimal(9));
            }

        } catch (SQLException e) {

        }
        return null;
    }
    public void updateProductStock(int productId, int newStock) {
        String query = "UPDATE product SET stock = stock - ? WHERE product_id = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, newStock);
            ps.setInt(2, productId);
            ps.executeUpdate();
            if(newStock == 0) {
                deleteProduct(productId);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Product> getProductByCategoryPaging(String category, int page, int total) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE category = ? ORDER BY product_id LIMIT ? OFFSET ?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, category);
            ps.setInt(2, total);
            ps.setInt(3, (page - 1) * total);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product temp = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBigDecimal(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getBigDecimal(9));
                list.add(temp);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }
    public int getTotalProductByCategory(String category) {
        String query = "SELECT count(*) FROM product WHERE category = ?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, category);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
    // Tính số trang cho tìm kiếm theo category
    public int getTotalPagesByCategory(String category, int productsPerPage) {
        int totalProducts = getTotalProductByCategory(category);
        return (int) Math.ceil((double) totalProducts / productsPerPage);  // Tính số trang tổng
    }
    public List<Product> getNewestProduct() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM product ORDER BY created_at DESC LIMIT 10";// Truy vấn lấy 10 sản phẩm mới nhất
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product temp = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBigDecimal(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getTimestamp(8),
                        rs.getBigDecimal(9));
                productList.add(temp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    public void deleteProduct(int productId) {
        String query = "DELETE FROM product WHERE product_id = ?";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
             ps.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
//    ProductDao dao = new ProductDao();
//
//    int page = 1;  // Ví dụ lấy trang 1
//    int pageSize = 5;  // Ví dụ mỗi trang có 5 sản phẩm
//
////     Lấy danh sách sản phẩm phân trang
//    List<Product> product = dao.getAllProductPaging(page, pageSize);
////    List<Product> product = dao.getAllProduct();
//
//
////     Kiểm tra và in ra kết quả
//    if (product.isEmpty()) {
//        System.out.println("Không có sản phẩm nào.");
//    } else {
//        System.out.println("Danh sách sản phẩm trang " + page);
//        for (Product products : product) {
//            System.out.println(products);  // In ra thông tin từng sản phẩm
//        }
//    }
//}


//
//    ProductDao productDao = new ProductDao();
//
//    // ID của sản phẩm cần kiểm tra (Thay bằng ID sản phẩm thực tế trong cơ sở dữ liệu của bạn)
//    int productId = 1; // Giả sử bạn muốn lấy sản phẩm có ID = 1
//
//    // Gọi phương thức getProductByID để lấy thông tin sản phẩm theo ID
//    Product product = productDao.getProductByID(productId);
//
//    // Kiểm tra kết quả và in thông tin sản phẩm
//    if (product != null) {
//        System.out.println("Sản phẩm tìm thấy:");
//        System.out.println("ID: " + product.getProductId());
//        System.out.println("Tên: " + product.getName());
//        System.out.println("Mô tả: " + product.getDescription());
//        System.out.println("Giá: " + product.getPrice());
//
//
//        System.out.println("Loại sản phẩm: " + product.getCategory());
//        System.out.println("Ngày tạo: " + product.getCreatedAt());
//
//    } else {
//        System.out.println("Không tìm thấy sản phẩm với ID: " + productId);
//    }
//}

            ProductDao productDao = new ProductDao();

            // ID của sản phẩm cần kiểm tra
            int productId = 2; // Thay đổi ID sản phẩm nếu cần

            // Trước khi cập nhật, lấy thông tin sản phẩm để kiểm tra số lượng
            Product productBefore = productDao.getProductByID(productId);
            if (productBefore != null) {
                System.out.println("Sản phẩm trước khi cập nhật stock:");
                System.out.println("ID: " + productBefore.getProductId());
                System.out.println("Tên: " + productBefore.getName());
                System.out.println("Stock: " + productBefore.getStock());
            } else {
                System.out.println("Sản phẩm không tồn tại!");
                return;
            }

            // Cập nhật stock của sản phẩm
            int newStock = 3; // Cập nhật số lượng còn lại là 2
            productDao.updateProductStock(productId, newStock);

            // Lấy lại thông tin sản phẩm sau khi cập nhật
            Product productAfter = productDao.getProductByID(productId);
            if (productAfter != null) {
                System.out.println("\nSản phẩm sau khi cập nhật stock:");
                System.out.println("ID: " + productAfter.getProductId());
                System.out.println("Tên: " + productAfter.getName());
                System.out.println("Stock: " + productAfter.getStock());
            } else {
                System.out.println("Sản phẩm không tồn tại sau khi cập nhật!");
            }
        }

}