package ge.freeuni.restaurant.model;

public class Restaurant {
	private String name;
	private String address;
	private int category;
	private String phone;
	private String location;
	
	
	public void setName(String name){
		this.name = name;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public void setCategory(int category){
		this.category = category;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	public void setLocation(String location){
		this.location = location;
	}
	public String getName(){
		return this.name;
	}
	public String getAddress(){
		return this.address;
	}
	public int getCategory(){
		return this.category;
	}
	public String getPhone(){
		return this.phone;
	}
	public String getLocation(){
		return this.location;
	}
	

}
