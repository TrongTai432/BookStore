
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
                            <a href="student?action=delete&id=<c:out value='${student.studentID}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
