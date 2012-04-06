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
					<li><a href="#">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		
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

					String max1="";
					
					String QueryString = "SELECT MAX(item_code)from item";
					rs = statement.executeQuery(QueryString);
		
					while (rs.next())
					{
							max1=rs.getString(1);
					}
					int max=Integer.parseInt(max1);
					max++;
					
				%>
		
		
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="item.jsp">New Item </a></h2>
					<h3>Item Code :  <%out.println(max);%></h3>
				<%
					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="item_form.jsp" ><input type="button" value="+ New Item" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" style="height: 30px; width: 180px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;">
						&nbsp;&nbsp;
						<input type="button" value="Search" style="padding: 3px;">
						<br>
					</div>
					<br>
					<form><input type="button" value="Refresh" style="padding: 3px;" onClick="window.location.reload()"></form>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
				
				
<!-- Enter Form details here-->			

				<form name="itemform" method="post" action="item_action.jsp">
<table>
	<tr>
		<td>Item_Group:</td>
		<td>
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

					String QueryString = "SELECT * from item_group";
					rs = statement.executeQuery(QueryString);
				%>
					<select name="itemgroup">
					<option>---------Select---------</option>
				<%
					while (rs.next())
					{
				%>
						<option><%=rs.getString(1)%></option>
			
				<% 	} 

					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
				</select>
		</td>
	</tr>
	
	<tr>
		<td>Item Name:</td>
		<td><input type="text" name="itemname"></td>
	</tr>
	
	<tr>
		<td>Brand:</td>
		<td>
		
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

					String QueryString = "SELECT * from brand";
					rs = statement.executeQuery(QueryString);
				%>
					<select name="brand">
					<option>---------Select---------</option>
				<%
					while (rs.next())
					{
				%>
						<option><%=rs.getString(1)%></option>
			
				<% 	} 

					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
				</select>
		
		</td>
	</tr>
	
		<tr>
		<td>Default_Warehouse:</td>
		<td>
		
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

					String QueryString = "SELECT * from warehouse";
					rs = statement.executeQuery(QueryString);
				%>
					<select name="defaultwarehouse">
					<option>---------Select---------</option>
				<%
					while (rs.next())
					{
				%>
						<option><%=rs.getString(1)%></option>
			
				<% 	} 

					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
				</select>
		</td>
	</tr>
	
	<tr>
		<td>Default_UOM</td>
		<td>	
		
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

					String QueryString = "SELECT * from uom";
					rs = statement.executeQuery(QueryString);
				%>
					<select name="defaultuom">
					<option>-------Select-------</option>
				<%
					while (rs.next())
					{
				%>
						<option><%=rs.getString(1)%></option>
			
				<% 	} 

					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
				</select>
		</td>
	</tr>
		
	<tr>
		<td>Description:</td>
		<td>
			<textarea rows="5" cols="15" name="description"></textarea>
		</td>
	</tr>

	<tr>
		<td>Minimum_order_Qty:</td>
		<td><input type="text" name="minorderqty"></td>
	</tr>

	<tr>
		<td>Cost:</td>
		<td><input type="text" name="cost"></td>
	</tr>

	<tr>
		<td><input type="Submit" name="submit" value="Save" style="padding: 3px;"></td>
		<td><input type="reset" name="reset" value="Reset" style="padding: 3px;"></td>
	</tr>
	
</table>
</form>

				
					<div id="dot"></div>
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
		<!-- end #page -->
		<div id="footer">
			<p>Copyright (c) 2012 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>
