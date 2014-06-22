package ge.freeuni.restaurant.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;

public class AddressToCoordinates {

	private static final String URL = "http://maps.googleapis.com/maps/api/geocode/json";

	/*
	 * Here the fullAddress String is in format like
	 * "address,city,state,zipcode". Here address means "street number + route"
	 * .
	 */ 
	public static String fullAddress="45 Shota Rustaveli Street Tbilisi 0108, Georgia";
	public GoogleResponse convertToLatLong(String fullAddress)
			throws IOException {
		URL url = new URL(URL + "?address="
				+ URLEncoder.encode(fullAddress, "UTF-8") + "&sensor=false");
		URLConnection conn = url.openConnection();

		InputStream in = conn.getInputStream();
		ObjectMapper mapper = new ObjectMapper();
		GoogleResponse response = (GoogleResponse) mapper.readValue(in,
				GoogleResponse.class);
		in.close();
		return response;

	}

	public GoogleResponse convertFromLatLong(String latlongString)
			throws IOException {

		URL url = new URL(URL + "?latlng="
				+ URLEncoder.encode(latlongString, "UTF-8") + "&sensor=false");
		URLConnection conn = url.openConnection();

		InputStream in = conn.getInputStream();
		ObjectMapper mapper = new ObjectMapper();
		GoogleResponse response = (GoogleResponse) mapper.readValue(in,
				GoogleResponse.class);
		in.close();
		return response;

	}
	
	public String returnLat(String fullAddress) throws IOException{
		String lat="";
		GoogleResponse res = new AddressToCoordinates()
		.convertToLatLong(fullAddress);
		if (res.getStatus().equals("OK")) {
			for (Result result : res.getResults()) {
				
				lat= result.getGeometry().getLocation().getLat();
			}
		} else {
			System.out.println(res.getStatus());
		}
		return lat;

}
	public String returnLng(String fullAddress) throws IOException{
		String lng="";
		GoogleResponse res = new AddressToCoordinates()
		.convertToLatLong(fullAddress);
		if (res.getStatus().equals("OK")) {
			for (Result result : res.getResults()) {
				
				lng= result.getGeometry().getLocation().getLng();
			}
		} else {
			System.out.println(res.getStatus());
		}
		return lng;

}
	
	

/**	public static void main(String[] args) throws IOException {

		GoogleResponse res = new AddressToCoordinates()
				.convertToLatLong(fullAddress);
		if (res.getStatus().equals("OK")) {
			for (Result result : res.getResults()) {
				System.out.println("Lattitude of address is :"
						+ result.getGeometry().getLocation().getLat());
				System.out.println("Longitude of address is :"
						+ result.getGeometry().getLocation().getLng());
			}
		} else {
			System.out.println(res.getStatus());
		}

	}*/

}
