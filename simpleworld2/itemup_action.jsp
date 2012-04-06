<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%

	String p1=request.getParameter("itemcode");
	String itemcode=p1.trim();

	String p2=request.getParameter("itemname");
	String itemname=p2.trim();
	
	String p3=request.getParameter("itemgroup");
	String itemgroup=p3.trim();

	String p4=request.getParameter("brand");
	String brand=p4.trim();
	
	String p5=request.getParameter("description");
	String description=p5.trim();
	
	String p6=request.getParameter("defaultuom");
	String defaultuom=p6.trim();

	String p7=request.getParameter("defaultwarehouse");
	String defaultwarehouse=p7.trim();

	String p8=request.getParameter("minorderqty");
	String minorderqty=p8.trim();

	String p9=request.getParameter("lastpurchaserate");
	String lastpurchaserate=p9.trim();



	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
	
		Connection con=null;
		Statement st=null;
		ResultSet res=null;
		PreparedStatement ps = null;

		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");

		ps=con.prepareStatement("UPDATE item SET item_name=?,item_group=?,brand=?,description=?,default_uom=?,default_warehouse=?,minimum_order_qty=?,last_purchase_rate=? WHERE item_code=?");

		st=con.createStatement();
		
		ps.setString(9,itemcode);
		ps.setString(1,itemname);
		ps.setString(2,itemgroup);
		ps.setString(3,brand);
		ps.setString(4,description);
		ps.setString(5,defaultuom);
		ps.setString(6,defaultwarehouse);
		ps.setString(7,minorderqty);
		ps.setString(8,lastpurchaserate);
		
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





