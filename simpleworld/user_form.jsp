<%@ page import="java.sql.*" %> 
<html>
<head>
	<title>CUSTOMER</title>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Marvel|Delius+Unicase' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo' rel='stylesheet' type='text/css'>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
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
		
		<%
				try
				{
					String connectionURL = "jdbc:mysql://localhost:3306/db";
					Connection connection = null;
	
					Statement statement = null;

					ResultSet rs = null;

					Class.forName("com.mysql.jdbc.Driver").newInstance();

					connection = DriverManager.getConnection(connectionURL, "root", "39414247");

					statement = connection.createStatement();
		
					String max1="";
					
					String QueryString = "SELECT MAX(user_id) from user";
					rs = statement.executeQuery(QueryString);
					
					while (rs.next())
					{
							max1=rs.getString(1);
					}
					int max=Integer.parseInt(max1);
					max++;
					%>
		
		
		<div id="page">
			<div id="content">
				<div class="post">
				<h2 class="title"><a href="user_form.jsp">New User </a></h2>
				<h3>User Id :  <%out.println(max);%></h3>
				<%
					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
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
				<div class="post">
				<table>
					<form name="userform" method="post" action="user_action.jsp">
					<%
				try
				{
					String connectionURL = "jdbc:mysql://localhost:3306/db";
					Connection connection = null;
	
					Statement statement = null;

					ResultSet rs = null;

					Class.forName("com.mysql.jdbc.Driver").newInstance();

					connection = DriverManager.getConnection(connectionURL, "root", "39414247");

					statement = connection.createStatement();	
					String QueryString = "SELECT user_role from user_role";
					rs = statement.executeQuery(QueryString);%>
					<tr>	
					<td>User_Role:</td>
					<td><select name="user_role">
					<option>-------Select-------</option>
				<%
					while (rs.next())
					{
				%>
						<option><%=rs.getString(1)%></option>
			
				<% 	} %>	
				</select>
				</td>
				</tr>
				
							<tr>	
								<td>Name:</td>
								<td><input type="text" name="name" ></td>
							</tr>
	
	<tr>
		<td>Address:</td>
		<td><textarea rows="5" cols="15" name="address"></textarea></td>
	</tr>
	<tr>	
		<td>Salary :</td>
		<td><input type="text" name="salary"></td>
	</tr>
	<tr>	
	
	<tr>	
		<td>Password :</td>
		<td><input type="password" name="password"></td>
	</tr>
	
	<tr>
		<td><br><input type="submit"  value="Save" style="padding: 3px;" onclick="return validate();"/></td>
		<td><br><input type="reset" name="reset" value="Reset" style="padding: 3px;"></td>
	</tr>	
				<% 	

					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>	
	</form>			
	</table>
	<br><br>
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

