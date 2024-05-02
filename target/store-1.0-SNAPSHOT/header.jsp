<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="index">Homepage</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="student">Students</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="book">Books</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="borrow">Borrows</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="search.jsp">Search Borrows</a>
        </li>
    </ul>
</div>
</body>
</html>
