package com.nanam.memberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.memberDB.MemberDAO;


@WebServlet("/member/logoutFront")
public class Logout extends HttpServlet{

	
	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			req.setCharacterEncoding("utf-8");


			String path=req.getRequestURI();
			System.out.println(path);
		
		
			
			
			System.out.println("나탸");
			
			
			HttpSession session = req.getSession(true);
			 
			if(session == null) 
			{
			        System.out.println( "데이터를 추가하거나 삭제할 세션 객체가 존재하지 않음");
			}else {
				session.removeAttribute("login");
				

			
			}   			
						
				
			
			result="/main/index.jsp";

			req.getRequestDispatcher(result).forward(req, resp);
			
		}
		
	
		
	
	
}
	