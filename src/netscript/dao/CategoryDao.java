package netscript.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;

import netscript.pojo.Category;
import netscript.pojo.PoolCon;

public class CategoryDao {
	
	PoolCon pcon=new PoolCon();
	List<Category> catlist=new ArrayList<Category>();
	Context envContext = null;
	
	Category categorypojo=new Category();
	
	public void saveQuestionCategory(String category) throws SQLException, NamingException, ClassNotFoundException
	{
		try
		{
			Connection con=pcon.getDbConnection();
			String query= "insert into category(category) values(?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, category);
            pst.executeUpdate();     
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
}
	//get category tabel	
	/*public List<Category> getcategory() throws SQLException, NamingException, ClassNotFoundException
	{
		Connection con=pcon.getDbConnection();
		String query= "select * from category";
	    Statement statement = con.createStatement();
	    ResultSet rs = statement.executeQuery(query);

	    while(rs.next())
	    {
	    	Category category=new Category();
	    	category.setId((rs.getInt(1)));
	    	category.setCategory((rs.getString(2)));
	    	catlist.add(category);
	    	
	    	}
	    return catlist;
}*/
	
}
