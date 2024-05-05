package com.store.dao;

import com.store.dto.BorrowDTO;

import java.sql.SQLException;
import java.util.List;

public interface BorrowDAO {
    List<BorrowDTO> getAllBorrows() throws SQLException;
    boolean addNewBorrow(BorrowDTO newBorrow) throws SQLException;
    boolean updateBorrow(BorrowDTO borrow) throws SQLException;
    boolean deleteBorrow(int borrowID) throws SQLException;
    BorrowDTO getBorrowById(int borrowID) throws SQLException;
}
