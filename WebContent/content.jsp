<%
 if (session.getAttribute("username")==null) {
     response.sendRedirect("login.jsp");
 }
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="include.jsp"></jsp:include>
<link rel="stylesheet" href="style.css">
<title>content writer main page</title>
</head>
<body>
<div class="container">
<input type="hidden" class="backcheck" value="no">
<!-- -header start-->
<header>
<nav class="navbar navbar-default contentheader">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><b><span class="glyphicon glyphicon-education"></span> Self Evolution System</b></a>
    </div>
    <ul class="nav navbar-nav">
     <li class="dropdown">
       	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Content<span class="caret"></span></a>
        <ul class="dropdown-menu">
        	<li id="addQues"><a href="#"><span class="glyphicon glyphicon-plus"></span> Add Question</a></li>
          	<li id="addCategory"><a href="#"><span class="glyphicon glyphicon-pencil"></span> Add Category</a></li>
        </ul>
      </li>   
    </ul>
    <ul class="nav navbar-nav navbar-right givespan">
      <li><a href="Logout"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
</ul>
</nav>
</header>
<!-- header end --> 
<div class="col-md-12">
<div class="col-md-6" id="containerdivContent"></div>
<div class="col-md-6 containerdiv2"></div>
</div>
</div>
</body>
</html>