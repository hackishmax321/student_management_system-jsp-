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
  <style>
      .half-p {
          margin: 0;
          height: 100%;
          width:30%;
          padding: 20px;
          padding-top: 200px;
          background-color: white;
          position: fixed;
          float: left;
      }
      
      #left-part {
          position: relative;
          float: right;
          color:white;
          width: 600px;
          
          background-color: transparent;
      }
      
      .con-center {
          align-content: center;
          text-align: center;
          line-height: 100px;
      }
      
      .con-left {
          text-align: left;
      }
      
      .p-large {
          font-size: 180px;
      }
      
      .p-med {
          font-size: 62px;
      }
      
      .p-small {
          font-size: 32px;
      }
      
  </style>

</head>

<body class="bg-dark">

  <div class="container">
      <div class="half-p">
          <div class="con-center">
              <p class="p-large">Error</p>
              <p class="p-med">Has Occurred</p>
          </div>
          
      </div>
      <div class="half-p" id="left-part">
          <div class="con-left">
              <p class="p-small">Error is</p>
              <p class="p-med">Has Occurred</p>
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
