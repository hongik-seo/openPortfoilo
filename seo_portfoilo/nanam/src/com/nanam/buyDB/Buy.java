package com.nanam.buyDB;

import java.sql.Timestamp;

import com.nanam.cartDB.Cart;

public class Buy extends Cart {
	
	
	private String buyId;
	private String buyDecide;
	private int buyEachNum;
	private String buyISBN;
	private int buyTotalPrice;
	private int buyEachPrice;
	
	
	
	
	
	

	public int getBuyEachPrice() {
		return buyEachPrice;
	}
	public void setBuyEachPrice(int buyEachPrice) {
		this.buyEachPrice = buyEachPrice;
	}
	public String getBuyId() {
		return buyId;
	}
	public void setBuyId(String buyId) {
		this.buyId = buyId;
	}
	public String getBuyDecide() {
		return buyDecide;
	}
	public void setBuyDecide(String buyDecide) {
		this.buyDecide = buyDecide;
	}
	public int getBuyEachNum() {
		return buyEachNum;
	}
	public void setBuyEachNum(int buyEachNum) {
		this.buyEachNum = buyEachNum;
	}
	public String getBuyISBN() {
		return buyISBN;
	}
	public void setBuyISBN(String buyISBN) {
		this.buyISBN = buyISBN;
	}
	public int getBuyTotalPrice() {
		return buyTotalPrice;
	}
	public void setBuyTotalPrice(int buyTotalPrice) {
		this.buyTotalPrice = buyTotalPrice;
	}
	@Override
	public String getCartId() {
		// TODO Auto-generated method stub
		return super.getCartId();
	}
	@Override
	public void setCartId(String cartId) {
		// TODO Auto-generated method stub
		super.setCartId(cartId);
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
	public int getCartBookPrice() {
		// TODO Auto-generated method stub
		return super.getCartBookPrice();
	}
	@Override
	public void setCartBookPrice(int cartBookPrice) {
		// TODO Auto-generated method stub
		super.setCartBookPrice(cartBookPrice);
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
	@Override
	public Timestamp getCartDate() {
		// TODO Auto-generated method stub
		return super.getCartDate();
	}
	@Override
	public void setCartDate(Timestamp cartDate) {
		// TODO Auto-generated method stub
		super.setCartDate(cartDate);
	}
	@Override
	public String getDecide() {
		// TODO Auto-generated method stub
		return super.getDecide();
	}
	@Override
	public void setDecide(String decide) {
		// TODO Auto-generated method stub
		super.setDecide(decide);
	}
	@Override
	public String getCartISBN() {
		// TODO Auto-generated method stub
		return super.getCartISBN();
	}
	@Override
	public void setCartISBN(String cartISBN) {
		// TODO Auto-generated method stub
		super.setCartISBN(cartISBN);
	}
	
	
	
	
	
	
	
	

	
	


	

	
	             
	
	
	
	
	
}
