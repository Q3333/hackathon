package lab.java.user;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class addChange {

	public String changeAdd(String add) {
		BufferedReader buffRd = null;
		try {

			String currentPage ="1";//요청 변수 설정 (현재 페이지. currentPage : n > 0)
			String countPerPage ="10";//요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
			String resultType ="json";//요청 변수 설정 (검색결과형식 설정, json)
			String confmKey ="U01TX0FVVEgyMDE5MDYyNjExMTk0MDEwODgzNzg=";//요청 변수 설정 (승인키)
			String keyword =add;//요청 변수 설정 (키워드)
			
			String urlstr = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage
					+"&countPerPage="+countPerPage
					+"&keyword="+URLEncoder.encode(keyword,"UTF-8")
					+"&confmKey="+confmKey
					+"&resultType="+resultType;
			
			URL url = new URL(urlstr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setRequestMethod("GET");
			
			buffRd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		}
		catch(Exception e) {
			System.out.println("ERROR = "+e.getMessage());
		}
		
		String result = "";
		JSONParser parser = new JSONParser();
		
		try {
			JSONObject address_parse = (JSONObject)parser.parse(buffRd.readLine());
			JSONObject results = (JSONObject)parser.parse(address_parse.get("results").toString());
			JSONArray juso = (JSONArray) parser.parse(results.get("juso").toString());
			JSONObject rn = (JSONObject)parser.parse(juso.get(0).toString());
			result = rn.get("rn").toString();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;

	}
	
}
