<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users | Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style><%@include file="WEB-INF/css/styles.css"%></style>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>

</head>
<body>

    <!-- Sidebar -->
    <%@ include file="WEB-INF/includes/sidebar.jsp" %>

    <!-- Main Content -->
    <div class="content" id="mainContent">
        <!-- Top Header -->
        <%@ include file="WEB-INF/includes/header.jsp" %>

        <!-- Body Content: Manage Users -->
        <div class="container-fluid py-4">
            <h1 class="mb-4">Manage Users</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.role}</td>
                            <td>${user.status}</td>
                            <td>
                                <a href="user?action=delete&user_id=${user.userId}" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Footer -->
        <%@ include file="WEB-INF/includes/footer.jsp" %>

    </div>

    <script>
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('mainContent');
        const sidebarToggler = document.getElementById('sidebarToggler');

        sidebarToggler.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('collapsed');
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-qkbL6a/hm81GCUoQ9OeGV3RABhR4bUPP6gD9KnBFrbM5G8eSH8lFZvg97vK87fj1" crossorigin="anonymous"></script>
</body>
</html>
