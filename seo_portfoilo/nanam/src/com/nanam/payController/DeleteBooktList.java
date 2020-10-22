package com.nanam.payController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.cartDB.CartDAO;


@WebServlet("/pay/deleteBookList")
public class DeleteBooktList extends HttpServlet  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String title=req.getParameter("title");
		
		String cartISBN=req.getParameter("cartISBN");
		String leng=doFlag(req,resp);
		
	
	
		
		
	
		
		CartDAO cart=new CartDAO();
		
		cart.deleteCart(title,cartISBN);
		
		
		
		int total=doHendle(req,resp);
		String allTotalAndLeng=total+","+leng;
		
		
		
		
		PrintWriter out=resp.getWriter();


		out.write(allTotalAndLeng);
		out.flush();
		out.close();
		
		
	}
	
	
	








	protected int doHendle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
	
		String[] pArr=req.getParameterValues("pArr");
		String[] nArr=req.getParameterValues("nArr");
		
	
		int total=0;
		
		int[] price=null;
		
		int[] num=null;
		
	
		
		
		for(int i=0; i<pArr.length; i++) {
			
			price=new int[] {Integer.parseInt(pArr[i])};
			num=new int[] {Integer.parseInt(nArr[i])};
			
			for(int k=0; k<price.length; k++) {
				
				
				total+=price[k]*num[k];	
				
				
				
				
				System.out.println("price[k] :"+price[k]);
				System.out.println("num[k] :"+num[k]);
				
			}
			
			
		
		}
		
		
			
		
		return total;
		
		
	
	}
	
	
	
	protected String doFlag(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		String leng=req.getParameter("chLeng");
	
			
		
		return leng;
		
		
	
	}
	
	
	
	
	

}
