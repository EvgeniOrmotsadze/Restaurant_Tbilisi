package ge.freeuni.restaurant.controllers;

import java.util.HashMap;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ContextListener
 *
 */
@WebListener
public class ContextListener implements ServletContextListener, ServletRequestAttributeListener {

    /**
     * Default constructor. 
     */
    public ContextListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestAttributeListener#attributeRemoved(ServletRequestAttributeEvent)
     */
    public void attributeRemoved(ServletRequestAttributeEvent arg0) {
        // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }

	/**
     * @see ServletRequestAttributeListener#attributeAdded(ServletRequestAttributeEvent)
     */
    public void attributeAdded(ServletRequestAttributeEvent arg0) {
        // TODO Auto-generated method stub
    }

	/**
     * @see ServletRequestAttributeListener#attributeReplaced(ServletRequestAttributeEvent)
     */
    public void attributeReplaced(ServletRequestAttributeEvent arg0) {
        // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
    	HashMap<Integer, String> typeMap = new HashMap<Integer, String>();
		HashMap<Integer, String> locationMap = new HashMap<Integer, String>();
		
		typeMap.put(1, "რესტორანი");
		typeMap.put(2, "ბარი");
		typeMap.put(3, "კაფე");
		typeMap.put(4, "სწრაფი კვება");
		typeMap.put(5, "პაბი");
		typeMap.put(6, "კლუბი");
		
		locationMap.put(1, "საბურთალო");
		locationMap.put(2, "ვაკე");
		locationMap.put(3, "მთაწმინდა");
		locationMap.put(4, "დიდუბე");
		locationMap.put(5, "ვარკეთილი");
		locationMap.put(6, "ზაჰესი");
		
		
		
		arg0.getServletContext().setAttribute("TypeMap", typeMap);
		arg0.getServletContext().setAttribute("LocationMap", locationMap);
    }
	
}
