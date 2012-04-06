<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
			 
			String t="";
			if(session.getAttribute("userid")!=null)
				t =session.getAttribute("userid").toString();
				
			  String connectionURL = "jdbc:mysql://localhost:3306/session";
        Connection con = null;
		ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(connectionURL,"root","39414247");
        Statement st = con.createStatement();
		String z,z1;
        z="select id from user_role where role='Administrator'";
        rs=st.executeQuery(z);
        String c1="";
        while(rs.next())
            {
            c1=rs.getString(1);
            }
		  
		 z="select id from user_role where role='Manager'";
        rs=st.executeQuery(z);
        String c2="";
        while(rs.next())
            {
            c2=rs.getString(1);
            }
				
		if(session.getAttribute("userid")==null)
        {  
        String site = new String("http://localhost:8080/session1/index.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
        }	
		else if(t.equals(c1) || t.equals(c2))
		{
			%>
			<h1>For Admin and Manager</h1>
			<a href="logout.jsp" target="_self">Logout</a>
		<%}
		
		else
        {
		out.println("Sorry u not allowed to access this page");
        
		}
        %>
		
    </body>
</html>
