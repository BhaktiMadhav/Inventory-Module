<%@ page language="java" import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	<%
	String t="";
	String t1="";
	if(session.getAttribute("userid")!=null)
	{
				t =session.getAttribute("userid").toString();
				t1 =session.getAttribute("accuserid").toString();
					}
		if(session.getAttribute("userid")==null)
            {
			  
        String site = new String("http://localhost:8080/session1/index.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
         }
		 
		 
		 else
		{
			
				
		String connectionURL = "jdbc:mysql://localhost:3306/session";
        Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(connectionURL,"root","39414247");
        Statement st = con.createStatement();
		String p1=request.getParameter("oldpass").trim();
		String p2=request.getParameter("newpass1").trim();
		String p3=request.getParameter("newpass2").trim();
	
		String z;
        z="select password from user where user_id=\'"+t1+"\'";
        rs=st.executeQuery(z);
        String c1="aaa";
        while(rs.next())
            {
            c1=rs.getString(1);
            }
			out.println(t1);
			out.println(c1);
			out.println(p2+"   "+p3);
		if(!p2.equals(p3))
			out.println("New password not matchin");
			
		else
		{
			if(!c1.equals(p1))
				out.println("Enter your old password correctly");
			else
			{
				ps=con.prepareStatement("UPDATE user SET password=? WHERE user_id=?");
				ps.setString(2, t1);
				ps.setString(1, p2);
				ps.executeUpdate();
				out.println("Updated Successfully");
			}
		}
		}
		%>