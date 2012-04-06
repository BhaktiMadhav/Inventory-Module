<%@ page language="java" import="java.sql.*" %>
<%
	
	String p1=request.getParameter("default_uom");
	String defaultuom=p1.trim();
	
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
		sql = "INSERT INTO uom(default_uom) VALUES (?)";

		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setString(1,defaultuom);
		
		ps.executeUpdate();
		out.println("Record Entered Successfully !");

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





