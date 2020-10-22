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

import com.nanam.boardDB.Board;
import com.nanam.boardDB.BoardDAO;
import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;

import util.DBManager;


@WebServlet("/book/updateBookMain")
public class UpdateBookMain extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		
		String bookTitle=req.getParameter("bookTitle");
		String bookAuthor=req.getParameter("bookAuthor");
		String price=req.getParameter("bookPrice");
		String bookSize=req.getParameter("bookSize");
		String bookPage=req.getParameter("bookPage");
		String bookDate=req.getParameter("bookDate");
		String ISBN=req.getParameter("ISBN");
		String bookContent=req.getParameter("bookContent");
		String bookList=req.getParameter("bookList");		
		String imgName=req.getParameter("file");
		String bookIndex=req.getParameter("bookIndex");
		String bookAuthorIntroduce	= req.getParameter("bookAuthorIntroduce");
		
		
		
		System.out.println(imgName);
		
		String imagePath = getServletContext().getRealPath("")+"images\\"+imgName;

		
		System.out.println("fPath  :"+imagePath);
		
		System.out.println("겟파람"+bookList);
		
		
		
			
		BookDAO bkControl=null;
		bkControl=BookDAO.getInstance();
		
		Book bo=bkControl.updateBook(bookTitle, bookAuthor, price, bookSize, bookPage, bookDate, ISBN, bookContent, bookList, imagePath, imgName, bookIndex, bookAuthorIntroduce);
		
		
		
		req.setAttribute("book", bo);
		
		
	
		result="/book/showBookDetail";
		
		
		
		
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
		
		}

		
	}
	
	
	

