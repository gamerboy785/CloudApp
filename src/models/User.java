package models;

public class User {
	private int _id;
	private String firstName;
	private String lastName;
	private String gender;
	private String role;
	private String username;
	private String password;
	private String profileImage;	
	private String active;
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	
	public User(int _id, String firstName, String lastName, String gender, String role, String username,
			String password, String profileImage) {
		super();
		this._id = _id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.role = role;
		this.username = username;
		this.password = password;
		this.profileImage = profileImage;
	}
	
	public User()
	{
	
	}
	
}
