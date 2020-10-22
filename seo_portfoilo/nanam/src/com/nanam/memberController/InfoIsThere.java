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


@WebServlet("/member/infoIsthere")
public class InfoIsThere extends  HttpServlet  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub


		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");


		MemberDAO mControl=MemberDAO.getInstance();
		Member loginMember=mControl.isMember(id);

		Member mber=new Member(id,pwd);


		PrintWriter out=resp.getWriter();

		mber.setId(id);
		mber.setPwd(pwd);

		System.out.println("유효성 아이디"+mber.getId());
		System.out.println("유효성 비밀번호"+mber.getPwd());
		
		System.out.println("유효성 memberDAO login id : "+loginMember.getId());
		System.out.println("유효성 memberDAO login pwd : "+loginMember.getPwd());
		if(id.equals(loginMember.getId())&&pwd.equals(loginMember.getPwd())) {
			out.write("none");
			out.flush();
			out.close();




		}


	}





}

