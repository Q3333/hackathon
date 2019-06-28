	package lab.java.user;

	import java.io.FileInputStream;
	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.util.Properties;

	public class UpdateWestern {

		public static void main(String[] args) {
			// TODO Auto-generated method stub

			Properties prop = new Properties();
			Connection conn=null;
			Statement stmt=null;
			PreparedStatement pstmt = null;
			ResultSet rs;


			try {
				prop.load(new FileInputStream("C:/Users/�����/eclipse-workspace/FBI_HOHO/DBINFO.properties"));
				Class.forName(prop.getProperty("driver"));
				System.out.println("����̹�����");
				conn=DriverManager.getConnection(
				prop.getProperty("url"),
				prop.getProperty("user"),
				prop.getProperty("pwd"));
				System.out.println("���Ἲ��");
				String sql = "UPDATE WESTERNFOOD SET KRFOOD=?, CHIFOOD=?, JAPFOOD=?, VIETFOOD=?, SNACKBAR=?, RESTAURANT=?, BAR=?, CHICKEN=?, BEER=?, PIZZA=?, HAMBURGER=?, MEATREST=?, NIGHTMEAL=? WHERE BUILDNUM=?";
				pstmt = conn.prepareStatement(sql);
				
				for(int i=0; i<10;i++) {
					
				String bdid="KBM00370"+Integer.toString(i);
				
				
				pstmt.setInt(1, (int)Math.round(Math.random()*1000)+1); //bdid
				pstmt.setInt(2, (int)Math.round(Math.random()*1000)+1); //
				pstmt.setInt(3, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(4, (int)Math.round(Math.random()*1000)+1);//*
				pstmt.setInt(5, (int)Math.round(Math.random()*1000)+1);//*
				pstmt.setInt(6, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(7, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(8, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(9, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(10, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(11, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(12, (int)Math.round(Math.random()*1000)+1);
				pstmt.setInt(13, (int)Math.round(Math.random()*1000)+1);
				pstmt.setString(14, bdid);
			
			
				pstmt.addBatch();
				pstmt.executeBatch();
				}
						
				conn.commit();
				System.out.println("update ����");
				 
				

		}catch(IllegalArgumentException e) {
		    System.out.println("Caught an IllegalArgumentException..." + e.getMessage());
		}catch(ClassNotFoundException e) {
			System.out.println("driver����");
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}catch(IOException e) {
			System.out.println(e.getMessage());
		}	finally {
			try {			 
				if(pstmt!=null) pstmt.close();
				if (conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	}
