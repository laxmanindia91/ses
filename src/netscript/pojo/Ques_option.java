package netscript.pojo;

public class Ques_option {
	public int question_id;
	public String option;
	public String answer;
	public boolean isAnswer;

	//getter and setter for ques_option table
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String list1) {
		this.option = list1;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public boolean isAnswer() {
		return isAnswer;
	}
	public void setAnswer(boolean isAnswer) {
		this.isAnswer = isAnswer;
	}
	@Override
	public String toString() {
	    return "Question_options[" + question_id + "," + option + "," + answer + ","+ isAnswer +"]";
	    		
	}
}
