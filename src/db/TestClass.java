package db;

import java.sql.*;
import models.*;

public class TestClass {
	
	public static void main(String[] args) throws Exception {
		DBHandler db = DBHandler.shared;
		User user =db.getUser("hamza.ali@gmail.com", "12345");
		if (user != null) {
			System.out.println(user.get_id());
			System.out.println(user.getFirstName());
			System.out.println(user.getLastName());
			System.out.println(user.getGender());
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			System.out.println(user.getProfileImage());
			System.out.println(user.getRole());
		}
	}
}
