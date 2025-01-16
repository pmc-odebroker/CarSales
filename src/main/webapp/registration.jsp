<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>
        Car Web App
    </title>
</head>
<body>
<div class="container">
    <div class="row pt-5">
        <div class="col-md-3">
            <%@include file="WEB-INF/includes/slidebar.jsp" %>

        </div>
        <div class="col-md-9">
            <h2>Registration</h2>
            <hr/>
            <div class="col-md-9">
                <form action="register" method="post">
                    <div class="mb-3">
                        <label for="exampleInputName" class="form-label">Email address</label>
                        <input type="email" class="form-control" name="name" id="exampleInputName" placeholder="Enter Name">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputMobile" class="form-label">Password</label>
                        <input type="password" class="form-control" name="mobile" id="exampleInputMobile" placeholder="Enter Mobile">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail" class="form-label">Email address</label>
                        <input type="email" class="form-control" name="email" id="exampleInputEmail" placeholder="Enter Email">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="exampleInputPassword" placeholder="Enter Password">
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputPhoto" class="form-label">Password</label>
                        <input type="file" class="form-control" name="photo" id="exampleInputPhoto">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>

</div>

</body>
</html>
