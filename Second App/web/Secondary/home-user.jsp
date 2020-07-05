<%-- 
    Document   : home-user
    Created on : Mar 16, 2019, 10:54:10 AM
    Author     : DigitalForce™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    
    </head>
    
    <body>
        <h1>Hello World!</h1>
        <p><b><%=session.getAttribute("username").toString()  %></b> is the User</p><br>
        <p><a href="<%=request.getContextPath()%>/LogoutServlet">Log Out</a>
    </body>
</html>
