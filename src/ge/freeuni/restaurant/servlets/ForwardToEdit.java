package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.model.Restaurant;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForwardToEdit
 */
@WebServlet("/ForwardToEdit")
public class ForwardToEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForwardToEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("value"));
		Restaurant res = new Restaurant();
		DBQuery query = new DBQuery();
		try {
			res = query.getCurrentRestaurant(id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("editRes", res);
		RequestDispatcher dispatcher = request.getRequestDispatcher("EditRestaurant.jsp");
		dispatcher.forward(request, response);
	}

}