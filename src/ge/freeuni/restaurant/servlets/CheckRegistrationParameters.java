package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.service.MessageSender;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

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
		//check user data on server
		boolean validation = false;
		
		if(request.getParameter("firstName").isEmpty() || request.getParameter("lastName").isEmpty()){
			validation = true;
		}
		
		String emailreg = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
		if(!request.getParameter("email").matches(emailreg)){
			validation = true;
		}
		
		if(request.getParameter("password").length() < 6){
			validation = true;
		}
		if(!request.getParameter("password").equals(request.getParameter("repassword"))){
			validation = true;
		}
		
		DBQuery query = new DBQuery();
		boolean ifExist = true;
		try {
			ifExist = query.ifExistUser(request.getParameter("email"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(ifExist){
			validation = true;
			String msg =  "áƒ�áƒ áƒœáƒ˜áƒ¨áƒœáƒ£áƒšáƒ˜ Email áƒ’áƒ�áƒ›áƒ�áƒ§áƒ”áƒœáƒ”áƒ‘áƒ£áƒšáƒ˜áƒ�, áƒ’áƒ—áƒ®áƒ�áƒ•áƒ— áƒ›áƒ˜áƒ£áƒ—áƒ˜áƒ—áƒ�áƒ“ áƒ¡áƒ®áƒ•áƒ� Email ";
			request.setAttribute("isExist", msg);
		}
		if(validation){
			request.getRequestDispatcher("user-register.jsp").forward(request, response);
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("firstName", request.getParameter("firstName"));
			session.setAttribute("lastName", request.getParameter("lastName"));
			session.setAttribute("email", request.getParameter("email"));
			session.setAttribute("phone", request.getParameter("phone"));
			session.setAttribute("password", request.getParameter("password"));
			
			Random r = new Random( System.currentTimeMillis() );
			String code = ""+10000 + r.nextInt(20000);
			request.getSession().setAttribute("code", code);
			MessageSender.sendMsg(request.getParameter("email"),code,"restaurantoftbilisi@gmail.com","evgeni1221");
			request.getRequestDispatcher("verifyByEmail.jsp").forward(request,response);
		}
	}
}
