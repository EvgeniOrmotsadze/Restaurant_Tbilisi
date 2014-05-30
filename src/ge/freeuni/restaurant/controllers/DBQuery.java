package ge.freeuni.restaurant.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBQuery {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/restaurant";
	static final String USER = "root";
	static final String PASS = "12345";

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		String name  = "evgedsdsni";
		String sname = "ormo";
		String mail = "dadad@yutaoc,com";
		String pas = "password";
		String date = "CURDATE()";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql1 = "insert into user (user_id,first_name,last_name,user_email,user_password,createdate)"+
					  "values (null,'"+ name +"','" + sname+ "','"+mail + "','"+ pas+"'," +date+ ");";
			stmt.executeUpdate(sql1);
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
