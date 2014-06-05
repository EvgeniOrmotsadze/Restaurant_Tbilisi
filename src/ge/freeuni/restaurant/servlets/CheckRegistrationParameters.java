package ge.freeuni.restaurant.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CheckRegistrationParameters
 */
@WebServlet("/CheckRegistrationParameters")
public class CheckRegistrationParameters extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckRegistrationParameters() {
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
	
		HttpSession session = request.getSession();
		session.setAttribute("firstName", request.getAttribute("firstName"));
		session.setAttribute("lastName", request.getAttribute("lastName"));
		session.setAttribute("companyName", request.getAttribute("companyName"));
		session.setAttribute("email", request.getAttribute("email"));
		session.setAttribute("password", request.getAttribute("password"));
		
		request.getRequestDispatcher("verifyByEmail.jsp").forward(request,response);
		
	}

}
