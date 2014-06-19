package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.model.User;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MakeAssessments
 */
@WebServlet("/MakeAssessments")
public class MakeAssessments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeAssessments() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("user") == null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("user-login.jsp");
			dispatcher.forward(request, response);
		}else{
			User user = (User) request.getSession().getAttribute("user");
			int user_id = user.getID();
			int res_id = Integer.parseInt(request.getParameter("res_id"));
			int star = Integer.parseInt(request.getParameter("star"));
			DBQuery db = new DBQuery();
			boolean exist = false;
			try {
				exist = db.ifAlreadyAssessment(res_id, user_id);
				System.out.print(exist);
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			try {
				db.makeAssessment(user_id, res_id, star);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
