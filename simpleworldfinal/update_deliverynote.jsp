<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
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
			String 	t =session.getAttribute("ur_id").toString();
			String connectionURL2 = "jdbc:mysql://localhost:3306/db";
			Connection con2 = null;
			ResultSet rs2=null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con2 = DriverManager.getConnection(connectionURL2,"root","39414247");
			Statement st2 = con2.createStatement();
			String z2;
		
			z2="select update_form from permission where ur_id=\'"+t+"\' and page_name='deliverynote' ";
			rs2=st2.executeQuery(z2);
			String flag_update="";
			while(rs2.next())
			{
				flag_update=rs2.getString(1);
			}
			if(flag_update.equals("false"))
			{
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", session.getAttribute("last_page").toString());
			}
			else
			{
				String url = new String("http://localhost:8080/simpleworld/update_deliverynote.jsp");
				session.setAttribute("last_page",url);
				%>

<head>
	<title>DELIVERY NOTE</title>
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
					<li><a href="logout.jsp" target="_self">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="deliverynote.jsp">DELIVERY NOTE</a></h2>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
					<a href="deliverynote_form.jsp"><input type="button"  value="+ New Delivery Note" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<br>
					</div>
					<br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
<%
	
	String p1=request.getParameter("c_id");
	String c_id=p1.trim();

	String p2=request.getParameter("address");
	String address=p2.trim();

	String p3=request.getParameter("contact");
	String contact=p3.trim();

	String p4=request.getParameter("qty");
	int qty=Integer.parseInt(p4.trim());

	String p5=request.getParameter("itemcode");
	String itemcode=p5.trim();
	
	String p6=request.getParameter("dn_id");
	String dn_id=p6.trim();
	
	String p7=request.getParameter("state");
	String state=p7.trim();

	String sys_del="false";
	String v_type="Delivery Note";
	
		PreparedStatement ps = null;
		
		st2=con2.createStatement();
		String QueryString = "SELECT cost from item where item_code=\'"+itemcode+"\'";
		rs2 = st2.executeQuery(QueryString);
		
		int cost=0;
		
		while (rs2.next())
		{
				cost=Integer.parseInt(rs2.getString(1));
		}
		
		cost=qty*cost;		
		out.println(cost);
		String sql;
		sql = "UPDATE delivery_note SET c_id=?,shipping_address=?,mobile_no=?,item_code=?,quantity=?,total_amount=?,system_delete=?,state=? WHERE dn_id=?";

		ps = con2.prepareStatement(sql);
		st2=con2.createStatement();

		ps.setString(9,dn_id);
		ps.setString(1,c_id);
		ps.setString(2,address);
		ps.setString(3,contact);
		ps.setString(4,itemcode);
		ps.setInt(5,qty);
		ps.setInt(6,cost);
		ps.setString(7,sys_del);
		ps.setString(8,state);
		
		ps.executeUpdate();
		
		sql = "INSERT INTO stock_ledger(item_code,voucher_id,voucher_type,transaction_qty) VALUES (?,?,?,?)";
		
		ps = con2.prepareStatement(sql);
		st2=con2.createStatement();

		ps.setString(1,itemcode);
		ps.setString(2,dn_id);
		ps.setString(3,v_type);
		ps.setInt(4,qty);
		
		ps.executeUpdate();
		
		out.println("Record Updated Successfully !");
		ps.close();
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
							<li><a href="change_pass.jsp">Change Password</a></li>
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






