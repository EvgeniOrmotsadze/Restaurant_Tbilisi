package ge.freeuni.restaurant.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

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
	// is called periodically
	public static void updateCurrencies() throws MalformedURLException {
		Document document = null;
		try {
			document = Jsoup.connect("http://www.nbg.ge/rss.php").get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		usd = ParseCurrency(document.toString(), usdName);
		eur = ParseCurrency(document.toString(), eurName);
		rub = ParseCurrency(document.toString(), rubName);
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
