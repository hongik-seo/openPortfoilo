package com.nanam.memberController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.memberDB.Member;
import com.nanam.memberDB.MemberDAO;

@WebServlet("/member/leaveOutMain")
public class LeaveOut extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	String result;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		
		
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		
		Member member=new Member();
		member.setId(id);
		member.setPwd(pwd);
		
		MemberDAO mControl=null;
		mControl=MemberDAO.getInstance();
		
		Member deleteMember=mControl.loginMember(id,pwd);
		
		if(mControl.isDelete==true&&id.equals(deleteMember.getId())&&pwd.equals(deleteMember.getPwd())) {
			mControl.delete(id, pwd);
			
			HttpSession session=req.getSession();
			
			
			
			session.invalidate();
			
			result="/main/index.jsp";
			
			
		}else{
			
			result="/member/leaveOut.jsp";
			
			
		}
		

		
		req.getRequestDispatcher(result).forward(req, resp);
		
		
		
	}

}
