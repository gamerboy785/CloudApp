package models;

import java.util.Date;

public class Review {
	private int userId;
	private String fullname;
	private String comment;
	private Date dateCreated;
	private double rating;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Review(int userId, String fullname, String comment, Date dateCreated, double rating) {
		super();
		this.userId = userId;
		this.fullname = fullname;
		this.comment = comment;
		this.dateCreated = dateCreated;
		this.rating = rating;
	}
	
	
}
