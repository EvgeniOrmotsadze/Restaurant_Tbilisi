package ge.freeuni.restaurant.weather.test;

import ge.freeuni.restaurant.weather.YWeather;
import ge.freeuni.restaurant.weather.model.Units;
import ge.freeuni.restaurant.weather.model.WeatherInfo;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		YWeather weather = new YWeather();
		WeatherInfo info = weather.getWeatherForWOEID("2442047", Units.TEMP_C);
		System.err.println(info.getItem().getForecastOne().getDay());
		info = weather.getWeatherForPlace("Lile", Units.TEMP_C);
		System.err.println(info.getItem().getForecastOne().getDay());
		System.out.println(info.getItem().getCondtition().getIconUrl());

	}

}
