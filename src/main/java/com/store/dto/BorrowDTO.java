package com.store.dto;

import java.sql.Date;

public class BorrowDTO {
    public int BorrowID;
    public int StudentID;
    public int BookID;
    public int Quantity;
    public Date BorrowDate;

    public BorrowDTO() {
    }

    public BorrowDTO(int borrowID, int studentID, int bookID, int quantity, Date borrowDate) {
        BorrowID = borrowID;
        StudentID = studentID;
        BookID = bookID;
        Quantity = quantity;
        BorrowDate = borrowDate;
    }

    public BorrowDTO(int studentID, int bookID, int quantity, Date borrowDate) {
        StudentID = studentID;
        BookID = bookID;
        Quantity = quantity;
        BorrowDate = borrowDate;
    }

    public int getBorrowID() {
        return BorrowID;
    }

    public void setBorrowID(int borrowID) {
        BorrowID = borrowID;
    }

    public int getStudentID() {
        return StudentID;
    }

    public void setStudentID(int studentID) {
        StudentID = studentID;
    }

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int bookID) {
        BookID = bookID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public Date getBorrowDate() {
        return BorrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        BorrowDate = borrowDate;
    }
}
