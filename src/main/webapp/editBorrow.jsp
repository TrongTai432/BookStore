
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%@ include file="header.jsp" %>
    <title>Edit Book</title>
</head>
<body>
<div class="container mt-4">
    <h1>Edit Borrow</h1>
    <form action="borrow?action=update" method="post" >
        <div class="form-group">
            <label for="borrowID">Borrow ID:</label>
            <input type="number" class="form-control" id="borrowID" name="BorrowID" value="<%= request.getParameter("borrowID") %>" readonly >
        </div>
        <div class="form-group">
            <label for="studentID">Student ID:</label>
            <input type="number" class="form-control" id="studentID" name="StudentID" value="<%= request.getParameter("studentID") %>" readonly>
        </div>
        <div class="form-group">
            <label for="bookID">Book ID:</label>
            <input type="number" class="form-control" id="bookID" name="BookID" value="<%= request.getParameter("bookID") %>" readonly>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="Quantity" value="<%= request.getParameter("quantity") %>">
        </div>
        <div class="form-group">
            <label for="borrowDate">Borrow Date:</label>
            <input type="date" class="form-control" id="borrowDate" name="BorrowDate" value="<%= request.getParameter("borrowDate") %>" >
        </div>
        <button type="submit" class="btn btn-primary">Edit</button>
    </form>
</div>

</body>
</html>


