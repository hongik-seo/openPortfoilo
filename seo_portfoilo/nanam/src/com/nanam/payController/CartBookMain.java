package com.nanam.payController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;
import com.nanam.cartDB.Cart;
import com.nanam.cartDB.CartDAO;
import com.nanam.memberDB.Member;


@WebServlet("/pay/cartBookMain")
public class CartBookMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	String result;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cartBookTitle=req.getParameter("bookTitle");
		String cartPrice=req.getParameter("bookPrice");
		String cartBookImageName=req.getParameter("file");
		String cartId=req.getParameter("hid");
		String cartISBN=req.getParameter("ISBN");
		
		
		
		System.out.println("cart"+cartBookTitle);
		System.out.println("cart"+cartPrice);
		System.out.println("cart"+cartBookImageName);
		System.out.println("cart"+cartId);
		
		CartDAO cartControl=null;
		cartControl=CartDAO.getInstance();
		
		int cartBookPrice=Integer.parseInt(cartPrice);
		
		
		
		cartControl.insertCart(new Cart(cartBookTitle ,cartBookPrice,  cartBookImageName, cartId,cartISBN));
		
		
		HttpSession session = req.getSession();
		
		
		Member loginTrue=(Member)session.getAttribute("login");
		
		
		
		if(loginTrue!=null) {
		
			result="/pay/cartBookSelect";
			
		}else {
			
			result="/member/loginMain";
			
		}
		
		
		req.getRequestDispatcher(result).forward(req, resp);
	
		
		
		
	}

	
}
