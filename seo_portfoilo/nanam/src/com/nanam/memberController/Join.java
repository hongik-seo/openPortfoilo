package com.nanam.memberController;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.ServletRequest;

import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.memberDB.Member;
import com.nanam.memberDB.MemberDAO;



@WebServlet(urlPatterns={"/member/joinMain"})
public class Join extends HttpServlet{

	
	
	
	private static final long serialVersionUID = 1L;
	String result;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		req.setCharacterEncoding("utf-8");		
		
		System.out.println("조인"+req.getRequestURI());
		
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String pwdFind=req.getParameter("pwdFind");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String zipcode=req.getParameter("zipcode");
		String address=req.getParameter("address");
		String detailAddress=req.getParameter("detailAddress");
		
		System.out.println("조인부분"+name);
		
		System.out.println("조인부분"+id);
		
		 
		
	
		
		MemberDAO mControl=null;

		mControl=MemberDAO.getInstance();

		
		
		mControl.insert(new Member(name, id, pwd, pwdFind, phone, email, zipcode, address, detailAddress));
		
		
	
				
		
		result="/main/index.jsp";
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
	}


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
		
	
		
	}


	
	
	
	







}
