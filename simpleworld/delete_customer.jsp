<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
	<title>CUSTOMER</title>
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
					<h2 class="title"><a href="customer.jsp">Customer</a></h2>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
					<a href="customer_form.jsp"><input type="button"  value="+ New Customer" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<br>
					</div>
					<br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
				
				
<%
	
	String p1=request.getParameter("value");
	String c_id=p1.trim();
	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con=null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st=null;
		ResultSet res=null;
		PreparedStatement ps = null;
		
		String sys_del="true";
		
		String sql;
		sql = "UPDATE customer SET system_delete=? WHERE c_id=?";

		ps = con.prepareStatement(sql);
		st=con.createStatement();
		
		ps.setString(2,c_id);
		ps.setString(1,sys_del);
		
		ps.executeUpdate();
		out.println("Record Deleted Successfully !");
		
		res.close();
		st.close();
		con.close(); 
		ps.close();
	}
	catch (Exception e)
	{
		out.println(e);
	}
%>
					
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
