package netscript.pojo;

public class Category {
	
	private int id;
	private String category;
	private Boolean isActive;
	
	//getter and setter for AddQuescategory
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		 this.category = category;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

}
