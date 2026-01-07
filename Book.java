package com.user;

public class Book {
    private int id;
    private String title;
    private String author;
    private double price;
    private String category;
    private String description;
    private String imagePath;
    
    public Book() {
        super();
    }
    
    public Book(String title, String author, double price, String category, String description, String imagePath) {
        super();
        this.title = title;
        this.author = author;
        this.price = price;
        this.category = category;
        this.description = description;
        this.imagePath = imagePath;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getAuthor() {
        return author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getCategory() {
        return category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getImagePath() {
        return imagePath;
    }
    
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    
    @Override
    public String toString() {
        return "Book [id=" + id + ", title=" + title + ", author=" + author + ", price=" + price + ", category=" + category + "]";
    }
}
