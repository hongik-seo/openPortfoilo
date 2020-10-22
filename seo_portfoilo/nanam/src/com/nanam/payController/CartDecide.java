package com.nanam.payController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;
import com.nanam.cartDB.Cart;
import com.nanam.cartDB.CartDAO;


@WebServlet("/pay/cartDecide")
public class CartDecide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	String result;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	
		String cartId=req.getParameter("cartId");
		String[] ISBN=req.getParameterValues("cartISBN");
		
		System.out.println(cartId);
		CartDAO cControl=null;
		
		cControl=CartDAO.getInstance();
		
		
		for(int i=0; i<ISBN.length; i++) {
		
			String cartISBN =ISBN[i];
			
		Cart cart=cControl.decideOrder(cartId,cartISBN);
		
		
		String t=String.valueOf(cart);
		
		
		
		
		
		System.out.println(t);

		PrintWriter out=resp.getWriter();


		out.write(t);
		out.flush();
		
		req.setAttribute("decide", out);
		
		result="/pay/cartBookFront";
		
		
		
		out.close();
		}
	
		
		
		
		
	}

	
}
