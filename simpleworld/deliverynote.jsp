<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
	<title>DELIVERY NOTE</title>
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
					<li><a href="#">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="deliverynote.jsp">Delivery Note</a></h2>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="deliverynote_form.jsp" ><input type="button"  value="+ New Delivery Note" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" style="height: 30px; width: 180px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;">
						&nbsp;&nbsp;
						<input type="button" value="Search" style="padding: 3px;">
						<br>
					</div>
					<br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
				
				<div id="scroll">
				<%
				try
				{
					String connectionURL = "jdbc:mysql://localhost:3306/db";
					Connection connection = null;
	
					Statement statement = null;

					ResultSet rs = null;

					Class.forName("com.mysql.jdbc.Driver").newInstance();

					connection = DriverManager.getConnection(connectionURL, "root", "39414247");

					statement = connection.createStatement();

					String QueryString = "SELECT dn_id, state from delivery_note where system_delete='false'";
					rs = statement.executeQuery(QueryString);
				
					while (rs.next())
					{
					%>
				
				 <div class="post">
					<p><a href="display_deliverynote.jsp?value=<%=rs.getString(1)%>"><%=rs.getString(1)%></a> &nbsp;&nbsp; <%=rs.getString(2)%></p>
				</div>
				<% 	
					} 
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
			<!-- end #content -->
			
			<div id="sidebar">
				<ul>
					<li>
						<h2>Categories</h2>
						<ul>
							<li><a href="home1.jsp">Homepage</a></li>
							<li><a href="purchasereceipt.jsp">Purchase Receipt</a></li>
							<li><a href="deliverynote.jsp">Delivery Note</a></li>
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
