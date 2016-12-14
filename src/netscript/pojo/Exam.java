package netscript.pojo;

public class Exam {
	public int id;

	public String exam_name,totalquestion,totalmarks;
	public String startdatetime;
	public String enddatetime;
	public String duration;
	public String createdon;
	public String level;
	public String categoy;
	public String createdby;
	
	//getter and setter for exam table
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTotalQuestion() {
		return totalquestion;
	}
	public void setTotalQuestion(String totalQuestion) {
		this.totalquestion = totalQuestion;
	}
	public String getCreatedon() {
		return createdon;
	}
	public void setCreatedon(String createdon) {
		this.createdon = createdon;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	public String getTotalmarks() {
		return totalmarks;
	}
	public void setTotalmarks(String totalmarks) {
		this.totalmarks = totalmarks;
	}
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getCategoy() {
		return categoy;
	}
	public void setCategoy(String category2) {
		this.categoy = category2;
	}
	
	public String getStartdatetime() {
		return startdatetime;
	}
	public void setStartdatetime(String startdatetime) {
		this.startdatetime = startdatetime;
	}
	public String getEnddatetime() {
		return enddatetime;
	}
	public void setEnddatetime(String enddatetime) {
		this.enddatetime = enddatetime;
	}
	public String getExam_name() {
		return exam_name;
	}

	
	@Override
	public String toString(){
		return "Exam[" + exam_name + "," + totalquestion + "," + totalmarks + "," + startdatetime + ","+ enddatetime +","+ duration +","+ categoy +","+ level +"]";
		
	}
}
