package com.nanam.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.memberController.IdFind;
import com.nanam.memberController.Join;
import com.nanam.memberController.LeaveOut;
import com.nanam.memberController.Login;
import com.nanam.memberController.MyPage;
import com.nanam.memberController.PwdFind;

@WebServlet(urlPatterns = { "/member/agreeFront", "/member/agree", "/member/agreeBack", 
		"/member/joinFront", "/member/idFindFront", "/member/loginFront", "/member/pwdFindFront" ,"/member/myPageFront","/member/leaveOutFront","/member/myPageResult",
		"/member/myPageInfo"})
public class Mbcontroller extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String path = req.getRequestURI();

		System.out.println(path);

		/*Controller c = new Controller();

		c.service(req, resp);
		*/
		if(path.equals("/nanam/member/main")) {
		
			result="/main/index.jsp";
			
		}else if (path.equals("/nanam/member/agreeFront")) {

			result = "/member/agree.jsp";

		} else if (path.equals("/nanam/member/agree")) {

			result = "/member/agreeBack";

		} else if (path.equals("/nanam/member/joinFront")) {

			result = "/member/join.jsp";

		} else if (path.equals("/nanam/member/joinMain")) {

			Join j = new Join();
			j.service(req, resp);

		} else if (path.equals("/nanam/member/idFindFront")) {

			result = "/member/idFind.jsp";

		} else if (path.equals("/nanam/member/idFindMain")) {

			IdFind id = new IdFind();
			id.service(req, resp);

		} else if (path.equals("/nanam/member/loginFront")) {

			result = "/member/login.jsp";

		} else if (path.equals("/nanam/member/loginMain")) {

			Login l = new Login();
			l.service(req, resp);

		} else if (path.equals("/nanam/member/pwdFindFront")) {

			result = "/member/pwdFind.jsp";

		} else if (path.equals("/nanam/member/pwdFindMain")) {

			PwdFind pwd = new PwdFind();
			pwd.service(req, resp);

		}else if(path.equals("/nanam/member/myPageInfo")) {
			
			result="/member/myPageInfo.jsp";
			
		}else if(path.equals("/nanam/member/myPageFront")) {
			
			result="/member/myPage.jsp";
		
		}else if(path.equals("/nanam/member/myPageMain")) {
			
			MyPage my=new MyPage();
			my.service(req, resp);
			
		}else if(path.equals("/nanam/member/leaveOutFront")){
			
			result="/member/leaveOut.jsp";
		}else if(path.equals("/nanam/member/leaveOutMain")) {
			
			LeaveOut leave= new LeaveOut();
			leave.service(req, resp);
		}else if(path.equals("/nanam/member/myPageResult")) {
			
			result="/member/myPageResult.jsp";
		}
		
		req.getRequestDispatcher(result).forward(req, resp);

	}

	

}
