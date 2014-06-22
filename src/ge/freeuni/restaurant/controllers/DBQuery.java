package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;

import ge.freeuni.restaurant.model.Restaurant;
import ge.freeuni.restaurant.model.User;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

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

	public int AddRestauratns(Restaurant res, int user_id)
			throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into restaurant.restaurants (res_id,user_id,name,address,category,phone,location,lactitude,longtitude,Zip_code)"
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
				+ res.getLac()
				+ "','"
				+ res.getLng()
				+ "','"
				+ res.getZip()
				+ "');";
		
		stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
		ResultSet rs = stmt.getGeneratedKeys();
		int lastid = -1;
		if (rs.next())
			lastid = rs.getInt(1);
		DBprovider.CloseConnection();
		return lastid;
	}

	public ArrayList<Restaurant> getMyRestaurants(int user_id)
			throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		ArrayList<Restaurant> res = new ArrayList<Restaurant>();

		String sql = "select re.res_id,re.user_id,re.name,re.address,re.location,re.category,re.phone,re.counter, "
				+ "(select AVG(score) from restaurant.score where res_id = re.res_id) as score, " 
				+"(select name from restaurant.picture where res_id = re.res_id limit 1) as picture "
				+ "from restaurant.restaurants as re "
				+ "where re.user_id = "
				+ user_id + ";";
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			Restaurant res1 = new Restaurant();
			res1.setID(rs.getInt("re.res_id"));
			res1.setName(rs.getString("re.name"));
			res1.setAddress(rs.getString("re.address"));
			res1.setCategory(rs.getInt("re.category"));
			res1.setLocation(rs.getString("re.location"));
			res1.setPhone(rs.getString("re.phone"));
			res1.setAvgScore(rs.getInt("score"));
			res1.setPhoto1Address(rs.getBlob("picture"));
			res.add(res1);
		}

		return res;
	}

	public Restaurant getCurrentRestaurant(int res_id)
			throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		Restaurant res = new Restaurant();

		String sql = "select re.res_id,re.user_id,re.name,re.address,re.location,re.category,re.phone,re.counter, "
				+ "(select AVG(score) from restaurant.score where res_id = re.res_id) as score, "
				+ "(select name from restaurant.picture where res_id = re.res_id limit 1) as picture "
				+ "from restaurant.restaurants as re "
				+ "where re.res_id = "
				+ res_id + ";";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			res.setID(rs.getInt("re.res_id"));
			res.setName(rs.getString("re.name"));
			res.setAddress(rs.getString("re.address"));
			res.setCategory(rs.getInt("re.category"));
			res.setLocation(rs.getString("re.location"));
			res.setPhone(rs.getString("re.phone"));
			res.setAvgScore(rs.getInt("score"));
			res.setPhoto1Address(rs.getBlob("picture"));
		}
		return res;

	}

	public boolean ifAlreadyAssessment(int res_id, int user_id)
			throws SQLException, ClassNotFoundException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "select count(score) as uscore from restaurant.score where "
					 +"user_id = '"+ user_id+"' and res_id = '"+res_id+"';";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			if(rs.getInt("uscore") > 0){
				return true;
			}
		}
		return false;
	}

	public void makeAssessment(int user_id, int res_id, int score)
			throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();

		String sql = "insert into restaurant.score (user_id,res_id,score,createdate) "
				+ "values('"
				+ user_id
				+ "','"
				+ res_id
				+ "','"
				+ score
				+ "',CURDATE())";
		stmt.executeUpdate(sql);
	}
}
