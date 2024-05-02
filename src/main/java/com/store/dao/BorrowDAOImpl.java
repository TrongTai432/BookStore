package com.store.dao;

import com.store.common.DBConnect;
import com.store.dto.BorrowDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BorrowDAOImpl implements BorrowDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public BorrowDAOImpl(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        super();
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    public void connect() throws SQLException {
        DBConnect.getConnection();
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    @Override
    public List<BorrowDTO> getAllBorrows() throws SQLException {
        List<BorrowDTO> listBorrow = new ArrayList<>();
        String sql = "SELECT * FROM borrows";
        try (Connection conn = DBConnect.getConnection();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                int borrowID = resultSet.getInt("BorrowID");
                int studentID = resultSet.getInt("StudentID");
                int bookID = resultSet.getInt("BookID");
                int quantity = resultSet.getInt("Quantity");
                Date borrowDate = resultSet.getDate("BorrowDate");
                BorrowDTO borrow = new BorrowDTO(borrowID,studentID,bookID,quantity,borrowDate);
                listBorrow.add(borrow);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving all borrows: " + e.getMessage());
        }
        return listBorrow;
    }

    public boolean addNewBorrow(BorrowDTO newBorrow) throws SQLException {
        String sqlInsert = "INSERT INTO borrows (BorrowID, StudentID, BookID, Quantity, BorrowDate) VALUES (?, ?, ?, ?, ?)";
        connect();
        PreparedStatement statement = jdbcConnection.prepareStatement(sqlInsert);

        statement.setInt(1, newBorrow.getBorrowID());
        statement.setInt(2, newBorrow.getStudentID());
        statement.setInt(3, newBorrow.getBookID());
        statement.setInt(4, newBorrow.getQuantity());
        statement.setDate(5, newBorrow.getBorrowDate());
        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }


    @Override
    public boolean updateBorrow(BorrowDTO borrow) throws SQLException {
        String sql = "UPDATE borrows SET  StudentID = ?, BookID = ?,  Quantity=?, BorrowDate =?  WHERE BorrowID = ?";
        connect();
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);

        statement.setInt(1, borrow.getStudentID());
        statement.setInt(2, borrow.getBookID());
        statement.setInt(3, borrow.getQuantity());
        statement.setDate(4, borrow.getBorrowDate());
        statement.setInt(5, borrow.getBorrowID());
        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        return rowUpdated;
    }

    @Override
    public boolean deleteBorrow(BorrowDTO borrow) throws SQLException {
        String sql = "DELETE FROM borrows where BorrowID = ?";
        connect();
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, borrow.getBorrowID());
        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        return rowDeleted;
    }

    @Override
    public BorrowDTO getBorrowById(int borrowID) throws SQLException {
        BorrowDTO borrow= null;
        String sql = "SELECT * FROM borrows WHERE BorrowID = ?";
        connect();
        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, borrowID);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            int studentID = resultSet.getInt("StudentID");
            int bookID = resultSet.getInt("BookID");
            int quantity = resultSet.getInt("Quantity");
            Date borrowDate = resultSet.getDate("BorrowDate");

            borrow = new BorrowDTO(borrowID, studentID,bookID,quantity,borrowDate);
        }
        resultSet.close();
        statement.close();
        return borrow;
    }
}
