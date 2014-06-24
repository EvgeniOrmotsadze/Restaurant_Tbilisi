package ge.freeuni.restaurant.weather.model;

import ge.freeuni.restaurant.weather.util.DateUtils;

import java.util.Date;

import org.w3c.dom.Element;


public class Astronomy {

	Date sunrise;
	Date sunset;

	public Date getSunrise() {
		return sunrise;
	}

	public void setSunrise(Date sunrise) {
		this.sunrise = sunrise;
	}

	public Date getSunset() {
		return sunset;
	}

	public void setSunset(Date sunset) {
		this.sunset = sunset;
	}

	public Astronomy(Element element) {
		parseData(element);
	}

	private void parseData(Element elem) {
		sunrise = DateUtils.parseCondDate(elem.getAttribute("sunrise"));
		sunset = DateUtils.parseCondDate(elem.getAttribute("sunset"));
	}

	@Override
	public String toString() {
		return "Astronomy [sunrise=" + sunrise + ", sunset=" + sunset + "]";
	}

}
