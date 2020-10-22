package com.nanam.bookController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;

import util.DBManager;


@WebServlet("/book/showNanamBook")
public class ShowNanamBook extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		
	
		BookDAO bkControl=null;
		bkControl=BookDAO.getInstance();
		ArrayList<Book> nanamBook=bkControl.selectNanamBook();
		req.setAttribute("nanamBook", nanamBook);
		
		
		result="/book/nanamBook";
	
		req.getRequestDispatcher(result).forward(req, resp);
		
		
		
			
			
		}

		
	}
	
	
	

