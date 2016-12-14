package netscript.service;

import java.sql.SQLException;

import javax.naming.NamingException;

import netscript.dao.ExamDao;
import netscript.pojo.Exam;

public class ExamService {
	
	ExamDao examdao =new ExamDao();
	public Exam getExamByExamId(int exam_id) throws SQLException, NamingException, ClassNotFoundException
	{
	
		return examdao.getExamByExamId(exam_id);	
	}
	
	//save schedule
	public void saveExam(Exam exampojo) throws SQLException, NamingException, ClassNotFoundException
	{
		examdao.saveExam(exampojo);	
	}
}