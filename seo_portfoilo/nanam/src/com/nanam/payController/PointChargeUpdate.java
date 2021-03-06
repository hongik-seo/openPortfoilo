package com.nanam.payController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.memberDB.Member;
import com.nanam.memberDB.MemberDAO;
import com.nanam.pointDB.Point;
import com.nanam.pointDB.PointDAO;

/**
 * Servlet implementation class PointCharge
 */
@WebServlet("/pay/pointChargeUpdate")
public class PointChargeUpdate extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String id=req.getParameter("id");
		
		String po= req.getParameter("addPoint");
		String phone=req.getParameter("pointPhone");
		
		System.out.println(phone);
		
		HttpSession session= req.getSession();

		int point=Integer.parseInt(po);
		
		System.out.println(id);		
		System.out.println("pointcharge"+point);
		System.out.println(phone);
		
		PointDAO pControl=null;
		
		pControl= PointDAO.getInstance();
		
		Member m =pControl.selectPointSum(id,phone,point);
		
		
		
		session = req.getSession(true);
		session.setAttribute("login", m);
		session.getAttribute("login");
		
		
		
	}

	


}
