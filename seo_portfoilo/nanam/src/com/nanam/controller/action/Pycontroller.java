package com.nanam.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.payController.CartBookMain;
import com.nanam.payController.CartBookSelect;
import com.nanam.payController.OrderView;
//import com.nanam.payController.OrderSelect;
import com.nanam.payController.PointChargeUpdate;




@WebServlet(urlPatterns= {"/pay/pointChargeFront","/pay/cartBookFront","/pay/pointChargeResult","/pay/orderFront","/pay/orderFin","/pay/payResult" })
public class Pycontroller extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		String path=req.getRequestURI();
		System.out.println(path);
		
		if(path.equals("/nanam/pay/pointChargeFront")) {
			
			
			result="/pay/point.jsp";
			
		}else if(path.equals("/nanam/pay/pointChargeUpdate")) {
			
			PointChargeUpdate p=new PointChargeUpdate();
			p.service(req, resp);
			
			
		}else if(path.equals("/nanam/pay/cartBookMain")) {
			
			
			CartBookMain cartMain=new CartBookMain();
			cartMain.service(req, resp);
			
		}else if(path.equals("/nanam/pay/pointChargeResult")) {
			
			result="/pay/pointChargeResult.jsp";
			
		}
		
		else if(path.equals("/nanam/pay/cartBookSelect")) {
			
			CartBookSelect cartSelect=new CartBookSelect();
			cartSelect.service(req, resp);
			
			
		}else if(path.equals("/nanam/pay/cartBookFront")) {
			
			
			result="/pay/cart.jsp";
		}else if(path.equals("/nanam/pay/orderInsert")) {
			
			
			OrderView oi =new OrderView();
			
			oi.service(req, resp);
			
			
		}else if(path.equals("/nanam/pay/orderFront")) {
			
			result="/pay/order.jsp";
			
		}else if(path.equals("/nanam/pay/orderFin")) {
			
			
			result="/pay/pay.jsp";
		}else if(path.equals("/nanam/pay/payResult")) {
			
			
			result="/pay/payResult.jsp";
			
		}
		
		
		
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
		
		
		
		
	}
	
	
	
	

}
