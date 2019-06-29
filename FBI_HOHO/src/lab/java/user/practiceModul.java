package lab.java.user;

import java.io.BufferedReader;

public class practiceModul {

	public static void main(String[] args) {
		UserDao userdao = new UserDao();
		addChange addc = new addChange();
		
		String address1 = userdao.getAddress("KBM003656");	
		String address2 = addc.changeAdd(address1);
		
		userdao.marketResult(address2);
	}
}
