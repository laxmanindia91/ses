package netscript.service;

import java.sql.SQLException;

import javax.naming.NamingException;

import netscript.dao.Ques_optionDao;
import netscript.pojo.Ques_option;
public class Ques_optionService {
	
	Ques_optionDao quesoption= new Ques_optionDao(); 
	public Ques_option getQues_option(int ques_id) throws ClassNotFoundException, SQLException, NamingException
	{
		return quesoption.getQuesOption(ques_id);
	}

}
