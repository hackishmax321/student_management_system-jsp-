<%-- 
    Document   : login
    Created on : Mar 20, 2019, 10:31:45 PM
    Author     : DigitalForce™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Cinzel+Decorative|Pacifico" rel="stylesheet">
	<title>Login | Eoc Friends</title>
	<link rel="stylesheet" type="text/css" href="css/style-log.css">

	<script src="https://unpkg.com/ionicons@4.4.8/dist/ionicons.js"></script>
        
        
</head>
<body>
	<div class="bg">
	</div>
    <div class="login-box" id="l-box-V2">
     <img src="Image/user-pink2.png" class="user">

	    <h1>LOGIN</h1>
	    <center>
            <form action="<%=request.getContextPath()%>/Nservelet" method="POST">
                <table id="subT">
                    
                    <% 
                                Cookie cook = null;
                                Cookie[] cookies = null;

                                cookies = request. getCookies();

                                if(cookies!=null){
                                    %>
                                    
                                    

                                    <tr><td class="left"><ion-icon name="contact"></ion-icon></td><td class="right"><input type="text" name="uname" placeholder="Username" value="<%=cook.getValue()%>"></td></tr>
	    		<tr><td class="left"><ion-icon name="square"></ion-icon></td><td class="right"><input type="password" name="pass" placeholder="Password"></td></tr>

	    		<tr><td id="btntd" style="border: none;"></td><td id="btntd" style="border: none;box-shadow: none">
	    			<div id=btnhan >
						<button id="test-btn" name="lobb" >Login</button>
                                                
					</div>
	    		</td></tr>
<%
                                    
                                }
                    %>
	    	</table>
	    	<div id="final">
	    		<p>Haven't Registered yet? Then <a href="register.jsp">Register Here.</a></p>
	    	</div>
            </form>
        </center>

   </div>

</body>
</html>
