package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getDateTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	
	public static String getDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
}
