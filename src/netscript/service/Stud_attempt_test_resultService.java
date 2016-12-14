package netscript.service;

import java.sql.SQLException;

import javax.naming.NamingException;

import netscript.dao.Stud_attempt_test_resultDao;
import netscript.pojo.Stud_attempt_test_result;

public class Stud_attempt_test_resultService {
	
	Stud_attempt_test_resultDao satr= new Stud_attempt_test_resultDao();
	
	public Stud_attempt_test_result getAttemptQues(int id) throws ClassNotFoundException, SQLException, NamingException
	{
		return satr.getAttemptQues(id);
		
	}
}
