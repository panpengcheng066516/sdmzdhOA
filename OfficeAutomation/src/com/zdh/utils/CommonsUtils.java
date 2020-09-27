package com.zdh.utils;

import javax.xml.crypto.Data;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class CommonsUtils {

	//生成uuid方法
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}

	//得到当前月
	public static String getCurrentYear(){
		Calendar date = Calendar.getInstance();
		String year = String.valueOf(date.get(Calendar.YEAR));
		return year;
	}

	//得到当前月
	public static String getCurrentMonth(){
		Calendar date = Calendar.getInstance();
		String month = String.valueOf(date.get(Calendar.MONTH)+1);
		return month;
	}
	
}
