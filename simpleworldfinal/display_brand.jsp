<%@ page language="java" import="java.sql.*" %>
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
		
			z2="select display from permission where ur_id=\'"+t+"\' and page_name='brand' ";
			rs2=st2.executeQuery(z2);
			String flag_display="";
			while(rs2.next())
			{
				flag_display=rs2.getString(1);
			}
			String p1=request.getParameter("value");
			
			z2="select update_form from permission where ur_id=\'"+t+"\' and page_name='brand' ";
			rs2=st2.executeQuery(z2);
			String flag_update="";
			while(rs2.next())
			{
				flag_update=rs2.getString(1);
			}
			
			z2="select delete_form from permission where ur_id=\'"+t+"\' and page_name='brand' ";
			rs2=st2.executeQuery(z2);
			String flag_delete="";
			while(rs2.next())
			{
				flag_delete=rs2.getString(1);
			}
			
			if(flag_display.equals("false"))
			{
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", session.getAttribute("last_page").toString());
			}
			else
			{
				String url = new String("http://localhost:8080/simpleworld/display_brand.jsp?value="+p1);
				session.setAttribute("last_page",url);
				
				
			%>

<head>
	<title>BRAND</title>
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
					<h2 class="title"><a href="brand.jsp">BRAND</a></h2>
					<h3>Brand Name :  <%out.println(p1);%></h3>
					<br><br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
						
				</div>	
		<form name="brand" method="post" action="update_brand.jsp">
<%

		String QueryString = "SELECT * from brand where brand = \'"+p1+"\'";
		rs2 = st2.executeQuery(QueryString);
		int i=1;
			while (rs2.next())
			{
			%>			
						<input type="hidden" name="brand" value="<%=rs2.getString(1)%>"><br>
						<b>Description<br><br>
						<textarea rows="5" cols="15" name="description" style="width: 500px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" ><%=rs2.getString(2)%></textarea>
						<br><br>
		
	
		
	<% if(flag_update.equals("true")){%><input type="submit" value="Update" style="padding: 3px;"><%}%>&nbsp;&nbsp;&nbsp;&nbsp;
	<% if(flag_delete.equals("true")){%><a href="delete_brand.jsp?value=<%=rs2.getString(1)%>"><input type="button" value="Delete" style="padding: 3px;"><%}%>
	<%		
				
			}
			}
		rs2.close();
		st2.close();
		con2.close();
	}
	}
	catch (Exception e)
	{
		out.println(e);
	}
%>
</form>	
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

