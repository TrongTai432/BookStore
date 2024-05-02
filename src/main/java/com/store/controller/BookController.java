package com.store.controller;
import com.store.dto.BookDTO;
import com.store.service.BookService;
import com.store.service.BookServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/BookController")
public class BookController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookService bookService;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("dbURL");
        String jdbcUsername = getServletContext().getInitParameter("dbUsername");
        String jdbcPassword = getServletContext().getInitParameter("dbPassword");

        this.bookService = new BookServiceImpl(jdbcURL, jdbcUsername, jdbcPassword);

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
                case "insert":
                    this.insertBook(request,response);
                    break;
                case "delete":
                    break;
                case "edit":
                    this.showEditForm(request, response);
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

    public void getListBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
        List<BookDTO> listBook = this.bookService.getAllBooks();
        request.setAttribute("listBook", listBook);
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookList.jsp");
        dispatcher.forward(request, response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("Name");
        int totalPage = Integer.parseInt(request.getParameter("TotalPage"));
        String type = request.getParameter("Type");
        int quantity = Integer.parseInt(request.getParameter("Quantity"));
        BookDTO newBook = new BookDTO(name,totalPage,type,quantity);
        this.bookService.addNewBook(newBook);
        response.sendRedirect("book");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int bookID = Integer.parseInt(request.getParameter("BookID"));
        BookDTO existingBook = this.bookService.getBookById(bookID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editBook.jsp");
        request.setAttribute("book", existingBook);
        dispatcher.forward(request, response);

    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int bookID = Integer.parseInt(request.getParameter("BookID"));
        String name = request.getParameter("Name");
        int totalPage = Integer.parseInt(request.getParameter("TotalPage"));
        String type = request.getParameter("Type");
        int quantity = Integer.parseInt(request.getParameter("Quantity"));

        BookDTO newBook = new BookDTO(bookID, name,totalPage,type,quantity);
        this.bookService.updateBook(newBook);
        response.sendRedirect("book");
    }
}
