package ge.freeuni.restaurant.model;

public class Menu {
	
	private int id;
	private String dish;
	private String price;
	
	public void setID(int id){
		this.id = id;
	}
	public void setDish(String dish){
		this.dish = dish;
	}
	
	public void setPrice(String price){
		this.price = price;
	}

	public int getID(){
		return this.id;
	}
	public String getDish(){
		return this.dish;
	}
	public String getPrice(){
		return this.price;
	}
	
}
