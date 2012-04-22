<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
		
        String connectionURL = "jdbc:mysql://localhost:3306/db";
        Connection con = null;
		ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(connectionURL,"root","39414247");
        Statement st = con.createStatement();
        String x = request.getParameter("userid");
        String y = request.getParameter("password");
        String z;
        z="select * from user where user_id=\'"+x+"\' and password=\'"+y+"\'";
        rs=st.executeQuery(z);
        int c=0;
        while(rs.next())
        {
            c++;
        }
        
        if (c==0)
        {
			String site = new String("http://localhost:8080/simpleworld/index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
        }
        else
        {
			
			String ur_id="";
			z="select ur_id from user where user_id=\'"+x+"\' and password=\'"+y+"\'";
			rs=st.executeQuery(z);
			while(rs.next())
            {
				ur_id=rs.getString(1);
            }
			
			session.setAttribute("user_id",x);
			session.setAttribute("ur_id",ur_id);
			
			String user_role="";
			z="select user_role from user_role where ur_id=\'"+ur_id+"\'";
			rs=st.executeQuery(z);
			while(rs.next())
            {
				user_role=rs.getString(1);
            }
			String site="";
		
			site= new String("http://localhost:8080/simpleworld/home1.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
			
		}

        %>
    </body>
</html>
