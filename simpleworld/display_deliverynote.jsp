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
		<div id="page">
			<div id="content">
				<div class="post">
				<%String p1=request.getParameter("value");%>
					<h2 class="title"><a href="deliverynote.jsp">Delivery Note</a></h2>
					<h3>Delivery Note No. :  <%out.println(p1);%></h3>
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
<%	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con = null;
		Connection con1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		String QueryString,QueryString1;
		con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		st1 = con1.createStatement();
		
		QueryString = "SELECT * from delivery_note where dn_id = '"+p1+"'";
		rs = st.executeQuery(QueryString);
		int i=1;
			while (rs.next())
			{
			%>	
			<form name="deliverynoteform" method="post" action="update_deliverynote.jsp">
			<input type="hidden" name="dn_id" value="<%=p1%>"/>
<table>

	<tr>
		<td>Customer_id:</td>
		<td>
		<%
					QueryString1 = "SELECT c_id from customer where system_delete='false' AND status='active'";
					rs1 = st1.executeQuery(QueryString1);
				%>
					<select name="c_id">
					<option><%=rs.getString(2)%></option>
					<option>---------Select---------</option>
				<%
					while (rs1.next())
					{
				%>
						<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
			
				<% 	} %>
		</td>
	</tr>
	
	<tr>
		<td>Address:</td>
		<td>
			<textarea rows="5" cols="15" name="address"><%=rs.getString(3)%></textarea>
		</td>
	</tr>
	
	<tr>
		<td>Mobile No.:</td>
		<td><input type="text" name="contact" value="<%=rs.getString(4)%>"></td>
	</tr>
	
	<tr>
		<td>Quantity Total:</td>
		<td><input type="text" name="qty" value="<%=rs.getString(6)%>"></td>
	</tr>
	
	<tr>
		<td>Item Code:</td>
		<td>
		<%
					QueryString1 = "SELECT item_code from item where system_delete='false' AND status='active'";
					rs1 = st1.executeQuery(QueryString1);
				%>
					<select name="itemcode" onchange="showCost()">
					<option><%=rs.getString(5)%></option>
					<option value="">---------Select---------</option>
				<%
					while (rs1.next())
					{
				%>
						<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
			
				<% 	} %>
				
				
		</td>
	</tr>	

	<tr>
		<td>Total Amount:</td>
		<td><div id='ajaxDiv'><input type="text" name="cost" value="<%=rs.getString(7)%>"></div></td>
	</tr>		
		
	<tr>	
		<td>State:</td>
		<td><select name="state" value="<%=rs.getString(10)%>">>
				<option>---------Select---------</option>
				<option>waiting</option>
				<option>confirmed</option>
			</select>
		</td>
	</tr>
	
</table>

<%		QueryString1 = "SELECT state from delivery_note where dn_id=\'"+p1+"\'";
		rs1 = st1.executeQuery(QueryString1);
		String c="";
        while(rs1.next())
        {
            c=rs1.getString(1);
        }
		if(c.trim().equals("waiting"))
		{
			%>
		<tr>
		<td>&nbsp;<input type="submit" value="Update" style="padding: 3px;"></td><%
		}%>
		<td>&nbsp;&nbsp;&nbsp;<a href="delete_deliverynote.jsp?value=<%=rs.getString(1)%>"><input type="button" value="Delete" style="padding: 3px;"></a></td>
	</tr>
	</form>
</table>
<%
	}
					rs1.close();
					st1.close();
					con1.close();
					rs.close();
					st.close();
					con.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
</form><br><br>
				
					<div id="dot"></div>
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
