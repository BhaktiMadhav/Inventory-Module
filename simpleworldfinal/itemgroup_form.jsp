<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<%
	try
	{			
		if(session.getAttribute("user_id")==null)
        {  
			String site = new String("http://localhost:8080/simpleworld/index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
        }	
		
		else
		{
			String t =session.getAttribute("ur_id").toString();
			String connectionURL2 = "jdbc:mysql://localhost:3306/db";
			Connection con2 = null;
			ResultSet rs2=null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con2 = DriverManager.getConnection(connectionURL2,"root","39414247");
			Statement st2 = con2.createStatement();
			String z2;
		
			z2="select form from permission where ur_id=\'"+t+"\' and page_name='itemgroup' ";
			rs2=st2.executeQuery(z2);
			String flag_form="";
			while(rs2.next())
			{
				flag_form=rs2.getString(1);
			}
		
			if(flag_form.equals("false"))
			{
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", session.getAttribute("last_page").toString());
			}
			
			else
			{
				String url = new String("http://localhost:8080/simpleworld/itemgroup_form.jsp");
				session.setAttribute("last_page",url);
	%>
<head>
	<title>ITEMGROUP</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
	<script language="javascript">
	function validate( )
	{	
		var itemgroup=document.itemgroupform.itemgroup.value;
		
		if(itemgroup=="")
		{
			alert("Please enter the Item Group Name !");
			return false;
		}
		else 
		{
			return true;
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
					<li class="current_page_item"><a href="home1.jsp">Homepage</a></li>
					<li><a href="logout.jsp" target="_self">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="itemgroup.jsp">ITEM GROUP</a></h2>
					<br><br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
				</div>	

				<div class="post">
					<div class="entry">
						<a href="#"><font size="4">Item Group Details</font></a><br><br><br>
						
						<form name="itemgroupform" method="post" action="itemgroup_action.jsp">
						Item Group Name<br><br>
						<input type="text" name="itemgroup" style="height: 30px; width: 250px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;"><br><br>
						<input type="submit" value="Save" style="padding: 3px;" onclick="return validate();">
						</form>
						<%
					}
					rs2.close();
					st2.close();
					con2.close();
				}
			} 
			catch (Exception ex)
			{
				out.println(ex);
			}
			%>
	
					</div>
				</div>
				
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
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<!-- end #page -->
		<div id="footer">
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>

