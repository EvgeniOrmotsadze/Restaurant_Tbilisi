package ge.freeuni.restaurant.model;

import java.sql.Blob;
import java.sql.SQLException;

import org.apache.catalina.util.Base64;

@SuppressWarnings("deprecation")
public class Restaurant {
	private String name;
	private String address;
	private int category;
	private String phone;
	private int location;
	private int counter;
	private int avg_score;
	private int ID;
	private String photo1Address;
	private String photo2Address;
	private String photo3Address;
	private String photo4Address;
	private String photo5Address;
	private String photo6Address;
	private String zip_code;
	private String address_eng;
	private String lactitude;
	private String longtitude;
	private String additional_info;
	private int cuisine;
	
	public void setID(int ID) {
		this.ID = ID;
	}
	
	public void setLac(String lactitude){
		this.lactitude= lactitude;
	}
	
	public void setLng(String longtitude){
		this.longtitude=longtitude;
	}
	public void setZip(String zip_code){
		this.zip_code = zip_code;
	}
	
	public void setGoogle(String address_eng){
		this.address_eng =  address_eng;
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

	public void setLocation(int location) {
		this.location = location;
	}


	public void setCounter(int counter) {
		this.counter = counter;
	}

	public void setAvgScore(int avg_score) {
		this.avg_score = avg_score;
	}
	
	public void setAdditionalInfo(String additional_info){
		this.additional_info=additional_info;
	}
	
	public void setCuisine(int cuisine){
		this.cuisine=cuisine;
	}

	public String getName() {
		return this.name;
	}

	public String getAddress() {
		return this.address;
	}
	
	public String getGoogle(){
		return this.address_eng;
	}
	
	public int getCategory() {
		return this.category;
	}

	public String getPhone() {
		return this.phone;
	}

	public int getLocation() {
		return this.location;
	}

	public int getID() {
		return this.ID;
	}


	public int getCounter() {
		return this.counter;
	}

	public int getAvgScore() {
		return this.avg_score;
	}
	
	public String getZip(){
		return this.zip_code;
	}
	
	public String getLac(){
		return this.lactitude;
	}
	public String getLng(){
		return this.longtitude;
	}
	
	public String getAdditionalInfo(){
		return this.additional_info;
	}
	
	public int getCuisine(){
		return this.cuisine;
	}

	public void setPhoto1Address(Blob string) throws SQLException {
		if (string == null) {
			this.photo1Address = "";
			return;
		}
		byte[] pict = string.getBytes(1, (int)string.length());
		String stringToStore = new String(Base64.encode(pict));
		this.photo1Address = stringToStore;
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
