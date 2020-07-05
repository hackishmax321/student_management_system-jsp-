<%-- 
    Document   : user-profile
    Created on : Mar 24, 2019, 10:36:55 AM
    Author     : DigitalForce™
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.servlet.db.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="login-box.jsp"%>

<% 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String id = request.getParameter("g");
    int i = Integer.parseInt(id);
    con = DB.getConnection();
    //ob2.println("Connection complete!");
    st = con.createStatement();
    rs = st.executeQuery("Select form_quest.*, forum_reply.comment from form_quest,forum_reply where form_quest.ID="+i+" AND forum_reply.QuestID = form_quest.ID");
    //response.sendRedirect(request.getContextPath()+"/Panels/login-requests.jsp");
    
                                                                   

%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>UF User - Industrial Problems</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link href="css/sb-custom.css" rel="stylesheet">
  <link href="css/sb-custom-km.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="comment.css">
  
  

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
<% 
      String panelN= null;
      String display = "none", display2 = "none";
      if(session.getAttribute("user-role").toString()=="Admin") { panelN = "Admin"; display = "block";} else {panelN = "User"; display = "none";}
      
      if(session.getAttribute("user-role").toString()=="Super Admin") { panelN = "Admin"; display2 = "block";} else {panelN = "User"; display2 = "none";}
      %>
    <a class="navbar-brand mr-1" href="index.html"><%= panelN %> Panel - Industrial Problems</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="#">User:<b> <%=session.getAttribute("username").toString()%></b>
                <p class="text-muted">[<%=session.getAttribute("user-role").toString()%>]</p></a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="user-home.jsp">
          <i class="fas fa-igloo"></i></i>
          <span>Home</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="user-profile.jsp">
          <i class="fas fa-users-cog"></i>
          <span>My Profile</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="dashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="view_event.jsp">
          <i class="fas fa-calendar-week"></i>
          <span>Calender</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Programs:</h6>
          <a class="dropdown-item" href="user-events.jsp">Events</a>
          
          <a class="dropdown-item" href="user-sp-events.jsp">Special Occasions</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="industry-problem.jsp">Industry Problems</a>
          <a class="dropdown-item" href="forum-quest.jsp">University Forum</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="announcement.jsp">
          <i class="far fa-envelope"></i>
          <span>Department messages</span></a>
      </li>
      <li class="nav-item" style="display: <%= display %>">
        <a class="nav-link" href="login-requests.jsp">
          <i class="fas fa-user-graduate"></i>
          <span>Student Requests</span></a>
      </li>
      <li class="nav-item" style="display: <%= display2 %>">
        <a class="nav-link" href="login-requests.jsp">
          <i class="fas fa-users-cog"></i>
          <span>Admin Select</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="user-contact.jsp">
          <i class="fas fa-comments"></i>
          <span>Chatting Section</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="user-message.jsp">
          <i class="fas fa-inbox"></i>
          <span>Mail Box</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="personal-storage.jsp">
          <i class="fas fa-box-open"></i>
          <span>Personal Storage</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="industry-problem.jsp">Forum</a>
          </li>
          <li class="breadcrumb-item active">Discussion</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          
        </div>

        <!-- Area Chart Example-->
        

<!--display uploaded files-->
<p>
<h4>User Profile</h4>
</p>
<div class="user-box">
  <% 
      if(rs.next()){
          %>
      
  <div class="details">
    <h2><%=rs.getString(2)%></h2>
    <p><%=rs.getString(6)%></p>
    <% } %>
  </div>
</div>
  <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Comment Section</div>
  <div class="card-body">
        <div class="comment">
            <div align="right" id="example2">
                <form method="POST" action="<%=request.getContextPath()%>/AddReply" enctype="multipart/form-data">
                    <input type="hidden" name="size" value="1000000">
                    <input type="hidden" name="user" value="<%=session.getAttribute("username").toString()%>">
                    <input type="hidden" name="probid" value="<%=i%>">
                    <div align="left">
                        <div class="line"> <input type="text" placeholder="Title" name="title"><input type="file" name="file" id="ch"></div>  
                      
      
      
                <div class="line">
                  <textarea rows="5" cols="91"
                             placeholder="Say something about your Isuue..." 
                             name="comment"
                               id="Tarea" >

                  </textarea> 
                </div>

               </div>   

                <div>

                    <input type="submit" name="addissue" class="btn-success" value="Add Issue">
                </div>
                <div align="right">

                </div>
              </form>
     </div>
                   <%
    //Connection conn = null;       
    //Class.forName("com.mysql.jdbc.Driver");
    //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jweb","root","");
%>

<%
            String selectimage = "SELECT DISTINCT * FROM forum_reply where QuestID ="+i+"";
            PreparedStatement stmt1 = con.prepareStatement(selectimage);
            ResultSet rs1 = null;
            rs1 = stmt1.executeQuery();
                 
            while(rs1.next()){
               
                int ID = rs1.getInt(1);
                String comment = rs1.getString(3);
                String title = rs1.getString(4);
                String sender = rs1.getString(5);
                byte[] imgData = rs1.getBytes("image"); // blob field 
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
 %>
<li>
    <div class="frame1">
        <div>
            <form method="POST" action="DisplayComments">
                <input type="hidden" value="<%=ID%>" name="id">
                <div id="c2"></div>   
                <div id="c1"><input type="submit" value="<%=sender%>"><label><%=title%></label></div>   
               
            </form>
                <div id="im_alg"> <img src="data:image/jpeg;base64,${imgBase}"  align="center" id="im" ><br><br><br></div>
               
                 <div id="com_d">
                    <p id="com"><%=comment%></p>
                </div>   
        
        </div>
    </div>
          
</li>
<%
}
%>
 

        </div>
          
        </div>
    </div>


           
          </div>
  
  
    </div>


        
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">

          <div class="copyright text-center my-auto">

<!--display time-->


        <script>
function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('txt').innerHTML =
  h + ":" + m + ":" + s;
  var t = setTimeout(startTime, 500);
}
function checkTime(i) {
  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
  return i;
}
</script>


<body onload="startTime()">

<div id="txt"></div>


            <span>Copyright © University Forum2019</span>
          </div>
        </div>
      </footer>

    </div>


    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>

</body>

</html>
