package ge.freeuni.restaurant.servlets;


import ge.freeuni.restaurant.controllers.MenuAdd;
import ge.freeuni.restaurant.model.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

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
		ArrayList<Menu> menu = new ArrayList<Menu>();
		String dish="";
		for (Part part : request.getParts()) {
				System.out.println(part.getName());
	        	if (part.getName().equals("dish[]")){
	        		InputStream is = part.getInputStream();
	        		StringWriter writer = new StringWriter();
	        		IOUtils.copy(is, writer, "UTF-8");
	        		dish = writer.toString();
	        		continue;
	        	}
	        	if(part.getName().equals("price[]")){
	        		InputStream is = part.getInputStream();
	        		StringWriter writer = new StringWriter();
	        		IOUtils.copy(is, writer, "UTF-8");
	        		String price = writer.toString();
	        		Menu mm = new Menu();
	        		mm.setDish(dish);
	        		mm.setPrice(price);
	        		menu.add(mm);
	        	}
		 }
		MenuAdd ma = new MenuAdd();
		try {
			ma.AddMenusToRestaurant(Integer.parseInt((String) request.getParameter("lastid")), menu);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddPhotos");
		dispatcher.forward(request, response);
	}

}
