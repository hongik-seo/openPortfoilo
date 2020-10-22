package com.nanam.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.boardController.DeleteBoardFront;
import com.nanam.boardController.DeleteBoardMain;
import com.nanam.boardController.InputBoard;
import com.nanam.boardController.ShowBoardDetail;
import com.nanam.boardController.ShowEssayBoard;
import com.nanam.boardController.ShowNanamBoard;
import com.nanam.boardController.ShowNoticeBoard;
import com.nanam.boardController.UpdateBoardFront;
import com.nanam.boardController.UpdateBoardMain;
import com.nanam.boardDB.Board;
import com.nanam.boardDB.BoardDAO;
import com.nanam.memberDB.MemberDAO;


@WebServlet(urlPatterns= {"/board/deleteBoard","/board/updateBoard","/board/detailList","/board/detailFront","/board/nanamList","/board/essayList","/board/noticeList","/board/main","/board/inputNoticeFront","/board/essayFront","/board/nanamFront","/board/noticeFront"})
public class Bdcontroller extends HttpServlet {

	/**
	 * 
	 */
	String result;
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");
		String path=req.getRequestURI();
		
		
		if(path.equals("/nanam/board/detailFront")) {
			
			result="/board/showBoardDetail.jsp";
			
		}else if(path.equals("/nanam/board/showDetail")) {
			
			ShowBoardDetail show=new ShowBoardDetail();
			show.service(req, resp);
			
		}else if(path.equals("/nanam/board/essayFront")) {
			
			
			result="/board/showEssayBoard";
			
			
			
					
		}else if(path.equals("/nanam/board/showEssayBoard")) {
			
			
			ShowEssayBoard sh=new ShowEssayBoard();
			sh.service(req, resp);
			
			
			
		}else if(path.equals("/nanam/board/essayList")) {
			
			
			result="/board/essay.jsp";
			
		}else if(path.equals("/nanam/board/nanamFront")) {
			
			
			result="/board/showNanamBoard";
			
			
			
					
		}else if(path.equals("/nanam/board/showNanamBoard")) {
			
			
			
			ShowNanamBoard na=new ShowNanamBoard();
					na.service(req, resp);
			
		}else if(path.equals("/nanam/board/nanamList")) {
			
			
			result="/board/publish.jsp";
			
		}else if(path.equals("/nanam/board/noticeFront")) {
			
			
			result="/board/showNoticeBoard";
			
			
			
					
		}else if(path.equals("/nanam/board/showNoticeBoard")) {
			
			
			
			ShowNoticeBoard no=new ShowNoticeBoard();
					no.service(req, resp);
			
		}else if(path.equals("/nanam/board/noticeList")) {
			
			
			result="/board/notice.jsp";
			
		}else if(path.equals("/nanam/board/inputNoticeFront")){
			
			
			result="/board/uploadBoard.jsp";
			
		}else if(path.equals("/nanam/board/inputBoard")) {
			InputBoard in=new InputBoard();
			in.service(req, resp);
			
			
		}else if(path.equals("/nanam/board/updateBoardFront")) {
			
		
			UpdateBoardFront uf=new UpdateBoardFront();
			uf.service(req, resp);
			
		}else if(path.equals("/nanam/board/updateBoard")) {
			
			result="/board/updateBoard.jsp";
			
		}else if(path.equals("/nanam/board/updateBoardMain")) {
			
			UpdateBoardMain up=new UpdateBoardMain();
			up.service(req, resp);
			
		}else if(path.equals("/nanam/board/deleteBoardFront")) {
			
			DeleteBoardFront df=new DeleteBoardFront();
			df.service(req, resp);
		
		}else if(path.equals("/nanam/board/deleteBoard")) {
			
			result="/board/deleteBoard.jsp";
			
		}else if(path.equals("/nanam/board/deleteBoardMain")) {
			
			DeleteBoardMain de= new DeleteBoardMain();
			de.service(req, resp);
			
		}else {
			
			
			result="/home";
		}
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
		
	}
	
	

}
