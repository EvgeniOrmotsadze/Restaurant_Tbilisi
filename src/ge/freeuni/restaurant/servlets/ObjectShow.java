package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.model.Menu;
import ge.freeuni.restaurant.model.Picture;
import ge.freeuni.restaurant.model.Restaurant;
import ge.freeuni.restaurant.model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ObjectShow
 */
@WebServlet("/ObjectShow")
public class ObjectShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObjectShow() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		DBQuery query = new DBQuery();
		Restaurant res = new Restaurant();
		try {
		res = query.getCurrentRestaurant(id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		User user = (User) request.getSession().getAttribute("user");
		int user_id = 0;
		if(user != null) user_id = user.getID();
		
		boolean exist = false;
		if(user_id != 0){
			try {
				exist = query.ifAlreadyAssessment(id, user_id);
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		ArrayList<Menu> menu = new ArrayList<Menu>();
		try {
			menu = query.takeMenuByRestaurant(res.getID());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		ArrayList<Picture> pic = new ArrayList<Picture>();
		try {
			pic = query.takePictureByRestaurant(res.getID());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("pictures", pic);
		request.setAttribute("menu", menu);
		request.setAttribute("myobject", res);
		if(exist) request.setAttribute("alreadyAss", 1);
		RequestDispatcher dispatcher = request.getRequestDispatcher("object-page.jsp");
		dispatcher.forward(request, response);
	}

}
