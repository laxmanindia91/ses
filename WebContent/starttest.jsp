<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="netscript.pojo.PoolCon" %>
 <%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Important Instructions about Exam</title>
<script>
	$(document).ready(function(){
		//start button2 in student dash board
		$(".startbtn2").click(function(){
			$.ajax({
				url:'Exam.jsp',
				success: function(result){
				$("#studentDiv").show().html(result);}
			});
		});
	});
</script>
</head>
<body>
<div class="container">
<table class="table table-bordered">
<thead><tr><th colspan="2" class="headercolor">Important Instructions</th></tr></thead>
<tbody>
<%
PrintWriter pw=response.getWriter();
String testid="",totalquestion="",totalmarks="",level="";
String examname=request.getParameter("exam_name");
session.setAttribute("examname_values", examname);
//pw.print(session.getAttribute("examname_values"));
try{
	PoolCon pcon=new PoolCon();
	Connection conn=pcon.getDbConnection();
	Statement stmt=conn.createStatement();
	String query="select * from exam where exam_name='"+examname+"'";
	ResultSet rs=stmt.executeQuery(query);
	while(rs.next())
	{
		testid=rs.getString(1);
		totalquestion=rs.getString(6);
		totalmarks=rs.getString(7);
		level=rs.getString(8);
		session.setAttribute("test_id", testid);	
		session.setAttribute("test_level", level);
%> 		
		<tr><td>Total Question:</td><td><%=totalquestion %></td></tr>
		<tr><td>Total Marks:</td><td><%=totalmarks %></td></tr>
		<tr><td>Level:</td><td><%=level %></td></tr>
		<tr><td>Note:</td><td>Each question carry 2 marks.</td></tr>
<% 
	}
}	
catch(Exception e){
	e.printStackTrace();
}

%>	
<tr><td colspan="2" align="center"><button type="submit" class="btn btn-success startbtn2">Start Test</button></td></tr>
</tbody>
</table>
</div>
</body>
</html>