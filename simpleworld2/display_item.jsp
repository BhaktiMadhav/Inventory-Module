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
		
		
		<form name="itemupform" method=post action="update_item.jsp">
		
		<div id="page">
			<div id="content">
				<div class="post">
				<%String p1=request.getParameter("value");%>
					<h2 class="title"><a href="item.jsp">Item</a></h2>
					<h3>Item Code :  <%out.println(p1);%></h3>
					<br>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="item_form.jsp" ><input type="button" value="+ New Item" style="padding: 3px;"></a>
						<br>
					</div>
					<br>
					
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
	
<!-- Enter Form details here-->			

			
				
			
<%	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con=null;
		ResultSet rs = null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st = con.createStatement();
		
		String QueryString = "SELECT * from item where item_code = '"+p1+"'";
		rs = st.executeQuery(QueryString);
		int i=1;
			while (rs.next())
			{
			%>
		<input type="hidden" name="itemcode" value="<%=rs.getString(1)%>">
<table>	
	
	<tr>
		<td>Item_Group:</td>
		<td>
		<%
		try
		{
					Statement st1 = null;

					ResultSet rs1 = null;
					Connection con1=null;
					con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
					st1 = con1.createStatement();

					String QueryString1 = "SELECT item_group from item_group";
					rs1 = st1.executeQuery(QueryString1);
				%>
					<select name="itemgroup">
					<option><%=rs.getString(2)%></option>
					<option>---------Select---------</option>
				<%
					while (rs1.next())
					{
				%>
						<option><%=rs1.getString(1)%></option>
			
				<% 	} 

					
				%>
				</select>
			</td>	
	</tr>
	
	<tr>
		<td>Item Name:</td>
		<td><input type="text" name="itemname" value="<%=rs.getString(3)%>"></td>
	</tr>
	
	<tr>
		<td>Brand:</td>
		<td>
		<%
					QueryString1 = "SELECT brand from brand";
					rs1 = st1.executeQuery(QueryString1);
				%>
					<select name="brand">
					<option><%=rs.getString(4)%></option>
					<option>---------Select---------</option>
				<%
					while (rs1.next())
					{
				%>
						<option><%=rs1.getString(1)%></option>
			
				<% 	} 

					
				%>
				</select>
			</td>	
	</tr>
	
	
	<tr>
		<td>Default_Warehouse:</td>
		<td>
		<%
				QueryString1 = "SELECT * from warehouse";
				rs1 = st1.executeQuery(QueryString1);
				%>
					<select name="defaultwarehouse">
					<option><%=rs.getString(5)%></option>
					<option>---------Select---------</option>
				<%
					while (rs1.next())
					{
				%>
						<option><%=rs1.getString(1)%></option>
			
				<% 	} 

					
				%>
				</select>
		</td>
	</tr>
	
	<tr>
		<td>Default_UOM</td>
		<td>
		<%
					QueryString1 = "SELECT default_uom from uom";
					rs1 = st1.executeQuery(QueryString1);
				%>
					<select name="defaultuom">
					<option><%=rs.getString(6)%></option>
					<option>---------Select---------</option>
				<%
					while (rs1.next())
					{
				%>
						<option><%=rs1.getString(1)%></option>
			
				<% 	} 

					
				%>
				</select>
			</td>	
		<%
					rs1.close();
					st1.close();
					con1.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
			%>
	</tr>
		
	<tr>
		<td>Description:</td>
		<td>
			<textarea rows="5" cols="15" name="description" ><%=rs.getString(7)%></textarea>
		</td>
	</tr>
	

	<tr>
		<td>Minimum_order_qty:</td>
		<td><input type="text" name="minorderqty" value="<%=rs.getString(8)%>"></td>
	</tr>
			
	<tr>
		<td>Cost:</td>
		<td><input type="text" name="cost" value="<%=rs.getString(9)%>"></td>
	</tr>
	<br>
	<tr>
		<td><br><input type="submit" value="Update" style="padding: 3px;"></td>
		<td><br><a href="delete_item.jsp?value=<%=rs.getString(1)%>"><input type="button" value="Delete" style="padding: 3px;"></td>
	</tr>
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
		
</table>
</form><br><br>
				
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
