package ge.freeuni.restaurant.model;

public class Menu {
	
	private int id;
	private String dish;
	private String price;
	private int res_id;
	
	public void setID(int id){
		this.id = id;
	}
	public void setResId(int res_id){
		this.res_id = res_id;
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
	public int getResId(){
		return this.res_id;
	}
	public String getDish(){
		return this.dish;
	}
	public String getPrice(){
		return this.price;
	}
	
}
