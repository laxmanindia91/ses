package netscript.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;

import netscript.pojo.Exam;
import netscript.pojo.PoolCon;

public class ExamDao {
	
	Exam exam=new Exam();
	PoolCon pcon=new PoolCon();
	Context envContext = null;
		
	public Exam getExamByExamId(int exam_id) throws SQLException, NamingException, ClassNotFoundException
	{
		Connection con=pcon.getDbConnection();
		String query= "select * from exam where exam_id="+exam_id;
	    Statement statement = con.createStatement();
	    ResultSet rs = statement.executeQuery(query);
	    /*if(query.matches("[a-z123]*"))
	    {
	    	
	    }*/
	    
	    while(rs.next())
	    {
	    	System.out.println(rs.getInt(1));
	    	System.out.println(rs.getInt(2));
	    	/*System.out.println(rs.getInt(3));
	    	System.out.println(rs.getString(4));*/
	    	
	    	/*exam.setExam_id(rs.getInt(1));
	    	exam.setExam_name(rs.getString(2));
	    	exam.setStarts_on(rs.getDate(3));
	    	exam.setEnds_on(rs.getDate(4));
	    	exam.setDuration(rs.getDate(5));
	    	exam.setCreated_on(rs.getString(6));
	    	exam.setLevel(rs.getString(7));
	    	exam.setCategoy(rs.getString(8));
	    	exam.setCreated_by(rs.getString(9));
	    	exam.setIsActive(rs.getString(10));*/
	    	
	    	}
	    return exam;
	}
	
	//schedule test
	public void saveExam(Exam exampojo) throws SQLException, NamingException, ClassNotFoundException
	{
		Connection con=pcon.getDbConnection();

		String query= "insert into exam(exam_name,duration,startdatetime, enddatetime,totalquestion,totalmarks,level,category) values(?,?,?,?,?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, exampojo.getExam_name());
		pst.setString(2, exampojo.getDuration());
		pst.setString(3, exampojo.getStartdatetime());
		pst.setString(4, exampojo.getEnddatetime());
		pst.setString(5, exampojo.getTotalQuestion());
		pst.setString(6, exampojo.getTotalmarks());
		pst.setString(7, exampojo.getLevel());
		pst.setString(8, exampojo.getCategoy().toString());
		pst.executeUpdate();
		
	}
}
