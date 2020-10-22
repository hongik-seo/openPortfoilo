package com.nanam.pointDB;

import java.sql.Timestamp;

import com.nanam.memberDB.Member;

public class Point  {

	
	
	private String id;
	private	Timestamp pointChargeDate;
	private	int pointTicketNum;
	private	int pointSize;
	private int finPoint;
	private String phone;
	
	private int bookTotalPrice ;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getPointChargeDate() {
		return pointChargeDate;
	}
	public void setPointChargeDate(Timestamp pointChargeDate) {
		this.pointChargeDate = pointChargeDate;
	}
	public int getPointTicketNum() {
		return pointTicketNum;
	}
	public void setPointTicketNum(int pointTicketNum) {
		this.pointTicketNum = pointTicketNum;
	}
	public int getPointSize() {
		return pointSize;
	}
	public void setPointSize(int pointSize) {
		this.pointSize = pointSize;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getFinPoint() {
		return finPoint;
	}
	public void setFinPoint(int finPoint) {
		this.finPoint = finPoint;
	}
	public int getBookTotalPrice() {
		return bookTotalPrice;
	}
	public void setBookTotalPrice(int bookTotalPrice) {
		this.bookTotalPrice = bookTotalPrice;
	}
	
	
	
}    
    

  