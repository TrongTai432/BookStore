

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.common.DBConnect" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <script src="js/base.js"></script>
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">

    <form action="searchResult.jsp" method="get">
        <div class="form-group">
            <label for="timkiem">Student ID/Name, BookID/Name:</label>
            <input type="text" class="form-control" id="timkiem" name="TimKiem">
        </div>
        <div class="form-group">
            <label for="borrowDate">Borrow Date:</label>
            <input type="date" class="form-control" id="borrowDate" name="borrowDate">
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <h2>Search Result</h2>
    <table class="table">
        <thead>
        <tr>
            <th>BookID</th>
            <th>StudentName</th>
            <th>BorrowDate</th>
            <th>StudentID</th>
            <th>BookName</th>
            <th>Quantity of Borrow</th>
        </tr>
        </thead>
        <tbody>
        <%
            ResultSet rs = DBConnect.getData();
            if (rs != null) {
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("BookID") %></td>
            <td><%= rs.getString("StudentName") %></td>
            <td><%= rs.getDate("BorrowDate") %></td>
            <td><%= rs.getInt("StudentID") %></td>
            <td><%= rs.getString("BookName") %></td>
            <td><%= rs.getInt("Quantity") %></td>
        </tr>
        <%
                }
                rs.close();
            }
        %>
        <%
            // Nhận các tham số tìm kiếm từ yêu cầu Ajax
            String timKiem = request.getParameter("TimKiem");
            String borrowDate = request.getParameter("borrowDate");

            // Chuỗi truy vấn SQL để lấy dữ liệu
            String sql = "SELECT books.BookID, students.Name AS StudentName, borrows.BorrowDate, students.StudentID, books.Name AS BookName, borrows.Quantity " +
                    "FROM borrows " +
                    "INNER JOIN students ON borrows.StudentID = students.StudentID " +
                    "INNER JOIN books ON borrows.BookID = books.BookID ";
            List<Object> params = new ArrayList<>();
            if (timKiem != null && !timKiem.isEmpty()) {
                sql += "WHERE students.StudentID = ? OR students.Name LIKE ? OR books.BookID = ? OR books.Name LIKE ?";
                params.add(timKiem);
                params.add("%" + timKiem + "%");
                params.add(timKiem);
                params.add("%" + timKiem + "%");
            }

            if (borrowDate != null && !borrowDate.isEmpty()) {
                if (!params.isEmpty()) {
                    sql += " AND ";
                } else {
                    sql += " WHERE ";
                }
                sql += "borrows.BorrowDate = ?";
                params.add(borrowDate);
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
