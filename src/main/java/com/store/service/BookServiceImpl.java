package com.store.service;

import com.store.dao.BookDAO;
import com.store.dao.BookDAOImpl;
import com.store.dto.BookDTO;

import java.sql.SQLException;
import java.util.List;

public class BookServiceImpl implements  BookService {
    private BookDAO bookDAO;

    public BookServiceImpl(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.bookDAO = new BookDAOImpl(jdbcURL, jdbcUsername, jdbcPassword);
    }


    @Override
    public List<BookDTO> getAllBooks() throws SQLException {
        return this.bookDAO.getAllBooks();
    }

    @Override
    public boolean addNewBook(BookDTO newBook) throws SQLException {
        return this.bookDAO.addNewBook(newBook);
    }

    @Override
    public boolean updateBook(BookDTO book) throws SQLException {
        return this.bookDAO.updateBook(book);
    }

    @Override
    public boolean deleteBook(BookDTO book) throws SQLException {
        return this.bookDAO.deleteBook(book);
    }

    @Override
    public BookDTO getBookById(int bookID) throws SQLException {
        return this.bookDAO.getBookById(bookID);
    }
}
