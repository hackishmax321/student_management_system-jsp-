<%-- 
    Document   : chat-userA
    Created on : Mar 18, 2019, 1:03:25 PM
    Author     : DigitalForce™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Chat Prototype</title>

	<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>
        <link rel="stylesheet" type="text/css" href="css/chat-style.css">
</head>
<body>

	<div class="main">
		
	
		<div class="table-box">
			<div class="m-box"><p>Sample Message Box</p></div>
			<div class="m-box" id="m-left"><p>Sample Message Box. Sample Message Box. Sample Message Box. Sample Message Box.</p></div>
		</div>
		<div class="table-box" id = "type-bar"><textarea id="t-chat" ></textarea><a id="send" href="#"><ion-icon name="send"></ion-icon></a></div>

	</div>

</body>
</html>
