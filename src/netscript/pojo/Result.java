package netscript.pojo;

public class Result {
	
	private int result_id, exam_id, usr_id, marks_obtained, total_marks;
	private String  test_level, category;
	private String cretaed_on;
	
	//getter and setter for result
	public int getResult_id() {
		return result_id;
	}
	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}
	public int getExam_id() {
		return exam_id;
	}
	public void setExam_id(int exam_id) {
		this.exam_id = exam_id;
	}
	public int getUsr_id() {
		return usr_id;
	}
	public void setUsr_id(int usr_id) {
		this.usr_id = usr_id;
	}
	public int getMarks_obtained() {
		return marks_obtained;
	}
	public void setMarks_obtained(int marks_obtained) {
		this.marks_obtained = marks_obtained;
	}
	public int getTotal_marks() {
		return total_marks;
	}
	public void setTotal_marks(int total_marks) {
		this.total_marks = total_marks;
	}
	public String getCretaed_on() {
		return cretaed_on;
	}
	public void setCretaed_on(String date) {
		this.cretaed_on = date;
	}
	public String getTest_level() {
		return test_level;
	}
	public void setTest_level(String test_level) {
		this.test_level = test_level;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	

}
