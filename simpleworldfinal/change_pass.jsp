<html>
  <%
		if(session.getAttribute("user_id")==null)
        {
			String site = new String("http://localhost:8080/simpleworld/index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		}
		 %>
<head>
	<title>Change Password</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
	<script language="javascript" type="text/javascript">
	function validate()
	{	
		var ajaxRequest;
		var oldpass = document.password.oldpass.value;
		var newpass1=document.password.newpass1.value;
		var newpass2=document.password.newpass2.value;
		var queryString = "?oldpass=" + oldpass + "&newpass1=" + newpass1 + "&newpass2=" + newpass2;
		
		var msg="";
		var chk=true;
		if(oldpass=="")
		{
			chk=false;
			msg=msg+"Please enter the Old Password \n";
		}
		if(newpass1=="")
		{
			chk=false;
			msg=msg+"Please enter the New Password \n";
		}
		if(newpass2=="")
		{
			chk=false;
			msg=msg+"Please re-enter the New Password \n";
		}
		if(!chk)
		{	
			alert(msg);
		}
		
		else
		{
		
			try
			{
				ajaxRequest = new XMLHttpRequest();
			} 
			catch (e)
			{
				try
				{
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e)
				{
					alert("Your browser broke!");
					return false;
				}
		                       
			}
			ajaxRequest.onreadystatechange = function()
			{
				if(ajaxRequest.readyState == 4)
				{
					var ajaxDisplay = document.getElementById('ajaxDiv');
					ajaxDisplay.innerHTML = ajaxRequest.responseText;
				}
			}

			ajaxRequest.open("GET", "changepass_action.jsp" + queryString, true);
			ajaxRequest.send(null); 
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
				<ul>
					<li class="current_page_item"><a href="home1.jsp">HOMEPAGE</a></li>
					<li><a href="logout.jsp" target="_self">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		
	<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="change_pass.jsp">Change Password</a></h2>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
				</div>	
				
			
			<div id='ajaxDiv'>
			
			<form method="POST" name="password">
				
			<br><br><center>
			<fieldset><br><br>
            <b>Enter OLD Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="oldpass" style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" value="" /><br><br><br>
			
            Enter NEW Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="newpass1"  style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" value="" /><br><br><br>
			
			Re-Enter NEW Password: <input type="password" name="newpass2"  style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" value="" /></b>
			
			<br><br>
			
            <input type="button" style="padding: 3px; height: 40px; width: 150px" value="Change Password" onclick="validate()"/><br><br>
			</fieldset>
			</center>
			
			</div><!---ajax div--->
	
			
			<br><br><br>
				<div id="dot"></div>
			</div>
	
			<!-- end #content -->
			
			<div id="sidebar">
				<ul>
					<li>
						<h2>Categories</h2>
						<ul>
							<li><a href="home1.jsp">Homepage</a></li>
							<li><a href="purchasereceipt.jsp">Purchase Receipt</a></li>
							<li><a href="deliverynote.jsp">Delivery Note</a></li>
							<li><a href="change_pass.jsp">Change Password</a></li>
						</ul>
					</li>
				</ul>
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

