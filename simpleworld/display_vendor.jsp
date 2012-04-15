<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
	<title>VENDOR</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

		<script language="javascript" type="text/javascript">
	function validate()
	{	
		var name = document.display_vendor.name.value;
		var address=document.display_vendor.address.value;;
		var region=document.display_vendor.region.value;
		var contact=document.display_vendor.contact.value;
		var status=document.display_vendor.status.value;
		var contact_len=contact.length;
		var msg="";
		var chk=true;
		if(name=="")
		{
			chk=false;
			msg=msg+"Please enter the Vendor Name \n";
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
					<li class="current_page_item"><a href="home1.jsp">Homepage</a></li>
					<li><a href="#">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
				<h2 class="title"><a href="#">Vendor </a></h2>
					<h3>Vendor Id: <%out.println(p1);%></h3>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="vendor_form.jsp" ><input type="button" value="+ New Vendor" style="padding: 3px;"></a>
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
	
<!-- Enter Form details here-->			

				<form name="display_vendor" method="post" action="update_vendor.jsp">
				
				
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
					con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
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

					%>
				</select>
		
		</td>
	</tr>
	<tr>	
		<td>Contact No. :</td>
		<td><input type="text" name="contact" value="<%=rs.getString(5)%>"></td>
	</tr>

	<tr>	
		<td>Status:</td>
		<td>
					<select name="status">
					<option><%=rs.getString(7)%></option>
					<option>---------Select---------</option>
					<option>active</option>
					<option>inactive</option>
				</select>
		
		</td>
	</tr>
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
						
	<tr><br>
		<td><br><input type="submit" value="Update" style="padding: 3px;" onclick="return validate();"></td>
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
