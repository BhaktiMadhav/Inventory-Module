<%@ page language="java" import="java.sql.*" %>
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
					<li><a href="#">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<%String p1=request.getParameter("value");%>
					<h2 class="title"><a href="brand.jsp">BRAND</a></h2>
					<h3>Brand Name :  <%out.println(p1);%></h3>
					<br><br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
						
				</div>	
		<form name="brand" method=post action="update_brand.jsp">
<%
	
	
	
	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con=null;
		ResultSet rs = null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st = con.createStatement();
		
		
		String QueryString = "SELECT * from brand where brand = \'"+p1+"\'";
		rs = st.executeQuery(QueryString);
		int i=1;
			while (rs.next())
			{
			%>			
						<input type="hidden" name="brand" value="<%=rs.getString(1)%>"><br>
						<b>Description<br><br>
						<textarea rows="5" cols="15" name="description" style="width: 500px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" ><%=rs.getString(2)%></textarea>
						<br><br>
		
	
		
	<input type="submit" value="Update" style="padding: 3px;">&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="delete_brand.jsp?value=<%=rs.getString(1)%>"><input type="button" value="Delete" style="padding: 3px;">
	<%		
				
			}
		rs.close();
		st.close();
		con.close();
	
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
							<li><a href="#">Homepage</a></li>
							<li><a href="purchasereceipt.jsp">Purchase Receipt</a></li>
							<li><a href="deliverynote.jsp">Delivery Note</a></li>
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
