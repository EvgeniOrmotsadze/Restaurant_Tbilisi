package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;

import ge.freeuni.restaurant.model.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DBQuery {

	public void AddUser(User user) throws ClassNotFoundException, SQLException{
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into user (user_id,name,lastname,email,phone,password,repassword,createdate)"+
					 "values (null,'"+user.getName()+"','"+user.getLastName()+ "','" + user.getMail() +"','" +user.getPhone()+"','"+user.getPassword()+"','"+user.getRePassword()+"',curdate())" ;  
		stmt.executeUpdate(sql);
		DBprovider.CloseConnection();
	}
	
}
