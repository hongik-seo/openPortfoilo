package com.nanam.payController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.nanam.cartDB.CartDAO;


@WebServlet("/pay/checkBookNum")
public class CheckBookNum extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	




	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		
		
		
		
		
		
	
		int total=doHendle(req,resp);
		

	
		String leng=doFlag(req,resp);
		
		
		String allTotal=String.valueOf(total);
		
		String allTotalAndLeng=allTotal+","+leng;
		
		
		
		
		
		
		
		
		
		PrintWriter out=resp.getWriter();


		out.write(allTotalAndLeng);
		out.flush();
		out.close();
		
		
		
	}
	
	
	








	protected int doHendle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
	
		String[] pArr=req.getParameterValues("pArr");
		String[] nArr=req.getParameterValues("nArr");
		
	
	//	String minusN=req.getParameter("minusNum");
		
//		String minusP=req.getParameter("minusPrice");
		
		
		
	//	int minusNum=Integer.parseInt(minusN);
	//	int minusPrice=Integer.parseInt(minusP);
		
		
		
		
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
