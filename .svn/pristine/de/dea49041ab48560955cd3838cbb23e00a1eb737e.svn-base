/**
 * 
 */
package com.brsc.ecommerceSys.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.driver.OracleDriver;
/**
 * @author wanlong
 *
 */
public class DBUtils {
	
	public static final String CONN_URL="jdbc:oracle:thin:@192.168.0.103:8888:mycat";
	public static final String USERNAME="wanlong";
	public static final String PWD="12345";
	
	public static Connection getConnection(){
		Connection conn=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(CONN_URL, USERNAME, PWD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void releaseRes(Connection conn,PreparedStatement pstmt,ResultSet reSet){
		try {
			if (reSet != null)
				reSet.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
