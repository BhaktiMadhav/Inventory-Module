<%@ page language="java" import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <%
        
        if(session.getAttribute("user_id")==null)
            {
        String site = new String("http://localhost:8080/session1/simpleworld.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
         }
          session.removeAttribute("user_id") ;
		  session.removeAttribute("ur_id");
          session.invalidate();
        String site = new String("http://localhost:8080/session1/simpleworld.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);

          %>
    </body>
</html>
