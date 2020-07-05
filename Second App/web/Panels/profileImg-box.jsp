<%-- 
    Document   : login-box
    Created on : Mar 26, 2019, 7:43:30 PM
    Author     : DigitalForce™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String user = request.getParameter("i");
    String role = request.getParameter("j");

%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Avatar Upload</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Upload a Avatar</div>
      <div class="card-body">
          <form action="<%=request.getContextPath()%>/UserImgServe" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <div class="form-label-group">
                <input type="text" name="uname" id="inputEmail" class="form-control" value="<%=user%>" required="required" autofocus="autofocus" readonly>
              <label for="inputEmail">Username</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
                <input type="text" name="role" id="inputEmail" class="form-control" value="<%=role%>" required="required" autofocus="autofocus" readonly>
              <label for="inputEmail">Role</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="file" name="file" id="inputPassword" class="form-control">
              <label for="inputPassword">Avatar</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              
            </div>
          </div>
          <!--<a class="btn btn-primary btn-block" href="#" name="sub-btn">Login</a>-->
          <input type="submit" class="btn btn-primary btn-block" name="sub-btn" value="Upload">
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="user-profile.jsp">Go Back</a>
          
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
