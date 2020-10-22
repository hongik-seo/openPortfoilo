package com.nanam.bookController;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.boardDB.Board;
import com.nanam.boardDB.BoardDAO;
import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;

@WebServlet("/book/showBookDetail")
public class ShowBookDetail extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String bookList=req.getParameter("bookList");
		
		String ISBN=req.getParameter("ISBN");
				
		System.out.println("디테일 북리스트"+bookList);
		System.out.println("디테일 ISBN"+ISBN);
		
		
		
		BookDAO bkControl=null;
		bkControl=BookDAO.getInstance();
	
		
		Book book=bkControl.selectBookDetail(bookList, ISBN);
		
		
		
		
		req.setAttribute("book",book);
		
		
		result="/book/detailBookFront";
		
		
		req.getRequestDispatcher(result).forward(req, resp);
	
		
			
			
		}

		
	}
	