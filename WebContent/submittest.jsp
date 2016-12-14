<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="netscript.pojo.PoolCon"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>submit test procedure</title>
<script>
$(document).ready(function(){
	$("#refreshbtn").click(function(){
		window.location.reload();
	});
});
</script>
</head>
<body>
<%
String dbAnswer="",categoryid="",choices="";
int count=0,totalcount=0,choicescount=0,choicelength=0,correctanswercount=0,wrongcount=0,unattemptcount=0,totalAttempt=0,totalmarksobtained=0;

PrintWriter pw= response.getWriter();
PoolCon pcon=new PoolCon();
Connection conn=pcon.getDbConnection();

Date date=new Date();
SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
String dates=formatter.format(date);
session.setAttribute("currentdatetime", dates);	

String[] correctanswer=request.getParameterValues("correctanswer");
String[] questionidsr=request.getParameterValues("questionids");

		for(String ids : questionidsr)
		{
			choices=request.getParameter("choice"+ids);
			try{
					Statement stmt1=conn.createStatement();
					String query="select * from ques_option where question_id='"+ids+"'";
					ResultSet rs1=stmt1.executeQuery(query);
					while(rs1.next()){
						dbAnswer=rs1.getString(4);
						if(dbAnswer.equals(choices)){
							correctanswercount++;
						}
						else if(choices==null){
							unattemptcount++;
						}
						else{
							wrongcount++;
						}
					}	
				}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		totalAttempt=correctanswercount+wrongcount;
		totalmarksobtained=2*correctanswercount;
		
		//categoryid
		Statement stmt2=conn.createStatement();
		String query2="select * from exam where id='"+session.getAttribute("test_id")+"'";
		ResultSet rs2=stmt2.executeQuery(query2);
		while(rs2.next())
		{
			categoryid=rs2.getString(9);
		}
		//save result
		Statement stmt12=conn.createStatement();
		String query1="insert into result(exam_id,usr_id,marks_obtained,total_marks,created_on,test_level,category) values('"+session.getAttribute("test_id")+"','"+session.getAttribute("userid")+"','"+totalmarksobtained+"','"+session.getAttribute("totalmarks")+"','"+session.getAttribute("currentdatetime")+"','"+session.getAttribute("test_level")+"','"+categoryid+"')";
		PreparedStatement pst = conn.prepareStatement(query1);
		pst.executeUpdate(query1);	
	
%>
	<table class="table table-bordered table-striped">
		<thead align="center"><tr><th colspan="2">Result</th></tr></thead>
		<tbody>
				<tr><td>Correct Attempts:</td><td><%=correctanswercount %></td></tr>
				<tr><td>Wrong Attempts:</td><td><%=wrongcount %></td></tr>
				<tr><td>UnAttempts:</td><td><%=unattemptcount %></td></tr>
				<tr><td>Total Attempts:</td><td><%=totalAttempt%></td></tr>
				<tr><td>Marks Obtained (<b>out of <%=session.getAttribute("totalmarks")%></b>):</td><td><%=totalmarksobtained %></td></tr>
		</tbody>
	</table>

<center><button type="button" class="btn btn-info" id="refreshbtn"><span class="glyphicon glyphicon-refresh"></span> Close</button></center>
</body>
</html>