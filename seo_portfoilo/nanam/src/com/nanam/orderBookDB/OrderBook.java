package com.nanam.orderBookDB;

import java.sql.Timestamp;

import com.nanam.buyDB.Buy;
import com.nanam.cartDB.Cart;

public class OrderBook extends Buy {
	
	
	private 	String orderName;//           VARCHAR2(20) NOT NULL,  
	private 	String orderId;//         VARCHAR2(20) NOT NULL,   
	private 	String orderEmail;//                  VARCHAR2(40),  
	private 	String orderPhone;//          VARCHAR2(20) NOT NULL,  
	private 	String orderZipcode;//                VARCHAR2(20) NOT NULL,  
	private 	String orderDetailAddress;//          VARCHAR2(100) NOT NULL, 
	private 	String orderAddress;//                VARCHAR2(100) NOT NULL, 
	private 	String orderCall;
	
	
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderZipcode() {
		return orderZipcode;
	}
	public void setOrderZipcode(String orderZipcode) {
		this.orderZipcode = orderZipcode;
	}
	public String getOrderDetailAddress() {
		return orderDetailAddress;
	}
	public void setOrderDetailAddress(String orderDetailAddress) {
		this.orderDetailAddress = orderDetailAddress;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderCall() {
		return orderCall;
	}
	public void setOrderCall(String orderCall) {
		this.orderCall = orderCall;
	}
	@Override
	public int getBuyEachPrice() {
		// TODO Auto-generated method stub
		return super.getBuyEachPrice();
	}
	@Override
	public void setBuyEachPrice(int buyEachPrice) {
		// TODO Auto-generated method stub
		super.setBuyEachPrice(buyEachPrice);
	}
	@Override
	public int getBuyEachNum() {
		// TODO Auto-generated method stub
		return super.getBuyEachNum();
	}
	@Override
	public void setBuyEachNum(int buyEachNum) {
		// TODO Auto-generated method stub
		super.setBuyEachNum(buyEachNum);
	}
	@Override
	public String getCartBookTitle() {
		// TODO Auto-generated method stub
		return super.getCartBookTitle();
	}
	@Override
	public void setCartBookTitle(String cartBookTitle) {
		// TODO Auto-generated method stub
		super.setCartBookTitle(cartBookTitle);
	}
	@Override
	public String getCartBookImageName() {
		// TODO Auto-generated method stub
		return super.getCartBookImageName();
	}
	@Override
	public void setCartBookImageName(String cartBookImageName) {
		// TODO Auto-generated method stub
		super.setCartBookImageName(cartBookImageName);
	}
	
	
	
	
	
	
}
	