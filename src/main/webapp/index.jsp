<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style><%@include file="WEB-INF/css/styles.css"%></style>
    <title>Admin Dashboard | Car Web App</title>
</head>
<body>
    <!-- Sidebar -->
    <%@include file="WEB-INF/includes/sidebar.jsp" %>

    <!-- Main Content -->
    <div class="content" id="mainContent">
        <!-- Top Header -->
        <%@include file="WEB-INF/includes/header.jsp" %>

        <!-- Body Content -->
        <div class="container-fluid py-4">
            <h1 class="mb-4">Dashboard Overview</h1>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <h5 class="card-title">Total Users</h5>
                            <p class="card-text">150</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <h5 class="card-title">Total Reservations</h5>
                            <p class="card-text">320</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-warning">
                        <div class="card-body">
                            <h5 class="card-title">Available Slots</h5>
                            <p class="card-text">45</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-danger">
                        <div class="card-body">
                            <h5 class="card-title">Total Payments</h5>
                            <p class="card-text">$12,345</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="WEB-INF/includes/footer.jsp" %>

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
