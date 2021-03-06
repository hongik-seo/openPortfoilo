package com.nanam.payController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.buyDB.Buy;
import com.nanam.orderBookDB.OrderBook;
import com.nanam.orderBookDB.OrderBookDAO;


@WebServlet("/pay/beforePay")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	String result;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println(req.getRequestURI());
		
		String orderId=req.getParameter("buyId"); 
		
		String[] price=req.getParameterValues("bookPrice");
		String[] num=req.getParameterValues("bookNum");
		String[] image=req.getParameterValues("bookImg");
		String[] title=req.getParameterValues("bookTitle");
		String orderTotal=req.getParameter("total");
		
		String orderName=req.getParameter("orderName");
		
		String orderPhone=req.getParameter("orderPhone");
		
		String orderEmail=req.getParameter("orderEmail");
		String orderZipcode=req.getParameter("orderZipcode");
		String orderAddress=req.getParameter("orderAddress");
		
		String orderDetailAddress=req.getParameter("orderDetailAddress");
		
		String orderCall=req.getParameter("orderCall");
		
		
		OrderBookDAO orderControl=null;
		orderControl=OrderBookDAO.getInstance();
		
	
		ArrayList<OrderBook> orderList=new ArrayList<OrderBook>();
		
		for(int i=0; i<price.length; i++) {
	
			int buyNum=Integer.parseInt(num[i]);
	
			int buyPrice=Integer.parseInt(price[i]);
			
			String buyImage=image[i];
			String buyTitle=title[i];
	
			
			OrderBook order= new OrderBook();

			order.setBuyEachNum(buyNum);
			order.setBuyEachPrice(buyPrice);
			order.setCartBookImageName(buyImage);
			order.setCartBookTitle(buyTitle);

			orderList.add(order);
			
		}
		
		
		
		
		req.setAttribute("orderList", orderList);
		
		
		req.setAttribute("total", orderTotal);
		
		orderControl.orderInfoInsert(orderName,orderPhone,orderEmail,orderDetailAddress,orderCall,orderZipcode,orderAddress,orderTotal,orderId,orderList);
		
		
		
			
		result="/pay/orderFin";
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
		
	}

	
}
