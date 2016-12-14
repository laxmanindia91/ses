package netscript.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import netscript.pojo.User;
import netscript.service.UserService;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw=response.getWriter();
		
		String username=request.getParameter("username").toString();
		String password=request.getParameter("pswd");
		String email=request.getParameter("email").toString();
		String mobileno=request.getParameter("mobile").toString();
		String role=request.getParameter("role").toString();
		String createdon=request.getParameter("createdon").toString();
		//String category=request.getParameter("category").toString();
		
		User userpojo=new User();
		userpojo.setName(username);
		userpojo.setPassword(password);
		userpojo.setEmail(email);
		userpojo.setMobileno(mobileno);
		userpojo.setRole(role);
		userpojo.setCreatedon(createdon);
		
		
		pw.print(userpojo);
		
		try {
			UserService userservice=new UserService();
			userservice.saveUser(userpojo);	
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request,response);
	}

}
