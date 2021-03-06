package ge.freeuni.restaurant.controllers;

import ge.freeuni.restaurant.dbconn.DBprovider;
import ge.freeuni.restaurant.model.Menu;
import ge.freeuni.restaurant.model.Picture;
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

	public int AddRestauratns(Restaurant res, int user_id)
			throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into restaurant.restaurants (res_id,user_id,name,address,address_eng,category,phone,lactitude,longtitude,zip_Code,additional_info,cuisine)"
				+ "values (null,'"
				+ user_id
				+ "','"
				+ res.getName()
				+ "','"
				+ res.getAddress()
				+ "','"
				+ res.getGoogle()
				+"','"
				+ res.getCategoryID()
				+ "','"
				+ res.getPhone()
				+ "','"
				+ res.getLac()
				+ "','"
				+ res.getLng()
				+ "','"
				+ res.getZip()
				+ "','"
				+ res.getAdditionalInfo()
				+ "','"
				+res.getCuisineID()
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

		String sql = "select re.res_id,re.user_id,re.name,re.address,re.category,re.phone,re.counter,re.cuisine,re.zip_Code,re.additional_info,  "
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
			res1.setCategory(rs.getString("re.category"));
			res1.setPhone(rs.getString("re.phone"));
			res1.setAvgScore(rs.getInt("score"));
			res1.setAdditionalInfo(rs.getString("re.additional_info"));
			res1.setZip(rs.getString("re.zip_Code"));
			res1.setCuisine(rs.getString("re.cuisine"));
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

		String sql = "select re.res_id,re.user_id,re.name,re.category,re.cuisine,re.address,cat.name,re.phone,re.lactitude,re.longtitude,re.counter,cus.name,re.zip_Code,re.address_eng,re.additional_info,  "
				+ "(select AVG(score) from restaurant.score where res_id = re.res_id) as score, "
				+ "(select name from restaurant.picture where res_id = re.res_id limit 1) as picture "
				+ "from restaurant.restaurants as re join restaurant.category as cat on cat.id = re.category "
				+" join restaurant.cuisine as cus on cus.id = re.cuisine "
				+ "where re.res_id = "
				+ res_id + ";";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			res.setID(rs.getInt("re.res_id"));
			res.setName(rs.getString("re.name"));
			res.setAddress(rs.getString("re.address"));
			res.setCategory(rs.getString("cat.name"));
			res.setPhone(rs.getString("re.phone"));
			res.setAvgScore(rs.getInt("score"));
			res.setZip(rs.getString("re.zip_Code"));
			res.setLac(rs.getString("re.lactitude"));
			res.setLng(rs.getString("re.longtitude"));
			res.setGoogle(rs.getString("re.address_eng"));
			res.setAdditionalInfo(rs.getString("additional_info"));
			res.setCuisine(rs.getString("cus.name"));
			res.setPhoto1Address(rs.getBlob("picture"));
			res.setCuisineID(rs.getInt("re.cuisine"));
			res.setCategoryID(rs.getInt("re.category"));
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

	
	public ArrayList<Restaurant> getLastAdds() throws ClassNotFoundException, SQLException{
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		ArrayList<Restaurant> arr = new ArrayList<Restaurant>();
		

		String sql = "select re.res_id,re.user_id,re.name,re.address,re.counter, "
				+ "(select AVG(score) from restaurant.score where res_id = re.res_id) as score, "
				+ "(select name from restaurant.picture where res_id = re.res_id limit 1) as picture "
				+ "from restaurant.restaurants as re  order by re.res_id limit 8 ";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			Restaurant res = new Restaurant();
			res.setID(rs.getInt("re.res_id"));
			res.setName(rs.getString("re.name"));
			res.setAddress(rs.getString("re.address"));
			res.setAvgScore(rs.getInt("score"));
			res.setPhoto1Address(rs.getBlob("picture"));
			arr.add(res);
		}
		return arr;
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
	
	
	public ArrayList<Restaurant> SearchRestaurantsByName(String SearchedName)throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		ArrayList<Restaurant> res = new ArrayList<Restaurant>();
		String query = "select re.res_id,re.name,re.address,re.category,re.phone,re.counter,re.cuisine,re.additional_info,  "
				+ "(select AVG(score) from restaurant.score where res_id = re.res_id) as score, " 
				+"(select name from restaurant.picture where res_id = re.res_id limit 1) as picture "
				+ "from restaurant.restaurants as re "
				+ " where re.name like '" + SearchedName + "%'";
		ResultSet rs=stmt.executeQuery(query);
		while (rs.next()) {
			Restaurant r=new Restaurant();
			r.setID(rs.getInt("re.res_id"));
			r.setName(rs.getString("re.name"));
			r.setAddress(rs.getString("re.address"));
			r.setCategory(rs.getString("re.category"));
			r.setPhone(rs.getString("re.phone"));
			r.setAvgScore(rs.getInt("score"));
			r.setAdditionalInfo(rs.getString("additional_info"));
			r.setCuisine(rs.getString("cuisine"));
			r.setPhoto1Address(rs.getBlob("picture"));
			res.add(r);
		}
		return res;	
	}
	

	public ArrayList<Restaurant> SearchRestaurantsByCategory(int ctg)throws ClassNotFoundException, SQLException {
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		ArrayList<Restaurant> res = new ArrayList<Restaurant>();
		String query = "select re.res_id,re.name,re.address,cat.name,re.phone,re.counter,cus.name,re.additional_info, "
				+ "(select AVG(score) from restaurant.score where res_id = re.res_id) as score, " 
				+"(select name from restaurant.picture where res_id = re.res_id limit 1) as picture "
				+ "from restaurant.restaurants as re join restaurant.category as cat on cat.id = re.category "
				+" join restaurant.cuisine as cus on cus.id = re.cuisine"
				+ " where re.category = '" 
				+ ctg + "';";
		ResultSet rs=stmt.executeQuery(query);
		while (rs.next()) {
			Restaurant r=new Restaurant();
			r.setID(rs.getInt("re.res_id"));
			r.setName(rs.getString("re.name"));
			r.setAddress(rs.getString("re.address"));
			r.setCategory(rs.getString("cat.name"));
			r.setPhone(rs.getString("re.phone"));
			r.setAvgScore(rs.getInt("score"));
			r.setAdditionalInfo(rs.getString("additional_info"));
			r.setCuisine(rs.getString("cus.name"));
			r.setPhoto1Address(rs.getBlob("picture"));
			res.add(r);
		}
		return res;	
	}
	public ArrayList<Menu> takeMenuByRestaurant(int res_id) throws ClassNotFoundException, SQLException{
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		ArrayList<Menu> menu = new ArrayList<Menu>();
		
		String query = "select id,res_id,foodname,foodprice "
					   + "from restaurant.menu "
					   +"where res_id = '"+res_id+"';";
		ResultSet rs=stmt.executeQuery(query);
		while (rs.next()) {
			Menu mm=new Menu();
			mm.setID(rs.getInt("id"));
			mm.setResId(rs.getInt("res_id"));
			mm.setDish(rs.getString("foodname"));
			mm.setPrice(rs.getString("foodprice"));
			menu.add(mm);
		}
		DBprovider.CloseConnection();
		return menu;
	}
	
	/*
	public String getCuisine(int id) throws ClassNotFoundException, SQLException{
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		String query = "select name from restaurant.cuisine where id = '" + id + "';";
		
		String ret = "";
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next()){
			ret = rs.getString(arg0)
		}
	}
	*/
	public ArrayList<Picture> takePictureByRestaurant(int res_id) throws ClassNotFoundException, SQLException{
		Connection conn = DBprovider.CreateConnection();
		Statement stmt = conn.createStatement();
		ArrayList<Picture> pic = new ArrayList<Picture>();
		String query = "select id,res_id,name "
				   + "from restaurant.picture "
				   +"where res_id = '"+res_id+"';";
		ResultSet rs=stmt.executeQuery(query);
	
		while (rs.next()) {
			Picture picture = new Picture();
			picture.setID(rs.getInt("id"));
			picture.setResId(rs.getInt("res_id"));
			picture.setBlob(rs.getBlob("name"));
			pic.add(picture);
		}
		DBprovider.CloseConnection();
		return pic;
	}
	
}
