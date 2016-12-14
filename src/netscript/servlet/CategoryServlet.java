package netscript.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import netscript.pojo.Category;
import netscript.service.CategoryService;

@WebServlet("/AddCategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		String category=request.getParameter("category_ques");
		try 
		{
			CategoryService categoryservice=new CategoryService();
			categoryservice.saveQuestionCategory(category);	
			
			//get category table data
			/*pw.println("<table class='table table-bordered' id='mytable'>");
			pw.println("<tr><th>Category Id</th><th>Category Name</th></tr>");
			
			List<Category> data=categoryservice.getcategory();
			for(Category q : data)
				{
					pw.println("<tr><td>"+q.getId()+"</td><td>"+q.getCategory()+"</td></tr>");
					
				}
			
				pw.println("</table>");*/
			
		} 
		catch (ClassNotFoundException | SQLException | NamingException e) 
		{
			e.printStackTrace();
		}	
	response.sendRedirect("Category.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request,response);
	}

}
