package netscript.service;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import netscript.dao.CategoryDao;
import netscript.pojo.Category;
import netscript.pojo.Question;

public class CategoryService 
{
	CategoryDao categorydao=new CategoryDao();
	public void saveQuestionCategory(String category) throws ClassNotFoundException, SQLException, NamingException 
	{
		
		categorydao.saveQuestionCategory(category);
	}

/*	public List<Category> getcategory() throws ClassNotFoundException, SQLException, NamingException {
		
		return categorydao.getcategory();
	}*/
}
