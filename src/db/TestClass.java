package db;
import java.sql.*;

public class TestClass {
	
	public static void main(String[] args) throws Exception {
		try {
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://us-cdbr-iron-east-05.cleardb.net/heroku_4cc5e175fd48b99?";
			String username = "b7c6cf5b950cd5";
			String password = "93b668d4";
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
			System.out.println("Got connected");
			PreparedStatement pst = conn.prepareStatement("select * from users where firstname = ?");
			pst.setString(1, "Hamza");
			ResultSet result = pst.executeQuery();
			if (result != null) {
				while(result.next()) {
					String lastname = result.getString("lastname");
					String user = result.getString("username");
					System.out.println("lastname:" + lastname);
					System.out.println("username" + user);
				}
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
