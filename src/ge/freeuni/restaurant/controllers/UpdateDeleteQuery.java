package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;
import ge.freeuni.restaurant.model.Restaurant;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateDeleteQuery {
	
	 public void deleteRestaurant(int res_id) throws ClassNotFoundException, SQLException{//delete restaurant
		 	Connection conn = DBprovider.CreateConnection();
			Statement stmt = conn.createStatement();
			String sql= "delete from restaurant.restaurants where res_id = '" + res_id + "';";
			stmt.executeUpdate(sql);
			DBprovider.CloseConnection();
	 }
	 
	 public void UpdateRestaurant(Restaurant r)throws ClassNotFoundException, SQLException{//update restaurant
		 	Connection conn = DBprovider.CreateConnection();
			Statement stmt = conn.createStatement();
			String sql = "Update restaurants set name = '" + r.getName() + "', address = '" + r.getAddress() + "', "
					+ "address_eng = '" + r.getGoogle() + "', category='" + r.getCategoryID() + "', phone = '" + r.getPhone()+ "',"
					+"lactitude='"+r.getLac()+ "', longtitude='"+r.getLng()+"',"+"zip_Code='" +r.getZip()+"',"
					+"additional_info='"+r.getAdditionalInfo()+"', "+"cuisine='"+r.getCuisineID()+"'" 
					+" where res_id = '"+r.getID()+"';";
			stmt.executeUpdate(sql);
			DBprovider.CloseConnection();
	 }
	 
	 public void deletePhotoByRestaurant(int id) throws SQLException, ClassNotFoundException{
		 Connection conn = DBprovider.CreateConnection();
			Statement stmt = conn.createStatement();
			String sql= "delete from restaurant.picture where id = '" + id + "';";
			stmt.executeUpdate(sql);
			DBprovider.CloseConnection();
	 }

}
