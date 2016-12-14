<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%@ page import="netscript.pojo.PoolCon" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Question(Content)</title>
<script>
$(document).ready(function(){
	$("#questionbtn").click(function(){
			var method = $('#addQuestions').attr('method');
			var datastring=$("#addQuestions").serialize();
			$.ajax({
				type: method,
				data: datastring,
				url: 'QuestionServlet',
				success: function(result)
				{
					$("#admindiv").html(result);
					$('#addQuestions')[0].reset();
				}
			});
		});
	});
</script>
</head>
<body>
<div class="container">
<!-- first section-->
<form method="post" id="addQuestions">
<%
Date date=new Date();
SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
String dates=formatter.format(date);
//pw.print(dates);%>

<input type="hidden" name="createdon" required value="<%=dates %> ">
<input type="hidden" name="createdby"  required value="<%=session.getAttribute("username") %>">
<div class="col-md-7">
<div class="col-md-3">
<div class="dropdown">
  <label for="role">Select Level:</label>
  <div class="dropdown">
      <select class="selectpicker required" name="select_level" required="required">
          <option value="">Select Any One</option>
          <option value="easy">Easy</option>
          <option value="medium">Medium</option>
          <option value="tough">Tough</option>
      </select>
  </div>
</div>
</div>
<div class="col-md-5">
<!-- dynamic category values here -->
<label for="role">Select Category:</label>
<div class="dropdown categoryfield">
<%
    try{
    		PoolCon pcon=new PoolCon();
    		Connection connection=pcon.getDbConnection();
       		Statement statement = connection.createStatement() ;
       		resultset =statement.executeQuery("select * from category") ;
%>
		<select class="selectpicker required" name="select_category" required>
		 	<option value=""><%= "Select any One" %></option>
        <%  while(resultset.next()){ %>
            <option id="select_category" value="<%= resultset.getInt(1)%>"><%= resultset.getString(2)%></option>
        <% } %>
        </select> 
<%
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
</div>
</div>
</div>
<!-- first section end -->
<!--second section -->
<div class="col-md-5 contentform">
<div class="form-group">
  <label for="comment">Question</label>
  <textarea class="form-control" rows="3" name="question" id="question" required></textarea>
</div>
<div class="form-group">
  <label>Option1</label>
  <input type="text" class="form-control" name="options" style="width: 400px;"  id="option1" required> 
</div>
<div class="form-group">
  <label>Option2</label>
  <input type="text" class="form-control" name="options" style="width: 400px;" id="option2" required>
</div>
<div class="form-group">
  <label>Option3</label>
  <input type="text" class="form-control" name="options" style="width: 400px;" id="option3" required>
</div>
<div class="form-group">
  <label>Option4</label>
  <input type="text" class="form-control" name="options" style="width: 400px;"id="option4" required>
</div>
<div class="form-group">
  <div class="dropdown">
  <label for="role">Correct Answer:</label>
  <div class="dropdown">
      <select class="selectpicker required" name="select_answer" required>
      <%
      	try{
      		PoolCon pcon=new PoolCon();
    		Connection connection=pcon.getDbConnection();
      		Statement statement1 = connection.createStatement() ;	
      		ResultSet rs=statement1.executeQuery("select * from ques_option");
      		while(rs.next()){
      			
      		}
      		
      	}
      catch(Exception e){
    	  e.printStackTrace();
      }
      %>
          <option value="">Select Any One</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
      </select>
  </div>
</div>
</div>
<button type="button" id="questionbtn" class="btn btn-primary">Submit</button>
</div>
<!-- end second section -->
</form>
</div>
</body>
</html>