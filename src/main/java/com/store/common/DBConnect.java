package com.store.common;

import com.store.dto.StudentDTO;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class DBConnect {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Bookstore";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "123456";

    public static List<Integer> getBookIDs() {
        List<Integer> bookIDs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            String query = "SELECT BookID FROM books";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bookIDs.add(rs.getInt("BookID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookIDs;
    }

    public static List<Integer> getStudentIDs() {
        List<Integer> studentIDs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            String query = "SELECT StudentID FROM students";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                studentIDs.add(rs.getInt("StudentID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentIDs;
    }

    public static List<StudentDTO> getStudents() throws SQLException {
        List<StudentDTO> students = new ArrayList<>();
        String sql = "SELECT StudentID, StudentName FROM students";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("StudentID");
                String name = rs.getString("StudentName");
                students.add(new StudentDTO(id, name));  // Student is a custom class you need to define
            }
        }
        return students;
    }


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

