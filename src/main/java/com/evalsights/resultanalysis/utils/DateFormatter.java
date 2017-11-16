package com.evalsights.resultanalysis.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class DateFormatter {
	private static Logger logger = LogManager.getFormatterLogger(DateFormatter.class);
	
	private static SimpleDateFormat dtFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	/**
	 * Transform string to date.
	 *
	 * @param dateAsString the date as string
	 * @return the date
	 */
	public static Date transformStringToDate(String dateAsString) {
		try {
			return dtFormatter.parse(dateAsString);
		} catch (ParseException e) {
			logger.error("Could not parse and transform dateString to Date Object: {}", e);
			return null;
		}
	}
	
}
