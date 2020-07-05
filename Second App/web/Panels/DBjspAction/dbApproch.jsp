<%-- 
    Document   : dbCreate
    Created on : May 18, 2019, 2:57:44 AM
    Author     : DigitalForce™
--%>

<%@page import="java.sql.Statement"%>
<%@page import="com.servlet.db.DB3_Users"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
            String name = request.getParameter("u");
            String receive = request.getParameter("r");
            String tname = request.getParameter("n");
            String email = request.getParameter("e");
            String tel = request.getParameter("t");
            String role = request.getParameter("p");
    
            Connection con = null;
            Statement ps = null;
            ResultSet rs = null;
            
            try{
            con = DB3_Users.getConnection();
            //String sql = "select * from employee where firstname='"+session.getAttribute("username").toString()+"'";
            String sql2 = "Insert into "+name+"_table (Username, Name, Role, Email, PhoneNo) values('"+receive+"', '"+tname+"','"+role+"', '"+email+"', '"+tel+"') ";
            String sql = "Select ID from "+name+"_table where Username = '"+receive+"'"; 
            
            ps = con.createStatement();
            ps.execute(sql2);
            
            rs = ps.executeQuery(sql);
            int x = 0;
            if(rs.next()){
                x = rs.getInt(1);
                String sql3 = "Insert into "+name+"_bubble (ContactID , Sender, Receiver, Message) Values("+x+" ,'"+name+"','"+receive+"','"+name+" want to contact with you...') ";
                ps.execute(sql3);
            }
            
            
            response.sendRedirect(request.getContextPath()+"/Panels/user-contact.jsp");
            
            }
            catch(Exception ex){
                
            }
   %>
