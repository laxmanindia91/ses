<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%!
   public String getCatStr(Map<Integer,String> mp, String cats)
   {
      String ids[]=cats.split(",");
      List<String> list=new ArrayList<String>();
      for(String str : ids)
      {
    	 list.add(mp.get(Integer.parseInt(str)));
      }
      return list.toString();
   }
%>
<%
 if (session.getAttribute("username")==null) {
     response.sendRedirect("login.jsp");
 }
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Arrays" %>
<%ResultSet resultset =null;ResultSet resultsetCat =null;%>
<%@ page import="netscript.pojo.PoolCon" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="include.jsp"></jsp:include>
<link rel="stylesheet" href="style.css">
<title>Student Dashboard</title>

</head>
<body>
<div class="container">
<input type="hidden" class="backcheck" value="no">
<!-- header start -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-education"></span> Self Evolution System</a>
    </div>
    <ul class="nav navbar-nav">
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Student
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
			 <li id="viewResult"><a href="#"> <span class="glyphicon glyphicon-check"></span> View Result</a></li>
             <li><a href="#"><span class="glyphicon glyphicon-eye-open"></span> Test Review</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Logout"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
	</ul>
  </div>
</nav>
<!-- header end -->
<div id="studentDiv"></div>


<div id="studenttest">
<table class="table table-striped starttesttbl" border="1">
<tr><th>Exam name</th><th>category(s) name</th><th>End date</th><th>&nbsp;</th></tr>
<% 
PrintWriter pw=response.getWriter();

String startdatetime="",enddatetime="";
String examcategory="",cat1="",category="",levelvalue="" ;
String examname="";
String cateStr="";
int count=0;


	
	PoolCon pcon=new PoolCon();
	SimpleDateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date date = new Date();
	Connection connection=pcon.getDbConnection();

	try{
		Statement statementCat = connection.createStatement() ;
		resultsetCat=statementCat.executeQuery("select * from category") ;
		
		Map<Integer,String> mps=new HashMap<Integer,String>();
		while(resultsetCat.next())
		{
			mps.put(resultsetCat.getInt("id"), resultsetCat.getString("category"));
			//session.setAttribute("resultsetCat.getInt('id')", resultsetCat.getString("category"));
		}

		Statement statement = connection.createStatement() ;
   		resultset =statement.executeQuery("select * from exam") ;
   		while(resultset.next())
   		{
   			examname=resultset.getString(2);
   			startdatetime=resultset.getString(4);
   			enddatetime=resultset.getString(5);
   			examcategory=resultset.getString(9);
   			
   		
   			if(dateFormat.format(date).compareTo(startdatetime)>=0 && dateFormat.format(date).compareTo(enddatetime)<=0)
   				{	
   					cateStr=getCatStr(mps, examcategory);
 %>
<tr><td><%=examname %></td><td><%=cateStr %></td><td><%=enddatetime %></td><td><button type="button" class="btn btn-danger startbtn1" value="<%=examname %>">Start</button></td></tr>
 
 <%
 				}
   		}
    }
    catch(Exception e)
    {
         out.println("wrong entry"+e);
    }
			
%>
</table>
</div>
</div>
</body>
</html>