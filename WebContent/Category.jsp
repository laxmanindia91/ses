<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%@ page import="netscript.pojo.PoolCon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Category</title>
</head>
<body>
<div class="container">
<div class="col-md-4 table-responsive">
<table class="table table-hover table-striped">
<thead><tr><th>Category names</th><th>isActive</th></tr></thead>
<%
try{
	PoolCon pcon=new PoolCon();
	Connection conn=pcon.getDbConnection();
	Statement statement = conn.createStatement() ;
	resultset =statement.executeQuery("select * from category") ;
	
	while(resultset.next())
	{
	%>	<tr>
			<td><%= resultset.getString(2) %></td>
			<td><%= resultset.getString(3) %></td>
		</tr>
	<% }
}
catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</div>
</div>
</body>
</html>
