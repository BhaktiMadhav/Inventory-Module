<%@ page language="java" import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String connectionURL = "jdbc:mysql://localhost:3306/session";
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
			 String site = new String("http://localhost:8080/session1/index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
           
            }
        else
            {
			String id1="";
			z="select id from user where user_id=\'"+x+"\' and password=\'"+y+"\'";
			rs=st.executeQuery(z);
			while(rs.next())
            {
				id1=rs.getString(1);
            }
			con.close();
            String site= new String("http://localhost:8080/session1/changepass.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
            session.setAttribute("userid",id1);
			session.setAttribute("accuserid",x);
        }

        %>
    </body>
</html>
