<%@ page language="java" import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
        
        if(session.getAttribute("userid")==null)
            {
        String site = new String("http://localhost:8080/session1/index.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
         }
		 else
		 {
		 %>
		 <form method=post action="changepass_action.jsp">
		Enter your old Password :<input type="text" name="oldpass" value=""\>
		Enter new password :<input type="text" name="newpass1" value=""\>
		Renter new password :<input type="text" name="newpass2" value=""\>
        <input type="submit" value="Change password">
		<% } %>
        <a href="logout.jsp" target="_self">Logout</a>
    </body>
</html>
