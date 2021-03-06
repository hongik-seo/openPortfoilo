package com.nanam.pointDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.nanam.bookDB.BookDAO;
import com.nanam.memberDB.Member;
import com.nanam.memberDB.MemberDAO;

import util.DBManager;

public class PointDAO {


	private static PointDAO getInstance=new PointDAO(); 

	public static  PointDAO getInstance(){

		return getInstance;

	}
	
	
	


	public Member selectPointSum(String id,String phone,int point) {
		System.out.println("selectPoint()");
		
		Connection conn = null;
		
		ResultSet rset=null;
		ResultSet rset3=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		PreparedStatement pstmt4=null;
		PreparedStatement pstmt5=null;
		Member member = null;
		
      try {

    	 
    	  conn = DBManager.getConnection();
    	  
    	  String sql2="insert into point (pointId, pointPhone ,pointsize) values(?,?,?)";
    	  
    	  pstmt2=conn.prepareStatement(sql2);
    	  
    	  
    	  pstmt2.setString(1, id);
    	  pstmt2.setString(2, phone);
    	  pstmt2.setInt(3, point);
    	  
    	  int result2=pstmt2.executeUpdate();
    	  
    	  
    	  String sql="SELECT sum(p.pointsize) addPoint from point p,member m where m.id=p.pointid And m.phone=p.pointPhone And p.pointid=? And p.pointPhone=?  ";
    	  
    	  pstmt=conn.prepareStatement(sql);
    	  
    	  pstmt.setString(1, id);
    	  pstmt.setString(2, phone);
    	  
    	  
    	  rset=pstmt.executeQuery();
    	  
    	  
    	  
    	 String sql3="SELECT * from member m , point p where m.id=p.pointId And m.id=?";
    	  
    	  pstmt3=conn.prepareStatement(sql3);
    	  
    	  pstmt3.setString(1, id);
    	
    	  
    	  rset3=pstmt3.executeQuery();
    	  
    	  
    	  String sql4="update point set pointfin=(select sum(pointsize) from point,member where pointid=id And pointPhone =phone  And   pointid=?   And pointphone=? )";
    	  
    	  
    	  pstmt4=conn.prepareStatement(sql4);
    	  
    	  pstmt4.setString(1, id);
    	  pstmt4.setString(2, phone);
    	 
    	  
    	 int result4=pstmt4.executeUpdate();
    	  
    	  
    	  
    	  
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
    		  
    		  System.out.println("포인트에서 멤버"+member.getAddress());
    		  System.out.println("포인트에서 포인트"+member.getPoint());

        	  return member;
    	  }
    	  
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn,pstmt);
         
      }
	return member;
	
	
	
	}	
	
	
	
	
	public Point selectPointPay(String payId,String payPhone) {
		System.out.println("selectPoint()");
		
		Connection conn = null;
		
		ResultSet rset=null;
		ResultSet rset3=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt3=null;
		PreparedStatement pstmt4=null;
		PreparedStatement pstmt5=null;
		
		Point pointResult=null;
      try {

    	 
    	  conn = DBManager.getConnection();
    	  

    	  
    	  String sql="SELECT sum(p.pointsize) addPoint from point p,member m where m.id=p.pointid And m.phone=p.pointPhone And p.pointid=? And p.pointPhone=?  ";
    	  
    	  pstmt=conn.prepareStatement(sql);
    	  
    	  pstmt.setString(1, payId);
    	  pstmt.setString(2, payPhone);
    	  
    	  
    	  rset=pstmt.executeQuery();
    	  
    	  
    	  
    	  
    	  String sql4="update point set pointfin=(select sum(pointsize) from point,member where pointid=id And pointPhone =phone  And   pointid=?   And pointphone=? )";
    	  
    	  
    	  pstmt4=conn.prepareStatement(sql4);
    	  
    	  pstmt4.setString(1, payId);
    	  pstmt4.setString(2, payPhone);
    	 
    	  
    	 int result4=pstmt4.executeUpdate();
    	  
    	  
    	  
    	  
    	 if(rset.next() ) {
    		 pointResult=new Point();
    		 
    		 
    		 pointResult.setFinPoint(rset.getInt("addPoint"));

        	 
    		 
    		 return pointResult;
    	  }
    	  
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn,pstmt);
         
      }
	return pointResult;
	
	
	
	}	
	
	
	
	
	
}
