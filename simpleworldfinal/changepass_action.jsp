<%@ page language="java" import="java.sql.*" %>
 <%
		if(session.getAttribute("user_id")==null)
        {
			String site = new String("http://localhost:8080/simpleworld/index.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site);
		}
		 
	String t1 =session.getAttribute("user_id").toString();
	
	String p1=request.getParameter("oldpass").trim();
	String p2=request.getParameter("newpass1").trim();
	String p3=request.getParameter("newpass2").trim();
try
{
		
	String connectionURL = "jdbc:mysql://localhost:3306/db";
    Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs=null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection(connectionURL,"root","39414247");
    Statement st = con.createStatement();
	String msg="";
	
	String z;
        z="select password from user where user_id=\'"+t1+"\'";
        rs=st.executeQuery(z);
        String c1="";
        while(rs.next())
            {
            c1=rs.getString(1);
            }
		if(!p2.equals(p3))
			msg="New password not matching";			
		else
		{
			if(!c1.equals(p1))
				msg=msg+" Enter your old password correctly";
			else
			{
				ps=con.prepareStatement("UPDATE user SET password=? WHERE user_id=?");
				ps.setString(2, t1);
				ps.setString(1, p2);
				ps.executeUpdate();
				msg=msg+" Updated Successfully";
			}
		}
		
		out.println(msg);
		con.close();
		rs.close();
		st.close();
		ps.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>	