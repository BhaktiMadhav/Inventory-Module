<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>CUSTOMER</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
	<script language="javascript" type="text/javascript">
	function validate()
	{	
		var name = document.customerform.name.value;
		var address=document.customerform.address.value;;
		var region=document.customerform.region.value;
		var contact=document.customerform.contact.value;
		var status=document.customerform.status.value;
		var contact_len=contact.length;
		var msg="";
		var chk=true;
		if(name=="")
		{
			chk=false;
			msg=msg+"Please enter the Customer Name \n";
		}
		if(address=="")
		{
			chk=false;
			msg=msg+"Please enter the Address \n";
		}
		if(region=="-------Select-------")
		{
			chk=false;
			msg=msg+"Please enter the Region \n";
		}
		if(contact=="")
		{
			chk=false;
			msg=msg+"Please enter the Contact No. \n";
		}
		else if(isNaN(contact))
		{
			chk=false;
			msg=msg+"Please Enter a VALID Mobile Number \n";
		}
		else if(contact_len!=10)
		{
			chk=false;
			msg=msg+"Please Enter a 10 digit Mobile Number \n";
		}
		if(status=="---------Select---------")
		{
			chk=false;
			msg=msg+"Please enter the Status \n";
		}
		if(!chk)
		{	
			alert(msg);
			return false;
		}
		else
		{
			return true;
		}
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
					
					String QueryString = "SELECT MAX(c_id) from customer";
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
				<h2 class="title"><a href="customer_form.jsp">New Customer </a></h2>
				<h3>Customer Id :  <%out.println(max);%></h3>
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
						<a href="customer_form.jsp" ><input type="button" value="+ New Customer" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<br>
					</div>
					<br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
				<div class="post">
				<table>
					<form name="customerform" method="post" action="customer_action.jsp">
						
							<tr>	
								<td>Name:</td>
								<td><input type="text" name="name" id="name"></td>
							</tr>
	
	<tr>
		<td>Address:</td>
		<td><textarea rows="5" cols="15" name="address" id="address"></textarea></td>
	</tr>
	<tr>	
		<td>Region:</td>
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

					String QueryString = "SELECT * from region";
					rs = statement.executeQuery(QueryString);
				%>
					<select name="region" id="region">
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
		<td>Contact No. :</td>
		<td><input type="text" name="contact" id="contact"></td>
	</tr>
	<tr>	
		<td>Status:</td>
		<td><select name="status">
				<option>---------Select---------</option>
				<option>active</option>
				<option>inactive</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><br><input type="submit"  value="Save" style="padding: 3px;" onclick="return validate();"/></td>
		<td><br><input type="reset" name="reset" value="Reset" style="padding: 3px;"></td>
	</tr>
					
	</form>			
	</table>
	<br><br>
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
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<!-- end #page -->
		<div id="footer">
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>

