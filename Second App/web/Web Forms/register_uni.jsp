<%-- 
    Document   : register
    Created on : Mar 20, 2019, 10:35:34 PM
    Author     : DigitalForce™
--%>

<%@page import="com.servlet.db.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Cinzel+Decorative|Pacifico" rel="stylesheet">
	<title>Registration |University</title>
	<link rel="stylesheet" type="text/css" href="css/style-log.css">
        <link rel="stylesheet" type="text/css" href="css/datedropper.css">
        <link rel="stylesheet" type="text/css" href="css/my-style.css">

	<script src="https://unpkg.com/ionicons@4.4.8/dist/ionicons.js"></script>
        <script src="js/jquery-1.10.2.min.js"></script>
        <script src="js/datedropper.js"></script>
        
        <script type="text/javascript">
        	function visUni(){
        		var selectP = document.getElementById('uni-select');
        		var input = selectP.options[selectP.selectedIndex].value;
        		if(input=='other'){
        			document.getElementById('spe-raw').style.visibility = 'visible';
        		} else {
        			document.getElementById('spe-raw').style.visibility = 'hidden';
        		}
        		return false;
        	}
                
                function validate(){
                //window.alert("Hii...");
                
                
                var fname = document.forms["regform"]["fname"];
                var uname = document.forms["regform"]["lname"];
                var mobile = document.forms["regform"]["mobile"];
                var email = document.forms["regform"]["email"];
                var uniname = document.forms["regform"]["uni-select"];
                var uniid = document.forms["regform"]["uniid"];
                var pass = document.forms["regform"]["pass"];
                var cpass = document.forms["regform"]["cpass"];
                
                if(uname.value===""){
                    window.alert("You need to enter a username!");
                    return false;
                }
                if(fname.value===""){
                    window.alert("You need to enter Your name!");
                    return false;
                }
                if(email.value===""){
                    window.alert("You need to enter Your Email Address!");
                    return false;
                }
                if((email.value.indexOf("@", 0) < 0)||(email.value.indexOf(".", 0) < 0)){
                    window.alert("You need to enter a valid Email Address!");
                    return false;
                }
                
                if(mobile.value.length!==10){
                    window.alert("You need to 10 digit value as phone number!");
                    return false;
                }
                if(uniname.value===""){
                    window.alert("You need to Select university you work for!");
                    return false;
                }
                if(uniid.value===""){
                    window.alert("You need to enter Your university staff ID!");
                    return false;
                }
                if((cpass.value==="")||(pass.value==="")){
                    window.alert("You can't keep Password and Connfirm password fields as empty!");
                    return false;
                }
                if((cpass.value===pass.vlue)){
                    window.alert("You'r password is invalid!");
                    return false;
                }
                if(((pass.value.length)<8)||((pass.value.length)>20)){
                    window.alert("You'r password's length isn't between 8 to 20");
                    return false;
                }
                
            }
        	
        </script>
        
        <%   
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            String x = "";


          %>
</head>
<body>
    <%
        if(session.getAttribute("username")=="exist"){
            %>
            <script>
                window.alert("Entered username is in use already!");
            </script>
                
                <%
            }
        %>
    
        
        
	<div class="bg">
	</div>
    <div class="login-box">
     <img src="Image/user-pink2.png" class="user"> 	

	    <h1>REGISTRATION </h1><center>
	    	
	    
	    <form action="<%=request.getContextPath()%>/RegServlet" name="regform" onsubmit="validate()" method="POST">
                <table id="mainT">
                    <tr><td>    
               
	    	<table id="subT">
	    		<tr><td class="left"><ion-icon name="contact"></ion-icon></td><td class="right"><input type="text" name="fname" placeholder="Full Name" value="<%if(session.getAttribute("usedfname")!=null){%><%=session.getAttribute("usedfname")%><%}%>"></td></tr>
                        <tr><td class="left"><ion-icon name="contact"></ion-icon></td><td class="right"><input type="text" name="lname" placeholder="Desired Username" value="<%if(session.getAttribute("usedname")!=null){%><%=session.getAttribute("usedname")%><%}%>" style="background-color:<%if(session.getAttribute("color")!=null){%><%=session.getAttribute("color")%><%}%> ;"></td></tr>
	    		<tr><td class="left"><ion-icon name="calendar"></ion-icon></td><td class="right"><input type="date" id="date-input" class="datedropper-init"  name="bdate" style="font-family: 'Merriweather', serif; text-align:center;">
                                        <script>
                                            $('#date-input').dateDropper();
                                        </script>
                        </td></tr>
                        <tr><td class="left"><ion-icon name="call"></ion-icon></td><td class="right"><input type="text" name="mobile" placeholder="Mobile Number" value="<%if(session.getAttribute("usedmobile")!=null){%><%=session.getAttribute("usedmobile")%><%}%>"></td></tr>
	    		<tr><td class="left"><ion-icon name="mail"></ion-icon></td><td class="right"><input type="text" name="email" placeholder="E-mail" value="<%if(session.getAttribute("usedemail")!=null){%><%=session.getAttribute("usedemail")%><%}%>" style="background-color:<%if(session.getAttribute("color2")!=null){%><%=session.getAttribute("color2")%><%}%> ;"></td></tr>
                </table>
                    </td>
                    <td>
                <table id="subT">
                        <tr><td class="left"><ion-icon name="close-circle"></ion-icon></td><td class="right">
                        	
                    <select name="uni-select" id="uni-select" onchange="return visUni();">
                        
                        <%  
            try{
                                                                        
                                                                    
                                                                    con = DB.getConnection();
                                                                    //ob2.println("Connection complete!");
                                                                    st = con.createStatement(); 
                                                                    int count = 0;
                                                                    rs = st.executeQuery("Select COUNT(*) from identified_university");
                                                                    if(rs.next()){
                                                                        count = rs.getInt(1);
                                                                        
                                                                    }
                                                                    for(int i =10010; i<(count+10010); i++){
                                                                        rs = st.executeQuery("Select Name from identified_university where UniID = "+(i+1)+" ");
                                                                        if(rs.next()){
                                                                            x = rs.getString("Name");    
                                                                            
                                                                        }
                                                                    
                     %>
                        <option value="<%=x %>"><%=x %></option>
                    <%
                                                                    }
            } catch(Exception ex) {
                
            }
                
                %>
                        
                        		
                                        <option value="other">Other</option>
                                        
                        	</select>
                    
                    

                        </td></tr>
                        <tr style="visibility: hidden;" id="spe-raw" ><td class="left"><ion-icon name="school"></ion-icon></td><td class="right"><input type="text" name="uniname" placeholder="University Name" value="<%if(session.getAttribute("useduni")!=null){%><%=session.getAttribute("useduni")%><%}%>"></td></tr>
                        <tr><td class="left"><ion-icon name="card"></ion-icon></td><td class="right"><input type="text" name="uniid" placeholder="University Staff ID"></td></tr>
	    		<tr><td class="left"><ion-icon name="keypad"></ion-icon></td><td class="right"><input type="password" name="pass" placeholder="Password" style="background-color:<%if(session.getAttribute("color3")!=null){%><%=session.getAttribute("color3")%><%}%> ;"></td></tr>
	    		<tr><td class="left"><ion-icon name="keypad"></ion-icon></td><td class="right"><input type="password" name="cpass" placeholder="Confirm Password"></td></tr>
                        
                </table>
                      </td></tr>
                    <tr><td id="btntd"></td><td id="btntd" colspan="2">
	    			<div id=btnhan>
						<button id="test-btn" name="rebb">Submit</button>
                                                
					</div>
                    </td></tr>

	    	</table>
	    	<div id="final">
	    		<p>Already have an Account? Then <a href="<%=request.getContextPath()%>/Web%20Forms/login.jsp">Login Here.</a></p>
	    	</div>
	    </form>
	    </center>
            
            
            
         

	    
	 
   </div>
 
</body>
</html> 
