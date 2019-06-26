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
			prop.load(new FileInputStream("F:/IT/JAVA/workspace/FBI_HOHO/DBINFO.properties"));
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
						return 1;//
					}
					else {
						return 0;//
					}
				}
				return -1;//���̵� ���°��
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -2;//��񿬰� ����
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
				rsint = pstmt.executeUpdate();
				if(rsint>0) {
					return 1;//�������� �� 1
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

			String sql = "insert into userinfo("+arrtsql+")\r\n" + 
					"values(?,?,?,?,?)";

			try {
				pstmt = conn.prepareStatement(sql);				
				for(int i=0;i<userinfo.length;i++) { 
				pstmt.setString(i+1,userinfo[i]); 
				}
				 
				 
				rsint = pstmt.executeUpdate();
				if(rsint>0) {
					return 1;//�������� �� 1
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return 0;
	}
	public int insert_building_info(String[] buildingInfo) {

		
		
		int rsint = 0;
		String sql = "insert into building values(?,?,?,null,null,?,?,?,?,null,null,'N',?)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, buildingInfo[0]);
			pstmt.setString(2, buildingInfo[1]);
			pstmt.setString(3, buildingInfo[2]);
			pstmt.setString(4, buildingInfo[3]);
			pstmt.setInt(5, Integer.parseInt(buildingInfo[4]));
			pstmt.setInt(6, Integer.parseInt(buildingInfo[5]));
			pstmt.setInt(7, Integer.parseInt(buildingInfo[6]));
			pstmt.setString(8, buildingInfo[7]);
			rsint = pstmt.executeUpdate();
			if(rsint > 0) {
				return 1;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return 0;
	}
	
public String marketResult(String address){//리턴값 알맞게 변경하기
		
		String sql = "select count(*) from marketResearch where trdar_cd_nm = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println(rs.getString(1));
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return null;
	}
public String getAddress(String bdId) {
	String address = "";
	String sql = "select address from building where bdid=?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			address = rs.getString(1);
		}
	}
	catch(Exception e) {
		System.out.println(e.getMessage());
	}	
	return address;
}
//public String[] getPosition
















}
