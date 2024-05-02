
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                            <a href="borrow?action=edit&id=<c:out value='${borrow.borrowID}' />">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="borrow?action=delete&id=<c:out value='${borrow.borrowID}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
