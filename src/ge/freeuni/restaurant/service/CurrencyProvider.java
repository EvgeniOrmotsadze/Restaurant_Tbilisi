package ge.freeuni.restaurant.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class CurrencyProvider {
	private static double usd, eur, rub = 1;
	private static String usdName = "აშშ დოლარი";
	private static String eurName = "ევრო";
	private static String rubName = "რუსული რუბლი";

	public static double getEurToGel() {
		return eur;
	}

	public static double getUsdToGel() {
		return usd;
	}

	public static double getGelToUsd() {
		return 1 / usd;
	}

	public static double getGelToEur() {
		return 1 / eur;
	}

	public static double getGelToRub() {
		return rub;
	}

	public static Double getRubToGel() {
		return 1 / rub;
	}

	// currency updater method
	// is called in every 1000 seconds
	public static void updateCurrencies() throws MalformedURLException {
		StringBuilder builder = new StringBuilder();
		try {
			InputStream inputStream = new URL("http://www.nbg.ge/rss.php")
					.openStream();
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(inputStream));
			String line = bufferedReader.readLine();
			while (line != null) {
				builder.append(line);
				line = bufferedReader.readLine();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		usd = ParseCurrency(builder.toString(), usdName);
		eur = ParseCurrency(builder.toString(), eurName);
		rub = ParseCurrency(builder.toString(), rubName);
		System.out.println("usd: " + usd);

	}

	// parsing currency from nbg.gov.ge's rss.php file
	private static double ParseCurrency(String result, String currencyName) {
		// TODO Auto-generated method stub
		int indexOfLastTag = result.indexOf(currencyName);
		if (indexOfLastTag == -1) {
			System.out.println("can't get currency course");
			return 1;
		}
		int indexOfCourse = result.indexOf("<td>", indexOfLastTag) + 4;
		return Double.parseDouble(result
				.substring(indexOfCourse, indexOfCourse) + 6);

	}
}
