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
        String i = request.getParameter("id");
        String pro = request.getParameter("name");
        String leader = request.getParameter("lead");
        

        int Id  = Integer.parseInt(i);
        
  %>

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Insert Required details on Project</div>
      <div class="card-body">
          <p>Following details, need to fill by individuals which </p>
          <form action="<%=request.getContextPath()%>/AlloxateProblem" >
              
              
          <div class="form-group">
            <div>
                <input type="hidden" name="proid" value="<%=Id%>">
                <input type="text" name="pname"  class="form-control" placeholder="Name" value="<%=pro%>" readonly>
              
            </div>
          </div>
              
          <div class="form-group">
            <div>
                <input type="text" name="leader" class="form-control" placeholder="" value ="<%=leader%>" readonly>
              
            </div>
          </div>
              
          <div class="form-group">
            <div>
                <input type="text" name="mem2" class="form-control" placeholder="Participant 01" value ="">
              
            </div>
          </div>
              
          <div class="form-group">
            <div>
                <input type="text" name="mem3" class="form-control" placeholder="Participant 02" value ="">
              
            </div>
          </div>
              
          <div class="form-group">
            <div>
                <input type="text" name="mem4" class="form-control" placeholder="Participant 03" value ="">
              
            </div>
          </div>
              
          <div class="form-group">
            <div>
                <input type="text" name="mem5" class="form-control" placeholder="Participant 04" value ="">
              
            </div>
          </div>
              
          <div class="form-group">
            <div>
                <input type="text" name="academic" class="form-control" placeholder="Accademic Supervisor" value ="">
              
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
