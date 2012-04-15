<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%

	String p1=request.getParameter("itemgroup");
	String itemgroup=p1.trim();
	
	String p2=request.getParameter("itemname");
	String itemname=p2.trim();
	
	String p3=request.getParameter("brand");
	String brand=p3.trim();

	String p4=request.getParameter("defaultwarehouse");
	String defaultwarehouse=p4.trim();
	
	String p5=request.getParameter("defaultuom");
	String defaultuom=p5.trim();

	String p6=request.getParameter("description");
	String description=p6.trim();

	String p7=request.getParameter("minorderqty");
	String minorderqty=p7.trim();
	
	String p8=request.getParameter("cost");
	String cost=p8.trim();
	
	String p9=request.getParameter("itemcode");
	String itemcode=p9.trim();
	
	String p10=request.getParameter("status");
	String status=p10.trim();



	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
	
		Connection con=null;
		Statement st=null;
		ResultSet res=null;
		PreparedStatement ps = null;

		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");

		ps=con.prepareStatement("UPDATE item SET item_group=?,item_name=?,brand=?,default_warehouse=?,default_uom=?,description=?,minimum_order_qty=?,cost=?,status=? WHERE item_code=?");

		st=con.createStatement();
		
		ps.setString(10,itemcode);
		ps.setString(1,itemgroup);
		ps.setString(2,itemname);
		ps.setString(3,brand);
		ps.setString(4,defaultwarehouse);
		ps.setString(5,defaultuom);
		ps.setString(6,description);
		ps.setString(7,minorderqty);
		ps.setString(8,cost);
		ps.setString(9,status);
		
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





