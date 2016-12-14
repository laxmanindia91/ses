<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add category</title>
<script>
$(document).ready(function(){
	var data;
	$("#categorybtn").click(function(){
		data = $('#category').val();
		
		 if(data =='')
		{
			$('#errorMessage').html("<font color='red'>Please Fill out this Field</font>");
			return;
		}else{
			$('#errorMessage').html("");
		}
		 
		/*else{
			$('#category').keyup(function(){
				alert("a");
				$('#errorMessage').remove();
			});
		}*/
			var method = $('#form2').attr('method');
			var datastring=$("#form2").serialize();
			$.ajax({
				type: method,
				data: datastring,
				url: 'AddCategoryServlet',
				success: function(result)
				{
					$(".containerdiv2").html(result);
					$('#form2')[0].reset();
				}
			});
		});

	});
</script>
</head>
<body>
<div class="container">
<h3>Add Category</h3><hr>
<form method="post" role="form" data-toggle="validator" action="AddCategoryServlet" id="form2">
  <input type="hidden" value="category" name="verify"/> 
<div class="form-group">
  <label>Category</label>
  <input type="text" class="form-control" style="width: 400px;"  name="category_ques" id="category" required="true"/><span id="errorMessage"></span>
</div>
<div><button type="button" id="categorybtn" class="btn btn-primary">Save</button></div>
</form>
</div>
</body>
</html>