<%-- 
    Document   : personal-storage
    Created on : Mar 31, 2019, 7:49:57 PM
    Author     : DigitalForce™
--%>

<%@page import="com.servlet.db.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.servlet.db.DB2_FileUp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="login-box.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>UF User - Personal Storage</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="comment.css">
  <link href="css/form-style.css" rel="stylesheet" type="text/css">
  
  <%   
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    int x = 0;
  
  
  %>

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
<% 
      String panelN= null;
      String display = "none", display2 = "none";
      if(session.getAttribute("user-role").toString()=="Admin") { panelN = "Admin"; display = "block";} else {panelN = "User"; display = "none";}
      
      if(session.getAttribute("user-role").toString()=="Super Admin") { panelN = "Admin"; display2 = "block";} else {panelN = "User"; display2 = "none";}
      %>
    <a class="navbar-brand mr-1" href="index.html"><%= panelN %> Panel - Personal Storage</a>

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
          <%
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("Select COUNT(*) from announcements");
                int d = 0;
                if(rs.next()){
                    d = rs.getInt(1);
                    
                }
                    for(int i = 0; i <=3; i++){
                        rs = st.executeQuery("Select announcements.*, identified_university.Name from announcements,identified_university where identified_university.UniID= announcements.UniversityID AND identified_university.Name = '"+session.getAttribute("university").toString()+"' AND id="+(d-i)+" ");
                        if(rs.next()){
                            
                       
                    %>  
                    <a class="dropdown-item" href="#"><%=rs.getString(2) %></a>
                    
            <%
                 }
                    }
            %>
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
            <a href="user-home.jsp">Home</a>
          </li>
          <li class="breadcrumb-item active">Department Announcements</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row" style="padding: 17px;" style="display:<%= display %>; ">
          <div class="card mb-3" id="form-box">
          <div class="card-header" style="display:<%= display %>; ">
            <i class="fas fa-chart-area"></i>
            Send Announcement</div>
          <div class="card-body" style="display:<%= display %>; ">
            <center>
                
               
                                                                        
                                                                       
        
                <form method="POST" action="<%=request.getContextPath()%>/SendAnnouncement"> 
                    <input type="hidden" name="sender" value="<%=session.getAttribute("username").toString()%>">
                     <%  
            try{
                                                                        
                                                                    
                                                                    con = DB.getConnection();
                                                                    //ob2.println("Connection complete!");
                                                                    st = con.createStatement(); 
                                                                    
                                                                    rs = st.executeQuery("Select UniID from identified_university where Name = '"+session.getAttribute("university").toString()+"' ");
                                                                    if(rs.next()){
                                                                        x = rs.getInt("UniID");    
                                                                        System.out.println("Ans" + x);
                     %>
                    
                    <%
                                                                    }
            } catch(Exception ex) {
                
            }
                
                %>
                    <input type="hidden" name="uni" value="<%=x%>">
                    <input type="text" placeholder="Your Announcement" name="announcement">
                    <select name="acategory" >
                        <option id="option" value="Undergraduate">Undergraduate</option>
                        <option id="option" value="Staff">University Staff</option>
                        <option id="option" value="Industry">Industry</option>
                    </select>
                    <input type="submit" value="POST">
 
                </form>
                    
                    
        
    </center>
          </div></div>
        </div>

        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Announcement Section</div>
          
            
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>No.</th>
                    <th>From</th>
                    <th>Description</th>
                    
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                    <th>No.</th>
                    <th>From</th>
                    <th>Description</th>
                    
                  </tr>
                </tfoot>
                <tbody>
                    
                    <%  
            try{
                                                                        
                                                                    con = DB.getConnection();
                                                                    st = con.createStatement();
                                                                    rs = st.executeQuery("Select COUNT(*) from announcements");
                                                                    int e = 0;
                                                                    if(rs.next()){
                                                                        e = rs.getInt(1);

                                                                    }
                                                                        for(int i = 0; i <=e; i++){
                                                                            if(session.getAttribute("user-role")=="Admin"){
                                                                               rs = st.executeQuery("Select announcements.*, identified_university.Name from announcements,identified_university where identified_university.UniID= announcements.UniversityID AND identified_university.Name = '"+session.getAttribute("university").toString()+"' AND id="+(e-i)+" "); 
                                                                            } else {
                                                                               rs = st.executeQuery("Select announcements.*, identified_university.Name from announcements,identified_university where identified_university.UniID= announcements.UniversityID AND identified_university.Name = '"+session.getAttribute("university").toString()+"' AND announcements.category = '"+session.getAttribute("user-role").toString() +"' AND id="+(e-i)+" ");
                                                                             
                                                                            }
                                                                            if(rs.next()){


                                                                        %>  
                                                                            
                                                                            <tr>
                                                                                <td><%=(i+1) %></td>
                                                                                <td><a href="problem-page.jsp?g=<%=rs.getString(1)%>"><%=rs.getString(5)%></a></td>
                                                                                <td><%=rs.getString(2)%></td>
                                                                                
                                                                              </tr>
                                                                       
                                                                         <%   }
                                                                        
                                                                    }
            }catch(Exception ex){

            }
                                                                        
                                                                        %>
                    
                  
                  
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
        


    





           
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
          <a class="btn btn-primary" href="login-box.jsp">Logout</a>
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
