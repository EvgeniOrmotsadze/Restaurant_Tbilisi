package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.controllers.DBQuery;
import ge.freeuni.restaurant.controllers.PhotoUpload;
import ge.freeuni.restaurant.controllers.UpdateDeleteQuery;
import ge.freeuni.restaurant.model.Restaurant;
import ge.freeuni.restaurant.service.AddressToCoordinates;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EditRestaurants
 */
@WebServlet("/EditRestaurants")
@MultipartConfig
public class EditRestaurants extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRestaurants() {
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
		
		for (Part part : request.getParts()) {
        	if (!part.getName().equals("images[]"))
        		continue;
        	InputStream is = part.getInputStream();
        	PhotoUpload photo = new PhotoUpload();
        	System.out.println("dsdsd");
        	try {
				photo.AddPhotos(is, Integer.parseInt((String) request.getParameter("resID")));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
		
		Restaurant res = new Restaurant();
		res.setID(Integer.parseInt(request.getParameter("resID")));
		res.setName(request.getParameter("Name"));
		res.setGoogle(request.getParameter("GoogleAddress"));
		res.setZip(request.getParameter("Zipcode"));
		res.setCategoryID(Integer.parseInt(request.getParameter("Category")));
		res.setPhone(request.getParameter("Phone"));
		res.setAddress(request.getParameter("Address"));
		String google = request.getParameter("GoogleAddress")+ request.getParameter("Zipcode")+", Georgia";  
		AddressToCoordinates gg = new AddressToCoordinates();
		res.setLac(gg.returnLat(google));
		res.setLng(gg.returnLng(google));
		res.setAdditionalInfo(request.getParameter("Additional_info"));
		res.setCuisineID(Integer.parseInt(request.getParameter("Cuisine")));
		UpdateDeleteQuery query = new UpdateDeleteQuery();
		
		try {
			query.UpdateRestaurant(res);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("MyPage");
		dispatcher.forward(request, response);
		
		
	}

}
