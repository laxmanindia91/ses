package netscript.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.NamingException;

import netscript.pojo.PoolCon;
import netscript.pojo.Result;

public class ResultDao {
	
	Result result=new Result();
	PoolCon pcon=new PoolCon();
	Context envContext = null;
		
	public Result getResultbyUserId(int usr_id) throws SQLException, NamingException, ClassNotFoundException
	{
		Connection con=pcon.getDbConnection();
		String query= "select * from result where usr_id="+usr_id;
	    Statement statement = con.createStatement();
	    ResultSet rs = statement.executeQuery(query);
	  
	    while(rs.next())
	    {
	    	System.out.println(rs.getInt(1));
	    	System.out.println(rs.getInt(2));
	    	System.out.println(rs.getInt(3));
	    	System.out.println(rs.getString(4));
	    	
	    	/*result.setResult_id(rs.getInt(1));
	    	result.setExam_id(rs.getInt(2));
	    	result.setUsr_id(rs.getInt(3));
	    	result.setMarks_obtained(rs.getInt(4));
	    	result.setTotal_marks(rs.getInt(5));
	    	result.setCretaed_on(rs.getString(6));
	    	result.setTest_level(rs.getString(7));
	    	result.setCategory(rs.getString(8));*/
	    	
	    	}
	    return result;
	}

}
