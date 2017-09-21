package com.brsc.ecommerceSys.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 日期附加时分秒并格式化输出(java.util.Date类型无法直接输出时分秒,需借助java.sql.Timestamp类获取)
 * @author Administrator
 *
 */
public class DateAddTime {
	
	public static String toTimeString(Date date){
		
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//HH:24小时制,hh:12小时制  
        String newTimeString = sdformat.format(new java.sql.Timestamp(date.getTime()));//带时分秒

        return newTimeString;
	}

}
