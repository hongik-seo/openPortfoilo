package com.nanam.payController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/pay/plusBook")
public class PlusBookNum extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	




	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	
	
		int total=doHendle(req,resp);
		
		
		
		String allTotal=String.valueOf(total);
		
		PrintWriter out=resp.getWriter();


		out.write(allTotal);
		out.flush();
		out.close();
		
		
		
	}
	
	
	








	protected int doHendle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
	
		String[] pArr=req.getParameterValues("pArr");
		String[] nArr=req.getParameterValues("nArr");
		
		
				
		
		int total=0;
		
		
		
		
		
		
		for(int i=0; i<pArr.length; i++) {
			
			int[] price=new int[] {Integer.parseInt(pArr[i])};
			int[] num=new int[] {Integer.parseInt(nArr[i])};
			for(int j=0; j<price.length; j++) {
				
				
				total+=price[j]*num[j];	
				
				
				
				System.out.println(price[j]);
				System.out.println(num[j]);
			}
			
			
		
		}
	
		
		
		System.out.println(total);
		
				
		
		return total;
		
		
	}
	
	
	
}
