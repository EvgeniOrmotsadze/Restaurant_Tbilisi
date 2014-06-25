package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.model.Restaurant;

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
 * Servlet implementation class SearchByCategory
 */
@WebServlet("/SearchByCategory")
public class SearchByCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByCategory() {
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
		//restoranis dzebna categoriis mixedvit
				int category = Integer.parseInt(request.getParameter("category"));
				DBQuery db = new DBQuery();
				ArrayList<Restaurant> res = new ArrayList<Restaurant>();
				try {
					res = db.SearchRestaurantsByCategory(category);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				
				request.setAttribute("SearchResult", res);
				RequestDispatcher dispatcher = request.getRequestDispatcher("searchRes.jsp");
				dispatcher.forward(request, response);
	}

}
