<%@ page import="com.store.common.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.store.controller.BookController" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%@ include file="header.jsp" %>
</head>
<body>
<div>
    <h2>List of Books</h2>
    <div class="tab-content mt-3">
        <div id="form-container">
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
                <c:forEach var="book" items="${listBook}">
                    <tr>
                        <td><c:out value="${book.BookID}" /></td>
                        <td><c:out value="${book.Name}" /></td>
                        <td><c:out value="${book.TotalPage}" /></td>
                        <td><c:out value="${book.Type}" /></td>
                        <td><c:out value="${book.Quantity}" /></td>
                        <td>
                            <a href="BookController?action=edit&id=<c:out value='${book.bookID}' />">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="BookController?action=delete&id=<c:out value='${book.bookID}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    </div>
</body>
</html>
