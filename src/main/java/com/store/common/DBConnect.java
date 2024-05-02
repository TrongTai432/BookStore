package com.store.common;

import java.sql.*;

public class DBConnect {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Bookstore";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "123456";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        return conn;
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static ResultSet getData() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bookstore", "root", "123456");
            PreparedStatement stmt = conn.prepareStatement("SELECT  books.BookID,students.Name AS StudentName ,borrows.BorrowDate, students.StudentID,books.Name AS BookName, borrows.Quantity FROM borrows INNER JOIN students ON borrows.StudentID = students.StudentID INNER JOIN books ON borrows.BookID = books.BookID");
            return stmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

