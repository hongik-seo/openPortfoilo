package com.nanam.memberController;

import java.io.IOException;
import java.sql.Timestamp;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.memberDB.Member;
import com.nanam.memberDB.MemberDAO;



@WebServlet("/member/myPageMain")
public class MyPage extends HttpServlet {

	/**
	 * 
	 */
	String result;
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		
		req.setCharacterEncoding("utf-8");		

		System.out.println("조인"+req.getRequestURI());

		String name=req.getParameter("name");
		String pwd = req.getParameter("pwd");
		String pwdFind = req.getParameter("pwdFind");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String zipcode=req.getParameter("zipcode");
		String address=req.getParameter("address");
		String detailAddress=req.getParameter("detailAddress");
		String id=req.getParameter("id");

		
		
		
		
		MemberDAO mControl=null;

		mControl=MemberDAO.getInstance();

		
		
		  
		

		
		
		Member updateMember=mControl.update(name,id, pwd,pwdFind,phone,email,zipcode,address,detailAddress);
		
		
		
		
		HttpSession session=req.getSession(true);
		
			
		session.setAttribute("login", updateMember);
		session.getAttribute("login");
			
		
		





		result="/main/index.jsp";




		req.getRequestDispatcher(result).forward(req, resp);

		
		
	}
	
	

}
