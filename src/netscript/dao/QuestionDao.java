package netscript.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;

import netscript.pojo.PoolCon;
import netscript.pojo.Ques_option;
import netscript.pojo.Question;

public class QuestionDao {
	 
    List<Question> queslist=new ArrayList<Question>();
   
	PoolCon pcon=new PoolCon();
	Context envContext = null;
	
	//get question by id	
	public List<Question> getQuestionById(int ques_id) throws SQLException, NamingException, ClassNotFoundException
	{
		 Connection con=pcon.getDbConnection();
		String query= "select * from questions where ques_id="+ques_id;
	    Statement statement = con.createStatement();
	    ResultSet rs = statement.executeQuery(query);

	    while(rs.next())
	    {
	    	Question ques=new Question();
	    	ques.setId((rs.getInt(1)));
	    	ques.setQuestion((rs.getString(2)));
	    	ques.setCategory(rs.getString(3));
	    	ques.setLevel(rs.getString(4));
	    	ques.setActive(rs.getBoolean(5));
	    	ques.setCreated_on(rs.getString(6));
	    	ques.setCreated_by(rs.getString(7));
	    	queslist.add(ques);
	    	
	    	}
	    return queslist;
}
	//save question
	public void saveQuestion(Question questionpojo,Ques_option quesoptionpojo) throws NamingException, SQLException {
		
		Connection con=pcon.getDbConnection();
		int id=0;
		try
		{
			String query= "insert into questions(question,level,category,createdon,createdby) values(?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		
			pst.setString(1, questionpojo.getQuestion());
			pst.setString(2,questionpojo.getLevel());
			pst.setString(3,questionpojo.getCategory());
			pst.setString(4, questionpojo.getCreated_on());
			pst.setString(5, questionpojo.getCreated_by());
			pst.executeUpdate();
		
			ResultSet rs =pst.getGeneratedKeys();
		    if(rs.next()){  id = rs.getInt(1);  }
			
		    System.out.print(id);
			String query1= "insert into ques_option(question_id,options,answer) values(?,?,?)";
			PreparedStatement pst1 = con.prepareStatement(query1);
			pst1.setInt(1, id);
			
			//List<String> list2 = quesoptionpojo.getOption();
			//pst1.setString(2, list2.toString());
			pst1.setString(2, quesoptionpojo.getOption().toString());
			pst1.setString(3, quesoptionpojo.getAnswer());
			pst1.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	//delete Question
	public void deleteQuestion(String id) throws NamingException, SQLException {
		
		Connection con=pcon.getDbConnection();
		 try
         { 
            Statement smt = con.createStatement();
            smt.executeUpdate("UPDATE questions SET isActive= 0  WHERE id=  " +id+ " ");
         }
     catch(SQLException sx)
         {
    	 sx.printStackTrace();
         }
	}

}



