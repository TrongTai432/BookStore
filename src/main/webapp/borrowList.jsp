
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.delete-btn').click(function() {
                var borrowID = $(this).attr('data-id');
                var deleteUrl = 'borrow?action=delete&borrowID=' + borrowID;
                $('#deleteLink').attr('href', deleteUrl);
            });
        });
    </script>
    <%@ include file="header.jsp" %>
</head>
<body>
<div>
    <h2>List of Borrows</h2>
    <div class="tab-content mt-3">
        <div id="form-container">
            <table class="table">
                <thead>
                <tr>
                    <th>BorrowID</th>
                    <th>StudentID</th>
                    <th>BookID</th>
                    <th>Quantity</th>
                    <th>BorrowDate</th>
                    <th>Actions</th>
                    <th><button class="btn"><a href="borrow?action=new">Add New Borrow</a></button></th>
                </tr>
                </thead>
                <c:forEach var="borrow" items="${listBorrow}">
                    <tr>
                        <td><c:out value="${borrow.borrowID}" /></td>
                        <td><c:out value="${borrow.studentID}" /></td>
                        <td><c:out value="${borrow.bookID}" /></td>
                        <td><c:out value="${borrow.quantity}" /></td>
                        <td><c:out value="${borrow.borrowDate}" /></td>
                        <td>
                            <a href="borrow?action=edit&borrowID=${borrow.borrowID}&studentID=${borrow.studentID}&bookID=${borrow.bookID}&quantity=${borrow.quantity}&borrowDate=${borrow.borrowDate}" class="btn btn-primary" role="button">
                                Edit
                            </a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#" data-id="${borrow.borrowID}" data-toggle="modal" data-target="#deleteModal" class="delete-btn btn btn-danger"  role="button">
                                Delete
                            </a>
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
                Are you sure you want to delete this borrow?
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
