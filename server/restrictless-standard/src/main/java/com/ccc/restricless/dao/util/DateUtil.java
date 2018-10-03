package com.ccc.restricless.dao.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {
    public static String nowDate() {
    	return nowDate(null);
    }
    public static String nowDate(Date fromDate)
           // throws Exception // Just for simplicity!
        {
    		if(fromDate==null)fromDate=new Date();
            DateFormat formatter = new SimpleDateFormat
                ("EEE MMM dd HH:mm:ss zzz yyyy");
            TimeZone central = TimeZone.getTimeZone("America/New_York");
            formatter.setTimeZone(central);
            return(formatter.format(fromDate));
        }


}
