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

		String max1="";
					
		QueryString = "SELECT MAX(pr_id) from purchase_receipt";
		rs = st.executeQuery(QueryString);
					
		while (rs.next())
		{
			max1=rs.getString(1);
		}
		int max=Integer.parseInt(max1);
		max++;
		
		String sql;
		sql = "INSERT INTO pr_cost(cost,pr_id) VALUES (?,?)";
		ps = con.prepareStatement(sql);
		st=con.createStatement();

		ps.setInt(1,cost);
		ps.setInt(2,max);
	
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