package com.store.controller;

import com.store.dao.BookDAO;
import com.store.dao.BookDAOImpl;
import com.store.dto.BookDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BookController", value = "/BookController")
public class BookController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private BookDAOImpl book;

    public void init() {
        book = new BookDAOImpl("jdbc:mysql://localhost:3306/Bookstore", "root", "123456");
    }
    public BookController(){

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "none";
        try {
            switch (action) {
                case "new":
                    RequestDispatcher dispatcher = request.getRequestDispatcher("newBookForm.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "edit":
                    int bookID = Integer.parseInt(request.getParameter("BookID"));
                    String name = request.getParameter("Name");
                    int totalPage = Integer.parseInt(request.getParameter("TotalPage"));
                    String type = request.getParameter("Type");
                    int quantity = Integer.parseInt(request.getParameter("Quantity"));
                    BookDTO newBook = new BookDTO(bookID,name,totalPage,type,quantity);
                    this.book.updateBook(newBook);
                    response.sendRedirect("BookController");
                    break;
                case "delete":
                    break;
                case "insert":
                    insertBook(request, response);
                    break;
                case "update":
                    this.updateBook(request, response);
                    break;
                default:
                    this.getListBook(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void getListBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
        List<BookDTO> listBook = this.book.getAllBooks();
        request.setAttribute("listBook", listBook);
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookList.jsp");
        dispatcher.forward(request, response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int bookID = Integer.parseInt(request.getParameter("BookID"));
        String name = request.getParameter("Name");
        int totalPage = Integer.parseInt(request.getParameter("TotalPage"));
        String type = request.getParameter("Type");
        int quantity = Integer.parseInt(request.getParameter("Quantity"));

        BookDTO newBook = new BookDTO(bookID,name,totalPage,type,quantity);
        book.addNewBook(newBook);
        response.sendRedirect("book");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int bookid = Integer.parseInt(request.getParameter("bookID"));
        BookDTO existingBook = this.book.getBookById(bookid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("newBookForm.jsp");
        request.setAttribute("book", existingBook);
        dispatcher.forward(request, response);

    }
    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int bookID = Integer.parseInt(request.getParameter("BookID"));
        String name = request.getParameter("Name");
        int totalPage = Integer.parseInt(request.getParameter("TotalPage"));
        String type = request.getParameter("Type");
        int quantity = Integer.parseInt(request.getParameter("Quantity"));

        BookDTO newBook = new BookDTO(bookID,name,totalPage,type,quantity);
        this.book.updateBook(newBook);
        response.sendRedirect("BookController");
    }
}
