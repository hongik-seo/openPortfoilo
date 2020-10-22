package com.nanam.boardController;

import java.io.File;
import java.io.FileInputStream;
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


@WebServlet("/board/inputBoard")
public class InputBoard extends HttpServlet {

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
		
		
		Board b=bControl.writeInsert( list, subject, content);
		
		
	
		
		
		
	
		if(b.getList().equals("essay")) {
			
			req.setAttribute("li", b);
			result="/board/essayFront";
		
		
		}else if(b.getList().equals("nanam")) {
			req.setAttribute("li", b);
			result="/board/nanamFront";
			
		}else if(b.getList().equals("notice")) {
			req.setAttribute("li", b);
			result="/board/noticeFront";
		
		}
		
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
			
			
		}

		
	}
	
	
	

