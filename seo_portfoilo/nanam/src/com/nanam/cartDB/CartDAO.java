package com.nanam.cartDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBManager;

public class CartDAO {

	private static CartDAO getInstance=new CartDAO(); 

	public static  CartDAO getInstance(){

		return getInstance;

	}
	
	public void insertCart(Cart cart) {
		
		int result=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
      try {
    	 
    	
    	 
    	  conn = DBManager.getConnection();
    	  
    	  
    	  String sql = "INSERT into cart(cartseq, cartId, cartBookTitle, cartBookPrice, cartBookImageName,cartISBN) values (cartseq.nextval,?,?,?,?,?)";

    	  
    	  pstmt = conn.prepareStatement(sql);
    	  
    	
    	  pstmt.setString(1, cart.getCartId());
    	  pstmt.setString(2, cart.getCartBookTitle());
    	  pstmt.setInt(3, cart.getCartBookPrice());
    	  pstmt.setString(4, cart.getCartBookImageName());
    	  pstmt.setString(5, cart.getCartISBN());
    	  
    	  
    	  result=pstmt.executeUpdate();
    	 
    	
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	
      
   }
		
	

	
	
	
		
	public ArrayList<Cart> selectCart(String cartId ) {
		
		
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		Cart cart=null;
		
		ArrayList<Cart> cartList=null;
		
      try {
    	
    	
    	 
    	  
    	
    	  cartList=new ArrayList<Cart>();
    	 
    	  conn = DBManager.getConnection();
    	  String sql = "select * From cart Where cartId=? AND decide='n'";

    	  
    	  pstmt = conn.prepareStatement(sql);
    	  
    	  
    	  pstmt.setString(1, cartId);
    	
    	 
    	  rset=pstmt.executeQuery();
    	 
    	
    	
    	while(rset.next()) {
    		
    		
    		cart=new Cart();
    		cart.setCartBookImageName(rset.getString("CartBookImageName"));
    		cart.setCartBookPrice(rset.getInt("CartBookPrice"));
    		cart.setCartBookTitle(rset.getString("CartBookTitle"));
    		cart.setCartId(rset.getString("cartId"));
    		cart.setCartDate(rset.getTimestamp("cartDate"));
    		cart.setCartISBN(rset.getString("cartISBN"));
    		cart.setDecide(rset.getString("decide"));
    		
    		
    		cartList.add(cart);
    	  }
    	
    		
    		
		
    		
    	
    	
    	return cartList;
		
    	 
    	
    	


       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	return cartList;
    
      
   }	
		
	
	public Cart decideOrder(String cartId,String cartISBN) {
		
		int result=0;
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		Cart cart=null;
		
		
		
      try {

    	
    	 
    	 
    	  conn = DBManager.getConnection();
    	  String sql = "UPDATE cart SET decide = 'o' where cartid=? And cartISBN=? And cartdate<sysdate";

    	
    	  pstmt = conn.prepareStatement(sql);
    	  
    	
    	  
    	  
    	  
    	  pstmt.setString(1, cartId);
    	  pstmt.setString(2, cartISBN);
    	
    	  
    	  
    	  
    	  
    	  result = pstmt.executeUpdate();
    	 
    	  
    	  
    	  
    	  String sql2 = "select * from cart  where cartid=?";
    	  
    	  pstmt2=conn.prepareStatement(sql2);
    	  
    	  pstmt2.setString(1, cartId);
    	  
    	  rset=pstmt2.executeQuery();
    	 if(rset.next()) {
    		 
    		cart=new Cart();
    		 
    		
    		cart.setDecide(rset.getString("decide"));
    		
    		System.out.println(cart.getDecide());

      	  return cart;
    		 
    		 
    	 }

    	  

       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	return cart;

    
      
   }	
	
	
	
	
	
	public void deleteCart(String title,String cartISBN) {
		
		int result=0;
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		Cart cart=null;
		ArrayList<Cart> cartList=null;
		
      try {

    	
    	  cartList=new ArrayList<Cart>();
    	 
    	  conn = DBManager.getConnection();
    	  String sql = "delete From cart Where cartBookTitle=? AND CARTISBN=?";

    	  
    	  pstmt = conn.prepareStatement(sql);
    	  
    	  
    	  pstmt.setString(1, title);
    	  pstmt.setString(2, cartISBN);
    	 
    	  
    	  
    	  result=pstmt.executeUpdate();
    	 
    	 

       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	
    
      
   }	
	
	
	
	
	
	
	
	
}
