package netscript.pojo;

import java.util.List;

public class Question {
	int id;
	public String question,category,level,createdon,createdby;
	boolean isActive;
	
	//getter and setter for question table
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public String getCreated_on() {
		return createdon;
	}
	public void setCreated_on(String created_on) {
		this.createdon = created_on;
	}
	public String getCreated_by() {
		return createdby;
	}
	public void setCreated_by(String created_by) {
		this.createdby = created_by;
	}
	@Override
	public String toString() {
	    return "Question[" + question + "," + category + "," + level + ","+ createdon +","+ createdby +"]";
	    		
	}

}
