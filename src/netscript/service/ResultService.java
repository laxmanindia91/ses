package netscript.service;

import java.sql.SQLException;

import javax.naming.NamingException;

import netscript.dao.ResultDao;
import netscript.pojo.Result;

public class ResultService {

	ResultDao result=new ResultDao();
	public Result getResultbyid(int result_id) throws SQLException, NamingException, ClassNotFoundException
	{
		return result.getResultbyUserId(result_id);
	}
	
}
