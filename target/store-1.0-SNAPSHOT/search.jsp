
<%@ page import="com.store.common.DBConnect" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Borrow Information</title>
    <script src="js/base.js"></script>
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#searchForm").submit(function(event){
                event.preventDefault();
                var searchData = {
                    TimKiem: $("#timkiem").val(),
                    borrowDate: $("#borrowDate").val()
                };
                $.ajax({
                    type: "GET",
                    url: "searchResult.jsp",
                    data: searchData,
                    success: function(response){
                        $("#borrowTable tbody").html(response);
                    }
                });
            });
        });
    </script>
</head>
<body>

<div class="container mt-4">
    <h2>Search Borrow Information</h2>
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
        </tbody>

    </table>

</div>
</body>
</html>
