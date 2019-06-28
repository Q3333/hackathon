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

	public class UpdateLodge {

		public static void main(String[] args) {
			// TODO Auto-generated method stub

			Properties prop = new Properties();
			Connection conn=null;
			Statement stmt=null;
			PreparedStatement pstmt = null;
			ResultSet rs;
	

			try {
				prop.load(new FileInputStream("C:/Users/김민지/eclipse-workspace/FBI_HOHO/DBINFO.properties"));
				Class.forName(prop.getProperty("driver"));
				System.out.println("드라이버연결");
				conn=DriverManager.getConnection(
				prop.getProperty("url"),
				prop.getProperty("user"),
				prop.getProperty("pwd"));
				System.out.println("연결성공");
				String sql = "UPDATE LODGMENT SET MOTEL=?, HOTEL=? WHERE BUILDNUM=?";
				pstmt = conn.prepareStatement(sql);
				
				for(int i=0; i<10;i++) {
					
				String bdid="KBM00370"+Integer.toString(i);
				
				
				pstmt.setInt(1, (int)Math.round(Math.random()*998)+1); //bdid
				pstmt.setInt(2, (int)Math.round(Math.random()*998)+1); //
		
				pstmt.setString(3, bdid);
			
			
				pstmt.addBatch();
				pstmt.executeBatch();
				}
						
				conn.commit();
				System.out.println("update 성공");
				 
				

		}catch(IllegalArgumentException e) {
		    System.out.println("Caught an IllegalArgumentException..." + e.getMessage());
		}catch(ClassNotFoundException e) {
			System.out.println("driver없음");
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
