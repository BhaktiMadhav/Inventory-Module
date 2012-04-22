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
		
			z2="select form from permission where ur_id=\'"+t+"\' and page_name='user' ";
			rs2=st2.executeQuery(z2);
			String flag_form="";
			while(rs2.next())
			{
				flag_form=rs2.getString(1);
			}
		
			z2="select list from permission where ur_id=\'"+t+"\' and page_name='user'";
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
				String url = new String("http://localhost:8080/simpleworld/user_form.jsp");
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
		
		<%	String max1="";
					
			String QueryString = "SELECT MAX(user_id) from user";
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
					<h2 class="title"><a href="user_form.jsp">New User </a></h2>
					<h3>User Id :  <%out.println(max);%></h3>
					<div style="padding: 3px; background-color: rgb(226, 222, 203); border-radius: 3px 3px 3px 3px;">
						<a href="user_form.jsp" ><input type="button" value="+ New User" style="padding: 3px;"></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<br>
					</div><br>
					<div style="border-top: 3px solid rgb(119, 119, 119);">
					</div><br>
				</div>
				
				<div class="post">
				<table>
					<form name="userform" method="post" action="user_action.jsp">
				<%
			
					QueryString = "SELECT user_role from user_role";
					rs2 = st2.executeQuery(QueryString);%>
					<tr>	
					<td>User_Role:</td>
					<td><select name="user_role">
					<option>-------Select-------</option>
				<%
					while (rs2.next())
					{
				%>
						<option><%=rs2.getString(1)%></option>
			
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
	</tr>	<%
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

