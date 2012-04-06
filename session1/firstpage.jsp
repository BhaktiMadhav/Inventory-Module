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
         }%>

        <h1>For All 3</h1>
        <a href="logout.jsp" target="_self">Logout</a>
    </body>
</html>
