package com.nanam.boardController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.boardDB.Board;
import com.nanam.boardDB.BoardDAO;

import util.DBManager;


@WebServlet("/board/deleteBoardMain")
public class DeleteBoardMain extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		String qseq=req.getParameter("qseq");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		
		System.out.println("de"+qseq);
		System.out.println("de"+subject);
		System.out.println("de"+content);
		
	
		BoardDAO bControl=null;
		bControl=BoardDAO.getInstance();
		Board b=bControl.delete(qseq, subject, content);
		
	
		req.setAttribute("b", b);
		result="/main/index.jsp";
		
		
		
		
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
			
			
		}

		
	}
	
	
	

