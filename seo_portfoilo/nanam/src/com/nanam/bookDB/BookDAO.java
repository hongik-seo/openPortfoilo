package com.nanam.bookDB;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import util.DBManager;

public class BookDAO {
	
	private static BookDAO getInstance=new BookDAO(); 
	
	public static BookDAO getInstance(){
		
		return getInstance;
		
	}
	
	

	
	public Book InsertBook(String bookTitle,String bookAuthor,String price, String bookSize,String bookPage,String bookDate,String  ISBN,String bookContent,String bookList,String imagePath, String imgName,String bookIndex,String bookAuthorIntroduce) {
		System.out.println("insetBook()");
		int result=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		Book bk=null;
		
		
      try {

    	 
    	  conn = DBManager.getConnection();
    	  String sql = "INSERT into book(bookseq,BOOKTITLE ,BOOKAUTHOR , BOOKPRICE, BOOKSIZE, BOOKPAGE, BOOKDATE, ISBN, BOOKCONTENT, BOOKLIST,imagePath,imageName,bookIndex,bookAuthorIntroduce ) values (bookseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    	  pstmt = conn.prepareStatement(sql);
    	  
    	  int bookPrice=Integer.parseInt(price);
    	
    	  bk=new Book();
    	  
    	  pstmt.setString(1, bookTitle);
    	  pstmt.setString(2, bookAuthor);
    	  pstmt.setInt(3, bookPrice);
    	  pstmt.setString(4, bookSize);
    	  pstmt.setString(5, bookPage);
    	  pstmt.setString(6, bookDate);
    	  pstmt.setString(7, ISBN);
    	  pstmt.setString(8, bookContent);
    	  pstmt.setString(9, bookList);
    	  pstmt.setString(10, imagePath);
    	  pstmt.setString(11,imgName);
    	  pstmt.setString(12, bookIndex);
    	  pstmt.setString(13, bookAuthorIntroduce);
    	  
 
    	  result=pstmt.executeUpdate();

    	  bk.setBookAuthor(bookAuthor);
    	  bk.setBookContent(bookContent);
    	  bk.setBookDate(bookDate);
    	  bk.setBookList(bookList);
    	  bk.setBookPage(bookPage);
    	  bk.setBookPrice(bookPrice);
    	  bk.setBookSize(bookSize);
    	  bk.setBookTitle(bookTitle);
    	  bk.setISBN(ISBN);
    	  bk.setImagePath(imagePath);
    	  bk.setImgName(imgName);
    	  bk.setBookIndex(bookIndex);
    	  bk.setBookAuthorIntroduce(bookAuthorIntroduce);
    	  
    	  
    	  
    	 
    	 return bk;
    	  


       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
	return bk;
    
      
   }
	

	
	public ArrayList<Book> selectNewBook() {
		
	
		ResultSet rset=null;
		Connection conn = null;
	
	
		Statement stmt=null;
		
		ArrayList<Book> boList=null;
        PreparedStatement pstmt=null;
		
      try {
    	  boList=new ArrayList<Book>();
    	  
    	  conn = DBManager.getConnection();
    	
    	  
    	  stmt=conn.createStatement();
    	    	  
    	  rset=stmt.executeQuery("SELECT * FROM book where bookList='hot'");
    	  
    	  
    	  
    	while(rset.next()) {
    	
    		  Book bk=new Book();
    		    
    		  bk.setBookAuthor(rset.getString("bookAuthor"));
    		  bk.setBookContent(rset.getString("bookContent"));
    		  bk.setBookDate(rset.getString("bookDate"));
    		  bk.setBookList(rset.getString("bookList"));
    		  bk.setBookPage(rset.getString("bookPage"));
    		  bk.setBookPrice(rset.getInt("bookPrice"));
    		  bk.setBookSize(rset.getString("bookPage"));
    		  bk.setBookTitle(rset.getString("bookTitle"));
    		  bk.setImagePath(rset.getString("imagePath"));
    		  bk.setImgName(rset.getString("imageName"));
    		  bk.setISBN(rset.getString("ISBN"));
    		  bk.setBookIndex(rset.getString("bookIndex"));
    		  bk.setBookAuthorIntroduce(rset.getString("bookAuthorIntroduce"));
    		  
    		  boList.add(bk);
    		  
 
    		  
    	  }
    	
    	
    	return boList;
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return boList;
    
      
   }
	
	public ArrayList<Book> selectNanamBook() {
		
		
		ResultSet rset=null;
		Connection conn = null;
	
	
		Statement stmt=null;
		
		ArrayList<Book> boList=null;
        PreparedStatement pstmt=null;
		
      try {
    	  boList=new ArrayList<Book>();
    	  
    	  conn = DBManager.getConnection();
    	
    	  
    	  stmt=conn.createStatement();
    	    	  
    	  rset=stmt.executeQuery("SELECT * FROM book where bookList='nBook'");
    	  
    	  
    	  
    	while(rset.next()) {
    	
    		  Book bk=new Book();
    		    
    		  bk.setBookAuthor(rset.getString("bookAuthor"));
    		  bk.setBookContent(rset.getString("bookContent"));
    		  bk.setBookDate(rset.getString("bookDate"));
    		  bk.setBookList(rset.getString("bookList"));
    		  bk.setBookPage(rset.getString("bookPage"));
    		  bk.setBookPrice(rset.getInt("bookPrice"));
    		  bk.setBookSize(rset.getString("bookPage"));
    		  bk.setBookTitle(rset.getString("bookTitle"));
    		  bk.setImagePath(rset.getString("imagePath"));
    		  bk.setImgName(rset.getString("imageName"));
    		  bk.setISBN(rset.getString("ISBN"));

    		  bk.setBookIndex(rset.getString("bookIndex"));
    		  bk.setBookAuthorIntroduce(rset.getString("bookAuthorIntroduce"));
    		  boList.add(bk);
    		  
 
    		  
    	  }
    	
    	
    	return boList;
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return boList;
    
      
   }
	
	
	
	
	public ArrayList<Book> selectSteadyBook() {
		
		
		ResultSet rset=null;
		Connection conn = null;
	
	
		Statement stmt=null;
		
		ArrayList<Book> boList=null;
        PreparedStatement pstmt=null;
		
      try {
    	  boList=new ArrayList<Book>();
    	  
    	  conn = DBManager.getConnection();
    	
    	  
    	  stmt=conn.createStatement();
    	    	  
    	  rset=stmt.executeQuery("SELECT * FROM book where bookList='steady'");
    	  
    	  
    	  
    	while(rset.next()) {
    	
    		  Book bk=new Book();
    		    
    		  bk.setBookAuthor(rset.getString("bookAuthor"));
    		  bk.setBookContent(rset.getString("bookContent"));
    		  bk.setBookDate(rset.getString("bookDate"));
    		  bk.setBookList(rset.getString("bookList"));
    		  bk.setBookPage(rset.getString("bookPage"));
    		  bk.setBookPrice(rset.getInt("bookPrice"));
    		  bk.setBookSize(rset.getString("bookPage"));
    		  bk.setBookTitle(rset.getString("bookTitle"));
    		  bk.setImagePath(rset.getString("imagePath"));
    		  bk.setImgName(rset.getString("imageName"));
    		  bk.setISBN(rset.getString("ISBN"));
    		  

    		  bk.setBookIndex(rset.getString("bookIndex"));
    		  bk.setBookAuthorIntroduce(rset.getString("bookAuthorIntroduce"));
    		  boList.add(bk);
    		  
 
    		  
    	  }
    	
    	
    	return boList;
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return boList;
    
      
   }


	

 
	public Book selectBookDetail(String bookList,String ISBN) {
		System.out.println("selectBookDetail()");
	
		ResultSet rset=null;
		Connection conn = null;
	
	
	
		Book bk=null;
		
        PreparedStatement pstmt=null;
		
      try {
    	
    	  
    	  conn = DBManager.getConnection();
    	
    	  String sql="SELECT * FROM book WHERE bookList=? AND ISBN=?";
    	  
    	  pstmt=conn.prepareStatement(sql);
    	  
    	  
    	  pstmt.setString(1, bookList);
    	  pstmt.setString(2, ISBN);
    	  
    	  
    	  rset=pstmt.executeQuery();
    	  
    	 
    	  
    	  
    	  
    	if(rset.next()) {
    	
    		  bk=new Book();
    		  bk.setBookAuthor(rset.getString("bookAuthor"));
    		  bk.setBookContent(rset.getString("bookContent"));
    		  bk.setBookDate(rset.getString("bookDate"));
    		  bk.setBookList(rset.getString("bookList"));
    		  bk.setBookPage(rset.getString("bookPage"));
    		  bk.setBookPrice(rset.getInt("bookPrice"));
    		  bk.setBookSize(rset.getString("bookSize"));
    		  bk.setBookTitle(rset.getString("bookTitle"));
    		  bk.setImagePath(rset.getString("imagePath"));
    		  bk.setImgName(rset.getString("imageName"));
    		  bk.setISBN(rset.getString("ISBN"));
    		  bk.setBookIndex(rset.getString("bookIndex"));
    		  bk.setBookAuthorIntroduce(rset.getString("bookAuthorIntroduce"));
    	
    		  System.out.println("셀렉트 푸름");
    

    		  System.out.println(bk.getBookAuthor());
    		  
    		  System.out.println(bk.getImgName());
    	    	return bk;
    	  }
             
       
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
		DBManager.close(conn, pstmt);
         
      }
	return bk;
    
      
   }
	
	
	
	public Book updateBook(String bookTitle,String bookAuthor,String price, String bookSize,String bookPage,String bookDate,String  ISBN,String bookContent,String bookList,String imagePath, String imgName,String bookIndex,String bookAuthorIntroduce) {
		System.out.println("updatebook()");
		int result = 0;
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		Book bk=null;

		 int bookPrice=Integer.parseInt(price);
      
      try {
    	 

    	 conn = DBManager.getConnection();

         String sql = "UPDATE book SET BOOKTITLE=?,BOOKAUTHOR=? , BOOKPRICE =?, BOOKSIZE =?, BOOKPAGE=?, BOOKDATE=?, BOOKCONTENT =?, BOOKLIST =?,imagePath=?,imageName=?,bookIndex=?,bookAuthorIntroduce=?   where ISBN=?" ;
         
         pstmt = conn.prepareStatement(sql);

         bk=new Book();
         pstmt.setString(1, bookTitle);
         pstmt.setString(2, bookAuthor);
         pstmt.setInt(3, bookPrice);
         pstmt.setString(4, bookSize);
         pstmt.setString(5, bookPage);
         pstmt.setString(6, bookDate);
         
         pstmt.setString(7, bookContent);
         pstmt.setString(8, bookList);
         pstmt.setString(9, imagePath);
         pstmt.setString(10,imgName);
         pstmt.setString(11, bookIndex);
         pstmt.setString(12, bookAuthorIntroduce);
         pstmt.setString(13, ISBN);

         result=pstmt.executeUpdate();

         bk.setBookAuthor(bookAuthor);
         bk.setBookContent(bookContent);
         bk.setBookDate(bookDate);
         bk.setBookList(bookList);
         bk.setBookPage(bookPage);
         bk.setBookPrice(bookPrice);
         bk.setBookSize(bookSize);
         bk.setBookTitle(bookTitle);
         bk.setISBN(ISBN);
         bk.setImagePath(imagePath);
         bk.setImgName(imgName);
         bk.setBookIndex(bookIndex);
         bk.setBookAuthorIntroduce(bookAuthorIntroduce);
         
         
         
         result = pstmt.executeUpdate();
         
         
         return bk;
        
         
   
     
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }
  
	return bk;
	

      
   }
	
	
	public void delete(String ISBN) {
		System.out.println("updateboard()");
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		

		
      
      try {
    	 

    	 conn = DBManager.getConnection();

         String sql = "DELETE FROM book where ISBN=?" ;
         
         pstmt = conn.prepareStatement(sql);

         pstmt.setString(1, ISBN);
         
         
         
         result = pstmt.executeUpdate();
         
         
         
        
         
   
     
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }

	

      
   }
	
	
	
	
    
	
}



