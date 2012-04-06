<%@ page language="java" import="java.sql.*" %>
<%

	String p1=request.getParameter("itemcode");
	String itemname=p1.trim();
	
	out.println(p1);
	%>