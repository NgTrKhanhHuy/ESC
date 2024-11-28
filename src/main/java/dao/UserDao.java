package dao;

import database.DBConnection;
import model.User;
import model.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class UserDao {

//    public UserDao(Connection connection) {
//        this.connection = connection;
//    }

    // Phương thức lấy thông tin người dùng theo username
    public User getUserByUsername(String username) {
        User user = null;
        String sql = "SELECT * FROM user WHERE username = ?";  // Câu lệnh SQL truy vấn người dùng theo username

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);  // Đặt giá trị cho tham số trong câu lệnh SQL

            ResultSet rs = stmt.executeQuery();  // Thực hiện truy vấn

            // Nếu có kết quả, lấy thông tin người dùng từ ResultSet
            if (rs.next()) {
                int id = rs.getInt("user_id");
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String roleStr = rs.getString("role");

                // Giả sử bạn có lớp Role, bạn có thể chuyển đổi roleStr thành đối tượng Role
                Role role = Role.valueOf(roleStr);  // Cần phải xử lý nếu role là enum

                // Tạo đối tượng User và gán giá trị
                user = new User(id, userName, password, email, phone, role);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log lỗi nếu có
        }

        return user;  // Trả về đối tượng User nếu tìm thấy, nếu không thì null
    }
    // Phương thức kiểm tra người dùng đã tồn tại chưa dựa trên username hoặc email
    public boolean checkUserExists(String username, String email) {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM `user` WHERE username = ? OR email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }
    // Phương thức lưu thông tin người dùng vào cơ sở dữ liệu
    public boolean saveUser(User user) {
        boolean isSaved = false;
        String sql = "INSERT INTO `user` (username, password, email, phone, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getRole().toString());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSaved;
    }
    public static void main(String[] args) {
        try {
            // Tạo kết nối đến cơ sở dữ liệu
           UserDao userDao = new UserDao();

            // Kiểm tra phương thức getUserByUsername
            String usernameToSearch = "chuotcon"; // Giả sử đây là username bạn muốn tìm

            User user = userDao.getUserByUsername(usernameToSearch);

            if (user != null) {
                System.out.println("Thông tin người dùng: " + user);
            } else {
                System.out.println("Không tìm thấy người dùng với username: " + usernameToSearch);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


//    public void addProduct(Product product) {
//        String query = "INSERT INTO products (name, description, price, image) VALUES (?, ?, ?, ?)";
//        try (PreparedStatement stmt = connection.prepareStatement(query)) {
//            stmt.setString(1, product.getName());
//            stmt.setString(2, product.getDescription());
//            stmt.setDouble(3, product.getPrice());
//            stmt.setString(4, product.getImagePath());
//            stmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
