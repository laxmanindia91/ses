<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="netscript.pojo.PoolCon" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>exam start</title>
<script>
	$(document).ready(function(){
		$("#test_submit").click(function(){
			var datastring = $('form').serialize();
			//alert(datastring);
			var method= $("form").attr('method');
			$.ajax({
				type:method,
				data: datastring,
				url: 'submittest.jsp',
				success: function(result){
					$("#studentDiv").html(result);
				}
			});
		});	
	});
</script>
</head>
<body>
<div class="container">
<form  method ="post">
<% 
String duration="",totalquestion="",totalmarks="",levelvalue="",question="",options="",answer="",categories="",string1="";
int questionid=0,count=1,count1=1,tempid=1,totalcount;
PrintWriter pw=response.getWriter();

try
{
	PoolCon pcon=new PoolCon();
	Connection conn=pcon.getDbConnection();
	
	Statement stmt1=conn.createStatement();
	String query="select * from exam where exam_name='"+session.getAttribute("examname_values")+"'";
	//pw.println("select * from exam where exam_name="+session.getAttribute("examname_values")+"");
	ResultSet rs1=stmt1.executeQuery(query);
	while(rs1.next())
	{
		categories=rs1.getString(9);
		duration=rs1.getString(3);
		totalquestion=rs1.getString(6);
		totalmarks=rs1.getString(7);
		levelvalue=rs1.getString(8);
	}
	session.setAttribute("totalmarks", totalmarks);
	//Question
	Statement stmt2t = conn.createStatement() ;
	//pw.println("select * from questions where category in("+categories+") AND level='"+levelvalue+"' ORDER BY RAND() LIMIT "+totalquestion+"");
	ResultSet resultset =stmt2t.executeQuery("select * from questions where category in("+categories+") AND level='"+levelvalue+"' ORDER BY RAND() LIMIT "+totalquestion+"");
	while(resultset.next())
	{
		questionid=resultset.getInt(1);
		question=resultset.getString(2);
		
	//Question_options
		Statement stmt3 = conn.createStatement();
		ResultSet resultset2 =stmt3.executeQuery("select * from ques_option where question_id="+questionid+"");
		while(resultset2.next())
		{
			options= resultset2.getString(3);
			answer=resultset2.getString(4);
%>
		<div id="questiondiv">
			<b>Question<%= count++ %>:&nbsp;</b><%=question %>  <b><%= questionid %></b>
			
			<input type="hidden" name="questionids" value="<%=questionid%>"/>
			<input type="hidden" name="correctanswer" value="<%=answer%>"/>
<%
				String optionsperate[]=options.split(",");
				int optionlength=optionsperate.length;
				for(String str:optionsperate)
				{
%> 					<div><input type="radio" value="<%=tempid%>" name="choice<%=questionid%>"/><%= str %></div>
<%		 					tempid++;	
				}			
				if(optionlength<=tempid)
				{
					tempid=1;
				}
%>		</div>	
<%		}
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
		<div><button type="button" class="btn btn-primary" id="test_submit">Submit</button></div>
</form>
</div>
</body>
</html>