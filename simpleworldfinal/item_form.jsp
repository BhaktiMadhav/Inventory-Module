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
		
			z2="select form from permission where ur_id=\'"+t+"\' and page_name='item' ";
			rs2=st2.executeQuery(z2);
			String flag_form="";
			while(rs2.next())
			{
				flag_form=rs2.getString(1);
			}
		
			z2="select list from permission where ur_id=\'"+t+"\' and page_name='item'";
			rs2=st2.executeQuery(z2);
			String flag_list="";
			while(rs2.next())
			{
				flag_list=rs2.getString(1);
			}
		
			if(flag_form.equals("false"))
			{
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", session.getAttribute("last_page").toString());
			}
			
			else
			{
				String url = new String("http://localhost:8080/simpleworld/item_form.jsp");
				session.setAttribute("last_page",url);
	%>
	
<head>
	<title>Item</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
		<script language="javascript" type="text/javascript">
	function validate()
	{	
		var itemgroup = document.itemform.itemgroup.value;
		var itemname=document.itemform.itemname.value;
		var brand=document.itemform.brand.value;
		var defaultwarehouse=document.itemform.defaultwarehouse.value;
		var defaultuom=document.itemform.defaultuom.value;
		var minorderqty=document.itemform.minorderqty.value;
		var cost=document.itemform.cost.value;
		var status=document.itemform.status.value;
		
		var msg="";
		var chk=true;
		if(itemgroup=="---------Select---------")
		{
			chk=false;
			msg=msg+"Please enter the Item Group \n";
		}
		if(itemname=="")
		{
			chk=false;
			msg=msg+"Please enter the Item Name \n";
		}
		if(brand=="---------Select---------")
		{
			chk=false;
			msg=msg+"Please enter the Brand \n";
		}
		if(defaultwarehouse=="---------Select---------")
		{
			chk=false;
			msg=msg+"Please enter the Warehouse \n";
		}
		if(defaultuom=="---------Select---------")
		{
			chk=false;
			msg=msg+"Please enter the UOM \n";
		}
		if(minorderqty=="")
		{
			chk=false;
			msg=msg+"Please enter the Minimum Quantity Level \n";
		}
		if(cost=="")
		{
			chk=false;
			msg=msg+"Please enter the COST \n";
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
					<li><a href="logout.jsp" target="_self">Logout</a></li>
					
				</ul>
			</div>
		</div>
		<!-- end #header -->
		
		<%
					String max1="";
					
					String QueryString = "SELECT MAX(item_code)from item";
					rs2 = st2.executeQuery(QueryString);
		
					while (rs2.next())
					{
							max1=rs2.getString(1);
					}
					int max=Integer.parseInt(max1);
					max++;
					
				%>
		
		
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="item.jsp">New Item </a></h2>
					<h3>Item Code :  <%out.println(max);%></h3>
		
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="item_form.jsp" ><input type="button" value="+ New Item" style="padding: 3px;"></a>
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

				<form name="itemform" method="post" action="item_action.jsp">
<table>
	<tr>
		<td>Item_Group:</td>
		<td>
			<%
				
					QueryString = "SELECT * from item_group";
					rs2 = st2.executeQuery(QueryString);
				%>
					<select name="itemgroup">
					<option>---------Select---------</option>
				<%
					while (rs2.next())
					{
				%>
						<option><%=rs2.getString(1)%></option>
			
				<% 	} 
				%>
				</select>
		</td>
	</tr>
	
	<tr>
		<td>Item Name:</td>
		<td><input type="text" name="itemname"></td>
	</tr>
	
	<tr>
		<td>Brand:</td>
		<td>
		
			<%
					QueryString = "SELECT * from brand";
					rs2 = st2.executeQuery(QueryString);
				%>
					<select name="brand">
					<option>---------Select---------</option>
				<%
					while (rs2.next())
					{
				%>
						<option><%=rs2.getString(1)%></option>
			
				<% 	}
				%>
				</select>
		
		</td>
	</tr>
	
		<tr>
		<td>Default_Warehouse:</td>
		<td>
		
		<%
					QueryString = "SELECT * from warehouse";
					rs2 = st2.executeQuery(QueryString);
				%>
					<select name="defaultwarehouse">
					<option>---------Select---------</option>
				<%
					while (rs2.next())
					{
				%>
						<option><%=rs2.getString(1)%></option>
			
				<% 	} 
				%>
				</select>
		</td>
	</tr>
	
	<tr>
		<td>Default_UOM</td>
		<td>	
		
		<%
				QueryString = "SELECT * from uom";
				rs2 = st2.executeQuery(QueryString);
				%>
					<select name="defaultuom">
					<option>---------Select---------</option>
				<%
					while (rs2.next())
					{
				%>
						<option><%=rs2.getString(1)%></option>
			
				<% 	} 
				%>
				</select>
		</td>
	</tr>
		
	<tr>
		<td>Description:</td>
		<td>
			<textarea rows="5" cols="15" name="description"></textarea>
		</td>
	</tr>

	<tr>
		<td>Minimum_order_Qty:</td>
		<td><input type="text" name="minorderqty"></td>
	</tr>

	<tr>
		<td>Cost:</td>
		<td><input type="text" name="cost"></td>
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
		<td><input type="Submit" name="submit" value="Save" style="padding: 3px;" onclick="return validate();"></td>
		<td><input type="reset" name="reset" value="Reset" style="padding: 3px;"></td>
	</tr>
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
	
</table>
</form>

				
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
