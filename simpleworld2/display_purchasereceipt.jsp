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
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="purchasereceipt.jsp">Purchase Receipt</a></h2>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="purchasereceipt_form.jsp" ><input type="button"  value="+ New PurchaseReceipt" style="padding: 3px;"></a>
						&nbsp;&nbsp;
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

				<form name="purchasereceipt" method=post action="purchase_action.jsp">
				
				<%
	
	String p1=request.getParameter("value");
	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con=null;
		ResultSet rs = null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st = con.createStatement();
		
		String QueryString = "SELECT * from purchase_receipt where name= '"+p1+"'";
		rs = st.executeQuery(QueryString);
		int i=1;
			while (rs.next())
			{
			%>
<table>
	
	
	<tr>
		<td>Name:</td>
		<td><input type="text" name="names" value="<%=rs.getString(1)%>"></td>
	</tr>

	
	<tr>
		<td>Address:</td>
		<td>
			<textarea rows="5" cols="15" name="address"><%=rs.getString(4)%></textarea>
		</td>
	</tr>
	
	<tr>
		<td>Contact:</td>
		<td><input type="text" name="contact" value="<%=rs.getString(4)%>"></td>
	</tr>
	
	<tr>
		<td>Transaction Date:</td>
		<td><input type="text" name="transdate" value="<%=rs.getString(4)%>"></td>
	</tr>
	

	<tr>
		<td>Transporter Name:</td>
		<td><input type="text" name="transpname" value="<%=rs.getString(4)%>"></td>
	</tr>
	
	<tr>
		<td>LR No.:</td>
		<td><input type="text" name="lrno" value="<%=rs.getString(4)%>"></td>
		
	</tr>
	
	<tr>
		<td>LR Date:</td>
		<td><input type="text" name="lrdate" value="<%=rs.getString(4)%>"></td>
	</tr>
	
	<tr>
		<td>Purchase Order:</td>
		<td><input type="text" name="purchaseorder" value="<%=rs.getString(4)%>"></td>
	</tr>
	<tr>
		<td>Net Total:</td>
		<td><input type="text" name="nettotal" value="<%=rs.getString(4)%>"></td>
	</tr>
	<tr>
		<td>Grand Total:</td>
		<td><input type="text" name="grandtotal" value="<%=rs.getString(4)%>"></td>
	</tr>
	<tr>
		<td>In Words:</td>
		<td><input type="text" name="inwords" value="<%=rs.getString(4)%>"></td>
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

	<tr>
		<td><input type="button" value="Update" style="padding: 3px;"></td>
		<td><input type="button" value="Delete" style="padding: 3px;"></td>
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
