package com.store.service;

import com.store.dao.BookDAOImpl;
import com.store.dao.BorrowDAO;
import com.store.dao.BorrowDAOImpl;
import com.store.dto.BorrowDTO;

import java.sql.SQLException;
import java.util.List;

public class BorrowServiceImpl implements  BorrowService {
    private BorrowDAO borrowDAO;

    public BorrowServiceImpl(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.borrowDAO = new BorrowDAOImpl(jdbcURL, jdbcUsername, jdbcPassword);
    }

    @Override
    public List<BorrowDTO> getAllBorrows() throws SQLException {
        return this.borrowDAO.getAllBorrows();
    }

    @Override
    public boolean addNewBorrow(BorrowDTO newBorrow) throws SQLException {
        return this.borrowDAO.addNewBorrow(newBorrow);
    }

    @Override
    public boolean updateBorrow(BorrowDTO borrow) throws SQLException {
        return this.borrowDAO.updateBorrow(borrow);
    }

    @Override
    public boolean deleteBorrow(BorrowDTO borrow) throws SQLException {
        return this.borrowDAO.deleteBorrow(borrow);
    }

    @Override
    public BorrowDTO getBorrowById(int borrowID) throws SQLException {
        return this.borrowDAO.getBorrowById(borrowID);
    }
}
