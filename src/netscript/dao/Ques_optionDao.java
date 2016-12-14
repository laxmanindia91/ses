package netscript.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;

import netscript.pojo.PoolCon;
import netscript.pojo.Ques_option;

public class Ques_optionDao 
{
	Ques_option quesoption=new Ques_option();
	PoolCon pcon=new PoolCon();
	Context envContext = null;
		
	public Ques_option getQuesOption(int ques_id) throws SQLException, NamingException, ClassNotFoundException
	{
		Connection con=pcon.getDbConnection();
		String query= "select * from result where id="+ques_id;
	    Statement statement = con.createStatement();
	    ResultSet rs = statement.executeQuery(query);
	  
	    while(rs.next())
	    {
	    	System.out.println(rs.getInt(1));
	    	System.out.println(rs.getInt(2));
	    	System.out.println(rs.getInt(3));
	    	System.out.println(rs.getString(4));
	    	
	    	/*user.setQues_id(rs.getInt(1));
	    	user.setQues(rs.getString(2));
	    	user.setQues_type(rs.getString(3));
	    	user.setCategory(rs.getString(4));
	    	user.setLevel(rs.getString(5));*/
	    	
	    	}
	    return quesoption;
}
}
