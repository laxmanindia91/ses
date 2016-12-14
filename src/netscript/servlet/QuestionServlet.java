package netscript.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import netscript.pojo.Ques_option;
import netscript.pojo.Question;
import netscript.service.QuestionService;

@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			PrintWriter pw=response.getWriter();
			
			String level=request.getParameter("select_level").toString();
			String category=request.getParameter("select_category");
			String answer=request.getParameter("select_answer").toString();
			String question=request.getParameter("question").toString();
			String createdon=request.getParameter("createdon").toString();
			String createdby=request.getParameter("createdby").toString();
			
			Question questionpojo=new Question();
			questionpojo.setQuestion(question);
			questionpojo.setLevel(level);
			questionpojo.setCategory(category);
			questionpojo.setCreated_on(createdon);
			questionpojo.setCreated_by(createdby);
			//pw.print(questionpojo);
			
			String[] options=request.getParameterValues("options");
			String options1 = String.join(",", options);
			//List<String> list1 = Arrays.asList(options);
			
			Ques_option quesoptionpojo=new Ques_option(); 
			quesoptionpojo.setOption(options1);
			quesoptionpojo.setAnswer(answer);
			//pw.print(quesoptionpojo);
			
			try 
			{
				QuestionService questionservice=new QuestionService(); 
				questionservice.saveQuestion(questionpojo,quesoptionpojo);
				//questionservice.getQuestion();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request,response);
	}

}
