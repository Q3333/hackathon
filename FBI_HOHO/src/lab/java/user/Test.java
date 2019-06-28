package lab.java.user;

import java.sql.ResultSetMetaData;
import java.util.HashMap;

public class Test {
	
	public static void main(String[] args) {
		UserDao use = new UserDao();
		
		System.out.println(use.getAdd("KBM003651"));
		
		
		

	}

}
