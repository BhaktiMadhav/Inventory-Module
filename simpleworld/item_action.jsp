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

<%
	try
	{		
		String t="";
		if(session.getAttribute("ur_id")!=null)
			t =session.getAttribute("ur_id").toString();
			
		if(session.getAttribute("user_id")==null)
        {  
        String site = new String("http://localhost:8080/simpleworld/index.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
        }	
		
		else
		{
		
			String connectionURL2 = "jdbc:mysql://localhost:3306/db";
			Connection con2 = null;
			ResultSet rs2=null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con2 = DriverManager.getConnection(connectionURL2,"root","39414247");
			Statement st2 = con2.createStatement();
			String z2;
		
			z2="select form from permission where ur_id=\'"+t+"\' and page_name='item' ";
			rs2=st2.executeQuery(z2);
			String flag_form="";
			while(rs2.next())
			{
				flag_form=rs2.getString(1);
			}
		
			if(flag_form.equals("false"))
			{
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", session.getAttribute("last_page").toString());
			}
			
			else
			{
				String url = new String("http://localhost:8080/simpleworld/item_action.jsp");
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
						<li class="current_page_item"><a href="home1.jsp">Homepage</a></li>
						<li><a href="logout.jsp" target="_self">Logout</a></li>
					
					</ul>
				</div>
			</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="item.jsp">Item</a></h2>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
					<a href="item_form.jsp"><input type="button"  value="+ New Item" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<br>
					</div>
					<br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>

<%
	
	String p1=request.getParameter("itemgroup");
	String itemgroup=p1.trim();
	
	String p2=request.getParameter("itemname");
	String itemname=p2.trim();
	
	String p3=request.getParameter("brand");
	String brand=p3.trim();

	String p4=request.getParameter("defaultwarehouse");
	String defaultwarehouse=p4.trim();
	
	String p5=request.getParameter("defaultuom");
	String defaultuom=p5.trim();

	String p6=request.getParameter("description");
	String description=p6.trim();

	String p7=request.getParameter("minorderqty");
	String minorderqty=p7.trim();
	
	String p8=request.getParameter("cost");
	String cost=p8.trim();
	
	String p9=request.getParameter("status");
	String status=p9.trim();
	
	String sys_del="false";

		PreparedStatement ps = null;

		String sql;
		sql = "INSERT INTO item(item_group,item_name,brand,default_warehouse,default_uom,description,minimum_order_qty,cost,system_delete,status) VALUES (?,?,?,?,?,?,?,?,?,?)";

		ps = con2.prepareStatement(sql);
		st2=con2.createStatement();

		ps.setString(1,itemgroup);
		ps.setString(2,itemname);
		ps.setString(3,brand);
		ps.setString(4,defaultwarehouse);
		ps.setString(5,defaultuom);
		ps.setString(6,description);
		ps.setString(7,minorderqty);
		ps.setString(8,cost);
		ps.setString(9,sys_del);
		ps.setString(10,status);

		ps.executeUpdate();
		out.println("Record Entered Successfully !");

		rs2.close();
		st2.close();
		con2.close(); 
		ps.close();
	}
	}
	}

	catch(Exception e)
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






