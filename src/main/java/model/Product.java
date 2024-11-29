package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Product {
    private int productId;
    private String name;
    private String description;
    private BigDecimal price;
    private int stock;
    private String category;
    private String imagePath;
    private Timestamp createdAt;
    private BigDecimal discountPercentage;

    // Constructor và getter/setter cho các thuộc tính
    public Product(int productId, String name, String description, BigDecimal price, int stock, String category, String imagePath, Timestamp createdAt, BigDecimal discountPercentage) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.category = category;
        this.imagePath = imagePath;
        this.createdAt = createdAt;
        this.discountPercentage = discountPercentage;
    }
    // Constructor không bao gồm productId (do database tự tạo)
    public Product(String name, String description, BigDecimal price, int stock, String category, String imagePath, BigDecimal discountPercentage) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.category = category;
        this.imagePath = imagePath;
        this.discountPercentage = discountPercentage;
    }

    public Product() {

    }


    // Getter and setter methods (các getter và setter)
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public BigDecimal getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(BigDecimal discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public void setName(String name) {
        this.name = name;
    }
}

