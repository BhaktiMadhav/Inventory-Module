<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>
<html>
<head>
	<title>Stock Home</title>
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
					<li><a href="#">+New</a></li>
					<li><a href="#">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="UOM.jsp">UOM</a></h2>
					New UOM
					<br><br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
						<input type="button" value="Refresh" style="padding: 3px;" onClick="window.location.reload()">
				</div>	

				<div class="post">
					<div class="entry">
						<a href="#"><font size="4">UOM Details</font></a><br><br><br>		
						<%
				try
				{
					String connectionURL = "jdbc:mysql://localhost:3306/project";
					Connection connection = null;
	
					Statement statement = null;

					ResultSet rs = null;
					ResultSet rs1 = null;

					Class.forName("com.mysql.jdbc.Driver").newInstance();

					connection = DriverManager.getConnection(connectionURL, "root", "39414247");

					statement = connection.createStatement();

					String value="";
						
					String qs = "SELECT count( * ) FROM uom";
					rs1 = statement.executeQuery(qs);
					
					while (rs1.next())
					{
					%>
						
					<p><%value=rs1.getString(1);%></p>
				
				<% 	
					} 
					int value1=Integer.parseInt(value);
	
					String qs1 = "SELECT brand,description FROM brand";
					rs = statement.executeQuery(qs1);
					%>
					
					<%
					while (rs.next())
					{	%>
					<td><tr><%=rs.getString(1)%></td></tr>
					<td><tr><%=rs.getString(2)%></td></tr>
					<%}
					%>
					<%
					rs1.close();
					rs.close();
					statement.close();
					connection.close();
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
							<li><a href="setup.jsp">Setup</a></li>
							<li><a href="stock.jsp">Stock</a></li>
							<li><a href="#">Analysis</a></li>
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
			<p>Copyright (c) 2012 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>

