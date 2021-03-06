package com.nanam.memberDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;

import com.nanam.pointDB.Point;
import com.nanam.pointDB.PointDAO;

import util.DBManager;






public class MemberDAO{

	
	

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}


	
	public boolean isDelete;


	



	public void insert(Member m) {
		System.out.println("insertMember()");
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		ResultSet rset=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3= null;
		
      
      try {
         
    	 
         conn = DBManager.getConnection();
         
       
         String sql = "INSERT INTO member(name,id,pwd,pwdFind,phone,email,zipcode,address,detailAddress) VALUES(?,?,?,?,?,?,?,?,?)";
         
         
       
         
         pstmt = conn.prepareStatement(sql);
        
         
         pstmt.setString(1, m.getName());
         pstmt.setString(2, m.getId());
         pstmt.setString(3, m.getPwd());
         pstmt.setString(4, m.getPwdFind());
         pstmt.setString(5, m.getPhone());
         pstmt.setString(6, m.getEmail());
         pstmt.setString(7, m.getZipcode());
         pstmt.setString(8, m.getAddress());
         pstmt.setString(9, m.getDetailAddress());
         
         result = pstmt.executeUpdate();
        
         String sql2="INSERT INTO point(pointid,pointphone) SELECT member.id, member.phone FROM  member WHERE  member.id=?";
         
         pstmt2=conn.prepareStatement(sql2);
         
         
         pstmt2.setString(1, m.getId());

         

         result2=pstmt2.executeUpdate();
         
         
         String sql3="INSERT INTO total(totalId,totalphone) SELECT member.id, member.phone FROM  member WHERE  member.id=?";
         
         
         pstmt3=conn.prepareStatement(sql3);
         
         pstmt3.setString(1, m.getId());
         
         result3=pstmt3.executeUpdate();
         
         
       
         System.out.println("회원가입 완료");
      
      } catch (Exception e) {
         // TODO: handle exception
    	 
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt);
         
      }

	

      
   }
  
	
	
	
	
	
	
		
		public Member loginMember(String id,String pwd) {
			   
			
					
			   System.out.println("loginMemberDAO"+id);
			   System.out.println("loginMemberDAO"+pwd);
	
			   
			   Connection conn = null;
			   PreparedStatement pstmt = null;
			   ResultSet rset=null;
			   Member member=null;
			   
			   PreparedStatement pstmt2 = null;
			   ResultSet rset2=null;
			   
			   
			   try {
				   
				   
				   conn = DBManager.getConnection();
				   String sql="SELECT * FROM member where id=? AND pwd=? AND leaveout='n' ";
				   
				   
				   
				   pstmt=conn.prepareStatement(sql);
				  
				   

				   pstmt.setString(1, id);
				   pstmt.setString(2, pwd);
				   
				   rset=pstmt.executeQuery();
				
				   
				   
				   String sql2="SELECT sum(p.pointsize) addPoint from point p,member m where m.id=p.pointid And m.id=?";
				   
				   pstmt2=conn.prepareStatement(sql2);
				   
				   pstmt2.setString(1, id);
				   
				   rset2=pstmt2.executeQuery();
				   
				   
				   
				   if(rset.next()&&rset2.next()) {

					   member=new Member();
					   member.setPhone(rset.getString("phone"));
					   member.setEmail(rset.getString("email"));
					   member.setId(rset.getString("id"));
					   member.setPwd(rset.getString("pwd"));
					   member.setName(rset.getString("name"));
					   member.setZipcode(rset.getString("zipcode"));
					   member.setDetailAddress(rset.getString("detailAddress"));
					   member.setAddress(rset.getString("address"));
					   member.setPoint(rset2.getInt("addPoint"));







					   isDelete=true;
					   return member;


				   }
				   
			
			   } catch (SQLException e) {
				   // TODO Auto-generated catch block
				   e.printStackTrace();
			   }finally {
				   DBManager.close(conn, pstmt,rset);
			
			   }
			   isDelete=false;
			   return member;
  
		}
		
		
		
		public Member pointConfirm(Member m) {
			   
			
			
			   System.out.println("selectMember"+m.getId());
			   System.out.println("selectMember"+m.getPwd());
			   
		
		    	  
		    	  
		    	  
			   
			   Connection conn = null;
			   PreparedStatement pstmt = null;
			   ResultSet rset=null;
			 
			   
			   try {
				   String sql="SELECT * FROM member m LEFT OUTER JOIN point p ON m.id = p.pointid where m.id=? ";
				   conn = DBManager.getConnection();
				   pstmt=conn.prepareStatement(sql);

				   

				   pstmt.setString(1, m.getId());
				  // pstmt.setString(2, m.getPwd());
				   
				   rset=pstmt.executeQuery();
				
				   
				   if(rset.next()) {
					   
					   
					   m.setPhone(rset.getString("phone"));
					   m.setEmail(rset.getString("email"));
					   m.setId(rset.getString("id"));
					   m.setPwd(rset.getString("pwd"));
					   m.setName(rset.getString("name"));
					   m.setZipcode(rset.getString("zipcode"));
					   m.setDetailAddress(rset.getString("detailAddress"));
					   m.setAddress(rset.getString("address"));
					   m.setPoint(rset.getInt("allpoint"));
					  
					   
					   
					   System.out.println("login member point"+m.getPoint());
					   
					   System.out.println("loginMember"+m.getId());
					   System.out.println("loginMember"+m.getPwd());
					   				
					   
					   isDelete=true;
					   return m;
					  

				   }
				   
			
			   } catch (SQLException e) {
				   // TODO Auto-generated catch block
				   e.printStackTrace();
			   }finally {
				   DBManager.close(conn, pstmt,rset);
			
			   }
			   isDelete=false;
			   return m;

		}

		
		public Member isMember(String id) {
			   
			   System.out.println("selectMember"+id);
			   //System.out.println("selectMember"+pwd);
			   
			  
		    	  
			   
			   Connection conn = null;
			   PreparedStatement pstmt = null;
			   ResultSet rset=null;
			  
			   Member member=null;
			   try {
				   String sql="SELECT * FROM member WHERE id=? ";
				   conn = DBManager.getConnection();
				   pstmt=conn.prepareStatement(sql);



				   pstmt.setString(1, id);
				 //  pstmt.setString(2, pwd);
				   rset=pstmt.executeQuery();
				  

				   
				   if(rset.next()) {
					   member=new Member();
					   
					   member.setPhone(rset.getString("phone"));
					   member.setEmail(rset.getString("email"));
					   member.setId(rset.getString("id"));
					   member.setPwd(rset.getString("pwd"));
					   member.setName(rset.getString("name"));
					   member.setZipcode(rset.getString("zipcode"));
					   member.setDetailAddress(rset.getString("detailAddress"));
					   member.setAddress(rset.getString("address"));
					   
					   
					   
					   
					   System.out.println(member.getPoint());
					   
					   System.out.println("loginMember"+id);
					   
					   				
					   
					   isDelete=true;
					   return member;
					  

				   }

			
			   } catch (SQLException e) {
				   // TODO Auto-generated catch block
				   e.printStackTrace();
			   }finally {
				   DBManager.close(conn, pstmt,rset);
			
			   }
			  
			   return member;

		}

		
		
		
		
		// 이름과 휴대폰으로 계정을 찾습니다.
		public Member findMember(String name,String phone) {


			System.out.println("idFindMember()");


			Connection conn = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			ResultSet rset=null;
			Member member = null;


			try {

			
				String sql="SELECT *FROM member m WHERE name=? AND phone=? And m.id not in('scott')";
				System.out.println(sql);
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);


				pstmt.setString(1, name); 
				pstmt.setString(2, phone);


				rset=pstmt.executeQuery();
				
				
				
	
				
				if(rset.next()) {
					member = new Member();

					member.setName(rset.getString("name"));
					member.setId(rset.getString("id"));
					member.setPwd(rset.getString("pwd"));
					member.setAdjustIndate(rset.getString("adjustIndate"));
					System.out.println(" 존재합니다.");
					return member;
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt,rset);

			}

			return member;

		}
		
		
		
		
		
		public Member update(String name,String id, String pwd,String pwdFind,String phone,String email,String zipcode,String address,String detailAddress) {
			System.out.println("updateMember()");
			int result = 0;
			ResultSet rset=null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			
			Member member=null;
			Statement stmt=null;
			
	      
	      try {


	    	  conn = DBManager.getConnection();

	    	 
	         String sql = "UPDATE member SET pwd=?,pwdFind=?,phone=?,email=?,zipcode=?,address=?,detailAddress=? where id=? And name=?" ;
	         
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, pwd);
	         pstmt.setString(2, pwdFind);
	         pstmt.setString(3, phone);
	         pstmt.setString(4, email);   
	         pstmt.setString(5, zipcode);
	         pstmt.setString(6, address);
	         pstmt.setString(7, detailAddress);
	         pstmt.setString(8, id);
	         pstmt.setString(9, name);

	         
	         result = pstmt.executeUpdate();
	         
	     
	         
	         String sql2="SELECT * FROM member where id=? And name=?";	         
	         pstmt2=conn.prepareStatement(sql);
	         
	         
	         
	         
	         pstmt2.setString(1, id);
	         pstmt2.setString(2, name);
	         
	         rset=pstmt.executeQuery();
	         
	         while(rset.next()) {
	         member=new Member();
	         member.setId(rset.getString("id"));
	         member.setName(rset.getString("name"));
	         member.setPwd(rset.getString("pwd"));
	         member.setPwdFind(rset.getString("pwdFind"));
	         member.setEmail(rset.getString("email"));
	         member.setPhone(rset.getString("phone"));
	         member.setZipcode(rset.getString("zipcode"));
	         member.setDetailAddress(rset.getString("detailAddress"));
	         member.setAddress(rset.getString("address"));
	         member.setAdjustIndate(rset.getString("adjustIndate"));;
	         
	         System.out.println("정보입력 완료");
	         isDelete=true;
        	 

	         }
	         return member;
	     
	      } catch (Exception e) {
	         // TODO: handle exception
	    	 
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt);
	         
	      }
	      isDelete=false;
		return member;

	      
	   }
		
		
		public void delete(String id,String pwd) {
			System.out.println("deleteMember()");
			int result=0;
			ResultSet rset=null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			Member member=null;

			try {
				
				
				conn = DBManager.getConnection();


				String sql = "update member set leaveout='y' where id=? And pwd=?";

				
				
				
				pstmt = conn.prepareStatement(sql);


				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				
				result=pstmt.executeUpdate();

				
				
				
			
				
				
			} catch (Exception e) {
				// TODO: handle exception

				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);

			}


		}	
		
}
