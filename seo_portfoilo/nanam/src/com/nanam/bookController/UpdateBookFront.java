package com.nanam.bookController;

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

import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;

import util.DBManager;


@WebServlet("/book/updateBookFront")
public class UpdateBookFront extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");




		String bookList=req.getParameter("bookList");
		String ISBN=req.getParameter("ISBN");


		BookDAO bkControl=null;
		bkControl=BookDAO.getInstance();

		Book book=bkControl.selectBookDetail(bookList, ISBN);


		
		
		
		req.setAttribute("book", book);
		
		result="/book/updateBook";
		
		
		
		
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
			
			
		}

		
	}
	
	
	

