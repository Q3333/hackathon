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
		UserDao userdao = new UserDao();
		int DBresult=0;
		String userAttribute[] = {
				"물건식별자",
				"X좌표값",
				"Y좌표값",
				"지번주소",
				"월세가",
				"전세가",
				"관리비"};
		String result[] = new String[userAttribute.length];
		try {
		
			JSONObject obj = (JSONObject)parser.parse(new FileReader("F:\\IT\\JAVA\\workspace\\FBI\\KB_BANK_LAND_GET_ESTATESALEDTL.json"));
			JSONObject dataBody = (JSONObject)parser.parse(obj.get("dataBody").toString());
			
			for(int i =0;i<userAttribute.length;i++) {
				result[i]=dataBody.get(userAttribute[i]).toString();
			}
			
			DBresult = userdao.insert_building_info(result);
			
			if(DBresult==1) {
				System.out.println("성공");
			}
			else {
				System.out.println("실패");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
