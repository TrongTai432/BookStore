package com.store.dao;

import com.store.dto.BookDTO;

import java.sql.SQLException;
import java.util.List;

public interface BookDAO {
    List<BookDTO> getAllBooks() throws SQLException;
    boolean addNewBook(BookDTO newBook) throws SQLException;
    boolean updateBook(BookDTO book) throws SQLException;
    boolean deleteBook(int bookID)throws SQLException;
    BookDTO getBookById(int bookID) throws SQLException;
}
