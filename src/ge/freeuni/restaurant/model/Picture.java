package ge.freeuni.restaurant.model;

import java.sql.Blob;

public class Picture {

	private int id;
	private int res_id;
	private Blob blob;
	
	public void setID(int id){
		this.id = id;
	}
	public void setResId(int res_id){
		this.res_id = res_id;
	}
	public void setBlob(Blob blob){
		this.blob = blob;
	}
	
	public int getID(){
		return this.id;
	}
	
	public int getResId(){
		return this.res_id;
	}
	
	public Blob getBlob(){
		return this.blob;
	}
	
}
