<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
	<title>Index</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
	<script language="javascript" type="text/javascript">
	function validate()
	{	
		var ajaxRequest;
		var userid = document.login.userid.value;
		var password=document.login.password.value;
		var queryString = "userid=" + userid + "&password=" + password;
		
		var msg="";
		var chk=true;
		if(userid=="")
		{
			chk=false;
			msg=msg+"Please enter the UserId \n";
		}
		if(password=="")
		{
			chk=false;
			msg=msg+"Please enter the Password \n";
		}
		if(!chk)
		{	
			alert(msg);
		}
		
		else
		{
			if(window.XMLHttpRequest)
			{ // For Mozilla, Safari, ...
				var xmlHttp = new XMLHttpRequest();
			}	
			else if(window.ActiveXObject)
			{ // For Internet Explorer
				var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} 
			xmlHttp.open('POST',"logindetails.jsp",true); 
			xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			xmlHttp.onreadystatechange = function()
			{
				if (xmlHttp.readyState == 4)
				{
					updatepage(xmlHttp.responseText);
				}
			}
			xmlHttp.send(queryString); 
		}
	}
	function updatepage(str)
	{
		if(str=="true")
		{
			window.location='home1.jsp';
		}
		else
		{
			document.getElementById("ajaxDiv").innerHTML=str; 
		}
	}	 
	
</script>	
</head>

<body>
<div id="wrapper">
	<div id="wrapper2">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#">Simple <span>World</span></a></h1>
			</div>
			<div id="menu">
			</div>
		</div>
		<!-- end #header -->
		
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="index.jsp">Login</a></h2>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
				</div>	
				
				
				<form name="login"action="logindetails.jsp" method="POST">
				
			<br><br><center>
			<fieldset><br><br>
            <b>UserID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userid" style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" value="" /><br><br><br>
			
            Password: <input type="password" name="password"  style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" value="" /></b>
			
			<br>
			<br>
            <input type="button" style="padding: 3px; height: 40px; width: 100px" value="Login"  onclick="validate()"/><br><br>
			<h3><font color="red"><div id="ajaxDiv">
			</div></font></h3>
			</fieldset>
			</center>
			
			<br><br><br>
				<div id="dot"></div>
			</div>
		</div>
			
		<div id="page">
			<div id="sidebar">
				
			</div>
			<!-- end #sidebar -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #page -->
		<div id="footer">
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>
