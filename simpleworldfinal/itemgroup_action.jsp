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
				String url = new String("http://localhost:8080/simpleworld/itemgroup_action.jsp");
				session.setAttribute("last_page",url);
			%>

<head>
	<title>ITEM GROUP</title>
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
						<li class="current_page_item"><a href="home1.jsp">Homepage</a></li>
						<li><a href="logout.jsp" target="_self">Logout</a></li>
					
					</ul>
				</div>
			</div>
			
			<!-- end #header -->
			<div id="page">
				<div id="content">
					<div class="post">
						<h2 class="title"><a href="itemgroup.jsp">Item Group</a></h2>
						<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="itemgroup_form.jsp"><input type="button"  value="+ New Item Group" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
							<br>
						</div>
						<br>
						<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
					</div>
<%
	
		String p1=request.getParameter("itemgroup");
		String itemgroup=p1.trim();
	

		PreparedStatement ps = null;

		String sql;
		sql = "INSERT INTO item_group(item_group) VALUES (?)";

		ps = con2.prepareStatement(sql);
		st2=con2.createStatement();

		ps.setString(1,itemgroup);
		
		ps.executeUpdate();
		out.println("Record Entered Successfully !");

		rs2.close();
		st2.close();
		con2.close(); 
		ps.close();
	}
	}
	}

	catch(Exception e)
	{
		out.println(e);
	}
       	
%>
				
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





