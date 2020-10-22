package com.nanam.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanam.bookController.DeleteBookFront;
import com.nanam.bookController.DeleteBookMain;
import com.nanam.bookController.InputBook;
import com.nanam.bookController.ShowBookDetail;
import com.nanam.bookController.ShowNanamBook;
import com.nanam.bookController.ShowNewBook;
import com.nanam.bookController.ShowSteadyBook;
import com.nanam.bookController.UpdateBookFront;
import com.nanam.bookController.UpdateBookMain;



@WebServlet(urlPatterns= {"/book/deleteBook","/book/updateBook","/book/detailBookFront","/book/nanamBook","/book/newBook","/book/steadyBook","/book/main","/book/inputBookFront","/book/newBookFront","/book/nanamBookFront","/book/steadyBookFront"})
public class BKcontroller extends HttpServlet {

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
		
		
		if(path.equals("/nanam/book/detailBookFront")) {
			
			result="/book/showBookDetail.jsp";
			
		}else if(path.equals("/nanam/book/showBookDetail")) {
			
			ShowBookDetail showBook=new ShowBookDetail();
			showBook.service(req, resp);
			
		}else if(path.equals("/nanam/book/nanamBookFront")) {
			
			
			result="/book/showNanamBook";
			
			
			
					
		}else if(path.equals("/nanam/book/showNananmBook")) {
			
			
			ShowNanamBook showNanam=new ShowNanamBook();
			showNanam.service(req, resp);
			
			
			
		}else if(path.equals("/nanam/book/nanamBook")) {
			
			
			result="/book/nanamOfBookList.jsp";
			
		}else if(path.equals("/nanam/book/steadyBookFront")) {
			
			
			result="/book/showSteadyBook";
			
			
			
					
		}else if(path.equals("/nanam/book/showSteadyBook")) {
			
			
			
			ShowSteadyBook showSteady=new ShowSteadyBook();
			showSteady.service(req, resp);
			
		}else if(path.equals("/nanam/book/steadyBook")) {
			
			
			result="/book/steadySellerList.jsp";
			
		}else if(path.equals("/nanam/book/newBookFront")) {
			
			
			result="/book/showNewBook";
			
			
			
					
		}else if(path.equals("/nanam/book/showNewBook")) {
			
			
			
			ShowNewBook showNew=new ShowNewBook();
			showNew.service(req, resp);
			
		}else if(path.equals("/nanam/book/newBook")) {
			
			
			result="/book/newBookList.jsp";
			
		}else if(path.equals("/nanam/book/inputBookFront")){
			
			
			result="/book/uploadBook.jsp";
			
		}else if(path.equals("/nanam/book/inputBook")) {
			InputBook in=new InputBook();
			in.service(req, resp);
			
			
		}else if(path.equals("/nanam/book/updateBookFront")) {
			
		
			UpdateBookFront uf=new UpdateBookFront();
			uf.service(req, resp);
			
		}else if(path.equals("/nanam/book/updateBook")) {
			
			result="/book/updateBook.jsp";
			
		}else if(path.equals("/nanam/book/updateBookMain")) {
			
			UpdateBookMain up=new UpdateBookMain();
			up.service(req, resp);
			
		}else if(path.equals("/nanam/book/deleteBookFront")) {
			
			DeleteBookFront df=new DeleteBookFront();
			df.service(req, resp);
		
		}else if(path.equals("/nanam/book/deleteBook")) {
			
			result="/book/deleteBook.jsp";
			
		}else if(path.equals("/nanam/book/deleteBookMain")) {
			
			DeleteBookMain de= new DeleteBookMain();
			de.service(req, resp);
			
		}
		
		
		
		
		req.getRequestDispatcher(result).forward(req, resp);
		
		
	}
	
	

}
