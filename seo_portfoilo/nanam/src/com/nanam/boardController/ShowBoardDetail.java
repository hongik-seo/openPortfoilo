package com.nanam.boardController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.boardDB.Board;
import com.nanam.boardDB.BoardDAO;

@WebServlet("/board/showDetail")
public class ShowBoardDetail extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String list=req.getParameter("list");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		
		System.out.println(list);
		System.out.println(subject);
		System.out.println(content);
		
		BoardDAO bControl=null;
		bControl=BoardDAO.getInstance();
		
		Board b=bControl.showDetail(list, subject);
		
		
		req.setAttribute("b", b);
		
		
		
		
		result="/board/showBoardDetail.jsp";
		
		
		req.getRequestDispatcher(result).forward(req, resp);
	
		
			
			
		}

		
	}
	