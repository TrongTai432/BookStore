
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/base.js"></script>
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
                    <th><button class="btn"><a href="book?action=new">Add New Book</a></button></th>
                </tr>
                </thead>
                <c:forEach var="book" items="${listBook}">
                    <tr>
                        <td><c:out value="${book.bookID}" /></td>
                        <td><c:out value="${book.name}" /></td>
                        <td><c:out value="${book.totalPage}" /></td>
                        <td><c:out value="${book.type}" /></td>
                        <td><c:out value="${book.quantity}" /></td>
                        <td>
                            <a href="book?action=edit&bookID=${book.bookID}&name=${book.name}&totalPage=${book.totalPage}&type=${book.type}&quantity=${book.quantity}">
                                Edit
                            </a>
                            <a href="book?action=delete&bookID=<c:out value='${book.bookID}' />" data-id="${book.bookID}" data-toggle="modal" data-target="#deleteModal" class="delete-btn">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    </div>
<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm deletion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this book?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a href="#" class="btn btn-danger" id="deleteLink">Delete</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
