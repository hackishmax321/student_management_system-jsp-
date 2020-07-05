<%-- 
    Document   : user-event-form
    Created on : Mar 25, 2019, 11:45:13 PM
    Author     : DigitalForce™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Slider</title>

	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>
	<style type="text/css">
		body {
			margin: auto;
			padding: 0;
			font-family: sans-serif;
			background-color: white;
			
			

		}

		

		.main {
			display: flex;
			
			width:100%;
			height: 100%;
			justify-content: center;
			align-items: center;

		} 

		.table-box {
			height: 600px;
			width:80%;
			margin-top: 100px;
			overflow-y: scroll;
			box-shadow: 0 10px 100px rgba(0,0,0,0.5);
			background: black;
			border-bottom:10px solid #1B9CFC;
			border-left: 2px solid #25CCF7;

		}
		.table-title {
			position: sticky;
			top: -140px;

		}

		#tb-pop-up {
			width: 50%;
			height:650px;
			
		}

		#h-tableBox {
			color: #1B9CFC;
		}

		#dual-com {
			position: relative; 
			left: -3px; 
			width: 98%;
			margin: 5px 0px;

		}

		table {
			width:100%;

		}


		#text-field {
			width: 95%;
			margin: 10px;
			background-color: white;
		}

		#text-field input {

			padding: 10px 10px; 
			width: 100%;
			
		}

		#text-field input[type='submit'] {

			
			width: 103%;
			
		}

		select {
			padding: 10px 10px; 
			margin-left: 0px;

			width: 108%; 
		}

		textarea {
			padding: 10px 10px; 
			margin: 10px;
			width: 95.2%; 
			height: 150px;
		}
	</style>

	<script type="text/javascript">
		
	</script>

	
</head>
<body class="bg-dark">
	

	<div class="main">
		
	
	<div class="table-box" id="tb-pop-up">
		<div class="table-title"><center><ion-icon name="add-circle" style="font-size: 50px; color: #1B9CFC"></ion-icon><h4 id="h-tableBox">ADD NEW SPECIAL EVENT</h4></center></div>
                <form action="<%=request.getContextPath()%>/UploadServlet" method="post" enctype="multipart/form-data">
					<div id="text-field"><input type="text" placeholder="Name of the Event" name="ename"></div>
                                        
					<table id="dual-com">
						<tr><td><div id="text-field"><input type="date" placeholder="Start Date" name="stdate"></div></td><td><div id="text-field"><input type="date" placeholder="End Date" name="endate"></div></td></tr>
					</table>
					
					<div id="text-field"><input type="text" placeholder="Venue" name="place"></div>

					<table id="dual-com">
						<tr>
							<td><div id="text-field"><input type="file" required="" name="file"></div></td>
							<td><div id="text-field" >
                                                                <input type="hidden" name="university" value="10012">
							</div></td>
						</tr>
					</table>

					<div id="text-field">
						
					</div>

					<textarea placeholder="Description" name="des"></textarea>
					
					<div id="text-field"><input type="submit" Value="Confirm" name="sub-btn"></div>
				</form>
			

	</div>
	</div>

	

	

</body>
</html>
