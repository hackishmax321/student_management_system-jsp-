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
    
            Connection con = null;
            Statement ps = null;
            ResultSet rs = null;
            
            try{
            con = DB3_Users.getConnection();
            //String sql = "select * from employee where firstname='"+session.getAttribute("username").toString()+"'";
            String sql2 = "Create table "+name+"_table (ID int AUTO_INCREMENT, Username varchar(50), Name varchar(50), Role varchar(20), Email varchar(50), PhoneNo varchar(10), UserImg MEDIUMBLOB, Primary Key(ID)) ";
            String sql3 = "Create table "+name+"_bubble (ID int AUTO_INCREMENT, ContactID int, Sender varchar(50), Receiver varchar(50), Message varchar(500), TimeS TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, Primary Key(ID), CONSTRAINT `"+name+"_MemID` FOREIGN KEY (`ContactID`) REFERENCES `"+name+"_table`(`ID`)) ";
            ps = con.createStatement();
            ps.execute(sql2);
            ps.execute(sql3);
            response.sendRedirect(request.getContextPath()+"/Panels/user-contact.jsp");
            
            }
            catch(Exception ex){
                
            }
   %>
