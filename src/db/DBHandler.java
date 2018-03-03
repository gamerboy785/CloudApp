package db;
import java.sql.*;
import java.util.ArrayList;

import models.*;

public class DBHandler {

	public static DBHandler shared = new DBHandler();
	
	private static final String URL = "jdbc:mysql://us-cdbr-iron-east-05.cleardb.net/heroku_4cc5e175fd48b99?";
	private static final String USERNAME = "b7c6cf5b950cd5";
	private static final String PASSWORD = "93b668d4";
	private static Connection conn = null;
	static {
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

	public static void getConnection() throws Exception {
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
	
	public boolean addRoom(Room room) {
		try {
			PreparedStatement pst = conn.prepareStatement("insert into rooms (roomImage,roomType,roomPrice,balcony,setBox,coolingSystem)"
					+ " values(?,?,?,?,?,?) ");
			pst.setString(1,room.getRoomImage());
			pst.setString(2, room.getRoomType());
			pst.setDouble(3, room.getRoomPrice());
			pst.setString(4, room.getBalcony());
			pst.setString(5, room.getSetBox());
			pst.setString(6, room.getCoolingSystem());
			pst.executeUpdate();
			return true;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public ArrayList<Room> getRooms() {
		ArrayList<Room>rooms = new ArrayList<Room>();
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from rooms");
			while (rs.next()) {
				int id = rs.getInt("id");
				String roomImage = rs.getString("roomImage");
				String roomType = rs.getString("roomType");
				Double roomPrice = rs.getDouble("roomPrice");
				String balcony = rs.getString("balcony");
				String setBox = rs.getString("setBox");
				String coolingSystem = rs.getString("coolingSystem");
				Room r = new Room(id,roomImage,roomType,roomPrice,balcony,setBox,coolingSystem);
				rooms.add(r);
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return rooms;
	}         
	
	public User getUser(String username, String password) throws Exception {
		
		PreparedStatement pst = conn.prepareStatement("select * from users where username = ? and password = ?");
		pst.setString(1, username);
		pst.setString(2, password);
		User user = null;
		ResultSet rs = pst.executeQuery();
		if( rs.last()) {
			user = new User();
			user.set_id(rs.getInt("id"));
			user.setFirstName(rs.getString("firstName"));
			user.setLastName(rs.getString("lastName"));
			user.setGender(rs.getString("gender"));
			user.setUsername(username);
			user.setPassword(password);
			user.setProfileImage(rs.getString("profile"));
			user.setRole(rs.getInt("role"));		
		}
		return user;
	}
	
}
