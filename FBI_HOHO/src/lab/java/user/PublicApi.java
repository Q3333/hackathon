package lab.java.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class PublicApi {

	public static void main(String[] args) {
		
		BufferedReader buffRd = null;
		try {

			//String currentPage ="1";//요청 변수 설정 (현재 페이지. currentPage : n > 0)
			//String countPerPage ="10";//요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
			//String resultType ="json";//요청 변수 설정 (검색결과형식 설정, json)
			//String confmKey ="U01TX0FVVEgyMDE5MDYyNjExMTk0MDEwODgzNzg=";//요청 변수 설정 (승인키)
			//String keyword =add;//요청 변수 설정 (키워드)
			String apiKey ="l7xxd3d3817c16c24fa1a64ea99085bab7c5";
			String dataBody="{\"dataHeader\":{},\"dataBody\":{\"매물일련번호\":\"31089551\"}}";
			String hsKey="RgI1gpfKj0CxAVAIJUH5chTlQzJfUN5hlCqaljCk930=";
			String Content_type="application/json";
			
			
			
			String urlstr = 
					"https://dev-openapi.kbstar.com:8443/hackathon/getSaleDetail?apikey="+apiKey
					+"&hskey="+hsKey
					+"&content-type="+Content_type;
					//+"&dataBody="+dataBody;
			
			URL url = new URL(urlstr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setRequestMethod("GET");
			
			buffRd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			String buf;
			while((buf=buffRd.readLine())!=null) {
				System.out.println(buf);
			}
			
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
		
		
	}

}
