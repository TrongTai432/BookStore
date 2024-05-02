
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
                var studentID = $(this).attr('data-id');
                var deleteUrl = 'student?action=delete&studentID=' + studentID;
                $('#deleteLink').attr('href', deleteUrl);
            });
        });
    </script>
    <%@ include file="header.jsp" %>
</head>
<body>
<div>
    <h2>List of Students</h2>
    <div class="tab-content mt-3">
        <div id="form-container">
            <table class="table">
                <thead>
                <tr>
                    <th>StudentID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Actions</th>
                    <th><button class="btn"><a href="student?action=new">Add New Student</a></button></th>
                </tr>
                </thead>
                <c:forEach var="student" items="${listStudent}">
                    <tr>
                        <td><c:out value="${student.studentID}" /></td>
                        <td><c:out value="${student.name}" /></td>
                        <td><c:out value="${student.age}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${student.gender}">
                                    Male
                                </c:when>
                                <c:otherwise>
                                    Female
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <a href="student?action=edit&studentID=${student.studentID}&name=${student.name}&age=${student.age}&gender=${student.gender}">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#" data-id="${student.studentID}" data-toggle="modal" data-target="#deleteModal" class="delete-btn">Delete</a>
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
                Are you sure you want to delete this student?
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
