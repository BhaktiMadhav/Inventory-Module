<%@ page language="java" import="java.sql.*" %>
<%
	
	String p1=request.getParameter("brand");
	String brand=p1.trim();

	String p2=request.getParameter("description");
	String description=p2.trim();

	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
	
		Connection con=null;
		Statement st=null;
		ResultSet res=null;
		PreparedStatement ps = null;

		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");

		String sql;
		sql = "UPDATE brand SET description=? WHERE brand=?";

		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setString(2,brand);
		ps.setString(1,description);
		
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





