package com.nanam.payController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

import com.nanam.buyDB.Buy;

import com.nanam.cartDB.Cart;
import com.nanam.memberDB.Member;
import com.nanam.orderBookDB.OrderBookDAO;



@WebServlet("/pay/orderInsert")
public class OrderView extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// TODO Auto-generated method stub
	
		
		
		String buyId=req.getParameter("buyId"); 
		
		String[] price=req.getParameterValues("bookPrice");
		String[] num=req.getParameterValues("bookNum");
		String[] image=req.getParameterValues("bookImg");
		String[] title=req.getParameterValues("bookTitle");
		
		
		String totalPrice=req.getParameter("totalPrice");
		
		
		String totalLeng=req.getParameter("leng");
		
		int leng=Integer.parseInt(totalLeng);
		
		
		
	
		
		
		
		ArrayList<Buy> buyList=new ArrayList<Buy>();
	
		for(int i=0; i<leng; i++) {
	
			int buyNum=Integer.parseInt(num[i]);
			int buyPrice=Integer.parseInt(price[i]);
			int total=Integer.parseInt(totalPrice);
			System.out.println("buyNum ::"+buyNum);
			
			String buyImage=image[i];
			String buyTitle=title[i];
		
			
			Buy	buy= new Buy();

			buy.setBuyTotalPrice(total);
			buy.setBuyId(buyId);
			buy.setBuyEachNum(buyNum);
			buy.setBuyEachPrice(buyPrice);
			buy.setCartBookImageName(buyImage);
			buy.setCartBookTitle(buyTitle);
			
			buyList.add(buy);
			
			
			//orderControl.insertCartNum(buyNum,buyPrice)
			
		}
		
		OrderBookDAO orderControl=null;
		
		orderControl=OrderBookDAO.getInstance();
		
		ArrayList<Buy> buyList2=orderControl.selectOrderView(buyList);
		
		
		req.setAttribute("buy", buyList2);
		
		HttpSession session = req.getSession();
		
		
		Member loginTrue=(Member)session.getAttribute("login");
		
		
		
		if(loginTrue!=null) {
		
		
		result="/pay/orderFront";

		}else {
			
		result="/member/loginMain";
			
		}
		req.getRequestDispatcher(result).forward(req, resp);
		
		
	}

	
}
