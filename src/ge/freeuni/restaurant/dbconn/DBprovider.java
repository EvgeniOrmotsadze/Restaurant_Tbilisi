package ge.freeuni.restaurant.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBprovider {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/restaurant";
	static final String USER = "root";
	static final String PASS = "12345";

	public static Connection conn = null;
	public static Statement stmt = null;

	public synchronized static Connection CreateConnection()
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		if (conn == null) {
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
		}
		return conn;
	}

	public synchronized static void CloseConnection() throws SQLException {
		if (conn != null){
			conn.close();
			conn = null;
		}
	}

}
