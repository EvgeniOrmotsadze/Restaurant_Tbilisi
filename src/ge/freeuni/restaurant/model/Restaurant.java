package ge.freeuni.restaurant.model;

public class Restaurant {
	private String name;
	private String address;
	private String category;
	private String phone;
	private String location;
	private String cordinate_x;
	private String cordinate_y;
	private int counter;
	
	
	public void setName(String name){
		this.name = name;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public void setCategory(String category){
		this.category = category;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	public void setLocation(String location){
		this.location = location;
	}
	public void setX(String cordinate_x){
		this.cordinate_x = cordinate_x;
	}
	public void setY(String cordinate_y){
		this.cordinate_y = cordinate_y;
	}
	
	public void setCounter(int counter){
		this.counter = counter;
	}
	
	public String getName(){
		return this.name;
	}
	public String getAddress(){
		return this.address;
	}
	public String getCategory(){
		return this.category;
	}
	public String getPhone(){
		return this.phone;
	}
	public String getLocation(){
		return this.location;
	}
	
	public String getX(){
		return this.cordinate_x;
	}
	public String getY(){
		return this.cordinate_y;
	}
	public int getCounter(){
		return this.counter;
	}

}
