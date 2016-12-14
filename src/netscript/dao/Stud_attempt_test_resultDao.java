package netscript.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;

import netscript.pojo.PoolCon;
import netscript.pojo.Stud_attempt_test_result;

public class Stud_attempt_test_resultDao {
	
	Stud_attempt_test_result stresult=new Stud_attempt_test_result();
	PoolCon pcon=new PoolCon();
	Context envContext = null;
		
	public Stud_attempt_test_result getAttemptQues(int id) throws SQLException, NamingException, ClassNotFoundException
	{
		Connection con=pcon.getDbConnection();
		String query= "select * from stud_attempt_test_result where id="+id;
	    Statement statement = con.createStatement();
	    ResultSet rs = statement.executeQuery(query);
	  
	    while(rs.next())
	    {
	    	System.out.println(rs.getInt(1));
	    	System.out.println(rs.getInt(2));
	    	System.out.println(rs.getInt(3));
	    	System.out.println(rs.getInt(4));
	    	
	    	/*user.setQues_id(rs.getInt(1));
	    	user.setQues(rs.getString(2));
	    	user.setQues_type(rs.getString(3));
	    	user.setCategory(rs.getString(4));
	    	user.setLevel(rs.getString(5));*/
	    	
	    	}
	    return stresult;
}

}