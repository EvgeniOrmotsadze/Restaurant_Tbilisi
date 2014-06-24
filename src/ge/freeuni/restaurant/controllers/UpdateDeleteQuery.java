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
			String sql= "delete from restaurant where re.res_id = "
					+ res_id + ";";
			stmt.executeQuery(sql);
	 }
	 
	 public void UpdateRestaurant(Restaurant r)throws ClassNotFoundException, SQLException{//update restaurant
		 	Connection conn = DBprovider.CreateConnection();
			Statement stmt = conn.createStatement();
			String sql = "Update restaurant set name = '" + r.getName() + "', address = '" + r.getAddress() + "', "
					+ "address_eng = '" + r.getGoogle() + "', category='" + r.getCategory() + "', phone = '" + r.getPhone()+ "',"
					+"lactitude='"+r.getLac()+ "', longtitude='"+r.getLng()+"',"+"zip_Code='" +r.getZip()+"',"
					+"additional_info='"+r.getAdditionalInfo()+"', "+"cuisine='"+r.getCuisine()+"'";
			stmt.executeQuery(sql);

		 
	 }

}
