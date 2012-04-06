<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
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
					
					String QueryString = "SELECT MAX(item_code)from item";
					rs = statement.executeQuery(QueryString);
		
					while (rs.next())
					{
							max1=rs.getString(1);
					}
					int max=Integer.parseInt(max1);
					max++;
					
					rs.close();
			statement.close();
			connection.close();
				
			

			
		} 
				catch (Exception ex)
				{
					out.println(ex);
				}
				%>