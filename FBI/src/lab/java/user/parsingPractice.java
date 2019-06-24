package lab.java.user;

import java.io.FileReader;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class parsingPractice {

	public static void main(String[] args) {
		JSONParser parser = new JSONParser();
		try {
		
			JSONObject obj = (JSONObject)parser.parse(new FileReader("F:\\IT\\JAVA\\workspace\\FBI\\서울시 우리마을가게 상권분석서비스(상권-지수지표).json"));
			JSONObject dataBody = (JSONObject)parser.parse(obj.get("data").toString());
			System.out.println(dataBody);
			//System.out.println(dataBody.get("물건식별자").toString());
			//System.out.println(dataBody.get("공급면적").toString());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
