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
			String t =session.getAttribute("ur_id").toString();
			String connectionURL2 = "jdbc:mysql://localhost:3306/db";
			Connection con2 = null;
			ResultSet rs2=null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con2 = DriverManager.getConnection(connectionURL2,"root","39414247");
			Statement st2 = con2.createStatement();
			String z2;
		
			z2="select display from permission where ur_id=\'"+t+"\' and page_name='customer' ";
			rs2=st2.executeQuery(z2);
			String flag_display="";
			while(rs2.next())
			{
				flag_display=rs2.getString(1);
			}
			
			if(flag_display.equals("false"))
			{
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", session.getAttribute("last_page").toString());
			}
			else
			{
				String url = new String("http://localhost:8080/simpleworld/customer_by_region_graph.jsp");
				session.setAttribute("last_page",url);
			
			%>

<head>
	<title>CUSTOMERS BY REGION </title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
	<%
					String count="";
					int count1,count2,count3,count4,count5,count6=0;
						
					String QueryString = "SELECT COUNT(*) from customer where region_name='Asia'";
					rs2= st2.executeQuery(QueryString);
					
					while (rs2.next())
					{
						count=rs2.getString(1);
					} 
					count1=Integer.parseInt(count);
					
					QueryString = "SELECT COUNT(*) from customer where region_name='Africa'";
					rs2= st2.executeQuery(QueryString);
					
					while (rs2.next())
					{
						count=rs2.getString(1);
					} 
					count2=Integer.parseInt(count);
					
					QueryString = "SELECT COUNT(*) from customer where region_name='America'";
					rs2= st2.executeQuery(QueryString);
					
					while (rs2.next())
					{
						count=rs2.getString(1);
					} 
					count3=Integer.parseInt(count);
					
					QueryString = "SELECT COUNT(*) from customer where region_name='Antartica'";
					rs2= st2.executeQuery(QueryString);
					
					while (rs2.next())
					{
						count=rs2.getString(1);
					} 
					count4=Integer.parseInt(count);
					
					QueryString = "SELECT COUNT(*) from customer where region_name='Europe'";
					rs2= st2.executeQuery(QueryString);
					
					while (rs2.next())
					{
						count=rs2.getString(1);
					} 
					count5=Integer.parseInt(count);
					
					QueryString = "SELECT COUNT(*) from customer where region_name='Australia'";
					rs2= st2.executeQuery(QueryString);
					
					while (rs2.next())
					{
						count=rs2.getString(1);
					} 
					count6=Integer.parseInt(count);
					
		%>
		<!-- BLUFF -->
		<script language="javascript" src="js/bluff/js-class.js" type="text/javascript"></script>
		<script language="javascript" src="js/bluff/bluff-min.js" type="text/javascript"></script>
		<!--[if IE]><script language="javascript" src="js/bluff/excanvas.js" type="text/javascript"></script><![endif]-->
		<!-- BLUFF -->
		<script type="text/javascript">

		var a= <%=count1%>;
		var b= <%=count2%>;
		var c= <%=count3%>;
		var d= <%=count4%>;
		var e= <%=count5%>;
		var f= <%=count6%>;
		
		  var data = {
					items: [{label: 'Customer from Asia', data: a},
							{label: 'Customer from Africa', data: b}, 
								{label: 'Customer from America', data: c},
								{label: 'Customer from Antartica', data: d},
										{label: 'Customer from Europe', data: e},
											{label: 'Customer from Australia', data: f}]
					};

		  // BLUFF
		  window.onload = function () {
			  var bluffGraph = new Bluff.Pie('bluffExample', 600);
			  bluffGraph.theme_keynote();
			  bluffGraph.title = 'Graph of Customer by Regions';

			  for (i in data.items) {
				var item = data.items[i];
				bluffGraph.data(item.label, item.data);
			  }
			  bluffGraph.draw();
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
					<li class="current_page_item"><a href="home1.jsp">HOMEPAGE</a></li>
					<li><a href="logout.jsp" target="_self">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="analysis.jsp">ANALYSIS</a></h2>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div>
					<br><br><br><center>
					 <canvas id="bluffExample"></canvas>
	
					<h1>Pie Chart</h1>
	    <%
				}
					rs2.close();
					st2.close();
					con2.close();
				}
				}				
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
					</center><br><br><br>
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
							<li><a href="change_pass.jsp">Change Password</a></li>
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

