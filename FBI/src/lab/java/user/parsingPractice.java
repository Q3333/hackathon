package lab.java.user;

import java.io.FileReader;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class parsingPractice {

	public static void main(String[] args) {
		JSONParser parser = new JSONParser();
		try {
		
			JSONObject obj = (JSONObject)parser.parse(new FileReader("F:\\IT\\JAVA\\workspace\\FBI\\����� �츮�������� ��Ǻм�����(���-������ǥ).json"));
			JSONObject dataBody = (JSONObject)parser.parse(obj.get("data").toString());
			System.out.println(dataBody);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
