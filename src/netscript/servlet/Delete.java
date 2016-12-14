package netscript.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import netscript.pojo.PoolCon;
import netscript.service.QuestionService;
import netscript.service.UserService;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	       PrintWriter pw = response.getWriter();
	       String id = request.getParameter("id");
	       String userid = request.getParameter("userid");
	      
	        try {
	        	//delete question
	        	 QuestionService quesservice=new QuestionService();
				quesservice.deleteQuestion(id);
				
				//delete user
				UserService userservice=new UserService();
				userservice.deleteUser(userid);
			} 
	        catch (NamingException | SQLException | ClassNotFoundException e) {
				
				e.printStackTrace();
			} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
