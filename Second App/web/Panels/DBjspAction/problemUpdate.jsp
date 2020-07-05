<%-- 
    Document   : problemUpdate
    Created on : May 8, 2019, 11:18:55 AM
    Author     : DigitalForce™
--%>

<%@page import="com.servlet.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    //ResultSet rs = null;
    
    String id = "1";
    //String name = request.getParameter("j");
    int i = Integer.parseInt(id);
    con = DB.getConnection();
    //ob2.println("Connection complete!");
    st = con.createStatement();
    if(request.getHeader("referer").endsWith("problem-page.jsp")){
        rs = st.executeQuery("Select * from problem where ID ="+i+"");
        //String j = "";
        if(rs.next()){
            
            st.executeUpdate("update problem set Taker='Ishan' where ID="+i+"");
            
            response.sendRedirect(request.getContextPath()+"/Panels/problem-page.jsp");
        }
        
    } else {
        
        response.sendRedirect(request.getContextPath()+"/Panels/login-requests.jsp");
    }
    
    
                                                                   

%>
