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
<%
	
	String p1=request.getParameter("value");
%>
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
					<h2 class="title"><a href="#">Vendor Id: <%out.println(p1);%> </a></h2>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="vendor_form.jsp" ><input type="button" value="+ New Vendor" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						<input type="button" value="Delete" style="padding: 3px;">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" style="height: 30px; width: 180px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;">
						&nbsp;&nbsp;
						<input type="button" value="Search" style="padding: 3px;">
						<br>
					</div>
					<br>
					<input type="checkbox" name="chkbox">Select All</input>
					<br><br>
					<form><input type="button" value="Refresh" style="padding: 3px;" onClick="window.location.reload()"></form>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
	
<!-- Enter Form details here-->			

				<form name="display_customer" method=post action="update_vendor.jsp">
				
				
<%			
	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con=null;
		ResultSet rs = null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st = con.createStatement();
		
		String QueryString = "SELECT * from vendor where v_id = '"+p1+"'";
		rs = st.executeQuery(QueryString);
		int i=1;
			while (rs.next())
			{
			%>
						<input type="hidden" name="v_id" value="<%=rs.getString(1)%>">
						
						<table>
							<tr>	
								<td>Name:</td>
								<td><input type="text" name="name" value="<%=rs.getString(2)%>"></td>
							</tr>
	
	<tr>
		<td>Address:</td>
		<td><textarea rows="5" cols="15" name="address"><%=rs.getString(3)%></textarea></td>
	</tr>
	<tr>	
		<td>Region:</td>
		<td>
		<%
		try
		{
					Statement st1 = null;

					ResultSet rs1 = null;
					Connection con1=null;
					con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","39414247");
					st1 = con1.createStatement();

					String QueryString1 = "SELECT region_name from region";
					rs1 = st1.executeQuery(QueryString1);
				%>
					<select name="region">
					<option><%=rs.getString(4)%></option>
					<option>---------Select---------</option>
				<%
					while (rs1.next())
					{
				%>
						<option><%=rs1.getString(1)%></option>
			
				<% 	} 

					rs1.close();
					st1.close();
					con1.close();
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
		<td>Contact No. :</td>
		<td><input type="text" name="contact" value="<%=rs.getString(5)%>"></td>
	</tr>

						
	<tr><br>
		<td><br><input type="submit" value="Update" style="padding: 3px;"></td>
		<td><br><a href="delete_vendor.jsp?value=<%=rs.getString(1)%>"><input type="button" value="Delete" style="padding: 3px;"></a></td>
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
	
	</form>			
	</table>
	

				
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
