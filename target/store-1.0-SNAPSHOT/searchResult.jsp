

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.common.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.PreparedStatement" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <script src="js/base.js"></script>
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            // Get search parameters from Ajax request
            String timKiem = request.getParameter("TimKiem");
            String borrowDate = request.getParameter("borrowDate");

            // SQL query string to get data
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
            try {
                Connection conn = DBConnect.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql);
                for (int i = 0; i < params.size(); i++) {
                    stmt.setObject(i + 1, params.get(i));
                }
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("BookID") + "</td>");
                    out.println("<td>" + rs.getString("StudentName") + "</td>");
                    out.println("<td>" + rs.getDate("BorrowDate") + "</td>");
                    out.println("<td>" + rs.getInt("StudentID") + "</td>");
                    out.println("<td>" + rs.getString("BookName") + "</td>");
                    out.println("<td>" + rs.getInt("Quantity") + "</td>");
                    out.println("</tr>");
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        </tbody>
    </table>
</div>
</body>
</html>
