<%@ page language="java" import="java.sql.*" %>
<%
	
	String p1=request.getParameter("qty");
	int qty=Integer.parseInt(p1.trim());
	
	String p2=request.getParameter("itemcode");
	String itemcode=p2.trim();
	
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