<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="style.css" /> 
<!--  script>
  $( function() {
    $( "#datepicker" ).datepicker({
   dateFormat: 'yy/mm/dd'
});
  });
</script>-->
<script type="text/javascript">
	 $(document).ready(function()
	{
   	$('#adduserform').bootstrapValidator({
       
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields: {
        	username: {
                validators: {
                        stringLength: {
                        min: 4,
                        message: 'Please enter at least 4 characters'
                    },
                        notEmpty: {
                        message: 'Please Enter name'
                    }
                }
            },
            
            mobile: {
                validators: {
                    notEmpty: {
                        message: 'Please enter phone number'
                    },
                    mobile: {
                        country: 'IN',
                        message: 'Please enter a vaild phone number'
                    }
                }
            },
         
	 	email: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your email address'
                    },
                    emailAddress: {
                        message: 'Please enter a valid email address'
                    }
                }
            },
					
		pswd: {
            validators: {
                    message: 'Please enter at least 3 digits'
                }
            }
        }, 
            
        })
        
       .on('success.form.bv', function(e) {
        $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
    	 $('#adduserform').data('bootstrapValidator').resetForm();
        //$('#adduserform').bootstrapValidator('resetForm',true);
        
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
          var bv = $form.data('bootstrapValidator');
         

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
               console.log(result);
            }, 'json');
        $('#adduserform').bootstrapValidator('resetForm',true);
            
        });
});
</script>
</head>
 <body>
   <div class="container">
      <h1>Add User</h1>
     <form class="col-lg-6" class="form-horizontal" method="post" id="adduserform" action="UserServlet">
         <div class="form-group">
                 <label for="name">User Name:</label>
                 <div class="inner-addon left-addon">
          <span class="glyphicon glyphicon-user"></span>
                 <input type="text" class="form-control" name="username" placeholder="Enter Name" required></div>
   		</div>
         <div class="form-group">
                 <label for="paswrd">Password:</label>
                 <div class="inner-addon left-addon">
          <span class="glyphicon glyphicon-option-horizontal"></span>
                 <input type="password" class="form-control" name="pswd" minlength="3"  placeholder="Enter Password" required> </div>
  		</div>
   		<div class="form-group">
                 <label for="email">Email:</label>
                 <div class="inner-addon left-addon">
         <span class="glyphicon glyphicon-envelope"></span>
                 <input type="text" class="form-control" name="email"  placeholder="Enter Email" required></div>
   		</div>
   		<div class="form-group">
                 <label for="mb_no">Mobile No:</label>
                 <div class="inner-addon left-addon">
    			<span class="glyphicon glyphicon-earphone"></span>
                 <input type="text" class="form-control" pattern="^\d{10}$" name="mobile" placeholder="xxxxxxxxxx" required>
   		</div></div>
         <div>
         	<div class="col-md-6">
              <label for="role">Select role:</label>
                 <div class="dropdown">
                      <select class="selectpicker required selectopt" name="role" required>
                           <option value="">Select Any One</option>
                            <option value="administrator">Administrator</option>
                            <option class="studentid" value="student">Student</option>
                            <option value="content_writer">Content Writer</option>
                       </select>
                   </div>
              </div> 
   		</div><br><br><br>
   		<%
		Date date=new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dates=formatter.format(date);
		//pw.print(dates);%>
		<input type="hidden" name="createdon" required value="<%=dates %> ">
		<%	session.setAttribute("currentdatetime", dates); %>		
			
         <input type="submit" class="btn btn-primary" value="Submit"/>
       
    </form>
</div>
</body>
</html>