package models;

import java.util.Date;

public class RoomBookingInfo {
	private int id;
	private int roomId;
	private Date startDate;
	private Date endDate;
	private String isBooked;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getIsBooked() {
		return isBooked;
	}
	public void setIsBooked(String isBooked) {
		this.isBooked = isBooked;
	}
	private RoomBookingInfo(int id, int roomId, Date startDate, Date endDate, String isBooked) {
		super();
		this.id = id;
		this.roomId = roomId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isBooked = isBooked;
	}
	private RoomBookingInfo() {
		
	}
}
