package netscript.service;

import java.sql.SQLException;

import javax.naming.NamingException;

import netscript.dao.Exam_quesDao;

import netscript.pojo.Exam_ques;

public class Exam_quesService {
	
	Exam_quesDao examques=new Exam_quesDao();
	public Exam_ques getQuesOption(int ques_id) throws ClassNotFoundException, SQLException, NamingException
	{
		return examques.getQuesOption(ques_id);
		
	}

}
