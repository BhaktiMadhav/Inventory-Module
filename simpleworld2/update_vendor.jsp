<%@ page language="java" import="java.sql.*" %>
<%
	
	String p1=request.getParameter("name");
	String name=p1.trim();

	String p2=request.getParameter("address");
	String address=p2.trim();

	String p3=request.getParameter("region");
	String region=p3.trim();

	String p4=request.getParameter("contact");
	String contact=p4.trim();
	
	String p5=request.getParameter("v_id");
	String v_id=p5.trim();

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
		sql = "UPDATE vendor SET name=?,address=?,region=?,mobile_no=? WHERE v_id=?";

		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setString(5,name);
		ps.setString(1,name);
		ps.setString(2,address);
		ps.setString(3,region);
		ps.setString(4,contact);
		
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





