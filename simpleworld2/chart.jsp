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
    JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/project",  
    "com.mysql.jdbc.Driver","root","39414247");  
      
    dataset.executeQuery(query);  
    JFreeChart chart = ChartFactory .createBarChart3D(  
    "Stockupdate",  
    "stock",  
    "price",  
    dataset,  
    PlotOrientation.VERTICAL,true, true, false);  
      
    CategoryPlot plot = chart.getCategoryPlot();  
    CategoryItemRenderer renderer = plot.getRenderer();  
      
    renderer.setSeriesPaint(0, Color.green);  
    try  
    {  
	ChartUtilities.saveChartAsJPEG(new File("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\simpleworld2\\chart.jpeg"), chart, 500, 450);  
    }  
    catch (IOException e)  
    {  
    System.out.println("Problem in creating chart.");  
    }  
	%>