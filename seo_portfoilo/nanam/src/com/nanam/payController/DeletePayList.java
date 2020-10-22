package com.nanam.payController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import com.nanam.buyDB.Buy;

import com.nanam.cartDB.Cart;
import com.nanam.orderBookDB.OrderBookDAO;



@WebServlet("/pay/deletePayList")
public class DeletePayList extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// TODO Auto-generated method stub
	
		
		
		String payId=req.getParameter("id"); 
		
				
		OrderBookDAO orderControl=null;
		
		orderControl=OrderBookDAO.getInstance();
		
		orderControl.deletePayList(payId);
		
		
		
	}

	
}
