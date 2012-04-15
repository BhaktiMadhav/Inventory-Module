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

	<script language="javascript" type="text/javascript">
function validate()
	{	
		var user_role=document.userform.user_role.value;
		var name = document.userform.name.value;
		var address=document.userform.address.value;;
		var salary=document.userform.salary.value;
		var password=document.userform.password.value;
		
		var msg="";
		var chk=true;
		if(user_role=="-------Select-------")
		{
			chk=false;
			msg=msg+"Please enter the User Role \n";
		}
		if(name=="")
		{
			chk=false;
			msg=msg+"Please enter the User Name \n";
		}
		if(address=="")
		{
			chk=false;
			msg=msg+"Please enter the Address \n";
		}
		
		if(salary=="")
		{
			chk=false;
			msg=msg+"Please enter the Salary \n";
		}
		else if(isNaN(salary))
		{
			chk=false;
			msg=msg+"Please Enter VALID Salary \n";
		}
		if(password=="")
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
	
			String p1=request.getParameter("value");
		%>
		<div id="page">
			<div id="content">
				<div class="post">
					<h2 class="title"><a href="user.jsp">USER </a></h2>
					<h3>Customer Id: <%out.println(p1);%></h3>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="user_form.jsp" ><input type="button" value="+ New User" style="padding: 3px;"></a>
						&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
						<br>
					</div>
					<br>
					<div style="border-top: 3px solid rgb(119, 119, 119);"></div><br>
				</div>
	
<!-- Enter Form details here-->			

				<form name="userform" method="post" action="update_user.jsp">

				
<%			
	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con=null;
		ResultSet rs = null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st = con.createStatement();
		
		String QueryString = "SELECT * from user where user_id = '"+p1+"'";
		rs = st.executeQuery(QueryString);
		int i=1;
			while (rs.next())
			{
			%>

					<input type="hidden" name="user_id" value="<%=rs.getString(1)%>">
						<table>
			<%
						try
		{
					Statement st1 = null;

					ResultSet rs1 = null;
					Connection con1=null;
					con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
					st1 = con1.createStatement();
						
					 QueryString = "SELECT user_role from user_role where ur_id=\'"+rs.getString(2)+"\'";
					rs1 = st1.executeQuery(QueryString);%>
					<tr>	
					<td>User_Role:</td>
					<td><select name="user_role">
				<%
					while (rs1.next())
					{
				%>
						<option><%=rs1.getString(1)%></option>
			
				<% 	} %>	
				<option>-------Select-------</option>
				<%
					QueryString = "SELECT user_role from user_role";
					rs1 = st1.executeQuery(QueryString);
					while (rs1.next())
					{
				%>
						<option><%=rs1.getString(1)%></option>
			
				<% 	} %>	
				
				</select>
				</td>
				</tr>
							<tr>	
								<td>Name:</td>
								<td><input type="text" name="name" value="<%=rs.getString(3)%>"></td>
							</tr>
	
	<tr>
		<td>Address:</td>
		<td><textarea rows="5" cols="15" name="address"><%=rs.getString(4)%></textarea></td>
	</tr>
	
	<tr>	
		<td>Salary :</td>
		<td><input type="text" name="salary" value="<%=rs.getString(5)%>"></td>
	</tr>
		
	<tr>
		<td><br><input type="submit" value="Update" style="padding: 3px;" onclick="return validate();"/></td>
		<td><br><a href="delete_user.jsp?value=<%=rs.getString(1)%>"><input type="button" value="Delete" style="padding: 3px;"></a></td>
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
	
<br><br>
				
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
