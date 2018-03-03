package models;

public class Room {
	private int _id;
	private String roomImage;
	private String roomType;
	private double roomPrice;
	private String balcony;
	private String setBox;
	private String coolingSystem;
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getRoomImage() {
		return roomImage;
	}
	public void setRoomImage(String roomImage) {
		this.roomImage = roomImage;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public double getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(double roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getBalcony() {
		return balcony;
	}
	public void setBalcony(String balcony) {
		this.balcony = balcony;
	}
	public String getSetBox() {
		return setBox;
	}
	public void setSetBox(String setBox) {
		this.setBox = setBox;
	}
	public String getCoolingSystem() {
		return coolingSystem;
	}
	public void setCoolingSystem(String coolingSystem) {
		this.coolingSystem = coolingSystem;
	}
	public Room(int _id, String roomImage, String roomType, double roomPrice, String balcony, String setBox,
			String coolingSystem) {
		super();
		this._id = _id;
		this.roomImage = roomImage;
		this.roomType = roomType;
		this.roomPrice = roomPrice;
		this.balcony = balcony;
		this.setBox = setBox;
		this.coolingSystem = coolingSystem;
	}
	public Room() {
		
	}
}
