package lab.java.user;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class InsertBuilding {

	public static void main(String[] args) throws SQLException, IOException, ClassNotFoundException {
		// TODO Auto-generated method stub
		
		Properties prop = new Properties();
		Connection conn=null;
		Statement stmt=null;
		PreparedStatement pstmt = null;
		ResultSet rs;

		try {
			prop.load(new FileInputStream("C:/Users/김민지/eclipse-workspace/FBI_HOHO/DBINFO.properties"));
			Class.forName(prop.getProperty("driver"));
			System.out.println("드라이버연결");
			conn=DriverManager.getConnection(
			prop.getProperty("url"),
			prop.getProperty("user"),
			prop.getProperty("pwd"));
			System.out.println("연결성공");
			String sql = "INSERT INTO BUILDING VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'전망좋은집','전망좋은집','전망좋은집','선호업종의 투표결과 냠냠')";
			pstmt = conn.prepareStatement(sql);
			
			
			for(int i=0; i<9;i++) {
				
			String bdid="KBM00370"+Integer.toString(i);
			String userid="ruru_"+Integer.toString(i);
			String src="http://naver.com/"+Integer.toString(i);
			
			pstmt.setString(1, bdid); //bdid
			pstmt.setDouble(2, 127.075485899913); //
			pstmt.setDouble(3, 37.49465833847708);
			//pstmt.setDate(4, java.sql.Date.valueOf("19/07/01"));
			//pstmt.setDate(5, java.sql.Date.valueOf("19/07/31"));
			pstmt.setString(4, "19/07/01");//*
			pstmt.setString(5, "19/07/31");//*
			pstmt.setString(6, "서울특별시 서초구 서초동");
			pstmt.setInt(7, 3000000);
			pstmt.setInt(8,  10000000);
			pstmt.setInt(9, 5000000);
			pstmt.setString(10, userid);
			pstmt.setString(11, "hotel");
			pstmt.setString(12, "Y");
			pstmt.setString(13, src);
			pstmt.setString(14, "전망좋은집");
			pstmt.setInt(15, 1000000);
			pstmt.setInt(16, 32000000);
		
			pstmt.addBatch();
			pstmt.executeBatch();
			}
					
			conn.commit();
			System.out.println("insert 성공");
			 
			

	}catch(IllegalArgumentException e) {
	    System.out.println("Caught an IllegalArgumentException..." + e.getMessage());
	}catch(ClassNotFoundException e) {
		System.out.println("driver없음");
	}catch(SQLException e) {
		System.out.println(e.getMessage());
	}catch(IOException e) {
		System.out.println(e.getMessage());
	}	finally {
		try {			 
			if(pstmt!=null) pstmt.close();
			if (conn!=null) conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
}
