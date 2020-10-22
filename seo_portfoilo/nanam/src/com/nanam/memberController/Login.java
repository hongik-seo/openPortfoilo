package com.nanam.memberController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.memberDB.Member;
import com.nanam.memberDB.MemberDAO;
import com.nanam.pointDB.PointDAO;






@WebServlet(urlPatterns={"/member/loginMain"})
public class Login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
		
	
	String result;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		req.setCharacterEncoding("utf-8");


		System.out.println("login");




		MemberDAO mControl=null;

		mControl=MemberDAO.getInstance();
		
		


		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("get   :"+id);
		System.out.println("get   :"+pwd);
		
	
		
		
		
		Member re=mControl.loginMember(id,pwd);
		
		
		
		

		
		if(re!=null&& re.getId().equals(id)&&re.getPwd().equals(pwd)) {

			HttpSession session = req.getSession();
			session = req.getSession(true);
			session.setAttribute("login",re);
			session.getAttribute("login");
			System.out.println("로그인 성공");
			
			
			
			
			result="/main/index.jsp";

		}else{

			
			result="/member/login.jsp";
			
		}

		req.getRequestDispatcher(result).forward(req, resp);
	


	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
		
	
		
	}

}
