package netscript.service;

import java.sql.SQLException;
import javax.naming.NamingException;

import netscript.dao.UserDao;
import netscript.pojo.User;

public class UserService {
	
	UserDao user=new UserDao();
	public User getUserById(int usr_id) throws ClassNotFoundException, SQLException, NamingException 
	{
		return user.getUserById(usr_id);
		
	}
	//delete user
	public void deleteUser(String id) throws ClassNotFoundException, SQLException, NamingException 
	{
		user.deleteUser(id);
		
	}
	
	//Add user 
	public void saveUser(User userpojo) throws ClassNotFoundException, SQLException, NamingException 
		{
			user.saveUser(userpojo);
			
		}
}
