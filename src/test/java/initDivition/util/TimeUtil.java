package initDivition.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	
	public static String getTheDateOfToday(String format){
		Date date =new Date();
		SimpleDateFormat sdf =new SimpleDateFormat(format);
		String today = sdf.format(date);
		return today;
	}
	public static void main(String[] args) {
		System.out.println(getTheDateOfToday("yyyy-MM-dd HH:mm:ss"));
	}
}
