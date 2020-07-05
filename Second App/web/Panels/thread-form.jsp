<%-- 
    Document   : login-box
    Created on : Mar 26, 2019, 7:43:30 PM
    Author     : DigitalForce™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <%   
        String sender = request.getParameter("g");
  %>

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Insert a Forum Thread</div>
      <div class="card-body">
          <form action="<%=request.getContextPath()%>/InsertThread" >
              
              
          <div class="form-group">
            <div>
                <input type="hidden" name="sender" value="<%=sender%>">
                <input type="text" name="pname"  class="form-control" placeholder="Thread Title" >
              
            </div>
          </div>
          
          <div class="form-group">
            <div>
                <textarea cols="48" rows="10" name="desc" class="form-control" placeholder="Description" ></textarea>
              
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              
            </div>
          </div>
          <!--<a class="btn btn-primary btn-block" href="#" name="sub-btn">Login</a>-->
          <input type="submit" class="btn btn-primary btn-block" name="sub-btn" value="Submit">
        </form>
        
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
