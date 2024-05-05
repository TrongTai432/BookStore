package com.store.controller;

import com.store.common.DBConnect;
import com.store.dto.BorrowDTO;
import com.store.service.BorrowService;
import com.store.service.BorrowServiceImpl;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/BorrowController")
public class BorrowController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BorrowService borrowService;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("dbURL");
        String jdbcUsername = getServletContext().getInitParameter("dbUsername");
        String jdbcPassword = getServletContext().getInitParameter("dbPassword");

        this.borrowService = new BorrowServiceImpl(jdbcURL, jdbcUsername, jdbcPassword);

    }
    public BorrowController(){

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "none";
        try {
            switch (action) {
                case "new":
                    RequestDispatcher dispatcher = request.getRequestDispatcher("newBorrowForm.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "insert":
                    this.insertBorrow(request, response);
                    break;
                case "edit":
                    this.showEditBorrowForm(request, response);
                    break;
                case "update":
                    this.updateBorrow(request, response);
                    break;
                case "delete":
                    int borrowID = Integer.parseInt(request.getParameter("borrowID"));
                    borrowService.deleteBorrow(borrowID);
                    response.sendRedirect("borrow");
                    break;
                default:
                    listBorrows(request, response);
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listBorrows(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<BorrowDTO> listBorrow = this.borrowService.getAllBorrows();
        request.setAttribute("listBorrow", listBorrow);
        RequestDispatcher dispatcher = request.getRequestDispatcher("borrowList.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditBorrowForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int borrowID = Integer.parseInt(request.getParameter("borrowID"));
        BorrowDTO existingBorrow = this.borrowService.getBorrowById(borrowID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editBorrow.jsp");
        request.setAttribute("borrow", existingBorrow);
        dispatcher.forward(request, response);
    }

    private void insertBorrow(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        String[] bookIDs = request.getParameterValues("bookID[]");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Parse BorrowDate from request
        String borrowDateStr = request.getParameter("borrowDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date borrowDate = null;
        try {
            java.util.Date utilDate = dateFormat.parse(borrowDateStr);
            borrowDate = new java.sql.Date(utilDate.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }

        for (String bookIDStr : bookIDs) {
            int bookID = Integer.parseInt(bookIDStr);
            updateBookQuantity(bookID, quantity);

            BorrowDTO newBorrow = new BorrowDTO(studentID, bookID, quantity, borrowDate);
            this.borrowService.addNewBorrow(newBorrow);
        }
        response.sendRedirect("borrow");
    }


    private void updateBorrow(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int borrowID = Integer.parseInt(request.getParameter("BorrowID"));
        int studentID = Integer.parseInt(request.getParameter("StudentID"));
        int bookID = Integer.parseInt(request.getParameter("BookID"));
        int quantity = Integer.parseInt(request.getParameter("Quantity"));
        String borrowDateStr = request.getParameter("BorrowDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date borrowDate = null;
        try {
            java.util.Date utilDate = dateFormat.parse(borrowDateStr);
            borrowDate = new java.sql.Date(utilDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        updateBookQuantity(bookID, quantity);
        BorrowDTO borrow = new BorrowDTO(borrowID, studentID, bookID, quantity, borrowDate);
        this.borrowService.updateBorrow(borrow);
        response.sendRedirect("borrow");
    }

    private void updateBookQuantity(int bookID, int borrowedQuantity) throws SQLException {
        // Get current quantity of the book
        int currentQuantity = 0;
        String sqlSelect = "SELECT Quantity FROM books WHERE BookID = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement statement = conn.prepareStatement(sqlSelect)) {
            statement.setInt(1, bookID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    currentQuantity = resultSet.getInt("Quantity");
                }
            }
        }

        // Update book quantity
        int updatedQuantity = currentQuantity - borrowedQuantity;
        String sqlUpdate = "UPDATE books SET Quantity = ? WHERE BookID = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement statement = conn.prepareStatement(sqlUpdate)) {
            statement.setInt(1, updatedQuantity);
            statement.setInt(2, bookID);
            statement.executeUpdate();
        }
    }
}
