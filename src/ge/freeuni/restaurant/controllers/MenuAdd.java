package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;
import ge.freeuni.restaurant.model.Menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenuAdd {
	
	public void AddMenusToRestaurant(int last_id, ArrayList<Menu> menu) throws SQLException{
		Connection conn = null;
		try {
			conn = DBprovider.CreateConnection();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		for(int i = 0; i < menu.size(); i++){
        	String sql = "INSERT INTO menu (id, res_id, foodname,foodprice) VALUES (NULL, ?, ?,?)";
        	PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				statement.setInt(1, last_id);
	            statement.setString(2, menu.get(i).getDish());
	            statement.setString(3, menu.get(i).getPrice());
	            statement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		DBprovider.CloseConnection();
	}
	
}
