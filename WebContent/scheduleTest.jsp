<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%@ page import="netscript.pojo.PoolCon" %>
 <html>
<head>
<title>Insert title here</title>
<script>
  $( function() {
	  $( "#start_date,#end_date" ).datetimepicker({
		  format:'YYYY/MM/DD HH:mm:ss',
		});
  });
 </script>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$('#scheduleTestbtn').click(function(){
 			//alert("helo");
 			var datastring = $('#form3').serializeArray();
 			console.log(datastring);
 			//alert(datastring);
 			//console.log(datastring.category.len);
 		
 			var method = $('#form3').attr('method');
 			$.ajax({
 				tyep: method,
 				data: datastring,
 				url: 'ExamServlet',
 				success: function(result){
 					$('#admindiv').html(result);
 				}
 			});
 		});
 	});
 </script>
</head>
<body>
<div class="container">
<form method="post" id="form3" action="ExamServlet">
	<h1 align="center">Schedule Test</h1><br>
	<div class="tablediv">
	<div class="col-md-12">
		<table class="table table-bordered" height="100px" width="200px">
 			<thead><tr><th colspan="2" style="background-color:#f5f5f5";><h3 align="center">Test Details</h3></th></tr></thead>
 		<tr>
 		 <td class="col-md-6">
 			<div class="form-group col-md-4">
    			<label for="username">Test Name:</label>
    			<input type="text" class="form-control" name="test_name" required placeholder="Enter test name" id="testname" >
       		</div>
       		<div class="form-group col-md-4">
    			<label for="username">Total Questions:</label>
    			<input type="text" class="form-control" name="test_question" required onkeypress="return event.charCode >= 48 && event.charCode <= 57" placeholder="Enter no.of questions" id="testname" >
       		</div>
    	</td>
   		<td class="col-md-6">
  			<div class="form-group col-md-4">
   				 <label for="username">Total Marks:</label>
    			<input type="text" class="form-control" required onkeypress="return event.charCode >= 48 && event.charCode <= 57" name="total_marks" id="duration" placeholder="Enter marks" >
       		</div>
       		<div class="form-group col-md-4">
   				 <label for="username">Duration:</label>
    			<input type="text" class="form-control"  required onkeypress="return event.charCode >= 48 && event.charCode <= 57" name="duration" id="duration" placeholder="Enter minutes" >
       		</div>
    	</td>  
    </tr>
 </table>
 </div>
	<div class="col-md-6">
 		<table class="table table-bordered" height="300px" style="width:500px;">
  			<thead style="background-color:#f5f5f5";><tr><th>Select level</th></tr></thead>
    	<tr>
  		<td>
  			<div class="radio">
  				<label><input type="radio" required value="Easy" name="optradio">Easy</label>
			</div>
			<div class="radio">
  				<label><input type="radio" required value="Medium" name="optradio">Medium</label>
			</div>
			<div class="radio">
  				<label><input type="radio" required value="Tough" name="optradio">Tough</label>
			</div>
  		</td>
  		</tr>
    </table>
    </div>
   <div class="col-md-6">
 		<table class="table table-bordered" height="300px" style="width:500px;">
  			<thead><tr><th style="background-color:#f5f5f5">Select Category</th></tr></thead>
		<tr><td>
  			<%
  			try{
  				PoolCon pcon=new PoolCon();
  				Connection conn=pcon.getDbConnection();
  				Statement stmt=conn.createStatement();
  				String query="select * from category";
  				ResultSet rs=stmt.executeQuery(query);
  				while(rs.next()){
  			%>
  				<div class="checkbox" required>
  				<label><input type="checkbox"  name="category" value="<%= rs.getString(1)%>"><%= rs.getString(2) %></label>
			</div>
			
  			<% 	}
  				
  			}
  			catch(Exception e){
  				e.printStackTrace();
  			}
  			%>
  	</td></tr>
    </table>
    </div>
  </div>
  
  <div class="time">
  	<table class="table table-bordered col-md-12" height="100px" width="200px">
  		<thead><tr><th colspan="2" style="background-color:#f5f5f5";><h3 align="center">Schedule Timings</h3></th></tr></thead>
    <tr>
    <td class="col-md-6">
 		<div class="form-group col-md-3">
  			<label>Start Date</label>
  		<div class="inner-addon left-addon2 input-append date">
  			<input type="text" class="form-control" data-format="yyyy/MM/dd hh:mm:ss" required name="startdatetime" id="start_date" style="width: 200px;">
  		</div>
  		</div>
    </td>
   <td class="col-md-6">
 	<div class="form-group col-md-3">
 		<label>End Date</label>
  		<div class="inner-addon left-addon2">
  			<input type="text" class="form-control" required name="enddatetime" id="end_date" style="width: 200px;">
  		</div>
  	</div>
   </td>
   
   </tr>
   <tr><td colspan="2" align="center"><input type="button" id="scheduleTestbtn" class="btn btn-primary" value="Submit"/></td></tr>
 </table> 
</div>
</form>
</div>
</body>
</html>