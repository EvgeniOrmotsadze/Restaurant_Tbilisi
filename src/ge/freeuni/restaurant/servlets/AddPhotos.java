package ge.freeuni.restaurant.servlets;

import ge.freeuni.restaurant.model.Restaurant;

import java.util.List;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AddPhotos
 */
@WebServlet("/AddPhotos")
public class AddPhotos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPhotos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Restaurant restaurant = new Restaurant();
		DiskFileItemFactory factory = new DiskFileItemFactory(200000, new File(
				"/home/dato/Documents"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> iter = items.iterator();
			int photoId = 1;
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (!item.isFormField()) {
					if (!item.getName().isEmpty() && item.getSize() <= 200000) {
						byte[] byteRepresentation = item.get();
						// to do byteRepresentation must be saved to disk
						switch(photoId){
		            	case 1: restaurant.setPhoto1Address("/home/dato/Documents/"+item.getName());
		            			photoId++;
		            		    break;
		            	case 2: restaurant.setPhoto2Address("/home/dato/Documents/"+item.getName());
		            			photoId++;
            		    		break;
		            	case 3: restaurant.setPhoto3Address("/home/dato/Documents/"+item.getName());
		            			photoId++;
		            			break;
		            	case 4: restaurant.setPhoto4Address("/home/dato/Documents/"+item.getName());
		            			photoId++;
		            			break;
		            	case 5: restaurant.setPhoto5Address("/home/dato/Documents/"+item.getName());
				            	photoId++;		
				            	break;
		            	case 6: restaurant.setPhoto6Address("/home/dato/Documents/"+item.getName());
			            	photoId++;		
			            	break;
		            	}
					}
				}
			}

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
