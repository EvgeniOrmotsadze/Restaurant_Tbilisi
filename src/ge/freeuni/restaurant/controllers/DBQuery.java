package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;

import ge.freeuni.restaurant.model.Restaurant;
import ge.freeuni.restaurant.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBQuery {

	public void AddUser(User user) throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into user (user_id,name,lastname,email,phone,password,createdate)"
				+ "values (null,'"
				+ user.getName()
				+ "','"
				+ user.getLastName()
				+ "','"
				+ user.getMail()
				+ "','"
				+ user.getPhone() + "','" + user.getPassword() + "',curdate())";
		stmt.executeUpdate(sql);
		DBprovider.CloseConnection();
	}

	public User getUser(String email, String password)
			throws ClassNotFoundException, SQLException {
		User user = new User();
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();

		String sql = "select user_id,name,lastname,email,phone,createdate "
				+ "from restaurant.user where " + "email = " + "'" + email
				+ "'and password = '" + password + "';";
		ResultSet rs = stmt.executeQuery(sql);
		boolean empty = false;
		while (rs.next()) {
			user.setID(rs.getInt("user_id"));
			user.setName(rs.getString("name"));
			user.setLastName(rs.getString("lastname"));
			user.setMail(rs.getString("email"));
			user.setPhone(rs.getString("phone"));
			user.setPassword(password);
			empty = true;
		}
		if (!empty)
			return null;
		return user;
	}

	public boolean ifExistUser(String email) throws ClassNotFoundException,
			SQLException {

		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();

		String sql = "select user_id,name,lastname,email,phone,createdate "
				+ "from restaurant.user where " + "email = " + "'" + email
				+ "';";
		ResultSet rs = stmt.executeQuery(sql);
		boolean empty = false;
		while (rs.next()) {
			empty = true;
		}
		return empty;
	}

	public void AddRestauratns(Restaurant res, int user_id)
			throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into restaurant.restaurants (res_id,user_id,name,address,category,phone,location,cordinate_x,cordinate_y,counter)"
				+ "values (null,'"
				+ user_id
				+ "','"
				+ res.getName()
				+ "','"
				+ res.getAddress()
				+ "','"
				+ res.getCategory()
				+ "','"
				+ res.getPhone()
				+ "','"
				+ res.getLocation()
				+ "','"
				+ res.getX()
				+ "','"
				+ res.getY()
				+ "','"
				+ res.getCounter()
				+ "');";
		stmt.executeUpdate(sql);
		DBprovider.CloseConnection();
	}

	public ArrayList<Restaurant> getMyRestaurants(int user_id)
			throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		ArrayList<Restaurant> res = new ArrayList<Restaurant>();

		String sql = "select re.res_id,re.user_id,re.name,re.address,re.location,re.category,re.phone,re.cordinate_x,re.cordinate_y,re.counter,"
				+ "(select AVG(score) from restaurant.score where res_id = re.res_id) as score"
				+ "from restaurant.restaurants as re"
				+"where re.user_id = " + user_id +";"; 
		
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Restaurant res1 = new Restaurant();
			res1.setName(rs.getString("re.name"));
			//TODO
			res.add(res1);
		}
		return res;
	}
}
