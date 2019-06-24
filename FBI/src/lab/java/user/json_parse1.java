package lab.java.user;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.swing.text.html.HTMLEditorKit.Parser;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class json_parse1 {

	public static void main(String[] args) throws org.json.simple.parser.ParseException {

		
		JSONParser parser = new JSONParser();
		try {
		
			JSONObject obj = (JSONObject)parser.parse(new FileReader("F:\\IT\\JAVA\\workspace\\FBI\\KB_BANK_LAND_GET_ESTATESALEDTL.json"));
			//System.out.println((obj.get("dataBody")));
			//Reader dataBody = (Reader)obj.get("dataBody");
			//System.out.println(obj.get("dataBody").toString());
			
			JSONObject dataBody = (JSONObject)parser.parse(obj.get("dataBody").toString());
			//JSONObject result = (JSONObject)value.get("공급면적");
			//JSONObject dataBody = (JSONObject)parser.parse(new FileReader((String)obj.get("dataBody")));
			//JSONObject value = (JSONObject)dataBody.get("공급면적");
			System.out.println(dataBody.get("물건식별자").toString());
			System.out.println(dataBody.get("공급면적").toString());
			//System.out.println(result);
		
			//오브젝트 개수
			//System.out.println("오브젝트의 갯수 : "+obj.size());
			//System.out.println("오브젝트의 갯수 : "+dataBody.size());
			//key set 받아오기
			//Set key = obj.keySet();
			//Set key = dataBody.keySet();
			
			//Iterator
			//Iterator<String> iter = key.iterator();
			
		
			
			/*
			 * while(iter.hasNext()) { String keyname = iter.next();
			 * System.out.println(iter); System.out.println(keyname); }
			 */
			//System.out.println(value);
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		/*
		 * JSONParser parser = new JSONParser(); 
		 * try { Object obj = 
		 * parser.parse(new FileReader("F:\\IT\\JAVA\\workspace\\FBI\\test.json")); JSONObject
		 * jsonObject= (JSONObject) obj;
		 * 
		 * String name = (String) jsonObject.get("name"); System.out.println("name :: "
		 * +name);
		 * 
		 * long id = (Long) jsonObject.get("id"); System.out.println("id :: " + id);
		 * 
		 * // Array JSONArray phoneNum = (JSONArray) jsonObject.get("phoneNumbers");
		 * Iterator<String> iterator = phoneNum.iterator(); while (iterator.hasNext()) {
		 * System.out.println("phoneNumbers :: " + iterator.next()); } //Object
		 * JSONArray array = (JSONArray) jsonObject.get("address"); for(int i=0;
		 * i<array.size(); i++){ JSONObject result = (JSONObject) array.get(i);
		 * System.out.println("result :: " +result.get("zipcode")); } } catch
		 * (FileNotFoundException e) { e.printStackTrace(); } catch (IOException e) {
		 * e.printStackTrace(); }
		 */
		 

	}
}
