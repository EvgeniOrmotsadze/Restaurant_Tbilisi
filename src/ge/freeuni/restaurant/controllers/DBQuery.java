package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;

import ge.freeuni.restaurant.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBQuery {

	public void AddUser(User user) throws ClassNotFoundException, SQLException{
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into user (user_id,name,lastname,email,phone,password,createdate)"+
					 "values (null,'"+user.getName()+"','"+user.getLastName()+ "','" + user.getMail() +"','" +user.getPhone()+"','"+user.getPassword()+"',curdate())" ;  
		stmt.executeUpdate(sql);
		DBprovider.CloseConnection();
	}
	
	public User getUser(String email, String password) throws ClassNotFoundException, SQLException{
		 User user = new User();
		 Connection conn = DBprovider.CreateConnection();
		 Statement stmt = conn.createStatement();
		 
		 String sql = "select user_id,name,lastname,email,phone,createdate "+
				 		"from restaurant.user where "+
				 		"email = " + "'"+email+ "'and password = '" + password +"';"; 
		 
		 ResultSet rs = stmt.executeQuery(sql);
		 while(rs.next()){
			 user.setName(rs.getString("name"));
			 user.setLastName(rs.getString("lastname"));
			 user.setMail(rs.getString("email"));
			 user.setPhone(rs.getString("phone"));
			 user.setPassword(password);
		 }
		return user;
	}
	
}
