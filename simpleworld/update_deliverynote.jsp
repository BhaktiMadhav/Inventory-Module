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
	
	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
	
		Connection con=null;
		Statement st=null;
		ResultSet res=null;
		PreparedStatement ps = null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		st=con.createStatement();
		String QueryString = "SELECT cost from item where item_code=\'"+itemcode+"\'";
		res = st.executeQuery(QueryString);
		
		int cost=0;
		
		while (res.next())
		{
				cost=Integer.parseInt(res.getString(1));
		}
		
		cost=qty*cost;		
		out.println(cost);
		String sql;
		sql = "UPDATE delivery_note SET c_id=?,shipping_address=?,mobile_no=?,item_code=?,quantity=?,total_amount=?,system_delete=?,state=? WHERE dn_id=?";

		ps = con.prepareStatement(sql);
		st=con.createStatement();

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
		
		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setString(1,itemcode);
		ps.setInt(2,dn_id);
		ps.setString(3,v_type);
		ps.setInt(4,qty);
		
		ps.executeUpdate();
		
		out.println("Record Updated Successfully !");

		res.close();
		st.close();
		con.close(); 
		ps.close();
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






