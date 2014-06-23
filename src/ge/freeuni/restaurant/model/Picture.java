package ge.freeuni.restaurant.model;

import java.sql.Blob;
import java.sql.SQLException;

import org.apache.catalina.util.Base64;

public class Picture {

	private int id;
	private int res_id;
	private String name;
	
	public void setID(int id){
		this.id = id;
	}
	public void setResId(int res_id){
		this.res_id = res_id;
	}
	
	
	public void setBlob(Blob blob) throws SQLException{
		if (blob == null) {
			this.name = "";
			return;
		}
		byte[] pict = blob.getBytes(1, (int)name.length());
		String stringToStore = new String(Base64.encode(pict));
		this.name = stringToStore;
	}
	
	public int getID(){
		return this.id;
	}
	
	public int getResId(){
		return this.res_id;
	}
	
	public String getBlob(){
		return this.name;
	}
	
}
