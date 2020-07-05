<%-- 
    Document   : login-option
    Created on : Mar 23, 2019, 12:02:52 PM
    Author     : DigitalForce™
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Join Us</title>


	<script src="https://unpkg.com/ionicons@4.5.5/dist/ionicons.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Abril+Fatface|Courgette|Lobster|Merienda|Pacifico" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Catamaran|Convergence|Merriweather|PT+Sans|PT+Sans+Narrow|Raleway|Roboto+Slab" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Crete+Round|Crimson+Text|Fahkwang|Kaushan+Script|Merienda|Merriweather|Noto+Serif+SC" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=ABeeZee|Fahkwang|Fanwood+Text|IBM+Plex+Serif|Julius+Sans+One|Kameron|Limelight|Nobile|Questrial|Shrikhand" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="CSS/main.css">
	<style type="text/css">

		
	</style>

	<script type="text/javascript">
		function high1() {
			//Incomplete
		}
	</script>
</head>
<body>
	<div class="container">
		<nav id="main-nav">
			<div class="blank" id="b-one"></div>
			<div id="menue1">
				<div id="login"><a href="<%=request.getContextPath()%>/Web%20Forms/login.jsp"><ion-icon name="log-in"></ion-icon>-Login</a></div>
			</div>
			<div id="obj1" class="brand"><a href="#"><h2>The site</h2></a></div>
			<div id="main-navigate">
				<ul>
					<li><a href="login-option.jsp" style="color:black; font-weight: bolder;">Join Us</a></li>
					<li><a href="events.jsp">Events</a></li>
					<li><a href="terms-con.jsp">Terms & Conditions</a></li>
					<li><a href="about-us.jsp">About Us</a></li>
					<li><a href="page-warn.html">More</a></li>
				</ul>
			</div>
		</nav>
		<div class="main">
			
			<div class="content">
				<div class="main-ban">
					
					<div id="im-contain">
							<h1 id="large">Join Us As An</h1>
							<div class="im-box"><a href="<%=request.getContextPath()%>/Web%20Forms/register_ind.jsp"><ion-icon name="business"></ion-icon><br><h1 id="medium">Industry Person</h1></a></div>
							<div class="im-box"><a href="<%=request.getContextPath()%>/Web%20Forms/register_uni.jsp"><ion-icon name="school"></ion-icon><br><h1 id="medium">University</h1></a></div>
							<div class="im-box"><a href="<%=request.getContextPath()%>/Web%20Forms/register.jsp"><ion-icon name="contacts"></ion-icon></ion-icon><br><h1 id="medium">Undergraduate</h1></a></div>
					</div>
					
					
				</div>
				
				

			</div>
			
			
		</div>
		<div class="foot">
			<div id="social-navigate">
			<ul>
				<li><a href=""><ion-icon name="logo-facebook"></ion-icon></a></li>
				<li><a href=""><ion-icon name="logo-twitter"></ion-icon></a></li>
				<li><a href=""><ion-icon name="logo-reddit"></ion-icon></a></li>
				<li><a href=""><ion-icon name="logo-dribbble"></ion-icon></a></li>
			</ul>
			</div>
		</div>
		
		
	</div>
	
	

</body>
</html>
