<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.store.common.DBConnect" %>
<%@ page import="com.store.dto.StudentDTO" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WEB-INF/css/base.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag@3.0.1/dist/css/multi-select-tag.css">
    <script>
        $(document).ready(function() {
            $('#bookID').change(function() {
                var selectedBookIDs = $(this).val();
                console.log(selectedBookIDs);
            });
        });
    </script>
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
            <select class="form-control" id="studentID" name="studentID">
                <option value="">Choose Student ID</option>
                <% List<Integer> studentIDs = DBConnect.getStudentIDs();
                    for (Integer studentID : studentIDs) { %>
                <option value="<%= studentID %>"><%= studentID %></option>
                <% } %>
            </select>
        </div>


            <div class="form-group">
            <label for="bookID">Book ID:</label>
            <select class="form-control" id="bookID" name="bookID[]" multiple>
                <% List<Integer> bookIDs = DBConnect.getBookIDs();
                    for (Integer bookID : bookIDs) { %>
                <option value="<%= bookID %>"><%= bookID %></option>
                <% } %>
            </select>
        </div>


        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="quantity">
        </div>
        <div class="form-group">
            <label for="borrowDate">Borrow Date:</label>
            <input type="date" class="form-control" id="borrowDate" name="borrowDate" >
        </div>
        <button type="submit" class="btn btn-primary" >Submit</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/gh/habibmhamadi/multi-select-tag@3.0.1/dist/js/multi-select-tag.js"></script>
<script>
    new MultiSelectTag('bookID')
</script>
</body>
</html>
