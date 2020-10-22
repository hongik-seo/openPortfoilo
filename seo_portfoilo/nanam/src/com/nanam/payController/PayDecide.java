package com.nanam.payController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.buyDB.Buy;
import com.nanam.orderBookDB.OrderBook;
import com.nanam.orderBookDB.OrderBookDAO;


@WebServlet("/pay/changePayTable")
public class PayDecide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	String result;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println(req.getRequestURI());
		
		String payId=req.getParameter("id"); 
		
		String[] price=req.getParameterValues("price");
		String[] num=req.getParameterValues("num");
		
		String[] title=req.getParameterValues("title");
		
		
		OrderBookDAO orderControl=null;
		orderControl=OrderBookDAO.getInstance();
		
		
		for(int i=0; i<title.length; i++) {
		
			String payTitle=title[i];
			
			int payPrice=Integer.parseInt(price[i]);
			int payNum=Integer.parseInt(num[i]);
			
			
			Buy b=orderControl.changePayTable(payId,payTitle,payPrice,payNum);
		
			String t=String.valueOf(b);
		
			
			
			req.setAttribute("decide", t);
			
		
			result="/pay/payResult";
			
			req.getRequestDispatcher(result).forward(req, resp);
			
		}
		
		
		
		
		
		
		
		

	
		
		
		
		
		
	}

	
}
