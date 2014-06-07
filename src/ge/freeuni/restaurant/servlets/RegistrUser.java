package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.model.User;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrUser
 */
@WebServlet("/RegistrUser")
public class RegistrUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrUser() {
        super();
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
		if(!request.getParameter("code").equals(request.getSession().getAttribute("code"))){
			request.getRequestDispatcher("illegalRegistr.jsp").forward(request, response);
		}else{
			User user = new User();
			user.setName((String) request.getSession().getAttribute("firstName"));
			user.setLastName((String) request.getSession().getAttribute("lastName"));
			user.setMail((String) request.getSession().getAttribute("email"));
			user.setPassword((String)request.getSession().getAttribute("password"));
			user.setPhone((String)request.getSession().getAttribute("phone"));
			
			DBQuery query = new DBQuery();
			try {
				query.AddUser(user);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("user-login.jsp").forward(request, response);
		}
	}

}
