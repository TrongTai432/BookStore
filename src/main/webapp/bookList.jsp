<%@ page import="com.store.common.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="header.jsp" %>

    <h2>List of Books</h2>
    <div class="tab-content mt-3">
        <div id="books" class="tab-pane fade show active">
            <table class="table">
                <thead>
                <tr>
                    <th>BookID</th>
                    <th>Name</th>
                    <th>TotalPage</th>
                    <th>Type</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                    <th><button class="btn"><a href="BookController?action=new">Add New Book</a></button></th>
                </tr>
                </thead>
                <tbody>
                <%
                try {
                Connection conn = DBConnect.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM books");
                while (rs.next()) {
                %>
                 <tr>
                <td><%= rs.getInt("BookID") %></td>
                <td><%= rs.getString("Name") %></td>
                <td><%= rs.getInt("TotalPage") %></td>
                <td><%= rs.getString("Type") %></td>
                <td><%= rs.getInt("Quantity") %></td>
                </tr>
                <%
                    }
                rs.close();
                stmt.close();
                DBConnect.closeConnection(conn);
                } catch (SQLException e) {
                e.printStackTrace();
                }
                %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
