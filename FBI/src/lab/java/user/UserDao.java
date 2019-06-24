package lab.java.user;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class UserDao {
	Properties prop = new Properties();
	Connection conn=null;
	Statement stmt=null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	int rsint;
	

	public UserDao(){
		try {
			prop.load(new FileInputStream("F:/IT/JAVA/workspace/FBI/DBINFO.properties"));
			Class.forName(prop.getProperty("driver"));
			conn=DriverManager.getConnection(
			prop.getProperty("url"),
			prop.getProperty("user"),
			prop.getProperty("pwd"));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String userid,String userpass) {
			String sql = "select * from userInfo where userid=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString("userpass").equals(userpass)) {
						return 1;//비밀번호가 맞는경우
					}
					else {
						return 0;//아아디는 있는데 비밀번호가 틀린경우
					}
				}
				return -1;//아이디도 없는경우
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -2;//디비연결 실패
	}
	public int join(int selected,String[] attribute,String[] userinfo) {
		rsint=0;
		String arrtsql ="";
		if(selected==1) {
			
			for(int i = 0;i<attribute.length;i++) {
				arrtsql+=attribute[i];
				if(i!=attribute.length-1) {
					arrtsql+=",";
				}
			}
			System.out.println(arrtsql);
			
			String sql = "insert into userinfo("+arrtsql+")\n"
					+ "values(?,?,?,?,?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(sql);				
				
				  for(int i=0;i<userinfo.length;i++) { 
					  if(attribute[i].equals("foundMoney")) {
						  pstmt.setInt(i+1,Integer.parseInt(userinfo[i])); } 
					  else {
						  pstmt.setString(i+1,userinfo[i]); }
				  
				  }
				 
				/*
				 * pstmt.setString(1, userinfo[0]); pstmt.setString(2, userinfo[1]);
				 * pstmt.setString(3, userinfo[2]); pstmt.setString(4, userinfo[3]);
				 * pstmt.setString(5, userinfo[4]);
				 * pstmt.setInt(6,Integer.parseInt(userinfo[5])); pstmt.setString(7,
				 * userinfo[6]); pstmt.setString(8, userinfo[7]);
				 */
				 
				 
				rsint = pstmt.executeUpdate();
				if(rsint>0) {
					return 1;//성공했을 때 1
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if(selected==2) {
			rsint=0;
			for(int i = 0;i<attribute.length;i++) {
				arrtsql+=attribute[i];
				if(i!=attribute.length-1) {
					arrtsql+=",";
				}
			}
			
			//String sql = "insert into userinfo(username,userid,userpass,usernum,concernList)\r\n" + 
			//		"values(?,?,?,?,?)";
			String sql = "insert into userinfo("+arrtsql+")\r\n" + 
					"values(?,?,?,?,?)";
			
			
			
			try {
				pstmt = conn.prepareStatement(sql);				
				for(int i=0;i<userinfo.length;i++) { 
				pstmt.setString(i+1,userinfo[i]); 
				}
				 
				 
				rsint = pstmt.executeUpdate();
				if(rsint>0) {
					return 1;//성공했을 때 1
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return 0;
	}
}
