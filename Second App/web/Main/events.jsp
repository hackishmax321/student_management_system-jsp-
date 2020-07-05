<%-- 
    Document   : events
    Created on : Mar 12, 2019, 6:31:04 PM
    Author     : DigitalForce™
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Events</title>


	<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Courgette|Lobster|Merienda|Pacifico" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Catamaran|Convergence|Merriweather|PT+Sans|PT+Sans+Narrow|Raleway|Roboto+Slab" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Crete+Round|Crimson+Text|Fahkwang|Kaushan+Script|Merienda|Merriweather|Noto+Serif+SC" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=ABeeZee|Fahkwang|Fanwood+Text|IBM+Plex+Serif|Julius+Sans+One|Kameron|Limelight|Nobile|Questrial|Shrikhand" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="CSS/main.css">
	<style type="text/css">

		
	</style>

	<script type="text/javascript">
		function high1() {
			//Incomplete
		}
	</script>
        
        <%!
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            public Connection dbConnect(){
                try{
                    Class.forName("com.mysql.jdbc.Driver"); 
                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/javeeesample", "root", "");
                }catch(Exception ex){

                }
                
                return con;
            }
            
            %>
            <% PrintWriter ob2 = response.getWriter();       %>
        
        
</head>
<body>
	<div class="container">
		<nav id="main-nav">
			<div class="blank" id="b-one"></div>
			<div id="menue1">
				<div id="login"><a href="#"><ion-icon name="log-in"></ion-icon>-Login</a></div>
			</div>
			<div id="obj1" class="brand"><a href="#"><h2>The site</h2></a></div>
			<div id="main-navigate">
				<ul>
					<li><a href="login-option.jsp">Join Us</a></li>
					<li><a href="events.jsp" style="color:black; font-weight: bolder;">Events</a></li>
					<li><a href="terms-con.jsp">Terms & Conditions</a></li>
					<li><a href="about-us.jsp">About Us</a></li>
					<li><a href="page-warn.html">More</a></li>
				</ul>
			</div>
		</nav>
		<div class="main">
			
			<div class="content">
				<div class="main-ban">
					
					<div class="main2">
						<div class="table-box">
							<div class="passage" id="aboutUs">
								<h1>Events</h1>
                                                                
                                                                
                                                                
								<table cellpadding="10">
			<tr><th>Event</th></tr>
                        <%
                                                               
                                                                    try{
                                                                        
                                                                    
                                                                    Connection con1 = dbConnect();
                                                                    //ob2.println("Connection complete!");
                                                                    Statement st = con1.createStatement();
                                                                    //String query = "Select * from events where ID=?";
                                                                    //PreparedStatement stmt = con1.prepareStatement(query);
                                                                    //ob2.println("Statement complete!");
                                                                    int x = 0;
                                                                    String query = "Select COUNT(*) from events";
                                                                    rs = st.executeQuery(query);
                                                                    if(rs.next()){
                                                                        x = rs.getInt(1);
                                                                        
                                                                    }
                                                                    
                                                                    for(int i=0;i<x;i++){
                                                                        String query2 = "Select * from events where ID="+(i+1)+"";
                                                                        //stmt.setInt(1, (i+1));
                                                                        //ob2.println(stmt);
                                                                        rs = st.executeQuery(query2);
                                                                        //ob2.println("<br>Execution complete!");
                                                                        while(rs.next()){
                                                                            %> 
                        <tr><td>
                                <h1 class="h1-level02"><%=rs.getString(2)%></h1>
                                <p id="spe">By <%=rs.getString(3)%></p><br>
                                <div class="im-box" style="background:url(Image/Stored/<%=rs.getString(8)%>);"></div>
				<p><%=rs.getString(7)%> A humorous take on Sir Arthur Conan Doyle's classic mysteries featuring Sherlock Holmes and Doctor Watson.</p>
				<p>
"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>
<p>
"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>
				<br>
				<p id="spe">Date	:<%=rs.getString(4)%></p><br>
				<p id="spe">Time	:<%=rs.getString(5)%></p><br>
				<p id="spe">Venue	:<%=rs.getString(6)%></p><br>


			</td></tr>
                                                                            <%
                                                                            
                                                                        }
                                                                    }
                                                                    
                                                                    } catch(NullPointerException ex){
                                                                        
                                                                    }
                                                                    %>
			
				
				
			

			
		</table>
					


				</div>
						</div>
					</div>
					
				</div>
				
				

			</div>
			
			
		</div>
		<div class="foot">
			<div id="social-navigate">
			<ul>
				<li><a href=""><ion-icon name="logo-facebook"></ion-icon></a></li>
				<li><a href=""><ion-icon name="logo-twitter"></ion-icon></a></li>
				<li><a href=""><ion-icon name="logo-reddit"></ion-icon></a></li>
				<li><a href=""><ion-icon name="logo-dribbble"></ion-icon></a></li>
			</ul>
			</div>
		</div>
		
		
	</div>
	
	

</body>
</html>
