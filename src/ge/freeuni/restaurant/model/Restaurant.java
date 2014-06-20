package ge.freeuni.restaurant.model;

public class Restaurant {
	private String name;
	private String address;
	private int category;
	private String phone;
	private String location;
	private String cordinate_x;
	private String cordinate_y;
	private int counter;
	private int avg_score;
	private int ID;
	private String photo1Address;
	private String photo2Address;
	private String photo3Address;
	private String photo4Address;
	private String photo5Address;
	private String photo6Address;

	public void setID(int ID) {
		this.ID = ID;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setX(String cordinate_x) {
		this.cordinate_x = cordinate_x;
	}

	public void setY(String cordinate_y) {
		this.cordinate_y = cordinate_y;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public void setAvgScore(int avg_score) {
		this.avg_score = avg_score;
	}

	public String getName() {
		return this.name;
	}

	public String getAddress() {
		return this.address;
	}

	public int getCategory() {
		return this.category;
	}

	public String getPhone() {
		return this.phone;
	}

	public String getLocation() {
		return this.location;
	}

	public int getID() {
		return this.ID;
	}

	public String getX() {
		return this.cordinate_x;
	}

	public String getY() {
		return this.cordinate_y;
	}

	public int getCounter() {
		return this.counter;
	}

	public int getAvgScore() {
		return this.avg_score;
	}

	public void setPhoto1Address(String string) {
		// TODO Auto-generated method stub
		this.photo1Address = string;

	}

	public void setPhoto2Address(String string) {
		// TODO Auto-generated method stub
		this.photo2Address = string;

	}

	public void setPhoto3Address(String string) {
		// TODO Auto-generated method stub
		this.photo3Address = string;

	}

	public void setPhoto4Address(String string) {
		// TODO Auto-generated method stub
		this.photo4Address = string;
	}

	public void setPhoto5Address(String string) {
		// TODO Auto-generated method stub
		this.photo5Address = string;
	}

	public void setPhoto6Address(String string) {
		// TODO Auto-generated method stub
		this.photo6Address = string;
	}
	
	public String getPhoto1Address() {
		return photo1Address;
	}

	public String getPhoto2Address() {
		return photo2Address;
	}

	public String getPhoto3Address() {
		return photo3Address;
	}

	public String getPhoto4Address() {
		return photo4Address;
	}

	public String getPhoto5Address() {
		return photo5Address;
	}

	public String getPhoto6Address() {
		return photo6Address;
	}

	

}
