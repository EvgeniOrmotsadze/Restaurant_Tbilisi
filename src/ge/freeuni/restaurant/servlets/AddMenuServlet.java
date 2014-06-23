package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.PhotoUpload;
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
        for (Part part : request.getParts()) {
        	System.out.println(part.getName());
        	if (!part.getName().equals("images[]"))
        		continue;
        	InputStream is = part.getInputStream();
        	PhotoUpload photo = new PhotoUpload();
        	photo.AddPhotos(is, Integer.parseInt((String) request.getParameter("lastid")));
        }
        
        
	}

}
