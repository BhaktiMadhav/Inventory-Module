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
		ResultSet rs2;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con2 = DriverManager.getConnection(connectionURL2,"root","39414247");
        Statement st2 = con2.createStatement();
		String z2;
		z2="select form from permission where ur_id=\'"+t+"\' and page_name='warehouse' ";
        rs2=st2.executeQuery(z2);
        String flag_form="";
        while(rs2.next())
        {
            flag_form=rs2.getString(1);
        }
	
		z2="select list from permission where ur_id=\'"+t+"\' and page_name='warehouse'";
        rs2=st2.executeQuery(z2);
        String flag_list="";
        while(rs2.next())
        {
            flag_list=rs2.getString(1);
        }
	
		%>
<head>
	<title>WAREHOUSE</title>
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
					<h2 class="title"><a href="warehouse.jsp">Warehouse List</a></h2>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
					
					<form name="search" action="search_warehouse.jsp"><br>
					<%if(flag_form.equals("true")){%><a href="warehouse_form.jsp"><input type="button" value="+ New Warehouse" style="padding: 3px;"></a><%}%>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" style="height: 30px; width: 180px; margin-left: 24px; border: 1px solid rgb(170, 170, 170);  border-radius: 3px 3px 3px 3px;" name="warehouse">
						&nbsp;&nbsp;
						<input type="button" value="Search" style="padding: 3px;">
						</form>
					</div>
					<br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
				
				<div id="scroll">
				<%if(flag_list.equals("true"))
				{
					String warehouse=(request.getParameter("warehouse")).trim();
					String QueryString = "SELECT default_warehouse from warehouse where default_warehouse LIKE '"+warehouse+"%'";
					rs2 = st2.executeQuery(QueryString);
				
					while (rs2.next())
					{
					%>
				
				<div class="post">
					<p><a href="display_warehouse.jsp?value=<%=rs2.getString(1)%>"><%=rs2.getString(1)%></a></p>
				</div>
				<% 	
					}
					String url = new String("http://localhost:8080/simpleworld/warehouse.jsp");
					session.setAttribute("last_page",url);
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
			catch (Exception ex)
			{
				out.println(ex);
			}
				%>
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
		<!-- end #page -->
		<div id="footer">
		</div>
	</div>
</div>
<!-- end #footer -->
</body>
</html>