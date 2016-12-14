<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%@ page import="netscript.pojo.PoolCon" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$("table tr td #questiondeletebtn").click(function(){
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
<% 
 //PrintWriter pw = response.getWriter();
 PoolCon con= new PoolCon();
		  
	try {
		   Connection conn = con.getDbConnection();
		  
%>		  <div class='container'>
		  <center><h1>View All Question</h1></center>
		  <center>Search:</center>
		  <center><input type='text' placeholder='search'></center>
		  <table class='table table-bordered'>
<% 		   Statement smt = conn.createStatement();        
		   ResultSet rs=smt.executeQuery("select * from questions where isActive= 1");
		   ResultSetMetaData rsmd=rs.getMetaData();
		           
		   	//Table column names
%>	       <thead>
				<tr>
		           <th><%= rsmd.getColumnName(2)%></th>
		           <th><%=rsmd.getColumnName(3) %></th>
		           <th><%= rsmd.getColumnName(4)%></th>
		           <th><%= rsmd.getColumnName(5)%></th>
		           <th><%=rsmd.getColumnName(6) %></th>
		           <th>Action</th>
		        </tr>
		    </thead>
		   
<% 		   while(rs.next()){   %>
		    <tr>
		   		<td><%=rs.getString(2) %></td>
		   		<td><%=rs.getString(3) %></td>
		    	<td><%= rs.getString(4)%></td>
		    	<td><%=rs.getString(5) %></td>
		    	<td><%= rs.getString(6)%></td>
		    	<td><button type="button" class="btn btn-primary" id="questiondeletebtn" value="id=<%= rs.getString(1) %>">Delete</button></td>
		   </tr>
<% 	   }%>
		 </table>
		 </div>
		   
<% 		  } 
		  catch (Exception e) 
		  {
		   e.printStackTrace();
		  }
%>
</body>
</html>