<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%@ page import="netscript.pojo.PoolCon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$("table tr td #userdeletebtn").click(function(){
			var datastring=$(this).val();
			$.ajax({
				data: datastring,
				url: 'Delete',
				success: function(result){
					//$(".containerdiv2").hide();	
					$("#admindiv").html(result);	
				}
			});
		});
	});
</script>
</head>
<body>
<div class="container">
<%
//PrintWriter pw = response.getWriter();
PoolCon con= new PoolCon();
	try {
		   Connection conn = con.getDbConnection();
		    
%>   <div class='container'>
		<h1 align='center'>View All Users</h1>
		 <table class='table table-bordered' id='tableuser'>
<%   	Statement smt = conn.createStatement();        
		ResultSet rs=smt.executeQuery("select * from user where isActive= 1");
		ResultSetMetaData rsmd=rs.getMetaData();
		           
		//Table column names
%>      <thead>
			<tr>
		    	<th><%= rsmd.getColumnName(2)%></th>
		     	<th><%=rsmd.getColumnName(3) %></th>
		     	<th><%=rsmd.getColumnName(4) %></th>
		      	<th><%=rsmd.getColumnName(5) %></th>
		      	<th>Action</th>
		    </tr>
		 </thead>
<%  
		   while(rs.next())
		   {
%> 	   <tr>
			<td><%= rs.getString(2)%></td>
			<td><%=rs.getString(3) %></td>
			<td><%= rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><button type="button" class="btn btn-primary" id="userdeletebtn" value="userid=<%= rs.getString(1) %>">Delete</button></td>
		</tr>
<% } %>
		 </table>
		  </div>
		   
<%		  } 
		  catch (Exception e)
		  {
		   e.printStackTrace();
		  }
 %>
</div>
</body>
</html>