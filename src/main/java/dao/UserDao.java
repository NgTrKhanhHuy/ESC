package dao;

import database.DBConnection;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class UserDao {

//    public UserDao(Connection connection) {
//        this.connection = connection;
//    }
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
