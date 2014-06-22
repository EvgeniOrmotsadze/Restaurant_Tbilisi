package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.model.Restaurant;
import ge.freeuni.restaurant.model.User;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CheckRestaurantRegistrationParaamters
 */
@WebServlet("/CheckRestaurantRegistrationParaamters")
public class CheckRestaurantRegistrationParaamters extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckRestaurantRegistrationParaamters() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	private boolean checkParamater(HttpServletRequest request) {
		if (request.getParameter("Name").isEmpty()
				|| request.getParameter("Address").isEmpty()
				|| request.getParameter("GoogleAddress").isEmpty()
				||request.getParameter("Zipcode").isEmpty()
				|| request.getParameter("Category").isEmpty()
				|| request.getParameter("Phone").isEmpty()
				|| request.getParameter("Location").isEmpty()){
			return false;
		}
		return true;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(false){
			request.getRequestDispatcher("restaurant-register.jsp").forward(request, response);
		}else{
			Restaurant res = new Restaurant();
			res.setName(request.getParameter("Name"));
			res.setGoogle(request.getParameter("GoogleAddress"));
			res.setZip(request.getParameter("Zipcode"));
			res.setCategory(Integer.parseInt(request.getParameter("Category")));
			res.setLocation(request.getParameter("Location"));
			res.setPhone(request.getParameter("Phone"));
			res.setAddress(request.getParameter("Address"));
			DBQuery db = new DBQuery();
			int lastid = 0;
			try {
				User user = (User)request.getSession().getAttribute("user");
				//db.getUser(user.getMail(), user.getPassword());
				lastid = db.AddRestauratns(res, user.getID());
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("lastid", lastid);
			System.out.println(lastid);
			request.getRequestDispatcher("AddMenu.jsp").forward(request, response);
		}
	}
}
