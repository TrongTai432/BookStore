<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/WEB-INF/css/base.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <%@ include file="header.jsp" %>
    <script>
        $(document).ready(function() {
            $("#studentlist").validate({
                onfocusout: false,
                onkeyup: false,
                rules: {
                    "Name": {
                        required: true
                    },
                    "Age": {
                        required: true,
                        min: 1
                    }
                },
                messages: {
                    "Name": {
                        required: "*Name is required"
                    },
                    "Age": {
                        required: "*Age is required",
                        min: "Please enter at least 1 number"
                    }
                }
            });
        });
    </script>
    <title>New Student Form</title>
</head>
<body>

<div class="container mt-4">
    <h1>Add New Student</h1>
    <form id="studentlist" action="student?action=insert" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="Name" >
        </div>
        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" class="form-control" id="age" name="Age" >
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select class="form-control" id="gender" name="Gender" >
                <option value="0">Female</option>
                <option value="1">Male</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
