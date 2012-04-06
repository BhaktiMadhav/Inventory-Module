<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
	<title>Item</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
<div id="wrapper">
	<div id="wrapper2">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#">Simple <span>World</span></a></h1>
			</div>
			<div id="menu">
				<ul>
					<li class="current_page_item"><a href="#">Homepage</a></li>
					<li><a href="#">Login</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="warehouse.jsp">Login</a></h2>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
				</div>	
				
				
				<form action="logindetails.jsp" method="POST">
				
			<br><br><center>
			<fieldset><br><br>
            <b>UserID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userid" style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" value="" /><br><br><br>
			
            Password: <input type="password" name="password"  style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" value="" /></b>
			
			<br><br>
			
            <input type="submit" style="padding: 3px; height: 40px; width: 100px" value="Login" /><br><br>
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
			<p>Copyright (c) 2012 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>
