package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
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
 * Servlet implementation class MyPage
 */
@WebServlet("/MyPage")
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		

		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("user-login.jsp");
			dispatcher.forward(request, response);
		} else {
			DBQuery db = new DBQuery();
			ArrayList<Restaurant> res = new ArrayList<Restaurant>();
			try {
				res = db.getMyRestaurants(user.getID());
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("MyRestaurants", res);
			RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
			dispatcher.forward(request, response);
		}

	}

	// returning page number
	private String getPageNumber(HttpServletRequest request) {
		if (request.getParameter("pageNumber").equals(null))
			return "1";
		return Integer.toString(Integer.parseInt(request
				.getParameter("pageNumber")) + 1);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
