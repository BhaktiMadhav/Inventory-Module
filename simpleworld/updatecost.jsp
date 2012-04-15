<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<%
	
	String p1=request.getParameter("qty");
	int qty=Integer.parseInt(p1.trim());
	
	String p2=request.getParameter("itemcode");
	String itemcode=p2.trim();
	
	String p3=request.getParameter("pr_id");
	String pr_id=p3.trim();
	
	try
	{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver).newInstance();
		Connection con=null;
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","39414247");
		Statement st=null;
		ResultSet rs=null;
		st = con.createStatement();
		PreparedStatement ps = null;

		String QueryString = "SELECT cost from item where item_code=\'"+itemcode+"\'";
		rs = st.executeQuery(QueryString);
		
		int cost=0;
		
		while (rs.next())
		{
				cost=Integer.parseInt(rs.getString(1));
		}
		
		cost=qty*cost;
		String cost1=Integer.toString(cost1);
					
		String sql = "UPDATE purchase_receipt SET total_amount=? WHERE pr_id=?";

		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setString(2,pr_id);
		ps.setString(1,cost1);
		
		ps.executeUpdate();
	
		out.println(cost);
		rs.close();
		st.close();
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>				