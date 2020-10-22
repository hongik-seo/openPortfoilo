package com.nanam.payController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;
import com.nanam.cartDB.Cart;
import com.nanam.cartDB.CartDAO;


@WebServlet("/pay/cartBookSelect")
public class CartBookSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	String result;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cartBookTitle=req.getParameter("bookTitle");
		String cartPrice=req.getParameter("bookPrice");
		String cartBookImageName=req.getParameter("file");
		String cartId=req.getParameter("hid");
		String cartISBN=req.getParameter("ISBN");
		
		System.out.println("cartS"+cartBookTitle);
		System.out.println("cartS"+cartPrice);
		System.out.println("cartS"+cartBookImageName);
		System.out.println("cartS"+cartId);
		System.out.println("cartS"+cartISBN);
		
		CartDAO cartControl=null;
		cartControl=CartDAO.getInstance();
		
		
		
		
		
		System.out.println("select cartID  :"+cartId);
		
		ArrayList<Cart> cartList=cartControl.selectCart(cartId);

		
		
		req.setAttribute("cartList", cartList);
		
		
		
		result="/pay/cartBookFront";
		
		
		req.getRequestDispatcher(result).forward(req, resp);
	
		
		
		
	}

	
}
