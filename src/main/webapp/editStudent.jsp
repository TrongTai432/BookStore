
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%@ include file="header.jsp" %>
    <title>Edit Student</title>
</head>
<body>
<div class="container mt-4">
    <h1>Edit Student</h1>
    <form action="student?action=update" method="post" >
        <div class="form-group">
            <label for="studentID">Student ID:</label>
            <input type="number" class="form-control" id="studentID" name="studentID" value="<%= request.getParameter("studentID") %>" readonly>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= request.getParameter("name") %>">
        </div>
        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" class="form-control" id="age" name="age" value="<%= request.getParameter("age") %>">
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <input type="text" class="form-control" id="gender" name="gender" value="<%= (request.getParameter("gender").equals("true")) ? "Male" : "Female" %>" readonly>
        </div>


        <button type="submit" class="btn btn-primary">Edit</button>
    </form>
</div>

</body>
</html>


