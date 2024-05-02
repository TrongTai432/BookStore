
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
    <h1>Edit Book</h1>
    <form action="book?action=edit" method="post" >
        <div class="form-group">
            <label for="bookID">Book ID:</label>
            <input type="number" class="form-control" id="bookID" name="BookID" value="<%= request.getParameter("BookID") %>" required readonly>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="Name" value="<%= request.getParameter("Name") %>" required>
        </div>
        <div class="form-group">
            <label for="totalPage">Total Page:</label>
            <input type="number" class="form-control" id="totalPage" name="TotalPage" value="<%= request.getParameter("TotalPage") %>" >
        </div>
        <div class="form-group">
            <label for="type">Type:</label>
            <input type="text" class="form-control" id="type" name="Type" value="<%= request.getParameter("Type") %>" >
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="Quantity" value="<%= request.getParameter("Quantity") %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Edit</button>
    </form>
</div>

</body>
</html>


