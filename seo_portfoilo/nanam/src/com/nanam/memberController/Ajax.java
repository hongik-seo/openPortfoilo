package com.nanam.memberController;

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


@WebServlet("/member/ajax")
public class Ajax extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
    	
		
		
		
		
		
		String id=req.getParameter("id");
		
		
		
		Member member=new Member();
		member.setId(id);
	
		MemberDAO mControl=MemberDAO.getInstance();
		
		Member m=mControl.isMember(id);
		
		PrintWriter out=resp.getWriter();
		
		if(m.getId().equals(member.getId())) {
			
			String usable="usable";
			out.write("usable");
			out.flush();
			out.close();
		
		
		}
		
		
		
		
		
		
		/*try {
			JSONParser parser = new JSONParser();
			JSONObject obj = null;
			 obj = (JSONObject)parser.parse(idFindMember);
			
			 
			 PrintWriter out = resp.getWriter();
			 out.print(obj);
			 out.flush();
			 out.close();
			
		} catch (ParseException e) {
			System.out.println("변환에 실패");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		
		
		
	}
	
	
	
	

}
