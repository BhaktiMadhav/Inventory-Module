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
	<script type="text/javascript">
	
function showCost()
{
	
	var ajaxRequest; 
	var qty=document.deliverynoteform.qty.value;
	var itemcode=document.deliverynoteform.itemcode.value;
	var queryString = "?qty=" + qty + "&itemcode=" + itemcode;
	
	try
	{
		ajaxRequest = new XMLHttpRequest();
	} 
	catch (e)
	{
		try
		{
			ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
		}
		catch (e)
		{
			alert("Your browser broke!");
			return false;
		}
		                       
    }
	ajaxRequest.onreadystatechange = function()
	{
		if(ajaxRequest.readyState == 4)
		{
			var ajaxDisplay = document.getElementById('ajaxDiv');
			ajaxDisplay.innerHTML = ajaxRequest.responseText;
		}
	}

	ajaxRequest.open("GET", "getcost.jsp" + queryString, true);
	ajaxRequest.send(null); 

}

</script>
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
					String QueryString = "SELECT MAX(dn_id)from delivery_note";
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
					<h2 class="title"><a href="deliverynote.jsp">Delivery Note</a></h2>
					<h3>Delivey Id No :  <%out.println(max);%></h3><br>
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
				<input type="hidden" name="dn_id" value="<%=max%>">
<table>
	
	
	<tr>
		<td>Customer_id:</td>
		<td>
		<%
					QueryString = "SELECT c_id from customer where system_delete='false' AND status='active'";
					rs = statement.executeQuery(QueryString);
				%>
					<select name="c_id">
					<option>---------Select---------</option>
				<%
					while (rs.next())
					{
				%>
						<option><%=rs.getString(1)%></option>
			
				<% 	} %>
		</td>
	</tr>
	
	<tr>
		<td>Address:</td>
		<td>
			<textarea rows="5" cols="15" name="address"></textarea>
		</td>
	</tr>
	
	<tr>
		<td>Mobile No.:</td>
		<td><input type="text" name="contact"></td>
	</tr>
	
	<tr>
		<td>Quantity Total:</td>
		<td><input type="text" name="qty"></td>
	</tr>
	
	<tr>
		<td>Item Code:</td>
		<td>
		<%
					QueryString = "SELECT item_code from item where system_delete='false' AND status='active'";
					rs = statement.executeQuery(QueryString);
				%>
					<select name="itemcode" onchange="showCost()">
					<option value="">---------Select---------</option>
				<%
					while (rs.next())
					{
				%>
						<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
			
				<% 	} %>
				
				
		</td>
	</tr>	

	<tr>
		<td>Total Amount:</td>
		<td><div id='ajaxDiv'></div></td>
	</tr>
	
	<script type="text/javascript">
	var d=new Date();
	</script>
	
	<tr>
		<td>Date:</td>
		<td><script>document.write(d);</script></td>
	</tr>				
	
	<tr>	
		<td>State:</td>
		<td><select name="state">
				<option>---------Select---------</option>
				<option>waiting</option>
				<option>confirmed</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td><input type="Submit" name="submit" value="Save" style="padding: 3px;" onclick="return validate();"></td>
		<td><input type="reset" name="reset" value="Reset"></td>
	</tr>
		
</table>
</form>
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
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>
