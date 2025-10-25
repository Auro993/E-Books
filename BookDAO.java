package com.dao;

import com.db.DBConnect;
import com.user.Book;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private Connection conn;

    public BookDAO(Connection conn) {
        this.conn = conn;
    }
    
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        try {
            String query = "SELECT * FROM books ORDER BY created_at DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setCategory(rs.getString("category"));
                book.setDescription(rs.getString("description"));
                book.setImagePath(rs.getString("image_path"));
                
                books.add(book);
            }
            
            System.out.println("Retrieved " + books.size() + " books from database");
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in getAllBooks: " + e.getMessage());
        }
        return books;
    }
    
    public List<Book> getBooksByCategory(String category) {
        List<Book> books = new ArrayList<>();
        try {
            String query = "SELECT * FROM books WHERE category = ? ORDER BY created_at DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setCategory(rs.getString("category"));
                book.setDescription(rs.getString("description"));
                book.setImagePath(rs.getString("image_path"));
                
                books.add(book);
            }
            
            System.out.println("Retrieved " + books.size() + " books for category: " + category);
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in getBooksByCategory: " + e.getMessage());
        }
        return books;
    }
    
    public Book getBookById(int id) {
        Book book = null;
        try {
            String query = "SELECT * FROM books WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setCategory(rs.getString("category"));
                book.setDescription(rs.getString("description"));
                book.setImagePath(rs.getString("image_path"));
            }
            
            System.out.println("Retrieved book by ID " + id + ": " + (book != null ? book.getTitle() : "NOT FOUND"));
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in getBookById: " + e.getMessage());
        }
        return book;
    }
    
    public boolean addBook(Book book) {
        boolean success = false;
        try {
            String query = "INSERT INTO books(title, author, price, category, description, image_path) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setDouble(3, book.getPrice());
            ps.setString(4, book.getCategory());
            ps.setString(5, book.getDescription());
            ps.setString(6, book.getImagePath());
            
            int rowsAffected = ps.executeUpdate();
            success = rowsAffected > 0;
            
            System.out.println("Book addition attempted: " + (success ? "SUCCESS" : "FAILED"));
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in addBook: " + e.getMessage());
        }
        return success;
    }
    
    public List<String> getAllCategories() {
        List<String> categories = new ArrayList<>();
        try {
            String query = "SELECT DISTINCT category FROM books ORDER BY category";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
            
            System.out.println("Retrieved " + categories.size() + " categories from database");
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in getAllCategories: " + e.getMessage());
        }
        return categories;
    }
    
    public List<Book> searchBooks(String searchTerm) {
        List<Book> books = new ArrayList<>();
        try {
            String query = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ? OR category LIKE ? ORDER BY title";
            PreparedStatement ps = conn.prepareStatement(query);
            String likeTerm = "%" + searchTerm + "%";
            ps.setString(1, likeTerm);
            ps.setString(2, likeTerm);
            ps.setString(3, likeTerm);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setCategory(rs.getString("category"));
                book.setDescription(rs.getString("description"));
                book.setImagePath(rs.getString("image_path"));
                
                books.add(book);
            }
            
            System.out.println("Search for '" + searchTerm + "' returned " + books.size() + " books");
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in searchBooks: " + e.getMessage());
        }
        return books;
    }
}