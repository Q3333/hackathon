package lab.java.user;

import java.util.HashMap;
import java.util.Set;

public class VoteResult {

	public static void main(String[] args) {
		
		  UserDao userdao = new UserDao(); HashMap<String,Integer> list = new
		  HashMap<String, Integer>();
		  
		  double sum = 0; int tmp = 0; int i = 0;
		  
		  list = userdao.getCategory("KBM003657");
		  
		  Set<String> keyset = list.keySet(); int sort[]=new int[keyset.size()];
		  
		  
		  
		  System.out.println(keyset); System.out.println(keyset.size());
		  
		 
		  for(String pp : keyset) { System.out.println(); sum += list.get(pp); sort[i]
		  = list.get(pp); i++; }
		  
		  
		  for(i = 0;i<sort.length;i++) { for(int j= 0;j<sort.length-1;j++) {
		  if(sort[j]<sort[j+1]) { tmp = sort[j+1]; sort[j+1] = sort[j]; sort[j] = tmp;
		  } } }
		  
		  
		  
		  String first=""; String second=""; for(String pp : keyset) { if(sort[0] ==
		  list.get(pp)) { first = pp; break; } }
		  
		  for(String pp : keyset) { if(sort[1] == list.get(pp)) { second = pp; break; }
		  } int firstD = (int)((list.get(first)/sum)*100); int secondD =
		  (int)((list.get(second)/sum)*100);
		  
		  System.out.println(list.get(first)); System.out.println(list.get(second));
		  
		  System.out.println(firstD); System.out.println(secondD);
		  
		  System.out.printf("first = %s %d",first,firstD);
		  System.out.printf("second = %s %d",second,secondD);
		  
		  HashMap<Integer,String> pp = new HashMap<Integer,String>(); 
		  pp.put(1,first);
		  pp.put(2,firstD+"");
		  pp.put(3,second);
		  pp.put(4,secondD+"");
		 
		  System.out.println(pp.get(1));
		  System.out.println(pp.get(2));
		  System.out.println(pp.get(3));
		  System.out.println(pp.get(4));
	}

}
