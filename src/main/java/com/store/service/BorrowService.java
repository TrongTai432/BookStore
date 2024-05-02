package com.store.service;

import com.store.dto.BorrowDTO;

import java.sql.SQLException;
import java.util.List;

public interface BorrowService {
    List<BorrowDTO> getAllBorrows() throws SQLException;
    boolean addNewBorrow(BorrowDTO newBorrow) throws SQLException;
    boolean updateBorrow(BorrowDTO borrow) throws SQLException;
    boolean deleteBorrow(BorrowDTO borrow) throws SQLException;
    BorrowDTO getBorrowById(int borrowID) throws SQLException;
}
