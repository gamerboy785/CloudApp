package db;
import java.sql.*;
import java.util.*;
import java.util.Date;

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
	
	public static void restartConnection() throws Exception {
		if(conn.isClosed()) {
			getConnection();
		}
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
			DBHandler.restartConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
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
		try {
			DBHandler.restartConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
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
	
	public Double getRoomPrice(int roomID) throws Exception {
		DBHandler.restartConnection();
		PreparedStatement pst = conn.prepareStatement("select roomPrice from rooms where id = ?");
		pst.setInt(1, roomID);
		ResultSet rs = pst.executeQuery();
		if(rs.last()) {
			return rs.getDouble("roomPrice");
		}
		return (double) 0;
	}
	
	public boolean addUser(User user) {
		try {
			DBHandler.restartConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			PreparedStatement pst = conn.prepareStatement("insert into users (username,password,profile,gender,firstname,lastname,role)"
					+ " values(?,?,?,?,?,?,?) ");
			pst.setString(1,user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getProfileImage());
			pst.setString(4,user.getGender());
			pst.setString(5,user.getFirstName());
			pst.setString(6, user.getLastName());
			pst.setInt(7, user.getRole());
			pst.executeUpdate();
			return true;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public User getUser(String username, String password) throws Exception {
		
		DBHandler.restartConnection();
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
	
	public boolean bookRoom(int userID,int roomID,Calendar startDate,Calendar endDate)
	{
		try {
			DBHandler.restartConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try
		{
			Date utilStartDate = startDate.getTime();
		    java.sql.Date sDate = new java.sql.Date(utilStartDate.getTime());			
			Date utilEndDate = endDate.getTime();
		    java.sql.Date eDate = new java.sql.Date(utilEndDate.getTime());
			PreparedStatement pst = conn.prepareStatement("insert into roombookinginfo (startDate,endDate,isBooked,userId,roomId) values(?,?,?,?,?)");
			pst.setDate(1, sDate);
			pst.setDate(2, eDate);
			pst.setString(3, "True");
			pst.setInt(4, userID);
			pst.setInt(5, roomID);
			pst.executeUpdate();
			return true;	
			
		}
		catch(Exception e)
		{		
			e.printStackTrace();
		}
		
		return false;	
	}
	
	public boolean isAvailable(int roomID,Calendar startDate,Calendar endDate)
	{
		try {
			DBHandler.restartConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		boolean isAvail = false;
		try
		{
			PreparedStatement pst = conn.prepareStatement("select * from roombookinginfo where roomId = ? and startDate >= ? and endDate <=? and isBooked = 'True'");
			Date utilStartDate = startDate.getTime();
		    java.sql.Date sDate = new java.sql.Date(utilStartDate.getTime());
		    Date utilEndDate = endDate.getTime();
		    java.sql.Date eDate = new java.sql.Date(utilEndDate.getTime());
		    
			pst.setInt(1, roomID);
			pst.setDate(2, sDate);
			pst.setDate(3, eDate);
			ResultSet rs = pst.executeQuery();
			if(rs.last())
			{
				return isAvail;
			}
			PreparedStatement pst2 = conn.prepareStatement("select * from roombookinginfo where roomId = ? and startDate >= ? and startDate <=? and isBooked = 'True'");
			
			pst2.setInt(1, roomID);
			pst2.setDate(2, sDate);
			pst2.setDate(3, eDate);
	
			rs = pst2.executeQuery();
			if(rs.last())
			{
				return isAvail;
			}
			
			PreparedStatement pst3 = conn.prepareStatement("select * from roombookinginfo where roomId = ? and endDate >= ? and endDate <=? and isBooked = 'True'");
			pst3.setInt(1, roomID);
			pst3.setDate(2, sDate);
			pst3.setDate(3, eDate);
	
			rs = pst3.executeQuery();
			if(rs.last())
			{
				return isAvail;
			}
			
			PreparedStatement pst4 = conn.prepareStatement("select * from roombookinginfo where roomId = ? and startDate <= ? and endDate >=? and isBooked = 'True'");
			pst4.setInt(1, roomID);
			pst4.setDate(2, sDate);
			pst4.setDate(3, eDate);
	
			rs = pst4.executeQuery();
			if(rs.last())
			{
				return isAvail;
			}
			
			isAvail = true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isAvail;
		
	}
	
	public boolean updateRoom(Room room) {
		try {
			DBHandler.restartConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			PreparedStatement pst = conn.prepareStatement("update rooms set roomImage = ?, roomType = ?,roomPrice = ?,balcony = ?,setBox = ?,coolingSystem = ? where id = ?");
			pst.setString(1, room.getRoomImage());
			pst.setString(2, room.getRoomType());
			pst.setDouble(3,room.getRoomPrice());
			pst.setString(4, room.getBalcony());
			pst.setString(5, room.getSetBox());
			pst.setString(6, room.getCoolingSystem());
			pst.setInt(7, room.get_id());
			pst.executeUpdate();
			return true;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public boolean hasUser(String username) throws Exception {
		DBHandler.restartConnection();
		PreparedStatement pst = conn.prepareStatement("select * from users where username = ?" );
		pst.setString(1, username);
		if (pst.executeQuery().last()) {
			return true;
		}
		return false;
	}
	
}
