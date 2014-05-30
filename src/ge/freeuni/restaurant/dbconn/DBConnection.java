package ge.freeuni.restaurant.dbconn;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBConnection {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/restaurant";
	static final String USER = "root";
	static final String PASS = "12345";
	
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			
			String sql1 = "CREATE table IF NOT EXISTS  user("+
					"user_id INT NOT null auto_increment," +
					" first_name varchar(255) not null, "+ 
					" last_name varchar(255) not null," + 
					"user_email varchar(255) not null, "+
					" user_password varchar(255) not null,"+
					"createdate datetime," +
					"PRIMARY key (user_id));";
			System.out.println("create user table");
			String sql2 = "CREATE table IF NOT EXISTS  restaurants("+
					"res_id int not null auto_increment,"+
					"user_id  int not null,"+
					"res_name varchar(255) not null," +
					"res_address varchar(255)," +
					"category int," + 
					"res_phone varchar(255),"+
					"cordinate_x  double,"+
					"cordinate_y double,"+
					"counter int,"+
					"primary key(res_id),"+
					"foreign key(user_id) References user(user_id));";
			System.out.println("create restorant table");
			String sql3 = "CREATE table IF NOT EXISTS score("+
						 "id int auto_increment,"+
						 "user_id int,"+
						 "res_id int,"+
						 "score int," +
						 "favorite int,"+
						 "primary key(id),"+
						 "foreign key(user_id) references user(user_id),"+
						 "	foreign key(res_id) references restaurants(res_id));";
			System.out.println("create score table");
			String sql4 = " CREATE table IF NOT EXISTS picture("+
						 "id int not null auto_increment,"+
						 "res_id int,"+
						 "picture_name varchar(255),"+
						 "primary key(id),"+
						 "foreign key(res_id) references restaurants(res_id));";
			System.out.println("create picture table");
			String sql5 = "CREATE table IF NOT EXISTS menu("+
						 "id int not null auto_increment,"+
						 "res_id int,"+
						 "menu_name varchar(255),"+
						 "menu_price double,"+
						 "primary key(id),"+
						 "foreign key(res_id) references restaurants(res_id));";
			System.out.println("create menu table");
			
			stmt.executeUpdate(sql1);
			stmt.executeUpdate(sql2);
			stmt.executeUpdate(sql3);
			stmt.executeUpdate(sql4);
			stmt.executeUpdate(sql5);
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					conn.close();
			} catch (SQLException se) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
	}

}
