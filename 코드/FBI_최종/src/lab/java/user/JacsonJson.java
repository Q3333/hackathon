package lab.java.user;


import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JacsonJson {
	
	
	
	
	public static void main(String[] args) throws ParseException, ClassNotFoundException, SQLException {
		
		Properties prop = new Properties();
		Connection conn=null;
		Statement stmt=null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		int rsint;

		try {
			prop.load(new FileInputStream("F:/IT/JAVA/workspace/FBI/DBINFO.properties"));
			Class.forName(prop.getProperty("driver"));
			conn=DriverManager.getConnection(
			prop.getProperty("url"),
			prop.getProperty("user"),
			prop.getProperty("pwd"));
			String sql = " insert into marketResearch values(market_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			

			/*원본
			 * ObjectMapper mapper = new ObjectMapper(); Map<String, Object> map =
			 * mapper.readValue(new FileReader("F:\\IT\\JAVA\\workspace\\FBI\\test.json"),
			 * new TypeReference<Map<String, Object>>(){}); ArrayList<String> list =
			 * (ArrayList<String>) map.get("DATA"); for (Object msg : list) {
			 * System.out.println(msg); }
			 */
			
			  ObjectMapper mapper = new ObjectMapper(); 
			  
			  Map<String, Object> map =
			  mapper.readValue((new FileReader("F:\\IT\\JAVA\\workspace\\FBI\\test.json")),
			  new TypeReference<Map<String, Object>>(){});
			  

			 
			  ArrayList<Object> list =(ArrayList<Object>) map.get("DATA");
			  int batchNum = 0;
			  int total =0;
			  JSONParser js = new JSONParser();
			 
			  //Object obj = js.parse(list.get(0));
			/*
			 * Object obj = list.get(0); LinkedHashMap<String, Object> lmap =
			 * (LinkedHashMap)obj; Set<String> keys = lmap.keySet(); Iterator<String> iter =
			 * keys.iterator(); while(iter.hasNext()) { String key = iter.next();
			 * System.out.println(key+", "+ lmap.get(key)); }
			 */
			  
			  /*//넣는 부분
			  for(Object result : list) {
				  String splitresult[] =(result.toString()).split(",");
				  String realResult[] = new String[17];
				  for(int i = 0;i<splitresult.length;i++) {
					  String splitresult2[] = splitresult[i].split("=");
					  if(i==splitresult.length-1) {
						  realResult[i]=splitresult2[1].substring(0,splitresult2[1].length()-1);
					  }
					  else {
						  realResult[i]=splitresult2[1];
					  }
					  
				  }
				  for(int i=0;i<realResult.length;i++) {
					  pstmt.setString(i+1, realResult[i]);
				  }
				  pstmt.addBatch();
				  pstmt.clearParameters();
				  batchNum++;
				  if(batchNum==10000) {
					  total += batchNum;
					  System.out.println(total);
					  pstmt.executeBatch();
					  pstmt.clearBatch();
					  conn.commit();
					  batchNum=0;
					  
				  }
			  }
			  */
			/*
			 * System.out.println(batchNum); pstmt.executeBatch(); pstmt.clearBatch();
			 * conn.commit();
			 */

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			 e.printStackTrace();
		 }

	}

}
