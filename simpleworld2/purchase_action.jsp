<%@ page language="java" import="java.sql.*" %>
<%
	
	String p1=request.getParameter("names");
	String names=p1.trim();

	String p2=request.getParameter("address");
	String address=p2.trim();

	String p3=request.getParameter("contact");
	String contact=p3.trim();

	String p4=request.getParameter("transdate");
	String transdate=p4.trim();

	String p5=request.getParameter("transpname");
	String transpname=p5.trim();

	String p6=request.getParameter("lrno");
	String lrno=p6.trim();

	String p7=request.getParameter("lrdate");
	String lrdate=p7.trim();

	String p8=request.getParameter("purchaseorder");
	String purchaseorder=p8.trim();

	String p9=request.getParameter("nettotal");
	String nettotal=p9.trim();

	String p10=request.getParameter("grandtotal");
	String grandtotal=p10.trim();

	String p11=request.getParameter("inwords");
	String inwords=p11.trim();

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
		sql = "INSERT INTO item(name,address,contact,transaction_date,transporter_name,lr_no,lr_date,purchase_order,net_total,grand_total,in_words) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setString(1,names);
		ps.setString(2,address);
		ps.setString(3,contact);
		ps.setString(4,transdate);
		ps.setString(5,transpname);
		ps.setString(6,lrno);
		ps.setString(7,lrdate);
		ps.setString(8,purchaseorder);
		ps.setString(9,nettotal);
		ps.setString(10,grandtotal);
		ps.setString(11,inwords);
		
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





