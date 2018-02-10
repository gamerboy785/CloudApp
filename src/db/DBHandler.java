package db;
import java.sql.*;

public class DBHandler {

	public static DBHandler shared = new DBHandler();
	
	private static final String URL = "jdbc:mysql://us-cdbr-iron-east-05.cleardb.net/heroku_4cc5e175fd48b99?";
	private static final String USERNAME = "b7c6cf5b950cd5";
	private static final String PASSWORD = "93b668d4";
	private Connection conn = null;
	
	{
		try {
			getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private DBHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		System.out.println("Connected to mysql database");
	}
	
	public boolean foo() {
		try {
			PreparedStatement pst = conn.prepareStatement("select * from users where firstname = ?");
			pst.setString(1, "Hamza");
			ResultSet result = pst.executeQuery();
			if (result != null) {
				return true;
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
		
	}
	
}
