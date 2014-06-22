package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.dbconn.DBprovider;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ArafrisServleti
 */
@WebServlet("/AddMenuServlet")
@MultipartConfig
public class AddMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = DBprovider.CreateConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        for (Part part : request.getParts()) {
        	System.out.println(part.getName());
        	if (!part.getName().equals("images[]"))
        		continue;
        	InputStream is = part.getInputStream();
        	String sql = "INSERT INTO picture (id, res_id, name) VALUES (NULL, ?, ?)";
        	PreparedStatement statement;
			try {
				statement = conn.prepareStatement(sql);
				statement.setInt(1, Integer.parseInt((String) request.getParameter("lastid")));
	            statement.setBlob(2, is);
	            statement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
	}

}
