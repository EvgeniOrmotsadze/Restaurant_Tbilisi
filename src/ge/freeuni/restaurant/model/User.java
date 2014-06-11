package ge.freeuni.restaurant.model;
public class User {
	private int ID;
	private String name;
	private String lastname;
	private String mail;
	private String phone;
	private String password;
	private String repassword;

	public void setID(int ID){
		this.ID = ID;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public void setLastName(String lastname){
		this.lastname = lastname;
	}
	
	public void setMail(String mail){
		this.mail = mail;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public void setRePassword(String repassword){
		this.repassword = repassword;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getLastName(){
		return this.lastname;
	}
	
	public String getMail(){
		return this.mail;
	}
	
	public String getPhone(){
		return this.phone;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public String getRePassword(){
		return this.repassword;
	}
	public int getID(){
		return this.ID;
	}
}

