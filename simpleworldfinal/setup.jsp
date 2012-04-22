<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
	<title>SETUP</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<%
		try
		{		
		
		if(session.getAttribute("user_id")==null)
        {  
        String site = new String("http://localhost:8080/simpleworld/index.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
        }	
		
		else
		{
		String t =session.getAttribute("ur_id").toString();
		String connectionURL2 = "jdbc:mysql://localhost:3306/db";
        Connection con2 = null;
		ResultSet rs2=null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con2 = DriverManager.getConnection(connectionURL2,"root","39414247");
        Statement st2 = con2.createStatement();
		String z2;
			
		z2="select list from permission where ur_id=\'"+t+"\' and page_name='setup'";
        rs2=st2.executeQuery(z2);
        String flag_list="";
        while(rs2.next())
        {
            flag_list=rs2.getString(1);
        }
		if(flag_list.equals("true"))
		{
		
		String url = new String("http://localhost:8080/simpleworld/setup.jsp");
		session.setAttribute("last_page",url);
	%>

<body>
<div id="wrapper">
	<div id="wrapper2">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#">Simple <span>World</span></a></h1>
			</div>
			<div id="menu">
				<ul>
					<li class="current_page_item"><a href="home1.jsp">HOMEPAGE</a></li>
					<li><a href="logout.jsp" target="_self">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="setup.jsp">SETUP</a></h2>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br>
					<br>
					<div style="width: 48%; float: left;">
						<a href="itemgroup.jsp"><font size="4">Item Group</font></a><br> 
						<i>Tree of Item Classification</i>
						<br><br><br>
						<a href="brand.jsp"><font size="4">Brand</font></a><br> 
						<i>List of Item Brands</i>
						<br><br>
					</div>
					<div style="width: 48%; float: right;">
							<a href="UOM.jsp"><font size="4">UOM</font></a><br>   
							<i>Unit of Measure(UOM) Master</i>
							<br><br><br>
					</div>
				</div>				
			</div>
			<!-- end #content -->
			<%
			}
			else
			{
					response.setStatus(response.SC_MOVED_TEMPORARILY);
					response.setHeader("Location", session.getAttribute("last_page").toString());
				
			} 
			rs2.close();
			st2.close();
			con2.close();
		}
		}
		catch(Exception e)
		{
			out.println(e);
		}
				%>
			
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
