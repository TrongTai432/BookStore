<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <script src="js/base.js"></script>
    <title>New Borrow Form</title>
</head>
<body>
<div class="container mt-4">
    <h1>Add New Borrow</h1>
    <form id="borrowlist" action="borrow?action=insert" method="post">
        <div class="form-group">
            <label for="borrowID">Borrow ID:</label>
            <input type="number" class="form-control" id="borrowID" name="BorrowID" >
        </div>
        <div class="form-group">
            <label for="studentID">Student ID:</label>
            <select class="form-control" id="studentID" name="StudentID">
                <option value="">Choose Student ID</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bookstore", "root", "123456");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT StudentID FROM students");
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt("StudentID") %>"><%= rs.getInt("StudentID") %></option>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label for="bookID">Book ID:</label>
            <select class="form-control" id="bookID" name="BookID">
                <option value="">Choose Book ID</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Bookstore", "root", "123456");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT BookID FROM books");
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt("BookID") %>"><%= rs.getInt("BookID") %></option>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="Quantity">
        </div>
        <div class="form-group">
            <label for="borrowDate">Borrow Date:</label>
            <input type="date" class="form-control" id="borrowDate" name="BorrowDate" >
        </div>
        <button type="submit" class="btn btn-primary" >Submit</button>
    </form>
</div>
</body>
</html>
