<%@ page language="java" import="java.sql.*" %>
<%
	
	String p1=request.getParameter("id");
	String id=p1.trim();

	String p2=request.getParameter("names");
	String names=p2.trim();

	String p3=request.getParameter("customername");
	String customername=p3.trim();

	String p4=request.getParameter("shippingaddress");
	String shippingaddress=p4.trim();

	String p5=request.getParameter("contact");
	String contact=p5.trim();

	String p6=request.getParameter("salesorder");
	String salesorder=p6.trim();

	String p7=request.getParameter("nettotal");
	String nettotal=p7.trim();

	String p8=request.getParameter("vat");
	String vat=p8.trim();

	String p9=request.getParameter("educationtax");
	String educationtax=p9.trim();

	String p10=request.getParameter("grandtotal");
	String grandtotal=p10.trim();

	
	String p11=request.getParameter("roundedtotal");
	String roundedtotal=p11.trim();

	String p12=request.getParameter("inwords");
	String reorderlevel=p12.trim();

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
		sql = "INSERT INTO item(id,name,customer_name,shipping_address,contact,sales_order,net_total,vat,education_tax,grand_total,rounded_total,in_words) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setString(1,id);
		ps.setString(2,names);
		ps.setString(3,customername);
		ps.setString(4,shippingaddress);
		ps.setString(5,contact);
		ps.setString(6,salesorder);
		ps.setString(7,nettotal);
		ps.setString(8,vat);
		ps.setString(9,educationtax);
		ps.setString(10,grandtotal);
		ps.setString(11,roundedtotal);
		ps.setString(12,inwords);

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





