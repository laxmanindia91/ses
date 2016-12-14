package netscript.service;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import netscript.dao.QuestionDao;
import netscript.pojo.Ques_option;
import netscript.pojo.Question;


public class QuestionService {
	          
	QuestionDao questionDao =new QuestionDao();
	
	//get question by id
	public List<Question> getQuestionById(int ques_id) throws SQLException, NamingException, ClassNotFoundException{
		return questionDao.getQuestionById(ques_id);	
	}

	//save question
	public void saveQuestion(Question questionpojo,Ques_option quesoptionpojo) throws NamingException, SQLException {
		questionDao.saveQuestion(questionpojo,quesoptionpojo);	
	}
	
	//delete question
	public void deleteQuestion(String id) throws NamingException, SQLException {
		questionDao.deleteQuestion(id);	
	}
	
	
}
