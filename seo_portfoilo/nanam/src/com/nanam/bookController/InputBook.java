package com.nanam.bookController;


import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.attribute.FileAttribute;
import java.util.ArrayList;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.nanam.bookDB.Book;
import com.nanam.bookDB.BookDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/book/inputBook")
public class InputBook extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String result;


	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");

		
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
		bkControl= BookDAO.getInstance();
		
		Book bo=bkControl.InsertBook(bookTitle, bookAuthor, price, bookSize, bookPage, bookDate, ISBN, bookContent, bookList,imagePath,imgName,bookIndex,bookAuthorIntroduce);
		
		
		

		
		
		if(bookList.equals("hot")) {
			
			req.setAttribute("book", bo);
			result="/book/newBookFront";
			
		}else if(bookList.equals("nBook")) {
			
			req.setAttribute("book", bo);
			result="/book/nanamBookFront";
			
		}else if(bookList.equals("steady")) {
			
			req.setAttribute("book", bo);
			result="/book/steadyBookFront";
			
		}


		req.getRequestDispatcher(result).forward(req, resp);


	}
	
}
	
	
	

