package adminDao;

import database.DBConnection;
import model.Order;
import model.Role;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<Order>();
        String query = "SELECT * FROM `order`";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getBigDecimal("total_price"),
                        rs.getString("shipping_address"),
                        rs.getString("status"),
                        rs.getTimestamp("order_date"));
                orders.add(order);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            closeConnection();
        }
        return orders;
    }
    public void updateOrderStatus(int orderId, String status) {
        String query = "UPDATE `order` SET status = ? WHERE order_id = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Order> getAllOrders(int pageNumber, int pageSize) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.order_id, o.user_id, o.total_price, o.shipping_address, o.status, o.order_date, u.username,u.role,u.password,u.email,u.phone,u.created_at" +
                "               FROM `order` o " +
                "              JOIN `user` u ON o.user_id = u.user_id " +
                "               LIMIT ? OFFSET ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            int offset = (pageNumber - 1) * pageSize;
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);
            rs = ps.executeQuery();
            while (rs.next()) {
                String roleName = rs.getString("role");
                Role role = Role.valueOf(roleName);
                // Lấy thông tin từ ResultSet và tạo đối tượng User
                User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        role);
                // Khởi tạo đối tượng Order và gán customer vào
                Order order = new Order(rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getBigDecimal("total_price"),
                        rs.getString("shipping_address"),
                        rs.getString("status"),
                        rs.getTimestamp("order_date"));
                order.setCustomer(user);

                orders.add(order);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
    public int getTotalPages(int pageSize) {
        int totalPages = 0;
        String query = "SELECT COUNT(*) FROM `order`";
        try{
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()) {
                int totalOrders = rs.getInt(1);
                totalPages = (int) Math.ceil(totalOrders / (double) pageSize);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return totalPages;
    }

    // Xóa đơn hàng
    public void deleteOrder(int orderId) {
        String query = "DELETE FROM `order` WHERE order_id = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
    }




        // Đóng kết nối
        private void closeConnection() {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }}

    public static void main(String[] args) {
            // Tạo đối tượng OrderDao để gọi phương thức getAllOrders
            OrderDao orderDao = new OrderDao();

            // Sử dụng các tham số phân trang. Ví dụ: pageNumber = 1, pageSize = 10
            int pageNumber = 1; // Trang số 1
            int pageSize = 10;  // Mỗi trang hiển thị 10 đơn hàng

            // Lấy danh sách các đơn hàng từ database
            List<Order> orders = orderDao.getAllOrders(pageNumber, pageSize);

            // Kiểm tra kết quả và in ra thông tin các đơn hàng
            if (orders != null && !orders.isEmpty()) {
                for (Order order : orders) {
                    System.out.println("Order ID: " + order.getOrderId());
                    System.out.println("User ID: " + order.getUserId());
                    System.out.println("Total Price: " + order.getTotalPrice());
                    System.out.println("Shipping Address: " + order.getShippingAddress());
                    System.out.println("Status: " + order.getStatus());
                    System.out.println("Order Date: " + order.getOrderDate());
                    // In ra thông tin người dùng liên quan đến đơn hàng
                    User user = order.getCustomer();
                    if (user != null) {
                        System.out.println("Username: " + user.getUsername());
                        System.out.println("Email: " + user.getEmail());
                        System.out.println("Phone: " + user.getPhone());
                        System.out.println("Role: " + user.getRole());
                    }
                    System.out.println("----------------------------------------------------");
                }
            } else {
                System.out.println("No orders found.");
            }
        }
    }

