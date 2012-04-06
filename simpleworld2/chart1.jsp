<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities"%>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@ page import="org.jfree.chart.renderer.category.CategoryItemRenderer"%>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="java.awt.Color"%>
<%
String query="SELECT * from chart";
JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/s2sgateway",
"com.mysql.jdbc.Driver","root","root");

dataset.executeQuery( query);
JFreeChart chart = ChartFactory .createBarChart3D(
"Chart Creation",
"Student Names",
"Days Present",
dataset,
PlotOrientation.VERTICAL,true, true, false);

CategoryPlot plot = chart.getCategoryPlot();
CategoryItemRenderer renderer = plot.getRenderer();

renderer.setSeriesPaint(0, Color.green);
try
{
ChartUtilities.saveChartAsJPEG(new File("c:\\chart.jpg"), chart, 500, 450);
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
%>
<img src="c:\\chart.jpg" width=500 height=450>