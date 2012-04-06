<%@ page import="java.sql.*" %> 
<html>
<head>
<script language="javascript" type="text/javascript">
	function validate( )
	{	
		var name = document.customerform.name.value;
		alert(name);
	}
</script>
</head>
<body>
<%
				try
				{
					String connectionURL = "jdbc:mysql://localhost:3306/project";
					Connection connection = null;
	
					Statement statement = null;

					ResultSet rs = null;

					Class.forName("com.mysql.jdbc.Driver").newInstance();

					connection = DriverManager.getConnection(connectionURL, "root", "39414247");

					statement = connection.createStatement();

					String QueryString = "SELECT * from region where region_name='America' ";
					rs = statement.executeQuery(QueryString);

					while (rs.next())
					{
				%>
						<form method="post" name="customerform">
						<input type="text" name="name" value="<%=rs.getString(1)%>"/>
						<input type="submit" value="okay" onclick="return validate();"/>
						</form>
				<% 	} 

					rs.close();
					statement.close();
					connection.close();
				} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>
				</select>