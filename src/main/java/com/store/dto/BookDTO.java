package com.store.dto;

public class BookDTO {
    public int BookID;
    public  String Name;
    public int TotalPage;
    public  String Type;
    public int Quantity;

    public BookDTO() {
    }

    public BookDTO(int bookID, String name, int totalPage, String type, int quantity) {
        BookID = bookID;
        Name = name;
        TotalPage = totalPage;
        Type = type;
        Quantity = quantity;
    }

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int bookID) {
        BookID = bookID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getTotalPage() {
        return TotalPage;
    }

    public void setTotalPage(int totalPage) {
        TotalPage = totalPage;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }
}
