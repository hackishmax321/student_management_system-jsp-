<%-- 
    Document   : dbAllocate
    Created on : May 14, 2019, 3:06:28 AM
    Author     : DigitalForce™
--%>

<%@page import="com.servlet.db.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("u");
    //String name = request.getParameter("n");
    int h = Integer.parseInt(id);
    
    
    Connection con = null;
    Statement st = null;
    
    
    try {
        con = DB.getConnection();
        st = con.createStatement();
        if(request.getHeader("referer").endsWith("user-message.jsp")){
            st.executeUpdate("Delete from private_message where ID = "+h+" ");
            st.executeUpdate("Set @autoid := 0; ");
            st.executeUpdate("Update private_message set ID = @autoid := (@autoid + 1);");
            st.executeUpdate("Alter table private_message AUTO_INCREMENT = 1;");
            response.sendRedirect(request.getContextPath()+"/Panels/user-message.jsp");
        } else {
            
            st.executeUpdate("Update problem set Taker = 'Not Taken' where ID = "+h+" ");
            response.sendRedirect(request.getContextPath()+"/Panels/problem-page.jsp?g="+h+"");
        }
    } catch(Exception ex){
        
    }


    %>
