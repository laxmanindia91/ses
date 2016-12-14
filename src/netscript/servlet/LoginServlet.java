package netscript.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import netscript.pojo.PoolCon;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		String type = "";
		int id = 0;
		PoolCon con = new PoolCon();
		String name = request.getParameter("usrname");
		String password = request.getParameter("pswd");

		ResultSet rs = null;
		PreparedStatement pst = null;

		HttpSession session = request.getSession(); // create session object
		try {
			Connection conn = con.getDbConnection();
			pst = conn.prepareStatement("select id,role from user where name ='"+ name+ "' and password = '"+ password+ "' UNION select id,role from student where studentname='"+ name + "' and password='" + password+"'");
			rs = pst.executeQuery();

			int count = 0;
			while (rs.next()) {
				count++;
				id = rs.getInt("id");
				type = rs.getString("role");
			}

			if (count == 1) {
				if ("adminstrator".equals(type)) {
					session.setAttribute("userid", id);
					session.setAttribute("username", name);
					response.sendRedirect("admin.jsp");
				} 
				else if ("student".equals(type)) {
					session.setAttribute("userid", id);
					session.setAttribute("username", name);
					response.sendRedirect("student.jsp");

				} else if ("content".equals(type)) {
					session.setAttribute("userid", id);
					session.setAttribute("username", name);
					response.sendRedirect("content.jsp");
				}
			} else {
				response.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
