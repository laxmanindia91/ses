package netscript.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import netscript.pojo.Exam;
import netscript.pojo.User;
import netscript.service.ExamService;
import netscript.service.UserService;

@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		PrintWriter pw=response.getWriter();
		
		String testname=request.getParameter("test_name").toString();
		String totalquestion=request.getParameter("test_question");
		String totalmarks=request.getParameter("total_marks").toString();
		String duration=request.getParameter("duration").toString();
		String level=request.getParameter("optradio").toString();
		String startdate=request.getParameter("startdatetime").toString();
		String enddate=request.getParameter("enddatetime").toString();
		String[] category=request.getParameterValues("category");
	
		String category2="";
		category2 = String.join(",", category);
		
		Exam exampojo=new Exam();
		exampojo.setExam_name(testname);
		exampojo.setTotalQuestion(totalquestion);
		exampojo.setTotalmarks(totalmarks);
		exampojo.setDuration(duration);
		exampojo.setLevel(level);
		exampojo.setCategoy(category2);
		exampojo.setStartdatetime(startdate);
		exampojo.setEnddatetime(enddate);
		//pw.print(exampojo);
		
		try {
			ExamService examservice=new ExamService();
			examservice.saveExam(exampojo);	
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
