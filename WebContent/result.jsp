<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>result Page in Student</title>
</head>
<body>
<div class="container">
<!-- student details table-->
<div class="studentdetail">
<table class="table table-bordered">
<thead><th class="headercolor">Students Details</th></thead>
<tr><td>
<div>Name:</div>
<div>Category:</div>
<div>Email:</div>
</td></tr>
</table>
</div>
<!-- Result table -->
<div class="resulttable">
<table class="table table-bordered">
<th colspan="2" class="headercolor">Result</th>
<tr><td><div><b>Description:</b></td><td><b>Status:</b></td>
<tr><td>Total question</td><td></td></tr>
<tr><td>Correct Answer</td><td></td></tr>
<tr><td>Wrong Answer</td><td></td></tr>
<tr><td>Spend Time</td><td></td></tr>
<tr><td>Result</td><td></td></tr>
<tr><td>Performance</td><td></td></tr>
<tr><td colspan="2" align="center">
<button class="btn btn-primary" id="printbtn" onclick="myFunction()">Print</button>
<button class="btn btn-primary" id="reviewbtn">Review</button>
<button class="btn btn-default" id="closebtn" onclick="myFunction1()">Close</button></td>
</tr>
</table>
</div>
<!--  -->
</div>

</body>
</html>