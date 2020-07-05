<%-- 
    Document   : dbFunction
    Created on : Apr 5, 2019, 11:23:59 AM
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
    
    String id = request.getParameter("u");
    int i = Integer.parseInt(id);
    con = DB.getConnection();
    //ob2.println("Connection complete!");
    st = con.createStatement();
    if(request.getHeader("referer").endsWith("admin-select.jsp")){
        rs = st.executeQuery("Select UniversityName from university where ID ="+i+"");
        String j = "";
        if(rs.next()){
            j = rs.getString(1);
            st.executeUpdate("update university set Role = 'Admin' where ID="+i+"");
            st.executeUpdate("Insert into identified_university(Name) values('"+j+"')");
            response.sendRedirect(request.getContextPath()+"/Panels/admin-select.jsp");
        }
        
    } else if(request.getHeader("referer").endsWith("blem-page.jsp")){
            st.executeUpdate("update problem set Taker='Ishan' where ID="+i+"");
            
            response.sendRedirect(request.getContextPath()+"/Panels/problem-page.jsp");
        
    }
    else {
        st.executeUpdate("update users2 set Verified = 1 where ID="+i+"");
        response.sendRedirect(request.getContextPath()+"/Panels/login-requests.jsp");
    }
    
    
                                                                   

%>
