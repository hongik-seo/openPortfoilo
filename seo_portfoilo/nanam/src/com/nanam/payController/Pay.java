package com.nanam.payController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.buyDB.Buy;
import com.nanam.memberDB.Member;
import com.nanam.orderBookDB.OrderBookDAO;
import com.nanam.pointDB.Point;
import com.nanam.pointDB.PointDAO;



@WebServlet("/pay/afterPay")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	String result;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println(req.getRequestURI());
		
		String payId=req.getParameter("buyId");
		String payPhone=req.getParameter("userPhone");
		String payPoint=req.getParameter("payPoint");
		//String totalPrice=req.getParameter("totalPrice");
		
		
		
		OrderBookDAO orderControl=null;

		orderControl=OrderBookDAO.getInstance();
		
		
		ArrayList<Buy> buy=orderControl.afterPay(payId);
		
		
		
		
		Member m = orderControl.afterPayPoint(payId,payPhone,payPoint);
		
	
		HttpSession session=req.getSession(true);
		
		session.setAttribute("login",m);
		session.getAttribute("login");
		
		req.setAttribute("pay",buy);
		
		
		
		Member loginTrue=(Member)session.getAttribute("login");
		
		
		if(loginTrue!=null) {
		
			result="/pay/payResult";
		
		}else {
			
			result="/member/loginMain";
			
		}
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
	}

	
	
	
}
