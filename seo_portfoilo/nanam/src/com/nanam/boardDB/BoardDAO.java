package com.nanam.boardDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import util.DBManager;

public class BoardDAO {
	
	private static BoardDAO getInstance=new BoardDAO(); 
	
	public static BoardDAO getInstance(){
		
		return getInstance;
		
	}
	
	
	boolean isDelete;
	
	public Board writeInsert(String list,String subject,String content) {
		System.out.println("insetQna()");
		int result=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		Board b=null;
		

      try {


    	  conn = DBManager.getConnection();
    	  String sql = "INSERT into board(qseq,list, subject, content) values (qseq.nextval,?,?,?)";

    	  pstmt = conn.prepareStatement(sql);
    	  
    	  

    	  b=new Board();
    	  
    	  pstmt.setString(1, list);
    	  pstmt.setString(2, subject);
    	  pstmt.setString(3, content);
    

    	  
    	  b.setContent(content);
    	  b.setList(list);
    	  b.setSubject(subject);
    	  
    	  result=pstmt.executeUpdate();

    	 return b;
    	  


       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	return b;
    
      
   }
	
	
	
	public ArrayList<Board> selectEssay() {
		System.out.println("selectQna()");
	
		ResultSet rset=null;
		Connection conn = null;
	
	
		Statement stmt=null;
		
		ArrayList<Board> list=null;
        PreparedStatement pstmt=null;
		
      try {
    	  list=new ArrayList<Board>();
    	  
    	  conn = DBManager.getConnection();
    	
    	  
    	  stmt=conn.createStatement();
    	    	  
    	  rset=stmt.executeQuery("SELECT * FROM board where list='essay'");
    	  
    	  
    	  
    	while(rset.next()) {
    	
    		  Board b=new Board();
    		
    		  b.setAdjustIndate(rset.getTimestamp("adjustIndate"));
    		  b.setContent(rset.getString("content"));
    		  b.setList(rset.getString("list"));
    		  b.setSubject(rset.getString("subject"));
    		  b.setQseq(rset.getInt("qseq"));
    		  System.out.println("셀렉트 푸름");
    		  
    		  
    		  list.add(b);
    		  
    		  
    		  
    		  
    	  }
    	return list;
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return list;
    
      
   }
	

	public ArrayList<Board> selectNanam() {
		System.out.println("selectQna()");
	
		ResultSet rset=null;
		Connection conn = null;
	
	
		Statement stmt=null;
		
		ArrayList<Board> list=null;
        PreparedStatement pstmt=null;
		
      try {
    	  list=new ArrayList<Board>();
    	  
    	  conn = DBManager.getConnection();
    	
    	  
    	  stmt=conn.createStatement();
    	    	  
    	  rset=stmt.executeQuery("SELECT * FROM board where list='nanam' ");
    	  
    	  
    	  
    	while(rset.next()) {
    	
    		  Board b=new Board();
    
    		  b.setAdjustIndate(rset.getTimestamp("adjustIndate"));
    		  b.setContent(rset.getString("content"));
    		  b.setList(rset.getString("list"));
    		  b.setSubject(rset.getString("subject"));
    		  b.setQseq(rset.getInt("qseq"));
    		  System.out.println("셀렉트 푸름");
    		  
    		  
    		  list.add(b);
    		  
    		  
    		  
    		  
    	  }
    	return list;
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return list;
    
      
   }
	
	

	public ArrayList<Board> selectNotice() {
		System.out.println("selectQna()");
	
		ResultSet rset=null;
		Connection conn = null;
	
	
		Statement stmt=null;
		
		ArrayList<Board> list=null;
        PreparedStatement pstmt=null;
		
      try {
    	  list=new ArrayList<Board>();
    	  
    	  conn = DBManager.getConnection();
    	
    	  
    	  stmt=conn.createStatement();
    	    	  
    	  rset=stmt.executeQuery("SELECT * FROM board where list='notice'");
    	  
    	  
    	  
    	while(rset.next()) {
    	
    		  Board b=new Board();
    	
    		  b.setAdjustIndate(rset.getTimestamp("adjustIndate"));
    		  b.setContent(rset.getString("content"));
    		  b.setList(rset.getString("list"));
    		  b.setSubject(rset.getString("subject"));
    		  b.setQseq(rset.getInt("qseq"));
    		  System.out.println("셀렉트 푸름");
    		  
    		  
    		  list.add(b);
    		  
    		  
    		  
    		  
    	  }
    	return list;
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return list;
    
      
   }


	public Board showDetail(String list,String subject) {
		System.out.println("selectQna()");
	
		
		Connection conn = null;

		PreparedStatement pstmt=null;

		ResultSet rset=null;
        
		ArrayList<Board> li=null;
		Board b=null;
      try {
    	  
    	  
    	  
    	  String sql="SELECT * FROM board where list=? AND subject=?";
    	  
    	  conn = DBManager.getConnection();
    	
    	  
    	
    	  pstmt=conn.prepareStatement(sql);
    	 
    	  pstmt.setString(1,list);
    	  pstmt.setString(2,subject);

    	  rset=pstmt.executeQuery();

    		if(rset.next()) {
    		  b=new Board();
    		  b.setAdjustIndate(rset.getTimestamp("adjustIndate"));
    		  b.setContent(rset.getString("content"));
    		  b.setList(rset.getString("list"));
    		  b.setSubject(rset.getString("subject"));
    		  b.setQseq(rset.getInt("qseq"));
    		  System.out.println("showDetail");
    		  return b;
    		 
    		}
    		 
    		
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn,pstmt);
         
      }
	return b;
    
      
   }

 
	public Board selectDetail(String list,String subject, String content) {
		System.out.println("selectDetail()");
	
		ResultSet rset=null;
		Connection conn = null;
	
	
	
		Board b=null;
		
        PreparedStatement pstmt=null;
		
      try {
    	
    	  
    	  conn = DBManager.getConnection();
    	
    	  String sql="SELECT * FROM board WHERE list=? AND subject=?   AND content=?";
    	  
    	  pstmt=conn.prepareStatement(sql);
    	  
    	  
    	  pstmt.setString(1, list);
    	  pstmt.setString(2, subject);
    	  pstmt.setString(3, content);
    	  
    	  rset=pstmt.executeQuery();
    	  
    	 
    	  
    	  
    	  
    	while(rset.next()) {
    	
    		  b=new Board();
    		  b.setAdjustIndate(rset.getTimestamp("adjustIndate"));
    		  b.setContent(rset.getString("content"));
    		  b.setList(rset.getString("list"));
    		  b.setSubject(rset.getString("subject"));
    		  b.setQseq(rset.getInt("qseq"));
    		
    		  System.out.println("셀렉트 푸름");
    		  
    		  
    	
    		  
    		  
    		  
    		  
    	  }
    	return b;
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return b;
    
      
   }
	
	
	
	public Board update(String qseq,String subject, String content) {
		System.out.println("updateboard()");
		int result = 0;
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		Board b=null;

		
      
      try {
    	 

    	 conn = DBManager.getConnection();

         String sql = "UPDATE board SET subject=?, content=? where qseq=?" ;
         
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, subject);
         pstmt.setString(2, content);
         pstmt.setString(3, qseq);
         
         
         
         result = pstmt.executeUpdate();
         b=new Board();
         b.setContent(content);
         b.setSubject(subject);
         
         return b;
        
         
   
     
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
      isDelete=false;
	return b;
	

      
   }
	
	
	public Board delete(String qseq,String subject, String content) {
		System.out.println("updateboard()");
		int result = 0;
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		Board b=null;

		
      
      try {
    	 

    	 conn = DBManager.getConnection();

         String sql = "DELETE FROM board where subject=? And content=? And qseq=?" ;
         
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, subject);
         pstmt.setString(2, content);
         pstmt.setString(3, qseq);
         
         
         
         result = pstmt.executeUpdate();
         b=new Board();
         b.setContent(content);
         b.setSubject(subject);
         
         return b;
        
         
   
     
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
      isDelete=false;
	return b;
	

      
   }
	
	
	
	
	
}



