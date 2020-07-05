<%-- 
    Document   : dbaddLike
    Created on : May 12, 2019, 10:00:42 PM
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
    
    String problem = request.getParameter("pro");
    String liker = request.getParameter("like");
    
    int i = Integer.parseInt(problem);
    int j = 0;
    
    con = DB.getConnection();
    st = con.createStatement();
    st.executeUpdate("Insert into problem_like(ProID, LikeFrom) values("+i+",'"+liker+"')");
    rs = st.executeQuery("Select COUNT(*) from problem_like where ProID = "+i+"");
    if(rs.next()){
        j = rs.getInt(1);
        st.executeUpdate("update comment set Likes = "+j+" where id = "+i+" ");
    }
    rs = st.executeQuery("Select comment.ProblemID from problem_like, comment where comment.id=problem_like.ProID AND ProID = "+i+"");
    if(rs.next()){
        j = rs.getInt(1);
        response.sendRedirect(request.getContextPath()+"/Panels/problem-page.jsp?g="+j+"");
    }
    

%>
