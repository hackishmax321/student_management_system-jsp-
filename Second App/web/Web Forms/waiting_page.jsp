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
            
                <table id="subT">

                    <h2>Seems like your account has not verified yet!<br>Go to Main Page...</h2>
	    		
	    		<tr><td id="btntd" style="border: none;"></td><td id="btntd" style="border: none;box-shadow: none">
                                <a href="<%= request.getContextPath()%>/Main/index.jsp"><div id=btnhan >
						<button id="test-btn" name="lobb" >Back</button>
                                                
                                    </div></a>
	    		</td></tr>

	    	</table>
	    	<div id="final">
	    		<p>Haven't Registered yet? Then <a href="register.jsp">Register Here.</a></p>
	    	</div>
            
        </center>

   </div>

</body>
</html>
