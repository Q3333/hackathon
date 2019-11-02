package lab.java.user;

import java.io.FileInputStream;
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

public class UserDao {
	Properties prop = new Properties();
	Connection conn=null;
	Statement stmt=null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	int rsint;
	

	public UserDao(){
		try {
			prop.load(new FileInputStream("C:/replay/카카오톡 받은 파일/FBI_최종/DBINFO.properties"));
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
				return -1;//占쏙옙占싱듸옙 占쏙옙占승곤옙占�
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return -2;//占쏙옙澍О占� 占쏙옙占쏙옙
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
					return 1;//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙 1
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
					return 1;//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙 1
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
	
public String marketResult(String address){//由ы꽩媛� �븣留욊쾶 蹂�寃쏀븯湲�
		String add = null;
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
//public String[] getPosition

public String getX(String bdId) { //X좌표 가져오기
	   String x="";
	   String sql = "select location_x from building where bdid=?";
	   try {
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, bdId);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         x = rs.getString(1);
	      }
	   }
	   catch(Exception e) {
	      System.out.println(e.getMessage());
	   }
	   return x;
	}

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
	
	
	public HashMap<Integer, HashMap<String, String>> getXY(int select) {

	      HashMap<Integer, HashMap<String, String>> map = new HashMap<Integer, HashMap<String, String>>();
	      HashMap<String, String> result = new HashMap<String, String>();

	      String sql1 = "select * from building where fundingYN = 'Y'";
	      String sql2 = "select * from building where fundingYN = 'N'";
	      String sql3 = "select * from(select * from building) where rownum <=6 and fundingyn = 'Y'";
	      String sql4 = "select * from(select * from building) where rownum <=6 and fundingyn = 'N'";

	      try {

	         stmt = conn.createStatement();
	         rs = stmt.executeQuery(sql1);
	         ResultSetMetaData rsmt = rs.getMetaData();

	         switch (select) {
	         case 1: {

	            int number = 1;
	            while (rs.next()) {
	               if (number == 4) {
	                  break;
	               }
	               for (int i = 0; i < rsmt.getColumnCount(); i++) {
	                  result.put(rsmt.getColumnName(i + 1), rs.getString(rsmt.getColumnName(i + 1)));
	               }
	               map.put(number, (HashMap<String, String>) result.clone());
	               number++;
	            }
	            rs = stmt.executeQuery(sql2);
	            while (rs.next()) {
	               for (int p = 0; p < rsmt.getColumnCount(); p++) {
	                  result.put(rsmt.getColumnName(p + 1), rs.getString(rsmt.getColumnName(p + 1)));
	               }
	               map.put(number, (HashMap<String, String>) result.clone());
	               number++;
	               if (number == 7) {
	                  break;
	               }
	            }

	            break;
	         }
	         case 2:

	            int number = 1;
	            rs = stmt.executeQuery(sql3);
	            while (rs.next()) {
	               if (number == 7) {
	                  break;
	               }
	               for (int i = 0; i < rsmt.getColumnCount(); i++) {
	                  result.put(rsmt.getColumnName(i + 1), rs.getString(rsmt.getColumnName(i + 1)));
	               }
	               map.put(number, (HashMap<String, String>) result.clone());
	               number++;
	            }

	            break;
	         case 3:

	            number = 1;
	            rs = stmt.executeQuery(sql4);
	            while (rs.next()) {
	               if (number == 7) {
	                  break;
	               }
	               for (int i = 0; i < rsmt.getColumnCount(); i++) {
	                  result.put(rsmt.getColumnName(i + 1), rs.getString(rsmt.getColumnName(i + 1)));
	               }
	               map.put(number, (HashMap<String, String>) result.clone());
	               number++;
	            }
	            break;

	         }

	      } catch (Exception e) {
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
	
	public String getServiceDtl(String bid,int i) {
		String abc ="";
		String sql = "select detail" +i + " from building where bdid = ?";
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bid);
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
	
	public int getTotalMoney() {
		String sql = "select sum(CURRENTMONEY) from BUILDING";
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
		return 50;
	}
	
	public int getTotalBd() {
		String sql = "select count(bdid) from building";
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
		return 50;
	}			
	
	public String comma(String str)
    {
        String temp = reverseString(str);
        String result = "";

        for(int i = 0 ; i < temp.length() ; i += 3) {
            if(i + 3 < temp.length()) {
                result += temp.substring(i, i + 3) + ",";
            }
            else {
                result += temp.substring(i);
            }
        }

        return reverseString(result);
    }
	

    private String reverseString(String s)
    {
        return new StringBuffer(s).reverse().toString();
    }
    
    
    
    public double amp(double a){
 	   return a+(a-50)*10;
    }
    
    public double score(double Act, double Stb, double Grw, double Ovp) {
    	return (Act/4) + (Stb/4) + (Grw/4) + ((100-Ovp)/4);
    }
    
//    public double getScore(String BDID) {
//    	String AreaName = getAdd(BDID);
//    	
//    	double starAct = amp(getStarAct(AreaName)); 
//    	double starStb = amp(getStarStb(AreaName));
//    	double starGrw = amp(getStarGrw(AreaName));
//    	double starOvp = amp(getStarOvp(AreaName));
//    	
//    	double score = score(starAct, starStb, starGrw, starOvp);
//    	
//    	return score;
//    	
//    }
    public HashMap<String,Double> getMarket(String buu) {
        HashMap<String,Double> result = new HashMap<String, Double>();
        
        double getStarAct = 0;
        double getStarStb = 0;
        double getStarGrw = 0;
        double getStartOvp = 0;

        
        String sql ="select avg(decode(ACTVTY_IDX_VALUE,'null',NULL,ACTVTY_IDX_VALUE)),\r\n" + 
              "avg(decode(STABLE_IDX_VALUE,'null',NULL,STABLE_IDX_VALUE)),\r\n" + 
              "avg(decode(GROWTH_IDX_VALUE,'null',NULL,GROWTH_IDX_VALUE)),\r\n" + 
              "avg(decode(OVPOP_IDEX_VALUE,'null',NULL,OVPOP_IDEX_VALUE))\r\n" + 
              "from MARKETRESEARCH where TRDAR_CD_NM like ?";
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, buu + "%");
           rs = pstmt.executeQuery();
           if (rs.next()) {
              getStarAct = Double.parseDouble(rs.getString(1));
              getStarStb = Double.parseDouble(rs.getString(2));
              getStarGrw = Double.parseDouble(rs.getString(3));
              getStartOvp = Double.parseDouble(rs.getString(4));
           }
        } catch (Exception e) {
           System.out.println(e.getMessage());
        }
        result.put("getStarAct", getStarAct);
        result.put("getStarStb", getStarStb);
        result.put("getStarGrw", getStarGrw);
        result.put("getStartOvp", getStartOvp);
        return result;
     }
     
     
     public double getScore(String BDID) {
        String AreaName = getAdd(BDID);
        
        HashMap<String,Double> result = new HashMap<String, Double>();
        
        result = getMarket(AreaName);
        
        double starAct = result.get("getStarAct");
        double starStb = result.get("getStarStb");
        double starGrw = result.get("getStarGrw");
        double starOvp = result.get("getStartOvp");
        double score = score(starAct, starStb, starGrw, starOvp);

        return score;

     }
  
     
     
     public HashMap<String,Integer> ScoreBest_10(String bdid ,String userid) {
        
        String sql = "select concernlist from userinfo where userid = ?";
        HashMap<String,Integer> res = new HashMap<String, Integer>();
        
        try {
           String concernlist = null;
           pstmt=conn.prepareStatement(sql);
           pstmt.setString(1, userid);
           rs = pstmt.executeQuery();
           while(rs.next()) {
              concernlist = rs.getString("concernlist");
           }
              
           
           
           int score = (int)(getScore(bdid));
           
           

           HashMap<Integer,HashMap<Integer,String>> voteResult = new HashMap<Integer,HashMap<Integer,String>>();
           HashMap<Integer,String> vote = new HashMap<Integer,String>();
           
            
           voteResult.put(1, vote(getCategory(bdid)));
           
           if(concernlist.contains(voteResult.get(1).get(1))) {
              score+=10;
           }
           if(concernlist.contains(voteResult.get(1).get(3))) {
              score+=8;
           }
           if(concernlist.contains(voteResult.get(1).get(5))) {
              score+=6;
           }
           if(concernlist.contains(voteResult.get(1).get(7))) {
              score+=4;
           }
           if(concernlist.contains(voteResult.get(1).get(9))) {
              score+=2;
           }
           
           res.put(bdid, score);   
        }
        catch(Exception e) {
           System.out.println(e.getMessage());
        }
        
     
        return res;
     }
     

     
			
     
public HashMap<String,HashMap<String,String>> getXYZ() {
         
         HashMap<String,HashMap<String,String>> map = new HashMap<String,HashMap<String,String>>();
         HashMap<String,String> child = new HashMap<String,String>();
         
         String sql1 = "select bdid, location_x, location_y, fundingyn from building";
         try {
          stmt=conn.createStatement();
          rs=stmt.executeQuery(sql1);          
          while (rs.next()) {
             child.put("x", rs.getString("location_y"));
             child.put("y", rs.getString("location_x"));
             child.put("z", rs.getString("fundingyn"));
             map.put(rs.getString("bdid"), (HashMap<String, String>)child.clone());
          }
          
         } catch (Exception e) {
           System.out.println(e.getMessage());
         }
         return map;   
   } 
 

 

 public HashMap<Integer, String> recommand(HashMap<Integer,HashMap<String,Integer>> pp) {
    
    System.out.println("recommand = "+ pp.size());
    
    for(int i=0;i<pp.size();i++) {
       System.out.println(pp.get(i));
    }
    
    Set<Integer> keyset = pp.keySet();
    
    HashMap<String, Integer> list = new HashMap<String, Integer>();
    HashMap<Integer, String> result = new HashMap<Integer, String>();
    
    
    for(int i=0;i<keyset.size()-1;i++) {
    
       list.putAll(pp.get(i));
    }
    
    result = vote(list);
    
    return result;
 }
 

 
 
}
	

