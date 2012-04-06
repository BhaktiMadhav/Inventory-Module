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
					<form><input type="button" value="Refresh" style="padding: 3px;" onClick="window.location.reload()"></form>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
	
<!-- Enter Form details here-->			

				<form name="deliverynoteform" method="post" action="delivery_action.jsp">
<table>
	
	
	<tr>
		<td>Id:</td>
		<td><input type="text" name="id"></td>
	</tr>
	
	<tr>
		<td>Name:</td>
		<td><input type="text" name="names"></td>
	</tr>

	<tr>
		<td>Customer Name:</td>
		<td><input type="text" name="customername"></td>
	</tr>
	
	<tr>
		<td>Shipping Address:</td>
		<td>
			<textarea rows="5" cols="15" name="shippingaddress"></textarea>
		</td>
	</tr>
	
	<tr>
		<td>Contact:</td>
		<td><input type="text" name="contact"></td>
	</tr>
	
	
	<tr>
		<td>Sales Order:</td>
		<td><input type="text" name="salesorder"></td>
		
	</tr>
	
	<tr>
		<td>Net Total:</td>
		<td><input type="text" name="nettotal"></td>
	</tr>
	
	<tr>
		<td>Vat:</td>
		<td><input type="text" name="vat"></td>
	</tr>
	<tr>
		<td>Education Tax:</td>
		<td><input type="text" name="educationtax"></td>
	</tr>
	<tr>
		<td>Grand Total:</td>
		<td><input type="text" name="grandtotal"></td>
	</tr>
		<tr>
		<td>Rounded Total:</td>
		<td><input type="text" name="roundedtotal"></td>
	</tr>

	<tr>
		<td>In Words:</td>
		<td><input type="text" name="inwords"></td>
	</tr>

	<tr>
		<td><input type="Submit" name="submit" value="Register"></td>
		<td><input type="reset" name="reset" value="Reset"></td>
	</tr>
		
	<tr>
		<td><input type="button" name="display" value="Display"></td>
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
