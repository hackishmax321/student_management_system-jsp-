<%-- 
    Document   : check
    Created on : Mar 12, 2019, 10:58:02 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%!
            Connection con = null;
            Statement st = null;
            ResultSet rs = null, rs2= null;
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
        <h1>Hello World!</h1>
        <div>
            <table >
                                                            <%
                                                               
                                                                    try{
                                                                        
                                                                    
                                                                    Connection con1 = dbConnect();
                                                                    //ob2.println("Connection complete!");
                                                                    Statement st = con1.createStatement();
                                                                    //String query = "Select * from events where ID=?";
                                                                    //PreparedStatement stmt = con1.prepareStatement(query);
                                                                    //ob2.println("Statement complete!");
                                                                    
                                                                    String query = "Select COUNT(*) from events";
                                                                    rs = st.executeQuery(query);
                                                                    if(rs.next()){
                                                                        int x = rs.getInt(1);
                                                                        ob2.println("<br> x = "+x);
                                                                    }
                                                                    
                                                                    
                                                                    for(int i=0;i<5;i++){
                                                                        String query2 = "Select * from events where ID="+(i+1)+"";
                                                                        //stmt.setInt(1, (i+1));
                                                                        //ob2.println(stmt);
                                                                        rs = st.executeQuery(query2);
                                                                        //ob2.println("<br>Execution complete!");
                                                                        while(rs.next()){
                                                                        
                                                                            ob2.println("<tr><td>"+
                                                                                    "<h1 class='h1-level02'>"+rs.getString(2)+"</h1>" +
				"<p id='spe'>By "+rs.getString(3)+"</p><br>"+
				"<div class='im-box'></div>"+
				"<p>"+rs.getString(9)+" A humorous take on Sir Arthur Conan Doyle's classic mysteries featuring Sherlock Holmes and Doctor Watson.</p>"+
				"<p>"+
"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>"+
"<p>"+
"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>"+
				"<br>"+
				"<p id='spe'>Date	:"+rs.getString(4)+"</p><br>"+
				"<p id='spe'>Time	:"+rs.getString(5)+"</p><br>"+
				"<p id='spe'>Venue	:"+rs.getString(6)+"</p><br>"+


			"</td></tr>");
                                                                        }
                                                                    }
                                                                    
                                                                    } catch(NullPointerException ex){
                                                                        
                                                                    }
                                                                    %>
            </table>
          </div>
    </body>
</html>
