package com.nanam.orderBookDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.nanam.boardDB.Board;
import com.nanam.buyDB.Buy;
import com.nanam.cartDB.Cart;
import com.nanam.cartDB.CartDAO;
import com.nanam.memberDB.Member;
import com.nanam.pointDB.Point;

import util.DBManager;

public class OrderBookDAO  {
	
	
	private static OrderBookDAO getInstance=new OrderBookDAO(); 

	public static  OrderBookDAO getInstance(){

		return getInstance;
	}

	
	public ArrayList<Buy> selectOrderView(ArrayList<Buy> buyList) {
		
		
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		Buy buy=null;
		
		
		
		ArrayList<Buy> buyList2=null;
		
      try {
    	  
    	  
    	  

    	
    	  buyList2=new  ArrayList<Buy>();
    	 
    	  conn = DBManager.getConnection();
    	  
    	  
    	  String sql2="insert into orderview (orderviewseq,orderviewBOOKTITLE,orderviewBOOKPRICE,orderviewBOOKIMAGENAME,orderviewid ) values(orderviewseq.nextval,?,?,?,?)";
   
    	  pstmt2=conn.prepareStatement(sql2);
    	  
    	  
    	  
    	 
    	  for(int i=0; i<buyList.size(); i++) {
    		  
    		  pstmt2.setString(1, buyList.get(i).getCartBookTitle());
    		  pstmt2.setInt(2, buyList.get(i).getBuyEachPrice());
    		  pstmt2.setString(3, buyList.get(i).getCartBookImageName());

    		  pstmt2.setString(4, buyList.get(i).getBuyId());
    	 
    		  int result2=pstmt2.executeUpdate();
    	  }
    	  
    	 

    	 
    	

    	  
    	  
    	  String sql = "update orderview set ORDERviewNUM =?, ORDERTOTAL=? where orderviewid=? And orderdecide='n'";

    	  
    	  pstmt = conn.prepareStatement(sql);
    	  
    	  for(int i=0; i<buyList.size(); i++) {
    		  pstmt.setInt(1, buyList.get(i).getBuyEachNum());
    		  pstmt.setInt(2, buyList.get(i).getBuyTotalPrice());
    		  pstmt.setString(3,buyList.get(i).getBuyId());
    		  
    		  int result=pstmt.executeUpdate();
    	  
    	  }
    	
    	  
    	 
    	  
    	  
    	  String sql3="select * from orderview where orderviewid=? And orderdecide='n'";
    	  
    	  pstmt3= conn.prepareStatement(sql3);
    	  
    	  
    	  
    	  for(int i=0; i<buyList.size(); i++) {
    		  pstmt3.setString(1,buyList.get(i).getBuyId());
    	  
    	  }
    	  
    	  
    	  
    	  rset=pstmt3.executeQuery();
    	  
    	 while(rset.next()) {
    		 buy=new Buy();
    		 buy.setCartBookImageName(rset.getString("orderviewBOOKIMAGENAME"));
    		 buy.setCartBookPrice(rset.getInt("orderviewBOOKPRICE"));
    		 buy.setCartBookTitle(rset.getString("orderviewBOOKTITLE"));
    		 buy.setCartId(rset.getString("orderviewid"));
    		 buy.setBuyEachNum(rset.getInt("ORDERviewNUM"));
    		 buy.setBuyTotalPrice(rset.getInt("ORDERTOTAL"));
    		
    		
    		buyList2.add(buy);
    		
    		
    	  }
    	 
    	 
    	
    	 
    	
    	return buyList2;


       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	return  buyList2;
    
      
   }	
	
	
	
	
	public void orderInfoInsert(String orderName,String orderPhone,String orderEmail,String orderDetailAddress,String orderCall,String orderZipcode,String orderAddress,String orderTotal,String orderId,ArrayList<OrderBook> orderList) {
		
	
		OrderBook order=null;
		int result=0;
		int result2=0;
		int result3=0;
		int result4=0;
		int result5=0;
		int result6=0;
		
		int result7=0;
		int result8=0;
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		
		PreparedStatement pstmt5 = null;
		PreparedStatement pstmt6 = null;
		PreparedStatement pstmt7 = null;
		PreparedStatement pstmt8 = null;
		int total=Integer.parseInt(orderTotal);

      try {


    	  conn = DBManager.getConnection();

    	  
    	  String sql = "INSERT into orderinfo (orderinfoseq,orderName, orderPhone, orderEmail, orderDetailAddress,orderZipcode,orderAddress,orderCall,orderId) values (orderinfoseq.nextval,?,?,?,?,?,?,?,?)";

    	  pstmt = conn.prepareStatement(sql);
    	  
    	  
    	  for(int i=0; i<orderList.size(); i++ ) {
    		  pstmt.setString(1, orderName);
    		  pstmt.setString(2, orderPhone);
    		  pstmt.setString(3, orderEmail);
    		  pstmt.setString(4, orderDetailAddress);
    		  pstmt.setString(5, orderZipcode);
    		  pstmt.setString(6, orderAddress);
    		  pstmt.setString(7, orderCall);
    		  pstmt.setString(8, orderId);


    		  result=pstmt.executeUpdate();

    	  }
    	  
    	  String sql5="update point set  totalindate =sysdate where pointId=?";
    	  
    	  
    	  pstmt5=conn.prepareStatement(sql5);
    	  
    	  pstmt5.setString(1, orderId);
    	  
    	  result5=pstmt5.executeUpdate();
    	  
    	  
    	  

    	
    	  
    	  
    	  String sql4="update total  set  buypoint = (SELECT  sum(pointsize)   FROM point where pointid=? ) ";
    	  
    	  pstmt4=conn.prepareStatement(sql4);
    	  
    	  pstmt4.setString(1, orderId);
    	 
    	  result4=pstmt4.executeUpdate();
    	  
    	  
    	  
    	  
    	  
    	  String sql3="update total set buyTotalPrice =(SELECT sum(orderviewBookPrice)  FROM orderview where orderviewid=? ) ";
    	  
    	  pstmt3=conn.prepareStatement(sql3);
    	  
    	  
    	  pstmt3.setString(1, orderId);
    	  
    	  
    	  result3=pstmt3.executeUpdate();
    	  
    	  
    	  
    	  String sql7="insert into pay (payid,payBOOKTITLE,payBOOKPRICE,paybooknum) (Select o.orderviewid,o.orderviewBOOKTITLE ,o.orderviewBOOKPRICE,o.ORDERviewNUM  from orderview o where  orderviewid=?)";
    	  
    	  pstmt7=conn.prepareStatement(sql7);
   
    	  pstmt7.setString(1, orderId);
    	  
    	  
    	  result7=pstmt7.executeUpdate();
    	  
    	 
    	  
    	  
    	  	
    	  
    	 String sql8="delete from orderview  where  orderviewid=?";
    	  
    	  pstmt8=conn.prepareStatement(sql8);
    	  
    	  pstmt8.setString(1, orderId);
    	  
    	  result8=pstmt8.executeUpdate();
    	
    	  
    	 
    	 
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	
      
    
	
		
	}
	
	
	
	
	
	public ArrayList<Buy> afterPay(String payId) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rset=null;
		
		Buy b=null;
		
		ArrayList<Buy> bList=null;

      try {


    	 
    	  conn=DBManager.getConnection();
    	 
    	  String sql2="update cart set decide='f' where cartid=? ";
    	  
    	  pstmt2=conn.prepareStatement(sql2);
    	  
    	  pstmt2.setString(1, payId);
    	  
    	  int result2=pstmt2.executeUpdate();
    	  
    	  
    	  
    	  String sql="SELECT * FROM pay where  payid =? And PAYDECIDE='n'  ";
    	  
    	  pstmt =conn.prepareStatement(sql);
    	  
    	  pstmt.setString(1, payId);
    	
    	  rset=pstmt.executeQuery();
    	  
    	  bList=new ArrayList<Buy>();
    	  
    	  while(rset.next()) {
    		  
    		 System.out.println("paylist");
    		  
    		   b=new Buy();
			  
			   
			   b.setCartBookTitle(rset.getString("PAYBOOKTITLE"));
			   b.setCartBookPrice(rset.getInt("PAYBOOKPRICE"));
			   b.setBuyEachNum(rset.getInt("PAYBOOKNUM"));
			   
			   
			   bList.add(b);
    	  }
    	  
    	  
    	  
    	  
    	  String sql4="update pay set PAYDECIDE='f' where payid=? ";
    	  
    	  pstmt4=conn.prepareStatement(sql4);
    	  
    	  pstmt4.setString(1, payId);
    	  
    	  int result4=pstmt4.executeUpdate();
    	  
    	  
    
    	return bList;
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
      return bList;
	
    
	
		
	}
	

	public Member afterPayPoint(String payId,String payPhone,String payPoint) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt5 = null;
		PreparedStatement pstmt4 = null;
		ResultSet rset=null;
		ResultSet rset2=null;
		ResultSet rset3=null;
		Member member=null;
	
		
		int point=Integer.parseInt(payPoint);
		
		System.out.println("point ::"+point);

      try {


    	  conn = DBManager.getConnection();
    	
    	  
    	  String sql5="insert into point (pointsize,pointid,pointPhone) (select buytotalPrice*-1, totalid, totalphone from total  where buytotalPrice=? And totalid=? And totalphone=? )";
    	 
    	  
    	  pstmt5=conn.prepareStatement(sql5);
    	  
    	  
    	  pstmt5.setInt(1, point);
    	  pstmt5.setString(2, payId);
    	  pstmt5.setString(3,payPhone);
    	  
    	  int result5=pstmt5.executeUpdate();
    	  
    	  //
    	  
    	  String sql="SELECT sum(p.pointsize) addPoint from point p,member m where m.id=p.pointid And m.phone=p.pointPhone And p.pointid=? And p.pointPhone=?  ";
    	  
    	  pstmt=conn.prepareStatement(sql);
    	  
    	  pstmt.setString(1, payId);
    	  pstmt.setString(2, payPhone);
    	  
    	  
    	  rset=pstmt.executeQuery();
    	  
    	  
    	  String sql4="update point set pointfin=(select sum(pointsize) from point,member where pointid=id And pointPhone =phone  And pointid=?  And pointphone=? )";
    	  
    	  
    	  pstmt4=conn.prepareStatement(sql4);
    	  
    	  pstmt4.setString(1, payId);
    	  pstmt4.setString(2, payPhone);
    	 
    	  
    	  int result4=pstmt4.executeUpdate();
    	  
    	  
    	  String sql3="SELECT * from member m , point p where m.id=p.pointId And m.id=?";
    	  
    	  pstmt3=conn.prepareStatement(sql3);
    	  
    	  pstmt3.setString(1, payId);
    	
    	  
    	  rset3=pstmt3.executeQuery();
    	  
    	  
    	 
    	  
    	  
    	  
    	  
    	 if(rset.next() && rset3.next()) {
    		 
    		 
    		  member=new Member();
    		
    		  
    		  member.setPhone(rset3.getString("phone"));
    		  member.setEmail(rset3.getString("email"));
    		  member.setId(rset3.getString("id"));
    		  member.setPwd(rset3.getString("pwd"));
    		  member.setName(rset3.getString("name"));
    		  member.setZipcode(rset3.getString("zipcode"));
    		  member.setDetailAddress(rset3.getString("detailAddress"));
    		  member.setAddress(rset3.getString("address"));
    		  member.setPoint(rset.getInt("addPoint"));
    		  
    		  System.out.println("포인트 주소"+member.getAddress());
    		  System.out.println("포인트 포인트 아이디"+member.getPoint());

        	  return member;
    	  }
    	
    	
   	  
   	  
   	  
    	 
    
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
      return member;
	
    
	
		
	}


	public Buy changePayTable(String payId, String payTitle, int payPrice, int payNum) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset=null;
		int result=0;
		Buy b=null;
	

      try {


    	 
    	 conn=DBManager.getConnection();
    	 
    	 String sql="update pay set paydecide='f'  where payId=? And PAYBOOKTITLE=? And PAYBOOKPRICE=? And PAYBOOKNUM=? ";
    	 
    	 pstmt=conn.prepareStatement(sql);
    	 
    	 pstmt.setString(1, payId);
    	 
    	 pstmt.setString(2, payTitle);
    	 
    	 pstmt.setInt(3, payPrice);
    	 
    	 pstmt.setInt(4, payNum);
    	 
    	 result=pstmt.executeUpdate();
    	 
       
    	 String sql2 = "select * from pay  where payid=?";
   	  
    	 pstmt2=conn.prepareStatement(sql2);
   	  
   	  	 pstmt2.setString(1, payId);
   	  
   	  	 rset=pstmt2.executeQuery();
   	  	 
   	  	 if(rset.next()) {
   		 
   	  		 b=new Buy();
   		 
   	  		 //b.set
   	  		 b.setBuyDecide(rset.getString("paydecide"));
   		
   	  		 return b;   		 
   		 
   	 }
    	 
    	 
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	return b;
      
		
		
		
	}
	
	
public void deletePayList(String payId) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result=0;
		Buy b=null;
	

      try {


    	 
    	 conn=DBManager.getConnection();
    	 
    	 String sql="delete from orderview where ORDERVIEWID =? And ORDERDECIDE='n'";
    	 
    	 pstmt=conn.prepareStatement(sql);
    	 
    	 pstmt.setString(1, payId);
    	 
    	 
    	 
    	 result=pstmt.executeUpdate();
    	 
       
    	
    	 
    	 
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }

      
		
		
		
	}
	
	
	
	
	
}