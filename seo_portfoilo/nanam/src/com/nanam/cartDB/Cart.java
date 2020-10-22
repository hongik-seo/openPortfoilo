package com.nanam.cartDB;

import java.sql.Timestamp;

import com.nanam.buyDB.Buy;


public class Cart  {
	
	
	private String cartId;
	private String cartBookTitle;
	private int cartBookPrice;
	private String cartBookImageName;
	private Timestamp cartDate;
	private String decide;
	private String cartISBN;
	

	
	public Cart() {}
    
	public Cart(String cartBookTitle ,int  cartBookPrice, String cartBookImageName, String cartId, String cartISBN){
		
		this.cartBookTitle=cartBookTitle;
		this.cartBookPrice=cartBookPrice;
		this.cartBookImageName=cartBookImageName;
		this.cartId=cartId;
		this.cartISBN=cartISBN;
		
	}
	
	
  

	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}
	public String getCartBookTitle() {
		return cartBookTitle;
	}
	public void setCartBookTitle(String cartBookTitle) {
		this.cartBookTitle = cartBookTitle;
	}
	public int getCartBookPrice() {
		return cartBookPrice;
	}
	public void setCartBookPrice(int cartBookPrice) {
		this.cartBookPrice = cartBookPrice;
	}
	public String getCartBookImageName() {
		return cartBookImageName;
	}
	public void setCartBookImageName(String cartBookImageName) {
		this.cartBookImageName = cartBookImageName;
	}
	public Timestamp getCartDate() {
		return cartDate;
	}
	public void setCartDate(Timestamp cartDate) {
		this.cartDate = cartDate;
	}
	public String getDecide() {
		return decide;
	}
	public void setDecide(String decide) {
		this.decide = decide;
	}

	public String getCartISBN() {
		return cartISBN;
	}

	public void setCartISBN(String cartISBN) {
		this.cartISBN = cartISBN;
	}

	
	

    
    
    
}
	


