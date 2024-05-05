<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <%@ include file="header.jsp" %>
    <script>
        $(document).ready(function() {
            $("#booklist").validate({
                onfocusout: false,
                onkeyup: false,
                rules: {
                    "Name": {
                        required: true,
                    },
                    "Quantity": {
                        required: true,
                        min: 1
                    }
                },
                messages: {
                    "Name": {
                        required: "*Name is required"
                    },
                    "Quantity": {
                        required: "*Quantity is required",
                        min: "Please enter at least 1 number"
                    }
                },

            });
        });
    </script>
    <title>New Book Form</title>
</head>
<body>

<div class="container mt-4">
    <h1>Add New Book</h1>
    <form id="booklist" action="book?action=insert" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="Name" >
        </div>
        <div class="form-group">
            <label for="totalPage">Total Page:</label>
            <input type="number" class="form-control" id="totalPage" name="TotalPage" >
        </div>
        <div class="form-group">
            <label for="type">Type:</label>
            <input type="text" class="form-control" id="type" name="Type" >
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="Quantity" >
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
