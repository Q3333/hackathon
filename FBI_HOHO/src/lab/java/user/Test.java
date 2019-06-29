package lab.java.user;

import java.sql.ResultSetMetaData;
import java.util.HashMap;

public class Test {
	
	public static void main(String[] args) {
		UserDao a = new UserDao();
		HashMap<Integer,String> vote = new HashMap<Integer,String>();
		HashMap<Integer,HashMap<String,String>> map = a.getXY();

		 
		   vote = a.vote(a.getCategory("KBM003657"));
		   System.out.println(vote);
//		   vote = a.vote(a.getCategory("KBM003652"));
//		   System.out.println(vote);
		   
		System.out.println(a.getAdd("KBM003657"));
	
		

	}

}
