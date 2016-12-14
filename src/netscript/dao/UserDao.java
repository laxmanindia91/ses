package netscript.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;

import netscript.pojo.PoolCon;
import netscript.pojo.User;

public class UserDao 
{
	User user=new User();
	PoolCon pcon=new PoolCon();
	Context envContext = null;
		
	public User getUserById(int usr_id) throws SQLException, NamingException, ClassNotFoundException
	{
		Connection con=pcon.getDbConnection();
		String query= "select * from user where usr_id="+usr_id;
	    Statement statement = con.createStatement();
	    ResultSet rs = statement.executeQuery(query);
	  
	    while(rs.next())
	    {
	    	
	    	/*user.setQues_id(rs.getInt(1));
	    	user.setQues(rs.getString(2));
	    	user.setQues_type(rs.getString(3));
	    	user.setCategory(rs.getString(4));
	    	user.setLevel(rs.getString(5));*/
	    	
	    	}
	    return user;
	}
	//delete user
	public void deleteUser(String id) throws NamingException, SQLException 
	{
		Connection con=pcon.getDbConnection();
		try
		{ 
			Statement smt = con.createStatement();
			smt.executeUpdate("UPDATE user SET isActive= 0  WHERE id=  " +id+ " ");
		}
		catch(SQLException sx)
		{
			sx.printStackTrace();
		}
	}
	//Add user
	public void saveUser(User userpojo) throws NamingException, SQLException 
	{
		Connection con=pcon.getDbConnection();
		try
		{ 
			String query= "insert into user(name,password,email,mobileno,role,createdon) values('"+userpojo.getName()+"','"+userpojo.getPassword()+"','"+userpojo.getEmail()+"','"+userpojo.getMobileno()+"','"+userpojo.getRole()+"','"+userpojo.getCreatedon()+"')";
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.executeUpdate(query);
		}
		catch(SQLException sx)
		{
			sx.printStackTrace();
		}
	}
	
}