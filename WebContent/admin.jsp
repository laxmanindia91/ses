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
<title>Admin Main Page</title>
</head>
<body>
<div class="container">
<input type="hidden" class="backcheck" value="no">
<!-- header -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-education"></span> Self Evolution System</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="content.jsp">Content
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="addQuestion"><a href="#"><span class="glyphicon glyphicon-plus"></span> Add Question</a></li>
          <li id="addCategoryy"><a href="#"><span class="glyphicon glyphicon-pencil"></span> Add Category</a></li>
        </ul>
      </li>
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li id="adduser"><a href="#"><span class="glyphicon glyphicon-plus"></span> Add New User</a></li>
         	<li id="scheduletest"><a href="#"> <span class="glyphicon glyphicon-th-list"></span> Schedule Test</a></li>
          	<li id="viewquestion"><a href="#"><span class="glyphicon glyphicon-search"></span> View Question</a></li>
          	<li id="viewusers"><a href="#"><span class="glyphicon glyphicon-user"></span> View All Users</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Logout"><span class="glyphicon glyphicon-user"></span><b>Logout</b></a></li>
	</ul>
  </div>
</nav>
<!-- header end -->

<div class="col-md-12">
<div id="admindiv" class="col-md-6"></div>
<div class="col-md-6 containerdiv2"></div>
</div>
</div>
</body>
</html>