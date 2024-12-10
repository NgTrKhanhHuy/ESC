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
    ProductDao productDao = new ProductDao();

    // ID của sản phẩm cần kiểm tra (Thay bằng ID sản phẩm thực tế trong cơ sở dữ liệu của bạn)
    int productId = 1; // Giả sử bạn muốn lấy sản phẩm có ID = 1

    // Gọi phương thức getProductByID để lấy thông tin sản phẩm theo ID
    Product product = productDao.getProductByID(productId);

    // Kiểm tra kết quả và in thông tin sản phẩm
    if (product != null) {
        System.out.println("Sản phẩm tìm thấy:");
        System.out.println("ID: " + product.getProductId());
        System.out.println("Tên: " + product.getName());
        System.out.println("Mô tả: " + product.getDescription());
        System.out.println("Giá: " + product.getPrice());


        System.out.println("Loại sản phẩm: " + product.getCategory());
        System.out.println("Ngày tạo: " + product.getCreatedAt());

    } else {
        System.out.println("Không tìm thấy sản phẩm với ID: " + productId);
    }
}
}