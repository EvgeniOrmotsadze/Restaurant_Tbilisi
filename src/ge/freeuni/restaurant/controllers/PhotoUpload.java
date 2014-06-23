package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PhotoUpload {
	public void AddPhotos(InputStream is,int last_id) throws SQLException{
		Connection conn = null;
		try {
			conn = DBprovider.CreateConnection();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
        	String sql = "INSERT INTO picture (id, res_id, name) VALUES (NULL, ?, ?)";
        	PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				statement.setInt(1, last_id);
	            statement.setBlob(2, is);
	            statement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 DBprovider.CloseConnection();
			
		
        }
		
        
}
