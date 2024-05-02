package com.store.dao;
import com.store.common.DBConnect;
import com.store.dto.BookDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public BookDAOImpl(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        super();
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    protected void connect() throws SQLException {
        DBConnect.getConnection();
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    @Override
    public List<BookDTO> getAllBooks() throws SQLException {
        List<BookDTO> listBook = new ArrayList<>();
        String sql = "SELECT * FROM books";
        try (Connection conn = DBConnect.getConnection();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                int bookid = resultSet.getInt("BookID");
                String name = resultSet.getString("Name");
                int totalpage = resultSet.getInt("TotalPage");
                String type = resultSet.getString("Type");
                int quantity = resultSet.getInt("Quantity");
                BookDTO book = new BookDTO(bookid, name, totalpage, type, quantity);
                listBook.add(book);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving all books: " + e.getMessage());
        }
        return listBook;
    }

    @Override
    public boolean addNewBook(BookDTO newBook) throws SQLException {
        String sqlInsert = "INSERT INTO books (Name, TotalPage, Type, Quantity) VALUES (?, ?, ?, ?)";
        Connection conn = DBConnect.getConnection();
        PreparedStatement statement = conn.prepareStatement(sqlInsert);
        statement.setString(1, newBook.getName());
        statement.setInt(2, newBook.getTotalPage());
        statement.setString(3, newBook.getType());
        statement.setInt(4, newBook.getQuantity());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    @Override
    public boolean updateBook(BookDTO book) throws SQLException {
        String sql = "UPDATE books SET  Name = ?, TotalPage = ?, Type = ?, Quantity= ?  WHERE BookID = ?";
        Connection conn = DBConnect.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, book.getName());
        statement.setInt(2, book.getTotalPage());
        statement.setString(3, book.getType());
        statement.setInt(4, book.getQuantity());
        statement.setInt(5, book.getBookID());
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;
    }

    @Override
    public boolean deleteBook(int bookID) throws SQLException {
        String sql = "DELETE FROM books where BookID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        boolean rowDeleted = false;

        try {
            conn = DBConnect.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setInt(1, bookID);
            rowDeleted = statement.executeUpdate() > 0;
        } finally {
            if (statement != null) {
                statement.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return rowDeleted;
    }


    @Override
    public BookDTO getBookById(int bookID) throws SQLException {
        BookDTO book= null;
        String sql = "SELECT * FROM books WHERE BookID = ?";
        Connection conn = DBConnect.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, bookID);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String name = resultSet.getString("Name");
            int totalPage = resultSet.getInt("TotalPage");
            String type = resultSet.getString("Type");
            int quantity = resultSet.getInt("Quantity");

            book = new BookDTO(bookID, name, totalPage, type, quantity);
        }
        resultSet.close();
        statement.close();
        return book;
    }
}
