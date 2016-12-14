<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <%@include file="include.jsp" %>
 
<title>Insert title here</title>
</head>
<body>
<%
PrintWriter pw=response.getWriter();
if(request.getParameter("msg") != null)
{
out.println(request.getParameter("msg"));
}
%>
<div class="container">
    <div class="modal show" id="myModal" role="dialog">
    	<div class="modal-dialog">
    	 <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h2 class="modal-title" align="center">Log In  <i class="fa fa-sign-in" aria-hidden="true"></i></h2>
        </div>
         <!-- Modal body-->
        <div class="modal-body">
          <form method="post" action="LoginServlet">
       			<div class="form-group">
          		<label for="username">User Name:</label>
         		<i class="fa fa-user-circle" aria-hidden="true"> </i>  <input type="text" class="form-control" name="usrname" id="username" placeholder="User name">
       			</div>
      		 	<div class="form-group">
          			<label for="pwd">Password:</label>
           			<i class="fa fa-key" aria-hidden="true"></i><input type="password" class="form-control" name="pswd" id="pwd" placeholder="Password">
       			</div>
       			<div class="form-group">
       			<button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
       			</div>
       		</form>
  		</div>
     <!-- Modal footer-->
        <div class="modal-footer"></div>
     </div>
   </div>
  </div>
</div>
</body>
</html>