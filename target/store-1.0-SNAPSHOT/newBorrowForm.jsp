<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.common.DBConnect" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WEB-INF/css/base.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#borrowlist").validate({
                onfocusout: false,
                onkeyup: false,
                rules: {
                    "StudentID": {
                        required: true,
                        maxlength: 10
                    },
                    "BookID": {
                        required: true,
                        min: 1
                    },
                    "Quantity": {
                        required: true,
                        min: 1
                    }
                },
                messages: {
                    "StudentID": {
                        required: "*StudentID is required",
                        maxlength: "Please enter up to 10 characters"
                    },
                    "BookID": {
                        required: "*BookID is required",
                        maxlength: "Please enter up to 10 characters"
                    },
                    "Quantity": {
                        required: "*Quantity is required",
                        min: "Please enter at least 1 number"
                    }
                }
            });
        });
    </script>
    <title>New Borrow Form</title>
</head>
<body>
<div class="container mt-4">
    <h1>Add New Borrow</h1>
    <form id="borrowlist" action="borrow?action=insert" method="post">
        <div class="form-group">
            <label for="studentID">Student ID:</label>
            <select class="form-control" id="studentID" name="StudentID">
                <option value="">Choose Student ID</option>
                <% List<Integer> studentIDs = DBConnect.getStudentIDs();
                    for (Integer studentID : studentIDs) { %>
                <option value="<%= studentID %>"><%= studentID %></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="bookID">Book ID:</label>
            <select class="form-control" id="bookID" name="BookID">
                <option value="">Choose Book ID</option>
                <% List<Integer> bookIDs = DBConnect.getBookIDs();
                    for (Integer bookID : bookIDs) { %>
                <option value="<%= bookID %>"><%= bookID %></option>
                <% } %>
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
