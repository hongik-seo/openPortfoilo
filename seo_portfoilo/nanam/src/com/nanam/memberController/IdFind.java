package com.nanam.memberController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.memberDB.Member;
import com.nanam.memberDB.MemberDAO;





@WebServlet(urlPatterns={"/member/idFindMain"})
public class IdFind extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String result;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=req.getRequestURI();
		//System.out.println(path);
		
	
		
		
		req.setCharacterEncoding("utf-8");


		String name=req.getParameter("name");
		String phone=req.getParameter("phone");

		
		
		System.out.println("get   :"+name);
		System.out.println("get   :"+phone);
		
		MemberDAO mControl=null;
		mControl=MemberDAO.getInstance();
		Member memberR=mControl.findMember(name, phone);

		
	if(mControl.findMember(name, phone)!=null) {
		req.setAttribute("idFind", memberR);
		req.getAttribute("idFind");

		
		
		result="/member/idFindResult.jsp";

	}else{

		
		result="/member/idFind.jsp";
		
	}
	
	req.getRequestDispatcher(result).forward(req, resp);
		
				
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
		
		
	}
	

	
	
	

}
