package lab.java.user;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
<<<<<<< HEAD
=======

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
>>>>>>> fbi/fbi_bonobono

public class UserDao {
	Properties prop = new Properties();
	Connection conn=null;
	Statement stmt=null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	int rsint;
	

	public UserDao(){
		try {
			prop.load(new FileInputStream("C:/Users/Q3/HKT/hackathon/FBI_HOHO/DBINFO.properties"));
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
						return 1;
					}
					else {
						return 0;
					}
				}
				return -1;
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -2;
	}
	public int join(int selected,String[] attribute,String[] userinfo) {
		rsint=0;
		String arrtsql ="";
		if(selected==1) {//창업자
			for(int i = 0;i<attribute.length;i++) {
				arrtsql+=attribute[i];
				if(i!=attribute.length-1) {
					arrtsql+=",";
				}
			}
			String sql = "insert into userinfo("+arrtsql+",founderYN) values(?,?,?,?,?,?,?,?,'Y')";
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

			String sql = "insert into userinfo("+arrtsql+",founderYN)\r\n" + 
					"values(?,?,?,?,?,'N')";

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
		String sql = "insert into building values(?,?,?,null,null,?,?,?,?,null,null,'N',?,?)";
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
			pstmt.setString(9, buildingInfo[8]);
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
	
<<<<<<< HEAD
public String marketResult(String address){//由ы꽩媛� �븣留욊쾶 蹂�寃쏀븯湲�
		String add = null;
=======
public String marketResult(String address){//리턴값 알맞게 변경하기
		
>>>>>>> fbi/fbi_bonobono
		String sql = "select count(*) from marketResearch where trdar_cd_nm = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				add = rs.getString(1);
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return add;
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

<<<<<<< HEAD
	public String getY(String bdId) { //Y좌표 가져오기
	   String y="";
	   String sql = "select location_y from building where bdid=?";
	   try {
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, bdId);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         y = rs.getString(1);
	      }
	   }
	   catch(Exception e) {
	      System.out.println(e.getMessage());
	   }
	   return y;
	}
	
// 원호형 코드 start
	
	public String getAdd(String bdid) {
		String add;
		addChange change = new addChange();
		
		
		add = getAddress(bdid);
		add = change.changeAdd(add);
		

		return add;
	}
	
	public HashMap<Integer,HashMap<String,String>> getXY() {
		   
		   HashMap<Integer,HashMap<String,String>> map = new HashMap<Integer,HashMap<String,String>>();
		   HashMap<String,String> result = new HashMap<String,String>();
		   
		   String sql1 = "select * from building where fundingYN = 'Y'";
		   String sql2 = "select * from building where fundingYN = 'N'";
		   
		   try {
		      
		      stmt = conn.createStatement();
		      rs = stmt.executeQuery(sql1);
		      ResultSetMetaData rsmt= rs.getMetaData();
		      int number = 1 ;
		      while(rs.next()) {
		         
		         for(int i = 0;i<rsmt.getColumnCount();i++) {
		            result.put(rsmt.getColumnName(i+1),rs.getString(rsmt.getColumnName(i+1)));
		         }
		               
		         map.put(number,(HashMap<String, String>) result.clone());
		                  
		         number++;
		         if(number==4) {
		            break;
		         }
		      }
		      
		      stmt = conn.createStatement();
		      rs = stmt.executeQuery(sql2);
		      while(rs.next()) {
		         
		         for(int p = 0;p<rsmt.getColumnCount();p++) {
		            result.put(rsmt.getColumnName(p+1),rs.getString(rsmt.getColumnName(p+1)));
		         
		         }
		         map.put(number, (HashMap<String, String>) result.clone());
		         number++;
		         
		         if(number==7) {
		            break;
		         }
		      }
		   }
		   catch (Exception e) {
		      System.out.println(e.getMessage());
		   }
		   return map;
		   }

	public HashMap<String, Integer> getCategory(String bdid) {
	      
	      HashMap<String,Integer> list = new HashMap<String, Integer>();

	      
	      try {
	         
	      String dessert_sql = "select * from dessert where buildnum = ?";
	      pstmt = conn.prepareStatement(dessert_sql);
	      pstmt.setString(1, bdid);
	      rs = pstmt.executeQuery();
	      ResultSetMetaData rsmt= rs.getMetaData();
	      

	      if(rs.next()) {
	            
	         for(int i = 2;i<rsmt.getColumnCount();i++) {
	         list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
	         }}
	      
	      String westernfood_sql="select * from westernfood where buildnum =?";
	      pstmt =conn.prepareStatement(westernfood_sql);
	      
	      pstmt.setString(1, bdid);
	      rs = pstmt.executeQuery();
	      rsmt= rs.getMetaData();
	      
	      if(rs.next()) {
	         
	         for(int i = 2;i<rsmt.getColumnCount();i++) {
	         list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
	         }
	         }
	          
	          

	      String store_sql="select * from store where buildnum = ?";
	      pstmt =   conn.prepareStatement(store_sql);

	      pstmt.setString(1, bdid);
	      rs = pstmt.executeQuery();
	      rsmt= rs.getMetaData();
	      
	      if(rs.next()) {
	         
	         for(int i = 2;i<rsmt.getColumnCount();i++) {
	         list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
	         }
	      }
	       
	      String entertaiment_sql="select * from entertaiment where buildnum = ?";
	      pstmt = conn.prepareStatement(entertaiment_sql);
	      
	      pstmt.setString(1, bdid);
	      rs = pstmt.executeQuery();
	      rsmt= rs.getMetaData();
	      
	      if(rs.next()) {
	         
	         for(int i = 2;i<rsmt.getColumnCount();i++) {
	         list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
	         }
	         }
	          
	      String lodgment_sql ="select * from lodgment where buildnum=?"; 
	      pstmt =conn.prepareStatement(lodgment_sql);
	      
	      pstmt.setString(1, bdid);
	      rs = pstmt.executeQuery();
	      rsmt= rs.getMetaData();
	      
	      if(rs.next()) {
	         
	         for(int i = 2;i<rsmt.getColumnCount();i++) {
	         list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
	         }
	         }
	         
	      }
	      catch(Exception e) {
	         System.out.println(e.getMessage());
	      }
	      

	      return list;

	   }
	   
	public HashMap<Integer,String> vote(HashMap<String,Integer> list){
	      

	      double sum = 0;
	      int tmp = 0;
	      int i = 0;
	      
	      
	      Set<String> keyset = list.keySet();
	      int sort[]=new int[keyset.size()];
	      

	       for(String pp : keyset) { 
	             sum += list.get(pp);
	             sort[i] = list.get(pp);
	             i++;
	       }
	      

	       for(i = 0;i<sort.length;i++) {
	          for(int j= 0;j<sort.length-1;j++) {
	             if(sort[j]<sort[j+1]) {
	                tmp = sort[j+1];
	                sort[j+1] = sort[j];
	                sort[j] = tmp;
	             }
	          }
	       }

	       String first[] = new String[5];
	       
	       for(i = 0;i<5;i++) {
	          
	         for(String pp:keyset) {
	            if(sort[i]==list.get(pp)) {
	               first[i]=pp;
	            }
	         }
	       }
	       int firstV[] = new int[5];
	       
	       for(i=0;i<5;i++) {
	          firstV[i] = (int)((list.get(first[i])/sum)*100);
	       }
	       HashMap<Integer,String> listMap = new HashMap<Integer,String>();
	      
	       for(i = 1;i<=5;i++) {
	         listMap.put(i*2,firstV[i-1]+"");
	         listMap.put((i*2)-1,first[i-1]);
	      }
	       return listMap;
	   }
	
	
		   
		   
		   
		   // 원호형코드 end 
		   
		   
	public int getBuildingNum() {
		String sql = "select count(*) from building";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return 0;
	}

	public String getBuildingPic(String buu) {
		String src ="";
		String sql = "select src from building where bdid=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				src = rs.getString(1);
				}
			
		}
		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return src;
	}

	
	public double getStarAct(String buu) {
		double act = 0;
		//String sql = "select ACTVTY_IDX_VALUE from MARKETRESEARCH where MARKET_IDX=?";
		String sql = "select avg(decode(ACTVTY_IDX_VALUE,'null',NULL,ACTVTY_IDX_VALUE))from MARKETRESEARCH where TRDAR_CD_NM like ?";
		if(buu!=null) {
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu+"%");
			rs = pstmt.executeQuery();		
			if(rs.next()) {
				act = Double.parseDouble(rs.getString(1));
			}			
		}		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
	}
		return act;
	}
	
	public double getStarStb(String buu) {
		double act = 0;
		String sql = "select avg(decode(STABLE_IDX_VALUE,'null',NULL,STABLE_IDX_VALUE))from MARKETRESEARCH where TRDAR_CD_NM like ?";
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu+"%");
			rs = pstmt.executeQuery();		
			if(rs.next()) {			
				act = Double.parseDouble(rs.getString(1));
			}			
		}		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return act;
	}
	
	public double getStarGrw(String buu) {
		double act = 0;
		String sql = "select avg(decode(GROWTH_IDX_VALUE,'null',NULL,GROWTH_IDX_VALUE))from MARKETRESEARCH where TRDAR_CD_NM like ?";
		
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu+"%");
			rs = pstmt.executeQuery();		
			if(rs.next()) {			
				act = Double.parseDouble(rs.getString(1));
			}			
		}		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return act;
	}

	public double getStarOvp(String buu) {
		double act = 0;
		String sql = "select avg(decode(OVPOP_IDEX_VALUE,'null',NULL,OVPOP_IDEX_VALUE))from MARKETRESEARCH where TRDAR_CD_NM like ?";
		
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu+"%");
			rs = pstmt.executeQuery();		
			if(rs.next()) {			
				act = Double.parseDouble(rs.getString(1));
			}			
		}		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return act;
	}

	public String getBdInfo(String buu) {
		String INF ="";
		String sql = "select INFORMATION from building where bdid=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				INF = rs.getString(1);
				}
			}
		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return INF;
	}
	
	public String getBdComt(String buu) {
		String CMT ="";
		String sql = "select COMMENTS from building where bdid=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				CMT = rs.getString(1);
				}
			}
		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return CMT;
	}

	public String getBdTitle(String buu) {
		String abc ="";
		String sql = "select TITLE from building where bdid=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				abc = rs.getString(1);
				}
			}
		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return abc;
	}
	
	public String getTaDetail(String buu) {
		String abc ="";
		String sql = "select TA_DETAIL from building where bdid=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				abc = rs.getString(1);
				}
			}
		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return abc;
	}
	
	public String getVoteDtl(String buu) {
		String abc ="";
		String sql = "select VOTE_DETAIL from building where bdid=?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,buu);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				abc = rs.getString(1);
				}
			}
		
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		return abc;
	}
	
	public void V_DESSERT(String category,String BID) {
		//String abc ="";
		String sql = "UPDATE DESSERT SET "+category+"="+category+"+1 WHERE BUILDNUM = ?";
		try {
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,BID);
			rsint = pstmt.executeUpdate();
			

		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		
	}
	
	public void V_WESTERNFOOD(String category,String BID) {
		String sql = "UPDATE WESTERNFOOD SET "+category+"="+category+"+1 WHERE BUILDNUM = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,BID);
			rsint = pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		
	}
	
	public void V_STORE(String category,String BID) {
		//String abc ="";
		String sql = "UPDATE STORE SET "+category+"="+category+"+1 WHERE BUILDNUM = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,BID);
			rsint = pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		
	}
	
	public void V_ENTERTAIMENT(String category,String BID) {
		//String abc ="";
		String sql = "UPDATE ENTERTAIMENT SET "+category+"="+category+"+1 WHERE BUILDNUM = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,BID);
			rsint = pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		
	}
	
	public void V_LODGMENT(String category,String BID) {
		//String abc ="";
		String sql = "UPDATE LODGMENT SET "+category+"="+category+"+1 WHERE BUILDNUM = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,BID);
			rsint = pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}	
		
	}
	
	
}
=======

public HashMap<Integer,HashMap<String,String>> getXY(int select) {
	
	HashMap<Integer,HashMap<String,String>> map = new HashMap<Integer,HashMap<String,String>>();
	HashMap<String,String> result = new HashMap<String,String>();
	
	String sql1 = "select * from building where fundingYN = 'Y'";
	String sql2 = "select * from building where fundingYN = 'N'";
	String sql3 = "select * from(select * from building) where rownum <=6 and fundingyn = 'Y'";
	String sql4 = "select * from(select * from building) where rownum <=6 and fundingyn = 'N'";
	
	try {
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql1);
		ResultSetMetaData rsmt= rs.getMetaData();
		
		
		switch(select) {
		case 1 :{
			
			int number = 1 ;
			while(rs.next()) {
				if(number==4) {
					break;
				}
				for(int i = 0;i<rsmt.getColumnCount();i++) {
					result.put(rsmt.getColumnName(i+1),rs.getString(rsmt.getColumnName(i+1)));
				}
				map.put(number,(HashMap<String, String>) result.clone());		
				number++;
			}
			rs = stmt.executeQuery(sql2);
			while(rs.next()) {
				for(int p = 0;p<rsmt.getColumnCount();p++) {
					result.put(rsmt.getColumnName(p+1),rs.getString(rsmt.getColumnName(p+1)));
				}
				map.put(number, (HashMap<String, String>) result.clone());
				number++;
				if(number==7) {
					break;
				}
			}
			
			break;
		}
		case 2:
			
			int number = 1 ;
			rs = stmt.executeQuery(sql3);
			while(rs.next()) {
				if(number==7) {
					break;
				}
				for(int i = 0;i<rsmt.getColumnCount();i++) {
					result.put(rsmt.getColumnName(i+1),rs.getString(rsmt.getColumnName(i+1)));
				}
				map.put(number,(HashMap<String, String>) result.clone());		
				number++;
			}

			break;
		case 3:
			
			
			number = 1 ;
			rs = stmt.executeQuery(sql4);
			while(rs.next()) {
				if(number==7) {
					break;
				}
				for(int i = 0;i<rsmt.getColumnCount();i++) {
					result.put(rsmt.getColumnName(i+1),rs.getString(rsmt.getColumnName(i+1)));
				}
				map.put(number,(HashMap<String, String>) result.clone());		
				number++;
			}
			break;
				
				
		}
		
		
		
		
		
		
	}
	catch (Exception e) {
		System.out.println(e.getMessage());
	}
	return map;
	}

	

	public HashMap<String, Integer> getCategory(String bdid) {
		
		HashMap<String,Integer> list = new HashMap<String, Integer>();

		
		try {
			
		String dessert_sql = "select * from dessert where buildnum = ?";
		pstmt = conn.prepareStatement(dessert_sql);
		pstmt.setString(1, bdid);
		rs = pstmt.executeQuery();
		ResultSetMetaData rsmt= rs.getMetaData();
		

		if(rs.next()) {
				
			for(int i = 2;i<rsmt.getColumnCount();i++) {
			list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
			}}
		
		String westernfood_sql="select * from westernfood where buildnum =?";
		pstmt =conn.prepareStatement(westernfood_sql);
		
		pstmt.setString(1, bdid);
		rs = pstmt.executeQuery();
		rsmt= rs.getMetaData();
		
		if(rs.next()) {
			
			for(int i = 2;i<rsmt.getColumnCount();i++) {
			list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
			}
			}
			 
			 

		String store_sql="select * from store where buildnum = ?";
		pstmt =	conn.prepareStatement(store_sql);

		pstmt.setString(1, bdid);
		rs = pstmt.executeQuery();
		rsmt= rs.getMetaData();
		
		if(rs.next()) {
			
			for(int i = 2;i<rsmt.getColumnCount();i++) {
			list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
			}
		}
		 
		String entertaiment_sql="select * from entertaiment where buildnum = ?";
		pstmt = conn.prepareStatement(entertaiment_sql);
		
		pstmt.setString(1, bdid);
		rs = pstmt.executeQuery();
		rsmt= rs.getMetaData();
		
		if(rs.next()) {
			
			for(int i = 2;i<rsmt.getColumnCount();i++) {
			list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
			}
			}
			 
		String lodgment_sql ="select * from lodgment where buildnum=?"; 
		pstmt =conn.prepareStatement(lodgment_sql);
		
		pstmt.setString(1, bdid);
		rs = pstmt.executeQuery();
		rsmt= rs.getMetaData();
		
		if(rs.next()) {
			
			for(int i = 2;i<rsmt.getColumnCount();i++) {
			list.put(rsmt.getColumnName(i+1),rs.getInt(rsmt.getColumnName(i+1))); 
			}
			}
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		

		return list;

	}
	
public HashMap<Integer,String> vote(HashMap<String,Integer> list){
		

		double sum = 0;
		int tmp = 0;
		int i = 0;
		
		
		Set<String> keyset = list.keySet();
		int sort[]=new int[keyset.size()];
		

		 for(String pp : keyset) { 
			 	sum += list.get(pp);
			 	sort[i] = list.get(pp);
			 	i++;
		 }
		

		 for(i = 0;i<sort.length;i++) {
			 for(int j= 0;j<sort.length-1;j++) {
				 if(sort[j]<sort[j+1]) {
					 tmp = sort[j+1];
					 sort[j+1] = sort[j];
					 sort[j] = tmp;
				 }
			 }
		 }
		 

		 
		 String first[] = new String[5];
		 String firstre="";
		 
		 for(i = 0;i<5;i++) {
			for(String pp:keyset) {
				if(sort[i]==list.get(pp)) {
					if(!(firstre.contains(pp))) {
						first[i]=pp;
						firstre+=pp;
						break;
					}
				}
			}
		 }
		 for(i = 0 ; i<first.length;i++) {
			 System.out.println(first[i]);
		 }
		 
		 int firstV[] = new int[5];
		 
		 for(i=0;i<5;i++) {
			 firstV[i] = (int)((list.get(first[i])/sum)*100);
			 System.out.println(firstV[i]);
		 }
		 HashMap<Integer,String> listMap = new HashMap<Integer,String>();

		 for(i = 1;i<=5;i++) {
			listMap.put(i*2,firstV[i-1]+"");
			listMap.put((i*2)-1,first[i-1]);
		}		
		 return listMap;
	}
}
>>>>>>> fbi/fbi_bonobono
