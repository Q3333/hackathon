package lab.java.user;

import java.io.BufferedReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

import org.codehaus.jackson.map.util.Comparators;
	
public class practiceModul {

	public static void main(String[] args) throws ParseException {
		UserDao userdao = new UserDao();
		
		//HashMap<Integer,HashMap<String,String>> map = userdao.getXY(1);
		HashMap<Integer,HashMap<String,String>> map = userdao.getXY(1);
		
		for(int i = 1;i<=map.size();i++) {
			System.out.println(map.get(i));
		}
		
		System.out.println("==================================");
		
		map = userdao.getXY(2);
		for(int i = 1;i<=map.size();i++) {
			System.out.println(map.get(i));
		}
		
		System.out.println("==================================");
		
		map = userdao.getXY(3);
		for(int i = 1;i<=map.size();i++) {
			System.out.println(map.get(i));
		}
		
		System.out.println("==================================");
		
		
		//HashMap<Integer,String> userp ;
		//userp = userdao.vote(userdao.getCategory("KBM003657"));
		
		
		
		/*
		 * UserDao userdao = new UserDao(); HashMap<String,Integer> list = new
		 * HashMap<String, Integer>();
		 * 
		 * double sum = 0; int tmp = 0; int i = 0;
		 * 
		 * list = userdao.getCategory("KBM003657");
		 * 
		 * Set<String> keyset = list.keySet(); int sort[]=new int[keyset.size()];
		 * 
		 * 
		 * 
		 * System.out.println(keyset); System.out.println(keyset.size());
		 * 
		 * 
		 * for(String pp : keyset) { System.out.println(); sum += list.get(pp); sort[i]
		 * = list.get(pp); i++; }
		 * 
		 * 
		 * for(i = 0;i<sort.length;i++) { for(int j= 0;j<sort.length-1;j++) {
		 * if(sort[j]<sort[j+1]) { tmp = sort[j+1]; sort[j+1] = sort[j]; sort[j] = tmp;
		 * } } }
		 * 
		 * 
		 * 
		 * String first=""; String second=""; for(String pp : keyset) { if(sort[0] ==
		 * list.get(pp)) { first = pp; break; } }
		 * 
		 * for(String pp : keyset) { if(sort[1] == list.get(pp)) { second = pp; break; }
		 * } int firstD = (int)((list.get(first)/sum)*100); int secondD =
		 * (int)((list.get(second)/sum)*100);
		 * 
		 * System.out.println(list.get(first)); System.out.println(list.get(second));
		 * 
		 * System.out.println(firstD); System.out.println(secondD);
		 * 
		 * System.out.printf("first = %s %d",first,firstD);
		 * System.out.printf("second = %s %d",second,secondD);
		 * 
		 * HashMap<String,Integer> pp = new HashMap<String,Integer>(); pp.put(first,
		 * firstD); pp.put(second, secondD);
		 */
		 
		 
		

	}
}
