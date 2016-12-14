/**
 * 
 */
jQuery(document).ready(function($){
	
	
	
	 var backcheck = $('.backcheck').val();
     if(backcheck=='no')
     {
        $('.backcheck').val('yes');
     }
     if(backcheck=='yes')
     {
         window.location.reload();
     }
	
	//add category form in content-writer dash board
	$("#addCategory").click(function(){
	
		$.ajax({
	
			url: 'addCategory.jsp',
			success: function(result)
			{
			$("#containerdivContent").html(result);
			}
		});
		
		$.ajax({
			url: 'Category.jsp',
			success: function(result)
			{
			$(".containerdiv2").show().html(result);
			}
		});
	});
	//add question form in content-writer dash board
	$("#addQues").click(function(){
		$.ajax({
			type: 'post',
			url: 'addQuestion.jsp',
			success: function(result){
				$(".containerdiv2").hide();		
				$("#containerdivContent").html(result);	
			}
		});
	});
	
	$("#viewResult").click(function(){
		$.ajax({
			url:'result.jsp',
			success: function(result)
			{
			$(".startbtn1").hide();
			$("#studentDiv").html(result);	
			}
		});
	});
	//start button in student dash board
	$(".startbtn1").click(function(){
		var datastring=$(this).val();
		$.ajax({
			data: {'exam_name': datastring},
			url:'starttest.jsp',
			success: function(result)
			{
			$(".starttesttbl").hide();
			$("#studentDiv").html(result);	
			}
		});
	});
	//view All questions in admin section
	$("#viewquestion").click(function(){
		$.ajax({
			type:'post',
			url:'ViewQuestions.jsp',
			success: function(result)
			{
			$("#admindiv").html(result);	
			}
		});
	});
	//add user form 
	$("#adduser").click(function(){
		$.ajax({
			tyep:'post',
			url:'adduser.jsp',
			success: function(result)
			{
			$(".containerdiv2").hide();	
			$("#admindiv").html(result);	
			}
		});
	});
	//schedule test
	$("#scheduletest").click(function(){
		$.ajax({
			url:'scheduleTest.jsp',
			success: function(result)
			{
			$("#admindiv").html(result);	
			}
		});
	});
	//view users
	$("#viewusers").click(function(){
		$.ajax({
			tyep:'post',
			url:'ViewUser.jsp',
			success: function(result)
			{
			$("#admindiv").html(result);	
			}
		});
	});
	//add category form in admin dash board
	$("#addCategoryy").click(function(){
		$.ajax({
			type: 'post',
			url: 'addCategory.jsp',
			success: function(result)
			{
			$("#admindiv").html(result);	
			}
		});
		
		$.ajax({
			url: 'Category.jsp',
			success: function(result)
			{
			$(".containerdiv2").show().html(result);	
			}
		});
	});
	//add question form in admin dash board
	$("#addQuestion").click(function(){
		$.ajax({
			type: 'post',
			url: 'addQuestion.jsp',
			success: function(result){
				$(".containerdiv2").hide();	
				$("#admindiv").html(result);	
			}
		});
	});	
	
	//show select category for student account
	$(".selectopt").on("change",function()
	{
		if($(this).val() == 'student') 
		{ alert('a');
		$(".categorydiv").show();
		}
		else
		{ 
		$(".categorydiv").hide();
		}
	});
});
//print button 
function myFunction() {
    window.print();
}
//close button
function myFunction1() {
	$("#studentDiv").hide();
}





